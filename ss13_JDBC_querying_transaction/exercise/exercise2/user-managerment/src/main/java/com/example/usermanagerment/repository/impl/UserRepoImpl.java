package com.example.usermanagerment.repository.impl;

import com.example.usermanagerment.model.User;
import com.example.usermanagerment.repository.BaseRepository;
import com.example.usermanagerment.repository.IUserRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepoImpl implements IUserRepo {
    private final static String SELECT = "SELECT * FROM users ORDER BY `name`;";
    private final static String SELECT_BY_COUNTRY = "SELECT * FROM users WHERE country = ?;";
    private final static String INSERT = "insert into users(name, email, country) values(?,?,?);";
    private final static String FINDBYID = "SELECT * FROM users WHERE id = ?;";
    private final static String UPDATE = "UPDATE users SET name = ?, email = ?, country= ? WHERE id = ?;";
    private final static String DELETE = "DELETE FROM users WHERE id = ?;";
    private final static String GET_USER_BY_ID = "{CALL get_user_by_id(?)}";
    private final static String INSERT_USER = "{CALL insert_user(?,?,?)}";
    private final static String SELECT_SP = "CALL display_list_user();";
    private final static String UPDATE_SP = "CALL edit_user(?,?,?,?);";
    private final static String DELETE_SP = "CALL delete_user(?);";
    private static final String SQL_PIVOT = "INSERT INTO user_permision(user_id, permision_id) VALUES(?,?)";


    @Override
    public List<User> selectAllUsers() {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        User user;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
                userList.add(user);
            }
            resultSet.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return userList;
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FINDBYID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = new User(resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("country"));
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public void insertUser(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public boolean deleteUser(int id) {
        if (selectUser(id) == null) {
            return false;
        }
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return true;
    }

    @Override
    public boolean updateUser(User user) {
        if (selectUser(user.getId()) == null) {
            return false;
        }
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
    }

    @Override
    public List<User> findByCountry(String country) {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        User user;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_COUNTRY);
            preparedStatement.setString(1,country);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String countryFind = resultSet.getString("country");
                user = new User(id,name,email,countryFind);
                userList.add(user);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return userList;
    }

    @Override
    public User getUserByIdSp(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(GET_USER_BY_ID);
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();
            if (resultSet.next()) {
                user = new User(resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("country"));
            }
            resultSet.close();
            callableStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public void insertUserStoreSp(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(INSERT_USER);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void addUserTransaction(User user, List<Integer> permission) {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        PreparedStatement prAssignment = null;
        ResultSet resultSet = null;
        try {
            connection.setAutoCommit(false);

            preparedStatement = connection.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            int rowAffected = preparedStatement.executeUpdate();

            resultSet = preparedStatement.getGeneratedKeys();

            int userId = 0;
            if (resultSet.next()) {
                userId = resultSet.getInt(1);
            }

            if (rowAffected == 1) {
                prAssignment = connection.prepareStatement(SQL_PIVOT);

                for (int permissionId : permission) {
                    prAssignment.setInt(1, userId);
                    prAssignment.setInt(2, permissionId);
                    prAssignment.executeUpdate();
                }
                connection.commit();
            } else {
                connection.rollback();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());;
            }
            System.out.println(e.getMessage());
        }  finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (prAssignment != null) prAssignment.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }

    }

    @Override
    public List<User> displayListUserSp() {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        User user;
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_SP);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
                userList.add(user);
            }
            resultSet.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return userList;
    }

    @Override
    public boolean deleteUserSp(int id) {
        if (selectUser(id) == null) {
            return false;
        }
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_SP);
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return true;
    }

    @Override
    public boolean updateUserSp(User user) {
        if (selectUser(user.getId()) == null) {
            return false;
        }
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_SP);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.setInt(4, user.getId());
            callableStatement.executeUpdate();
            callableStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return true;
    }
}

package daoImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import connection.DBconnectMySQL;
import dao.GenericDao;
import mapper.RowMapper;

public class AbstractDao<T> implements GenericDao<T> {

	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	@Override
	public <T> List<T> query(String sql, RowMapper<T> RowMapper, Object... parameters) {
		List<T> results = new ArrayList<>();
		try {
			new DBconnectMySQL();
			conn = DBconnectMySQL.getConnection();
			ps = conn.prepareStatement(sql);
			// set parameter()
			setParameter(ps, parameters);
			rs = ps.executeQuery(); // thực thi câu sql
			while (rs.next()) {
				results.add(RowMapper.mapRow(rs));
			}
			return results;
		} catch (Exception e) {
			return null;
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				return null;
			}
		}
	}

	private void setParameter(PreparedStatement statement, Object... parameters) {
		try {
			for (int i = 0; i < parameters.length; i++) {
				Object parameter = parameters[i];
				int index = i + 1;
				if (parameter instanceof Long) {
					statement.setLong(index, (Long) parameter);
				} else if (parameter instanceof String) {
					statement.setString(index, (String) parameter);
				} else if (parameter instanceof Integer) {
					statement.setInt(index, (Integer) parameter);
				} else if (parameter instanceof Timestamp) {
					statement.setTimestamp(index, (Timestamp) parameter);
				}else if (parameter instanceof Double) {
					statement.setDouble(index, (Double) parameter);
				}else if (parameter instanceof Date) {
					statement.setDate(index, (Date) parameter);
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(String sql, Object... patameters) { // sửa và xóa
		try {
			new DBconnectMySQL();
			conn = DBconnectMySQL.getConnection();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			setParameter(ps, patameters);
			ps.executeUpdate();// thực hiện thao tác trên dữ liệu(thêm,xóa,sửa)
			conn.commit();
		} catch (Exception e) {
			if (conn != null) {
				try {
					conn.rollback(); // thất bại thì rollback
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	@Override
	public Long insert(String sql, Object... patameters) { // thêm
		Long id = null;
		try {
			new DBconnectMySQL();
			conn = DBconnectMySQL.getConnection();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			setParameter(ps, patameters);
			ps.executeUpdate();// thực hiện thao tác trên dữ liệu(thêm,xóa,sửa)
			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				id = rs.getLong(1); // lấy ra khóa mới nhất vừa được thêm
			}
			conn.commit();
			return id;
		} catch (Exception e) {
			if (conn != null) {
				try {
					conn.rollback(); // thất bại thì rollback
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public int count(String sql, Object... patameters) {
		try {
			int count = 0;
			new DBconnectMySQL();
			conn = DBconnectMySQL.getConnection();
			ps = conn.prepareStatement(sql);
			// set parameter()
			setParameter(ps, patameters);
			rs = ps.executeQuery(); // thực thi câu sql
			while (rs.next()) {
				count = rs.getInt(1); // 1 là vi tri dau tien
			}
			return count;
		} catch (Exception e) {
			return 0;
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				return 0;
			}
		}
	}

	@Override
	public double getPrice(String sql, Object... patameters) {
		try {
			double price = 0;
			new DBconnectMySQL();
			conn = DBconnectMySQL.getConnection();
			ps = conn.prepareStatement(sql);
			// set parameter()
			setParameter(ps, patameters);
			rs = ps.executeQuery(); // thực thi câu sql
			while (rs.next()) {
				price = rs.getDouble(1); // 1 là vi tri dau tien
			}
			return price;
		} catch (Exception e) {
			return 0;
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				return 0;
			}
		}
	}
}
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * A class used as the interface to the theatre database using JDBC.
 * @author Brandon Quan, 
 *
 */
public class TheatreService{
	
	private final String DBURL;
	private final String USERNAME;
	private final String PASSWORD;
	
	private Connection dbConnect;
	private ResultSet results;
	
	public TheatreService(String url, String username, String password) {
		this.DBURL = url;
		this.USERNAME = username;
		this.PASSWORD = password;	
	}
	
	/**
	 * Used to initialize the connection to the database.
	 */
	public void initializeConnection() {
		try {
			dbConnect = DriverManager.getConnection(this.DBURL, this.USERNAME, this.PASSWORD);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * A prepared query used to return the two most recent news items from the database.
	 * @return recentNews, an ArrayList of two movie news items.
	 */
	public ArrayList<MovieNews> getMovieNews() {
		
		// Creates an array list.
		ArrayList<MovieNews> recentNews = new ArrayList<MovieNews>();
		
		try {
			// Selects two most recent news items.
			String query = "SELECT * FROM NEW_MOVIE ORDER BY DatePosted DESC LIMIT 2";
			
			PreparedStatement myStmt = dbConnect.prepareStatement(query);
			
			results = myStmt.executeQuery();
			
			// Populates the array list with the news items.
			while(results.next()) {
				MovieNews newMovie = new MovieNews();
				newMovie.setNewMovieName(results.getString("NewMovieName"));
				newMovie.setNews(results.getString("News"));
				recentNews.add(newMovie);
			}
			
			myStmt.close();
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		
		return recentNews;
	}
	
	public void close() {
        try {
            results.close();
            dbConnect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
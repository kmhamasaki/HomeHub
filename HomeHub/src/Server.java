

import java.io.IOException;
import java.util.HashMap;
import java.util.Vector;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/Server")
public class Server {
	private static HashMap<Session, String> sessionHousehold = new HashMap<Session, String>();
	private static HashMap<String, Vector<Session>> householdVector = new HashMap<String, Vector<Session>>();
	
	@OnOpen
	public void open(Session session) {
		System.out.println("Connecting to server");
	}
	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println("OnMessage called");
		
		//Message format: "fullname,household,type,message"
		//message = "taskName-status"
		if(!message.equals("") && message != null) {
			String[] wholeMessage = message.split(",");
			String name = wholeMessage[0];
			String household = wholeMessage[1];
			String type = wholeMessage[2];
			String messageContent = wholeMessage[3];
			
			//Called when a new session joins
			if(type.equals("register")) {
				sessionHousehold.put(session, household);
				if(!householdVector.containsKey(household)) {
					Vector<Session> house = new Vector<Session>();
					householdVector.put(household, house);
				}
				householdVector.get(household).add(session);
				System.out.println("Register");
			}
			
			//Called when a user updates with drag/drop
			else if(type.equals("update")) {
				Vector<Session> currHouse = householdVector.get(household);
				String messageStuff[] = messageContent.split("-");
				String task = messageStuff[0];
				String status = messageStuff[1];
				String newMessage = "Task " + task + " was just " + status + " by " + name;
				for(Session s: currHouse) {
					try {
						s.getBasicRemote().sendText(newMessage);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	@OnClose
	public void close(Session session) {
		String house = sessionHousehold.get(session);
		System.out.println("house: " + house);
		sessionHousehold.remove(session);
		householdVector.get(house).remove(session);
	}
	
	
}
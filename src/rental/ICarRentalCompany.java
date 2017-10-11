package rental;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.Date;
import java.util.List;
import java.util.Set;

public interface ICarRentalCompany extends Remote{
	public String Foo() throws RemoteException;

	public Set<CarType> getAvailableCarTypes(Date start, Date end) throws RemoteException;

	public int getNumberOfReservations(String carType) throws RemoteException;

	public List<Reservation> getReservationsByRenter(String clientName) throws RemoteException;

	public Reservation confirmQuote(Quote quote)throws RemoteException, ReservationException;

	public Quote createQuote(String clientName, Date start, Date end, String carType, String region)throws RemoteException, ReservationException;

}

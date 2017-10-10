package rental;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.Date;
import java.util.Set;

public interface ICarRentalCompany extends Remote{
	public String Foo() throws RemoteException;

	public Set<CarType> getAvailableCarTypes(Date start, Date end) throws RemoteException;

}

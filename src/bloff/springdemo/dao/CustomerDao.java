package bloff.springdemo.dao;

import java.util.List;

import bloff.springdemo.entity.Customer;


public interface CustomerDao {

	public List<Customer> getCustomers();
	
	public void saveCustomer(Customer theCustomer);

	public Customer getCustomer(int id);

	public void deleteCustomer(int id);
}

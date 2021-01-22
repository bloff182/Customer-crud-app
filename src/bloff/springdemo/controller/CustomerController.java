package bloff.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bloff.springdemo.entity.Customer;
import bloff.springdemo.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	// inject customer service
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/list")
	public String list(Model theModel) {
		
		// get list of customers
		List<Customer> customers = customerService.getCustomers();

		// add customers to the model
		theModel.addAttribute("customers", customers);
		
		return "list-customer";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		
		// create customer object
		Customer theCustomer = new Customer();
		
		theModel.addAttribute("customer", theCustomer);
		
		return "customer-form";
	}
	
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer")Customer theCustomer) {
		
		customerService.saveCustomer(theCustomer);
		
		return "redirect:/customer/list";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormUpdate(@RequestParam("customerId") int id, Model theModel) {
		
		// get customer from db
		Customer theCustomer = customerService.getCustomer(id);
		
		// set the client as the model attribute - pre-populate form
		theModel.addAttribute("customer", theCustomer);
		
		// sent data to the view
		return "customer-form";
	}
	
	@GetMapping("/showFormForDelete")
	public String showFormForDelete(@RequestParam("customerId")int id) {
		
		customerService.deleteCustomer(id);
		
		return "redirect:/customer/list";
	}
}

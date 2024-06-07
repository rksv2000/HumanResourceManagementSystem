package hrms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeRepository er;

    @GetMapping("/")
    public String viewEmployee(@RequestParam(defaultValue = "0") int page,@RequestParam(defaultValue = "3") int size,Model model) {
	    Pageable pageable = PageRequest.of(page, size);
	    Page<Employee> employeePage = er.findAll(pageable);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", employeePage.getTotalPages());
	    model.addAttribute("totalItems", employeePage.getTotalElements());
	    model.addAttribute("listEmployees", employeePage.getContent());
        return "index";
    }

    @GetMapping("/addEmployee")
    public String showEmployee(Model model) {
        model.addAttribute("employee", new Employee());
        return "new_employee";
    }

    @PostMapping("/saveEmployee")
    public String saveEmployee(@ModelAttribute("employee") Employee employee) {
        er.save(employee);
        return "redirect:/";
    }

    @GetMapping("/updateEmployee/{id}")
    public String updateEmployee(@PathVariable(value="id") int id, Model model) {
        Employee employee = er.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid Employee ID: "+id));
        model.addAttribute(employee);
        return "update_employee";
    }

    @GetMapping("/deleteEmployee/{id}")
    public String deleteEmployee(@PathVariable(value="id") int id) {
        Employee employee = er.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid Employee ID: "+id));
        er.delete(employee);
        return "redirect:/";
    }
}

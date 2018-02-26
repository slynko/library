package ua.khai.slynko.library.web.command.admin;

import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import ua.khai.slynko.library.Path;
import ua.khai.slynko.library.db.DBManager;
import ua.khai.slynko.library.db.Role;
import ua.khai.slynko.library.db.entity.User;
import ua.khai.slynko.library.exception.AppException;
import ua.khai.slynko.library.exception.DBException;
import ua.khai.slynko.library.web.abstractCommand.Command;

/**
 * Lists librarians.
 * 
 * @author O.Slynko
 * 
 */
public class ListLibrariansCommand extends Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws AppException {
		HttpSession session = request.getSession();
		String address = Path.PAGE_LIST_USERS;
		String userId = request.getParameter("userId");
		if (userId != null) {
			DBManager.getInstance().removeUserById(Long.parseLong(userId));
			session.setAttribute("librarianDeleteIsSuccessful", true);
			request.setAttribute("sendRedirect", true);
			session.setAttribute("redirectPage", Path.COMMAND_LIST_LIBRARIANS);
			address = Path.PAGE_HOME_REDERECT;
		} else {
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			List<User> listLibrarians = getListLibrarians(firstName, lastName);

			if (listLibrarians == null || listLibrarians.size() == 0) {
				request.setAttribute("noMatchesFound", true);
			} else {
				listLibrarians.sort(Comparator.comparing(User::getLastName));

				session.setAttribute("listUsers", listLibrarians);
			}
		}
		return address;
	}

	private List<User> getListLibrarians(String firstName, String lastName) throws DBException {
		DBManager dbManager = DBManager.getInstance();
		List<User> catalogItems = null;
		Integer roleId = Role.LIBRARIAN.getValue();
		if (StringUtils.isEmpty(firstName) && StringUtils.isEmpty(lastName)) {
			catalogItems = dbManager.findUsersByRole(roleId);
		} else if (StringUtils.isEmpty(firstName) && !StringUtils.isEmpty(lastName)) {
			catalogItems = dbManager.findUsersByRoleAndLastName(roleId, lastName);
		} else if (!StringUtils.isEmpty(firstName) && StringUtils.isEmpty(lastName)) {
			catalogItems = dbManager.findUsersByRoleAndFirstName(roleId, firstName);
		} else if (!StringUtils.isEmpty(firstName) && !StringUtils.isEmpty(lastName)) {
			catalogItems = dbManager.findUsersByRoleAndFirstNameAndLastName(roleId, firstName, lastName);
		}
		return catalogItems;
	}
}
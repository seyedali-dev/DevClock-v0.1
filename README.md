# DevClock-v0.1

A time tracking web application using java/spring boot.

Tech stacks used:

- Spring boot
- Security = Keycloak
- Microservices
- Kafka
- Redis
- Docker
- GitHub Actions
- WebFlux

### The services pushed in GitHub
1. [Discovery-Server](https://github.com/seyedali-dev/DevVault-v2.0_DiscoveryServer)
2. [ApiGateway-Service](https://github.com/seyedali-dev/DevClock-v0.1_ApiGateway)
3. [Authentication-Service](https://github.com/seyedali-dev/DevClock-v0.1_AuthService)
4. [TimeEntry-Service](https://github.com/seyedali-dev/DevClock-v0.1_TimeEntryService)
5. [Project-Service](https://github.com/seyedali-dev/DevClock-v0.1_ProjectService)
6. [Task-Service](https://github.com/seyedali-dev/DevClock-v0.1_TaskService)
7. [Report-Service](https://github.com/seyedali-dev/DevClock-v0.1_ReportService)


The project will have these functionalities:

> Note 💡: Wherever you see this sign "<kbd>$</kbd>" before a point, that means that functionality or feature is to be implemented in the next version of the application.

1. Registration/Login (Keycloak)

2. Time Tracker

    - Manually:

      User can enter time manually, based on whatever he wants like; he can enter:

        - `start time` & `end time` = the total time will be calculated automatically.

        - `duration` = can enter the whole duration himself (like 3 hours etc...).

    - Using Button:

      User can click a button (in our case, an endpoint), and the time tracking will start and continue until he stops it.

    - Continue Tracking

      User can continue the last stopped time. Like; if the last stopped time was 2 hours in duration, he can continue from that point on.

    - Billable

      User's time entry, can be billable or not. It is an option for the user to decide. If it is billable, then that time entry (which is of a project and a task), will have hourly, or a specific time per rate. It's on the use to decide that.

   > Note 💡🧐:
   >
   > A time entry (the time that the user has started or manually entered), must have a project involved. That project, can have tasks, description, name, etc... but that is not mandatory. The project must be present and involved. Otherwise, we should tell the user to specify a project.
   >
   >
   >
   > If the user does not want to specify a project and wants to just record the time, he can but there should be an option like: `non-something` where 'something' will be decided later on.

3. Time Sheet

    - Log time in Time Sheet

        - User can log the time in a week, in a time sheet.
        - He can save that time sheet as template, and apply that in another week or month too.

    - See events from Google & Outlook

      User can import google's & outlook's events, in his account.

4. Projects

    - Define Tasks

        - User can enter tasks for a project, as much as he wants.
        - He can reorder the tasks.
        - <kbd>$</kbd> When the use creates a task, if that project has members in it (team members), using `Kafka`, a notification will be sent to the members, with the created tasks information + some other information like the project, description, members, leader(s), etc...

    - <kbd>$</kbd> Manage Access

      This is for when the project has members and is not personal. The user can assign roles to members; this makes our application like a project management tool.

    - Define Estimate & Budget

      The budget is like while creating the project (or even later on), user can enter an overall budget for that project. Like that project has $3000 budget.

      I don't know about estimate yet. Will think about it later on.

    - <kbd>$</kbd> Check Progress

      This feature is for both when the project has members, or it doesn't. The user can see the progress of the project. This feature needs more thinking, and I think, we can use `Kafka` here.

5. Reports

    - Break Time by any Dimension - Filter

      A user can see his time tracked report based on filters that he'll provide. The filter can be by:

        - <kbd>$</kbd> Users; meaning when there are members, he can see the time tracked of that user in all the projects.
        - Project; meaning can filter the time tracked by project.
        - Task; same as project.
        - Date(s); meaning time tracked can be filtered for a specified date(s).
        - Month, Week, Yesterday, Today; the names are self explanatory.

    - <kbd>$</kbd> Filter Data

      This feature needs more thought and will be implemented later on.

    - Export

      PDF, CSV, EXCEL

      The user can export the time tracked, based on the filter feature provided above.

    - Share Links with Others

      The user can share his report of time tracked with others. This report will be only readable and no modifying is allowed.

6. Invoicing

    - Create Invoice

      User can create invoice for:

        -  A specific project; all the tasks, time tracked, <kbd>$</kbd> members, etc...
        - <kbd>$</kbd> A specific User; invoice of a user for a specific project, time tracked, tasks worked on, bills, etc...

    - Import Time & Expenses

      This feature is basically a second step of 👆🏻; basically, invoice can have time tracked, or can be only project and the total bills and stuff. Needs more thought.

    - Report - Download & Send

      After the invoice is created, a report (invoice basically) will be created which can be downloaded, and or sent to a user using email.

    - Customize Invoices

      Can customize the type of invoice like, what body to have, what title, etc...

7. <kbd>$</kbd> Team

    - Invite Team

      User can invite teams using email. Needs more thought.

    - Set Hourly Rate

      User can set hourly rate, which will be applied to the time tracking feature, and this will be only applicable if that time entry (of the project and task) is billable enabled.

    - Manage Permissions

      This is basically same as `Projects#ManageAccess`. Needs more thought. Maybe there's no need for extra functionality since it is the same. Maybe.

8. <kbd>$</kbd> Kiosk

   This feature is like a system for companies, where employees, clock-in and clock-out of the company. This is like taking attendance records of team members.

9. <kbd>$</kbd> Dashboard

    - Visualize Where Team Goes

      Needs more thought. Don't have ANY idea what to build of this.

    - See Team Activity

      Same as the above.

10. <kbd>$</kbd> Scheduling

    - Visualize Project

      No idea.

    - Give Assignment

      A user (a user that has roles assigned to him also) can give out assignments to other users on a specific date, or for a specific time.

    - See Who's Available

      We can see the vacancy of other members. This will help us to organize the project and assign new tasks to members.

11. <kbd>$</kbd> Time Off

    - Request & Approve Time Off

      A member or user, can request for a time off with the description, for a specific: date, date & time, or for a specific time.

    - See Upcoming Absences

      A user (leader or the above hierarchy role), can see for the upcoming dates, which member is available, and or which member is in a time off mode.

12. <kbd>$</kbd> Members Activity

    - See Current Location

      We can add member's home location.

    - View Daily Routes

      User can enter their daily routes to office or where they work.

---
<kbd>$</kbd>
- call and audio
- inactivity of screen time (recording the ide itself), idle time stopping

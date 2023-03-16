# Homey Take Home Tech Task

I spent a little over the three hours - mainly becuase I didn't factor
in the time to get the app hosted when making some early decisions.

For the most part I have treated this like a real piece of work - I followed
TDD and tried to make the code readable and production ready, but the time
limit obviously meant that was not always the case. The most obvious is the
authentication, followed by the fact that the status changes are recorded as
comments with the only differentiator being the user ID, which won't scale
as a solution. On a real app, I would also spend a lot more time on the design.

## Questions

Here are the questions I would have asked and the answers
I assumed I would have got.

1. Q: How should the user register/login?
  A: Let's just stick to simple username and password for now,
  with no email intergration.

2. Q: Who should have access to projects; who can create, edit, delete them?
  A: For simplicity, let's say user can create a project, and there's no rules
  for who can then modify those projects.

3. Q: What is a project? What fields does it have?
  A: Projects simply have a name and a status, and associated comments.

4. Q: What is status, is it an enum or a simple free text entry.
  A: Let's start with free text entry and see how we will get on.

5. Q: Similar to projects, who should be allowed to comment on projects?
  Can comments be edited or deleted?
  A: Let's say no for now - comments are fire and forget - like text messages.

6. Q: Should the history of the status changes be interspersed with the comments?
  A: Yes.

# Homey Take Home Tech Task

## Questions

Here I will record all of the questions and assumed answers I have thought of
while building this tech task.

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

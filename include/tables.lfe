(defrecord employee
  id
  name
  salary
  gender
  phone
  room-number)

(defrecord department
  id
  name)

(defrecord project
  name
  number)

(defrecord manager
  employee-id
  department-id)

(defrecord in-department
  employee-id
  department-id)

(defrecord in-project
  employee-id
  project-name)
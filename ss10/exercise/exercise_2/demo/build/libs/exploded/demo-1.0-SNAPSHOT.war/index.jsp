<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Calculator</title>
</head>
<style>
  table {
    border: 1px solid rgba(18,9,9,0.87);
    border-collapse: collapse;
    border-radius: 2%;
    box-shadow: 2px 3px 3px 4px rgba(47,29,114,0.87);
  }
  #submit:hover {
    scale: 1.03;
    background-color: rgba(240,66,68,0.87);
    color: rgba(233,223,240,0.87);
  }
</style>
<body>
<h1>Simple Calculator</h1>
<form action="calculator.jsp" method="post">
  <table>
    <thead>
    <tr>
      <th colspan="2">Calculator</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>First Operator: </td>
      <td><input type="number" name="first" placeholder="First Operator"/></td>
    </tr>
    <tr>
      <td>Operator</td>
      <td><select name="operator" id="operator">
        <option value="minus">Minus</option>
        <option value="plus">Plus</option>
        <option value="divide">Divide</option>
        <option value="multi">Multi</option>
      </select>
      </td>
    </tr>
    <tr>
      <td>Second Operator: </td>
      <td><input type="number" name="second" placeholder="Second Operator"/></td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" id="submit" value="Calculator"></td>
    </tr>
    </tbody>
  </table>
</form>
</body>
</html>
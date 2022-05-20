<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="aspAkbarsWebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>@ViewData["Title"] - akbarsAsp</title>
    <!-- Только CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="Content/Site.css" />
</head>
<body>
    <asp:UpdatePanel ID="panel1" runat="server">
        <ContentTemplate>
    <div class="text-center d-flex flex-column align-items-center">
        <h1 class="display-4">Конвертер</h1>
        <p>Введите данные сотрудника</p>
        <form class="form-group" id="form">
            <div class="main-form form-group">
                <div class="mb-3 justify-content-center">
                    <input ID="nameInput" class="form__input form-control mb-3" placeholder="Введите имя"></input>
                    <p class="nameValidation"></p>
                </div>
                <div class="mb-3 justify-content-center">
                    <input ID="surnameInput" class="form__input form-control mb-3" placeholder="Введите фамилию"></input>
                    <p class="surnameValidation"></p>
                </div>
                <div class="mb-3 justify-content-center">
                    <input ID="emailInput" class="form__input form-control mb-3" placeholder="Введите e-mail"></input>
                    <p class="emailValidation"></p>
                </div>
                <div class="mb-3 justify-content-center">
                     <input ID="passwordInput" class="form__input form-control mb-3" value="akbars" placeholder="Введите пароль"></input>
                </div>

                <button class="btn btn-outline-primary add-record mb-3" id="Button1" onclick="createRow(); return false;">
                    Добавить запись
                </button>
                    
                <br />
                <asp:label CssClass="mb-3" id="Message" runat="server" />
                </div>
                <button ID="saveInXlsx" class="selectDirectoryBtn btn btn-outline-dark mb-3" onclick="saveInExcel(); return false;">Сохранить в формате .xlsx</button>
                <button ID="saveInCsv" class="selectDirectoryBtn btn btn-outline-dark mb-3" onclick="tableToCSV(); return false;">Сохранить в формате .csv</button>
                <table class="table" id="excel-table">
            <tr>
              <td class="new-excel-data">id</td>
              <td class="new-excel-data">email</td>
              <td class="new-excel-data">lname</td>
              <td class="new-excel-data">fname</td>
                <td class="new-excel-data">mname</td>
                <td class="new-excel-data">gender</td>
                <td class="new-excel-data">city</td>
                <td class="new-excel-data">phone</td>
                <td class="new-excel-data">position</td>
                <td class="new-excel-data">manager_</td>
                <td class="new-excel-data">login</td>
                <td class="new-excel-data">password</td>
                <td class="new-excel-data">my_field</td>
            </tr>
            </table>
            </div>
        </form>
        
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <script defer>
        let table = document.getElementById('excel-table');
        const createRow = () => {
            let nameValue = document.getElementById('nameInput').value;
            let surnameValue = document.getElementById('surnameInput').value;
            let emailValue = document.getElementById('emailInput').value;
            let passwordValue = document.getElementById('passwordInput').value;
            let nameValidation = document.querySelector('.nameValidation');
            let surnameValidation = document.querySelector('.surnameValidation');
            let emailValidation = document.querySelector('.emailValidation');
            let flag = 1;
            if (nameValue.length < 2) {
                flag = 0;
                nameValidation.textContent = 'Имя должно содержать минимум 2 символа';
            }
            if (nameValue.length > 40) {
                flag = 0;
                nameValidation.textContent = 'Имя должно содержать не более 40 символов';
            }
            if (surnameValue.length < 2) {
                flag = 0;
                surnameValidation.textContent = 'Фамилия должна содержать минимум 2 символа';
            }
            if (surnameValue.length > 40) {
                flag = 0;
                surnameValidation.textContent = 'Фамилия должна содержать не более 40 символов';
            }
            if (emailValue.length < 3) {
                emailValidation.textContent = 'E-mail должнен содержать минимум 3 символа';
                flag = 0;
            }
            if (emailValue.indexOf('@') == -1 || emailValue.indexOf('.') == -1) {
                flag = 0;
                emailValidation.textContent = 'E-mail должнен соответствовать формату example@gmail.com';
            }
            if (flag === 1) {
                let tableRow = document.createElement('tr');
                let idCell = document.createElement('td');
                let mnameCell = document.createElement('td');
                let genderCell = document.createElement('td');
                let cityCell = document.createElement('td');
                let phoneCell = document.createElement('td');
                let loginCell = document.createElement('td');
                let positionCell = document.createElement('td');
                let managerCell = document.createElement('td');
                let tableData = document.createElement('td');
                let nameCell = document.createElement('td');
                let surnameCell = document.createElement('td');
                let emailCell = document.createElement('td');
                let passwordCell = document.createElement('td');
                let myfieldCell = document.createElement('td');
                idCell.classList.add("new-excel-data");
                mnameCell.classList.add("new-excel-data");
                genderCell.classList.add("new-excel-data");
                cityCell.classList.add("new-excel-data");
                phoneCell.classList.add("new-excel-data");
                loginCell.classList.add("new-excel-data");
                positionCell.classList.add("new-excel-data");
                managerCell.classList.add("new-excel-data");
                nameCell.classList.add("new-excel-data");
                surnameCell.classList.add("new-excel-data");
                emailCell.classList.add("new-excel-data");
                passwordCell.classList.add("new-excel-data");
                myfieldCell.classList.add("new-excel-data");
                tableData.classList.add('new-data');
                tableRow.classList.add('new-row');
                tableRow.appendChild(idCell);
                nameCell.textContent = nameValue;
                surnameCell.textContent = surnameValue;
                emailCell.textContent = emailValue;
                passwordCell.textContent = passwordValue;
                tableRow.appendChild(emailCell);
                tableRow.appendChild(surnameCell);
                tableRow.appendChild(nameCell);
                tableRow.appendChild(mnameCell);
                tableRow.appendChild(genderCell);
                tableRow.appendChild(cityCell);
                tableRow.appendChild(phoneCell);
                tableRow.appendChild(positionCell);
                tableRow.appendChild(managerCell);
                tableRow.appendChild(loginCell);
                tableRow.appendChild(passwordCell);
                tableRow.appendChild(myfieldCell);
                table.appendChild(tableRow);
            }
        }
        const saveInExcel = () => {
            TableToExcel.convert(document.getElementById("excel-table"), {
                name: "akbarsTabletoXLSX.xlsx",
                sheet: {
                    name: "Sheet 1"
                }
            });
        }
        const downloadCSVFile = (csv_data) => {
            CSVFile = new Blob([csv_data], {
                type: "text/csv"
            });
            var temp_link = document.createElement('a');
            temp_link.download = "akbarsTabletoCSV.csv";
            var url = window.URL.createObjectURL(CSVFile);
            temp_link.href = url;
            temp_link.style.display = "none";
            document.body.appendChild(temp_link);
            temp_link.click();
            document.body.removeChild(temp_link);
        }
        const tableToCSV = () => {
            var csv_data = [];
            var rows = document.getElementsByTagName('tr');
            for (var i = 0; i < rows.length; i++) {
                var cols = rows[i].querySelectorAll('td,th');
                var csvrow = [];
                for (var j = 0; j < cols.length; j++) {
                    csvrow.push(cols[j].innerHTML);
                }
                csv_data.push(csvrow.join(";"));
            }
            csv_data = csv_data.join('\n');
            downloadCSVFile(csv_data);
        }
    </script>
    <script src="https://unpkg.com/just-validate@latest/dist/just-validate.production.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/linways/table-to-excel@v1.0.4/dist/tableToExcel.js"></script>
</body>
</html>

</asp:Content>

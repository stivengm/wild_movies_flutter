
class DateProviders {

  String convertDate(String date) {
    List months = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre'
    ];
    var someDateTime = DateTime.parse(date).toLocal();
    var year = someDateTime.year;
    var month = someDateTime.month;
    var day = someDateTime.day;
    return "${day.toString()} de ${months[month - 1]} ${year.toString()}";
  }

}
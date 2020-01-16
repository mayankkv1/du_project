@extends('admin.layouts.master')

@section('content')
<script type="text/javascript">
window.onload = function() {

// var options = {
// 	title: {
// 		text: "Website Traffic Source"
// 	},
// 	data: [{
// 			type: "pie",
// 			startAngle: 45,
// 			showInLegend: "true",
// 			legendText: "{label}",
// 			indexLabel: "{label} ({y})",
// 			yValueFormatString:"#,##0.#"%"",
// 			dataPoints: [
// 				{ label: "Organic", y: 36 },
// 				{ label: "Email Marketing", y: 31 },
// 				{ label: "Referrals", y: 7 },
// 				{ label: "Twitter", y: 7 },
// 				{ label: "Facebook", y: 6 },
// 				{ label: "Google", y: 10 },
// 				{ label: "Others", y: 3 }
// 			]
// 	}]
// };

var coursesOptions = {
	title: {
		text: "Courses"
	},
	data: [{
			type: "pie",
			startAngle: 45,
			showInLegend: "true",
			legendText: "{label}",
			indexLabel: "{label} ({y})",
			yValueFormatString:"#,##0.#"%"",
			dataPoints: [
				@foreach($courseGraphData as $row)
					{ label: "{{$row->name}}", y: "{{$row->totalStudents}}" },
				@endforeach
			]
	}]
};

$("#chartContainer").CanvasJSChart(coursesOptions);

var collegesOptions = {
	title: {
		text: "Colleges"
	},
	data: [{
			type: "pie",
			startAngle: 45,
			showInLegend: "true",
			legendText: "{label}",
			indexLabel: "{label} ({y})",
			yValueFormatString:"#,##0.#"%"",
			dataPoints: [
				@foreach($collegeGraphData as $row)
					{ label: "{{$row->name}}", y: "{{$row->totalCourses}}" },
				@endforeach
			]
	}]
};

$("#chartContainer2").CanvasJSChart(collegesOptions);

}
</script>
<div class="row">
	<div class="col-sm-6">
		<div id="chartContainer" style="height: 300px; width: 100%;"></div>
	</div>
	<div class="col-sm-6">
		<div id="chartContainer2" style="height: 300px; width: 100%;"></div>
	</div>
</div>

@endsection

@section('javascript')
    <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>  
    <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

    <script>
        $(document).ready(function () {
        });
    </script>
@stop
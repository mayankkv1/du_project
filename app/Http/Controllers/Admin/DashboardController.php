<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Students;
use App\StudentGroups;
use App\MainGroups;
use DB;

class DashboardController extends Controller
{
    /**
     * Show QuickAdmin dashboard page
     *
     * @return Response
     */
    public function index()
    {
        $students = Students::with("studentgroups")->get();
        $studentsCount = Students::count();
        // dd($studentsCount);

        $courseGraphData = StudentGroups::leftJoin('students','students.studentgroups_id','=','studentgroups.id')->select('studentgroups.name', DB::raw('count(studentgroups.id) as totalStudents'))->groupBy('studentgroups.id')->get();
        // $courseGraphData = StudentGroups::with('students')->select('studentgroups.name', DB::raw('count(studentgroups.id) as totalStudents'))->groupBy('studentgroups.id')->get();

        // dd($courseGraphData->toArray());

        $collegeGraphData = MainGroups::leftJoin('studentgroups','studentgroups.maingroups_id','=','maingroups.id')->select('maingroups.name', DB::raw('count(maingroups.id) as totalCourses'))->groupBy('maingroups.id')->get();
        // dd($collegeGraphData->toArray());

//         SELECT  ds.name, COUNT(com.id) AS countcom
// FROM    studentgroups ds
// LEFT JOIN
//         students com
// ON      com.studentgroups_id = ds.id
// GROUP BY
//         ds.id

		return view('admin.dashboard', compact('students','studentsCount','courseGraphData','collegeGraphData'));
    }
}
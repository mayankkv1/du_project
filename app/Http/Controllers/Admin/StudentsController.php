<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Redirect;
use Schema;
use App\Students;
use App\Http\Requests\CreateStudentsRequest;
use App\Http\Requests\UpdateStudentsRequest;
use Illuminate\Http\Request;

use App\StudentGroups;


class StudentsController extends Controller {

	/**
	 * Display a listing of students
	 *
     * @param Request $request
     *
     * @return \Illuminate\View\View
	 */
	public function index(Request $request)
    {
        $students = Students::with("studentgroups")->get();

		return view('admin.students.index', compact('students'));
	}

	/**
	 * Show the form for creating a new students
	 *
     * @return \Illuminate\View\View
	 */
	public function create()
	{
	    $studentgroups = StudentGroups::pluck("name", "id")->prepend('Please select', 0);

	    
	    return view('admin.students.create', compact("studentgroups"));
	}

	/**
	 * Store a newly created students in storage.
	 *
     * @param CreateStudentsRequest|Request $request
	 */
	public function store(CreateStudentsRequest $request)
	{
	    
		Students::create($request->all());

		return redirect()->route(config('quickadmin.route').'.students.index');
	}

	/**
	 * Show the form for editing the specified students.
	 *
	 * @param  int  $id
     * @return \Illuminate\View\View
	 */
	public function edit($id)
	{
		$students = Students::find($id);
	    $studentgroups = StudentGroups::pluck("name", "id")->prepend('Please select', 0);

	    
		return view('admin.students.edit', compact('students', "studentgroups"));
	}

	/**
	 * Update the specified students in storage.
     * @param UpdateStudentsRequest|Request $request
     *
	 * @param  int  $id
	 */
	public function update($id, UpdateStudentsRequest $request)
	{
		$students = Students::findOrFail($id);

        

		$students->update($request->all());

		return redirect()->route(config('quickadmin.route').'.students.index');
	}

	/**
	 * Remove the specified students from storage.
	 *
	 * @param  int  $id
	 */
	public function destroy($id)
	{
		Students::destroy($id);

		return redirect()->route(config('quickadmin.route').'.students.index');
	}

    /**
     * Mass delete function from index page
     * @param Request $request
     *
     * @return mixed
     */
    public function massDelete(Request $request)
    {
        if ($request->get('toDelete') != 'mass') {
            $toDelete = json_decode($request->get('toDelete'));
            Students::destroy($toDelete);
        } else {
            Students::whereNotNull('id')->delete();
        }

        return redirect()->route(config('quickadmin.route').'.students.index');
    }

}

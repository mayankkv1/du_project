<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Redirect;
use Schema;
use App\StudentGroups;
use App\Http\Requests\CreateStudentGroupsRequest;
use App\Http\Requests\UpdateStudentGroupsRequest;
use Illuminate\Http\Request;

use App\MainGroups;


class StudentGroupsController extends Controller {

	/**
	 * Display a listing of studentgroups
	 *
     * @param Request $request
     *
     * @return \Illuminate\View\View
	 */
	public function index(Request $request)
    {
        $studentgroups = StudentGroups::with("maingroups")->get();

		return view('admin.studentgroups.index', compact('studentgroups'));
	}

	/**
	 * Show the form for creating a new studentgroups
	 *
     * @return \Illuminate\View\View
	 */
	public function create()
	{
	    $maingroups = MainGroups::pluck("name", "id")->prepend('Please select', 0);

	    
	    return view('admin.studentgroups.create', compact("maingroups"));
	}

	/**
	 * Store a newly created studentgroups in storage.
	 *
     * @param CreateStudentGroupsRequest|Request $request
	 */
	public function store(CreateStudentGroupsRequest $request)
	{
	    
		StudentGroups::create($request->all());

		return redirect()->route(config('quickadmin.route').'.studentgroups.index');
	}

	/**
	 * Show the form for editing the specified studentgroups.
	 *
	 * @param  int  $id
     * @return \Illuminate\View\View
	 */
	public function edit($id)
	{
		$studentgroups = StudentGroups::find($id);
	    $maingroups = MainGroups::pluck("name", "id")->prepend('Please select', 0);

	    
		return view('admin.studentgroups.edit', compact('studentgroups', "maingroups"));
	}

	/**
	 * Update the specified studentgroups in storage.
     * @param UpdateStudentGroupsRequest|Request $request
     *
	 * @param  int  $id
	 */
	public function update($id, UpdateStudentGroupsRequest $request)
	{
		$studentgroups = StudentGroups::findOrFail($id);

        

		$studentgroups->update($request->all());

		return redirect()->route(config('quickadmin.route').'.studentgroups.index');
	}

	/**
	 * Remove the specified studentgroups from storage.
	 *
	 * @param  int  $id
	 */
	public function destroy($id)
	{
		StudentGroups::destroy($id);

		return redirect()->route(config('quickadmin.route').'.studentgroups.index');
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
            StudentGroups::destroy($toDelete);
        } else {
            StudentGroups::whereNotNull('id')->delete();
        }

        return redirect()->route(config('quickadmin.route').'.studentgroups.index');
    }

}

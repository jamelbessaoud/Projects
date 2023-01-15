<?php

namespace App\Http\Controllers;

use App\Models\Evaluation;
use Illuminate\Http\Request;

class EvaluationController extends Controller
{
    //

    //work with the method GET
    public function index(){
        //use get() or all() they do give the same result
        $evaluation = Evaluation::GET();

        return response($evaluation,200);
    }

    //works with the method POST
    public function store(Request $request){
        $data = $request->validate([
            'id_evaluation'=>'required',
            'nom_evaluation'=>'required',
            'description_evaluation'=>'required',
            'id_sceance'=>'required',
            'enonce_evaluation'=>'required',
            'corrige_evaluation'=>'required']);

        $evaluation =Evaluation::create($data);
        return response($evaluation,200);
    }

    //it work with PUT  but use  POST
    public function update(Request $request,$id){
        $data=$request->validate([
            'id_evaluation'=>'required',
            'nom_evaluation'=>'required',
            'description_evaluation'=>'required',
            'id_sceance'=>'required',
            'enonce_evaluation'=>'required',
            'corrige_evaluation'=>'required'

        ]);
        $evaluation=Evaluation::where('id_evaluation',$id)->update($data,$id);
        return response($evaluation,200);

    }

    //it works with the method DELETE
    public function destroy($id){
        //first method
        // $test =test::find($id);
        // $test->delete();

        //or this second method
        $evaluation=Evaluation::where('id_evaluation' , $id)->delete();

        return response('the test is deleted ',200);
    }


    //it works with the method GET
    public function get_evaluation_by_nom($nom){

        $evaluation=Evaluation::where('nom_evaluation' , $nom)->get();

        return response($evaluation,200);
    }
    //get evaluation by id sceance
    public function get_evaluations_by_id_sceance($id){

        $evaluation=Evaluation::where('id_sceance' , $id)->get();

        return response($evaluation,200);
    }
}

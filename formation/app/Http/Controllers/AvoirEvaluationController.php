<?php

namespace App\Http\Controllers;


use App\Models\AvoirEvaluation;
use Illuminate\Http\Request;

class AvoirEvaluationController extends Controller
{

    //work with the method GET
    public function index(){
        //use get() or all() they do give the same result
        $test = AvoirEvaluation::GET();

        return response($test,200);
    }

    //works with the method POST
    public function store(Request $request){
        $data = $request->validate([
            'id_avoir_evaluation'=>'required',
            'id_utilisateur'=>'required',
            'id_evaluation'=>'required']);


        $avoir_formation =AvoirEvaluation::create($data);
        return response($avoir_formation,200);
    }

    //it work with PUT  but use  POST
    public function update(Request $request,$id_avoir_evaluation){
        $data=$request->validate([
            'id_avoir_evaluation'=>'required',
            'id_utilisateur'=>'required',
            'id_evaluation'=>'required'


        ]);
        $avoir_evaluation=AvoirEvaluation::where('id_avoir_evaluation',$id_avoir_evaluation)->update($data,$id_avoir_evaluation);
        return response($avoir_evaluation,200);

    }

    //it works with the method DELETE
    public function destroy($id){
        //first method
        // $formation =Formation::find($id);
        // $formation->delete();

        //or this second method
        $avoir_evaluation=AvoirEvaluation::
        where('id_avoir_evaluation' , $id)
        ->delete();

        return response('the formation is deleted ',200);
    }


    //it works with the method GET
    public function get_avoir_evaluation_by_id($id){
        //$avoir_formation=Avoir_formation::where('id_formation' , $id_formation)::where('id_utilisateur' , $id_utilisateur)->get();
        $avoir_evaluation=AvoirEvaluation::get()
        ->where('id_avoir_evaluation' , $id);

        return response($avoir_evaluation,200);
    }
}

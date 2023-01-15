<?php

namespace App\Http\Controllers;


use App\Models\AvoirSceance;
use Illuminate\Http\Request;

class AvoirSceanceController extends Controller
{

    //work with the method GET
    public function index(){
        //use get() or all() they do give the same result
        $test = AvoirSceance::GET();

        return response($test,200);
    }

    //works with the method POST
    public function store(Request $request){
        $data = $request->validate([
            'id_avoir_sceance'=>'required',
            'id_utilisateur'=>'required',
            'id_sceance'=>'required']);


        $avoir_sceance =AvoirSceance::create($data);
        return response($avoir_sceance,200);
    }

    //it work with PUT  but use  POST
    public function update(Request $request,$id_avoir_sceance){
        $data=$request->validate([
            'id_avoir_sceance'=>'required',
            'id_utilisateur'=>'required',
            'id_sceance'=>'required'


        ]);
        $avoir_sceance=AvoirSceance::where('id_avoir_sceance',$id_avoir_sceance)->update($data,$id_avoir_sceance);
        return response($avoir_sceance,200);

    }

    //it works with the method DELETE
    public function destroy($id){
        //first method
        // $formation =Formation::find($id);
        // $formation->delete();

        //or this second method
        $avoir_sceance=AvoirSceance::
        where('id_avoir_sceance' , $id)->delete();

        return response('the formation is deleted ',200);
    }


    //it works with the method GET
    public function get_avoir_sceance_by_id($id){
        //$avoir_formation=Avoir_formation::where('id_formation' , $id_formation)::where('id_utilisateur' , $id_utilisateur)->get();
        $avoir_evaluation=AvoirSceance::get()
        ->where('id_avoir_sceance' , $id);

        return response($avoir_evaluation,200);
    }
}

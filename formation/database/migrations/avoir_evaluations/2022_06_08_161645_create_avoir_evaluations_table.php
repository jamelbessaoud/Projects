<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('avoir_evaluations', function (Blueprint $table) {
            $table->string('id_utilisateur',20);
            $table->foreign('id_utilisateur')
                    ->references('id_utilisateur')->on('utilisateurs')
                    ->onDelete('cascade');


            $table->string('id_evaluation',20);
            $table->foreign('id_evaluation')
                    ->references('id_evaluation')->on('evaluations')
                    ->onDelete('cascade');
            $table->string('id_avoir_evaluation',20);
            $table->primary('id_avoir_evaluation');





            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('avoir_formations');
    }
};

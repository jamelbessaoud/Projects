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
        Schema::create('avoir_sceances', function (Blueprint $table) {
            $table->string('id_utilisateur',20);
            $table->foreign('id_utilisateur')
                    ->references('id_utilisateur')->on('utilisateurs')
                    ->onDelete('cascade');


            $table->string('id_sceance',20);
            $table->foreign('id_sceance')
                    ->references('id_sceance')->on('sceances')
                    ->onDelete('cascade');
            $table->string('id_avoir_sceance',20);
            $table->primary('id_avoir_sceance');





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

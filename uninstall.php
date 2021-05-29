<?php 

authenticate_admin();

DB::schema()->dropIfExists('app_kapsula_infos');
DB::schema()->dropIfExists('app_kapsula_produtos');
DB::schema()->dropIfExists('app_kapsula_clientes');
DB::schema()->dropIfExists('app_kapsula_pedidos');
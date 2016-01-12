package com.appmovilesi.fullfarm;

import java.io.InputStream;
import java.io.OutputStream;

import android.app.Activity;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

public class Constante {
	
	// API URL Configuracion
	static String AdminPageURL = "http://192.168.1.35/fullfarma/";
	static String CategoryAPI = "http://192.168.1.35/fullfarma/categorias.php";//Web services para listar categorias
	static String MenuAPI = "http://192.168.1.35/fullfarma/productos-por-categoria.php";
	static String TaxCurrencyAPI = "http://192.168.1.35/fullfarma/obtener-impuestos-y-moneda.php";
	static String MenuDetailAPI = "http://192.168.1.35/fullfarma/productos-por-id.php";
	static String SendDataAPI = "http://192.168.1.35/fullfarma/agregar-checkout.php";
	
	static String AccessKey = "12345";
	
	// ruta de la SQLITE Base de datos
	static String DBPath = "/data/data/com.appmovilesi.fullfarm/databases/";


	public static boolean isNetworkAvailable(Activity activity) {
		ConnectivityManager connectivity = (ConnectivityManager) activity
				.getSystemService(Context.CONNECTIVITY_SERVICE);
		if (connectivity == null) {
			return false;
		} else {
			NetworkInfo[] info = connectivity.getAllNetworkInfo();
			if (info != null) {
				for (int i = 0; i < info.length; i++) {
					if (info[i].getState() == NetworkInfo.State.CONNECTED) {
						return true;
					}
				}
			}
		}
		return false;
	}

	public static void CopyStream(InputStream is, OutputStream os)
    {
        final int buffer_size=1024;
        try
        {
            byte[] bytes=new byte[buffer_size];
            for(;;)
            {
              int count=is.read(bytes, 0, buffer_size);
              if(count==-1)
                  break;
              os.write(bytes, 0, count);
            }
        }
        catch(Exception ex){}
    }

}

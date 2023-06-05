import {type Characters } from "./home.interface";

export const adapterCharacter = (data:any):Characters[]=>{

    if(data.length > 0){
return data.map((e:any)=>{
     return {
        id: e.id ?? "",
        name:e.name ?? "",
        status:e.status,
        species:e.species ?? "",
        gender:e.gender ?? "",
        location:e.location.name ?? "",
        image:e.image ?? "",
        origin:e.location.origin ?? ""
     }
    })

    } else{

        return []
    }

}
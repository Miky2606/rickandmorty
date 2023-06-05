import axios from "axios"
import { adapterCharacter } from "./home.adapter";
import { type Characters } from "./home.interface";

export const getCharacter = async(page:number):Promise<Characters[] | null> =>{
    try {
        const data_api = await axios.get(`https://rickandmortyapi.com/api/character?page=${page}`);

        return adapterCharacter(data_api.data.results);
    } catch (error) {
        return null
    }

}
import type { QRL } from "@builder.io/qwik"

export enum StatusCharacter{
    ALIVE = "Alive",
    DEAD="Dead",
    UNKNOWN='unknown'
}
export type StatusViewClass ={
      [key in StatusCharacter] : string
}


export interface Characters{
    id: number,
    name:string,
    status:StatusCharacter,
    species:string,
    gender:string,
    location:string,
    image:string,
    origin:string
}

export interface CharactesStore{
    page:number,
    characters:Characters[] | null,
    incrementPage : QRL<(this :CharactesStore)=>void>
    decrementPage : QRL<(this :CharactesStore)=>void>
    
}
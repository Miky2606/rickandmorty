import { component$ } from "@builder.io/qwik";
import type {
  Characters,
  StatusCharacter,
  StatusViewClass,
} from "./service/home.interface";

export const CardList = component$(
  ({ character }: { character: Characters[] }) => {
    return (
      <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-2">
        {character.map((e) => (
          <Card character={e} key={e.id} />
        ))}
      </div>
    );
  }
);

export const Card = component$(({ character }: { character: Characters }) => {
  return (
    <div class="bg-zinc-800 p-2 flex flex-col gap-3 rounded ">
      <img
        src={character.image}
        alt={character.name}
        width={200}
        height={200}
        class="rounded"
      />

      <div class="flex justify-between items-center">
        <h3 class="text-pink-400">{character.name}</h3>
        <StatusView status={character.status} />
      </div>
      <div class="flex flex-col gap-2 ">
        <Title title="Specie" content={character.species} />
        <Title title="Gender" content={character.gender} />
        <Title title="Origin" content={character.origin} />
        <Title title="Location" content={character.location} />
      </div>
    </div>
  );
});

const StatusView = component$(({ status }: { status: StatusCharacter }) => {
  const status_character: StatusViewClass = {
    Alive: "bg-green-400",
    Dead: "bg-red-500",
    unknown: "bg-orange-400",
  };
  return <div class={`${status_character[status]} rounded-full w-2 h-2`}></div>;
});

const Title = component$(
  ({ title, content }: { title: string; content: string }) => {
    return (
      <p class="text-white text-xs">
        <span class="text-sm text-gray-400">{title}: </span>
        {content}
      </p>
    );
  }
);

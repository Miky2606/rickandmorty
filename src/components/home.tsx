import { $, component$, useStore, useVisibleTask$ } from "@builder.io/qwik";

import { CardList } from "./card.pokemon";
import type { CharactesStore } from "./service/home.interface";
import { getCharacter } from "./service/home.services";

export const HomeView = component$(() => {
  const characters = useStore<CharactesStore>({
    page: 1,
    characters: [],
    incrementPage: $(function () {
      if (this.page < 42) {
        this.page++;
        window?.scrollTo({ top: 0, behavior: "smooth" });
      }
    }),
    decrementPage: $(function () {
      if (this.page > 1) {
        this.page--;
        window?.scrollTo({ top: 0, behavior: "smooth" });
      }
    }),
  });

  useVisibleTask$(async ({ track }) => {
    track(() => characters.page);
    characters.characters = await getCharacter(characters.page);
  });

  if (characters.characters === null) return <div>Error in the Api</div>;

  return (
    <main class="w-full md:w-3/5 mx-auto p-2 flex flex-col gap-2">
      <h1 class="text-center text-green-400 font-bold text-3xl p-2">
        Rick and Morty
      </h1>
      <CardList character={characters.characters} />
      <div class="flex gap-3 items-center justify-center p-2">
        {characters.page > 1 && (
          <button
            onClick$={() => characters.decrementPage()}
            class="px-2 bg-green-300 rounded font-semibold text-zinc-900 "
            id="button"
          >
            Prev
          </button>
        )}
        <p class="text-white font-bold"> {characters.page}</p>
        {characters.page < 42 && (
          <button
            onClick$={() => characters.incrementPage()}
            class="px-2 bg-green-300 rounded font-semibold text-zinc-900"
          >
            Next
          </button>
        )}
      </div>
    </main>
  );
});

% БЗ для игры Terraia
% задание 1 - написать <=20 фактов с 1 аргументом
% В качестве фактов, я опишу орудия, броню, инстурменты, материалы и мобов

is_weapon(sword).
is_weapon(axe).
is_weapon(bow).
is_weapon(gun).
is_weapon(hammer).
is_weapon(pickaxe).


is_armor(helmet).
is_armor(chestplate).
is_armor(leggings).
is_armor(boots).


is_tool(pickaxe).
is_tool(axe).
is_tool(hammer).
is_tool(shovel).
is_tool(fishing_rod).


is_material(wood).
is_material(stone).
is_material(iron).
is_material(copper).
is_material(silver).
is_material(gold).
is_material(platinum).
is_material(lead).
is_material(tungsten).


is_mob(slime).
is_mob(zombie).
is_mob(skeleton).
is_mob(eye_of_cthulhu).
is_mob(king_slime).

% задание 2 - написать <=10 фактов с 2 аргументами
% В качестве фактов, я опишу из чего создаются тот или иной предмет, силу оружия, здоровье мобов, орудия которые убивают мобов, предметы из мобов
made_of(sword, wood).
made_of(sword, iron).
made_of(sword, copper).
made_of(axe, wood).
made_of(axe, iron).
made_of(pickaxe, wood).
made_of(pickaxe, iron).
made_of(pickaxe, copper).
made_of(hammer, wood).
made_of(hammer, iron).
made_of(hammer, copper).
made_of(bow, wood).
made_of(bow, iron).


weapon_damage(sword, 10).
weapon_damage(axe, 15).
weapon_damage(bow, 8).
weapon_damage(gun, 12).
weapon_damage(hammer, 5).


mob_health(slime, 10).
mob_health(zombie, 20).
mob_health(skeleton, 15).
mob_health(eye_of_cthulhu, 500).
mob_health(king_slime, 250).


can_kill(sword, slime).
can_kill(sword, zombie).
can_kill(axe, slime).
can_kill(axe, zombie).
can_kill(axe, skeleton).
can_kill(bow, slime).
can_kill(bow, zombie).
can_kill(gun, slime).
can_kill(gun, zombie).
can_kill(gun, skeleton).
can_kill(hammer, slime).
can_kill(hammer, zombie).
can_kill(hammer, skeleton).
can_kill(pickaxe, slime).
can_kill(pickaxe, zombie).


drops(slime, gel).
drops(zombie, rotten_flesh).
drops(skeleton, bone).
drops(eye_of_cthulhu, eye_of_cthulhu_trophy).
drops(king_slime, gel).


% задание 3 - написание правил <=5
% я разбил правила на более интересные и менее

% менее интересные
% Определяет, является ли предмет оружием
is_weapon(Item) :- 
 is_weapon(Item).

% Определяет, является ли предмет броней
is_armor(Item) :-
 is_armor(Item).

% Определяет, является ли предмет инструментом
is_tool(Item) :- 
 is_tool(Item).

% Определяет, является ли предмет материалом
is_material(Item) :-
 is_material(Item).

% более интересные
% Определяет, может ли предмет быть создан из материала
can_be_made_of(Item, Material) :-
 made_of(Item, Material).

% Определяет, является ли предмет оружием с определенным уроном
strong_weapon(Item, Damage) :-
  is_weapon(Item),
  weapon_damage(Item, Damage),
  Damage > 10.

% Определяет, может ли оружие убить моба
can_kill_mob(Weapon, Mob) :-
 can_kill(Weapon, Mob).

% Правило для определения, может ли предмет быть использован для охоты
can_be_used_for_hunting(Item) :-
 is_weapon(Item),
 (Item == sword ; Item == axe ; Item == bow ; Item == gun).


% Определение, является ли предмет оружием ближнего боя:
melee_weapon(Item) :-
  is_weapon(Item),
  (Item == sword ; Item == axe ; Item == hammer).

% Определяет, является ли предмет оружием, которое может убить слизня:
slime_killer(Item) :-
  is_weapon(Item),
  can_kill(Item, slime).

% Определяет, является ли предмет мощным оружием дальнего боя:
powerful_ranged_weapon(Item) :-
  is_weapon(Item),
  (Item == bow ; Item == gun),
  weapon_damage(Item, Damage),
  Damage > 10.

% Определяет, является ли предмет оружием, которое может убить слизня и сделано из железа:
iron_slime_killer(Item) :-
 is_weapon(Item),
 can_kill(Item, slime),
 made_of(Item, iron).
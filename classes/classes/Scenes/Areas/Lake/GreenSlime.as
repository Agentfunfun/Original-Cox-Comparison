﻿package classes.Scenes.Areas.Lake
{
import classes.*;
import classes.BodyParts.Butt;
import classes.BodyParts.Hips;
import classes.BodyParts.LowerBody;
import classes.Scenes.Dungeons.RiverDungeon;
import classes.Scenes.SceneLib;
import classes.internals.*;

public class GreenSlime extends Monster
	{
		override public function defeated(hpVictory:Boolean):void
		{
			SceneLib.lake.greenSlimeScene.defeatGS();
		}

		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			if (pcCameWorms) {
				outputText("\n\nThe slime doesn't even seem to notice.\n\n");
			}
			doNext(SceneLib.lake.greenSlimeScene.slimeLoss);
		}
		
		private function lustAttack():void {
			outputText("The creature surges forward slowly with a swing that you easily manage to avoid.  You notice traces of green liquid spurt from the creature as it does, forming a thin mist that makes your skin tingle with excitement when you inhale it.");
			player.takeLustDamage(player.lib / 10 + 8, true);
			doNext(EventParser.playerMenu);
		}
		
		private function lustReduction():void {
			outputText("The creature collapses backwards as its cohesion begins to give out, and the faint outline of eyes and a mouth form on its face.  Its chest heaves as if it were gasping, and the bolt upright erection it sports visibly quivers and pulses before relaxing slightly.");
			if (lust < 20) lust = 0;
			else lust -= 20;
			doNext(EventParser.playerMenu);
		}
		
		public function GreenSlime()
		{
			trace("GreenSlime Constructor!");
			this.a = "a ";
			this.short = "green slime";
			this.imageName = "greenslime";
			this.long = "The green slime has a normally featureless face that sits on top of wide shoulders that sprout into thick, strong arms.  Its torso fades into an indistinct column that melds into the lump of ooze on the ground that serves as a makeshift form of locomotion.";
			// this.plural = false;
			this.createCock(18, 2, CockTypesEnum.HUMAN);
			this.cumMultiplier = 3;
			this.hoursSinceCum = 20;
			this.pronoun1 = "it";
			this.pronoun2 = "it";
			this.pronoun3 = "its";
			createBreastRow(0);
			this.ass.analLooseness = AssClass.LOOSENESS_STRETCHED;
			this.ass.analWetness = AssClass.WETNESS_SLIME_DROOLING;
			this.tallness = rand(8) + 80;
			this.hips.type = Hips.RATING_AMPLE;
			this.butt.type = Butt.RATING_LARGE;
			this.lowerBody = LowerBody.GOO;
			initStrTouSpeInte(45, 60, 20, 5);
			initWisLibSensCor(5, 50, 70, 40);
			this.bodyColor = "green";
			this.weaponName = "hands";
			this.weaponVerb = "slap";
			this.weaponAttack = 3;
			this.armorName = "gelatinous skin";
			this.armorDef = 6;
			this.armorMDef = 18;
			this.bonusHP = 50;
			this.bonusLust = 123;
			this.lust = 30;
			this.level = 3;
			this.gems = rand(5) + 3;
			this.drop = new ChainedDrop().add(weapons.PIPE, 1 / 10)
					.add(consumables.WETCLTH, 1 / 2)
					.elseDrop(useables.GREENGL);
			this.special1 = lustReduction;
			this.special2 = lustAttack;
			this.special3 = lustAttack;
			this.createPerk(PerkLib.EnemyForBeginnersType, 0, 0, 0, 0);
			this.createPerk(PerkLib.FireVulnerability, 0, 0, 0, 0);
			this.createPerk(PerkLib.EnemyGooType, 0, 0, 0, 0);
			checkMonster();
		}
	}
}

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0362F3C9ED8;
	Tue,  2 Jun 2026 23:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780441714; cv=none; b=qEXanvWUHepBX6PPCAGHPnwX4K9rI3h5DUmdQaupqvSObLzXTRZGYeYgpZGrsYPFncdx5oj9hA+D4TwVsXwIV1gaGu92ij0sx5x8/I+Dsa/Kpdw9XapHh2wLFuyz2jO2g0YTX/34ccVrLsaQ7LLAr49v/zQcfm5hVxtZYN32Eqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780441714; c=relaxed/simple;
	bh=LKtHwpvZWLoijEl5O3ipYsym3WJhkE+MMD83AQb5pQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aZKK/9CmvTE+O9BW1iCBU9FRaIWit5qZuclwNbgyWxR0GKgnaxpL79BnE7lrx7NkxCOkdLXdNg2uG8oghQpciyAbTXHQvl/6LU1Z/9lehKEAtMscSaHIlMNOnZjo/nYPOl+QpBA1ZQwFx3WNLUh/N9a0Je+To1NVdRopivXYMDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLg/LMZq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLg/LMZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780441712; x=1811977712;
  h=date:from:to:cc:subject:message-id;
  bh=LKtHwpvZWLoijEl5O3ipYsym3WJhkE+MMD83AQb5pQs=;
  b=FLg/LMZql39wxQKIw5aDa3aXE6df4p1tl5iPOmdDEtZ6hjo64dagBW13
   obrOl6EX0j6iUtRre2LfChItt7nko8/hNAmpN9TRhniqnhFHop6S/rb2h
   jkSNgAHeskCRFSSMGrCnihXNCyQWB1Of4BkrnJ+CZiRC6pBE5TJIr75pE
   2U+YfiPCqEIWj0czmJSPpDxtVKX8UrpI17cod2v9aKzMVmfVABrsln6D7
   AyxoAXGxxySthqaNyoNr2jYJ9MNR3RkdJ2XxE4WuUNfk6TAWG5K9K5220
   ydXPihsX9PkgnF/l3V72jJFt2O5owys5s7A9eGCnsfrrlToeBaP+g8T+n
   Q==;
X-CSE-ConnectionGUID: keq91UmgTXCEqP6YsExrOA==
X-CSE-MsgGUID: NvoT/1IjQCmDc6xcYmy35w==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="103899137"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="103899137"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:08:31 -0700
X-CSE-ConnectionGUID: VSO7cz9mQq2bUMX2Wko0xQ==
X-CSE-MsgGUID: UJ6kRVUBSMucB6PcSkLJ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="237686612"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jun 2026 16:08:28 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUYDi-00000000Ceq-0EOX;
	Tue, 02 Jun 2026 23:08:26 +0000
Date: Wed, 03 Jun 2026 07:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mediatek/mt2701/mt2701-cs42448.c:343:2: error: call to undeclared
 function 'for_each_card_prelinks'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202606030655.zU1zmZtv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 9b07c6aa4c11e450c2f7f409b4a47925b85697c0 [290/290] ASoC: soc.h: remove compatible definition
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606030655.zU1zmZtv-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030655.zU1zmZtv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030655.zU1zmZtv-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt2701/mt2701-cs42448.c:305:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     305 | static struct snd_soc_card_platform mt2701_cs42448_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt2701/mt2701-cs42448.c:305:15: note: forward declaration of 'struct snd_soc_card_platform'
     305 | static struct snd_soc_card_platform mt2701_cs42448_card_platform = {
         |               ^
>> sound/soc/mediatek/mt2701/mt2701-cs42448.c:343:2: error: call to undeclared function 'for_each_card_prelinks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     343 |         for_each_card_prelinks(card, i, dai_link) {
         |         ^
>> sound/soc/mediatek/mt2701/mt2701-cs42448.c:343:43: error: expected ';' after expression
     343 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
>> sound/soc/mediatek/mt2701/mt2701-cs42448.c:345:4: error: 'continue' statement not in loop statement
     345 |                         continue;
         |                         ^
   sound/soc/mediatek/mt2701/mt2701-cs42448.c:356:43: error: expected ';' after expression
     356 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
   sound/soc/mediatek/mt2701/mt2701-cs42448.c:358:4: error: 'continue' statement not in loop statement
     358 |                         continue;
         |                         ^
>> sound/soc/mediatek/mt2701/mt2701-cs42448.c:372:8: error: call to undeclared function 'snd_soc_card_of_parse_audio_routing'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     372 |         ret = snd_soc_card_of_parse_audio_routing(card, "audio-routing");
         |               ^
   sound/soc/mediatek/mt2701/mt2701-cs42448.c:372:8: note: did you mean 'snd_soc_card_driver_of_parse_audio_routing'?
   include/sound/soc-card.h:141:5: note: 'snd_soc_card_driver_of_parse_audio_routing' declared here
     141 | int snd_soc_card_driver_of_parse_audio_routing(struct device *dev,
         |     ^
   7 errors generated.
--
   sound/soc/mediatek/mt2701/mt2701-hdmi.c:51:3: error: field designator 'name' does not refer to any field in type 'struct snd_soc_card'
      51 |         .name = "mt2701-hdmi",
         |         ~^~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-hdmi.c:52:3: error: field designator 'owner' does not refer to any field in type 'struct snd_soc_card'
      52 |         .owner = THIS_MODULE,
         |         ~^~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-hdmi.c:53:3: error: field designator 'dai_link' does not refer to any field in type 'struct snd_soc_card'
      53 |         .dai_link = mt2701_hdmi_dai_links,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-hdmi.c:54:3: error: field designator 'num_links' does not refer to any field in type 'struct snd_soc_card'
      54 |         .num_links = ARRAY_SIZE(mt2701_hdmi_dai_links),
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt2701/mt2701-hdmi.c:72:2: error: call to undeclared function 'for_each_card_prelinks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      72 |         for_each_card_prelinks(card, i, dai_link) {
         |         ^
>> sound/soc/mediatek/mt2701/mt2701-hdmi.c:72:43: error: expected ';' after expression
      72 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
>> sound/soc/mediatek/mt2701/mt2701-hdmi.c:74:4: error: 'continue' statement not in loop statement
      74 |                         continue;
         |                         ^
>> sound/soc/mediatek/mt2701/mt2701-hdmi.c:88:8: error: call to undeclared function 'devm_snd_soc_register_card'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      88 |         ret = devm_snd_soc_register_card(dev, card);
         |               ^
   8 errors generated.
--
   sound/soc/mediatek/mt2701/mt2701-wm8960.c:93:37: error: variable has incomplete type 'struct snd_soc_card_platform'
      93 | static struct snd_soc_card_platform mt2701_wm8960_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt2701/mt2701-wm8960.c:93:15: note: forward declaration of 'struct snd_soc_card_platform'
      93 | static struct snd_soc_card_platform mt2701_wm8960_card_platform = {
         |               ^
>> sound/soc/mediatek/mt2701/mt2701-wm8960.c:123:2: error: call to undeclared function 'for_each_card_prelinks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     123 |         for_each_card_prelinks(card, i, dai_link) {
         |         ^
>> sound/soc/mediatek/mt2701/mt2701-wm8960.c:123:43: error: expected ';' after expression
     123 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
>> sound/soc/mediatek/mt2701/mt2701-wm8960.c:125:4: error: 'continue' statement not in loop statement
     125 |                         continue;
         |                         ^
   sound/soc/mediatek/mt2701/mt2701-wm8960.c:137:43: error: expected ';' after expression
     137 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
   sound/soc/mediatek/mt2701/mt2701-wm8960.c:139:4: error: 'continue' statement not in loop statement
     139 |                         continue;
         |                         ^
>> sound/soc/mediatek/mt2701/mt2701-wm8960.c:143:8: error: call to undeclared function 'snd_soc_card_of_parse_audio_routing'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     143 |         ret = snd_soc_card_of_parse_audio_routing(card, "audio-routing");
         |               ^
   sound/soc/mediatek/mt2701/mt2701-wm8960.c:143:8: note: did you mean 'snd_soc_card_driver_of_parse_audio_routing'?
   include/sound/soc-card.h:141:5: note: 'snd_soc_card_driver_of_parse_audio_routing' declared here
     141 | int snd_soc_card_driver_of_parse_audio_routing(struct device *dev,
         |     ^
   7 errors generated.
--
   sound/soc/mediatek/mt6797/mt6797-mt6351.c:177:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     177 | static struct snd_soc_card_platform mt6797_mt6351_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt6797/mt6797-mt6351.c:177:15: note: forward declaration of 'struct snd_soc_card_platform'
     177 | static struct snd_soc_card_platform mt6797_mt6351_card_platform = {
         |               ^
>> sound/soc/mediatek/mt6797/mt6797-mt6351.c:203:2: error: call to undeclared function 'for_each_card_prelinks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     203 |         for_each_card_prelinks(card, i, dai_link) {
         |         ^
>> sound/soc/mediatek/mt6797/mt6797-mt6351.c:203:43: error: expected ';' after expression
     203 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
>> sound/soc/mediatek/mt6797/mt6797-mt6351.c:205:4: error: 'continue' statement not in loop statement
     205 |                         continue;
         |                         ^
   sound/soc/mediatek/mt6797/mt6797-mt6351.c:217:43: error: expected ';' after expression
     217 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
   sound/soc/mediatek/mt6797/mt6797-mt6351.c:219:4: error: 'continue' statement not in loop statement
     219 |                         continue;
         |                         ^
   6 errors generated.
--
   sound/soc/mediatek/mt7986/mt7986-wm8960.c:72:37: error: variable has incomplete type 'struct snd_soc_card_platform'
      72 | static struct snd_soc_card_platform mt7986_wm8960_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt7986/mt7986-wm8960.c:72:15: note: forward declaration of 'struct snd_soc_card_platform'
      72 | static struct snd_soc_card_platform mt7986_wm8960_card_platform = {
         |               ^
>> sound/soc/mediatek/mt7986/mt7986-wm8960.c:112:2: error: call to undeclared function 'for_each_card_prelinks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     112 |         for_each_card_prelinks(card, i, dai_link) {
         |         ^
>> sound/soc/mediatek/mt7986/mt7986-wm8960.c:112:43: error: expected ';' after expression
     112 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
>> sound/soc/mediatek/mt7986/mt7986-wm8960.c:114:4: error: 'continue' statement not in loop statement
     114 |                         continue;
         |                         ^
   sound/soc/mediatek/mt7986/mt7986-wm8960.c:135:43: error: expected ';' after expression
     135 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
   sound/soc/mediatek/mt7986/mt7986-wm8960.c:137:4: error: 'continue' statement not in loop statement
     137 |                         continue;
         |                         ^
>> sound/soc/mediatek/mt7986/mt7986-wm8960.c:141:8: error: call to undeclared function 'snd_soc_card_of_parse_audio_routing'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     141 |         ret = snd_soc_card_of_parse_audio_routing(card, "audio-routing");
         |               ^
   sound/soc/mediatek/mt7986/mt7986-wm8960.c:141:8: note: did you mean 'snd_soc_card_driver_of_parse_audio_routing'?
   include/sound/soc-card.h:141:5: note: 'snd_soc_card_driver_of_parse_audio_routing' declared here
     141 | int snd_soc_card_driver_of_parse_audio_routing(struct device *dev,
         |     ^
   7 errors generated.
--
   sound/soc/mediatek/mt8173/mt8173-max98090.c:131:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     131 | static struct snd_soc_card_platform mt8173_max98090_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt8173/mt8173-max98090.c:131:15: note: forward declaration of 'struct snd_soc_card_platform'
     131 | static struct snd_soc_card_platform mt8173_max98090_card_platform = {
         |               ^
>> sound/soc/mediatek/mt8173/mt8173-max98090.c:163:2: error: call to undeclared function 'for_each_card_prelinks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     163 |         for_each_card_prelinks(card, i, dai_link) {
         |         ^
>> sound/soc/mediatek/mt8173/mt8173-max98090.c:163:43: error: expected ';' after expression
     163 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
>> sound/soc/mediatek/mt8173/mt8173-max98090.c:165:4: error: 'continue' statement not in loop statement
     165 |                         continue;
         |                         ^
   sound/soc/mediatek/mt8173/mt8173-max98090.c:177:43: error: expected ';' after expression
     177 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
   sound/soc/mediatek/mt8173/mt8173-max98090.c:179:4: error: 'continue' statement not in loop statement
     179 |                         continue;
         |                         ^
   6 errors generated.
--
   sound/soc/mediatek/mt8173/mt8173-rt5650.c:255:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     255 | static struct snd_soc_card_platform mt8173_rt5650_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt8173/mt8173-rt5650.c:255:15: note: forward declaration of 'struct snd_soc_card_platform'
     255 | static struct snd_soc_card_platform mt8173_rt5650_card_platform = {
         |               ^
>> sound/soc/mediatek/mt8173/mt8173-rt5650.c:290:2: error: call to undeclared function 'for_each_card_prelinks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     290 |         for_each_card_prelinks(card, i, dai_link) {
         |         ^
>> sound/soc/mediatek/mt8173/mt8173-rt5650.c:290:43: error: expected ';' after expression
     290 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
>> sound/soc/mediatek/mt8173/mt8173-rt5650.c:292:4: error: 'continue' statement not in loop statement
     292 |                         continue;
         |                         ^
   4 errors generated.
--
   sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c:173:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     173 | static struct snd_soc_card_platform mt8173_rt5650_rt5514_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c:173:15: note: forward declaration of 'struct snd_soc_card_platform'
     173 | static struct snd_soc_card_platform mt8173_rt5650_rt5514_card_platform = {
         |               ^
>> sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c:208:2: error: call to undeclared function 'for_each_card_prelinks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     208 |         for_each_card_prelinks(card, i, dai_link) {
         |         ^
>> sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c:208:43: error: expected ';' after expression
     208 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
>> sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c:210:4: error: 'continue' statement not in loop statement
     210 |                         continue;
         |                         ^
   4 errors generated.
--
   sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c:230:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     230 | static struct snd_soc_card_platform mt8173_rt5650_rt5676_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c:230:15: note: forward declaration of 'struct snd_soc_card_platform'
     230 | static struct snd_soc_card_platform mt8173_rt5650_rt5676_card_platform = {
         |               ^
>> sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c:265:2: error: call to undeclared function 'for_each_card_prelinks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     265 |         for_each_card_prelinks(card, i, dai_link) {
         |         ^
>> sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c:265:43: error: expected ';' after expression
     265 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
>> sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c:267:4: error: 'continue' statement not in loop statement
     267 |                         continue;
         |                         ^
   4 errors generated.
--
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:608:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     608 | static struct snd_soc_card_platform mt8183_mt6358_ts3a227_max98357_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:608:15: note: forward declaration of 'struct snd_soc_card_platform'
     608 | static struct snd_soc_card_platform mt8183_mt6358_ts3a227_max98357_card_platform = {
         |               ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:621:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     621 | static struct snd_soc_card_platform mt8183_mt6358_ts3a227_max98357b_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:608:15: note: forward declaration of 'struct snd_soc_card_platform'
     608 | static struct snd_soc_card_platform mt8183_mt6358_ts3a227_max98357_card_platform = {
         |               ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:645:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     645 | static struct snd_soc_card_platform mt8183_mt6358_ts3a227_rt1015_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:608:15: note: forward declaration of 'struct snd_soc_card_platform'
     608 | static struct snd_soc_card_platform mt8183_mt6358_ts3a227_max98357_card_platform = {
         |               ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:660:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     660 | static struct snd_soc_card_platform mt8183_mt6358_ts3a227_rt1015p_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:608:15: note: forward declaration of 'struct snd_soc_card_platform'
     608 | static struct snd_soc_card_platform mt8183_mt6358_ts3a227_max98357_card_platform = {
         |               ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:725:45: error: incompatible pointer types passing 'struct snd_soc_card_platform *' to parameter of type 'struct snd_soc_card_driver *' [-Werror,-Wincompatible-pointer-types]
     725 |         card = devm_snd_soc_card_alloc(&pdev->dev, card_platform);
         |                                                    ^~~~~~~~~~~~~
   include/sound/soc-card.h:91:39: note: passing argument to parameter 'driver' here
      91 |                                              struct snd_soc_card_driver *driver);
         |                                                                          ^
>> sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:733:2: error: call to undeclared function 'for_each_card_prelinks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     733 |         for_each_card_prelinks(card, i, dai_link) {
         |         ^
>> sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:733:43: error: expected ';' after expression
     733 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:810:16: error: incomplete definition of type 'struct snd_soc_card_platform'
     810 |                 card_platform->driver.aux_dev = &mt8183_mt6358_ts3a227_max98357_headset_dev;
         |                 ~~~~~~~~~~~~~^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:608:15: note: forward declaration of 'struct snd_soc_card_platform'
     608 | static struct snd_soc_card_platform mt8183_mt6358_ts3a227_max98357_card_platform = {
         |               ^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:811:16: error: incomplete definition of type 'struct snd_soc_card_platform'
     811 |                 card_platform->driver.num_aux_devs = 1;
         |                 ~~~~~~~~~~~~~^
   sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c:608:15: note: forward declaration of 'struct snd_soc_card_platform'
     608 | static struct snd_soc_card_platform mt8183_mt6358_ts3a227_max98357_card_platform = {
         |               ^
   9 errors generated.
--
   sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:651:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     651 | static struct snd_soc_card_platform mt8183_da7219_max98357_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:651:15: note: forward declaration of 'struct snd_soc_card_platform'
     651 | static struct snd_soc_card_platform mt8183_da7219_max98357_card_platform = {
         |               ^
   sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:710:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     710 | static struct snd_soc_card_platform mt8183_da7219_rt1015_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:651:15: note: forward declaration of 'struct snd_soc_card_platform'
     651 | static struct snd_soc_card_platform mt8183_da7219_max98357_card_platform = {
         |               ^
   sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:729:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     729 | static struct snd_soc_card_platform mt8183_da7219_rt1015p_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:651:15: note: forward declaration of 'struct snd_soc_card_platform'
     651 | static struct snd_soc_card_platform mt8183_da7219_max98357_card_platform = {
         |               ^
   sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:771:45: error: incompatible pointer types passing 'struct snd_soc_card_platform *' to parameter of type 'struct snd_soc_card_driver *' [-Werror,-Wincompatible-pointer-types]
     771 |         card = devm_snd_soc_card_alloc(&pdev->dev, card_platform);
         |                                                    ^~~~~~~~~~~~~
   include/sound/soc-card.h:91:39: note: passing argument to parameter 'driver' here
      91 |                                              struct snd_soc_card_driver *driver);
         |                                                                          ^
>> sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:778:2: error: call to undeclared function 'for_each_card_prelinks'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     778 |         for_each_card_prelinks(card, i, dai_link) {
         |         ^
>> sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c:778:43: error: expected ';' after expression
     778 |         for_each_card_prelinks(card, i, dai_link) {
         |                                                  ^
         |                                                  ;
   6 errors generated.
..


vim +/for_each_card_prelinks +343 sound/soc/mediatek/mt2701/mt2701-cs42448.c

1f458d53f76c25 Garlic Tseng      2016-07-04  304  
ceb4319f163402 Kuninori Morimoto 2026-05-20 @305  static struct snd_soc_card_platform mt2701_cs42448_card_platform = {
1f458d53f76c25 Garlic Tseng      2016-07-04  306  	.name = "mt2701-cs42448",
1f458d53f76c25 Garlic Tseng      2016-07-04  307  	.owner = THIS_MODULE,
ceb4319f163402 Kuninori Morimoto 2026-05-20  308  	.driver = {
1f458d53f76c25 Garlic Tseng      2016-07-04  309  		.dai_link = mt2701_cs42448_dai_links,
1f458d53f76c25 Garlic Tseng      2016-07-04  310  		.num_links = ARRAY_SIZE(mt2701_cs42448_dai_links),
1f458d53f76c25 Garlic Tseng      2016-07-04  311  		.controls = mt2701_cs42448_controls,
1f458d53f76c25 Garlic Tseng      2016-07-04  312  		.num_controls = ARRAY_SIZE(mt2701_cs42448_controls),
1f458d53f76c25 Garlic Tseng      2016-07-04  313  		.dapm_widgets = mt2701_cs42448_asoc_card_dapm_widgets,
1f458d53f76c25 Garlic Tseng      2016-07-04  314  		.num_dapm_widgets = ARRAY_SIZE(mt2701_cs42448_asoc_card_dapm_widgets),
ceb4319f163402 Kuninori Morimoto 2026-05-20  315  	},
1f458d53f76c25 Garlic Tseng      2016-07-04  316  };
1f458d53f76c25 Garlic Tseng      2016-07-04  317  
1f458d53f76c25 Garlic Tseng      2016-07-04  318  static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
1f458d53f76c25 Garlic Tseng      2016-07-04  319  {
ceb4319f163402 Kuninori Morimoto 2026-05-20  320  	struct snd_soc_card *card;
1f458d53f76c25 Garlic Tseng      2016-07-04  321  	int ret;
1f458d53f76c25 Garlic Tseng      2016-07-04  322  	int i;
1f458d53f76c25 Garlic Tseng      2016-07-04  323  	struct device_node *platform_node, *codec_node, *codec_node_bt_mrg;
77e6a5e40aa393 Liu Jing          2024-09-03  324  	struct device *dev = &pdev->dev;
1f458d53f76c25 Garlic Tseng      2016-07-04  325  	struct mt2701_cs42448_private *priv =
77e6a5e40aa393 Liu Jing          2024-09-03  326  		devm_kzalloc(dev, sizeof(struct mt2701_cs42448_private),
1f458d53f76c25 Garlic Tseng      2016-07-04  327  			     GFP_KERNEL);
7fe072b4df5d0c Kuninori Morimoto 2018-09-18  328  	struct snd_soc_dai_link *dai_link;
1f458d53f76c25 Garlic Tseng      2016-07-04  329  
1f458d53f76c25 Garlic Tseng      2016-07-04  330  	if (!priv)
1f458d53f76c25 Garlic Tseng      2016-07-04  331  		return -ENOMEM;
1f458d53f76c25 Garlic Tseng      2016-07-04  332  
ceb4319f163402 Kuninori Morimoto 2026-05-20  333  	card = devm_snd_soc_card_alloc(dev, &mt2701_cs42448_card_platform);
ceb4319f163402 Kuninori Morimoto 2026-05-20  334  	if (!card)
ceb4319f163402 Kuninori Morimoto 2026-05-20  335  		return -ENOMEM;
ceb4319f163402 Kuninori Morimoto 2026-05-20  336  
1f458d53f76c25 Garlic Tseng      2016-07-04  337  	platform_node = of_parse_phandle(pdev->dev.of_node,
1f458d53f76c25 Garlic Tseng      2016-07-04  338  					 "mediatek,platform", 0);
1f458d53f76c25 Garlic Tseng      2016-07-04  339  	if (!platform_node) {
77e6a5e40aa393 Liu Jing          2024-09-03  340  		dev_err(dev, "Property 'platform' missing or invalid\n");
1f458d53f76c25 Garlic Tseng      2016-07-04  341  		return -EINVAL;
1f458d53f76c25 Garlic Tseng      2016-07-04  342  	}
7fe072b4df5d0c Kuninori Morimoto 2018-09-18 @343  	for_each_card_prelinks(card, i, dai_link) {
4ddabddabf410a Kuninori Morimoto 2019-06-06  344  		if (dai_link->platforms->name)
1f458d53f76c25 Garlic Tseng      2016-07-04 @345  			continue;
4ddabddabf410a Kuninori Morimoto 2019-06-06  346  		dai_link->platforms->of_node = platform_node;
1f458d53f76c25 Garlic Tseng      2016-07-04  347  	}
1f458d53f76c25 Garlic Tseng      2016-07-04  348  
1f458d53f76c25 Garlic Tseng      2016-07-04  349  	codec_node = of_parse_phandle(pdev->dev.of_node,
1f458d53f76c25 Garlic Tseng      2016-07-04  350  				      "mediatek,audio-codec", 0);
1f458d53f76c25 Garlic Tseng      2016-07-04  351  	if (!codec_node) {
77e6a5e40aa393 Liu Jing          2024-09-03  352  		dev_err(dev,
1f458d53f76c25 Garlic Tseng      2016-07-04  353  			"Property 'audio-codec' missing or invalid\n");
1f458d53f76c25 Garlic Tseng      2016-07-04  354  		return -EINVAL;
1f458d53f76c25 Garlic Tseng      2016-07-04  355  	}
7fe072b4df5d0c Kuninori Morimoto 2018-09-18 @356  	for_each_card_prelinks(card, i, dai_link) {
4ddabddabf410a Kuninori Morimoto 2019-06-06  357  		if (dai_link->codecs->name)
1f458d53f76c25 Garlic Tseng      2016-07-04  358  			continue;
4ddabddabf410a Kuninori Morimoto 2019-06-06  359  		dai_link->codecs->of_node = codec_node;
1f458d53f76c25 Garlic Tseng      2016-07-04  360  	}
1f458d53f76c25 Garlic Tseng      2016-07-04  361  
1f458d53f76c25 Garlic Tseng      2016-07-04  362  	codec_node_bt_mrg = of_parse_phandle(pdev->dev.of_node,
1f458d53f76c25 Garlic Tseng      2016-07-04  363  					     "mediatek,audio-codec-bt-mrg", 0);
1f458d53f76c25 Garlic Tseng      2016-07-04  364  	if (!codec_node_bt_mrg) {
77e6a5e40aa393 Liu Jing          2024-09-03  365  		dev_err(dev,
1f458d53f76c25 Garlic Tseng      2016-07-04  366  			"Property 'audio-codec-bt-mrg' missing or invalid\n");
1f458d53f76c25 Garlic Tseng      2016-07-04  367  		return -EINVAL;
1f458d53f76c25 Garlic Tseng      2016-07-04  368  	}
4ddabddabf410a Kuninori Morimoto 2019-06-06  369  	mt2701_cs42448_dai_links[DAI_LINK_BE_MRG_BT].codecs->of_node
1f458d53f76c25 Garlic Tseng      2016-07-04  370  							= codec_node_bt_mrg;
1f458d53f76c25 Garlic Tseng      2016-07-04  371  
f66a1b718fbcb7 Kuninori Morimoto 2026-06-01 @372  	ret = snd_soc_card_of_parse_audio_routing(card, "audio-routing");
1f458d53f76c25 Garlic Tseng      2016-07-04  373  	if (ret) {
77e6a5e40aa393 Liu Jing          2024-09-03  374  		dev_err(dev, "failed to parse audio-routing: %d\n", ret);
1f458d53f76c25 Garlic Tseng      2016-07-04  375  		return ret;
1f458d53f76c25 Garlic Tseng      2016-07-04  376  	}
1f458d53f76c25 Garlic Tseng      2016-07-04  377  
654a23724072f3 Linus Walleij     2023-10-06  378  	priv->i2s1_in_mux_sel_1 = devm_gpiod_get_optional(dev, "i2s1-in-sel-gpio1",
654a23724072f3 Linus Walleij     2023-10-06  379  							  GPIOD_OUT_LOW);
654a23724072f3 Linus Walleij     2023-10-06  380  	if (IS_ERR(priv->i2s1_in_mux_sel_1))
654a23724072f3 Linus Walleij     2023-10-06  381  		return dev_err_probe(dev, PTR_ERR(priv->i2s1_in_mux_sel_1),
654a23724072f3 Linus Walleij     2023-10-06  382  				     "error getting mux 1 selector\n");
654a23724072f3 Linus Walleij     2023-10-06  383  
654a23724072f3 Linus Walleij     2023-10-06  384  	priv->i2s1_in_mux_sel_2 = devm_gpiod_get_optional(dev, "i2s1-in-sel-gpio2",
654a23724072f3 Linus Walleij     2023-10-06  385  							  GPIOD_OUT_LOW);
654a23724072f3 Linus Walleij     2023-10-06  386  	if (IS_ERR(priv->i2s1_in_mux_sel_2))
654a23724072f3 Linus Walleij     2023-10-06  387  		return dev_err_probe(dev, PTR_ERR(priv->i2s1_in_mux_sel_2),
654a23724072f3 Linus Walleij     2023-10-06  388  				     "error getting mux 2 selector\n");
1f458d53f76c25 Garlic Tseng      2016-07-04  389  
f66a1b718fbcb7 Kuninori Morimoto 2026-06-01  390  	snd_soc_card_attach_priv(card, priv);
1f458d53f76c25 Garlic Tseng      2016-07-04  391  
ceb4319f163402 Kuninori Morimoto 2026-05-20  392  	ret = devm_snd_soc_card_register(card);
1f458d53f76c25 Garlic Tseng      2016-07-04  393  
1f458d53f76c25 Garlic Tseng      2016-07-04  394  	if (ret)
ceb4319f163402 Kuninori Morimoto 2026-05-20  395  		dev_err(dev, "%s snd_soc_card_register() fail %d\n",
1f458d53f76c25 Garlic Tseng      2016-07-04  396  			__func__, ret);
1f458d53f76c25 Garlic Tseng      2016-07-04  397  	return ret;
1f458d53f76c25 Garlic Tseng      2016-07-04  398  }
1f458d53f76c25 Garlic Tseng      2016-07-04  399  

:::::: The code at line 343 was first introduced by commit
:::::: 7fe072b4df5d0cc832eb758c1eed243c145a2dfc ASoC: add for_each_card_prelinks() macro

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

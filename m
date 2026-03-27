Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0C436EAB9;
	Fri, 27 Mar 2026 19:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774641257; cv=none; b=Fx/jlPebjiscnxtpytjDuoNwMofUO8ZXt5SgIQAybKH7QMYMkd/oJW4v+ZbqJRxGlz5hNdQmYODGU0gsNAGEiTXhjWTaV52UCgqeh6vmpcxYtO7XHUmT9GqWHKns+K3xK1+TqcVnBBkSJXqZdnJT3DXO9kaZtNYrf645tRVQ6eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774641257; c=relaxed/simple;
	bh=bbmtPw9ns1HPBsrh0mrHDA5mDICfVDlH3L8lSxLFzko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=unY/wWfhZdR0wKAerFUpdoKuWoK1rOprvFPXsMHthNS3LyIJqbOMob9Vu8nMslxER38yoRqbgNnoQD1S9OksjzxY00JHNU6pBkrB1HDbGUcELFOMwz2f5H69RREGOxvTVrXEJKipp46hcnpfpmgoLxH90hIQ0i22FRWgFn3hP2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqgZrrm6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqgZrrm6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774641255; x=1806177255;
  h=date:from:to:cc:subject:message-id;
  bh=bbmtPw9ns1HPBsrh0mrHDA5mDICfVDlH3L8lSxLFzko=;
  b=GqgZrrm6TToo6mRDrYo+sv5sRGFA6KXAQR3AwWiUqvM8D4ZHjjHI1+no
   oZE587Wi3DZaeY7WkzJ33D4V96bnsxbKuWdyJAuh2HU/LWlOOzJ0yeupA
   JjkTpnnDw5UayLDS7RuT0Bn5+i5Ksgv0kF9DMG47QEE+6ECbjXjKbAuuf
   9bbYbSYsy04JWgS5kRX/SstvONBnY9TkR/EJ5AuEJjYkKXCWUw8aoHg/M
   WPFJtX9gotcb2bwtKlptTFcgZ9CTN3tf1YvdUmbkktzsQBSZCK0z333j4
   hnCrouVqSzp5CqTG6CyUL1I0ygGtwG0uhfNg5crl8ZZs5w7qwxr9aIR6G
   Q==;
X-CSE-ConnectionGUID: FDZ6k2ZbRU2LbiBmoWDpFw==
X-CSE-MsgGUID: c/1laliuQLmRhQjQAMdMjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74752740"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="74752740"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 12:54:12 -0700
X-CSE-ConnectionGUID: z3BWMMvJRtavz2kjU5/tjg==
X-CSE-MsgGUID: D17ZYDCIQ3uEnVuSFNg+Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="224613601"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Mar 2026 12:54:10 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6DFv-00000000AfR-1qEK;
	Fri, 27 Mar 2026 19:54:07 +0000
Date: Sat, 28 Mar 2026 03:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 101/106]
 sound/soc/pxa/mmp-sspa.c:86:27: error: call to undeclared function
 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202603280309.uvKzax1N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: feccc3fa86242c4532cc238e50998046b7ba39f6 [101/106] ASoC: soc-dai: remove snd_soc_dai_{set/get}_drvdata()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260328/202603280309.uvKzax1N-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280309.uvKzax1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280309.uvKzax1N-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/pxa/mmp-sspa.c:86:27: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      86 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
         |                                  ^
>> sound/soc/pxa/mmp-sspa.c:86:20: error: incompatible integer to pointer conversion initializing 'struct sspa_priv *' with an expression of type 'int' [-Wint-conversion]
      86 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
         |                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:97:27: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      97 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
         |                                  ^
   sound/soc/pxa/mmp-sspa.c:97:20: error: incompatible integer to pointer conversion initializing 'struct sspa_priv *' with an expression of type 'int' [-Wint-conversion]
      97 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
         |                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:109:27: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     109 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
         |                                  ^
   sound/soc/pxa/mmp-sspa.c:109:20: error: incompatible integer to pointer conversion initializing 'struct sspa_priv *' with an expression of type 'int' [-Wint-conversion]
     109 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
         |                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:110:23: error: call to undeclared function 'snd_soc_dai_to_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |         struct device *dev = snd_soc_dai_to_dev(cpu_dai);
         |                              ^
   sound/soc/pxa/mmp-sspa.c:110:23: note: did you mean 'snd_soc_dapm_to_dev'?
   include/sound/soc-dapm.h:643:16: note: 'snd_soc_dapm_to_dev' declared here
     643 | struct device *snd_soc_dapm_to_dev(struct snd_soc_dapm_context *dapm);
         |                ^
   sound/soc/pxa/mmp-sspa.c:110:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     110 |         struct device *dev = snd_soc_dai_to_dev(cpu_dai);
         |                        ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:137:27: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     137 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
         |                                  ^
   sound/soc/pxa/mmp-sspa.c:137:20: error: incompatible integer to pointer conversion initializing 'struct sspa_priv *' with an expression of type 'int' [-Wint-conversion]
     137 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
         |                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:138:23: error: call to undeclared function 'snd_soc_dai_to_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     138 |         struct device *dev = snd_soc_dai_to_dev(cpu_dai);
         |                              ^
   sound/soc/pxa/mmp-sspa.c:138:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     138 |         struct device *dev = snd_soc_dai_to_dev(cpu_dai);
         |                        ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:168:27: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     168 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
         |                                  ^
   sound/soc/pxa/mmp-sspa.c:168:20: error: incompatible integer to pointer conversion initializing 'struct sspa_priv *' with an expression of type 'int' [-Wint-conversion]
     168 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
         |                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:215:27: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     215 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
         |                                  ^
   sound/soc/pxa/mmp-sspa.c:215:20: error: incompatible integer to pointer conversion initializing 'struct sspa_priv *' with an expression of type 'int' [-Wint-conversion]
     215 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
         |                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:216:23: error: call to undeclared function 'snd_soc_dai_to_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     216 |         struct device *dev = snd_soc_dai_to_dev(dai);
         |                              ^
   sound/soc/pxa/mmp-sspa.c:216:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     216 |         struct device *dev = snd_soc_dai_to_dev(dai);
         |                        ^     ~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/pxa/mmp-sspa.c:283:27: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     283 |         struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
         |                                  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:109:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     109 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:109:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     109 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:144:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     144 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:144:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     144 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:232:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     232 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:232:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     232 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:266:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     266 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:266:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     266 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:288:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     288 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:288:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     288 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:305:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     305 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:305:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     305 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:346:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     346 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:346:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     346 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:366:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     366 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:366:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     366 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:386:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     386 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:386:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     386 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:402:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     402 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:185:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     185 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:185:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     185 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> sound/soc/mediatek/mt6797/mt6797-dai-hostless.c:40:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      40 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt6797/mt6797-dai-hostless.c:40:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
      40 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> sound/soc/mediatek/mt6797/mt6797-dai-adda.c:155:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     155 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt6797/mt6797-dai-adda.c:155:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     155 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:121:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     121 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:121:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     121 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:138:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     138 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:138:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     138 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:241:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     241 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:241:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     241 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:266:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     266 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:266:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     266 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:293:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     293 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c:293:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     293 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10 errors generated.
--
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:297:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     297 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:297:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     297 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:310:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     310 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:310:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     310 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:325:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:325:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     325 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:346:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     346 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:346:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     346 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:360:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     360 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:360:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     360 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:374:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     374 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:374:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     374 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:436:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     436 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:436:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     436 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   14 errors generated.
--
>> sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:776:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     776 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:776:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     776 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:836:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     836 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-i2s.c:836:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     836 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.
--
>> sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:468:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     468 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:468:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     468 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:585:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     585 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
   sound/soc/mediatek/mt8183/mt8183-dai-tdm.c:585:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     585 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.
--
>> sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:185:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     185 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:185:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
     185 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> sound/soc/mediatek/mt8183/mt8183-dai-hostless.c:40:29: error: call to undeclared function 'snd_soc_dai_get_drvdata'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      40 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                                    ^
>> sound/soc/mediatek/mt8183/mt8183-dai-hostless.c:40:23: error: incompatible integer to pointer conversion initializing 'struct mtk_base_afe *' with an expression of type 'int' [-Wint-conversion]
      40 |         struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
..


vim +/snd_soc_dai_get_drvdata +86 sound/soc/pxa/mmp-sspa.c

fa375d42f0e531b Zhangfei Gao   2012-06-11  82  
fa375d42f0e531b Zhangfei Gao   2012-06-11  83  static int mmp_sspa_startup(struct snd_pcm_substream *substream,
fa375d42f0e531b Zhangfei Gao   2012-06-11  84  	struct snd_soc_dai *dai)
fa375d42f0e531b Zhangfei Gao   2012-06-11  85  {
3c4e89df3b45348 Lubomir Rintel 2020-05-11 @86  	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
fa375d42f0e531b Zhangfei Gao   2012-06-11  87  
8ecdcac8792b678 Lubomir Rintel 2020-05-11  88  	clk_prepare_enable(sspa->sysclk);
8ecdcac8792b678 Lubomir Rintel 2020-05-11  89  	clk_prepare_enable(sspa->clk);
fa375d42f0e531b Zhangfei Gao   2012-06-11  90  
fa375d42f0e531b Zhangfei Gao   2012-06-11  91  	return 0;
fa375d42f0e531b Zhangfei Gao   2012-06-11  92  }
fa375d42f0e531b Zhangfei Gao   2012-06-11  93  

:::::: The code at line 86 was first introduced by commit
:::::: 3c4e89df3b45348dc0ee01a2ef1be710f7424ff7 ASoC: mmp-sspa: Remove the embedded struct ssp_device

:::::: TO: Lubomir Rintel <lkundrak@v3.sk>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

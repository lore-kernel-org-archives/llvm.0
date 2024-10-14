Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415921514DC;
	Mon, 14 Oct 2024 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895861; cv=none; b=fFwjxkNg0Q0K8ovzGpOTVF4fy9j60S5yLBQupHXv5fYO2xw711EtcxHJeizB2GWmQZexeHutVQ5hmQ/2/G3/zTxAWOh7am1X1NL2NOyM76tZUPX9CU9zsKLpTSyBqMs8FUntGeOBF++Fw5qC6ATvnO3jG9hLYCkqZWyeIM4TYJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895861; c=relaxed/simple;
	bh=hZIvC5VaMoMBi4KsXTmdsWXCnU4FnqfqbQ9kVukmG2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YAROSt60VIGiyX0h8WJBQM6quAyCwEXCdm4WABjbyW+vNd/qcZ0IWULCpnpw0diS8xKDiqsUVlWJ58wktMFSC0zu64bdGzYibe8oLs04jEmtyWtk0cCl9iHz4S8VBARQRdofaSW78hvWA8UusOC9VECuJ3R6czOfVItquvBbO0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ff8y1oX0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ff8y1oX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728895859; x=1760431859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hZIvC5VaMoMBi4KsXTmdsWXCnU4FnqfqbQ9kVukmG2o=;
  b=Ff8y1oX0aGT9qGJhvjTM8t5kuY0+vbpVrJJvaG4tsDGeOzSZeYdRo6tZ
   mMIFQKumkcSVdehoM1ymlJJW8jZBGw5sEVjiT54eb//D6nZLshjfOQTun
   rsGo0auEp+QpzbXMAy8HIjJCToZZvGkPBiWAyjTgnv3NCZm8fHIEhk9W2
   n75hMumvqmVuUe0wgxehU1zqiuygMG5Sdb6qFOv7wcB8KlQVUxoP3b7xy
   RZxjOjkFz/Z044r5wDXEjKfLFznkbcde3q1f3chiuNFdDAsfJgQ5QltZF
   2XHal8mM3ENi8tV2XBLY0dA5tb0ehu2+vHg1K8pkRHlLXnO2BEa1VvXuM
   Q==;
X-CSE-ConnectionGUID: SYKMwbYNQOem2BVyVH65IQ==
X-CSE-MsgGUID: iYYe9KtkRyev6r2F40CPqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39630492"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="39630492"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 01:50:56 -0700
X-CSE-ConnectionGUID: mS50L6kgSnupiuSMyx5sxA==
X-CSE-MsgGUID: hBdxFI4IQ72sxk6KHv/RfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="100844864"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2024 01:50:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Gmz-000F6S-1S;
	Mon, 14 Oct 2024 08:50:53 +0000
Date: Mon, 14 Oct 2024 16:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 9/14] sound/pci/hda/patch_conexant.c:1081:2:
 error: field designator 'name' does not refer to any field in type 'const
 struct hda_quirk'
Message-ID: <202410141648.JOPFB2du-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   0ddf2784d6c29e59409a62b8f32dc5abe56135a4
commit: 1f55e3699fc9ced72400cdca39fe248bf2b288a2 [9/14] ALSA: hda/conexant: Use the new codec SSID matching
config: i386-buildonly-randconfig-003-20241014 (https://download.01.org/0day-ci/archive/20241014/202410141648.JOPFB2du-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141648.JOPFB2du-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141648.JOPFB2du-lkp@intel.com/

Note: the tiwai-sound/for-next HEAD 0ddf2784d6c29e59409a62b8f32dc5abe56135a4 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> sound/pci/hda/patch_conexant.c:1081:2: error: field designator 'name' does not refer to any field in type 'const struct hda_quirk'
    1081 |         HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_local.h:312:51: note: expanded from macro 'HDA_CODEC_QUIRK'
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                         ~^~~~~~~~~~~~~~
   sound/pci/hda/patch_conexant.c:1082:2: error: field designator 'name' does not refer to any field in type 'const struct hda_quirk'
    1082 |         HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_local.h:312:51: note: expanded from macro 'HDA_CODEC_QUIRK'
     312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
         |                                                         ~^~~~~~~~~~~~~~
   2 errors generated.


vim +1081 sound/pci/hda/patch_conexant.c

  1029	
  1030	static const struct hda_quirk cxt5066_fixups[] = {
  1031		SND_PCI_QUIRK(0x1025, 0x0543, "Acer Aspire One 522", CXT_FIXUP_STEREO_DMIC),
  1032		SND_PCI_QUIRK(0x1025, 0x054c, "Acer Aspire 3830TG", CXT_FIXUP_ASPIRE_DMIC),
  1033		SND_PCI_QUIRK(0x1025, 0x054f, "Acer Aspire 4830T", CXT_FIXUP_ASPIRE_DMIC),
  1034		SND_PCI_QUIRK(0x103c, 0x8079, "HP EliteBook 840 G3", CXT_FIXUP_HP_DOCK),
  1035		SND_PCI_QUIRK(0x103c, 0x807C, "HP EliteBook 820 G3", CXT_FIXUP_HP_DOCK),
  1036		SND_PCI_QUIRK(0x103c, 0x80FD, "HP ProBook 640 G2", CXT_FIXUP_HP_DOCK),
  1037		SND_PCI_QUIRK(0x103c, 0x8115, "HP Z1 Gen3", CXT_FIXUP_HP_GATE_MIC),
  1038		SND_PCI_QUIRK(0x103c, 0x814f, "HP ZBook 15u G3", CXT_FIXUP_MUTE_LED_GPIO),
  1039		SND_PCI_QUIRK(0x103c, 0x8174, "HP Spectre x360", CXT_FIXUP_HP_SPECTRE),
  1040		SND_PCI_QUIRK(0x103c, 0x822e, "HP ProBook 440 G4", CXT_FIXUP_MUTE_LED_GPIO),
  1041		SND_PCI_QUIRK(0x103c, 0x828c, "HP EliteBook 840 G4", CXT_FIXUP_HP_DOCK),
  1042		SND_PCI_QUIRK(0x103c, 0x8299, "HP 800 G3 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1043		SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1044		SND_PCI_QUIRK(0x103c, 0x82b4, "HP ProDesk 600 G3", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1045		SND_PCI_QUIRK(0x103c, 0x836e, "HP ProBook 455 G5", CXT_FIXUP_MUTE_LED_GPIO),
  1046		SND_PCI_QUIRK(0x103c, 0x837f, "HP ProBook 470 G5", CXT_FIXUP_MUTE_LED_GPIO),
  1047		SND_PCI_QUIRK(0x103c, 0x83b2, "HP EliteBook 840 G5", CXT_FIXUP_HP_DOCK),
  1048		SND_PCI_QUIRK(0x103c, 0x83b3, "HP EliteBook 830 G5", CXT_FIXUP_HP_DOCK),
  1049		SND_PCI_QUIRK(0x103c, 0x83d3, "HP ProBook 640 G4", CXT_FIXUP_HP_DOCK),
  1050		SND_PCI_QUIRK(0x103c, 0x8402, "HP ProBook 645 G4", CXT_FIXUP_MUTE_LED_GPIO),
  1051		SND_PCI_QUIRK(0x103c, 0x8427, "HP ZBook Studio G5", CXT_FIXUP_HP_ZBOOK_MUTE_LED),
  1052		SND_PCI_QUIRK(0x103c, 0x844f, "HP ZBook Studio G5", CXT_FIXUP_HP_ZBOOK_MUTE_LED),
  1053		SND_PCI_QUIRK(0x103c, 0x8455, "HP Z2 G4", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1054		SND_PCI_QUIRK(0x103c, 0x8456, "HP Z2 G4 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1055		SND_PCI_QUIRK(0x103c, 0x8457, "HP Z2 G4 mini", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1056		SND_PCI_QUIRK(0x103c, 0x8458, "HP Z2 G4 mini premium", CXT_FIXUP_HP_MIC_NO_PRESENCE),
  1057		SND_PCI_QUIRK(0x1043, 0x138d, "Asus", CXT_FIXUP_HEADPHONE_MIC_PIN),
  1058		SND_PCI_QUIRK(0x14f1, 0x0265, "SWS JS201D", CXT_PINCFG_SWS_JS201D),
  1059		SND_PCI_QUIRK(0x152d, 0x0833, "OLPC XO-1.5", CXT_FIXUP_OLPC_XO),
  1060		SND_PCI_QUIRK(0x17aa, 0x20f2, "Lenovo T400", CXT_PINCFG_LENOVO_TP410),
  1061		SND_PCI_QUIRK(0x17aa, 0x215e, "Lenovo T410", CXT_PINCFG_LENOVO_TP410),
  1062		SND_PCI_QUIRK(0x17aa, 0x215f, "Lenovo T510", CXT_PINCFG_LENOVO_TP410),
  1063		SND_PCI_QUIRK(0x17aa, 0x21ce, "Lenovo T420", CXT_PINCFG_LENOVO_TP410),
  1064		SND_PCI_QUIRK(0x17aa, 0x21cf, "Lenovo T520", CXT_PINCFG_LENOVO_TP410),
  1065		SND_PCI_QUIRK(0x17aa, 0x21d2, "Lenovo T420s", CXT_PINCFG_LENOVO_TP410),
  1066		SND_PCI_QUIRK(0x17aa, 0x21da, "Lenovo X220", CXT_PINCFG_LENOVO_TP410),
  1067		SND_PCI_QUIRK(0x17aa, 0x21db, "Lenovo X220-tablet", CXT_PINCFG_LENOVO_TP410),
  1068		SND_PCI_QUIRK(0x17aa, 0x38af, "Lenovo IdeaPad Z560", CXT_FIXUP_MUTE_LED_EAPD),
  1069		SND_PCI_QUIRK(0x17aa, 0x3905, "Lenovo G50-30", CXT_FIXUP_STEREO_DMIC),
  1070		SND_PCI_QUIRK(0x17aa, 0x390b, "Lenovo G50-80", CXT_FIXUP_STEREO_DMIC),
  1071		SND_PCI_QUIRK(0x17aa, 0x3975, "Lenovo U300s", CXT_FIXUP_STEREO_DMIC),
  1072		/* NOTE: we'd need to extend the quirk for 17aa:3977 as the same
  1073		 * PCI SSID is used on multiple Lenovo models
  1074		 */
  1075		SND_PCI_QUIRK(0x17aa, 0x3977, "Lenovo IdeaPad U310", CXT_FIXUP_STEREO_DMIC),
  1076		SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo G50-70", CXT_FIXUP_STEREO_DMIC),
  1077		SND_PCI_QUIRK(0x17aa, 0x397b, "Lenovo S205", CXT_FIXUP_STEREO_DMIC),
  1078		SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", CXT_FIXUP_THINKPAD_ACPI),
  1079		SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
  1080		SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
> 1081		HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
  1082		HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
  1083		{}
  1084	};
  1085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

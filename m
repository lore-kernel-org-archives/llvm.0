Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50875253325;
	Fri, 21 Feb 2025 18:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161091; cv=none; b=rxroS4FmmdbdBPLYCitZi4j1+gphVzK76xtkYsJUYK+qZkkfn30lDMmbkXe3sAPcOZYgZ5QtDlzGtWduOG7O/Wu/yCUTHPw/ESAvk+f0SgxCVuV1vPH+Y+VIdEu8D2sxpyKSqBbPNheaQ170FKX8EmD5cubIXoBTJABOHLvG3uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161091; c=relaxed/simple;
	bh=Dqe6ezB/l37t1OLYwqziI0j2CB0OvPyc0+Jv7bBI2zw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=buB1Q8sSBtBzLDftYFXJ9SvNo43sQ/ylphR2Vf2P2bmdea4AmkEUWlClnYw8wVQ07p+Zo5FchdjqD1BdnCjfDojbBLLpdAgElFCPjzvPDLU0HBpUszYoaXS8RhMobF8R/2e6a13k6rOBV+tI/7VV3lHjOrT7Y4LqX6+6qU5b9YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ro64fLPr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ro64fLPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740161089; x=1771697089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dqe6ezB/l37t1OLYwqziI0j2CB0OvPyc0+Jv7bBI2zw=;
  b=Ro64fLPreWVK9vbDoDmcmp6esbYjd6/5Q+Db7A/wStIUeORY17Zaa4Pw
   4PG3hUXE09d/zuY0vcTauf8HMUQXHJbbl0X5npU7UpCKfLF5OKg7i2hJF
   mjr9hnjtkxySPB+28WzsTUBGs/3jjj3Lpnq7dC5MC10BTd3izc+1pgri1
   0JhPxK3aXYfDp8FXKy/PchodX6Pw7GOiOGLRUerkyA0lD0/Nnlk3olLm3
   El7Ki6UYDr1yzsAQ2YmW58l4aYXmie+/N33HTQZnXP8oufRyihi6MflBk
   aKxzl0iQbOJotm+g29be3SbZPzNCGpncvKjAQnQlGTZy9OTmkiTrBVSGb
   w==;
X-CSE-ConnectionGUID: FtSfQXmSTNqQyKw+NJkCIQ==
X-CSE-MsgGUID: F9VjeHRpQemPtzTL5esIhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41253094"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="41253094"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 10:04:49 -0800
X-CSE-ConnectionGUID: /8fU6gKcTyCyH4Z3oZzw1Q==
X-CSE-MsgGUID: 2F/BwHLGSnewf3wLY366gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="120415940"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Feb 2025 10:04:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlXOG-0005rL-1g;
	Fri, 21 Feb 2025 18:04:44 +0000
Date: Sat, 22 Feb 2025 02:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Livingood <jacklivingood@comcast.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Takashi Iwai <tiwai@suse.de>
Subject: [thesofproject:topic/sof-dev 7769/7771]
 sound/firewire/isight.c:647:2: error: call to undeclared function 'strspy';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202502220137.fyFohYSo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   05477f184fc6188b402a7ccaf6702c479eb169f4
commit: d63fe2848faae2c75ebd805565799a69654b8c1c [7769/7771] ALSA: firewire: isight: changed strcpy to strscpy
config: powerpc64-randconfig-001-20250221 (https://download.01.org/0day-ci/archive/20250222/202502220137.fyFohYSo-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502220137.fyFohYSo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220137.fyFohYSo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/firewire/isight.c:11:
   In file included from include/linux/firewire.h:7:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/firewire/isight.c:647:2: error: call to undeclared function 'strspy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     647 |         strspy(card->mixername, "iSight");
         |         ^
   3 warnings and 1 error generated.


vim +/strspy +647 sound/firewire/isight.c

   612	
   613	static int isight_probe(struct fw_unit *unit,
   614				const struct ieee1394_device_id *id)
   615	{
   616		struct fw_device *fw_dev = fw_parent_device(unit);
   617		struct snd_card *card;
   618		struct isight *isight;
   619		int err;
   620	
   621		err = snd_card_new(&unit->device, -1, NULL, THIS_MODULE,
   622				   sizeof(*isight), &card);
   623		if (err < 0)
   624			return err;
   625	
   626		isight = card->private_data;
   627		isight->card = card;
   628		mutex_init(&isight->mutex);
   629		isight->unit = fw_unit_get(unit);
   630		isight->device = fw_dev;
   631		isight->audio_base = get_unit_base(unit);
   632		if (!isight->audio_base) {
   633			dev_err(&unit->device, "audio unit base not found\n");
   634			err = -ENXIO;
   635			goto error;
   636		}
   637		fw_iso_resources_init(&isight->resources, unit);
   638	
   639		card->private_free = isight_card_free;
   640	
   641		strscpy(card->driver, "iSight");
   642		strscpy(card->shortname, "Apple iSight");
   643		snprintf(card->longname, sizeof(card->longname),
   644			 "Apple iSight (GUID %08x%08x) at %s, S%d",
   645			 fw_dev->config_rom[3], fw_dev->config_rom[4],
   646			 dev_name(&unit->device), 100 << fw_dev->max_speed);
 > 647		strspy(card->mixername, "iSight");
   648	
   649		err = isight_create_pcm(isight);
   650		if (err < 0)
   651			goto error;
   652	
   653		err = isight_create_mixer(isight);
   654		if (err < 0)
   655			goto error;
   656	
   657		err = snd_card_register(card);
   658		if (err < 0)
   659			goto error;
   660	
   661		dev_set_drvdata(&unit->device, isight);
   662	
   663		return 0;
   664	error:
   665		snd_card_free(card);
   666	
   667		mutex_destroy(&isight->mutex);
   668		fw_unit_put(isight->unit);
   669	
   670		return err;
   671	}
   672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

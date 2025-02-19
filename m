Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7FD2AE95;
	Wed, 19 Feb 2025 06:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739947796; cv=none; b=ipDdH3IiKIcVS193TZQd6TgZJe/8WdoeKUyHr4JMKpMXMzKZsSy/b8Inx4Sd22i6yIIUcdaTPF5pDTRPHUchstblVlBZX1p55XxPri30mZMVlSOtj8DU4zz3TmgRtNtzuOodk5tUSs5nOTQZgZ/g2+7T433Br9HykfBicfzq+70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739947796; c=relaxed/simple;
	bh=7Krk71qge0LEXwn6sNemb0UiQ/gW3FDKvxGULGwUycA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=konORxL0GkCfIU6ma8twDrgq0uyAAs69nsyqpIXSMU7T/aEWtQYJvlnKs1+rubiSkBqcozWl7s0WCUcw4wILpwTJrP3hOZKe4kBCfGchROvOVDtJqkzxyYgzFY05Grn9PEaz9QGcvM8j1XHhwQleYxl/n7/PCPtWjJcEr7WjYxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NW5eklWg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NW5eklWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739947795; x=1771483795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Krk71qge0LEXwn6sNemb0UiQ/gW3FDKvxGULGwUycA=;
  b=NW5eklWg8IiLKZYdOodxi/I3LPv556k+k2qtr0Ir85AVtwiKjxSeVo51
   D2OT0VZjvMRVa8ev6ns0SwHbF37EqLrbXvPijgqLf0ZzyRWpRa98Pddcp
   DTJJRPoEIuC5v+1Smn47CHgWqfCzmTosVBqkGij984LJWrVPHvHjo/awb
   8+kgKZsB6SYQf8OlP6IC75MUUlNqT0mJV18L+rGF2kxYHwFM7KMmayRTp
   RuOgHTnBMFEC24AD+W8sVw4j9R3g237TimPuIyP47JFBdo8k1/+7KpQ2K
   I+tg9fDxjRngshKsdgW9XHtLeX02UcQG2oSEF5VqKeMWDpMtnle89XWeL
   Q==;
X-CSE-ConnectionGUID: o9t21f9qTny+N8d+CvsmGw==
X-CSE-MsgGUID: EkvFPHJJTk2nX8SnYevIrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40930093"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="40930093"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 22:49:54 -0800
X-CSE-ConnectionGUID: kl0lAx/dSzaRu65qWmVkMQ==
X-CSE-MsgGUID: /O96zr7eRpSdjpCHByKB3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119826062"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Feb 2025 22:49:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkdu1-0001KF-1i;
	Wed, 19 Feb 2025 06:49:49 +0000
Date: Wed, 19 Feb 2025 14:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Livingood <jacklivingood@comcast.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Takashi Iwai <tiwai@suse.de>
Subject: [thesofproject:topic/sof-dev-rebase 4/76]
 sound/firewire/isight.c:647:2: error: call to undeclared function 'strspy';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202502191455.cX0HILg0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   5ca0718708095df0cc5a98ff9197021467737b3c
commit: 959fde874df9675d3cf934569ac9c0ea36cec285 [4/76] ALSA: firewire: isight: changed strcpy to strscpy
config: powerpc-randconfig-001-20250219 (https://download.01.org/0day-ci/archive/20250219/202502191455.cX0HILg0-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191455.cX0HILg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191455.cX0HILg0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/firewire/isight.c:647:2: error: call to undeclared function 'strspy'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           strspy(card->mixername, "iSight");
           ^
   1 error generated.


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

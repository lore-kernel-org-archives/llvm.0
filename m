Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199631272DC;
	Tue, 26 Mar 2024 02:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711420430; cv=none; b=uNjn29CGtXTaIGK/AjDTmh2yoQ3xoQ/GDjx/1vXIrz7l6URUKnRDwvJ+Kd0XpkMpafgCTU9H9dXnh8mgt1w/Wjn+DXElytz8x2A0HEZdDEfVY4ypnXMP7G+XHOrr7S96pKlMykZTsG38eYD9jpxfSMkK/HJZIDOofQV71C3H1y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711420430; c=relaxed/simple;
	bh=68RJeJf0Oi+45BVTEN5eBWBfXLcqrUCHTjFhvijA73g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avwEqIRPzIj0aAR9sEUJ41ml/1tLczdCdbBcVnas/iqoPv4XhLVFOLZCFej+4MJGr2oA1X3BOQVE8gzzqZWUWyWHpw6lTnV5xqWGmD33IixK/ZY0bK774QVXxoq1xkUj+bV3PMQEk/Hh6QrRuvXZiUO+H4lZQ/HA4iT+Sbom5JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9jKmNp/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9jKmNp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711420428; x=1742956428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=68RJeJf0Oi+45BVTEN5eBWBfXLcqrUCHTjFhvijA73g=;
  b=O9jKmNp/bqmCRSeFBzZu8/M/AsgHgzp7O3Usx9KlsjSn9ke+OTdCq24l
   yQ54nphvsJtajVugZocDv3EEllH62GLhD6TdA1KkDuqQ6MJY4xzYWUrrm
   y6wbq+jYJPNvnKaIHbDkW8xge6qckeaYkzQaXb/yk//kik8x6l4f57gty
   LcItg8HVpH8xGm3la+jrVKZGp3jIDKlIbxYdLE/OIURs8WwFHrDWGG+PE
   iGdu9hXim5duhJMaCwxh5a6devjaTs38OyQTtUD6jUHeFRcHhWOGYgE4S
   dt5n4XULEWdR7nbS/YPOGIF7kztH8FJzDdLq/bKW6JnzTjnIWwcpWoMlr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6665204"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6665204"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 19:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="20377137"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Mar 2024 19:33:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rowdD-000N42-2Y;
	Tue, 26 Mar 2024 02:33:43 +0000
Date: Tue, 26 Mar 2024 10:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileECoqy0 5/6]
 sound/soc/generic/simple-card-utils.c:755:14: error: no member named 'gpio'
 in 'struct snd_soc_jack_gpio'
Message-ID: <202403261005.2Hemu0jm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileECoqy0
head:   3c398a2eb9081a10c34a40701159a34319a35f19
commit: c81737adb6536b26ebf9176179b3551cb33be4c0 [5/6] ASoC: soc-jack: Get rid of legacy GPIO support
config: x86_64-buildonly-randconfig-002-20240325 (https://download.01.org/0day-ci/archive/20240326/202403261005.2Hemu0jm-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261005.2Hemu0jm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261005.2Hemu0jm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/generic/simple-card-utils.c:755:14: error: no member named 'gpio' in 'struct snd_soc_jack_gpio'
     755 |         sjack->gpio.gpio = -ENOENT;
         |         ~~~~~~~~~~~ ^
   1 error generated.


vim +755 sound/soc/generic/simple-card-utils.c

90194281ee8b01 Paul Cercueil     2019-04-26  738  
b5a95c5bf6d695 Kuninori Morimoto 2023-09-11  739  int simple_util_init_jack(struct snd_soc_card *card,
b4b7de99c6da46 Kuninori Morimoto 2023-09-11  740  			  struct simple_util_jack *sjack,
764aafdb985b18 Shengjiu Wang     2020-07-15  741  			  int is_hp, char *prefix,
764aafdb985b18 Shengjiu Wang     2020-07-15  742  			  char *pin)
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  743  {
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  744  	struct device *dev = card->dev;
355beeed9319cf Dmitry Torokhov   2022-09-06  745  	struct gpio_desc *desc;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  746  	char prop[128];
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  747  	char *pin_name;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  748  	char *gpio_name;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  749  	int mask;
355beeed9319cf Dmitry Torokhov   2022-09-06  750  	int error;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  751  
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  752  	if (!prefix)
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  753  		prefix = "";
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  754  
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11 @755  	sjack->gpio.gpio = -ENOENT;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  756  
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  757  	if (is_hp) {
355beeed9319cf Dmitry Torokhov   2022-09-06  758  		snprintf(prop, sizeof(prop), "%shp-det", prefix);
764aafdb985b18 Shengjiu Wang     2020-07-15  759  		pin_name	= pin ? pin : "Headphones";
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  760  		gpio_name	= "Headphone detection";
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  761  		mask		= SND_JACK_HEADPHONE;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  762  	} else {
355beeed9319cf Dmitry Torokhov   2022-09-06  763  		snprintf(prop, sizeof(prop), "%smic-det", prefix);
764aafdb985b18 Shengjiu Wang     2020-07-15  764  		pin_name	= pin ? pin : "Mic Jack";
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  765  		gpio_name	= "Mic detection";
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  766  		mask		= SND_JACK_MICROPHONE;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  767  	}
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  768  
355beeed9319cf Dmitry Torokhov   2022-09-06  769  	desc = gpiod_get_optional(dev, prop, GPIOD_IN);
355beeed9319cf Dmitry Torokhov   2022-09-06  770  	error = PTR_ERR_OR_ZERO(desc);
355beeed9319cf Dmitry Torokhov   2022-09-06  771  	if (error)
355beeed9319cf Dmitry Torokhov   2022-09-06  772  		return error;
355beeed9319cf Dmitry Torokhov   2022-09-06  773  
355beeed9319cf Dmitry Torokhov   2022-09-06  774  	if (desc) {
355beeed9319cf Dmitry Torokhov   2022-09-06  775  		error = gpiod_set_consumer_name(desc, gpio_name);
355beeed9319cf Dmitry Torokhov   2022-09-06  776  		if (error)
355beeed9319cf Dmitry Torokhov   2022-09-06  777  			return error;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  778  
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  779  		sjack->pin.pin		= pin_name;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  780  		sjack->pin.mask		= mask;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  781  
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  782  		sjack->gpio.name	= gpio_name;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  783  		sjack->gpio.report	= mask;
355beeed9319cf Dmitry Torokhov   2022-09-06  784  		sjack->gpio.desc	= desc;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  785  		sjack->gpio.debounce_time = 150;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  786  
19aed2d6cdb72a Akihiko Odaki     2022-04-08  787  		snd_soc_card_jack_new_pins(card, pin_name, mask, &sjack->jack,
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  788  					   &sjack->pin, 1);
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  789  
355beeed9319cf Dmitry Torokhov   2022-09-06  790  		snd_soc_jack_add_gpios(&sjack->jack, 1, &sjack->gpio);
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  791  	}
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  792  
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  793  	return 0;
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  794  }
b5a95c5bf6d695 Kuninori Morimoto 2023-09-11  795  EXPORT_SYMBOL_GPL(simple_util_init_jack);
62c2c9fcac4341 Katsuhiro Suzuki  2018-06-11  796  

:::::: The code at line 755 was first introduced by commit
:::::: 62c2c9fcac4341d306dda4cf400b77e7e124480a ASoC: simple-card-utils: move hp and mic detect gpios from simple-card

:::::: TO: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

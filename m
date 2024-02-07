Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EF0127B50;
	Wed,  7 Feb 2024 21:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707340219; cv=none; b=dwfSs571zz+q31UzXvlznUX19Xh6BfkLhW0BBMQKLkHH4fZ4z3Xaf3V6ygLQBmFvSoMuTDZV6KouCZSuVVLd7hS4q7mwtWeDQxHhk7HIELcntkjRH8fnjiAQiavsQC6tEncU2n9c1EHS8mizsab4pSiaCOeTGfonRmq9q7ZiuOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707340219; c=relaxed/simple;
	bh=YF5W5h5FJ2BTof0Z5hlJe4uKw4I2TVKX3szp6tcd8Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTYwAKH3AHv5YF1uvyORfAW3xA12B4PxLWZJN1yVoZLe7jgJoY0uJ3hvY7cyS0rw4ffEdn5F7qIfyTgHzYMUVQsAJWlH7QCCgP6B/w5k2ZR4M1Oh5WpJHc2w/U/MwQmLIQNEuK+eIwVm7xGBDv0njHIZN4oMN1lf2p+EnZ5X1IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfTcm14d; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfTcm14d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707340218; x=1738876218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YF5W5h5FJ2BTof0Z5hlJe4uKw4I2TVKX3szp6tcd8Yw=;
  b=dfTcm14d0MnxXfyZTlmTbnv9Et8pTJ9vn3J1D4XGMLaVbPmmzaNdKsP6
   4z86bcy0AJ+ns3na8j1Jmnbcod02rUiErh8CD6v5R6uwRDqYPBaMb8O+2
   IIIJZU9KiLSk1V9KUN/B/n1UanXZAs8e3fiY//sx8qev0IublC4om7ZAQ
   3L5lWcmbGMX0Lk4bDQq0HjEZGx42rdw7i+G/AhgnIaXJujXhKw02HIMN1
   vl2nJgU86WxtQEN9ZnuREMNBiul1lQCi82vE+mOzFBT/1ynrCZOxoLePq
   k8tox683sjZ0OrvtYo4upd2LfVmYIHhU51jgQrArJktt3GU3Xlf0F9/iU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4901642"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="4901642"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 13:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1445149"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Feb 2024 13:10:14 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXpBL-00033A-2j;
	Wed, 07 Feb 2024 21:10:11 +0000
Date: Thu, 8 Feb 2024 05:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	=?utf-8?Q?=C5=81ukasz?= Majczak <lma@chromium.org>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 2/3] ASoC: Intel: avs: Add topology parsing support for
 initial config
Message-ID: <202402080403.reu2fMfN-lkp@intel.com>
References: <20240207120946.2140480-3-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207120946.2140480-3-amadeuszx.slawinski@linux.intel.com>

Hi Amadeusz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.8-rc3 next-20240207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amadeusz-S-awi-ski/ASoC-Intel-avs-UAPI-Add-tokens-for-initial-config-feature/20240207-201212
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240207120946.2140480-3-amadeuszx.slawinski%40linux.intel.com
patch subject: [PATCH 2/3] ASoC: Intel: avs: Add topology parsing support for initial config
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240208/202402080403.reu2fMfN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402080403.reu2fMfN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402080403.reu2fMfN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/intel/avs/topology.c:11:
   In file included from include/sound/soc.h:21:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from sound/soc/intel/avs/topology.c:11:
   In file included from include/sound/soc.h:21:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from sound/soc/intel/avs/topology.c:11:
   In file included from include/sound/soc.h:21:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> sound/soc/intel/avs/topology.c:1490:13: warning: parameter 'block_size' set but not used [-Wunused-but-set-parameter]
    1490 |                                            u32 block_size)
         |                                                ^
   13 warnings generated.


vim +/block_size +1490 sound/soc/intel/avs/topology.c

  1487	
  1488	static int avs_tplg_parse_initial_configs(struct snd_soc_component *comp,
  1489						   struct snd_soc_tplg_vendor_array *tuples,
> 1490						   u32 block_size)
  1491	{
  1492		struct avs_soc_component *acomp = to_avs_soc_component(comp);
  1493		struct avs_tplg *tplg = acomp->tplg;
  1494		int ret, i;
  1495	
  1496		/* Parse tuple section telling how many init configs there are. */
  1497		ret = parse_dictionary_header(comp, tuples, (void **)&tplg->init_configs,
  1498					      &tplg->num_init_configs,
  1499					      sizeof(*tplg->init_configs),
  1500					      AVS_TKN_MANIFEST_NUM_INIT_CONFIGS_U32);
  1501		if (ret)
  1502			return ret;
  1503	
  1504		block_size -= le32_to_cpu(tuples->size);
  1505		/* With header parsed, move on to parsing entries. */
  1506		tuples = avs_tplg_vendor_array_next(tuples);
  1507	
  1508		for (i = 0; i < tplg->num_init_configs; i++) {
  1509			struct avs_tplg_init_config *config = &tplg->init_configs[i];
  1510			struct snd_soc_tplg_vendor_array *tmp;
  1511			void *init_config_data;
  1512			u32 esize;
  1513	
  1514			/*
  1515			 * Usually to get section length we search for first token of next group of data,
  1516			 * but in this case we can't as tuples are followed by raw data.
  1517			 */
  1518			tmp = avs_tplg_vendor_array_next(tuples);
  1519			esize = le32_to_cpu(tuples->size) + le32_to_cpu(tmp->size);
  1520	
  1521			ret = parse_dictionary_entries(comp, tuples, esize, config, 1, sizeof(*config),
  1522						       AVS_TKN_MOD_INIT_CONFIG_ID_U32,
  1523						       mod_init_config_parsers,
  1524						       ARRAY_SIZE(mod_init_config_parsers));
  1525	
  1526			block_size -= esize;
  1527	
  1528			/* handle raw data section */
  1529			init_config_data = (void *)tuples + esize;
  1530			esize = config->length;
  1531	
  1532			config->data = devm_kmemdup(comp->card->dev, init_config_data, esize, GFP_KERNEL);
  1533			if (!config->data)
  1534				return -ENOMEM;
  1535	
  1536			tuples = init_config_data + esize;
  1537		}
  1538	
  1539		return 0;
  1540	}
  1541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

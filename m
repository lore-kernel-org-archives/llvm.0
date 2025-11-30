Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3399423645D;
	Sun, 30 Nov 2025 22:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764543132; cv=none; b=I+kJMXMZN6U+k3sHQWqGBA3iLdjBWAN+CAd35xIP8jMEFQOB1WHEgdqRBgk/K2l1errE2yL6e0u+g50gy0CKMNPNaWQNxBEfqQboUpvQjMP89wGr12ORDx+WLpCKTsBiESAdNalu2aHn803nbZ/RNtLA7eCnCkLCzH48COYawJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764543132; c=relaxed/simple;
	bh=7aUFrJnfkFe0Lc0G9D0rN/ypQqphT9ZcKtQqXmz6k0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RVVnBKqKk0rRg8UqtaRfLOFnDAVFsBk/D1NGNZuVL90BB+QAEGvFdNbYc550lR9m29l365/b/OtCq9ZrfCGP/G905sy+O3Bb0Ts40fVae8RRWCUDKefrAqqJ2jHePNkbwW1P7F1uSbFV347yCj/UjHneUIWrqAgOI5/8ASI3pjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjWSG+Ax; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjWSG+Ax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764543129; x=1796079129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7aUFrJnfkFe0Lc0G9D0rN/ypQqphT9ZcKtQqXmz6k0U=;
  b=hjWSG+Ax+QoPzyizARljy3jNjymDDrLhT+mfvy/+zR9NNcOy7GvKkhWU
   LTq8SVJzJO9qdNj0wsNM3Sq+hNnRyJ6AOx4X59uHmX0l46LGl0M2bHOtg
   hVxo1JWD0dNUpuxRICrrHuNwlh3jW7mI+O4UO9U4F4nDWLG+N0PiRnhnB
   Nqv5GN50AMhu6081RDpsApkwZVKQP602Xe20lCT9K/mLLI6XDw4JCZJWM
   bQ3ly4c9JtnHAWVd8Lj116Y4FpXMa6eYkINJk8wz10HER7+vq0ExrOLV+
   qXI5qKY2bMP6OFEBTlckxkzrJvNQBhCpG6FX3bHXfVOrCZEMRdLipdJ06
   g==;
X-CSE-ConnectionGUID: YT8AtwHhSZOc5tTdkNTyYw==
X-CSE-MsgGUID: ySKwrPf6SaO0AbrYHbmpTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="89125152"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="89125152"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 14:52:07 -0800
X-CSE-ConnectionGUID: PElO+8E6SiCu23l+pIT36Q==
X-CSE-MsgGUID: eh6gSMVvSvSJe1nr7IGJRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="198252409"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Nov 2025 14:52:06 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPqGy-000000008Dx-0Bng;
	Sun, 30 Nov 2025 22:52:04 +0000
Date: Mon, 1 Dec 2025 06:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Weinberger <richard@nod.at>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rw-misc:omap_debugfs_v1 2/4] drivers/base/regmap/regmap.c:700:7:
 error: no member named 'debugfs_disable' in 'struct regmap'
Message-ID: <202512010643.wu0PeBNB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git omap_debugfs_v1
head:   f4327f002373895988de39ed7412557eb00f32de
commit: 0faa34f64f7a0f3792e34721e8c807652946f054 [2/4] regmap: Allow disabling debugfs via regmap_config
config: loongarch-randconfig-002-20251201 (https://download.01.org/0day-ci/archive/20251201/202512010643.wu0PeBNB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512010643.wu0PeBNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512010643.wu0PeBNB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/regmap/regmap.c:700:7: error: no member named 'debugfs_disable' in 'struct regmap'
     700 |         map->debugfs_disable = config->debugfs_disable;
         |         ~~~  ^
   1 error generated.


vim +700 drivers/base/regmap/regmap.c

   674	
   675	struct regmap *__regmap_init(struct device *dev,
   676				     const struct regmap_bus *bus,
   677				     void *bus_context,
   678				     const struct regmap_config *config,
   679				     struct lock_class_key *lock_key,
   680				     const char *lock_name)
   681	{
   682		struct regmap *map;
   683		int ret = -EINVAL;
   684		enum regmap_endian reg_endian, val_endian;
   685		int i, j;
   686	
   687		if (!config)
   688			goto err;
   689	
   690		map = kzalloc(sizeof(*map), GFP_KERNEL);
   691		if (map == NULL) {
   692			ret = -ENOMEM;
   693			goto err;
   694		}
   695	
   696		ret = regmap_set_name(map, config);
   697		if (ret)
   698			goto err_map;
   699	
 > 700		map->debugfs_disable = config->debugfs_disable;
   701	
   702		ret = -EINVAL; /* Later error paths rely on this */
   703	
   704		if (config->disable_locking) {
   705			map->lock = map->unlock = regmap_lock_unlock_none;
   706			map->can_sleep = config->can_sleep;
   707			regmap_debugfs_disable(map);
   708		} else if (config->lock && config->unlock) {
   709			map->lock = config->lock;
   710			map->unlock = config->unlock;
   711			map->lock_arg = config->lock_arg;
   712			map->can_sleep = config->can_sleep;
   713		} else if (config->use_hwlock) {
   714			map->hwlock = hwspin_lock_request_specific(config->hwlock_id);
   715			if (!map->hwlock) {
   716				ret = -ENXIO;
   717				goto err_name;
   718			}
   719	
   720			switch (config->hwlock_mode) {
   721			case HWLOCK_IRQSTATE:
   722				map->lock = regmap_lock_hwlock_irqsave;
   723				map->unlock = regmap_unlock_hwlock_irqrestore;
   724				break;
   725			case HWLOCK_IRQ:
   726				map->lock = regmap_lock_hwlock_irq;
   727				map->unlock = regmap_unlock_hwlock_irq;
   728				break;
   729			default:
   730				map->lock = regmap_lock_hwlock;
   731				map->unlock = regmap_unlock_hwlock;
   732				break;
   733			}
   734	
   735			map->lock_arg = map;
   736		} else {
   737			if ((bus && bus->fast_io) ||
   738			    config->fast_io) {
   739				if (config->use_raw_spinlock) {
   740					raw_spin_lock_init(&map->raw_spinlock);
   741					map->lock = regmap_lock_raw_spinlock;
   742					map->unlock = regmap_unlock_raw_spinlock;
   743					lockdep_set_class_and_name(&map->raw_spinlock,
   744								   lock_key, lock_name);
   745				} else {
   746					spin_lock_init(&map->spinlock);
   747					map->lock = regmap_lock_spinlock;
   748					map->unlock = regmap_unlock_spinlock;
   749					lockdep_set_class_and_name(&map->spinlock,
   750								   lock_key, lock_name);
   751				}
   752			} else {
   753				mutex_init(&map->mutex);
   754				map->lock = regmap_lock_mutex;
   755				map->unlock = regmap_unlock_mutex;
   756				map->can_sleep = true;
   757				lockdep_set_class_and_name(&map->mutex,
   758							   lock_key, lock_name);
   759			}
   760			map->lock_arg = map;
   761			map->lock_key = lock_key;
   762		}
   763	
   764		/*
   765		 * When we write in fast-paths with regmap_bulk_write() don't allocate
   766		 * scratch buffers with sleeping allocations.
   767		 */
   768		if ((bus && bus->fast_io) || config->fast_io)
   769			map->alloc_flags = GFP_ATOMIC;
   770		else
   771			map->alloc_flags = GFP_KERNEL;
   772	
   773		map->reg_base = config->reg_base;
   774		map->reg_shift = config->pad_bits % 8;
   775	
   776		map->format.pad_bytes = config->pad_bits / 8;
   777		map->format.reg_shift = config->reg_shift;
   778		map->format.reg_bytes = BITS_TO_BYTES(config->reg_bits);
   779		map->format.val_bytes = BITS_TO_BYTES(config->val_bits);
   780		map->format.buf_size = BITS_TO_BYTES(config->reg_bits + config->val_bits + config->pad_bits);
   781		if (config->reg_stride)
   782			map->reg_stride = config->reg_stride;
   783		else
   784			map->reg_stride = 1;
   785		if (is_power_of_2(map->reg_stride))
   786			map->reg_stride_order = ilog2(map->reg_stride);
   787		else
   788			map->reg_stride_order = -1;
   789		map->use_single_read = config->use_single_read || !(config->read || (bus && bus->read));
   790		map->use_single_write = config->use_single_write || !(config->write || (bus && bus->write));
   791		map->can_multi_write = config->can_multi_write && (config->write || (bus && bus->write));
   792		if (bus) {
   793			map->max_raw_read = bus->max_raw_read;
   794			map->max_raw_write = bus->max_raw_write;
   795		} else if (config->max_raw_read && config->max_raw_write) {
   796			map->max_raw_read = config->max_raw_read;
   797			map->max_raw_write = config->max_raw_write;
   798		}
   799		map->dev = dev;
   800		map->bus = bus;
   801		map->bus_context = bus_context;
   802		map->max_register = config->max_register;
   803		map->max_register_is_set = map->max_register ?: config->max_register_is_0;
   804		map->wr_table = config->wr_table;
   805		map->rd_table = config->rd_table;
   806		map->volatile_table = config->volatile_table;
   807		map->precious_table = config->precious_table;
   808		map->wr_noinc_table = config->wr_noinc_table;
   809		map->rd_noinc_table = config->rd_noinc_table;
   810		map->writeable_reg = config->writeable_reg;
   811		map->readable_reg = config->readable_reg;
   812		map->volatile_reg = config->volatile_reg;
   813		map->precious_reg = config->precious_reg;
   814		map->writeable_noinc_reg = config->writeable_noinc_reg;
   815		map->readable_noinc_reg = config->readable_noinc_reg;
   816		map->cache_type = config->cache_type;
   817	
   818		spin_lock_init(&map->async_lock);
   819		INIT_LIST_HEAD(&map->async_list);
   820		INIT_LIST_HEAD(&map->async_free);
   821		init_waitqueue_head(&map->async_waitq);
   822	
   823		if (config->read_flag_mask ||
   824		    config->write_flag_mask ||
   825		    config->zero_flag_mask) {
   826			map->read_flag_mask = config->read_flag_mask;
   827			map->write_flag_mask = config->write_flag_mask;
   828		} else if (bus) {
   829			map->read_flag_mask = bus->read_flag_mask;
   830		}
   831	
   832		if (config->read && config->write) {
   833			map->reg_read  = _regmap_bus_read;
   834			if (config->reg_update_bits)
   835				map->reg_update_bits = config->reg_update_bits;
   836	
   837			/* Bulk read/write */
   838			map->read = config->read;
   839			map->write = config->write;
   840	
   841			reg_endian = REGMAP_ENDIAN_NATIVE;
   842			val_endian = REGMAP_ENDIAN_NATIVE;
   843		} else if (!bus) {
   844			map->reg_read  = config->reg_read;
   845			map->reg_write = config->reg_write;
   846			map->reg_update_bits = config->reg_update_bits;
   847	
   848			map->defer_caching = false;
   849			goto skip_format_initialization;
   850		} else if (!bus->read || !bus->write) {
   851			map->reg_read = _regmap_bus_reg_read;
   852			map->reg_write = _regmap_bus_reg_write;
   853			map->reg_update_bits = bus->reg_update_bits;
   854	
   855			map->defer_caching = false;
   856			goto skip_format_initialization;
   857		} else {
   858			map->reg_read  = _regmap_bus_read;
   859			map->reg_update_bits = bus->reg_update_bits;
   860			/* Bulk read/write */
   861			map->read = bus->read;
   862			map->write = bus->write;
   863	
   864			reg_endian = regmap_get_reg_endian(bus, config);
   865			val_endian = regmap_get_val_endian(dev, bus, config);
   866		}
   867	
   868		switch (config->reg_bits + map->reg_shift) {
   869		case 2:
   870			switch (config->val_bits) {
   871			case 6:
   872				map->format.format_write = regmap_format_2_6_write;
   873				break;
   874			default:
   875				goto err_hwlock;
   876			}
   877			break;
   878	
   879		case 4:
   880			switch (config->val_bits) {
   881			case 12:
   882				map->format.format_write = regmap_format_4_12_write;
   883				break;
   884			default:
   885				goto err_hwlock;
   886			}
   887			break;
   888	
   889		case 7:
   890			switch (config->val_bits) {
   891			case 9:
   892				map->format.format_write = regmap_format_7_9_write;
   893				break;
   894			case 17:
   895				map->format.format_write = regmap_format_7_17_write;
   896				break;
   897			default:
   898				goto err_hwlock;
   899			}
   900			break;
   901	
   902		case 10:
   903			switch (config->val_bits) {
   904			case 14:
   905				map->format.format_write = regmap_format_10_14_write;
   906				break;
   907			default:
   908				goto err_hwlock;
   909			}
   910			break;
   911	
   912		case 12:
   913			switch (config->val_bits) {
   914			case 20:
   915				map->format.format_write = regmap_format_12_20_write;
   916				break;
   917			default:
   918				goto err_hwlock;
   919			}
   920			break;
   921	
   922		case 8:
   923			map->format.format_reg = regmap_format_8;
   924			break;
   925	
   926		case 16:
   927			switch (reg_endian) {
   928			case REGMAP_ENDIAN_BIG:
   929				map->format.format_reg = regmap_format_16_be;
   930				break;
   931			case REGMAP_ENDIAN_LITTLE:
   932				map->format.format_reg = regmap_format_16_le;
   933				break;
   934			case REGMAP_ENDIAN_NATIVE:
   935				map->format.format_reg = regmap_format_16_native;
   936				break;
   937			default:
   938				goto err_hwlock;
   939			}
   940			break;
   941	
   942		case 24:
   943			switch (reg_endian) {
   944			case REGMAP_ENDIAN_BIG:
   945				map->format.format_reg = regmap_format_24_be;
   946				break;
   947			default:
   948				goto err_hwlock;
   949			}
   950			break;
   951	
   952		case 32:
   953			switch (reg_endian) {
   954			case REGMAP_ENDIAN_BIG:
   955				map->format.format_reg = regmap_format_32_be;
   956				break;
   957			case REGMAP_ENDIAN_LITTLE:
   958				map->format.format_reg = regmap_format_32_le;
   959				break;
   960			case REGMAP_ENDIAN_NATIVE:
   961				map->format.format_reg = regmap_format_32_native;
   962				break;
   963			default:
   964				goto err_hwlock;
   965			}
   966			break;
   967	
   968		default:
   969			goto err_hwlock;
   970		}
   971	
   972		if (val_endian == REGMAP_ENDIAN_NATIVE)
   973			map->format.parse_inplace = regmap_parse_inplace_noop;
   974	
   975		switch (config->val_bits) {
   976		case 8:
   977			map->format.format_val = regmap_format_8;
   978			map->format.parse_val = regmap_parse_8;
   979			map->format.parse_inplace = regmap_parse_inplace_noop;
   980			break;
   981		case 16:
   982			switch (val_endian) {
   983			case REGMAP_ENDIAN_BIG:
   984				map->format.format_val = regmap_format_16_be;
   985				map->format.parse_val = regmap_parse_16_be;
   986				map->format.parse_inplace = regmap_parse_16_be_inplace;
   987				break;
   988			case REGMAP_ENDIAN_LITTLE:
   989				map->format.format_val = regmap_format_16_le;
   990				map->format.parse_val = regmap_parse_16_le;
   991				map->format.parse_inplace = regmap_parse_16_le_inplace;
   992				break;
   993			case REGMAP_ENDIAN_NATIVE:
   994				map->format.format_val = regmap_format_16_native;
   995				map->format.parse_val = regmap_parse_16_native;
   996				break;
   997			default:
   998				goto err_hwlock;
   999			}
  1000			break;
  1001		case 24:
  1002			switch (val_endian) {
  1003			case REGMAP_ENDIAN_BIG:
  1004				map->format.format_val = regmap_format_24_be;
  1005				map->format.parse_val = regmap_parse_24_be;
  1006				break;
  1007			default:
  1008				goto err_hwlock;
  1009			}
  1010			break;
  1011		case 32:
  1012			switch (val_endian) {
  1013			case REGMAP_ENDIAN_BIG:
  1014				map->format.format_val = regmap_format_32_be;
  1015				map->format.parse_val = regmap_parse_32_be;
  1016				map->format.parse_inplace = regmap_parse_32_be_inplace;
  1017				break;
  1018			case REGMAP_ENDIAN_LITTLE:
  1019				map->format.format_val = regmap_format_32_le;
  1020				map->format.parse_val = regmap_parse_32_le;
  1021				map->format.parse_inplace = regmap_parse_32_le_inplace;
  1022				break;
  1023			case REGMAP_ENDIAN_NATIVE:
  1024				map->format.format_val = regmap_format_32_native;
  1025				map->format.parse_val = regmap_parse_32_native;
  1026				break;
  1027			default:
  1028				goto err_hwlock;
  1029			}
  1030			break;
  1031		}
  1032	
  1033		if (map->format.format_write) {
  1034			if ((reg_endian != REGMAP_ENDIAN_BIG) ||
  1035			    (val_endian != REGMAP_ENDIAN_BIG))
  1036				goto err_hwlock;
  1037			map->use_single_write = true;
  1038		}
  1039	
  1040		if (!map->format.format_write &&
  1041		    !(map->format.format_reg && map->format.format_val))
  1042			goto err_hwlock;
  1043	
  1044		map->work_buf = kzalloc(map->format.buf_size, GFP_KERNEL);
  1045		if (map->work_buf == NULL) {
  1046			ret = -ENOMEM;
  1047			goto err_hwlock;
  1048		}
  1049	
  1050		if (map->format.format_write) {
  1051			map->defer_caching = false;
  1052			map->reg_write = _regmap_bus_formatted_write;
  1053		} else if (map->format.format_val) {
  1054			map->defer_caching = true;
  1055			map->reg_write = _regmap_bus_raw_write;
  1056		}
  1057	
  1058	skip_format_initialization:
  1059	
  1060		map->range_tree = RB_ROOT;
  1061		for (i = 0; i < config->num_ranges; i++) {
  1062			const struct regmap_range_cfg *range_cfg = &config->ranges[i];
  1063			struct regmap_range_node *new;
  1064	
  1065			/* Sanity check */
  1066			if (range_cfg->range_max < range_cfg->range_min) {
  1067				dev_err(map->dev, "Invalid range %d: %u < %u\n", i,
  1068					range_cfg->range_max, range_cfg->range_min);
  1069				goto err_range;
  1070			}
  1071	
  1072			if (range_cfg->range_max > map->max_register) {
  1073				dev_err(map->dev, "Invalid range %d: %u > %u\n", i,
  1074					range_cfg->range_max, map->max_register);
  1075				goto err_range;
  1076			}
  1077	
  1078			if (range_cfg->selector_reg > map->max_register) {
  1079				dev_err(map->dev,
  1080					"Invalid range %d: selector out of map\n", i);
  1081				goto err_range;
  1082			}
  1083	
  1084			if (range_cfg->window_len == 0) {
  1085				dev_err(map->dev, "Invalid range %d: window_len 0\n",
  1086					i);
  1087				goto err_range;
  1088			}
  1089	
  1090			/* Make sure, that this register range has no selector
  1091			   or data window within its boundary */
  1092			for (j = 0; j < config->num_ranges; j++) {
  1093				unsigned int sel_reg = config->ranges[j].selector_reg;
  1094				unsigned int win_min = config->ranges[j].window_start;
  1095				unsigned int win_max = win_min +
  1096						       config->ranges[j].window_len - 1;
  1097	
  1098				/* Allow data window inside its own virtual range */
  1099				if (j == i)
  1100					continue;
  1101	
  1102				if (range_cfg->range_min <= sel_reg &&
  1103				    sel_reg <= range_cfg->range_max) {
  1104					dev_err(map->dev,
  1105						"Range %d: selector for %d in window\n",
  1106						i, j);
  1107					goto err_range;
  1108				}
  1109	
  1110				if (!(win_max < range_cfg->range_min ||
  1111				      win_min > range_cfg->range_max)) {
  1112					dev_err(map->dev,
  1113						"Range %d: window for %d in window\n",
  1114						i, j);
  1115					goto err_range;
  1116				}
  1117			}
  1118	
  1119			new = kzalloc(sizeof(*new), GFP_KERNEL);
  1120			if (new == NULL) {
  1121				ret = -ENOMEM;
  1122				goto err_range;
  1123			}
  1124	
  1125			new->map = map;
  1126			new->name = range_cfg->name;
  1127			new->range_min = range_cfg->range_min;
  1128			new->range_max = range_cfg->range_max;
  1129			new->selector_reg = range_cfg->selector_reg;
  1130			new->selector_mask = range_cfg->selector_mask;
  1131			new->selector_shift = range_cfg->selector_shift;
  1132			new->window_start = range_cfg->window_start;
  1133			new->window_len = range_cfg->window_len;
  1134	
  1135			if (!_regmap_range_add(map, new)) {
  1136				dev_err(map->dev, "Failed to add range %d\n", i);
  1137				kfree(new);
  1138				goto err_range;
  1139			}
  1140	
  1141			if (map->selector_work_buf == NULL) {
  1142				map->selector_work_buf =
  1143					kzalloc(map->format.buf_size, GFP_KERNEL);
  1144				if (map->selector_work_buf == NULL) {
  1145					ret = -ENOMEM;
  1146					goto err_range;
  1147				}
  1148			}
  1149		}
  1150	
  1151		ret = regcache_init(map, config);
  1152		if (ret != 0)
  1153			goto err_range;
  1154	
  1155		if (dev) {
  1156			ret = regmap_attach_dev(dev, map, config);
  1157			if (ret != 0)
  1158				goto err_regcache;
  1159		} else {
  1160			regmap_debugfs_init(map);
  1161		}
  1162	
  1163		return map;
  1164	
  1165	err_regcache:
  1166		regcache_exit(map);
  1167	err_range:
  1168		regmap_range_exit(map);
  1169		kfree(map->work_buf);
  1170	err_hwlock:
  1171		if (map->hwlock)
  1172			hwspin_lock_free(map->hwlock);
  1173	err_name:
  1174		kfree_const(map->name);
  1175	err_map:
  1176		kfree(map);
  1177	err:
  1178		if (bus && bus->free_on_exit)
  1179			kfree(bus);
  1180		return ERR_PTR(ret);
  1181	}
  1182	EXPORT_SYMBOL_GPL(__regmap_init);
  1183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

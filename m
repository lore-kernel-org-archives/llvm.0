Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E634A3B796;
	Sat, 30 Nov 2024 01:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732930702; cv=none; b=hDzyEmOZndf7LgCKWMr9CQx60VRYIFbmAYZ7mPnjmt5KfBby05FB8rVlXA2RVoHIn4d5uyqwgUml9Whm0JGy48y0qIa+LKDwb78tHc3xlFs+LlopxfXVnUkPJZZYtRyRyhWNi5x6epHan3cJLHeLp/WarJO8BA+UQsg6SWiIgI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732930702; c=relaxed/simple;
	bh=LXvP6fh7UVGNRiNPpbQbbhHYAFfxDAufX8H8x8MSoOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/lwaoe24WdY29MCPeyG1qsTLDLdTcwhV9VR+qXMJhWUU+r0Vondjy2ixAupxJhUF1zsU7+y5lACYUCKsgQLmhk46wYpz0H21m2EDQF8wWfbjc5lobS5fFou7hyXdSf+Ez12ZGtMS/rB3/0WTxi87P91b2MMR5sM4E41raNQEFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLfV2nPE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLfV2nPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732930700; x=1764466700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LXvP6fh7UVGNRiNPpbQbbhHYAFfxDAufX8H8x8MSoOk=;
  b=ZLfV2nPEjvANk4Tm/oOfy9xjm31YWj+khHxbiLa9Wr+yX4VRoGhPNrk9
   rrmsetj1KFzAHm+fJDqOUfYw48e1QWMhlzsgdxJlC3uEjPuGqhNk+roXv
   8oh1Od38Kq1hp5rvRcIRRpoXHeqynKTB/TI/xsItFpQBdcmxEmoSsLlj/
   2M2KeZXZy/Xhkyy5qdjXLoGqhwZ/2+iW6EhZ7L/FjXBHRUaiYgoB7G+D5
   SvBeO9LCXG1sKPY0wWj6IdBVN94x9E+5nAxa2LcNYrgp/FtCw2Yy6IACS
   QB7TA4bjjG2Z9o1xHBCDJv7qdw5dGNv9yDks35nRgoMP1O/1CtkBVstd5
   A==;
X-CSE-ConnectionGUID: 85cjOZKjQuW2LfBLMWDQVA==
X-CSE-MsgGUID: kS9Y0sfFTQmRnRTJlp8zWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="50564879"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="50564879"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 17:38:17 -0800
X-CSE-ConnectionGUID: KK1eheVhQlWuik8WhTaOeA==
X-CSE-MsgGUID: ppA0ACreR8uEX8pw2x9ojQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="93434310"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Nov 2024 17:38:17 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHCR3-0000qF-3B;
	Sat, 30 Nov 2024 01:38:13 +0000
Date: Sat, 30 Nov 2024 09:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.12.0-scu4-dt-overlay 29/30] drivers/i2c/i2c-core.h:97:49:
 error: must use 'struct' tag to refer to type 'gpio_chip'
Message-ID: <202411300910.FpiIxT3v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.12.0-scu4-dt-overlay
head:   6a87eb702125c86f68c9c466c941b914713c8252
commit: 8aae31b5d95b83a200d406db1b9c0108e36eb5a4 [29/30] i2c: Add node with phandle and entry to __symbols__ for DT overlays
config: i386-buildonly-randconfig-002-20241130 (https://download.01.org/0day-ci/archive/20241130/202411300910.FpiIxT3v-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300910.FpiIxT3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300910.FpiIxT3v-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/i2c-core-base.c:24:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/i2c/i2c-core-base.c:46:
>> drivers/i2c/i2c-core.h:97:49: error: must use 'struct' tag to refer to type 'gpio_chip'
      97 | static inline void of_i2c_make_adapter_dev_node(gpio_chip *chip) {};
         |                                                 ^
         |                                                 struct 
>> drivers/i2c/i2c-core.h:97:20: error: conflicting types for 'of_i2c_make_adapter_dev_node'
      97 | static inline void of_i2c_make_adapter_dev_node(gpio_chip *chip) {};
         |                    ^
   drivers/i2c/i2c-core.h:96:20: note: previous definition is here
      96 | static inline void of_i2c_make_adapter_dev_node(struct i2c_adapter *adap) {};
         |                    ^
>> drivers/i2c/i2c-core-base.c:1797:2: error: call to undeclared function 'of_i2c_remove_adapter_dev_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1797 |         of_i2c_remove_adapter_dev_node(adap);
         |         ^
   drivers/i2c/i2c-core-base.c:1797:2: note: did you mean 'of_i2c_make_adapter_dev_node'?
   drivers/i2c/i2c-core.h:96:20: note: 'of_i2c_make_adapter_dev_node' declared here
      96 | static inline void of_i2c_make_adapter_dev_node(struct i2c_adapter *adap) {};
         |                    ^
   1 warning and 3 errors generated.


vim +97 drivers/i2c/i2c-core.h

    91	
    92	#ifdef CONFIG_OF_DYNAMIC
    93	void of_i2c_remove_adapter_dev_node(struct i2c_adapter *adap);
    94	void of_i2c_make_adapter_dev_node(struct i2c_adapter *adap);
    95	#else
    96	static inline void of_i2c_make_adapter_dev_node(struct i2c_adapter *adap) {};
  > 97	static inline void of_i2c_make_adapter_dev_node(gpio_chip *chip) {};
    98	#endif
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

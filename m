Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCBF1D0DE7;
	Tue,  8 Oct 2024 11:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386937; cv=none; b=f0U3qurL+I5tQDVv9iEOKulRcqWC60Zdv729wr+4JugDwnBtLAaaXxvvwRHkCkLuI05F4T7nSvR2RRUNdNvqL7Hsk7T7vj1W/MLCfHW61bf+UlZ5FmrfVZxrapjNV+HJhJEMBXXHU1VtXzy1aczO0ANXzfoZa8Y3KBoiqne6tr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386937; c=relaxed/simple;
	bh=ASdNE6urP/VjIpbTYbWCJ7NQNb98rqSjWbgoubDrIYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AvpFvqakAjFdmnyDVi62kdpwTWftPGN5K+mCfPRbEbqFFICYKLRJVj2+AbH2Reb9Ij/TKi64vUcNm31mtNGfqH15sL5fo2pMi348To/bmuitdXPDgZ8ELITDjZeQk23TY91kCIqyqWuQFsJ6D/YCLOeZ8Aux/pEv9Qawh/hWkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exHF64FC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exHF64FC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728386935; x=1759922935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ASdNE6urP/VjIpbTYbWCJ7NQNb98rqSjWbgoubDrIYY=;
  b=exHF64FCwRvFxIWkG0koxMaedn1f2OS2BQmpF0WpmojKV2+Do0PZLQgz
   RJWwCC2lreEKOClcT5GJurxg1HG7udjG6Dda+VEdOv0CrjAtCyCZLi94l
   IKIUYYOW/GlHP9Zh3R5EslKij42pUjPTn6LaRJ+y4IDiyB035LEIw4j+x
   sRE9WtffB7q4JreivU3VH5FQAkwIOM1kmcHjNObFgswql2mt3ptSZuKWS
   dRySVhi7wDGG18nEgg3NVYd+877kfvlp2Ejqb9CuYVBbpoFQgRJxSRHrA
   mMP1dljdqHUp2aYO769WAPgPOmotqSGR54PV72kcuuSuDVAlFWD/9owTF
   w==;
X-CSE-ConnectionGUID: 6sIN1y7rRbuguKl3+zzjQA==
X-CSE-MsgGUID: sYvJOmSpRQyej7qHxOQSJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31360834"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="31360834"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 04:28:55 -0700
X-CSE-ConnectionGUID: bfOcPUE+R3ONgPbWBcQfTA==
X-CSE-MsgGUID: 2UqzVUIzTNeMNngVUO7gfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="76224738"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Oct 2024 04:28:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy8OZ-0006JG-0j;
	Tue, 08 Oct 2024 11:28:51 +0000
Date: Tue, 8 Oct 2024 19:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Yu <jack.yu@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 2562/2853] sound/soc/codecs/rt-sdw-common.c:87:
 warning: Function parameter or struct member 'val' not described in
 'rt_sdca_index_update_bits'
Message-ID: <202410081909.i3j7cibD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jack,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33ce24234fca4c083e6685a18b460a18ebb5d5c1
commit: 86ce355c1f9ab943bbe099ea7d0b8a3af2247f65 [2562/2853] ASoC: rt721-sdca: Add RT721 SDCA driver
config: i386-buildonly-randconfig-006-20241008 (https://download.01.org/0day-ci/archive/20241008/202410081909.i3j7cibD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081909.i3j7cibD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081909.i3j7cibD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rt-sdw-common.c:119:3: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     119 |                 ret |= SND_JACK_BTN_2;
         |                 ^~~
   sound/soc/codecs/rt-sdw-common.c:111:9: note: initialize the variable 'ret' to silence this warning
     111 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.
--
>> sound/soc/codecs/rt-sdw-common.c:87: warning: Function parameter or struct member 'val' not described in 'rt_sdca_index_update_bits'
>> sound/soc/codecs/rt-sdw-common.c:87: warning: Excess function parameter 'value' description in 'rt_sdca_index_update_bits'
--
>> sound/soc/codecs/rt721-sdca.c:45:7: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
      45 |                 if (ret < 0)
         |                     ^~~
   sound/soc/codecs/rt721-sdca.c:33:23: note: initialize the variable 'ret' to silence this warning
      33 |         int btn_type = 0, ret;
         |                              ^
         |                               = 0
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +87 sound/soc/codecs/rt-sdw-common.c

bbca8e7050e076 Jack Yu 2024-10-01   71  
bbca8e7050e076 Jack Yu 2024-10-01   72  /**
bbca8e7050e076 Jack Yu 2024-10-01   73   * rt_sdca_index_update_bits - Update value on Realtek defined register.
bbca8e7050e076 Jack Yu 2024-10-01   74   *
bbca8e7050e076 Jack Yu 2024-10-01   75   * @map: map for setting.
bbca8e7050e076 Jack Yu 2024-10-01   76   * @nid: Realtek-defined ID.
bbca8e7050e076 Jack Yu 2024-10-01   77   * @reg: register.
bbca8e7050e076 Jack Yu 2024-10-01   78   * @mask: Bitmask to change
bbca8e7050e076 Jack Yu 2024-10-01   79   * @value: New value for bitmask
bbca8e7050e076 Jack Yu 2024-10-01   80   *
bbca8e7050e076 Jack Yu 2024-10-01   81   * A value of zero will be returned on success, a negative errno will
bbca8e7050e076 Jack Yu 2024-10-01   82   * be returned in error cases.
bbca8e7050e076 Jack Yu 2024-10-01   83   */
bbca8e7050e076 Jack Yu 2024-10-01   84  
bbca8e7050e076 Jack Yu 2024-10-01   85  int rt_sdca_index_update_bits(struct regmap *map,
bbca8e7050e076 Jack Yu 2024-10-01   86  	unsigned int nid, unsigned int reg, unsigned int mask, unsigned int val)
bbca8e7050e076 Jack Yu 2024-10-01  @87  {
bbca8e7050e076 Jack Yu 2024-10-01   88  	unsigned int tmp;
bbca8e7050e076 Jack Yu 2024-10-01   89  	int ret;
bbca8e7050e076 Jack Yu 2024-10-01   90  
bbca8e7050e076 Jack Yu 2024-10-01   91  	ret = rt_sdca_index_read(map, nid, reg, &tmp);
bbca8e7050e076 Jack Yu 2024-10-01   92  	if (ret < 0)
bbca8e7050e076 Jack Yu 2024-10-01   93  		return ret;
bbca8e7050e076 Jack Yu 2024-10-01   94  
bbca8e7050e076 Jack Yu 2024-10-01   95  	set_mask_bits(&tmp, mask, val);
bbca8e7050e076 Jack Yu 2024-10-01   96  	return rt_sdca_index_write(map, nid, reg, tmp);
bbca8e7050e076 Jack Yu 2024-10-01   97  }
bbca8e7050e076 Jack Yu 2024-10-01   98  EXPORT_SYMBOL_GPL(rt_sdca_index_update_bits);
bbca8e7050e076 Jack Yu 2024-10-01   99  
bbca8e7050e076 Jack Yu 2024-10-01  100  /**
bbca8e7050e076 Jack Yu 2024-10-01  101   * rt_sdca_btn_type - Decision of button type.
bbca8e7050e076 Jack Yu 2024-10-01  102   *
bbca8e7050e076 Jack Yu 2024-10-01  103   * @buffer: UMP message buffer.
bbca8e7050e076 Jack Yu 2024-10-01  104   *
bbca8e7050e076 Jack Yu 2024-10-01  105   * A button type will be returned regarding to buffer,
bbca8e7050e076 Jack Yu 2024-10-01  106   * it returns zero if buffer cannot be recognized.
bbca8e7050e076 Jack Yu 2024-10-01  107   */
bbca8e7050e076 Jack Yu 2024-10-01  108  int rt_sdca_btn_type(unsigned char *buffer)
bbca8e7050e076 Jack Yu 2024-10-01  109  {
bbca8e7050e076 Jack Yu 2024-10-01  110  	u8 btn_type = 0;
bbca8e7050e076 Jack Yu 2024-10-01  111  	int ret;
bbca8e7050e076 Jack Yu 2024-10-01  112  
bbca8e7050e076 Jack Yu 2024-10-01  113  	btn_type |= buffer[0] & 0xf;
bbca8e7050e076 Jack Yu 2024-10-01  114  	btn_type |= (buffer[0] >> 4) & 0xf;
bbca8e7050e076 Jack Yu 2024-10-01  115  	btn_type |= buffer[1] & 0xf;
bbca8e7050e076 Jack Yu 2024-10-01  116  	btn_type |= (buffer[1] >> 4) & 0xf;
bbca8e7050e076 Jack Yu 2024-10-01  117  
bbca8e7050e076 Jack Yu 2024-10-01  118  	if (btn_type & BIT(0))
bbca8e7050e076 Jack Yu 2024-10-01 @119  		ret |= SND_JACK_BTN_2;
bbca8e7050e076 Jack Yu 2024-10-01  120  	if (btn_type & BIT(1))
bbca8e7050e076 Jack Yu 2024-10-01  121  		ret |= SND_JACK_BTN_3;
bbca8e7050e076 Jack Yu 2024-10-01  122  	if (btn_type & BIT(2))
bbca8e7050e076 Jack Yu 2024-10-01  123  		ret |= SND_JACK_BTN_0;
bbca8e7050e076 Jack Yu 2024-10-01  124  	if (btn_type & BIT(3))
bbca8e7050e076 Jack Yu 2024-10-01  125  		ret |= SND_JACK_BTN_1;
bbca8e7050e076 Jack Yu 2024-10-01  126  
bbca8e7050e076 Jack Yu 2024-10-01  127  	return ret;
bbca8e7050e076 Jack Yu 2024-10-01  128  }
bbca8e7050e076 Jack Yu 2024-10-01  129  EXPORT_SYMBOL_GPL(rt_sdca_btn_type);
bbca8e7050e076 Jack Yu 2024-10-01  130  

:::::: The code at line 87 was first introduced by commit
:::::: bbca8e7050e0769d46eb775082d1926db05e7dac ASoC: rt-sdw-common: Common functions for Realtek soundwire driver

:::::: TO: Jack Yu <jack.yu@realtek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

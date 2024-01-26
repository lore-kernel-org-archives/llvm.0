Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1202904;
	Fri, 26 Jan 2024 10:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706265778; cv=none; b=A2/u5pXZJFyVQy8QY6L3PnG8EJJqw3rQFKJyg8o7Tqcxd1Da8vQd/MPWslj+ImOPzk8CmiGeXM5Iubnq1gBEIa9zpkzAm71A1T5ZEeto4iW3G+kLKHm4N4iRBliUBucuwHEsFFduHvchJMYm2WT9vrLfC253dx/zZykiziobMs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706265778; c=relaxed/simple;
	bh=iTRmVcaQdapINCCxgbykdtcbm7oTAo3IWNoWd+USyYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7cpBAwefGsA43KZ/kq3CN8Gx7TT5muZ8Sh6j1lyQh1iPazC2o/dgpPb7Mn6P0TY2co4YbL3FvhuttKaMVyVAepL7fmzvZ9+Vycem7HBOp/ikg2eioBv7tch2ti3/A2+UzOm7N0ih/Rjg9hOwTwt4v2IA8BbqBtWx2aNbUOvHng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMMn8Msh; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMMn8Msh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706265776; x=1737801776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTRmVcaQdapINCCxgbykdtcbm7oTAo3IWNoWd+USyYg=;
  b=mMMn8MshI99erTGTmZH6T0JkBVNHH3M5oE9mE9aTGN6RM2BzOGr4IjB4
   jyn3SItDDqx60R5FqTFzHBH5ESYQGythinBR7b96L4zuFhDO8ObOPZYGF
   QyKPZi6w/kxzeJ/JoVXf3yagB0ZyD84sDkCAUQN+/y74/AVrwY2vF0IvB
   hVzeNFj9TBcBLIx4Ky2/hvvz6GKf5DcrsjFjWzWVTp6tZB8Rh8c02qliW
   AGAaxdCjIlpWRHaQl3xUdGz0fpyfth62GDmMbWL3vzAl6udewnL7hETVw
   XcNh0jfCZfWH/BAPCUCUXEqCraZzmt8of/xPKPXEse6MOi77RnR0sRDZF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="392871037"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="392871037"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 02:42:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="787062630"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="787062630"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Jan 2024 02:42:54 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTJfg-0000w2-0P;
	Fri, 26 Jan 2024 10:42:52 +0000
Date: Fri, 26 Jan 2024 18:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Reichel <sre@kernel.org>
Subject: [sre-misc:rk3588 33/46] ld.lld: error: undefined symbol:
 devm_clk_register
Message-ID: <202401261842.E4ci98Jz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   ccfac401eae6ce8187bbb09d1674c26f51d055f4
commit: fd161b846e32fb6702d8bea93b39f768aeb6c576 [33/46] [WIP] drm/rockchip: vop2: Improve display modes handling on rk3588
config: i386-buildonly-randconfig-002-20240126 (https://download.01.org/0day-ci/archive/20240126/202401261842.E4ci98Jz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261842.E4ci98Jz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261842.E4ci98Jz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_clk_register
   >>> referenced by rockchip_drm_vop2.c
   >>>               drivers/gpu/drm/rockchip/rockchip_drm_vop2.o:(vop2_clk_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: clk_hw_get_name
   >>> referenced by rockchip_drm_vop2.c
   >>>               drivers/gpu/drm/rockchip/rockchip_drm_vop2.o:(vop2_crtc_atomic_enable) in archive vmlinux.a
   >>> referenced by rockchip_drm_vop2.c
   >>>               drivers/gpu/drm/rockchip/rockchip_drm_vop2.o:(vop2_crtc_atomic_enable) in archive vmlinux.a
   >>> referenced by rockchip_drm_vop2.c
   >>>               drivers/gpu/drm/rockchip/rockchip_drm_vop2.o:(vop2_crtc_atomic_enable) in archive vmlinux.a
   >>> referenced 5 more times
--
>> ld.lld: error: undefined symbol: clk_hw_get_flags
   >>> referenced by rockchip_drm_vop2.c
   >>>               drivers/gpu/drm/rockchip/rockchip_drm_vop2.o:(vop2_clk_div_round_rate) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __clk_mux_determine_rate
   >>> referenced by rockchip_drm_vop2.c
   >>>               drivers/gpu/drm/rockchip/rockchip_drm_vop2.o:(vop2_clk_mux_determine_rate) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

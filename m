Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9288730498D;
	Wed, 29 Oct 2025 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725363; cv=none; b=GKSYMHpIOjSneWYT0vhxnhyK8llql4mzAxzLKPPcjBqx650hAKBJY1BBE78pam0phew6TNkUuxTdvXI2sChQrWEklDw4C/zGudhwkUw+V62xaOoFhQLmYsOyeK7DNAOug4xox/b5IJMaitvqa6TaQXjVzVqFmvW87cZJDd+htAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725363; c=relaxed/simple;
	bh=LWeaWTedpEeWTWZV2g54XuQjNbnNUeTvGYco+dln7Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SRF74tHMbxv8VsaanpcuT+FXshyx5eQC1nrH240x9wKHIxl4+V8ALqL0uk10/K0wx2+DqNPW4RgOh/m5wYL3bVL7ZwoKxjMObriPl2sApkGOJoJLm4Xx9/ShvtyPfHATAOd2agJ5+DJkGzjk4g1i5RwQFCD33DhMc1PNcwv88Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RttfSgrt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RttfSgrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761725361; x=1793261361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LWeaWTedpEeWTWZV2g54XuQjNbnNUeTvGYco+dln7Vw=;
  b=RttfSgrt4ArOYTSz4BnobN5qQlTwYa8yvoZvWFDNUY9RuDkUBVrG/3j7
   sXs2sRQrDNA79w+hJacx/w8TG3r/dL5bpVSG9t2qLfWPYjJfB4q2IIgHH
   gwBCXbEE9pi2YXK9r2B9bwHplYaauwhNm7ZNowfTWVC+02i4qHGpoMn6x
   fyGiOz4KbYpocGv0g8igIBVNrflD8fH0Fzy8mF/g6z9+qucqMqMBL2/4r
   s3da7Utl1xQA/5Q3t6nVPlJ3w1SRs3NNBcVvLZcLKWU8VP74SE8a1Hy/e
   wA8wIZIx1OiLbtT0N22qRrZofjAFHz9A3YCeQqKSTIAuJxvv/aMJzPKHL
   A==;
X-CSE-ConnectionGUID: wOKpZXUIQ4OMbFE3V/n4/w==
X-CSE-MsgGUID: y9LAcO7SRJ2UoxLaflCY9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67702247"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="67702247"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 01:09:21 -0700
X-CSE-ConnectionGUID: 69GIjsKURtmZR+eNCan9yw==
X-CSE-MsgGUID: wWJkDYIhSVWIaTXpX+5zXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185222492"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 Oct 2025 01:09:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE1F6-000KNh-30;
	Wed, 29 Oct 2025 08:09:16 +0000
Date: Wed, 29 Oct 2025 16:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 3298/4731]
 include/linux/pinctrl/pinconf-generic.h:235:undefined reference to
 `pinconf_generic_dt_node_to_map'
Message-ID: <202510291650.TFCWQxkj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: 38cf9d6413142290316776c80f19eb92a4e19a9f [3298/4731] pinctrl: add pic64gx "gpio2" pinmux driver
config: um-randconfig-001-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291650.TFCWQxkj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291650.TFCWQxkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291650.TFCWQxkj-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pinconf_generic_dt_node_to_map_all':
>> include/linux/pinctrl/pinconf-generic.h:235:(.ltext+0x4dd): undefined reference to `pinconf_generic_dt_node_to_map'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +235 include/linux/pinctrl/pinconf-generic.h

0d74d4a161c9f9 Linus Walleij   2013-08-15  226  
e5530adc17a79f Andy Shevchenko 2022-10-07  227  static inline int pinconf_generic_dt_node_to_map_all(struct pinctrl_dev *pctldev,
e5530adc17a79f Andy Shevchenko 2022-10-07  228  		struct device_node *np_config, struct pinctrl_map **map,
e5530adc17a79f Andy Shevchenko 2022-10-07  229  		unsigned *num_maps)
31c89c95966719 Soren Brinkmann 2015-01-09  230  {
31c89c95966719 Soren Brinkmann 2015-01-09  231  	/*
31c89c95966719 Soren Brinkmann 2015-01-09  232  	 * passing the type as PIN_MAP_TYPE_INVALID causes the underlying parser
31c89c95966719 Soren Brinkmann 2015-01-09  233  	 * to infer the map type from the DT properties used.
31c89c95966719 Soren Brinkmann 2015-01-09  234  	 */
31c89c95966719 Soren Brinkmann 2015-01-09 @235  	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
31c89c95966719 Soren Brinkmann 2015-01-09  236  			PIN_MAP_TYPE_INVALID);
31c89c95966719 Soren Brinkmann 2015-01-09  237  }
394349f7789fdf Linus Walleij   2011-11-24  238  

:::::: The code at line 235 was first introduced by commit
:::::: 31c89c959667194350f496947b576c149503ce98 pinctrl: pinconf-generic: Infer map type from DT property

:::::: TO: Soren Brinkmann <soren.brinkmann@xilinx.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

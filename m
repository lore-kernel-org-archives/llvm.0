Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8DC246BAA;
	Sun, 28 Sep 2025 05:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759037664; cv=none; b=ayl4VpbBtc5G114xuVnbOO0LinNt+KYsJfVMALBjOrV6qedUKsX95AwIIG5PTK9xwKILvumCiI0Lg4N2jnQv7o+gxB20weq1v04WyM9mua6gzA7BXXU/BazG4D+8DQymaOOf9y7QCdjurVaXFCNIol04+kvHp8naeOpGRrR/jsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759037664; c=relaxed/simple;
	bh=xakyuO/1hDdekWWshDWBVaa367ilvRNGjQcMO4Ul1w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iozmYRRLMwPuyFCuP+KdcEC5DIPsgvDJraoY2rInjnb9Caj0jHU2s/bIE94dpA+oHN3TFN+B8m0ccahVGVekgr+zskWo06ROk0T//NBh2dstQARmdZm8MsiwfTX4PxlUa0h2z8rclyqa3BpIQIHOP+rH8CTHoy3xFV7xt9Y4n3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8AeE8Vk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8AeE8Vk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759037663; x=1790573663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xakyuO/1hDdekWWshDWBVaa367ilvRNGjQcMO4Ul1w4=;
  b=n8AeE8VkNkehRpuDeTQnpp0NZ/a6VDzjIp2QgtchZze3RTKI3vHsw9ze
   9eJT4ksRnLwIScD4F/mG/j2gqV/ecQCmCeBsOOPksmn4+2vDj+qYi9Z4Z
   ho3AP+epg0yu9ffm94Ej41uOm5CLyaA9awuxKEzE6U9RvlpTIU03XwFJo
   /HtgCi714aN/pnC+zNRxSV99l1EVOumxcnk4YcjMm05geNE7LrtFOvVbl
   kzhpG9QAEUCRpxnBBfCfo78Vv/p5nZdZ6R9P5bdbeiyNhcUlqf7JrHC+4
   oWq7JzXgpiDEV3V6UR1S78fz2auA0G2qtHPYFGLAoMOj4i4RQgBNZMF74
   A==;
X-CSE-ConnectionGUID: 4ERXqbB/RnO4DFlcsNUzEA==
X-CSE-MsgGUID: FCKjCtoTTlaGRNVsr6ZOaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="71561436"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="71561436"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 22:34:23 -0700
X-CSE-ConnectionGUID: PVChTyzrSFauydPISQQPkA==
X-CSE-MsgGUID: v9k4s4GlTayhLAk+KsPTXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="215083808"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Sep 2025 22:34:21 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2k37-0007a7-1O;
	Sun, 28 Sep 2025 05:34:17 +0000
Date: Sun, 28 Sep 2025 13:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make24@iscas.ac.cn>, syniurge@gmail.com,
	shyam-sundar.s-k@amd.com, andi.shyti@kernel.org, wsa@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: fix reference leak in MP2 PCI device
Message-ID: <202509281317.3OLDoUnB-lkp@intel.com>
References: <20250927105729.19164-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927105729.19164-1-make24@iscas.ac.cn>

Hi Ma,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.17-rc7 next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/i2c-fix-reference-leak-in-MP2-PCI-device/20250927-190047
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250927105729.19164-1-make24%40iscas.ac.cn
patch subject: [PATCH] i2c: fix reference leak in MP2 PCI device
config: i386-randconfig-011-20250928 (https://download.01.org/0day-ci/archive/20250928/202509281317.3OLDoUnB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509281317.3OLDoUnB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509281317.3OLDoUnB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-amd-mp2-pci.c:467:2: error: use of undeclared identifier 'mp2_dev'
     467 |         mp2_dev = (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
         |         ^
   drivers/i2c/busses/i2c-amd-mp2-pci.c:469:9: error: use of undeclared identifier 'mp2_dev'; did you mean 'pci_dev'?
     469 |         return mp2_dev;
         |                ^~~~~~~
         |                pci_dev
   drivers/i2c/busses/i2c-amd-mp2-pci.c:460:18: note: 'pci_dev' declared here
     460 |         struct pci_dev *pci_dev;
         |                         ^
>> drivers/i2c/busses/i2c-amd-mp2-pci.c:469:9: error: incompatible pointer types returning 'struct pci_dev *' from a function with result type 'struct amd_mp2_dev *' [-Werror,-Wincompatible-pointer-types]
     469 |         return mp2_dev;
         |                ^~~~~~~
   3 errors generated.


vim +/mp2_dev +467 drivers/i2c/busses/i2c-amd-mp2-pci.c

   456	
   457	struct amd_mp2_dev *amd_mp2_find_device(void)
   458	{
   459		struct device *dev;
   460		struct pci_dev *pci_dev;
   461	
   462		dev = driver_find_next_device(&amd_mp2_pci_driver.driver, NULL);
   463		if (!dev)
   464			return NULL;
   465	
   466		pci_dev = to_pci_dev(dev);
 > 467		mp2_dev = (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
   468		put_device(dev);
 > 469		return mp2_dev;
   470	}
   471	EXPORT_SYMBOL_GPL(amd_mp2_find_device);
   472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

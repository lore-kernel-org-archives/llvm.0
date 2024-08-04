Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7A7F8;
	Sun,  4 Aug 2024 01:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722735175; cv=none; b=mKN5pPVM6lAjrgBc9TOx3VcK9jzIGZP+JaWypi6lVjuGKeEubiO4OimcjmApCxkEecF6HXkliXr0QqWQQnhefks68c9yv2NX4/XSt7hsdtzke1sa4PVAcIL58ILfiQaIf6ZGNRvp/8o9XOvT30RXGYi6t26a9z/c+rg23ULJu24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722735175; c=relaxed/simple;
	bh=4QSxjevKixayOPdeKTw/VDQeEuF+l+sxHOMlV0Wxg6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7fkwKL2tyGdhpT+adIIkO/u2v66OBbuhYumnTiXCw6wiqk+mp04IOhB9BCIidbCeit0sPcjyS7aGRoc5XK2IfuSFKg79lXBzRrZwQbh8iDyBrkOyqYiseNJX6t6bQM+jhVCScV2gcKxPRDG9q75ih7oQsZqH5SM2Ou5KMUiQOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3BU+F3I; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3BU+F3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722735174; x=1754271174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4QSxjevKixayOPdeKTw/VDQeEuF+l+sxHOMlV0Wxg6s=;
  b=a3BU+F3IULbyPn2aQPlEBivKRNlIELh1x2+F27m+0ys7gw+snDWr6iO7
   dqCR3lt/GUpHoSEEwc9IiJQCQ4RTPh2XXKSml3x0tHlttCLX0PBYrsFxh
   gk6Po5u03O4aJjpisyI7Epw/PBNaRV6ySQ4/mpAW7WmaYSb0WW9oBshec
   r8Eezvwb5rXMRF7ZujqWLSqkhdG0xj6Lt5nODs/RZXckr3VeLQInKRlKP
   i6GwUE09VFb8Ipbr0Mm5uwTbYPQZsm6bRRdkPm0z56XWIbComHSzOE1Yq
   Hd8oguZhuYnGqx12C7eOLoD/kXhx78bHydA19SxG2ANhIHDNUb/I/9FO7
   w==;
X-CSE-ConnectionGUID: 0onNtjJfThqJXvXpr7WiNg==
X-CSE-MsgGUID: zgMprUkOSJyovUjbW/HXzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="31376696"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="31376696"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 18:32:42 -0700
X-CSE-ConnectionGUID: LQp/GfZSSaKxZSSr+uAexg==
X-CSE-MsgGUID: iRT8bFi5SHu2yoWfyWL2Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="55752962"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Aug 2024 18:32:40 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saQ6w-00013i-0T;
	Sun, 04 Aug 2024 01:32:38 +0000
Date: Sun, 4 Aug 2024 09:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 1090/1093]
 drivers/clk/idt/clk-idt8t49n24x.c:631:11: error: incompatible function
 pointer types initializing 'int (*)(struct i2c_client *)' with an expression
 of type 'int (struct i2c_client *, const struct i2c_device_id *)'
Message-ID: <202408040958.Sxhrb7X9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   868286d51b5753a66ab89c1c899510c6047b998d
commit: 7cf22576ec2e441f1e90cc58d57eefad7698bf42 [1090/1093] Revert "Revert "clk: Add ccf driver for IDT 8T49N24x UFT""
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240804/202408040958.Sxhrb7X9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040958.Sxhrb7X9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040958.Sxhrb7X9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/idt/clk-idt8t49n24x.c:631:11: error: incompatible function pointer types initializing 'int (*)(struct i2c_client *)' with an expression of type 'int (struct i2c_client *, const struct i2c_device_id *)' [-Wincompatible-function-pointer-types]
     631 |         .probe = idt24x_probe,
         |                  ^~~~~~~~~~~~
   1 error generated.


vim +631 drivers/clk/idt/clk-idt8t49n24x.c

   625	
   626	static struct i2c_driver idt24x_driver = {
   627		.driver = {
   628			.name = DRV_NAME,
   629			.of_match_table = idt24x_of_match,
   630		},
 > 631		.probe = idt24x_probe,
   632		.remove = idt24x_remove,
   633		.id_table = idt24x_id,
   634	};
   635	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

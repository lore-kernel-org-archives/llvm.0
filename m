Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F45450EE;
	Mon, 12 May 2025 01:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747014424; cv=none; b=m0pOIRdEvnAfUSdhdKbedTiUvHz5JoO6nzjV6+wX4Kr0UlDlwK/AwRdo9S9xklRzodDsFlhDnSjbZ4ky02Shlo6u+Uogr3rmeLERmdPsTVU8AtV3hRrb2srSpgLgYM577dV7bdrJrcbSRE5fy5Sdb4hq6la1Hi6torGhyChkZOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747014424; c=relaxed/simple;
	bh=20P6A1YCGGeObHMQRWsqm8v9N4RtWf+f6yg4gYvejSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JoU5olEyHYX+9/8OilQJau9OWf5WRQwR1Qs1hkEn9D0YqrACY/CVIst55RKBoduNE+ikvoUn8cFm/HhaP5QqMKoGdyMHWUavD+fX70UaCOONw4Bt4GvdtR06T270LxzdAg+xMXLR+CWVJnvRIyin12QXcFj0/+CKgKURmioZIBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/VdQ4cO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/VdQ4cO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747014423; x=1778550423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=20P6A1YCGGeObHMQRWsqm8v9N4RtWf+f6yg4gYvejSE=;
  b=W/VdQ4cO/0A05RyapxHvDrLX4exkcWJC/4U3tx8J1kjfUtIXxoOOxTVS
   p09oWlorO0JaUi2Ib7FwdJ2hPWbLcHXDMZzoWfTncxDSJKmeJeM/vXv9c
   c1uz8m1dKdgD1pjzEHc4Aa6UG+9NTga5bgkGdsyAc8tC9utR22ngenWiL
   +kP4xMVBXdV1tRR0H+yO0DumCSvtjY8e3sR7ze3NXOMvnMki9u5YBGHLZ
   H8vy5+tBheETwpzLaGXFpuT8mna+g2akEGhcxmwfWtLg70E62jeTRwKKM
   nhHKwPcBTQaGI4dPddD05NXwbfKSjV4WmOrmlgIUyPtSEr2vPH0fDthgb
   w==;
X-CSE-ConnectionGUID: 6o3om8RATOuTWBrcYMIn+w==
X-CSE-MsgGUID: lrs4fIYIS8OoId9qVozJEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="36424438"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="36424438"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 18:47:01 -0700
X-CSE-ConnectionGUID: 98112qIyTHGLU5OEod88cQ==
X-CSE-MsgGUID: esP2Cxh7QvWRxjfkalfVgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="160478521"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 May 2025 18:46:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEIF0-000E6d-2E;
	Mon, 12 May 2025 01:46:02 +0000
Date: Mon, 12 May 2025 09:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: Suma Hegde <suma.hegde@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 94/99]
 drivers/platform/x86/amd/hsmp/hsmp.h:70:5: warning: no previous prototype
 for function 'hsmp_create_sensor'
Message-ID: <202505120930.5xrE7jfc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   d5251eef71bab8bd0b9ea3fe0005ad3d2553c3bb
commit: 8957cb9cfa76f95aa05b1da514de9b82f04b5a07 [94/99] platform/x86/amd/hsmp: Report power via hwmon sensors
config: i386-buildonly-randconfig-006-20250512 (https://download.01.org/0day-ci/archive/20250512/202505120930.5xrE7jfc-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505120930.5xrE7jfc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505120930.5xrE7jfc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/platform/x86/amd/hsmp/plat.c:24:
>> drivers/platform/x86/amd/hsmp/hsmp.h:70:5: warning: no previous prototype for function 'hsmp_create_sensor' [-Wmissing-prototypes]
      70 | int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
         |     ^
   drivers/platform/x86/amd/hsmp/hsmp.h:70:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      70 | int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
         | ^
         | static 
   1 warning generated.


vim +/hsmp_create_sensor +70 drivers/platform/x86/amd/hsmp/hsmp.h

    58	
    59	int hsmp_cache_proto_ver(u16 sock_ind);
    60	int hsmp_test(u16 sock_ind, u32 value);
    61	long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
    62	void hsmp_misc_deregister(void);
    63	int hsmp_misc_register(struct device *dev);
    64	int hsmp_get_tbl_dram_base(u16 sock_ind);
    65	ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
    66	struct hsmp_plat_device *get_hsmp_pdev(void);
    67	#if IS_REACHABLE(CONFIG_HWMON)
    68	int hsmp_create_sensor(struct device *dev, u16 sock_ind);
    69	#else
  > 70	int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5651C30;
	Sat, 20 Jan 2024 02:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705716148; cv=none; b=eEc2LAGeClgbAx9/to4Gg/cUM7aRdaOInBROafKArnheIjiOjJf9Vd/X25qKCJ5JQNAyDAlBS1vS77t/t0YuuvgVottJqozkBjlFS3+mgdawOc6DWz+nzVnp0Qp5r2HsOBIxpW8LhsDFj2EG/UYAqvb0i5O73IJAZSvCWY890/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705716148; c=relaxed/simple;
	bh=X1HSAxsQmyoehFoVKxF3tvAJHlvER4GCjaXle8K7R3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EpWGJKhbV2MwCQGSa+2KrwG7SHSBV8RraDEsn2/UPNznVvyNirSDnNnLWljanpOpx9Nx/6nz+tsiH3U9aUY3D0GqTVWZ70zUvL/MmMwypHJPs8Sdbip7C/YkOA4fM1oQVZQwfgfLVyWJTvCKNrrcunpDS/I9Z3sVimJEH5XKmrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsSaud2J; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsSaud2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705716146; x=1737252146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X1HSAxsQmyoehFoVKxF3tvAJHlvER4GCjaXle8K7R3g=;
  b=KsSaud2JcY1n6P5V5Wnbaft/O03KSh76ZP56rvB8O6qxVerXHwQtBQT+
   3dg4sARAC7/7k9CPv6vN8k8uHZh7jxwgeooR9dfLxdnznprycyH0GWCwH
   Pqu3Xc1K6aBfASnHgJOA3xMgJfgm6Oj/141yHjojxpz3AU6BcDx4Np1et
   YRMJeKz1DEtQJiyymsYgIGFo3O1qpUz6QrGoeeEH4j0QEuwI5leZ5KHfn
   cociL4xN7wPsrhWw7drSPJrOWjH/Rcz7pGyWcz9ETxXyDcvE5F2v/cElb
   t81VrAI3OwG47jxcv4mLF4Znm7hPqyf9IHW8KYCrHNpAxysjrqFVH+ZIf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="22390345"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="22390345"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 18:02:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="26904895"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jan 2024 18:02:22 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR0gd-0004c2-3B;
	Sat, 20 Jan 2024 02:02:19 +0000
Date: Sat, 20 Jan 2024 10:01:59 +0800
From: kernel test robot <lkp@intel.com>
To: "charles.park" <charles.park@hardkernel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-5.15.y 32/204]
 drivers/thermal/thermal_helpers.c:79: warning: expecting prototype for
 thermal_zone_get_temp(). Prototype was for CRITICAL_TEMP() instead
Message-ID: <202401200935.e4c5rbTN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi charles.park,

FYI, the error/warning still remains.

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   abb0d3e05ad22d863c174be2eec4e27812205317
commit: 80ab63aad57c0100e5277218c03ce79f4256d8c4 [32/204] ODROID-XU4: Update hack avoiding the invalid temperature by TMU broken
config: i386-buildonly-randconfig-002-20240120 (https://download.01.org/0day-ci/archive/20240120/202401200935.e4c5rbTN-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200935.e4c5rbTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200935.e4c5rbTN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/thermal_helpers.c:79: warning: expecting prototype for thermal_zone_get_temp(). Prototype was for CRITICAL_TEMP() instead


vim +79 drivers/thermal/thermal_helpers.c

    67	
    68	/**
    69	 * thermal_zone_get_temp() - returns the temperature of a thermal zone
    70	 * @tz: a valid pointer to a struct thermal_zone_device
    71	 * @temp: a valid pointer to where to store the resulting temperature.
    72	 *
    73	 * When a valid thermal zone reference is passed, it will fetch its
    74	 * temperature and fill @temp.
    75	 *
    76	 * Return: On success returns 0, an error code otherwise
    77	 */
    78	
  > 79	#define	CRITICAL_TEMP	120000
    80	int thermal_zone_data[4] = { 0, };
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

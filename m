Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5880B186E2E;
	Tue, 24 Dec 2024 11:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735040279; cv=none; b=bs/hAfLb5QfqABEoVczjwMvdZfhp2jr7JRkElF3cgEGwjAi6CrqYxiPgTWuatMwk6cAkKdFn65T2zjmUDUM10sORvUkTCvIhmEE8+Yiub8EosMJSdlM20naOTLNiQlyTJZekzpVn4QN+q+7B35X3WTw5fEwnl9bIkCewizTKKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735040279; c=relaxed/simple;
	bh=68/cEVqw2SOMT3xE43jcP4BOXX7t1nwfHrakGr97uwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=POSEbCUVA+ScrsjZecybFOY9e1+uC0g/UJNVQdwACcrL+114rNOCySEA7gRwdOWdzRdUWRBlnHnlAzPWJ0fum3m/3EvRbEKcBuD+3BZIyNSUACHCW1fKOKXMWesN3Rcg9CR3z9T//TOIG1lj8xyGoL5tnLUf48CxF3tmvDZ3XUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGzEUQoM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGzEUQoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735040278; x=1766576278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=68/cEVqw2SOMT3xE43jcP4BOXX7t1nwfHrakGr97uwM=;
  b=bGzEUQoMSK4H7+bX67FWAzzHedJBmxxfi865RW4IZ1JwLErgZvYsLuWk
   8AOjQHqwRACXzPS/sLGHYXXBCm0NEJbOK4uu87u4RZALoUHcDGqDWimiX
   RZBn8IhCcE8TM2oe+qrn6QeG3oix2EjMRt7/SkKB/MlD/2zVBZKiCSG56
   7fFw3l3tEZ/Woo3P3JD0VhOw8OrucdkDs/Rs288moAXMGRiEVYcBY43jW
   34OD0/iXEWvoxzBHSFzBnrD5ZrlV7PYQGS0Eowg9q2dKiSJ4Uvp/lcubx
   CMLwBsadb3nXta2I8HzQR9I/2QEtQAO09q3/hSULIl4ZhTrYxUd6yxVcs
   g==;
X-CSE-ConnectionGUID: 0D7TJ93eQZus8JY2+lJAYQ==
X-CSE-MsgGUID: V9QSSi7QRq+RIJ1HHsnQvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46515399"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="46515399"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 03:37:50 -0800
X-CSE-ConnectionGUID: ZOx2Ts7ESp6Kv6p1VIqUfg==
X-CSE-MsgGUID: xNmQ59L0Rh2ZJNkZKfG5aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99339281"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Dec 2024 03:37:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ3EP-00013y-2G;
	Tue, 24 Dec 2024 11:37:45 +0000
Date: Tue, 24 Dec 2024 19:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Norris <briannorris@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>
Subject: [driver-core:driver-core-testing 29/29]
 include/kunit/platform_device.h:15:15: warning: declaration of 'struct
 completion' will not be visible outside of this function
Message-ID: <202412241917.orLfjA92-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-testing
head:   86a5f32ed8813d5534d3d6c77aad29184a9f99b6
commit: 86a5f32ed8813d5534d3d6c77aad29184a9f99b6 [29/29] drivers: base: test: Add ...find_device_by...(... NULL) tests
config: i386-buildonly-randconfig-003-20241224 (https://download.01.org/0day-ci/archive/20241224/202412241917.orLfjA92-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412241917.orLfjA92-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412241917.orLfjA92-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/base/test/platform-device-test.c:3:
>> include/kunit/platform_device.h:15:15: warning: declaration of 'struct completion' will not be visible outside of this function [-Wvisibility]
      15 |                                                  struct completion *x);
         |                                                         ^
   1 warning generated.


vim +15 include/kunit/platform_device.h

5ac79730324c6f Stephen Boyd 2024-07-18  12  
5ac79730324c6f Stephen Boyd 2024-07-18  13  int kunit_platform_device_prepare_wait_for_probe(struct kunit *test,
5ac79730324c6f Stephen Boyd 2024-07-18  14  						 struct platform_device *pdev,
5ac79730324c6f Stephen Boyd 2024-07-18 @15  						 struct completion *x);
5ac79730324c6f Stephen Boyd 2024-07-18  16  

:::::: The code at line 15 was first introduced by commit
:::::: 5ac79730324c6f37106ce397586020ffe6e8e234 platform: Add test managed platform_device/driver APIs

:::::: TO: Stephen Boyd <sboyd@kernel.org>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075341E5B63;
	Wed, 25 Feb 2026 04:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771993336; cv=none; b=KCgGjMCyP2HsXY+y5dvjMBDfuKLTs9DjTJr0w9oQhsFaWMxr7098Xm00V5lcGVqeE74CcXGUcjARIGkKNFoPeqDzUYmcTyyxPFS+Sxe9hwE8ky4S9fGOLhQGOKDADY6j4QP8ymUh56m3auu5+gffq6+duviE18rt23xcLbkbyEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771993336; c=relaxed/simple;
	bh=f4Y1KzXiH9Nf6esd8jlSPcGdhgeZyUi91u0N6/pR9io=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LH4HbTmAncuBygHrGnUYELZISyK1yXgy7Kxk/vDkDkRO+EEyP/8mdCQOAMYSe1jx10UixPid7cx6WIIj6Mt9LvvmuVOqYFLQQNO6yvjszTM1MPBbMVx9jYxlogl4Jb8y6rHnuwp+bG74ByxlWU8uJ+7h9sI0N/8DeUG4J5E5u8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmMQF+h9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmMQF+h9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771993335; x=1803529335;
  h=date:from:to:cc:subject:message-id;
  bh=f4Y1KzXiH9Nf6esd8jlSPcGdhgeZyUi91u0N6/pR9io=;
  b=TmMQF+h9ZDbpjZyjp1Gg9BZSqKUW+brjBI18YdLmRixZdN6TNw5eq78Z
   5PSCYqNQWV0x5NjCr+EBUuCOD1ul+K+Blf1Jt+HnR8zHQfuUqEhNeuTUP
   6uHrdrlyMmOhHkBY/6ICLFmPd9BbHe/IlB4eCIkIcSb95X9itLLzN8OQU
   gukaCMwVVUV8b93fQgQrwOeJm1GwEI9XN6uaabOLkVlpsVSi4Br1/1Vgh
   C95YWNyxQjr2I3yWJoHfSnmHs8o4iRgRwaGmTOfutWC7yooX+KO/EVIxJ
   tAR63NPORTDoDlPP2a/Y2pwDIZgjHfWDSpZ1231rxjVB23htOI63mUMRe
   g==;
X-CSE-ConnectionGUID: txCapplURW6Nd+CYza13Rw==
X-CSE-MsgGUID: Cp2k+bwZTkKJiufovjxieA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="90602915"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="90602915"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 20:22:14 -0800
X-CSE-ConnectionGUID: WHsNN0JqR8WABluWqSzx1g==
X-CSE-MsgGUID: ubPXkuMmTcCCma8GVFqhPQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2026 20:22:12 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv6Pa-000000003uT-313a;
	Wed, 25 Feb 2026 04:22:10 +0000
Date: Wed, 25 Feb 2026 12:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Chanwoo Choi <cw00.choi@samsung.com>
Subject: [chanwoo-extcon:extcon-testing 9/9]
 drivers/extcon/extcon-s2m.c:15:10: fatal error: 'linux/mfd/samsung/s2mu005.h'
 file not found
Message-ID: <202602251218.ecgcvyVA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-testing
head:   2bd5d76830953093f5bd0634e552f71092aa743d
commit: 2bd5d76830953093f5bd0634e552f71092aa743d [9/9] extcon: add support for Samsung S2M series PMIC extcon devices
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260225/202602251218.ecgcvyVA-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602251218.ecgcvyVA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251218.ecgcvyVA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/extcon/extcon-s2m.c:15:10: fatal error: 'linux/mfd/samsung/s2mu005.h' file not found
      15 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +15 drivers/extcon/extcon-s2m.c

  > 15	#include <linux/mfd/samsung/s2mu005.h>
    16	#include <linux/of.h>
    17	#include <linux/platform_device.h>
    18	#include <linux/power_supply.h>
    19	#include <linux/regmap.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

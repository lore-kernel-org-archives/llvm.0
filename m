Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9D21C2DC8;
	Sun,  9 Mar 2025 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741531149; cv=none; b=QToIze49pwvJVHddKzq1Bikpyl71eY6tpmWfO+WeSb3Y9AGvfhjd0EHpPYJVDR8C5LBEBtKGHyU23Pc+/WhLmAC+xW5cnfrwBxI01AwiHTE6dL3Bgg9jmUpzDBmRoezKSRpy3bMW1wenKI3VKMAr1dRNaNxFPnTJXLdmciPFFWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741531149; c=relaxed/simple;
	bh=H+qLGISOVqxW7TufYS/ic2JdiWMTlKBAF5/SXLU3prI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZleGAm9zbByZzbBMMbFb4jekGbi89SLgZ9VJjAeI81u/wJgaboj+hnGz0gstoTlensnWug0Kpgq7MUeHSDOTiLQkMktOqGqDG/441kXTK3dN9okYflChjprHqf1w+M07iEUBtnrC1u+ksFsLgopPGR+vl5bTDwsUo+j8+JCJ4yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6+CcG9I; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6+CcG9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741531146; x=1773067146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H+qLGISOVqxW7TufYS/ic2JdiWMTlKBAF5/SXLU3prI=;
  b=m6+CcG9I6zg5s5+s0QBeBJbKfgW4jvGwuapf1/kC4954kWP1Iqxin+fk
   +X1S7HItiA1wUzz/qfhLACQmfJfr3fVHfm941eLsZa4rhMmOTGfvzPGY3
   gKtqGFqrMpXM2hw9gK8y0hO3U4ZT7GS0TVlvHN1xBzqOTwl7QVqJSp2qb
   jbmQyNchzwn+PWo0LGUon/kt5piOS9Xk/XK8fqfcCCzvNzr6KFWg6fDvu
   qI/NNAYD9r0xwCVXz/CqDeno2/xQtVmlYGDKoTPtbYoBjmwhtDPpxaAZD
   UNp1Vbh+UFCdzdTzoOvQGzbFqvG8xWMgMUYnxhuL3gnVU/cXU1nZS3aPM
   w==;
X-CSE-ConnectionGUID: NvKSX2O6SXiFF84CaPOY0w==
X-CSE-MsgGUID: iiV8WVK9RQqxn1hLLsUg/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42441130"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="42441130"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 07:39:05 -0700
X-CSE-ConnectionGUID: b6z2yB9fQwiARvbpks74mA==
X-CSE-MsgGUID: X5J3mMRsT2W8xOK+NbWAtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="119500264"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 09 Mar 2025 07:39:05 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trHny-0003C4-2c;
	Sun, 09 Mar 2025 14:39:02 +0000
Date: Sun, 9 Mar 2025 22:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:master 1/1] include/linux/align.h:5:10: fatal error:
 'vdso/align.h' file not found
Message-ID: <202503092207.nkymxVol-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git master
head:   38bcd10de11e3ae4b49e93a5bd12a490aafc6fed
commit: 38bcd10de11e3ae4b49e93a5bd12a490aafc6fed [1/1] foo
config: i386-buildonly-randconfig-001-20250309 (https://download.01.org/0day-ci/archive/20250309/202503092207.nkymxVol-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503092207.nkymxVol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503092207.nkymxVol-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:11:
   In file included from include/linux/kernel.h:15:
>> include/linux/align.h:5:10: fatal error: 'vdso/align.h' file not found
       5 | #include <vdso/align.h>
         |          ^~~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2856881087
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=2856881087
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=2856881087
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=2856881087
   make: Target 'prepare' not remade because of errors.


vim +5 include/linux/align.h

     4	
   > 5	#include <vdso/align.h>
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6018E3B185;
	Fri, 29 Mar 2024 04:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711686521; cv=none; b=BVL5BbPog6dMD0xb41knXIq/3qQg5nZD4bksidpOk9ruVjCikCwPgkBxRITsr6rNgQPDQ51uIVlhARq33RiIWeqyLLG+JVWGNDH4XPwb12b6KeWADTVXho1K8H60yO2OXH5ZrCvVtMEmVdz3UWu1mKsjhJeA3nzRwRHuQWA3Ws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711686521; c=relaxed/simple;
	bh=EcTg62zCHPxuWh4o9OYgfrumFml5MN4UYgRbhdm30H4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pm8PKX2jUFV4dXRrNljoORrixdOTan0jhxSfIwxfrHDg3GteZ4im2OX2APNBccChT81RaYBNetNvAt6IZ+ni8CNf132pTf/xa5R/WzsAN5RsdSo5TgOfI/ML54U8m0SfXL0vqgnj7s9+Jx/61KVk+S9xUYQbs88wZTGURnGi7v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6uO6KTL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6uO6KTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711686519; x=1743222519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EcTg62zCHPxuWh4o9OYgfrumFml5MN4UYgRbhdm30H4=;
  b=R6uO6KTLCCl41Gk3J8rjpiJld9EMOsMYwsRfzujGZN5O+HYQzU5RwRno
   TgnV+C0nrzgrlsEjSSoIEkJWVHLFOrYOXSdEsy2Dro3lymeKObDGJ3U14
   DyhS8KUsC66/cu6C0I4eq33Jjik9ge1OsXvCsXUhaEgojmg6BSUgtKvug
   Cu9q3sZih3yAHhvUWLHemztwxZHKOy1Iv0yf2+y6voM51mx51cpdb1O+T
   dshJBauaZAYzcG/LVqUSUFUTLrOH/1u1NYbmPH/TB5FapwEHvK3/X9qgm
   YNuLQSoZyVy1PNyzXaIdAGsu9suTJMbC0+FcBg1+y2Kd74OebPIl5A8ON
   Q==;
X-CSE-ConnectionGUID: oiDCgotvQBiOhTLhSOTRrg==
X-CSE-MsgGUID: RbbMQ1KrRO6MElj2hCYEnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6768172"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6768172"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 21:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16912031"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Mar 2024 21:28:34 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq3qy-0002qW-0N;
	Fri, 29 Mar 2024 04:28:32 +0000
Date: Fri, 29 Mar 2024 12:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [akpm-mm:mm-nonmm-unstable 53/62] lib/raid6/recov_neon_inner.c:7:10:
 fatal error: 'arm_neon.h' file not found
Message-ID: <202403291210.ioK7bfPA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   b065e14a3960a495216a032e6d383c104147c9ef
commit: aa73a95380b4ef76ccf00344b777d0d415026b7b [53/62] lib/raid6: use CC_FLAGS_FPU for NEON CFLAGS
config: arm-randconfig-002-20240329 (https://download.01.org/0day-ci/archive/20240329/202403291210.ioK7bfPA-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 79ba323bdd0843275019e16b6e9b35133677c514)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291210.ioK7bfPA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291210.ioK7bfPA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/raid6/recov_neon_inner.c:7:10: fatal error: 'arm_neon.h' file not found
       7 | #include <arm_neon.h>
         |          ^~~~~~~~~~~~
   1 error generated.


vim +7 lib/raid6/recov_neon_inner.c

6ec4e2514decd6 Ard Biesheuvel 2017-07-13 @7  #include <arm_neon.h>
3de13550a20fd5 Arnd Bergmann  2023-05-17  8  #include "neon.h"
6ec4e2514decd6 Ard Biesheuvel 2017-07-13  9  

:::::: The code at line 7 was first introduced by commit
:::::: 6ec4e2514decd6fb4782a9364fa71d6244d05af4 md/raid6: implement recovery using ARM NEON intrinsics

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495303B19CB;
	Mon, 30 Mar 2026 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861545; cv=none; b=fWrFPj/6MM9w1Mxb8qZnbE1iDEji0q5gY9+FwIUwJd9SK4XwmYlHwc8J1TdApKFySfKBrFUQ2UeB9ygcA9zqUSA37GuyLsqNFpE80FMoxaxGumleiZzNJZKbNcjnRWyymKXDY0KNgi5E6VT9ZfcKAxVBl/MJv232leAhxC1BwmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861545; c=relaxed/simple;
	bh=LQFsVa0GiyxQOzBHFWK9c0/VdHyOQPZGRYyAKUrITUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZa1c5wr+8kVySAYMUBxsRtXZPSTjf/BevT8OcgT/qnPW0Tu0ls9ggm6zjD+KH/vWRmXvheTBEK8VFNXgJRnvheTNkn20LCxyu4V6x7APRSGH8B1fFWSGPDV9IVkvvjtOWrC509JtRSeCyPGWvUaxiIU3ss2ZUPHioI/EWm+bVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFJFxRnJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFJFxRnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774861544; x=1806397544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LQFsVa0GiyxQOzBHFWK9c0/VdHyOQPZGRYyAKUrITUA=;
  b=PFJFxRnJChJrd0sGf0ixoQWbI8oCrI3wOZkgSadM7yFVYgerTuhMmtty
   4uWgwsq69hDo9xKXe8sg8A9EcdTF23l5++ODE5zpxCLznqR1mrT8+t9jV
   htMLswAkqq5eCiaERv4mB53DVMdK0v3TJNYzBrzxdAyIJ3EQRBWcv+40v
   dt27LTRHplzbAqw13U+AHXuNFUglrAc07W+msVix5Ywrym/SiKtkubvof
   C9bd6kT+dyQke2X54AFtkwjyLPhAkI8iYpdls3EGeqsuiYfZMn4CEs4nK
   VarxDrO4venFP4y4d5mFGAps2Al/gnHco6lRlkASpEWaYDDMlu3gY5f1Z
   Q==;
X-CSE-ConnectionGUID: zzhjOhudS0SqT+G5WHBNag==
X-CSE-MsgGUID: X4kanSQDRvuiT3kTAaB3IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86922791"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86922791"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:05:43 -0700
X-CSE-ConnectionGUID: plf186KNSTa03aWvx3VKgg==
X-CSE-MsgGUID: 8xMGguU9SAqcqH8Fltw1yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="219350230"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2026 02:05:41 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w78Z0-000000000sz-1yFP;
	Mon, 30 Mar 2026 09:05:38 +0000
Date: Mon, 30 Mar 2026 17:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: j0sh1x <aljoshua.hell@gmail.com>, tglx@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, subsystem@vger.kernel.org,
	dominikkobinski314@gmail.com, j0sh1x <aljoshua.hell@gmail.com>
Subject: Re: [PATCH 3/5] irqchip: Add Kconfig and Makefile entries for MSM VIC
Message-ID: <202603301621.gUNo2RD7-lkp@intel.com>
References: <20260315111705.118544-3-aljoshua.hell@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315111705.118544-3-aljoshua.hell@gmail.com>

Hi j0sh1x,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v7.0-rc6 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/j0sh1x/irqchip-Add-Qualcomm-MSM-VIC-driver/20260315-192045
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260315111705.118544-3-aljoshua.hell%40gmail.com
patch subject: [PATCH 3/5] irqchip: Add Kconfig and Makefile entries for MSM VIC
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260330/202603301621.gUNo2RD7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301621.gUNo2RD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301621.gUNo2RD7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-msm-vic.c:33:10: fatal error: 'asm/exception.h' file not found
      33 | #include <asm/exception.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +33 drivers/irqchip/irq-msm-vic.c

6daa7dfc644629e j0sh1x 2026-03-15  32  
6daa7dfc644629e j0sh1x 2026-03-15 @33  #include <asm/exception.h>
6daa7dfc644629e j0sh1x 2026-03-15  34  #include <asm/irq.h>
6daa7dfc644629e j0sh1x 2026-03-15  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

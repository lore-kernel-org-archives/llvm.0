Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C1D15AAD6;
	Tue, 17 Sep 2024 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726578701; cv=none; b=dG6DSZZ7SYKnIfRJNatoyE/K4DHL3IBL84EM3L1GHuSVabg7livzZbNAr7WoaM/FU6O2lOZtuRI2vTSRs7J4VehQj0wM4DAwz80HHa3zIvW3mWy5UAVkiP/7DyeWqH7WXEzQhx/23hEhZ1knxROwRMJ78NnL0nFDq3kOjgmz0Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726578701; c=relaxed/simple;
	bh=lkESKpXU+MF7+xoa6BnSI0UBz9GwikaNUEaYyPRetTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=slZdHIk61S9eXy92LYZ/YF1nUmyV7el/SDH3iGadGGwLSjWXGTlPdQqzYLtZeskzQ7YjrdBTNgE78GIDSMwYmcQkjHCybOLC8Lc5nCVbYG7DTlcmsshdb38EJGXJrLVPyr3C5bMQuPwvkeUfNMBP4mLYmD/wd34aE93OAlldpag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aov0kXyn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aov0kXyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726578700; x=1758114700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lkESKpXU+MF7+xoa6BnSI0UBz9GwikaNUEaYyPRetTQ=;
  b=aov0kXync7HcNM0ebzT7KD5KeBGwX52jjrvKlDuZvz1glCJPkqsRR4bK
   G0qO8rpuYdK2sdkJWfppAzARNB1J0UkprIcoj02oMgLjWM1+yXK8Z9JRd
   Xak5ccg69yItS7OAwEw/7tPdPpjBuZZxmjtq1q1OpHN6Xs8YxHdBlQLfZ
   3zfsrXuA+sV0UAB+8E7c0s6xZVM83GOwCQcx8Af9giea1W7dNVcivWnfq
   s7sqDyPbXDNHgZA3ksyVssA/hqefLAXv4brMx6W4JRykKfC5G/e0gwkFk
   jI3nTqLsBjk0QzSHcaWVg5eXczvuXtFV33dH+YFmNo6albE1K/bvxBxyz
   g==;
X-CSE-ConnectionGUID: oUd79UU+SfWQr3Vt8Nd+1A==
X-CSE-MsgGUID: v9qvEXGuS2ukiiLSoVmY9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36810449"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36810449"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 06:11:15 -0700
X-CSE-ConnectionGUID: LMYZnRjiQ8KQjsWnK4eXDg==
X-CSE-MsgGUID: uNFwk5dsQeqmGtyDMELdQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69151853"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Sep 2024 06:11:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqXz5-000BBG-0r;
	Tue, 17 Sep 2024 13:11:11 +0000
Date: Tue, 17 Sep 2024 21:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe-2.1 5/5] kernel/unwind/user.c:179:19: warning:
 shift count >= width of type
Message-ID: <202409172133.Uqcuvsht-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe-2.1
head:   5b35eb7c617539f21cbe3764b0ee0c77567b0f22
commit: 5b35eb7c617539f21cbe3764b0ee0c77567b0f22 [5/5] unwind: Add deferred interfaces
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240917/202409172133.Uqcuvsht-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409172133.Uqcuvsht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409172133.Uqcuvsht-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/unwind/user.c:179:19: warning: shift count >= width of type [-Wshift-count-overflow]
     179 |                 cookie &= ((1UL << 48) - 1);
         |                                 ^  ~~
   1 warning generated.


vim +179 kernel/unwind/user.c

   165	
   166	{
   167		BUILD_BUG_ON(NR_CPUS > 65535);
   168	
   169		if (WARN_ON_ONCE(in_nmi()))
   170			return -EINVAL;
   171	
   172		local_irq_disable();
   173	
   174		if (!current->unwind_ctx_cookie) {
   175			u64 cpu = smp_processor_id();
   176			u64 cookie;
   177	
   178			cookie = __this_cpu_read(ctx_ctr);
 > 179			cookie &= ((1UL << 48) - 1);
   180			cookie |= ((cpu << 48) + 1);
   181			__this_cpu_write(ctx_ctr, cookie);
   182	
   183			current->unwind_ctx_cookie = cookie;
   184			task_work_add(current, &current->unwind_work, TWA_RESUME);
   185		}
   186	
   187		*ctx_cookie = current->unwind_ctx_cookie;
   188		current->unwind_pending |= (1 << callback->unwind_priv.idx);
   189	
   190		local_irq_enable();
   191	
   192		return 0;
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

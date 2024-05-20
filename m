Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BA7A929;
	Mon, 20 May 2024 22:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716244664; cv=none; b=b/FZLslSusmM7AYIfaS17SxDrdmBNFvMScMMNd57Fl70rEmjhUdysx20xljUvubWCN4CN9pIpjS8ciHfXakIP44Zp7x7sugw2q4dvUvuxJuatfGzUxSuXJdGUlfYK6WLlrp0q+NCLx80FtLlBtkyKVht45vQmiYoKRnA3Hy8PCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716244664; c=relaxed/simple;
	bh=mc3IueB1k6/CbXxyprjQsAUDNk3E6uFfWkrI/wctBKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZcgOkPmHBP4epLgraAHtUyH+sZKXym1rO2Tzo0JULLSVLbaG4vAPCLOaVMBZKHrJKqWzIavce+XySUUB7psuOiXPvMTbYRFr0FHr2Uisc+xWdri9OuG0XjBRBSzdGWvr8bC9kkhr9OlBrnIQ6Uq97j4rR7sL5cemAd9S7tJ9+JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JaVB06aH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaVB06aH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716244663; x=1747780663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mc3IueB1k6/CbXxyprjQsAUDNk3E6uFfWkrI/wctBKo=;
  b=JaVB06aHmcZQlmlqh48YSzi/vNMqIUCER3zjc37+vM4OACZx4uKR6Ccs
   r81yXXvP6G4OySBn9hVUeTJrYwTosN1cdjhExeiqXguI+Cx5eTUx0j4FX
   O4SbJzpIk3nl9T3CWB3nO+aeEhKdQsu72Rqn+4EVyTHuh7zJnR2TdSUyS
   Pu0XHDB83Q1316Z+a3JLqV6nbJ32sm6TIrqm2cIm3Vp/dW4RbjOqyBxo9
   nIYi47QsVcavc0YhniDAVJ1DrclAXXh7F+uzxoNf08Fav4PGCI435dG+w
   hue2mQTD6uoiHhvm3VkcSu139oui1nA6fb5HOgTd8BNzkZFmsdM5xH9kG
   w==;
X-CSE-ConnectionGUID: ljnP57rNSFiNFJ/ucNl3/A==
X-CSE-MsgGUID: t80pNlJYRdubKf3wLngqPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="29927554"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="29927554"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 15:37:42 -0700
X-CSE-ConnectionGUID: lmr07kawTQGg0OXHpohI1g==
X-CSE-MsgGUID: mSo4ShnhRvamDfM8lc+b5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="32591787"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 May 2024 15:37:42 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9BdT-0005Da-0z;
	Mon, 20 May 2024 22:37:39 +0000
Date: Tue, 21 May 2024 06:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rcu:boqun-dev/hazptr 1/1] include/linux/hazptr.h:14:2: error:
 unknown type name '____cacheline_aligned'
Message-ID: <202405210611.aKkjAtWa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git boqun-dev/hazptr
head:   ca2ab86d71c6d322c87127363aa4b665012a0ac2
commit: ca2ab86d71c6d322c87127363aa4b665012a0ac2 [1/1] WIP
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240521/202405210611.aKkjAtWa-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405210611.aKkjAtWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210611.aKkjAtWa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/hazptr.c:5:
>> include/linux/hazptr.h:14:2: error: unknown type name '____cacheline_aligned'
      14 |         ____cacheline_aligned unsigned long slots[HAZPTR_SLOT_PER_CTX];
         |         ^
>> kernel/rcu/hazptr.c:41:33: error: invalid operands to binary expression ('void' and 'unsigned long')
      41 |                 if (READ_ONCE(hzcp->slots[i]) == HAZPTR_UNUSED) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~
>> kernel/rcu/hazptr.c:82:19: error: initializing 'unsigned long' with an expression of incompatible type 'void'
      82 |                                 unsigned long slot = READ_ONCE(ctx->slots[i]);
         |                                               ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/____cacheline_aligned +14 include/linux/hazptr.h

     8	
     9	struct hazptr_context {
    10		// The lock of the percpu context lists.
    11		spinlock_t *lock;
    12	
    13		struct list_head list;
  > 14		____cacheline_aligned unsigned long slots[HAZPTR_SLOT_PER_CTX];
    15	};
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

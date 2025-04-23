Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C2020101F;
	Wed, 23 Apr 2025 22:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745447881; cv=none; b=jK5DIj+4ACxZ1h9oe4BldfbEZpKfI91r5PeTRjMJMw5xHgki4BEv7K7mpgA62XmsOVl1yya5I0A7y62mD5Lkuya4CPlh3dX4+/rXeqoAvwOGpkdR6dZkbBqWTteXcN11qwvTsopLIoRci4zcC3jaei375VZYFCo22D73ICF4gHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745447881; c=relaxed/simple;
	bh=wbQaKyU9gpUBQPTbWl+9m3KyKnqjxfM9khec/IBqudE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kJ/7bBG1fY56xCUFQgEktQy24M6gpus8rKXCs61+wP3Hp4zP0UaPXWB8cXtQ6WKVDnXd/Z7wSiuUzkybh/73ZD9bJmqW9mViNvVjx9WKRh6Zi2E0nPClS/ju2rV3nXluAUOVJdUP8fVERHfAm15fcOO2ir7je7IPmeFW2NnhYJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IF3wXKiD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IF3wXKiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745447879; x=1776983879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wbQaKyU9gpUBQPTbWl+9m3KyKnqjxfM9khec/IBqudE=;
  b=IF3wXKiD7MprhYRo8vCjBYKocLjFb8edbaxyWXflZXBpHQdBPLd8AFwb
   KfmILlQURIeJzUyqLpT2akAwdMtnroxAq5gOqenWkKQICPrKsYUNbNxit
   EnnAAZ29nmz3ieobcQLYXXsJMxW+hGGGb5ycPH2EvR9vdrTW9ZcAA1gHG
   bKKAyQqILSUwSo8LzFsg9aqPK1JTl1eAtby/XqnwhEYuTLiELOujC/VHm
   hsvM6RinSgfbqIz7TEOMQXg2STLNSkq4zXSKne28JcT4gZeqnLtwRVd96
   nFxQkMe8aFrBzT4ZP6kmd1pS1mqAdPIOynyfISovh6IMm3CF5ce6Ot0/4
   Q==;
X-CSE-ConnectionGUID: crcGyoy4RFyRr6GcUrxfxw==
X-CSE-MsgGUID: YheL5/4CRB2KnTB026VAYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46971350"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46971350"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 15:37:55 -0700
X-CSE-ConnectionGUID: InzoDFT+Tw2q763PK5w5cQ==
X-CSE-MsgGUID: cljVXKZETomcnsjMIk1ICA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="136518421"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2025 15:37:54 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7ij2-0003fo-0q;
	Wed, 23 Apr 2025 22:37:52 +0000
Date: Thu, 24 Apr 2025 06:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:sink 91/184] kernel/sched/wait.c:57:41: error: expected ';'
 at end of declaration
Message-ID: <202504240606.adqlhlY5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux sink
head:   c1ca89c57593906261007798ee8911b57cd71595
commit: e061a317245ac5e48ce480f26cb8bb1e431daa30 [91/184] sched/wait: Add a waitqueue helper for fully exclusive priority waiters
config: x86_64-buildonly-randconfig-002-20250424 (https://download.01.org/0day-ci/archive/20250424/202504240606.adqlhlY5-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240606.adqlhlY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240606.adqlhlY5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:81:
>> kernel/sched/wait.c:57:41: error: expected ';' at end of declaration
      57 |         guard(spinlock_irqsave)(&wq_head->lock)
         |                                                ^
         |                                                ;
   1 error generated.


vim +57 kernel/sched/wait.c

    49	
    50	int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
    51					      struct wait_queue_entry *wq_entry)
    52	{
    53		struct list_head *head = &wq_head->head;
    54	
    55		wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
    56	
  > 57		guard(spinlock_irqsave)(&wq_head->lock)
    58	
    59		if (!list_empty(head) &&
    60		    (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
    61			return -EBUSY;
    62	
    63		list_add(&wq_entry->entry, head);
    64		return 0;
    65	}
    66	EXPORT_SYMBOL(add_wait_queue_priority_exclusive);
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

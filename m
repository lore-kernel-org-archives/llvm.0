Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BDF35B129;
	Thu, 23 Oct 2025 05:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761196725; cv=none; b=qiL7tdgEkyq3TZ4vU9MvmwJ50wzuvT54Z83Obis0KzqZJdMf3iR4fQz9NHVxUJiYtp+kxsZpkI0w7e7o6wIRJ4jDgODdnUc9HfGO/2Hf8IROqQQ6WTN8d6S0fdLazXfsZ7pxZVNbAmk+60Gpmb8efT5yZ0lumUHdjTLMNDLLX+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761196725; c=relaxed/simple;
	bh=ycLcfc53Od8c6OIZRWHYoMyLlRW0gtUyvGQKFBH3scY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VU2MboUxJPh7wCQasK9e6Ancc1fXFz/b5Y1FH4C5fzAlOtvNbk7mnGITmUWfhc4n0kwTc7DXkukqIHcxQfP6z5TXT29pHymoeGE7P0rVI4QauPfQn+0EnJeHqlviVa/xc/y2zshCVLBgtr8xml5zdijmAJXbn4h9X9vjjbuNJ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OK8P9NQ4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OK8P9NQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761196724; x=1792732724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ycLcfc53Od8c6OIZRWHYoMyLlRW0gtUyvGQKFBH3scY=;
  b=OK8P9NQ4d34hDN8gr+fObcbqsRKQXokxrN0b6pjg+m3BRrDwTACAUuuR
   tdQHTRJOhoE49+onbWNVadmgGh1twUHoACEbdb14MOrlMzNYWk2Z5skG6
   uGMNRkyfrZus84eWE8MkGfSxgVGndAoCs2U1O6HXxvMj5nq5R7C2upfMW
   o7UvOAf/MBO9wIosGDpEw2p2di9G0/J6TO03JGT3HTPxxApdDf34W4SyD
   1MY4ByG4l+gD8XN4qRufghoRJsGXiWCguriK1535WYNJuOFYNHB5mNO6Z
   RiKFjLRlEWb49FtrKKML4evMruWcEv9k/5d2LnlQjirb8bYOvF0KiNANg
   g==;
X-CSE-ConnectionGUID: s3Apnyl+TAGcl/UqOHiHXg==
X-CSE-MsgGUID: CFPVgPK+Q0KIRfw7XKUqzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63278485"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63278485"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 22:18:43 -0700
X-CSE-ConnectionGUID: nEK6u7IfSnmDpMw6pxpaYA==
X-CSE-MsgGUID: N35ASIjOQsC0HCy3ujZu7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="188350438"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Oct 2025 22:18:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBnih-000D3b-3A;
	Thu, 23 Oct 2025 05:18:39 +0000
Date: Thu, 23 Oct 2025 13:18:36 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [tglx-devel:rseq/slice 16/75]
 include/linux/resume_user_mode.h:62:32: error: too few arguments to function
 call, expected 2, have 1
Message-ID: <202510231335.9NOepLpY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   f801ad51668e156d2b2ffd81ef990c62f1121998
commit: 7f7115f3f559a41efd58f34150fd6652e39fd4a8 [16/75] rseq: Remove the ksig argument from rseq_handle_notify_resume()
config: i386-randconfig-141-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231335.9NOepLpY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231335.9NOepLpY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231335.9NOepLpY-lkp@intel.com/

Note: the tglx-devel/rseq/slice HEAD f801ad51668e156d2b2ffd81ef990c62f1121998 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/task_work.c:5:
>> include/linux/resume_user_mode.h:62:32: error: too few arguments to function call, expected 2, have 1
      62 |         rseq_handle_notify_resume(regs);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~     ^
   include/linux/rseq.h:107:20: note: 'rseq_handle_notify_resume' declared here
     107 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs) { }
         |                    ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +62 include/linux/resume_user_mode.h

    58	
    59		mem_cgroup_handle_over_high(GFP_KERNEL);
    60		blkcg_maybe_throttle_current();
    61	
  > 62		rseq_handle_notify_resume(regs);
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

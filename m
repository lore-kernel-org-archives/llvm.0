Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BA81E0DD4;
	Mon, 21 Oct 2024 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729501076; cv=none; b=TGS+a9DyV/2FdIGK1ajfKsXXh+61M7op3agy+dBvaTAgq+oNFp+pcyWRqzioovm+J2zNkJdpyYvCOToOyfAvj5RotCQ6F9VfwsC0Bb+aWoJ9s4oKUOZzxAMMGjHnRblmr/5g8VuFd2ROkljhtO8EWLzDY7x8JwYEG9g/RBkHUx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729501076; c=relaxed/simple;
	bh=CMCkdIJKB+0bbZpOo8OJKHB3C6jTSgjD/PulJwbEJKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PcS88wCWfEr1MIb3+7BtERU2jp1rrNaISz3FEom7GepczWnKEw/eiQ0NJrsozA7NVJjitaE0EUMOqYWg2Iq9WGc1SeeiDghR+kIJUB264va8qmkCC8cgDBYwUu3Mnq2QSnawbporoGfYh2Js1NPmYHcPFvfHVQvzpeHG0yPUmNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApEmulQ6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApEmulQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729501074; x=1761037074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CMCkdIJKB+0bbZpOo8OJKHB3C6jTSgjD/PulJwbEJKU=;
  b=ApEmulQ6mC4mfsM68bGQzb8Qb7cG6DbY/uWpnLOHFoocWG55tQaoptNQ
   5K/6I03WEdcZzZzT2OqmUodT+nUiho70+lBaOLHAUiuQalfjQ6KSPpdD8
   61a95YsMpHXg4bCN2jZAj1r1Y1DJO4yFhpZLIo+VQMBKjxnhgl7UTJkVX
   mxR3ctnLcbx4d+AcPLHngVuASF8qChSyxZ+laO7zGwR+i5yAdEjl02q+a
   BykiirWldbgWCXjua+IlIkSS+za6nf59SpvJ8o4KdCdId72iVhHkWZ24r
   6px+YTvQ4HaVcLZN1sO0fm/TtCOKGqqstEubGxu9sP/N8PC5RlAnn0MkS
   w==;
X-CSE-ConnectionGUID: njwURU0TSieJqJ8Sl/YlEg==
X-CSE-MsgGUID: DMW+vP12Tgy3RwaIDh4rog==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32660312"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32660312"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 01:57:54 -0700
X-CSE-ConnectionGUID: /RL8LhRWTYSuqcr21XPdiA==
X-CSE-MsgGUID: xNe0oUeoQcm09xaSma2frA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="116910239"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2024 01:57:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2oEY-000ROI-2h;
	Mon, 21 Oct 2024 08:57:50 +0000
Date: Mon, 21 Oct 2024 16:57:19 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe-2.2 5/9] kernel/unwind/user.c:191:18: warning:
 shift count >= width of type
Message-ID: <202410211608.b342Ychx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe-2.2
head:   757574ba1822accfdae6ec405421f5e2df48fe52
commit: d76cec29ef1d2284f0024c60d736b5ed01f89792 [5/9] unwind: Add deferred userspace unwinding API
config: i386-defconfig (https://download.01.org/0day-ci/archive/20241021/202410211608.b342Ychx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410211608.b342Ychx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410211608.b342Ychx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/unwind/user.c:191:18: warning: shift count >= width of type [-Wshift-count-overflow]
     191 |                 cookie &= (1UL << 48) - 1;
         |                                ^  ~~
   1 warning generated.


vim +191 kernel/unwind/user.c

   173	
   174	int unwind_user_deferred(struct unwind_callback *callback, u64 *ctx_cookie, void *data)
   175	{
   176		u64 cookie = current->unwind_ctx_cookie;
   177	
   178		if (WARN_ON_ONCE(in_nmi() || !irqs_disabled()))
   179			return -EINVAL;
   180	
   181		if (WARN_ON_ONCE(!callback->func || callback->idx < 0))
   182			return -EINVAL;
   183	
   184		if (!cookie) {
   185			u64 cpu = smp_processor_id();
   186	
   187			BUILD_BUG_ON(NR_CPUS > 65535);
   188	
   189			cookie = __this_cpu_read(ctx_ctr);
   190			cookie++;
 > 191			cookie &= (1UL << 48) - 1;
   192			cookie |= cpu << 48;
   193			__this_cpu_write(ctx_ctr, cookie);
   194	
   195			current->unwind_ctx_cookie = cookie;
   196			task_work_add(current, &current->unwind_work, TWA_RESUME);
   197		}
   198	
   199		if (ctx_cookie)
   200			*ctx_cookie = cookie;
   201	
   202		current->unwind_pending |= (1 << callback->idx);
   203		current->unwind_privs[callback->idx] = data;
   204	
   205		return 0;
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

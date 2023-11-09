Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E767E19442;
	Thu,  9 Nov 2023 20:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5fQ/g5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699562427; x=1731098427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=08R0N3Cz/o1T5RYd8NPRVEkP0v1ogVorHIkLagRbIQg=;
  b=Z5fQ/g5oee70azDrc67VhmQ/n/pO3Cr82abL88vJC3rwyGy+50bwS3Tw
   V1gTNxYmtS0ZYmknSHlDxJZTRthVLHK/f8dCeu/+LhrkJZY5jzHnguKZD
   AxWgiwMo8gV+M1zg7LkaEL51tOYGCR4ht09dBIQawOEsrX1nRlZGkU63y
   M32q9m0HL0n/18KzbsOhhIDeULP9bsE1n4ydWjdfDyHnVz6IQnsC9Z2YM
   FCocQ59gBmm0sNW2stT/q4P3c2xhVO6kZItY6iYOeffesVK5WV/VbYCEK
   kJlX7p/tbRmPI9cdaDpAPGK2nmQPxhj+oekFQpNr7ulL+EAyAY3QFZGmQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="387232411"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="387232411"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 12:40:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="11660783"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2023 12:40:25 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Bp8-00098E-3C;
	Thu, 09 Nov 2023 20:40:22 +0000
Date: Fri, 10 Nov 2023 04:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 5/10] arch/x86/events/core.c:2856:6: warning: no
 previous prototype for function '__perf_callchain_user'
Message-ID: <202311100457.J76Vb8Yp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   ec004e900e02c9c85cf8c89d4c26d4168a6c5d18
commit: f19cd074272c3fd160c2d637cc0f65cfffad1e81 [5/10] perf/x86: Add HAVE_PERF_CALLCHAIN_DEFERRED
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231110/202311100457.J76Vb8Yp-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100457.J76Vb8Yp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100457.J76Vb8Yp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/core.c:2856:6: warning: no previous prototype for function '__perf_callchain_user' [-Wmissing-prototypes]
   void __perf_callchain_user(struct perf_callchain_entry_ctx *entry,
        ^
   arch/x86/events/core.c:2856:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __perf_callchain_user(struct perf_callchain_entry_ctx *entry,
   ^
   static 
   1 warning generated.


vim +/__perf_callchain_user +2856 arch/x86/events/core.c

  2855	
> 2856	void __perf_callchain_user(struct perf_callchain_entry_ctx *entry,
  2857				   struct pt_regs *regs, bool atomic)
  2858	{
  2859		struct stack_frame frame;
  2860		const struct stack_frame __user *fp;
  2861	
  2862		if (perf_guest_state()) {
  2863			/* TODO: We don't support guest os callchain now */
  2864			return;
  2865		}
  2866	
  2867		/*
  2868		 * We don't know what to do with VM86 stacks.. ignore them for now.
  2869		 */
  2870		if (regs->flags & (X86_VM_MASK | PERF_EFLAGS_VM))
  2871			return;
  2872	
  2873		fp = (void __user *)regs->bp;
  2874	
  2875		perf_callchain_store(entry, regs->ip);
  2876	
  2877		if (atomic && !nmi_uaccess_okay())
  2878			return;
  2879	
  2880		if (atomic)
  2881			pagefault_disable();
  2882	
  2883		if (__perf_callchain_user32(regs, entry))
  2884			goto done;
  2885	
  2886		while (entry->nr < entry->max_stack) {
  2887			if (!valid_user_frame(fp, sizeof(frame)))
  2888				break;
  2889	
  2890			if (__get_user(frame.next_frame, &fp->next_frame))
  2891				break;
  2892			if (__get_user(frame.return_address, &fp->return_address))
  2893				break;
  2894	
  2895			perf_callchain_store(entry, frame.return_address);
  2896			fp = (void __user *)frame.next_frame;
  2897		}
  2898	done:
  2899		if (atomic)
  2900			pagefault_enable();
  2901	}
  2902	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

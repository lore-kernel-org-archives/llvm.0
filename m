Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D00B1ADC7E;
	Sun,  9 Nov 2025 14:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762699444; cv=none; b=SlXeUI+/G+/ZgUAtUo6PpEORu0ud9CAo6h4ezNmcSa4/cpFXQnVUje9iUv1ewBr9kfUZ+3FFn/ML7X484x7LuCBlKAt37WXxqxENPHE0Y+eq58H7QNMhdjj7hDk1a8Wmg9c7KNwFKBDw/3tXZEnAM5kURZFub6hSXhbdX9bL9LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762699444; c=relaxed/simple;
	bh=K/flutwXOWP1spERdSsXyhKUjzthQGcnVpG5FlwSZrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ym2hsCzlOnxLD1K74yjxJI2tfDrzdHWMPriBDX1XUjGCVV+xB3fM9FWk0jponba8ZiNTYEX9S8pDomeExzgr2NookLJj4WLxK9UUsDO2w+wpwKZrSryj8klIL+1yJsPb9c9KRzL0o+ArDqow4RItehPZ5mKf7JLcrfiFdfWXhn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmelZpfA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmelZpfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762699442; x=1794235442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K/flutwXOWP1spERdSsXyhKUjzthQGcnVpG5FlwSZrY=;
  b=lmelZpfATazTWDQXBIGdq3VTfvh+zLVwlAcuVdZZfCsHUuZLq/7vRsDo
   e4nLowKVBxU/3nHtirPPZ+OobAAcSHjq5lh6Del/8gUQ94He1EB0N4ocK
   Hs9FM5zlGoHkbPM4KZpVHSXJx5Vb58p7ZDziw/gzVmCgt2DoHVt6Wqk5I
   nYocFkpR7ZmWGUaC/kUxGpqUUxsO9SWJmjX6RvLWqg0a15Rv+15mYKAuX
   T6LgvDw9XmDGHNu7OxBEbCJ297z8Bw8iiQ8SYJMPUVPUkPx8gv3uXnLDq
   0dSzm+GsETEpsdAHOJaCD198BeFU/JT47jA7SJq+c++fsyPekGv0Wu0bl
   g==;
X-CSE-ConnectionGUID: g7dI0ulOS+2MhwYmCo3nog==
X-CSE-MsgGUID: j3Mglhm0S8iDiGAGi+zwww==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="82397178"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="82397178"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 06:44:02 -0800
X-CSE-ConnectionGUID: gcGdM3EbR/2REKsI9pafdg==
X-CSE-MsgGUID: 56MIu5rWQPmTbi6MxISANQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="211880061"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2025 06:43:54 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI6e0-00024d-2T;
	Sun, 09 Nov 2025 14:43:52 +0000
Date: Sun, 9 Nov 2025 22:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: Xie Yuanbin <qq570070308@gmail.com>, david@redhat.com,
	tglx@linutronix.de, segher@kernel.crashing.org, riel@surriel.com,
	peterz@infradead.org, linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com, paulmck@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
	andreas@gaisler.com, luto@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/4] Make enter_lazy_tlb inline on x86
Message-ID: <202511092219.73aMMES4-lkp@intel.com>
References: <20251108172346.263590-2-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251108172346.263590-2-qq570070308@gmail.com>

Hi Xie,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/x86/core tip/x86/mm s390/features perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools linus/master v6.18-rc4 next-20251107]
[cannot apply to acme/perf/core tip/timers/nohz]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xie-Yuanbin/Make-enter_lazy_tlb-inline-on-x86/20251109-013003
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251108172346.263590-2-qq570070308%40gmail.com
patch subject: [PATCH v2 1/4] Make enter_lazy_tlb inline on x86
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251109/202511092219.73aMMES4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511092219.73aMMES4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511092219.73aMMES4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/../../../virt/kvm/async_pf.c:14:
   In file included from include/linux/mmu_context.h:5:
>> arch/x86/include/asm/mmu_context.h:155:20: error: use of undeclared identifier 'cpu_tlbstate'
     155 |         if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
         |                           ^
>> arch/x86/include/asm/mmu_context.h:155:20: error: use of undeclared identifier 'cpu_tlbstate'
>> arch/x86/include/asm/mmu_context.h:155:20: error: use of undeclared identifier 'cpu_tlbstate'
>> arch/x86/include/asm/mmu_context.h:155:20: error: use of undeclared identifier 'cpu_tlbstate'
>> arch/x86/include/asm/mmu_context.h:155:20: error: use of undeclared identifier 'cpu_tlbstate'
>> arch/x86/include/asm/mmu_context.h:155:20: error: use of undeclared identifier 'cpu_tlbstate'
>> arch/x86/include/asm/mmu_context.h:155:20: error: use of undeclared identifier 'cpu_tlbstate'
>> arch/x86/include/asm/mmu_context.h:155:20: error: use of undeclared identifier 'cpu_tlbstate'
>> arch/x86/include/asm/mmu_context.h:155:20: error: use of undeclared identifier 'cpu_tlbstate'
>> arch/x86/include/asm/mmu_context.h:155:20: error: use of undeclared identifier 'cpu_tlbstate'
>> arch/x86/include/asm/mmu_context.h:155:20: error: use of undeclared identifier 'cpu_tlbstate'
>> arch/x86/include/asm/mmu_context.h:158:17: error: use of undeclared identifier 'cpu_tlbstate_shared'
     158 |         this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
         |                        ^
>> arch/x86/include/asm/mmu_context.h:158:17: error: use of undeclared identifier 'cpu_tlbstate_shared'
>> arch/x86/include/asm/mmu_context.h:158:17: error: use of undeclared identifier 'cpu_tlbstate_shared'
>> arch/x86/include/asm/mmu_context.h:158:17: error: use of undeclared identifier 'cpu_tlbstate_shared'
>> arch/x86/include/asm/mmu_context.h:158:17: error: use of undeclared identifier 'cpu_tlbstate_shared'
>> arch/x86/include/asm/mmu_context.h:158:17: error: use of undeclared identifier 'cpu_tlbstate_shared'
>> arch/x86/include/asm/mmu_context.h:158:17: error: use of undeclared identifier 'cpu_tlbstate_shared'
>> arch/x86/include/asm/mmu_context.h:158:17: error: use of undeclared identifier 'cpu_tlbstate_shared'
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/cpu_tlbstate +155 arch/x86/include/asm/mmu_context.h

   138	
   139	/*
   140	 * Please ignore the name of this function.  It should be called
   141	 * switch_to_kernel_thread().
   142	 *
   143	 * enter_lazy_tlb() is a hint from the scheduler that we are entering a
   144	 * kernel thread or other context without an mm.  Acceptable implementations
   145	 * include doing nothing whatsoever, switching to init_mm, or various clever
   146	 * lazy tricks to try to minimize TLB flushes.
   147	 *
   148	 * The scheduler reserves the right to call enter_lazy_tlb() several times
   149	 * in a row.  It will notify us that we're going back to a real mm by
   150	 * calling switch_mm_irqs_off().
   151	 */
   152	#define enter_lazy_tlb enter_lazy_tlb
   153	static __always_inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
   154	{
 > 155		if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
   156			return;
   157	
 > 158		this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

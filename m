Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183611FBC8C;
	Thu,  1 May 2025 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746115978; cv=none; b=kU6coMhnl6UH+f3Eh6BZsmtiQQtaqF6bCnnoFlx9P/v92V6P74WIAmkEi4IQibS314XNHJhwgCiYZX6zKjobQUgk6IDgEL8JyFMlRPz+daLNpcnIChjgbP1Juu3bYgNJ0dwEiivPv7aBUCyVCYztBiJDZPLvPgbSU5ovdvPb35c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746115978; c=relaxed/simple;
	bh=VKWHpX97Fnwgq7oScRbDqEEDa90vJZ58/D7FL/aRwSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7V8r9qk87UY4jU6kzLdgzqCGR9gqUgeI7YFPVdB73Y1ZcK7CGBn5ji/ZPBHb1JkxT+jpLR/cHDrFd0vwQ9NzU3eh9wEMAOeeW4ubrccBzAof30YW2q5lg++DLvDldXpilEUw1B6tHUV9KKFuKVPJo/Br29EGpy60dtDSma5FIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkRVlKcI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkRVlKcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746115977; x=1777651977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VKWHpX97Fnwgq7oScRbDqEEDa90vJZ58/D7FL/aRwSA=;
  b=IkRVlKcIC0Bl7gnCnsMng5Jt68i+OKiZF+lOgdSqyoJKbF3Z2ZmQJ6kd
   4ZRmIdAv6O7HbhUWLKBKIhi+BnSLBzc+tfYiJSZImQ/8qVup+wwgc2fO4
   OuZePS+r2TABGcgbYdUS19hk4BUC0b61PQ5XS/MsGe5g0est1ggV4XtqN
   OrGJuKohR88P8kGzlcyAkn8WXvjn8VEXGRzp0ZiBIiD6+QfRZN9kVEN8h
   MpOxiUBaUA/iNmedmLzE0HLISS5j+M4Ih88sBdCBRPC3R4IKJ8Jii8mVZ
   0fJLroaLi4yX9r1TGhDokNfsL0nZ6H+A45Cw/9y2Enr+qkV3MGJHDr7Jn
   w==;
X-CSE-ConnectionGUID: 2GiPTxUyRP6j7URXLDUiqA==
X-CSE-MsgGUID: 4NkYIuUEQ8uoG/6n2nnwiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47509717"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47509717"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 09:12:56 -0700
X-CSE-ConnectionGUID: tB0nEgfbTTacqIo0GPdnRg==
X-CSE-MsgGUID: TpuQodLqQI6YAoGTEsl8Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134337095"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 May 2025 09:12:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAWWk-0004FP-2H;
	Thu, 01 May 2025 16:12:46 +0000
Date: Fri, 2 May 2025 00:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jann Horn <jannh@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v14 11/27] riscv/shstk: If needed allocate a new shadow
 stack on clone
Message-ID: <202505012340.bnGnBAW6-lkp@intel.com>
References: <20250429-v5_user_cfi_series-v14-11-5239410d012a@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-v5_user_cfi_series-v14-11-5239410d012a@rivosinc.com>

Hi Deepak,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4181f8ad7a1061efed0219951d608d4988302af7]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-VM_SHADOW_STACK-definition-for-riscv/20250430-082727
base:   4181f8ad7a1061efed0219951d608d4988302af7
patch link:    https://lore.kernel.org/r/20250429-v5_user_cfi_series-v14-11-5239410d012a%40rivosinc.com
patch subject: [PATCH v14 11/27] riscv/shstk: If needed allocate a new shadow stack on clone
config: riscv-randconfig-001-20250501 (https://download.01.org/0day-ci/archive/20250501/202505012340.bnGnBAW6-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505012340.bnGnBAW6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505012340.bnGnBAW6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/process.c:245:36: warning: expression result unused [-Wunused-value]
     245 |                 ssp ? set_active_shstk(p, ssp) : 0;
         |                                                  ^
   1 warning generated.


vim +245 arch/riscv/kernel/process.c

   209	
   210	int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
   211	{
   212		unsigned long clone_flags = args->flags;
   213		unsigned long usp = args->stack;
   214		unsigned long tls = args->tls;
   215		unsigned long ssp = 0;
   216		struct pt_regs *childregs = task_pt_regs(p);
   217	
   218		/* Ensure all threads in this mm have the same pointer masking mode. */
   219		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM) && p->mm && (clone_flags & CLONE_VM))
   220			set_bit(MM_CONTEXT_LOCK_PMLEN, &p->mm->context.flags);
   221	
   222		memset(&p->thread.s, 0, sizeof(p->thread.s));
   223	
   224		/* p->thread holds context to be restored by __switch_to() */
   225		if (unlikely(args->fn)) {
   226			/* Kernel thread */
   227			memset(childregs, 0, sizeof(struct pt_regs));
   228			/* Supervisor/Machine, irqs on: */
   229			childregs->status = SR_PP | SR_PIE;
   230	
   231			p->thread.s[0] = (unsigned long)args->fn;
   232			p->thread.s[1] = (unsigned long)args->fn_arg;
   233		} else {
   234			/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
   235			ssp = shstk_alloc_thread_stack(p, args);
   236			if (IS_ERR_VALUE(ssp))
   237				return PTR_ERR((void *)ssp);
   238	
   239			*childregs = *(current_pt_regs());
   240			/* Turn off status.VS */
   241			riscv_v_vstate_off(childregs);
   242			if (usp) /* User fork */
   243				childregs->sp = usp;
   244			/* if needed, set new ssp */
 > 245			ssp ? set_active_shstk(p, ssp) : 0;
   246			if (clone_flags & CLONE_SETTLS)
   247				childregs->tp = tls;
   248			childregs->a0 = 0; /* Return value of fork() */
   249			p->thread.s[0] = 0;
   250		}
   251		p->thread.riscv_v_flags = 0;
   252		if (has_vector() || has_xtheadvector())
   253			riscv_v_thread_alloc(p);
   254		p->thread.ra = (unsigned long)ret_from_fork;
   255		p->thread.sp = (unsigned long)childregs; /* kernel sp */
   256		return 0;
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593764;
	b=FQX7X3jMQC39Jqbq6QKkQ05ttrkQBbgs7Nagrct73PG4kzmRo9y4wC72oK4Rz8EVB3pt
	 Z7BXUY/CeIu8qmgAblR+7fa7yi3IR6KzlCp7fysMjeQFTHdqJdsqdZHtjWX4HZMHFyJXc
	 fHHjyq/sWyqhuuHRi1js0i4/IoSA4hL5Ag/D8TMWxiA1YT0baU9UP99R/oasWnnXw+pCd
	 BfjD9dmf3IQQlgLyHFQH24m8w1FWY7Z5PS7RC0VF6kFB3Xjg6hu6uzVNyACQI0otfuTu6
	 Tf4sanfs0IpqlJDUZOW/Tw7yFYM2SmSI5zEp+9c1rW/cfbZI4xSXkV8u9BQg9A4voYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593764;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pQUxRNbmBjJR6+Wwn68YM2+HoelR9+Xfjwn5uNX5F18=;
	b=qqJQNJYFjz21cExVWGRcxkflWOtlHbv4EkieMRjYRUtl3wdljPP77NGGHbyu1MYlQhje
	 rx7rF6r7yeJOiSROQRWu0bzyoSGtQweCmRn5sgWwVmXwQ1CNBLZ2TmeUkcjdjzJV42Lgq
	 sHjBiz7XHE6PDF9SFLFvk11OeIPiLlSI58UAhdLjyoDIH8f2TFlCbbwLZ4/Z+MEfR4Jds
	 ZhmGg26hn+xXX+qVgp2x0w0CTebnLFzO0t+b9V1MP/e+/M6pkiBUiNtiwnTjq8uV7c5CD
	 bJ53CxpokhUwA3NkKie2tqraS8ACm/BfAn5UuA/ZgGa+mCxdBh8xxlCAn8O9wF8CB4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="VvLUNUa/";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4556B60A2615;
	Fri, 13 Nov 2026 18:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4556B60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VvLUNUa/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794593764; x=1826129764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+EdMLnRI4DvU7CemabUqWgmvJ8PvY87bMeAtmHXl08o=;
  b=VvLUNUa/H18fPheOLODPywsD9I1f0Hz1mi05yNvnM8LDvPtdcf2j0IvY
   i4Whb6jW5rO/PL6FFaJc2UDanpztLLTCCtQAowyD+CREwPbdPmtzE6upn
   hYmCqf4jdAsBLtMDHdFxF4FLgGktLqkXxIemnYSGTDrbmQ1Pb0o+CySf1
   sIu1AwW1UEmpDhqzut+udQaxl7BaWx9H459PR+HOPa6pparmpZSrSqhb3
   eBbb7zb1vrujwBR2bxXdwrFOc3C/hLjWVhC77Eur8zYcX9ean2z2Ohhh9
   wBgo2V481AEtU6hFdvPQL8qKv14rPaZwjre7SeQHeoLvlPK7ihmwvunoc
   g==;
X-CSE-ConnectionGUID: rp5ddv18Rz2QFFk02un3Kg==
X-CSE-MsgGUID: FD36gvxRTM6fWka6y9u1aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3308789"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3308789"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 10:16:03 -0800
X-CSE-ConnectionGUID: rEaKjM9uRNqRgcaAXeodEg==
X-CSE-MsgGUID: e9o4fhDoTa6auUYtZN584g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8791867"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2026 10:16:00 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRvoa-000000013dH-2RtK;
	Fri, 13 Nov 2026 18:15:56 +0000
Date: Sat, 14 Nov 2026 02:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <tchiu@tenstorrent.com>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>, dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com, Aurelien Jarno <aurelien@aurel32.net>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	daichengrong <daichengrong@iscas.ac.cn>,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v7 1/6] riscv: vector: refactor vector context operations
Message-ID: <202611140219.tkhKWAca-lkp@intel.com>
References: <20261111184359.1239821-2-tchiu@tenstorrent.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111184359.1239821-2-tchiu@tenstorrent.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on d1a8d411533d6be16ac79796c02a9bfc7d7958f1]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Chiu/riscv-vector-refactor-vector-context-operations/20261111-124323
base:   d1a8d411533d6be16ac79796c02a9bfc7d7958f1
patch link:    https://lore.kernel.org/r/20261111184359.1239821-2-tchiu%40tenstorrent.com
patch subject: [PATCH v7 1/6] riscv: vector: refactor vector context operations
config: riscv-randconfig-1001-20261113 (https://download.01.org/0day-ci/archive/20261114/202611140219.tkhKWAca-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140219.tkhKWAca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140219.tkhKWAca-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu.c:828:3: error: call to undeclared function 'kvm_riscv_vector_restore'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     828 |                 kvm_riscv_vector_restore(gcntx);
         |                 ^
   arch/riscv/kvm/vcpu.c:828:3: note: did you mean '__kvm_riscv_vector_restore'?
   arch/riscv/include/asm/kvm_vcpu_vector.h:62:29: note: '__kvm_riscv_vector_restore' declared here
      62 | static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
         |                             ^
   1 error generated.


vim +/kvm_riscv_vector_restore +828 arch/riscv/kvm/vcpu.c

   798	
   799	/*
   800	 * Actually run the vCPU, entering an RCU extended quiescent state (EQS) while
   801	 * the vCPU is running.
   802	 *
   803	 * This must be noinstr as instrumentation may make use of RCU, and this is not
   804	 * safe during the EQS.
   805	 */
   806	static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
   807						      struct kvm_cpu_trap *trap)
   808	{
   809		void *nsh;
   810		struct kvm_cpu_context *gcntx = &vcpu->arch.guest_context;
   811		struct kvm_cpu_context *hcntx = &vcpu->arch.host_context;
   812	
   813		/*
   814		 * We save trap CSRs (such as SEPC, SCAUSE, STVAL, HTVAL, and
   815		 * HTINST) here because we do local_irq_enable() after this
   816		 * function in kvm_arch_vcpu_ioctl_run() which can result in
   817		 * an interrupt immediately after local_irq_enable() and can
   818		 * potentially change trap CSRs.
   819		 */
   820	
   821		kvm_riscv_vcpu_swap_in_guest_state(vcpu);
   822		guest_state_enter_irqoff();
   823	
   824		/* sstatus.VS != SR_VS_OFF is guaranteed when NEED_RESTORE is set */
   825		if (current->thread.riscv_v_flags & RISCV_V_VCPU_NEED_RESTORE) {
   826			current->thread.riscv_v_flags &= ~RISCV_V_VCPU_NEED_RESTORE;
   827			current->thread.riscv_v_flags |= RISCV_V_VCPU_CTX;
 > 828			kvm_riscv_vector_restore(gcntx);
   829			gcntx->sstatus = (gcntx->sstatus & ~SR_VS) | SR_VS_CLEAN;
   830		}
   831	
   832		if (kvm_riscv_nacl_sync_sret_available()) {
   833			nsh = nacl_shmem();
   834	
   835			if (kvm_riscv_nacl_autoswap_csr_available()) {
   836				hcntx->hstatus =
   837					nacl_csr_read(nsh, CSR_HSTATUS);
   838				nacl_scratch_write_long(nsh,
   839							SBI_NACL_SHMEM_AUTOSWAP_OFFSET +
   840							SBI_NACL_SHMEM_AUTOSWAP_HSTATUS,
   841							gcntx->hstatus);
   842				nacl_scratch_write_long(nsh,
   843							SBI_NACL_SHMEM_AUTOSWAP_OFFSET,
   844							SBI_NACL_SHMEM_AUTOSWAP_FLAG_HSTATUS);
   845			} else if (kvm_riscv_nacl_sync_csr_available()) {
   846				hcntx->hstatus = nacl_csr_swap(nsh,
   847							       CSR_HSTATUS, gcntx->hstatus);
   848			} else {
   849				hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
   850			}
   851	
   852			nacl_scratch_write_longs(nsh,
   853						 SBI_NACL_SHMEM_SRET_OFFSET +
   854						 SBI_NACL_SHMEM_SRET_X(1),
   855						 &gcntx->ra,
   856						 SBI_NACL_SHMEM_SRET_X_LAST);
   857	
   858			__kvm_riscv_nacl_switch_to(&vcpu->arch, SBI_EXT_NACL,
   859						   SBI_EXT_NACL_SYNC_SRET);
   860	
   861			if (kvm_riscv_nacl_autoswap_csr_available()) {
   862				nacl_scratch_write_long(nsh,
   863							SBI_NACL_SHMEM_AUTOSWAP_OFFSET,
   864							0);
   865				gcntx->hstatus = nacl_scratch_read_long(nsh,
   866									SBI_NACL_SHMEM_AUTOSWAP_OFFSET +
   867									SBI_NACL_SHMEM_AUTOSWAP_HSTATUS);
   868			} else {
   869				gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
   870			}
   871	
   872			trap->htval = nacl_csr_read(nsh, CSR_HTVAL);
   873			trap->htinst = nacl_csr_read(nsh, CSR_HTINST);
   874		} else {
   875			hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
   876	
   877			__kvm_riscv_switch_to(&vcpu->arch);
   878	
   879			gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
   880	
   881			trap->htval = csr_read(CSR_HTVAL);
   882			trap->htinst = csr_read(CSR_HTINST);
   883		}
   884	
   885		trap->sepc = gcntx->sepc;
   886		trap->scause = csr_read(CSR_SCAUSE);
   887		trap->stval = csr_read(CSR_STVAL);
   888	
   889		vcpu->arch.last_exit_cpu = vcpu->cpu;
   890		guest_state_exit_irqoff();
   891		kvm_riscv_vcpu_swap_in_host_state(vcpu);
   892	}
   893	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

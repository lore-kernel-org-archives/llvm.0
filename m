Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C3620B207;
	Fri, 23 May 2025 23:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748041617; cv=none; b=oETyCGk+1SLrQ13+jY/UCWQEChHaQ/vt9FvaEx2yhpM/uDp9qyN31WxcCAfxaR75ZdA105RTO4wU07WhkzA4f2YZsp+vADmyNCuKOr96n5JeRD9CX9IHI87/7HhvyswrRg8zf5dwBcvOsiB3YJXVkMZRQAYyIEiQK/qeQ1qsFak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748041617; c=relaxed/simple;
	bh=3AvNiCdiW39PcO5MHSSJp9QQpXKVPmRkjD3bUegVhVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZmIU2ELZ9HgmnHuLUMIebzDy8iiqPME4mkSO/tgRMkoq3oBuCLgM0cMZ+ujSRMV3appyqmtyeZ9jxp4vVImJJ923vf5Ax8FCAUwWT2Y0FaKaOeIHOIvj7HkJ4Hg3lk9Yl7YDWQEoJllu9I3ZcNitOQ0fXMcJeEVqwq7Jlp8GW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZWIv0pz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZWIv0pz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748041616; x=1779577616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3AvNiCdiW39PcO5MHSSJp9QQpXKVPmRkjD3bUegVhVY=;
  b=RZWIv0pzhkDHvgpWBE3sMQbYclUuR/MFqAvg7/FpUTEYawpuypSqEySn
   B9NamBC/RJIZ4FzKy6dv4guXE9JK+rAnFnMyLz/bnx5bWTdCgoGKDUjDq
   QghWsyh0C++rQ/CFOpFlio8Z78l87hQFry+fTf23m1pkHHAF7phvF5m5Z
   DLlt1WtupeNeC5/y8DDWwD3ThR+mh9QitqlXQx8Nv4ERUaWcmKCgrpxjm
   iyUE5+VjgywVg4vYEVFxhCcphdlSjrYlMLl9hHoWqdWoUYC3XFB+NX5MB
   qYBCj2hD8XA1ZaCNZXLQ+Ck23lYkYgiEUB8p8hWsBtUeMGcv0bk6FmG2o
   g==;
X-CSE-ConnectionGUID: lgddwb/kSECmGQWWOHH0vQ==
X-CSE-MsgGUID: +jVGAH/bS/GIfzJKdplawg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50255837"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="50255837"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 16:06:49 -0700
X-CSE-ConnectionGUID: YVBcgOqzTuiTr+mD2mJxfQ==
X-CSE-MsgGUID: 2c+3HwPmTASQP/46Br3raQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="142292223"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2025 16:06:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIbTL-000QnA-1u;
	Fri, 23 May 2025 23:06:39 +0000
Date: Sat, 24 May 2025 07:06:32 +0800
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
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jann Horn <jannh@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v16 14/27] riscv: Implements arch agnostic indirect
 branch tracking prctls
Message-ID: <202505240659.OGVR0xHg-lkp@intel.com>
References: <20250522-v5_user_cfi_series-v16-14-64f61a35eee7@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-v5_user_cfi_series-v16-14-64f61a35eee7@rivosinc.com>

Hi Deepak,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4181f8ad7a1061efed0219951d608d4988302af7]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-VM_SHADOW_STACK-definition-for-riscv/20250523-133343
base:   4181f8ad7a1061efed0219951d608d4988302af7
patch link:    https://lore.kernel.org/r/20250522-v5_user_cfi_series-v16-14-64f61a35eee7%40rivosinc.com
patch subject: [PATCH v16 14/27] riscv: Implements arch agnostic indirect branch tracking prctls
config: riscv-randconfig-001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240659.OGVR0xHg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240659.OGVR0xHg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240659.OGVR0xHg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/entry.S:172:9: error: immediate must be an integer in the range [-2147483648, 4294967295]
    li t0, 0x00040000 | (0x00006000 | 0x00000600) | 0x020000000000
           ^


vim +172 arch/riscv/kernel/entry.S

   155	
   156	.Lsave_context:
   157		REG_S sp, TASK_TI_USER_SP(tp)
   158		REG_L sp, TASK_TI_KERNEL_SP(tp)
   159		addi sp, sp, -(PT_SIZE_ON_STACK)
   160		REG_S x1,  PT_RA(sp)
   161		REG_S x3,  PT_GP(sp)
   162		REG_S x5,  PT_T0(sp)
   163		save_from_x6_to_x31
   164	
   165		/*
   166		 * Disable user-mode memory access as it should only be set in the
   167		 * actual user copy routines.
   168		 *
   169		 * Disable the FPU/Vector to detect illegal usage of floating point
   170		 * or vector in kernel space.
   171		 */
 > 172		li t0, SR_SUM | SR_FS_VS | SR_ELP
   173	
   174		REG_L s0, TASK_TI_USER_SP(tp)
   175		csrrc s1, CSR_STATUS, t0
   176		save_userssp s2, s1
   177		csrr s2, CSR_EPC
   178		csrr s3, CSR_TVAL
   179		csrr s4, CSR_CAUSE
   180		csrr s5, CSR_SCRATCH
   181		REG_S s0, PT_SP(sp)
   182		REG_S s1, PT_STATUS(sp)
   183		REG_S s2, PT_EPC(sp)
   184		REG_S s3, PT_BADADDR(sp)
   185		REG_S s4, PT_CAUSE(sp)
   186		REG_S s5, PT_TP(sp)
   187	
   188		/*
   189		 * Set the scratch register to 0, so that if a recursive exception
   190		 * occurs, the exception vector knows it came from the kernel
   191		 */
   192		csrw CSR_SCRATCH, x0
   193	
   194		/* Load the global pointer */
   195		load_global_pointer
   196	
   197		/* Load the kernel shadow call stack pointer if coming from userspace */
   198		scs_load_current_if_task_changed s5
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

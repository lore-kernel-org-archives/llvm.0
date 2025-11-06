Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3BA2D12E7;
	Thu,  6 Nov 2025 04:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762405092; cv=none; b=a9IETClkS6MY6YzVP/PZluClEuIi0N4AjAxpzO0i9s2WQBgfUg1/gYzQsC4G14zz/irj0FDyVV6Oa27ANK7apfjBWJhdxnY6G84NRptw8ZAooVHq0iouRKoHn9ZQwhl2pyoZY7IudylYt6h8k8x+Wsi8c87bxulxkxbKLP0C8NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762405092; c=relaxed/simple;
	bh=TK0r4Z5MNYrtX8cpP4cT6f14wdu/p/gidtWqMY7gVtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YwD2N5og6caEYLRgVo38vJO9c609GY2KSUFa5E7ZUDWEXGm+bsdtxcGecF2SvS+lMGThmKJg93HhBuNY1JTzpUCi2O88Ee+0xtxLUIAHjvG8RcHPHJ+4rZb+ifLCdHhOHLBsK84OfRW2sf6ZbcTnowpInGVgJeOW7pbSbuAEEVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwbNGq6W; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwbNGq6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762405090; x=1793941090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TK0r4Z5MNYrtX8cpP4cT6f14wdu/p/gidtWqMY7gVtg=;
  b=lwbNGq6WaTw0wYyL323pEKSF7n1/Nhq5oyei0gJwESxM9MX8JzV8ZtSZ
   xRBxy2AXPlV14oEBad63JJIm59spa6gB/l2wdpqQYOZOs34lFWmGNFcmf
   ocPGHhzlt3TbrAFhIqESM86A7f0UzXLoD2MMqQPXT5Lky4So2imgrXi+0
   XFn+d+Sys7ok9WGlu4xc4Jk3qFLOMN8a2IJJmIcJoinbYVt2l1k9CdHSR
   2Id2tkWkfLJkERKieEKSBK3GmJK/k+lMRnoA+QUfjBBdFWZQPd3NWB0z5
   r0tVHpbJTta7jgHAEMNJSryLQdefFgQsyYbGF6c5ZBuFGZWrdZ17S41Z9
   A==;
X-CSE-ConnectionGUID: z7zfijUIT1OD8r1Qml1aMw==
X-CSE-MsgGUID: zfb++R/bRhmoWFmLXcer2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="67147504"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="67147504"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 20:58:10 -0800
X-CSE-ConnectionGUID: P+cw0oEqTLOHMLu43hrsAQ==
X-CSE-MsgGUID: +KePRhIDTFGfPOZ8ZOyZAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="211122326"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2025 20:58:08 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGs4U-000TVE-1L;
	Thu, 06 Nov 2025 04:58:06 +0000
Date: Thu, 6 Nov 2025 12:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [rcu:rcu/refscale 8/8] kernel/rcu/refscale.c:260:15: error: use of
 undeclared identifier 'srcu_fast_updown_refctl_scale'
Message-ID: <202511061232.svMuXZp9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/refscale
head:   0c990a8562a127b71e72eec4b9b92ba0f602510c
commit: 0c990a8562a127b71e72eec4b9b92ba0f602510c [8/8] refscale: Add SRCU-fast-updown readers
config: riscv-randconfig-001-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061232.svMuXZp9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061232.svMuXZp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061232.svMuXZp9-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/refscale.c:188:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     188 | DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
         | ^
         | int
   kernel/rcu/refscale.c:188:25: error: a parameter list without types is only allowed in a function definition
     188 | DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
         |                         ^
   kernel/rcu/refscale.c:189:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     189 | DEFINE_STATIC_SRCU_FAST_UPDOWN(srcu_fast_updown_refctl_scale);
         | ^
         | int
   kernel/rcu/refscale.c:189:32: error: a parameter list without types is only allowed in a function definition
     189 | DEFINE_STATIC_SRCU_FAST_UPDOWN(srcu_fast_updown_refctl_scale);
         |                                ^
   kernel/rcu/refscale.c:224:15: error: use of undeclared identifier 'srcu_fast_refctl_scale'; did you mean 'srcu_refctl_scale'?
     224 |         srcu_ctlp = &srcu_fast_refctl_scale;
         |                      ^~~~~~~~~~~~~~~~~~~~~~
         |                      srcu_refctl_scale
   kernel/rcu/refscale.c:187:20: note: 'srcu_refctl_scale' declared here
     187 | DEFINE_STATIC_SRCU(srcu_refctl_scale);
         |                    ^
>> kernel/rcu/refscale.c:260:15: error: use of undeclared identifier 'srcu_fast_updown_refctl_scale'
     260 |         srcu_ctlp = &srcu_fast_updown_refctl_scale;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/refscale.c:270:9: error: call to undeclared function 'srcu_read_lock_fast_updown'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     270 |                 scp = srcu_read_lock_fast_updown(srcu_ctlp);
         |                       ^
>> kernel/rcu/refscale.c:270:7: error: incompatible integer to pointer conversion assigning to 'struct srcu_ctr *' from 'int' [-Wint-conversion]
     270 |                 scp = srcu_read_lock_fast_updown(srcu_ctlp);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/refscale.c:271:3: error: call to undeclared function 'srcu_read_unlock_fast_updown'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     271 |                 srcu_read_unlock_fast_updown(srcu_ctlp, scp);
         |                 ^
   kernel/rcu/refscale.c:281:9: error: call to undeclared function 'srcu_read_lock_fast_updown'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     281 |                 scp = srcu_read_lock_fast_updown(srcu_ctlp);
         |                       ^
   kernel/rcu/refscale.c:281:7: error: incompatible integer to pointer conversion assigning to 'struct srcu_ctr *' from 'int' [-Wint-conversion]
     281 |                 scp = srcu_read_lock_fast_updown(srcu_ctlp);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/refscale.c:283:3: error: call to undeclared function 'srcu_read_unlock_fast_updown'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     283 |                 srcu_read_unlock_fast_updown(srcu_ctlp, scp);
         |                 ^
   12 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/srcu_fast_updown_refctl_scale +260 kernel/rcu/refscale.c

   185	
   186	// Definitions for SRCU ref scale testing.
 > 187	DEFINE_STATIC_SRCU(srcu_refctl_scale);
   188	DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
   189	DEFINE_STATIC_SRCU_FAST_UPDOWN(srcu_fast_updown_refctl_scale);
   190	static struct srcu_struct *srcu_ctlp = &srcu_refctl_scale;
   191	
   192	static void srcu_ref_scale_read_section(const int nloops)
   193	{
   194		int i;
   195		int idx;
   196	
   197		for (i = nloops; i >= 0; i--) {
   198			idx = srcu_read_lock(srcu_ctlp);
   199			srcu_read_unlock(srcu_ctlp, idx);
   200		}
   201	}
   202	
   203	static void srcu_ref_scale_delay_section(const int nloops, const int udl, const int ndl)
   204	{
   205		int i;
   206		int idx;
   207	
   208		for (i = nloops; i >= 0; i--) {
   209			idx = srcu_read_lock(srcu_ctlp);
   210			un_delay(udl, ndl);
   211			srcu_read_unlock(srcu_ctlp, idx);
   212		}
   213	}
   214	
   215	static const struct ref_scale_ops srcu_ops = {
   216		.init		= rcu_sync_scale_init,
   217		.readsection	= srcu_ref_scale_read_section,
   218		.delaysection	= srcu_ref_scale_delay_section,
   219		.name		= "srcu"
   220	};
   221	
   222	static bool srcu_fast_sync_scale_init(void)
   223	{
 > 224		srcu_ctlp = &srcu_fast_refctl_scale;
   225		return true;
   226	}
   227	
   228	static void srcu_fast_ref_scale_read_section(const int nloops)
   229	{
   230		int i;
   231		struct srcu_ctr __percpu *scp;
   232	
   233		for (i = nloops; i >= 0; i--) {
   234			scp = srcu_read_lock_fast(srcu_ctlp);
   235			srcu_read_unlock_fast(srcu_ctlp, scp);
   236		}
   237	}
   238	
   239	static void srcu_fast_ref_scale_delay_section(const int nloops, const int udl, const int ndl)
   240	{
   241		int i;
   242		struct srcu_ctr __percpu *scp;
   243	
   244		for (i = nloops; i >= 0; i--) {
   245			scp = srcu_read_lock_fast(srcu_ctlp);
   246			un_delay(udl, ndl);
   247			srcu_read_unlock_fast(srcu_ctlp, scp);
   248		}
   249	}
   250	
   251	static const struct ref_scale_ops srcu_fast_ops = {
   252		.init		= srcu_fast_sync_scale_init,
   253		.readsection	= srcu_fast_ref_scale_read_section,
   254		.delaysection	= srcu_fast_ref_scale_delay_section,
   255		.name		= "srcu-fast"
   256	};
   257	
   258	static bool srcu_fast_updown_sync_scale_init(void)
   259	{
 > 260		srcu_ctlp = &srcu_fast_updown_refctl_scale;
   261		return true;
   262	}
   263	
   264	static void srcu_fast_updown_ref_scale_read_section(const int nloops)
   265	{
   266		int i;
   267		struct srcu_ctr __percpu *scp;
   268	
   269		for (i = nloops; i >= 0; i--) {
 > 270			scp = srcu_read_lock_fast_updown(srcu_ctlp);
 > 271			srcu_read_unlock_fast_updown(srcu_ctlp, scp);
   272		}
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CB2375F82;
	Tue,  7 Apr 2026 03:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534070; cv=none; b=OCTVX28itxJ8uAk1aTHVbj7667N5LeD10k+2H/fjXS/ZFv3Nw9qqxBehd1ecVrZh9I23uTl/yvPR/Zhi2oP49M0tbDM8E7xoK287FVfEPp/t17M9ERfX5B3l4Z0CE3ltcbjzJUPSzuDUTmgZGnpkCfrx4VNd0Hk10iIwoW1VHs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534070; c=relaxed/simple;
	bh=h/L6F9JJcD85BBqtc40M+W7MN86a+kE0FUxKroqJMsQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BA87SPCR4vMle7GsyWglGUz952gAv9plar4DDzvr7YpTJF+XO69t/O4DVrglQWL3mrZSndGXArYrXU+ep8NH+nDSp0j6LBKln1vBDtTtq9AgtW/01/HiQUPd79H3bH6ZJ0tqbsIrolZztpw/VGhS9i8mBY6DAmzlxafF/L57ZlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NG0FgjbN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NG0FgjbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534069; x=1807070069;
  h=date:from:to:cc:subject:message-id;
  bh=h/L6F9JJcD85BBqtc40M+W7MN86a+kE0FUxKroqJMsQ=;
  b=NG0FgjbNHC/F7I6wPJUOk2MidNsbAckQUweQ3DpsgI0LMshNhZyxR2Y4
   aciL9CNbNfCDgkrHTN0/HjpyRkk/o0n9p/qMGkPhJN8sr3YOW3g8Ipm9f
   DrSLbEQ+E/NHAdRa09NOVZj+eL2JAE8WfDiBlACxXAOfHlP6nZVlmEPcX
   M+ZeMVvy0/lJ9p1SqIKZShN7gzfmkBzqe3owxpRUnYTETDuquLhphFNuu
   yCG+QyFOK5Cn4m5cpfccO9rQ+QZe/dzyh/kgjvMx1Iv+1gIJrNWZRDNy0
   nhn0Bru693uYW4lPdK/k9TFhvffdKnj+jzC1GHIckny1prvZDiY/BU4EG
   g==;
X-CSE-ConnectionGUID: b1co9zKFQomsG5LhR9zPYQ==
X-CSE-MsgGUID: OAj5QBoqRTiGyoNU4XhEGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87875494"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87875494"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:54:27 -0700
X-CSE-ConnectionGUID: VBdTUXG2TjyIy+jBa9vsVA==
X-CSE-MsgGUID: O64/pLnlTJqxOJkczhDEig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232090847"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2026 20:54:25 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xWA-00000000046-113U;
	Tue, 07 Apr 2026 03:54:22 +0000
Date: Tue, 07 Apr 2026 11:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>
Subject: [rust:rust-next 17/29] rust/helpers/dma.c:17:2: warning:
 static function 'dma_free_attrs' is used in an inline function with external
 linkage
Message-ID: <202604041420.tOm3h6GQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/Rust-for-Linux/linux rust-next
head:   36f5a2b09e650b82d7b2a106e3b93af48c2010d9
commit: db702816ad4d1d0ae54a5443c8865448f2dde75f [17/29] rust: helpers: #define __rust_helper
config: um-randconfig-001-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041420.tOm3h6GQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041420.tOm3h6GQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041420.tOm3h6GQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:59:
>> rust/helpers/dma.c:17:2: warning: static function 'dma_free_attrs' is used in an inline function with external linkage [-Wstatic-in-inline]
      17 |         dma_free_attrs(dev, size, cpu_addr, dma_handle, attrs);
         |         ^
   rust/helpers/dma.c:12:1: note: use 'static' to give inline function 'rust_helper_dma_free_attrs' internal linkage
      12 | __rust_helper void rust_helper_dma_free_attrs(struct device *dev, size_t size,
         | ^
         | static 
   rust/helpers/helpers.c:38:23: note: expanded from macro '__rust_helper'
      38 | #define __rust_helper __always_inline
         |                       ^
   include/linux/compiler_attributes.h:55:41: note: expanded from macro '__always_inline'
      55 | #define __always_inline                 inline __attribute__((__always_inline__))
         |                                         ^
   include/linux/compiler_types.h:235:16: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   include/linux/dma-mapping.h:251:13: note: 'dma_free_attrs' declared here
     251 | static void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
         |             ^
   1 warning generated.
--
   In file included from rust/helpers/helpers.c:59:
>> rust/helpers/dma.c:17:2: warning: static function 'dma_free_attrs' is used in an inline function with external linkage [-Wstatic-in-inline]
      17 |         dma_free_attrs(dev, size, cpu_addr, dma_handle, attrs);
         |         ^
   rust/helpers/dma.c:12:1: note: use 'static' to give inline function 'rust_helper_dma_free_attrs' internal linkage
      12 | __rust_helper void rust_helper_dma_free_attrs(struct device *dev, size_t size,
         | ^
         | static 
   rust/helpers/helpers.c:38:23: note: expanded from macro '__rust_helper'
      38 | #define __rust_helper __always_inline
         |                       ^
   include/linux/compiler_attributes.h:55:41: note: expanded from macro '__always_inline'
      55 | #define __always_inline                 inline __attribute__((__always_inline__))
         |                                         ^
   include/linux/compiler_types.h:235:16: note: expanded from macro 'inline'
     235 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   include/linux/dma-mapping.h:251:13: note: 'dma_free_attrs' declared here
     251 | static void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
         |             ^
   1 warning generated.


vim +/dma_free_attrs +17 rust/helpers/dma.c

c1b4071ec3a6a5 FUJITA Tomonori  2025-04-12  11  
8a03afe9476310 Alice Ryhl       2025-12-02  12  __rust_helper void rust_helper_dma_free_attrs(struct device *dev, size_t size,
8a03afe9476310 Alice Ryhl       2025-12-02  13  					      void *cpu_addr,
8a03afe9476310 Alice Ryhl       2025-12-02  14  					      dma_addr_t dma_handle,
8a03afe9476310 Alice Ryhl       2025-12-02  15  					      unsigned long attrs)
c1b4071ec3a6a5 FUJITA Tomonori  2025-04-12  16  {
c1b4071ec3a6a5 FUJITA Tomonori  2025-04-12 @17  	dma_free_attrs(dev, size, cpu_addr, dma_handle, attrs);
c1b4071ec3a6a5 FUJITA Tomonori  2025-04-12  18  }
101d66828a4eef Danilo Krummrich 2025-07-16  19  

:::::: The code at line 17 was first introduced by commit
:::::: c1b4071ec3a6a594df6c49bf8f04a60a88072525 rust: helpers: Add dma_alloc_attrs() and dma_free_attrs()

:::::: TO: FUJITA Tomonori <fujita.tomonori@gmail.com>
:::::: CC: Miguel Ojeda <ojeda@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

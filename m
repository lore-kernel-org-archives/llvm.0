Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76301D0171;
	Thu, 24 Oct 2024 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729772577; cv=none; b=JDALBwxnaUr66JIo4dyjMaUcBQJM9uIaQuTi1R3RD5yAtSOYwW3tvpI9oBKfL418u8wDvyKBzfjsMQLVBWxC2QA+6mfvVa7sVupFZhnvllMBB9ZEngvykjxMl/NwbDnCC7CAM6HioezKYRvf4dg5YElBswhfbQaq1I8ul+rMRmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729772577; c=relaxed/simple;
	bh=u0qeBrjunPpjPjWjVQqJqOwh1kAmoJK+Dg9zjRHT7L4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BhVt6E9aMTN2xBjxR86XLO41Qv4WqaLa8HdY5FeZ9PR3omnsAOgdnsvz7Q71BmgM96Yti+FJMdVhymhlDADfOOl85lKEfG2+BodBd/6ZrX0+BWvQJyq5QWkLxyTdE2VF/G48KAvut1xypAXvKSuTLKahr0aQyH5i1PG98i6fUZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6wplX49; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6wplX49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729772575; x=1761308575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0qeBrjunPpjPjWjVQqJqOwh1kAmoJK+Dg9zjRHT7L4=;
  b=i6wplX49SJBhWy8K3Khzs2KWqOylJ5U3f4zJ+/RgWy1IpUazKtTzJ3ql
   o1tMvvmFo68SMYOfjdCWGwaFUOviSNu/visVf7aiBbWi/X8xpOUA2XSn5
   ryXdf0gaGAY4XCLQdbqYY37BiQLYeIEgFE4Kx9wzuXs8QeEVM3bKY77mR
   zqiGIwY9S8HhOh6teX73bq0NN4GfnNOyL1X/QJumCdWsPtrbHSJP2P7/l
   Y4m9iHsIAz0cYOpzG4KWEpOPo+7WzoD7fngjnC/Kt66+UOig3X+lQeKwc
   UHS5APp09nxvAsxArAI8Q3juTARiQa+YmPsZ0vGSN/gs+x8sgCOlk7kb/
   w==;
X-CSE-ConnectionGUID: dhbdyJtuSXy4LlGlqS0aSg==
X-CSE-MsgGUID: 0lESNFcEQYelwcVFN6QP0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33303084"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="33303084"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 05:22:54 -0700
X-CSE-ConnectionGUID: glurziePSfuiVFUNVLSsOQ==
X-CSE-MsgGUID: HlGe346nRfminLWyPagaqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="84554608"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Oct 2024 05:22:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3wra-000WP4-30;
	Thu, 24 Oct 2024 12:22:50 +0000
Date: Thu, 24 Oct 2024 20:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Philipp Stanner <pstanner@redhat.com>
Subject: [rust:staging/rust-pci 9/13] error[E0425]: cannot find function
 `ioremap` in crate `bindings`
Message-ID: <202410242055.aHPu0LUJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux staging/rust-pci
head:   c13795fe4557999937eba6854f92761cfba8446f
commit: ec5f6bae35fa8db1243ff88be9565d717598beb5 [9/13] rust: add `io::Io` base type
config: riscv-randconfig-001-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242055.aHPu0LUJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242055.aHPu0LUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242055.aHPu0LUJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `ioremap` in crate `bindings`
   --> rust/doctests_kernel_generated.rs:3322:39
   |
   3322  |         let addr = unsafe { bindings::ioremap(paddr as _, SIZE.try_into().unwrap()) };
   |                                       ^^^^^^^ help: a function with a similar name exists: `iounmap`
   |
   ::: rust/bindings/bindings_generated.rs:40183:5
   |
   40183 |     pub fn iounmap(addr: *mut core::ffi::c_void);
   |     -------------------------------------------- similarly named function `iounmap` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

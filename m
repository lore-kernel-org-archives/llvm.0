Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82B2576;
	Sun,  9 Mar 2025 01:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741484958; cv=none; b=ECd5Dsnnozr4Qawicdp7sL2mZ4tbgKljbd0cbZbAlEN68oZC4UofrBxtjmG4YB060Jorb7CMKzmIrAAVJfTBskc1xGFd30F7vlUiD2c60ShYoE+CXgSWLKBVOTuEKlFxmC6vsVQeQXG/kXZWrriuLht5N0zE7KWGySTld8DkeU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741484958; c=relaxed/simple;
	bh=unOnc0Y2G8Guk1N26qGOaDibNbMwpdYPzLgVDrN2vP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u6xLb+ImYJyzmtYqVzo+icSe/1tUl5Ltyw9Rxwgl6E9aZNqRP4uHYgfPssAS1c11f1ApBg1EAmF4Cb145EwbI2nk5SqmDM9d99aGFel5NxOVUdLxjJ4eYhVegAnTbrL/RcVV3xXlEbB5EbiMhgRMsQahfLspSz0LikH6J4J0cmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5lqPDMx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5lqPDMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741484956; x=1773020956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=unOnc0Y2G8Guk1N26qGOaDibNbMwpdYPzLgVDrN2vP4=;
  b=i5lqPDMxsjKlHQn9owkJptw6BvJjSrUZ3aqy32ZUNpYXUW01SaqSoyLJ
   x62p1QKY3ZOBVyVxNlIgXQYSqvsazRcjEk6Ie+9yhVqLHMq5UNxHHPQN5
   NqwwGlyrOVTHRu9V6q3uRLYkNd/mabSvZxXbpIB/IYWFLsFxXn+VvVEUf
   q2xnhU6zboeJ/93706ejFBxKvZx/zb4Elmfowzc5R1jtQ3dK4ND0h00jH
   tSBspxnhJz0UfxgjKYuU3Du6mepTmRkRK6bEpP4R65znK2WX3Xu868jRy
   nd2qIuT8jdnqPNDnBhiLg2ecirTMzpanhReMboLSpWmbJJdZBETqpZRt2
   A==;
X-CSE-ConnectionGUID: td4Idn8vR4mTvurJwSuyyw==
X-CSE-MsgGUID: bZffLag6SYOjAsmMXkkzgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="64946252"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="64946252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 17:49:16 -0800
X-CSE-ConnectionGUID: JlBCUp08SMyCVvHzYBiNrA==
X-CSE-MsgGUID: VozuDkvpRDe3rjlv6EUv0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="119401481"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 08 Mar 2025 17:49:14 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr5mx-0002XU-23;
	Sun, 09 Mar 2025 01:49:11 +0000
Date: Sun, 9 Mar 2025 09:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:rust/drm-gem-shmem 4/7] error[E0609]: no field
 `__bindgen_anon_1` on type `iosys_map`
Message-ID: <202503090907.cipyVyt2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux rust/drm-gem-shmem
head:   339fbb10e073c12025d871fe8e23c665c28767c4
commit: ed5748ba616ea0e97c19fe3e37161c88ee70af1c [4/7] rust: drm: gem: shmem: Add DRM shmem helper abstraction
config: x86_64-randconfig-007-20250309 (https://download.01.org/0day-ci/archive/20250309/202503090907.cipyVyt2-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090907.cipyVyt2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090907.cipyVyt2-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 19.1.7
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
   rust/core.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/core.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
   rust/compiler_builtins.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/compiler_builtins.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
>> error[E0609]: no field `__bindgen_anon_1` on type `iosys_map`
   --> rust/kernel/drm/gem/shmem.rs:291:27
   |
   291 |         unsafe { self.map.__bindgen_anon_1.vaddr }
   |                           ^^^^^^^^^^^^^^^^ unknown field
--
>> error[E0609]: no field `__bindgen_anon_1` on type `iosys_map`
   --> rust/kernel/drm/gem/shmem.rs:297:27
   |
   297 |         unsafe { self.map.__bindgen_anon_1.vaddr }
   |                           ^^^^^^^^^^^^^^^^ unknown field

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

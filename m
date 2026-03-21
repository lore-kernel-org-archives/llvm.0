Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3192240DFAC;
	Sat, 21 Mar 2026 02:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774060569; cv=none; b=Aycuzi/h0Px8pungrmvTObotEPV+fRIJe06Q4iwMcNmvVN+deEHCds6CQo/tKLEjOAjtnuAjfsSEGIgyvbg8/3ku1od88oQiCC1gAuJ8RTHVVouALNDmYi2GqGrqgjfeflpoZ18MSUm03rfO8aWL2LpQqEIf2Ifo2VygQrbrWI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774060569; c=relaxed/simple;
	bh=ct3uPQhA2nFRuX8rAyBQblfVPe6tO+80d2Lg71onCcc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IsbbJnagsHtTYQ10ztKFW1YcEDmHD8AQLdCyU98dnBrZRBcqr0CfD7ZC0+wt07N3cHS7sGDZ/ZLN9Q1JrXp/pBd0OP9SX3Lu5riUXXgjuPIhSAHJf4ogcnZQVbCk2X29bBuJCNhzHCd/KYfdiktp72rkvOVLIjRI91gNSZT5poc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zmdu9WTd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zmdu9WTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774060568; x=1805596568;
  h=date:from:to:cc:subject:message-id;
  bh=ct3uPQhA2nFRuX8rAyBQblfVPe6tO+80d2Lg71onCcc=;
  b=Zmdu9WTdF6uAKYGee72ywyYJxUPaBS8LksCejptFJxgEJxuZxSnAbm1N
   KbSFntha5oi1FTxfHqPky8rLpqKSxDKflW2LqC+O5FBMepyaWy7LqCc4g
   0XsHVzbMExMKy8z84fQyP5wg+XVCfysWCw6olw/t/EVjJmMiKKu7BxcmF
   cm125+vb52lxP+4vis8K/T0mc7nMMNi80fGFwlN/ZuX++ws4zvOpw9id7
   +4W1bxJEiWTZ9fmOKKxB0fNoj2JpM/noCzvUaNS3ExcbmjZKuCFFmDunt
   lCAtvedObKuwXRf5Sw8+8Pg7374exsSRj6UtKoautnm0mlLwRpsTghgxc
   g==;
X-CSE-ConnectionGUID: /34eUoTCRCqIOvZMs4IUpw==
X-CSE-MsgGUID: wU0truQ6RWGyLbeMPsHqFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75118422"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75118422"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 19:36:07 -0700
X-CSE-ConnectionGUID: ahcxBdgmTDu7crXelRLSfw==
X-CSE-MsgGUID: EQCa8f23TteNE7yYpNwdIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="223443438"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Mar 2026 19:36:05 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3mBq-000000000Cf-1Kt1;
	Sat, 21 Mar 2026 02:35:53 +0000
Date: Sat, 21 Mar 2026 10:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7331/7971] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
Message-ID: <202603211040.LUJzjyRs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
commit: 21ddef4fe2b87aee0e4e707866219c3e42a9e2c9 [7331/7971] userfaultfd: introduce vm_uffd_ops
config: x86_64-buildonly-randconfig-003-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211040.LUJzjyRs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211040.LUJzjyRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211040.LUJzjyRs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: `*const kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
   --> drivers/android/binder/page_range.rs:146:23
   |
   146   | static BINDER_VM_OPS: bindings::vm_operations_struct = pin_init::zeroed();
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `*const kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
   |
   = help: within `kernel::bindings::vm_operations_struct`, the trait `Sync` is not implemented for `*const kernel::bindings::vm_uffd_ops`
   note: required because it appears within the type `kernel::bindings::vm_operations_struct`
   --> rust/bindings/bindings_generated.rs:74249:12
   |
   74249 | pub struct vm_operations_struct {
   |            ^^^^^^^^^^^^^^^^^^^^
   = note: shared static variables must have a type that implements `Sync`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

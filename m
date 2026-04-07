Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC504C97;
	Tue,  7 Apr 2026 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775548761; cv=none; b=J/5vSNT90HoQR9aEcq5Wbf5yxmpHWKLy3FnK9oQXMAsRd5SlmWh2c6RzBpYdLDHXNmSgTWFf+PK2mD+GM7aQ87y/9FGy23T1xsAygsM1iw5VRR/jsMbAoznGmbAhmt0D12xBsI3BH0H14gx5KLzO1g5GJiVKMDQ7CYuTw9hmv7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775548761; c=relaxed/simple;
	bh=rWUrsv1W8qJf9KmFN4h+K6eWgVKlBezYqGuQLWUdenI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OL9g93EQjm14Z/qx7E/rLH9rmEwcdgAdVvN3Zmmjl8lhWwpcyd+5+Odrfd+Hq0tzquH1knYTLi528h0uGSkT4ksVifI3wnyG4fR9ErbH4+pBEM+xOePhVrkzs9YorIjvmMblSsO6GFIIVXsAlwxAEv/+leob3Vja4i/e+Bo3B6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OT3YQ6Ny; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OT3YQ6Ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775548760; x=1807084760;
  h=date:from:to:cc:subject:message-id;
  bh=rWUrsv1W8qJf9KmFN4h+K6eWgVKlBezYqGuQLWUdenI=;
  b=OT3YQ6Nyhb/gzuGvEPfLRqWLQMo+EuOkLCX9kdzFp7l+PmSu45/7e/8z
   gICa7+d83Pt2CrrtEKjeMFzryreTptDAxtE+7Fz1HYq3E02snF4hq6b9S
   a1CQpoibcVVUqSv4ZQcfHTXdWjxFUg8wERTcITvedAUpmfJFLMLR8KRAs
   bgKxjHdUArVLzvqX1bOZFNjVe7WuBaaxq5Cf3OWjV1XhybLEuvPJF2YGE
   IwuAcgrzRQfiul6PxKkicBiDCgMzeTqLW4F9Gc19kTlIuoX28hJk8wZGp
   ZtZgEzG3fpoHhpPq+CCrSw4Dk4USPDb8AX4RSTdS2wBKCvDk7zpNzoCnk
   g==;
X-CSE-ConnectionGUID: FR+cr9KZT16QF6jApH4izA==
X-CSE-MsgGUID: GTSp/peuT+SpGtNuLN8sXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76401562"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76401562"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 00:59:13 -0700
X-CSE-ConnectionGUID: CQEOJtvnT/WcNOlTuaHAOg==
X-CSE-MsgGUID: CatIVsrPR0G6T6j+72S9AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223305417"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2026 00:59:11 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA1L3-000000000Kf-06yd;
	Tue, 07 Apr 2026 07:59:09 +0000
Date: Tue, 07 Apr 2026 15:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 113/133] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
Message-ID: <202604071509.y5vLetYd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   3fa44141e0bbd5062f2ef0c5cdddd98275d3223e
commit: 694fc0bd3ca5420f4e1105d2dec02327cfc5d64b [113/133] userfaultfd: introduce vm_uffd_ops
config: x86_64-randconfig-074-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071509.y5vLetYd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071509.y5vLetYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071509.y5vLetYd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: `*const kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
   --> drivers/android/binder/page_range.rs:146:23
   |
   146   | static BINDER_VM_OPS: bindings::vm_operations_struct = pin_init::zeroed();
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `*const kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
   |
   = help: within `kernel::bindings::vm_operations_struct`, the trait `Sync` is not implemented for `*const kernel::bindings::vm_uffd_ops`
   note: required because it appears within the type `kernel::bindings::vm_operations_struct`
   --> rust/bindings/bindings_generated.rs:74703:12
   |
   74703 | pub struct vm_operations_struct {
   |            ^^^^^^^^^^^^^^^^^^^^
   = note: shared static variables must have a type that implements `Sync`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

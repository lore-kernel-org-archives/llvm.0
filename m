Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145784ED19B;
	Tue, 13 Oct 2026 11:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891178; cv=none; b=CuR5hFkoron2RPLFFlfn29S7j6Hyg1GMJPVhifWM2CBXcEXElrPEeX8rdFcYhFWjqr4wGyrvfpbDvLt7A1/KFd7U2Qg3ihSfoiwPncuiNsn+Vf9WJyxxC+Fh32aXRyi8jLxva17QK85WvQOejU+uNZ1p5fU4STOduZpTeb95GBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891178; c=relaxed/simple;
	bh=Cd052oVC8fb6whUqFsuuPNraFUbqmWIoUi+KnVhKQeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gYs7y4i5AtNGuKmy6diktaDsSzLfMFr4O9qLkChcitcVc0YBAblvWU/SFEUwTvGH1YhOrxZDMdqm5A54MQ9WGlYRhvphD7I5LqVdJ8jgLgmrKe7JJpTwTujehag08Dw5xGuVoB3/sNHPDQO52qI8Rpt4IPiY4ahm+ilH2NSvBd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LoI6hSBI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoI6hSBI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791891176; x=1823427176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cd052oVC8fb6whUqFsuuPNraFUbqmWIoUi+KnVhKQeU=;
  b=LoI6hSBI738mFRMuHyKcPaW7OS5JMVsGw+emM80x505AL5RbMJ0d7HAD
   fSqlD5mQLp8tMndtPb2J9Gs3f1540HSleEVcAP8mlaaKcBFS9+b5C5YGf
   DTaNAz331qHcYJ+mP8KRRbbd7XbDswkGmWcxCkFZQP6N9Yw4z6p3g8oA3
   HLikybIdkl3T7iqAikwuifaljLw10+AGpasGFXKdZtT1MfMmiKCvG/KoX
   8Lk/2xIHXrRJOXZK7YFc+VwRhcOzt+LcL9q4J2/kFRgjVBx+EPxfVLMJm
   f91XRgAx0oI3FVzaqWEjcU4HjGIt/UJ8aUHQnXzljn9nErEGHAdNSzyHe
   g==;
X-CSE-ConnectionGUID: ONA7AdYdQx2uMIol5+GE9A==
X-CSE-MsgGUID: UyMzxbCoR2WWsh5m9XR0sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="497543"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="497543"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 04:32:55 -0700
X-CSE-ConnectionGUID: ulFAnSj4TJakn7l+/h0CMg==
X-CSE-MsgGUID: Z+tBUCY3S0a/a7ysEYRd0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1023934"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Oct 2026 04:32:55 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGakW-00000000Cxi-0din;
	Tue, 13 Oct 2026 11:32:52 +0000
Date: Tue, 13 Oct 2026 19:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-dyndbg 14/16] error[E0425]:
 cannot find function `__dynamic_pr_debug` in crate `$crate::bindings`
Message-ID: <202610131927.GAKnif0V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-dyndbg
head:   20c3aae54d617189168dfe8539a9086baeab6d39
commit: ba27e0dd2dfd3ac15e54eb9d375fc34d5de33004 [14/16] x
config: arm64-randconfig-1003-20261013 (https://download.01.org/0day-ci/archive/20261013/202610131927.GAKnif0V-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131927.GAKnif0V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610131927.GAKnif0V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `__dynamic_pr_debug` in crate `$crate::bindings`
   --> rust/kernel/print.rs:399:39
   |
   392 | macro_rules! pr_debug (
   | --------------------- in this expansion of `pr_debug!`
   ...
   399 |                     $crate::bindings::__dynamic_pr_debug(desc, c"%pA".as_char_ptr(), &raw const args)
   |                                       ^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/doctests_kernel_generated.rs:15539:1
   |
   15539 | pr_debug!("hello {}\n", "there");
   | -------------------------------- in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_pr_debug` in crate `$crate::bindings`
   --> rust/kernel/print.rs:399:39
   |
   392 | macro_rules! pr_debug (
   | --------------------- in this expansion of `pr_debug!`
   ...
   399 |                     $crate::bindings::__dynamic_pr_debug(desc, c"%pA".as_char_ptr(), &raw const args)
   |                                       ^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: samples/rust/rust_print_main.rs:72:9
   |
   72 |         pr_debug!("Debug message (level 7) without args\n");
   |         --------------------------------------------------- in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_pr_debug` in crate `$crate::bindings`
   --> rust/kernel/print.rs:399:39
   |
   392 | macro_rules! pr_debug (
   | --------------------- in this expansion of `pr_debug!`
   ...
   399 |                     $crate::bindings::__dynamic_pr_debug(desc, c"%pA".as_char_ptr(), &raw const args)
   |                                       ^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: samples/rust/rust_print_main.rs:85:9
   |
   85 |         pr_debug!("{} message (level {}) with args\n", "Debug", 7);
   |         ---------------------------------------------------------- in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_pr_debug` in crate `$crate::bindings`
   --> rust/kernel/print.rs:399:39
   |
   392 | macro_rules! pr_debug (
   | --------------------- in this expansion of `pr_debug!`
   ...
   399 |                     $crate::bindings::__dynamic_pr_debug(desc, c"%pA".as_char_ptr(), &raw const args)
   |                                       ^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/android/binder/page_range.rs:303:13
   |
   303 |             pr_debug!("Failed to register with vma: invalid vma->vm_mm");
   |             ------------------------------------------------------------ in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_pr_debug` in crate `$crate::bindings`
   --> rust/kernel/print.rs:399:39
   |
   392 | macro_rules! pr_debug (
   | --------------------- in this expansion of `pr_debug!`
   ...
   399 |                     $crate::bindings::__dynamic_pr_debug(desc, c"%pA".as_char_ptr(), &raw const args)
   |                                       ^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/android/binder/page_range.rs:307:13
   |
   307 |             pr_debug!("Failed to register with vma: size zero");
   |             --------------------------------------------------- in this macro invocation
--
>> error[E0425]: cannot find function `__dynamic_pr_debug` in crate `$crate::bindings`
   --> rust/kernel/print.rs:399:39
   |
   392 | macro_rules! pr_debug (
   | --------------------- in this expansion of `pr_debug!`
   ...
   399 |                     $crate::bindings::__dynamic_pr_debug(desc, c"%pA".as_char_ptr(), &raw const args)
   |                                       ^^^^^^^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: drivers/android/binder/page_range.rs:328:13
   |
   328 |             pr_debug!("Failed to register with vma: already registered");
   |             ------------------------------------------------------------ in this macro invocation

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

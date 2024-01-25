Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA74D287;
	Thu, 25 Jan 2024 05:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706161772; cv=none; b=V5bQJspCWNPn+djfo6yEXBKF+9qsfjND15HsOjZr9VH6TSc0b91CqMQkQAhO22llGBz1vtaUqGGKSLEN+uK+0vaGaxrBSox0K0x6E3ifZndU9jdFkb1SR0rupCDLDJQrR3l/i8yP1oUb03YExRA93GwcqhvRy9geWffm+jhbqes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706161772; c=relaxed/simple;
	bh=9nqP8U2FAvfBDhRxGvzjTT067AHdn1rB9S9ofcZE6KE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YfO0vSWeaoSTfjulFOaoKynCJmNma6BjtfbmhYKg34BCFZywqhULvDsLtaHg5GXAL3idZTH6UMuJb34WiNWWpF8oxQgL+ntBzImvk/nRRz1No/IZjUthZFI7ec4ifXjaS6V95948+U9/dAzYhNcyI69calU2hdxUlYj9o5CSNCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPu84B1L; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPu84B1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706161770; x=1737697770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9nqP8U2FAvfBDhRxGvzjTT067AHdn1rB9S9ofcZE6KE=;
  b=bPu84B1LUj/7uPCAlgrmaOlnLNwydvg6mtyUXN0A6E/vgeUX2GpUhrXA
   X8mYbl1FwuoI63aacAWATnZGzbTTLH7ocgeyVaFXD1qcjn5MyTmsBCykQ
   SNnX8yU5dkdY8Jd8Nc4j08IFL5JuuxSFyuscfBLngfhvSxTP3I806EJs9
   jiEyw10IkpfANJvvWaQK8Aeyvvfk07BRU22Zd3m4xQ8wXnw6bUms+RxSe
   mwY/wNBtLh2ZktB1BH2PCAf8N2YgCqQQOmTYclyyDHJvoATPB4t2GfAIE
   mIMXm2kanlsd9nF+q4jr1fVRYct73UvGgfnsSzwaOFFbf810MDsFr5SIZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8742314"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8742314"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 21:49:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="20949759"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Jan 2024 21:49:26 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSsc8-0008kV-0c;
	Thu, 25 Jan 2024 05:49:24 +0000
Date: Thu, 25 Jan 2024 13:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 4/4] error[E0425]: cannot find function `_printk`
 in crate `bindings`
Message-ID: <202401251312.nsg1mLWn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   1e140a96e8ce220d86926c91c3985f13ac88d816
commit: 1e140a96e8ce220d86926c91c3985f13ac88d816 [4/4] x86: Build the core kernel with position independent codegen
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240125/202401251312.nsg1mLWn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251312.nsg1mLWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251312.nsg1mLWn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> warning: unused import: `super::bindings_raw::*`
   --> rust/bindings/lib.rs:43:9
   |
   43 |     use super::bindings_raw::*;
   |         ^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> error[E0425]: cannot find function `_printk` in crate `bindings`
   --> rust/kernel/print.rs:111:19
   |
   111 |         bindings::_printk(
   |                   ^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `_printk` in crate `bindings`
   --> rust/kernel/print.rs:132:19
   |
   132 |         bindings::_printk(
   |                   ^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `strlen` in crate `bindings`
   --> rust/kernel/str.rs:101:38
   |
   101 |         let len = unsafe { bindings::strlen(ptr) } + 1;
   |                                      ^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `memchr` in crate `bindings`
   --> rust/kernel/str.rs:575:38
   |
   575 |         let ptr = unsafe { bindings::memchr(buf.as_ptr().cast(), 0, (f.bytes_written() - 1) as _) };
   |                                      ^^^^^^ not found in `bindings`
   |
   help: consider importing this function
   |
   5   + use core::slice::memchr::memchr;
   |
   help: if you import `memchr`, refer to it directly
   |
   575 -         let ptr = unsafe { bindings::memchr(buf.as_ptr().cast(), 0, (f.bytes_written() - 1) as _) };
   575 +         let ptr = unsafe { memchr(buf.as_ptr().cast(), 0, (f.bytes_written() - 1) as _) };
   |
--
>> error[E0425]: cannot find function, tuple struct or tuple variant `REFCOUNT_INIT` in crate `bindings`
   --> rust/kernel/sync/arc.rs:169:54
   |
   169 |             refcount: Opaque::new(unsafe { bindings::REFCOUNT_INIT(1) }),
   |                                                      ^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `refcount_inc` in crate `bindings`
   --> rust/kernel/sync/arc.rs:324:28
   |
   324 |         unsafe { bindings::refcount_inc(self.ptr.as_ref().refcount.get()) };
   |                            ^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `refcount_dec_and_test` in crate `bindings`
   --> rust/kernel/sync/arc.rs:342:42
   |
   342 |         let is_zero = unsafe { bindings::refcount_dec_and_test(refcount) };
   |                                          ^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function, tuple struct or tuple variant `REFCOUNT_INIT` in crate `bindings`
   --> rust/kernel/sync/arc.rs:573:54
   |
   573 |             refcount: Opaque::new(unsafe { bindings::REFCOUNT_INIT(1) }),
   |                                                      ^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `__init_waitqueue_head` in crate `bindings`
   --> rust/kernel/sync/condvar.rs:100:27
   |
   100 |                 bindings::__init_waitqueue_head(slot, name.as_char_ptr(), key.as_ptr())
   |                           ^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `init_wait` in crate `bindings`
   --> rust/kernel/sync/condvar.rs:109:28
   |
   109   |         unsafe { bindings::init_wait(wait.get()) };
   |                            ^^^^^^^^^ help: a static with a similar name exists: `init_task`
   |
   ::: rust/bindings/bindings_generated.rs:24737:5
   |
   24737 |     pub static mut init_task: task_struct;
   |     ------------------------------------- similarly named static `init_task` defined here
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

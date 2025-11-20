Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAB02BE048;
	Thu, 20 Nov 2025 20:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763670799; cv=none; b=iVXFVAx3MwpQ/4KBphd0jkjz+RJaUlmdaHb88slyGdn24mLJZ4gOVBw0AyQ2gyHa1pEOCZSCO+FBskF7va3u48XAqmDcrkQWOIv1IAHkDI+6Nf/RF1NdEyDvRxIGaObk4X6Ir2P4N4jYRjeMCLUCsxq1Y1CHRAhBZc7I6GM9DDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763670799; c=relaxed/simple;
	bh=5NoqBTCZiAhRczkra2m4L6MlA4PSjlWfpLTZ6Q/rxHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CO+xb7dBGSk1iGmxHf7QWb4LzQgnOx6SsYuJIeLu+ymWxVtjlXMDOhJ9vSroJt5BZi5xpMxEeSrcw3hjYLb7XIaIk+ncnMRfIQUC4/dV9nzfvKQv+CiZ5gLkBi9zXFFAas/6LkAnmySQymB1u9oHvboKK83Qz8Wp55TAZrfMzEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JNeaIHeB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JNeaIHeB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763670798; x=1795206798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5NoqBTCZiAhRczkra2m4L6MlA4PSjlWfpLTZ6Q/rxHA=;
  b=JNeaIHeBQS6sgSDOxQU4e3m0PGNGbGNn3o81A4GvK1iHekjCAB4v840K
   EKIgaLYlbOcH4LOpmhlUYG60APYNvJEoeYnyojEQuQ3NUqqwng7hVf9Ep
   vp/ltJp2VKRWoquGZrP+Fq8cC5BUYQ3ZhAJqo3nndUyHoPAgvdhx36zyO
   XZgYmGJ0yCbmxefNOU9sbrgZ4KxfG+IXgmGuKUCkCGi1/WWwkNE3iZqWk
   vK6NdUHRjkAOYikxgwOJT7RHwl1RIHN1xdq/f30Kwy9Lq8FnrcjNqkAuU
   8Rpuy1DahD/eG4Kncxu5UX3pFsVVkP7fdE3A7iWjshJQVgC6BnSXOOxfg
   A==;
X-CSE-ConnectionGUID: Gqe3aDzmTgC26hda4iz8Sw==
X-CSE-MsgGUID: PdbhQN5cSy2uHtCwy4ISDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="53327769"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="53327769"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 12:33:17 -0800
X-CSE-ConnectionGUID: MHcqrWCvT0Kb8CZsbFqiEg==
X-CSE-MsgGUID: nYIiGZ0lSya3S4kDjkePhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="195956004"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Nov 2025 12:33:15 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMBL7-0004Xx-0G;
	Thu, 20 Nov 2025 20:33:13 +0000
Date: Fri, 21 Nov 2025 04:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
Message-ID: <202511210427.s8clI0Az-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: 584e61452f75bfeac2cdd83730b4059526ec60c7 rust: helpers: Remove volatile qualifier from io helpers
date:   7 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210427.s8clI0Az-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210427.s8clI0Az-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210427.s8clI0Az-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
   --> rust/kernel/block/mq/operations.rs:15:33
   |
   15 | use core::{marker::PhantomData, sync::atomic::AtomicU64, sync::atomic::Ordering};
   |                                 ^^^^^^^^^^^^^^---------
   |                                 |             |
   |                                 |             help: a similar name exists in the module: `AtomicU32`
   |                                 no `AtomicU64` in `sync::atomic`
--
>> error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
   --> rust/kernel/block/mq/request.rs:16:20
   |
   16 |     sync::atomic::{AtomicU64, Ordering},
   |                    ^^^^^^^^^
   |                    |
   |                    no `AtomicU64` in `sync::atomic`
   |                    help: a similar name exists in the module: `AtomicU32`
--
>> error[E0560]: struct `blk_mq_tag_set` has no field named `timeout`
   --> rust/kernel/block/mq/tag_set.rs:50:21
   |
   50 |                     timeout: 0, // 0 means default which is 30Hz in C
   |                     ^^^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_tag_set` has no field named `numa_node`
   --> rust/kernel/block/mq/tag_set.rs:51:21
   |
   51 |                     numa_node: bindings::NUMA_NO_NODE,
   |                     ^^^^^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_tag_set` has no field named `queue_depth`
   --> rust/kernel/block/mq/tag_set.rs:52:21
   |
   52 |                     queue_depth: num_tags,
   |                     ^^^^^^^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_tag_set` has no field named `cmd_size`
   --> rust/kernel/block/mq/tag_set.rs:53:21
   |
   53 |                     cmd_size,
   |                     ^^^^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_tag_set` has no field named `flags`
   --> rust/kernel/block/mq/tag_set.rs:54:21
   |
   54 |                     flags: 0,
   |                     ^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_tag_set` has no field named `driver_data`
   --> rust/kernel/block/mq/tag_set.rs:55:21
   |
   55 |                     driver_data: core::ptr::null_mut::<crate::ffi::c_void>(),
   |                     ^^^^^^^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_tag_set` has no field named `nr_maps`
   --> rust/kernel/block/mq/tag_set.rs:56:21
   |
   56 |                     nr_maps: num_maps,
   |                     ^^^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `block_device_operations` has no field named `submit_bio`
   --> rust/kernel/block/mq/gen_disk.rs:116:13
   |
   116 |             submit_bio: None,
   |             ^^^^^^^^^^ `block_device_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `block_device_operations` has no field named `open`
   --> rust/kernel/block/mq/gen_disk.rs:117:13
   |
   117 |             open: None,
   |             ^^^^ `block_device_operations` does not have this field
   |
   = note: available fields are: `_address`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

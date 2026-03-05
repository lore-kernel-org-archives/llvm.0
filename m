Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA593BED4D;
	Thu,  5 Mar 2026 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723787; cv=none; b=gnchcuq15uXMLis60IJCEH8c6aLOOP1+IaI2ygkDIku1sXAx3it70hwTEJfsHR/XuYq791iV1ti/xsyr4loOrIt2HTx6ggLHinAJqKQBhWfP4DoCxR0AiB6/v3rY62aq26k5BBMUW5jQ2tMtf+semIuZNXtic8g906PSDTLQZHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723787; c=relaxed/simple;
	bh=aZZgKtJalOouoj+gAlljURHtikPG8/m5S6DSFzx5Y7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mccrcDs+q5rssmK2LxPrK/m7o7th58xY3Imgk0s8D4cUmtvqwWudzHroTNohShR4oJE+MSBVxcOG2E/6UH36u5FyNA0voEtSGKD8j78pD8qiOH26afafeiF0yG7kY+G8CP9fbxaOXtB5ZCYqxSwVEsSUzyCZb7iPnHKvdds3X3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdqSfarp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdqSfarp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772723786; x=1804259786;
  h=date:from:to:cc:subject:message-id;
  bh=aZZgKtJalOouoj+gAlljURHtikPG8/m5S6DSFzx5Y7E=;
  b=NdqSfarpY1hc+G5QhkMV0XOpKNTOZvM3/yHD7slXntpJZKmDnEYycRxJ
   qB+2n0SkBFr9nFsRob4Y2934WaNwK/yVp2o1XwIGaPo+psyBnCdSB/rBp
   vGA3CdwZc6An2ho422IEfJKJanGi+BRCo4HjOLfD1G8CUmnxaB1WC7Xv5
   WEJyBYvSqZU67NHFbvL7/xtJzVATsxDlYOdkMM0xb3OUBSh8y+eFM8h8Y
   JfftKjaaty7p3u+tBiDspKfZSem1CmYMqwEUskrnU2mxE2PcaVXgFKFVX
   NYbH7zl/P33bmMOhXxcAyKp1/YD+A8w7LtHzoOEQC9iLF8qWfGz8kZuwd
   Q==;
X-CSE-ConnectionGUID: odXFu9SGQW6cwbZkWmrhHw==
X-CSE-MsgGUID: qm/ueu4IQyK6J94xi8zVdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="96431001"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="96431001"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 07:16:15 -0800
X-CSE-ConnectionGUID: lZGvJUIsSn2Fo8NpPw4ITg==
X-CSE-MsgGUID: MeuFIp1QTPGtFGyNG+6pxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223667082"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2026 07:16:13 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyAQs-000000000oY-2VwP;
	Thu, 05 Mar 2026 15:16:10 +0000
Date: Thu, 05 Mar 2026 23:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 467/467] error[E0609]: no field `read` on
 type `bindings::file_operations`
Message-ID: <202603052346.tJiBfE6p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a [467/467] fs: finally remove ->read() and ->write() from file_operations
config: x86_64-randconfig-001-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052346.tJiBfE6p-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052346.tJiBfE6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052346.tJiBfE6p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `read` on type `bindings::file_operations`
   --> rust/kernel/drm/gem/mod.rs:307:10
   |
   307 |     fops.read = Some(bindings::drm_read);
   |          ^^^^ unknown field
   |
   = note: available fields are: `owner`, `fop_flags`, `llseek`, `read_iter`, `write_iter` ... and 27 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `read`
   --> rust/kernel/debugfs/file_ops.rs:134:13
   |
   134 |             read: Some(bindings::seq_read),
   |             ^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 24 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `read`
   --> rust/kernel/debugfs/file_ops.rs:186:13
   |
   186 |             read: Some(bindings::seq_read),
   |             ^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 24 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `write`
   --> rust/kernel/debugfs/file_ops.rs:187:13
   |
   187 |             write: Some(write::<T>),
   |             ^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 24 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `write`
   --> rust/kernel/debugfs/file_ops.rs:243:13
   |
   243 |             write: Some(write_only_write::<T>),
   |             ^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 25 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `read`
   --> rust/kernel/debugfs/file_ops.rs:294:13
   |
   294 |             read: Some(blob_read::<T>),
   |             ^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 25 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `write`
   --> rust/kernel/debugfs/file_ops.rs:348:13
   |
   348 |             write: Some(blob_write::<T>),
   |             ^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 25 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `read`
   --> rust/kernel/debugfs/file_ops.rs:372:13
   |
   372 |             read: Some(blob_read::<T>),
   |             ^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 25 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `write`
   --> rust/kernel/debugfs/file_ops.rs:373:13
   |
   373 |             write: Some(blob_write::<T>),
   |             ^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 25 others

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

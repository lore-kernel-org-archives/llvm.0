Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4342D7D41;
	Thu, 20 Nov 2025 20:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763669477; cv=none; b=YLwZ+4RAIDhqyYeH3EwKYMC8U49sNRBYLNx4o6E2IvAQ+liyNK4xK8VywsMq+W34bYBC/LEI+YEJr30sxTV/qRKML1Yyxno87yR6QbPRKmKp51vJfkzExVjBepRFkiWBopUfLtmCDi0UGxQgkUbRWghYW+Ik2KTjXLTnZWTIDSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763669477; c=relaxed/simple;
	bh=nDCgbYGUHh5R2fCR70fjYyA0cLVk6apJ0tbFn9thAGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B9aCLz+xOb5VEyjKbg/f6+agPH3hGr4R10IaUUNGEr2zaJSKo3FPJUqUHH/WvWcA6XbHwmv4jlbiPzOka1fc5OD4FJ97Yuf2b/7c1t8Tjicvy6PiB4lYw7YFQg8WCX08NDgcy0QLqsrNmkodSDoAplFh/pJIZ2ICBeBGMZ3kuVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ng2fTYRl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ng2fTYRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763669475; x=1795205475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nDCgbYGUHh5R2fCR70fjYyA0cLVk6apJ0tbFn9thAGU=;
  b=Ng2fTYRliS1MSCTj3ivp4VEvpRl0e3KgmR1v+ymlZanV1YcDt9ebvcS7
   rwYuJKJlp5tpoTNZph1vMhQ4Eex4knbU6VRaFnWmcTrBBt4NhSTO6MV+n
   +giHBqXewZzrxyETJ3ubZsDXR5jpX6w/M0Ed5qtOeGlHWUBZSkTie/r3W
   z/BpHOE8lmAE3tv+pi1aSHdzY6/51C1SWs4lecxPLex4GY+UYY3V2cEIp
   OKriF3K9/hFlqorMGbJgEOTPAbN47fcTnPCyeIdOR0f0EQjoHE1prrjh4
   mWfStrRC/9KIAQp/2q5VMLKNXmCFHBRXrWgDDa5oKtMmQ5jbLUv8ro7DG
   A==;
X-CSE-ConnectionGUID: VAEis2FhQJO+Br5Ri8ChNA==
X-CSE-MsgGUID: MF04a8xUSSqvrzRHaOvwXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64763904"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="64763904"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 12:11:14 -0800
X-CSE-ConnectionGUID: F6FW3Ug/Q8WNmFFN26zUWQ==
X-CSE-MsgGUID: qGejYEBgRP64O5DuxAShgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191490470"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Nov 2025 12:11:12 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMAzl-0004WZ-35;
	Thu, 20 Nov 2025 20:11:09 +0000
Date: Fri, 21 Nov 2025 04:11:00 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: error[E0560]: struct `blk_mq_tag_set` has no field named `ops`
Message-ID: <202511210403.9bkugEMc-lkp@intel.com>
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
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210403.9bkugEMc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210403.9bkugEMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210403.9bkugEMc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `blk_mq_tag_set` has no field named `ops`
   --> rust/kernel/block/mq/tag_set.rs:48:21
   |
   48 |                     ops: OperationsVTable::<T>::build(),
   |                     ^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_tag_set` has no field named `nr_hw_queues`
   --> rust/kernel/block/mq/tag_set.rs:49:21
   |
   49 |                     nr_hw_queues,
   |                     ^^^^^^^^^^^^ `blk_mq_tag_set` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0609]: no field `logical_block_size` on type `bindings::queue_limits`
   --> rust/kernel/block/mq/gen_disk.rs:99:13
   |
   99 |         lim.logical_block_size = self.logical_block_size;
   |             ^^^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `physical_block_size` on type `bindings::queue_limits`
   --> rust/kernel/block/mq/gen_disk.rs:100:13
   |
   100 |         lim.physical_block_size = self.physical_block_size;
   |             ^^^^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `features` on type `bindings::queue_limits`
   --> rust/kernel/block/mq/gen_disk.rs:102:17
   |
   102 |             lim.features = bindings::BLK_FEAT_ROTATIONAL;
   |                 ^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `fops` on type `gendisk`
   --> rust/kernel/block/mq/gen_disk.rs:140:29
   |
   140 |         unsafe { (*gendisk).fops = &TABLE };
   |                             ^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `disk_name` on type `gendisk`
   --> rust/kernel/block/mq/gen_disk.rs:146:38
   |
   146 |             unsafe { &mut (*gendisk).disk_name },
   |                                      ^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0560]: struct `blk_mq_ops` has no field named `queue_rq`
   --> rust/kernel/block/mq/operations.rs:218:9
   |
   218 |         queue_rq: Some(Self::queue_rq_callback),
   |         ^^^^^^^^ `blk_mq_ops` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_ops` has no field named `queue_rqs`
   --> rust/kernel/block/mq/operations.rs:219:9
   |
   219 |         queue_rqs: None,
   |         ^^^^^^^^^ `blk_mq_ops` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_ops` has no field named `commit_rqs`
   --> rust/kernel/block/mq/operations.rs:220:9
   |
   220 |         commit_rqs: Some(Self::commit_rqs_callback),
   |         ^^^^^^^^^^ `blk_mq_ops` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `blk_mq_ops` has no field named `get_budget`
   --> rust/kernel/block/mq/operations.rs:221:9
   |
   221 |         get_budget: None,
   |         ^^^^^^^^^^ `blk_mq_ops` does not have this field
   |
   = note: available fields are: `_address`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

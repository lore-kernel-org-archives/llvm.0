Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33964558A5;
	Thu, 20 Jun 2024 09:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718874650; cv=none; b=C+kDrJy+aTiTRK4m8NtgVMWBpkI7VJZJ1yoOqEby1AM5HgiAcGjpDx83Aflg7CyAOLDPq5A315gGR3KajoydYKxy7OAys/hM3Af0QDPecmwapQSMGOpwonXSdMaIDwSsX1vLr3fhOfRVoNbA91Bk3iqhRh9sTPm/Wcs9NgWozdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718874650; c=relaxed/simple;
	bh=F456sOBBBjZh63C7WsovySLUgG91hs7pxxwqdFRbBLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CqGLn3IHaXgKw/NdBBMSyxw80MunKEsWAEEhAykyj3yqDCxevkyA3IPTIH2J5CBNGKZ7r77V7XZMcG9bYrAWm4QdmwBBnxRitT8v4a/4NY1Cx9U9h3a+mdib+mAHjRK/BMTJM5q23CeyLwE121FevULysrK3Y8aF/9S5iE8Hjn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asV1Iqia; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asV1Iqia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718874649; x=1750410649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F456sOBBBjZh63C7WsovySLUgG91hs7pxxwqdFRbBLk=;
  b=asV1IqiaLSy6d6uBxqNVe7oDfq3YO3qy3rYv1O3Z0NOU6OBdzQwJ61br
   S3sgO3eOamzB4Dq5VXF0H+c8y3BDH7VvHivhxy6Z78ZK0UKVCLTZNJh8X
   c0yiBgdi7yEZ8qIjOkJHgxgVgkk9O17v9QNFUnCH/C0aRNRCeg3t+QSo7
   wnD1K2a/ds0gv1T8tdUfDVFDgVN9iGFtk4X1FEhmg/ayfkIpfQNzy5FDm
   Pa39bi/d1oNLqxU0WgWt++d41kkqut0HZr1CgjWGltk/wD6J3OMKLAUsh
   a+ZquGxxDXWh0n/lnuivx5ajmnlt5pw6/VIFv8/3TSoSi3CX22hKSGyM3
   A==;
X-CSE-ConnectionGUID: dGFkmdMwSnOyS8RnlWDLwg==
X-CSE-MsgGUID: GFQRmjJcS5WYOafy1dDs+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15958780"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15958780"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 02:10:48 -0700
X-CSE-ConnectionGUID: QY7/vDlOS/WPvS+fPiIUvA==
X-CSE-MsgGUID: 9TICgInqTuG3NLLQJPcGYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42837542"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Jun 2024 02:10:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKDoY-0007TI-0c;
	Thu, 20 Jun 2024 09:10:42 +0000
Date: Thu, 20 Jun 2024 17:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:for-next 51/55] error[E0425]: cannot find value
 `QUEUE_FLAG_NONROT` in crate `bindings`
Message-ID: <202406201714.7ufo4LvK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
head:   43ccacc7be96b71bf8c1461036034f1174be2f4d
commit: 69c34f07e45f2d52d9a41991867a1e5a85bbaaf3 [51/55] Merge branch 'for-6.11/block-limits' into for-6.11/block
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240620/202406201714.7ufo4LvK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201714.7ufo4LvK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201714.7ufo4LvK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `QUEUE_FLAG_NONROT` in crate `bindings`
   --> rust/kernel/block/mq/gen_disk.rs:159:61
   |
   159  |             unsafe { bindings::blk_queue_flag_set(bindings::QUEUE_FLAG_NONROT, (*gendisk).queue) };
   |                                                             ^^^^^^^^^^^^^^^^^ help: a constant with a similar name exists: `QUEUE_FLAG_NOMERGES`
   |
   ::: rust/bindings/bindings_generated.rs:9538:1
   |
   9538 | pub const QUEUE_FLAG_NOMERGES: u32 = 3;
   | ---------------------------------- similarly named constant `QUEUE_FLAG_NOMERGES` defined here
--
>> error[E0425]: cannot find value `QUEUE_FLAG_NONROT` in crate `bindings`
   --> rust/kernel/block/mq/gen_disk.rs:165:58
   |
   165  |                 bindings::blk_queue_flag_clear(bindings::QUEUE_FLAG_NONROT, (*gendisk).queue)
   |                                                          ^^^^^^^^^^^^^^^^^ help: a constant with a similar name exists: `QUEUE_FLAG_NOMERGES`
   |
   ::: rust/bindings/bindings_generated.rs:9538:1
   |
   9538 | pub const QUEUE_FLAG_NOMERGES: u32 = 3;
   | ---------------------------------- similarly named constant `QUEUE_FLAG_NOMERGES` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33DB1CAA8D;
	Sat,  1 Feb 2025 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738435911; cv=none; b=QWVlbieUqxy1rAQ9HHQsdsAUEbQSfLn2U7xOmXo8bEUHAog+FV6lCF9RKpg/QwXGuvObbBIelx/NKB4Umsg+r9eB4F5uF6o4KGyyKsGgUwuJUTiukgGK3C8u00r5G0fQC1lxdHHx7NV2vjnlafq+3idmnXc6ekvWgKNXT7FJkPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738435911; c=relaxed/simple;
	bh=4aczpRfxEDsNiMSfjmgSRmOyNOD9JjUPnU/fyS0wZaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MyjwAoqhz5RJbGUJ0nG+NSb5YTLx+zxIqm0GRLkOVjaB2IQhrZDjFZq634hdjOUMQy/ne7e83K9PRAo/ug7lO58Mq8ZqjarloXYq3KcPsLbrMY5ZPinGaVyZh9it7fmRVC/nMn4qpfRwKN0KQiQmxqA1GlGLG2WyLKHQLjyFB/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIqXOnRN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIqXOnRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738435910; x=1769971910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4aczpRfxEDsNiMSfjmgSRmOyNOD9JjUPnU/fyS0wZaY=;
  b=LIqXOnRN7n3kTwDK6BtOHW3ZqTomB0xARYdfJ9x2W5SjwQKNBlGSSZIo
   dfTtR36fB/wK5D4+YdyJMRiASx+LOVXQR/+1jA70OOV4zCxfnbQ0CeADF
   T6NiUoAhz5ugsrqyyB+133hH8RfAKJWSgocdz2MWck0A7ZYRSQ66WtdRJ
   kL2HETjfps6nodYiQbBEwAHjmMRUFqo64s2l7dY+ralwJ0Vmj8+CUWuQt
   43W7RIUjk6BpuE8pS4jeiGPn45QMBFEOWZDx79Ks8249lFhaPxV3ZhCDe
   c1s+F/i+CF+68Ry7iOHG0cSd1uAVONNLtymbLpdqaB1s3yofM79E3haLs
   w==;
X-CSE-ConnectionGUID: 7iwUXZWdTZqQRoETGd4MRA==
X-CSE-MsgGUID: 3seffSzsSreSPC8O68jBvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="38869642"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="38869642"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 10:51:47 -0800
X-CSE-ConnectionGUID: si6cm4yISoWD6sKdFBtK7A==
X-CSE-MsgGUID: wTiq9O0KQ8C8izzNH6lYBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="114917394"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Feb 2025 10:51:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teIal-000oTL-2V;
	Sat, 01 Feb 2025 18:51:43 +0000
Date: Sun, 2 Feb 2025 02:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-epoll-wait 8/9] ld.lld: error: undefined
 symbol: io_epoll_wait_cancel
Message-ID: <202502020230.Rb4StHR9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-epoll-wait
head:   edbffb871c292e33a1bb07bc0acfcbf0d36b88ff
commit: 9ffd1a7ad787d12758fe797d971dfb7a15284378 [8/9] io_uring/epoll: add support for IORING_OP_EPOLL_WAIT
config: hexagon-randconfig-001-20250202 (https://download.01.org/0day-ci/archive/20250202/202502020230.Rb4StHR9-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502020230.Rb4StHR9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502020230.Rb4StHR9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: io_epoll_wait_cancel
   >>> referenced by cancel.c:132 (io_uring/cancel.c:132)
   >>>               io_uring/cancel.o:(io_try_cancel) in archive vmlinux.a
   >>> referenced by cancel.c:132 (io_uring/cancel.c:132)
   >>>               io_uring/cancel.o:(io_try_cancel) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: io_epoll_wait_remove_all
   >>> referenced by io_uring.c:3102 (io_uring/io_uring.c:3102)
   >>>               io_uring/io_uring.o:(io_uring_try_cancel_requests) in archive vmlinux.a
   >>> referenced by io_uring.c:3102 (io_uring/io_uring.c:3102)
   >>>               io_uring/io_uring.o:(io_uring_try_cancel_requests) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

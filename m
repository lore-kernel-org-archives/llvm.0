Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD06136672;
	Wed, 30 Apr 2025 02:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745979653; cv=none; b=lE6Xkj9bv9GfgEEWYnEp8Fk3eC74nMgRlJzXGhW5lJEhu8dtHrE/EY6D17x8r4dZnXLgKg+Pu/XKMJZRcT+VwL8Hc7+1BjhDUzdDO2qE7pwrBxUGhr2qUBXnL3BxElD6KBRfOp2nAsAzrMf77Cii9B1MrG6CzqwsHrILxe3GrSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745979653; c=relaxed/simple;
	bh=F+nq/lNFbYBr+vvAWzq+Izzh8wIczF20s4s8z+psXXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Smqf2djaL7OpXAXHQMZqFnR10ySz89d4mRdYLkFFUZSyRQiBzX1QV/JZBzWA0nrQMs2rTmHuMrMDBZoZQWj298gETOr60RCYVhYppwlA3x/1ibOEl/qeV9yejQBbjvFGLhdchdUYmJ37YOgI4N5xJec6by8SF10zS4nPutgpUws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7te4Vdu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7te4Vdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745979648; x=1777515648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+nq/lNFbYBr+vvAWzq+Izzh8wIczF20s4s8z+psXXQ=;
  b=B7te4VduNJsqEb3Q2LjYVYbVIVoowKLuanvljn9ri1J0+71C8ap2a5yt
   /hWt/cR2L1rJR0WXqWKgwjGpWC4Bwgvq+nMDTfGrjJoZG2X81i/6W1Gbd
   YWG5H1kxeXC6sS1U3/iM2Jl4TPWdIuvBuhDjv6dyioFKUmYqf/sugTlOd
   z4E9vFLsGdbEvO4dGc7Qw+l19WFOx4r8DEAjpbTO6alMC6Vu5pcktDUJU
   5a9eY90fPsDMR93MIYUIt9Y9YoOukfoSiq6lXjZAa4R5oW/QPtONE85N6
   G5+9rBEHdkhVnrkBEovweHO4Y4M0vdAD2OZh8VnfXgMiq9szOD67iQWH0
   Q==;
X-CSE-ConnectionGUID: OiN0rbL/TSOY/CRP4EPWQg==
X-CSE-MsgGUID: Ju2Lh0tLRRG9Fp5LdekszA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46741014"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="46741014"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 19:20:47 -0700
X-CSE-ConnectionGUID: ziRX1C28TOqY86l16nuG7w==
X-CSE-MsgGUID: LjfilER+RNuQP03SHbSD6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134493016"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Apr 2025 19:20:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9x3z-00036j-11;
	Wed, 30 Apr 2025 02:20:43 +0000
Date: Wed, 30 Apr 2025 10:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-handle 5/5] ld.lld: error: undefined symbol:
 get_path_from_fd
Message-ID: <202504301022.hc3VqjwL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-handle
head:   545e6e52fadd5e04524e00f23b59635496318716
commit: 0519531750fa77b52759fc3c717486f69e4d69bc [5/5] io_uring: add support for IORING_OP_OPEN_BY_HANDLE
config: x86_64-buildonly-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301022.hc3VqjwL-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301022.hc3VqjwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301022.hc3VqjwL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: get_path_from_fd
   >>> referenced by openclose.c:546 (io_uring/openclose.c:546)
   >>>               vmlinux.o:(io_open_by_handle)
--
>> ld.lld: error: undefined symbol: may_decode_fh
   >>> referenced by openclose.c:554 (io_uring/openclose.c:554)
   >>>               vmlinux.o:(io_open_by_handle)
--
>> ld.lld: error: undefined symbol: do_handle_to_path
   >>> referenced by openclose.c:510 (io_uring/openclose.c:510)
   >>>               vmlinux.o:(io_open_by_handle)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

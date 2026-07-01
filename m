Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97252312807;
	Wed,  1 Jul 2026 02:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782872907; cv=none; b=UjTaVWv2Bu8pEtgAZ6Sucq18VtBuD2Ci745d87YQ1/JXIFrL/dTAGCXtxZ4Ud9c/Uvvy5x7CxgZlt784VIMXj34+5rYzyt4uy1Yt5Rias3OwNsthMhMt5EOcTlI6QrDLaTmdTbiWdNsQZMaUDBwMOmadftIE79B4C04kG+7Lg0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782872907; c=relaxed/simple;
	bh=s92TogGsUWi1p4SU5p39fHJ67w9gH92GU4p2yVVJYDg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ceZGYXHuci8t9n39Hcl/5kDXtaTMZSUbpvY3zVBCXlJrAZNf7Xo1caq/pEzGSJ1bFiPv45X/1lAaadUX9oft4PA2geCbdSKQdwPOGOIKlMjYKTy2sWKDpcKBWTdA/JJ9+6fN9Cu/aXTx/NOvRwH1azekG2QcgVL8IE2u9Eypzpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcAoCH7+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcAoCH7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782872905; x=1814408905;
  h=date:from:to:cc:subject:message-id;
  bh=s92TogGsUWi1p4SU5p39fHJ67w9gH92GU4p2yVVJYDg=;
  b=UcAoCH7+skxSlJoPUw9is3RVjyyrZhBhuk4vx7gMS1UPrWNou+m0M0C7
   PoPZO9BuMRK6ji8k8N0b3jnD16mKfGIlJh5IZShy2MzeH/AngGI6/0Jcy
   dLDO1d+cIKH7retao9vI2rGYNKn4DBEe/xu83Py+xWUVfRbVmsN69kc1P
   5xEQ736xkxCsz/48+kRU+OragFOCCX8y8wZ/a1+Bf+MYRK9Rf1P0wGlFK
   rBks9Hlj1WjGc75Qj8eUfVOOSOqDilkKqrt35D6jmpAe83Ol82UTYUx6U
   ZlvuFJS1FvJZDhL176hcOoqXosmdrQBzEtkmcsckHj1CdvqtqYgxH+B+j
   w==;
X-CSE-ConnectionGUID: 9ubnrpMGS5ys8oNbQ12fSQ==
X-CSE-MsgGUID: F7fs7ihmRPeRJkdu/DnTWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83681074"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="83681074"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 19:28:25 -0700
X-CSE-ConnectionGUID: 2/b4QIv7Tp+ExDGNnqcBvw==
X-CSE-MsgGUID: Yrzp9yikQHaqFjG2LnQEug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="249065730"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jun 2026 19:28:23 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wekgX-000000000dx-2qXr;
	Wed, 01 Jul 2026 02:28:21 +0000
Date: Wed, 01 Jul 2026 04:27:44 +0200
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v2 11/13] Warning:
 io_uring/rsrc.c:1428 function parameter 'ctx' not described in
 'io_register_buffers_alloc_for_file'
Message-ID: <202607010401.SQ6UxVG3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v2
head:   da75cc2253180af718ba0b7b3684a091b16b14fb
commit: 83df08bcb3ef8910445506a7f1e4214a12c4ead6 [11/13] io_uring: add IORING_REGISTER_BUFFERS_ALLOC_FOR_FILE (opcode 38)
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260701/202607010401.SQ6UxVG3-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010401.SQ6UxVG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010401.SQ6UxVG3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: io_uring/rsrc.c:1428 function parameter 'ctx' not described in 'io_register_buffers_alloc_for_file'
>> Warning: io_uring/rsrc.c:1428 function parameter 'arg' not described in 'io_register_buffers_alloc_for_file'
>> Warning: io_uring/rsrc.c:1657 function parameter 'ioucmd' not described in 'io_uring_cmd_fixed_buf_get_imu'
>> Warning: io_uring/rsrc.c:1657 function parameter 'issue_flags' not described in 'io_uring_cmd_fixed_buf_get_imu'
>> Warning: io_uring/rsrc.c:1678 function parameter 'ioucmd' not described in 'io_uring_cmd_blk_iobuf_validate'
>> Warning: io_uring/rsrc.c:1678 function parameter 'issue_flags' not described in 'io_uring_cmd_blk_iobuf_validate'
>> Warning: io_uring/rsrc.c:1678 function parameter 'expected_q' not described in 'io_uring_cmd_blk_iobuf_validate'
>> Warning: io_uring/rsrc.c:1428 function parameter 'ctx' not described in 'io_register_buffers_alloc_for_file'
>> Warning: io_uring/rsrc.c:1428 function parameter 'arg' not described in 'io_register_buffers_alloc_for_file'
>> Warning: io_uring/rsrc.c:1657 function parameter 'ioucmd' not described in 'io_uring_cmd_fixed_buf_get_imu'
>> Warning: io_uring/rsrc.c:1657 function parameter 'issue_flags' not described in 'io_uring_cmd_fixed_buf_get_imu'
>> Warning: io_uring/rsrc.c:1678 function parameter 'ioucmd' not described in 'io_uring_cmd_blk_iobuf_validate'
>> Warning: io_uring/rsrc.c:1678 function parameter 'issue_flags' not described in 'io_uring_cmd_blk_iobuf_validate'
>> Warning: io_uring/rsrc.c:1678 function parameter 'expected_q' not described in 'io_uring_cmd_blk_iobuf_validate'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D001EA91;
	Sun, 28 Jan 2024 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706436028; cv=none; b=snstF4Hr/pZPfNtbaVvtypLEMmOQIQjpuRbck/rHgsDSY3kCzvXytFYV3UMBgIdeWSuvKOyrSkdW/QnWefIgETykV3RMpSDT/fovlYhB2pn+4yh0/7X9qtxFUvtWEca9o8UxuluVTESXzDXJG79AWLXrVRJ1Z5HAj8pnCpMilww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706436028; c=relaxed/simple;
	bh=BtI8vIVa5D3LZPysYpfOF3YcoXbNE1CgSeFQzr7FrS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V68ARfLXxZ/ka/+cuw9Hgby6Iq8Mvd3byIN3xuOmbmHXb9wVMO05uHq8QWs9l6Pe6uAf7uYVkArMGlRZicbyWwkZYOjB8vJz+c2nzMzlYKE4xRCBBEUwOlDhaOqVK5IDFOWZ7XwyVMSdZgemCUuS0RM45ezh0RMAiKRgqBwf81I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=co/rZpOE; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="co/rZpOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706436025; x=1737972025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BtI8vIVa5D3LZPysYpfOF3YcoXbNE1CgSeFQzr7FrS0=;
  b=co/rZpOEwZ/V1IJYDlXb4+7HyU4ia0KUxyc60icTQxQZu4r4JoGkcbbR
   2p0oNc2oYVNX9YLFVpFn8XdtRXij8XJmspb1aZEbYBpF/bUue+LNpCPjt
   IeYKihbYLeb1a3HggsxBn/FicbGsc4PNgojZdz+JjcQRYTDpy99DhR7Tq
   X9vxPBc6+0u2m4Xq/KgWgIGRESeeErd+P6R1SLO579oNVF4fvlPnx1brK
   ZboiJEb8Rpsq/w3ukiu9j9x8seL4YMd8qkGGOsiAhtJ0idaAn8285xw4j
   h0b0lC8cl+ltYj2geclonpv6aEg6iIm9/RcJ7nh478e1Cjm3vpFurWIBz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="393190675"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="393190675"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 02:00:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3131961"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2024 02:00:23 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU1xd-0003J8-0p;
	Sun, 28 Jan 2024 10:00:21 +0000
Date: Sun, 28 Jan 2024 17:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:uptr_v3 2/10] ld.lld: error: undefined symbol: arena_map_ops
Message-ID: <202401281753.r1MVlWnK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git uptr_v3
head:   7ec22ac2adbc15f8ea20c1189b2dd95558ae3bcf
commit: d206ce01ebb5f2a692aeb44b109a625c9d8ac0a8 [2/10] bpf: Introduce bpf arena.
config: i386-buildonly-randconfig-003-20240128 (https://download.01.org/0day-ci/archive/20240128/202401281753.r1MVlWnK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281753.r1MVlWnK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281753.r1MVlWnK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arena_map_ops
   >>> referenced by syscall.c
   >>>               kernel/bpf/syscall.o:(bpf_map_types) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

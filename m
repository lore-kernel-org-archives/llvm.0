Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6A128E7;
	Mon, 27 Jan 2025 00:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737939478; cv=none; b=WRj1Ze1HmnZ0Yg0QjuTT7aRH+ok+nxU6/8nRUwhCuSVAE9ogsFe6VYyfQtpNgulKIdjEIIb1ld45ZT2mG6SY3g6ZrBt/pJciJLOZWit5P1P/7HVlBNOxKVin9u0eGLNvj6AeW5F7jGiApIx+SOxpAtA5aRWoGltxAO4zYWvvQ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737939478; c=relaxed/simple;
	bh=eH0K/oklgDFG6QmVHDfhvFE0xc3RurtbBNnoUgL3CVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bq7hvwX6UpGTFacJibP0ABkmg/Cfg1KFacnDb3bHTHKoFTPmB932tkTbccPlEMVGT1SUWSbiUq27RljnTiqjTKVNoGxOK9OR6ilG+1yx3doYP36AYgO7/uYQeMfe4SDcnPyILKvJU4d04bBo/bkBnVXeXcq2jT9o8JFd69sucvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSpiDrsI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSpiDrsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737939477; x=1769475477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eH0K/oklgDFG6QmVHDfhvFE0xc3RurtbBNnoUgL3CVI=;
  b=XSpiDrsIHqQWjpcjSV5Gv2jxT8W3d4pwKD3AL42IXiHcxJkuOTejHlhj
   /zbmhHNTLGP4reBC0rphJg5sOJoXaT2lu114HYhgLzc7lbTAlagOBEtop
   qMCpIY77p/JFMviGCBo2URZ2GK41X0SedoQG1jFXG1Hz06N7W416ehS9Y
   uDm35Bn5vLrF5QWUjSlXggXKjyktMycZ7Q/hXrJI9QGbBM0+1H1DzyXX2
   jN+WiVBZS7iYqW2UXEPHyn6v4DpiU8VCCS1eXwPU7xmTP+ircsLwsSdeV
   cBD96oueSk+ozMEhj4kg4JnVapzdjiBqknqwKcs5NqG2oL5AK4AoKcFiZ
   Q==;
X-CSE-ConnectionGUID: CQX/pD2lQP2SVnXwPt6V6Q==
X-CSE-MsgGUID: FhtTYOehQ3+eWuNvXEVznw==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="25994575"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="25994575"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 16:57:54 -0800
X-CSE-ConnectionGUID: acmni5udQSerxkAtbzcD6w==
X-CSE-MsgGUID: +jvzGLp8RHid8pd/6ANvBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="139152542"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Jan 2025 16:57:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcDRm-000gGF-0k;
	Mon, 27 Jan 2025 00:57:50 +0000
Date: Mon, 27 Jan 2025 08:57:12 +0800
From: kernel test robot <lkp@intel.com>
To: James Clark <james.clark@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [arm-integrator:b4/dead-deamons 2/5] ld.lld: error: duplicate
 symbol: __per_cpu_offset
Message-ID: <202501270827.JZ9JRCox-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/dead-deamons
head:   337a23015919bdcaf25c1f3bbfcb7b5bd11d7029
commit: a3a4fafbdc9963ed91b21a60f503fdf1ccdc8183 [2/5] Allow no SMP builds
config: i386-buildonly-randconfig-002-20250127 (https://download.01.org/0day-ci/archive/20250127/202501270827.JZ9JRCox-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501270827.JZ9JRCox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270827.JZ9JRCox-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __per_cpu_offset
   >>> defined at setup_percpu.c
   >>>            arch/x86/kernel/setup_percpu.o:(__per_cpu_offset) in archive vmlinux.a
   >>> defined at percpu.c
   >>>            mm/percpu.o:(.data..read_mostly+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

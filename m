Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2303213C9B3;
	Mon,  7 Oct 2024 08:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728291103; cv=none; b=L9yVx1vbQ77BoqD0aNahG04u8oqBhWHIhDs6WVNqAx06vZI2SHw8nCODPijT0xF4NV9ZbtCni9P5b0LJkkxaKOUdNuUwM8cZ3iJnjfpT9oo7Ur76Sa5OAKo7swpEBNOKb62VDxQt1WJbEE73UXc05spuWn2hTiqa8iRg5Lq6HPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728291103; c=relaxed/simple;
	bh=kXdCVCL4h1TvLxSVDQtEeJED75mFBUuamkn/7xPc6Co=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WF9tJgyyp7xJa6PXOqZSqZdHLv6jytfKqEOIHc5p5AWFCL1U4K8CKTlaJKxrjoJPlfop3ubi5wLBhT8rGyNRTSz6/4ixrMvT0WdaJt8ArSPwKNqcnMBmq7A93ViPS7sleTo76boFfJyjW0vo2aIfSmbJMOeLEe1xy2PnneDgEh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9CYKnES; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9CYKnES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728291101; x=1759827101;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kXdCVCL4h1TvLxSVDQtEeJED75mFBUuamkn/7xPc6Co=;
  b=G9CYKnESMDVF6FHIJns83oZJASO7vQg5xco8WE7ZdXEFaxcqDtlzWaJL
   zouHioCoRN19md3hE7RKe878Wb13LgJdj1S43jIeR5XOYZuHmNAyjkrI3
   E27XmoVlq08KtqMDpfgyUl1Jdzjf5iNCSX6sB0IPJQN7Xq1LL+etTmdII
   zPqfjAiBOryc80Rq4FEZvHxDkmPwkNhZaWj5zZxhVmHthqnSrxGwKMzOs
   7GLkE6Ascfiv/vM2yKX2drmjAz68Prf1ZiAFHi/euhs83NFy/ffAe9rMS
   EoIQGRhE1DYh6cUCW6MDnuoz4fD72rNsZKSgE2c02g7RFCbGKn7O9pQYa
   w==;
X-CSE-ConnectionGUID: jnrA83yRRzW0BGeq87aCxA==
X-CSE-MsgGUID: kkmoKzjBSESvgwBIRpv7hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="15047084"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="15047084"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 01:51:41 -0700
X-CSE-ConnectionGUID: ki3Kk7p7SS+FZSDK4SuLjA==
X-CSE-MsgGUID: +fEgfXiwQMiDO7tPkq+dUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="79387527"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Oct 2024 01:51:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxjSr-0004my-2M;
	Mon, 07 Oct 2024 08:51:37 +0000
Date: Mon, 7 Oct 2024 16:51:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [asahilinux:asahi 161/210] ld.lld: error:
 vmlinux.a(init/main.o):(function init_setup: .init.text+0xc8): relocation
 R_RISCV_HI20 out of range: 532672 is not in [-524288, 524287]; references
 'argv_init'
Message-ID: <202410071630.dlBX2TVW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux asahi
head:   de1c5a8be0ee99602e472f3ca861cc2d249597da
commit: 0454fb65c328726fb6b81e0699fde77a8142731b [161/210] arm64: dts: apple: t8112-j473: Use dcpext for HDMI out
config: riscv-randconfig-001-20241007 (https://download.01.org/0day-ci/archive/20241007/202410071630.dlBX2TVW-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410071630.dlBX2TVW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410071630.dlBX2TVW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function init_setup: .init.text+0xc8): relocation R_RISCV_HI20 out of range: 532672 is not in [-524288, 524287]; references 'argv_init'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function rdinit_setup: .init.text+0xec): relocation R_RISCV_HI20 out of range: 532672 is not in [-524288, 524287]; references 'ramdisk_execute_command'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function rdinit_setup: .init.text+0xf4): relocation R_RISCV_HI20 out of range: 532672 is not in [-524288, 524287]; references 'argv_init'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x23c): relocation R_RISCV_HI20 out of range: 532672 is not in [-524288, 524287]; references 'blacklisted_initcalls'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

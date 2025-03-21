Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D6E2343C9;
	Fri, 21 Mar 2025 21:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742593723; cv=none; b=RWKAcmJHMOj6CKSzGldiYE1j/m5W/7yuy0Q72xsaslCT/MR4vVjc/thRlCmGfG8rx/g57JO5Y6F7K7hqpwlzk6q6hwLOcV395sOBcmH2p4WCwKcrVxRMgwh5L0JM9TQB9WrISXfrEbqDlF3wk/eszvP2vM1h0xzEkPs0QJqvK3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742593723; c=relaxed/simple;
	bh=6mk8O9eU4JBqV3sDPb+BhAhyW+xE/8Ms1o6FontpNk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LE1W51YbZllT9sQweHUQOVsmAMg4RGE4QEMyo2gqQ1IW6zAsIUDDUjY6YXEQvZY9sldVNmu6qFiSeEm1HS7QnBa4dgxrevSbQDjCO5JFGKSvdM49i/vAf6MQygqm+CZaDlMM9v5D/cLOhcvz3ifEeck0u9DdJLnHt9QrOXbA+V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEMhb+VN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEMhb+VN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742593722; x=1774129722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6mk8O9eU4JBqV3sDPb+BhAhyW+xE/8Ms1o6FontpNk0=;
  b=IEMhb+VNGsVCkRiSZeq47mVOIePeZt1cOeUgxOY+4vyIilwGIDL+ihnL
   fxDqtindsjbZ+4S3dRMlx/66QV3sCNdvRi5Tf2Nua1wN8rBC0I27jUkZd
   eigQU76UQKt4GwRWj10CA7W2q98TE8+oAmorWUKyo1Wbw+dDdT++OVadz
   KmiKjvXV+R4WcAVg0Lif9ZgWKQIoTQ6yQxjqiUlyycoiLLVPdmvqhRQmX
   syM8RyoE/5OVI0HsN/BAQs6u6PXhMtPj2M60MiKutVsE7+ULhmHz2r19u
   +0BPPvHyr2CBwncYxRNGsVt4I6MgBxyzV/POElZC+lpEI+Ik6FgbqljIJ
   Q==;
X-CSE-ConnectionGUID: vK8GS7CMQqmeWpzimsYA0Q==
X-CSE-MsgGUID: SJvetHztT3K+OSpQarvznQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54866590"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="54866590"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 14:48:40 -0700
X-CSE-ConnectionGUID: /wLrNCUOQ2SgHy/NTvIK6A==
X-CSE-MsgGUID: zK42QOquRfGgwK35IBT04Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="124289750"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Mar 2025 14:48:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvkEG-0001i5-1b;
	Fri, 21 Mar 2025 21:48:36 +0000
Date: Sat, 22 Mar 2025 05:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [congwang:net 13/15] ld.lld: error: relocation R_PPC_ADDR16_HA
 cannot be used against symbol 'cur_cpu_spec'; recompile with -fPIC
Message-ID: <202503220548.ryFEa8Fa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/congwang/linux.git net
head:   159606d3b1bf9dcaecb690f6f3032ef6a091a7eb
commit: 6985f9f0bf76ac3fc6d025a19f0224b636c00823 [13/15] selftests/tc-testing: Add a test case for FQ_CODEL with HFSC parent
config: powerpc-randconfig-001-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220548.ryFEa8Fa-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220548.ryFEa8Fa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220548.ryFEa8Fa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'cur_cpu_spec'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/cputable.o)
   >>> referenced by cputable.c:82 (arch/powerpc/kernel/cputable.c:82)
   >>>               arch/powerpc/kernel/cputable.o:(setup_cpu_spec) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'cur_cpu_spec'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/cputable.o)
   >>> referenced by cputable.c:82 (arch/powerpc/kernel/cputable.c:82)
   >>>               arch/powerpc/kernel/cputable.o:(setup_cpu_spec) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'cur_cpu_spec'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/cputable.o)
   >>> referenced by cputable.c:44 (arch/powerpc/kernel/cputable.c:44)
   >>>               arch/powerpc/kernel/cputable.o:(set_cur_cpu_spec) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'cur_cpu_spec'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/cputable.o)
   >>> referenced by cputable.c:44 (arch/powerpc/kernel/cputable.c:44)
   >>>               arch/powerpc/kernel/cputable.o:(set_cur_cpu_spec) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

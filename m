Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CEE236A73;
	Thu, 18 Dec 2025 04:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766033557; cv=none; b=JEIIwDKwxP+bFPqajVWw+F0Tuyc6Uzl19Cqg7mj+RhsbRgb1vU2BwMcSr1JpjE18sv4CqofljrOC+Y9dUdTxGnySMb/0Zn/Bl42fAINbkj7JdWdj0hgGQobfMXU0xbqWzrN9SRVSXfGPBSA0o6Jl9LrXV7BHz1RmXOJswCzgqgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766033557; c=relaxed/simple;
	bh=LzPRPwnPK6N335i7cOKaK3u8dJZ41Xs/GkbPi/RstXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RqB5TS2QDrd8u40pC9pUscoGRCc+ZomcrOfy8RBhf8GUFvznCaC3u6ecFYXEanwB5guveMHRsfm5Ck6fikKC7wseNnQ18udzUHmfuYS7/FI1JxbvH+VRTYG8Qu2Lscg6CxmGt+NBXAbKptgy93zLKj8ItfQScZEN+aixFMpAbH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKZpoW/3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKZpoW/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766033556; x=1797569556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LzPRPwnPK6N335i7cOKaK3u8dJZ41Xs/GkbPi/RstXs=;
  b=bKZpoW/3+wPetZogpRezFxNSzuUlJX4mui5p3MnfFYFiNKj5uOYOoqHY
   Qh/I2b05Y6HyCdukLGFANAeTNPI+mr7sSkwumFgQDeKo1vXPaH/oqfel+
   IiG8kpF4lLuMvKV/k9q5dAzvot6MwISYDNZkikiggPrf9MJrfD7tYiPa/
   +S+39WlNjGNJvEg+etMsl2m3yU7c7VkqpaBtbSXaLxAugOqkSXBr5L0+S
   mlyKC1Tx4qg6xHnNC5gYzAUdoRyn+rocsdiKTNOaR86vgatYArGECtZsC
   Bgi8H8mkeaf0OKmieS/nL28XpNQ/pe7XYZobSSz4S7ZfbggQ6SYa5QEy3
   Q==;
X-CSE-ConnectionGUID: e2I0633pRb6BC7p0xBabIQ==
X-CSE-MsgGUID: iXyuAizcRZqUT955/JazjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78619926"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="78619926"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 20:52:35 -0800
X-CSE-ConnectionGUID: SCMtEjZQRhmiaSTu2RYadQ==
X-CSE-MsgGUID: ED8Fkbg3QGSPMkFLQXY9DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="221891195"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Dec 2025 20:52:34 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW608-000000001ax-2SWr;
	Thu, 18 Dec 2025 04:52:32 +0000
Date: Thu, 18 Dec 2025 12:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/dovec_consolidate 18/24] Warning:
 kernel/sysctl.c:537 function parameter 'negp' not described in
 'proc_int_conv'
Message-ID: <202512181258.fU3a2wfJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/dovec_consolidate
head:   96185449a89d542ae186d3a530dfd59920e7773a
commit: 67c3c1468ae67eab5f2d5b890fcb0792ad6c52c8 [18/24] sysctl : SQUASH when  proc_int_conv was introduced
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251218/202512181258.fU3a2wfJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181258.fU3a2wfJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181258.fU3a2wfJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: kernel/sysctl.c:475 function parameter 'u_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'k_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'negp' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'k_ptr_op' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:502 function parameter 'u_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'k_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'negp' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'u_ptr_op' not described in 'proc_int_u2k_conv_uop'
>> Warning: kernel/sysctl.c:537 function parameter 'negp' not described in 'proc_int_conv'
   Warning: kernel/sysctl.c:475 function parameter 'u_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'k_ptr' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'negp' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:475 function parameter 'k_ptr_op' not described in 'proc_int_k2u_conv_kop'
   Warning: kernel/sysctl.c:502 function parameter 'u_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'k_ptr' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'negp' not described in 'proc_int_u2k_conv_uop'
   Warning: kernel/sysctl.c:502 function parameter 'u_ptr_op' not described in 'proc_int_u2k_conv_uop'
>> Warning: kernel/sysctl.c:537 function parameter 'negp' not described in 'proc_int_conv'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

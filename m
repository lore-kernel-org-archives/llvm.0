Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1852D153800;
	Sat, 24 May 2025 02:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748053019; cv=none; b=jgDc40u7uAqCnlP5mjM9mxYqe46C5pcpFkfki6XqWiv1Md2p6mMNx+T7Vd807raDrej/BTo5WMWnDRLH3TLzhYycH4q61B4AV/B5QYre+2R9ERjro7uFaPRtZRVRRqZdT4Ur1z/0xtvjsFTSsLBGn9mjA7UYDKuo4GapU0YujeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748053019; c=relaxed/simple;
	bh=WOSGlihJtEU34U6O8NnLDz3j93syK8/QWXetIUc5s2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ozPjfEkQrMOsLSiKWdXV2Ra0jMUmFXOaKgQRKTR3PbdlsPEIDv0EQUaj/zw89Z03mcaHB8xjeHdBb5rxJjB/ZMRUwDHsUIZuEDA9OuphnJaYi/pSg/x4C07i78WcTxRLFkYtMCwl1mi8cKy/EgSfpw6tGpM/aFEhUWqkw9RnkUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7M35fs1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7M35fs1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748053017; x=1779589017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WOSGlihJtEU34U6O8NnLDz3j93syK8/QWXetIUc5s2Y=;
  b=F7M35fs1raJH17x02rYHFNJWXnZvkQzgMQV1mQ/SObIfkkvFk/9vpTDa
   Raq+xLRBD3OlKL8He7ZVjDk48ywT0wrKIawK4wMsb+Klfp9bfjJG/aWHR
   2DDSzhRQpBVYX5mMntVbgmF269MUqAiadNvWrJ685TKoBFBW9ttKrqO/V
   AZtcyYC/z3RFji/64rxPoBJF4FownOgxKgHe2z2LfuQazyUYgF2b0wcJq
   YUzjQiY8TTZzx3zlkCkNfQpezJybJczIJsOitmi+L9oFz19KujPMJZNkp
   d0kQOw9coXtQefi608HRT9Y7LC8vC2wn/VGhsM4XLzuP4HGQHsTXGPBv6
   A==;
X-CSE-ConnectionGUID: bg68hlvPSGq1o2sfGHfXuQ==
X-CSE-MsgGUID: kM6xUe9KScG3hA/77GXuCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50035651"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="50035651"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 19:16:56 -0700
X-CSE-ConnectionGUID: MEMxj/2NRcWZynUAqpnuIA==
X-CSE-MsgGUID: FbJZDHNaTLiNQCpjOP64MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="141249484"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 May 2025 19:16:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIeRQ-000Qse-3D;
	Sat, 24 May 2025 02:16:53 +0000
Date: Sat, 24 May 2025 10:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:container 5/15] <stdin>:1624:2: warning: syscall
 container_socket not implemented
Message-ID: <202505241049.EEm4Y7WO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git container
head:   e934156b00c64a64a048108513ab445a232c2120
commit: b3035c6262433d8f174669c7b4bc48a03d119e86 [5/15] containers: Open a socket inside a container
config: hexagon-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241049.EEm4Y7WO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241049.EEm4Y7WO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241049.EEm4Y7WO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1618:2: warning: syscall container_create not implemented [-W#warnings]
    1618 | #warning syscall container_create not implemented
         |  ^
   <stdin>:1621:2: warning: syscall fork_into_container not implemented [-W#warnings]
    1621 | #warning syscall fork_into_container not implemented
         |  ^
>> <stdin>:1624:2: warning: syscall container_socket not implemented [-W#warnings]
    1624 | #warning syscall container_socket not implemented
         |  ^
   3 warnings generated.
--
   <stdin>:1618:2: warning: syscall container_create not implemented [-W#warnings]
    1618 | #warning syscall container_create not implemented
         |  ^
   <stdin>:1621:2: warning: syscall fork_into_container not implemented [-W#warnings]
    1621 | #warning syscall fork_into_container not implemented
         |  ^
>> <stdin>:1624:2: warning: syscall container_socket not implemented [-W#warnings]
    1624 | #warning syscall container_socket not implemented
         |  ^
   3 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

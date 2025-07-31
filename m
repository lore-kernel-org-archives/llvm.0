Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880D6189F5C;
	Thu, 31 Jul 2025 18:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753987493; cv=none; b=JOUNx+IRqo+50Ny+9IVq8jX/J928sI3vBJEfD9YOEt+JLqtYu4wDKpmgDZMhniLoecRlrU77Vl4NrFIuuBsrt2aER0zy9PoLxYpey/6MupvdXc4DaW83A5PPMHbX/QKexv3woC9p+UrRfs4e6dzPBs/j42qvsUy/stYuTNlEy0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753987493; c=relaxed/simple;
	bh=P7jD3MMcmN57TsVLJBDzz9Y37GLa9OFqgZnGzOxeQZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IEADZp6bjnbp0xTPeBOBH/RLhenx6F599xVUg48dpMWva3vOTI3x8RNsQ5LHfjUiNcrxxnVI7AppamQhNIrFLxTrypAntGLjL9WSjImicata4kfJctSgyw4YcTh4H9Vfo3BDe81qBfyxzjw+IJLkP1kX8WazNcWapuXTMaDFTCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OK/Uiawi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OK/Uiawi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753987492; x=1785523492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P7jD3MMcmN57TsVLJBDzz9Y37GLa9OFqgZnGzOxeQZ8=;
  b=OK/Uiawij2qwUEHDjl0XXvfYXI3GvRxFSCXuCiV6SuC0gDHWyDxKWhGt
   QMHuNSoF+amDWk8Utfxr8xMJ30rFOuTHVsLpUmKTgmlL6hLyisd0XRfEq
   HL7bQVCfnBIiQ9S9DDNPbpZfa9f0GUy6K50c8iapXzbLH1Be8NeMmYDaz
   lizSIdLHuuEvad0Ecbf8nGCz2/i0B1nc5qTDDmJ0gIn/AJDrFnxghERoe
   Y1I6AQ4E0e2duc9LbmLQZxqvf8q3I5cxqpTk+maeNAdtODURKg7TQWYs9
   FaVSR6ZcdekrUeus8Xgt55G56ORknNSNAoUlC4xDztS3xpR2H3jUwA3io
   w==;
X-CSE-ConnectionGUID: U1g2hYlrQZKOIoVfwk7wIQ==
X-CSE-MsgGUID: XbJRQl59QUmqPHBZTJzs8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56189700"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56189700"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 11:44:51 -0700
X-CSE-ConnectionGUID: VOgs7I22TdauEzwWimVt/g==
X-CSE-MsgGUID: CX16FHM4R++OS6EEeH+lsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="168619485"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 31 Jul 2025 11:44:50 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhYGl-000143-2k;
	Thu, 31 Jul 2025 18:44:47 +0000
Date: Thu, 31 Jul 2025 20:44:33 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 222/235] Warning: mm/shrinker.c:838
 function parameter 'out' not described in 'shrinkers_to_text'
Message-ID: <202507312016.b5T1kX8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   038530796e2ac10a6b49e577aef3837387baa877
commit: d9a34dc502b10aa61f61817aafc70b7ea29049a5 [222/235] mm: shrinker: Add a .to_text() method for shrinkers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250731/202507312016.b5T1kX8x-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507312016.b5T1kX8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507312016.b5T1kX8x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/shrinker.c:838 function parameter 'out' not described in 'shrinkers_to_text'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

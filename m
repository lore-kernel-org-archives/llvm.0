Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F266AAE;
	Sun, 19 Nov 2023 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKJ7t0p8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700385334; x=1731921334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=flqMUmVuAHhG654sA1Eyl9RYq+1fEgGbOSuC/BvCcC0=;
  b=CKJ7t0p8e4ZNvemhQroXdlvdEiYBDwmrfbNs04W5pPUOVRqlMfFcTKDe
   RCd5iZXyER0uUfrhHY0XwON939YSaCuArKGeaqXPimJQJBh4BNWcdH0J/
   nvqhnLTj9PNvEBZF/+ytm3zKH7P3Q1i0Aes9wzLxRXUifIUI7BADC3+Nv
   4IUBRTHzDVcVV7OWS0vve+r9htnoo//u0S/tmN6f3gi8PSN/Ee79+wSNG
   5nu8g4JL8B2pMHoehaELoYlUcJBUdGQqUp+sQvdxDVLB5sQ+/KNPhFtTT
   G0Rb+sO+dklfsZDwCmDrw/ZVbv/cZyFXolt3lfvi67i5TTK8HMfxe/ooq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="376519701"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="376519701"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 01:15:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="1013324274"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="1013324274"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Nov 2023 01:15:27 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4dtl-0004tj-29;
	Sun, 19 Nov 2023 09:15:25 +0000
Date: Sun, 19 Nov 2023 17:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: clang: warning: argument unused during compilation:
 '-mbranch-protection=none'
Message-ID: <202311191730.HjiepeUh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   037266a5f7239ead1530266f7d7af153d2a867fa
commit: 26e7aacb83dfd04330673c5c9ac336560da52bb3 riscv: Allow to downgrade paging mode from the command line
date:   7 months ago
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20231119/202311191730.HjiepeUh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191730.HjiepeUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191730.HjiepeUh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang: warning: argument unused during compilation: '-mbranch-protection=none' [-Wunused-command-line-argument]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

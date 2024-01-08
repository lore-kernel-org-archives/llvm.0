Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9617154BD7;
	Mon,  8 Jan 2024 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMeAsqW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704736159; x=1736272159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5TA/iReZ6oDc0tVPmzi9XmeCKJaV2dFPzZ32a82EZBc=;
  b=jMeAsqW8JpOXx4jElsDSORTFFLzKv1TCmAPG34+4Ft98oTb05WiWsVoz
   b4VH/DddWSHB+8iINrca0jyGbdWJbXIX2Vd9xaVT3K194MbwKfHEcIlQp
   7mL2H8C4HG4wfW8vNfmpTqfqlSngcijoAqPFL6Plq5GKfIH75qr3yfprq
   0QciJCD3RZh+/b0SlKhoMbFyMQJJbHlX5j9QZ4PwZtxiGHvQ5x2+d4WrB
   I38N/6ucYgy34IOSExoPQKyU6EvYnduhC4Pqg2OwE9krbizdXN/nV8+4n
   6xTH0pBVNDmiw9dPslHz2ZNBqCUv94iXLhe7qbYtF2Mhajfn3DFiz+ZlH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="388400229"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="388400229"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 09:49:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="23600764"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jan 2024 09:49:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMtkR-0004xW-01;
	Mon, 08 Jan 2024 17:49:15 +0000
Date: Tue, 9 Jan 2024 01:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.7-rc6-net-next-mv88e6xxx-leds-v3 6/8] ld.lld: error:
 undefined symbol: devm_led_classdev_unregister
Message-ID: <202401090153.zBzyXfYj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.7-rc6-net-next-mv88e6xxx-leds-v3
head:   9a48ae1a616c32799d10fcde6a9eea1bbade8496
commit: 3248e132ab2e635e3cb715ec9ff5b5bbcc5f3177 [6/8] dsa: mv88e6xxx: Create port/netdev LEDs
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240109/202401090153.zBzyXfYj-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401090153.zBzyXfYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401090153.zBzyXfYj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_led_classdev_unregister
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(netdev_leds_teardown)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NETDEV_LEDS
   Depends on [n]: NET [=y] && LEDS_CLASS [=m]=y
   Selected by [m]:
   - NET_DSA_MV88E6XXX [=m] && NETDEVICES [=y] && NET_DSA [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

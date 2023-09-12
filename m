Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A080C23A6;
	Tue, 12 Sep 2023 05:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694495065; x=1726031065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WZdiOUEz0gl14mGO1uCd5uC+oh/39Vgm8+kURTfAo8I=;
  b=Zuck5/HEOtcaWq3ZjSCpyUeyU2zelD05l1a+e+lPQPZMyBaOIon6xy71
   iikdCggfTx3AJmaWmNg9OIavAiAGCFyRSW/wFtofQYfuMjqxZqZ067D8g
   iuuI1tUOWespaDAektVM9vp4lPMnK1Wx1ygdTHj91O9FpdG8lzU0SUsmz
   H423XA+utazwHWx1oCF+dJ6cVDSDwLIvwaddTTb2R9iF8W1TOHmKMW0Al
   E7I27/9k6oOOMS62pY0uL2jxVjv+q3Sdi5zwzcqqIfmTfj7mCYzx3DmZf
   1TDAW9e/WLpj4LtL7wSWHlylLTNZ88HC3gj+aSgCTfGWpRZ/HudDnEaHk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378185396"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="378185396"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 22:04:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="867222872"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="867222872"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Sep 2023 22:04:20 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfvZS-0007M2-1o;
	Tue, 12 Sep 2023 05:04:18 +0000
Date: Tue, 12 Sep 2023 13:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [rmk-arm:aarch64/hotplug-vcpu/v6.6-rc1 31/33] ld.lld: error:
 undefined symbol: arch_unregister_cpu
Message-ID: <202309121204.koYDO7RQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm aarch64/hotplug-vcpu/v6.6-rc1
head:   8c3da820fb216ca0aa4f79018870f248733758c0
commit: 9d3c5dd53f7a68aa2ec351691174250fc680b280 [31/33] ACPI: add support to register CPUs based on the _STA enabled bit
config: x86_64-randconfig-074-20230912 (https://download.01.org/0day-ci/archive/20230912/202309121204.koYDO7RQ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121204.koYDO7RQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121204.koYDO7RQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arch_unregister_cpu
   >>> referenced by acpi_processor.c:565 (drivers/acpi/acpi_processor.c:565)
   >>>               drivers/acpi/acpi_processor.o:(acpi_processor_post_eject) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

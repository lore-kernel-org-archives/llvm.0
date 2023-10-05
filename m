Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7298638FA7;
	Thu,  5 Oct 2023 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6Vr6+g3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696526758; x=1728062758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kglZjPxuViTUgQoFwPGmRoHSFQiERT7rEBpz866nROs=;
  b=f6Vr6+g3I5C6E/2ioAbt3t7nEJ683k1mhcyQk/4J2oQ0UAfJrVrgsmWr
   4UbIKxXbmpyAKJWASH4qEKukU8CwGNOoUl2NLeMmHdVwjceysjC2Q/8Mo
   Ks0M3Sa+BMEb6i2EHSAPKccgmd6Lxhn4yHQeEpnuJ/hOZPPkiS8i+dDKY
   mWXSMhbU/2iEeFNZX+MZ3YSEYMu86sJmqAbR6ZvVqMl1nxgWbY0UCB6MB
   18bKRWwdkrRdsxHX3L5lnl36kugxtaWW3NWRjICVzggCVpzmE10nxsGLa
   6WfqdTPKNU5S855Ekar2PMLjuSEAeGCHDLCOMinlyj2TNWBr2ou5cWOSZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363844703"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="363844703"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 10:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="875629951"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="875629951"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Oct 2023 10:25:43 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoS6W-000LiS-20;
	Thu, 05 Oct 2023 17:25:40 +0000
Date: Fri, 6 Oct 2023 01:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: Milan Broz <gmazyland@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mbroz:opal-test 5/7] ./drivers/usb/storage/unusual-flags.c:4:5:
 warning: no previous prototype for function 'usb_stor_di2flags'
Message-ID: <202310060145.BAybg1x2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mbroz/linux.git opal-test
head:   8935a9b47f30e9af5eab5bc129f7b608da795ba9
commit: 369143dbdedc7e16ddbeecfe95ad6579d805e8a2 [5/7] usb-storage,uas: use host helper to generate driver info
config: arm-bcm2835_defconfig (https://download.01.org/0day-ci/archive/20231006/202310060145.BAybg1x2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060145.BAybg1x2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060145.BAybg1x2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/storage/usual-tables.c:18:
>> ./drivers/usb/storage/unusual-flags.c:4:5: warning: no previous prototype for function 'usb_stor_di2flags' [-Wmissing-prototypes]
       4 | u64 usb_stor_di2flags(unsigned long idx)
         |     ^
   ./drivers/usb/storage/unusual-flags.c:4:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
       4 | u64 usb_stor_di2flags(unsigned long idx)
         | ^
         | static 
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

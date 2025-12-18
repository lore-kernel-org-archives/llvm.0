Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B28C4CB5B;
	Thu, 18 Dec 2025 00:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766016865; cv=none; b=NMHD42ypfYRxe8JiRAuUW6JBhg6/9KYEkHbp25EnGGzDlGCZGpOz9yci+/7/R839+xbUIBNrXH/cpd6CcuuqF413uZxh36ZN6bRZ+QDS6wt7fY+mkpneyAZnAj1lIZkcaR69Uh/udcKyR+MPKlV9+Np7WNYLnvZ8L10A9DLOqAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766016865; c=relaxed/simple;
	bh=Uz9WG2SQFvqErxZsrux54jhEB4i3HXCe+oFxeMsXcbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C70pcizK2vAJdL7M3qu9mKhuo5YF15C+FHOOFfGDUt9fM1VvYvMlZwXDBY1l1Z4RdtiWlMUcsJfffZMq4KMCVNVAi2xOaCfuY14VU4dEwXnjY+iQIbUOPd2XZUGF5FNKihbibKG8X9LvaAYvLw/v6mJnr2nrsmIobDv0k7NGlXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bij+HDYi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bij+HDYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766016863; x=1797552863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uz9WG2SQFvqErxZsrux54jhEB4i3HXCe+oFxeMsXcbg=;
  b=Bij+HDYiG2e4XPsGvoQ56RsVyqPHFuUcho+imcU3hSOW30Sm9LV9cUdb
   qWVp9od2ZSr4ITnyhKJCa2FIO8O4k4lyBQmW9VnyLK3G4cl1q+5tP5iOh
   mzYsM8eK18LZpL3/3J+r8fnKhGuoyjgQOcl4PxzGL50hFeAH1Ww8eGPLA
   i/c8DmAuF6TVV/sIM787LbSydFcI9wL3oYcxGmulkucejUGnKQG6vHhj/
   YSWtmJDNKlvbnw2pUM5/2HpR2GmjV7mNK8DAImJJxJ+FpCYeEAQdRaJWa
   oEVaFM0ULP3YlUiTVypD6XfZnhkqywGeYNwnsI/eJnXXJjk7VpjTxMhFz
   g==;
X-CSE-ConnectionGUID: AUzAJC36S9SndQREQ2CwLw==
X-CSE-MsgGUID: zSJ/KluJTq6c7cCf7sRcQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78280117"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="78280117"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 16:14:22 -0800
X-CSE-ConnectionGUID: J5mdfwK7QjeMS4UwsQ0RjA==
X-CSE-MsgGUID: CUsWV3ezReil1l5ve0mgkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="229483044"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Dec 2025 16:14:21 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW1es-000000001NJ-3djZ;
	Thu, 18 Dec 2025 00:14:18 +0000
Date: Thu, 18 Dec 2025 08:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [linux-next:master 830/2012] ERROR: modpost: "alloc_sja1000dev"
 [drivers/net/can/sja1000/f81601.ko] undefined!
Message-ID: <202512180808.fTAUQ2XN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   12b95d29eb979e5c4f4f31bb05817bc935c52050
commit: 6abd4577bccc66f83edfdb24dc484723ae99cbe8 [830/2012] can: fix build dependency
config: loongarch-randconfig-002-20251218 (https://download.01.org/0day-ci/archive/20251218/202512180808.fTAUQ2XN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180808.fTAUQ2XN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180808.fTAUQ2XN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "free_sja1000dev" [drivers/net/can/sja1000/ems_pcmcia.ko] undefined!
ERROR: modpost: "alloc_sja1000dev" [drivers/net/can/sja1000/ems_pcmcia.ko] undefined!
ERROR: modpost: "register_sja1000dev" [drivers/net/can/sja1000/ems_pcmcia.ko] undefined!
ERROR: modpost: "sja1000_interrupt" [drivers/net/can/sja1000/ems_pcmcia.ko] undefined!
ERROR: modpost: "unregister_sja1000dev" [drivers/net/can/sja1000/ems_pcmcia.ko] undefined!
>> ERROR: modpost: "alloc_sja1000dev" [drivers/net/can/sja1000/f81601.ko] undefined!
>> ERROR: modpost: "register_sja1000dev" [drivers/net/can/sja1000/f81601.ko] undefined!
>> ERROR: modpost: "free_sja1000dev" [drivers/net/can/sja1000/f81601.ko] undefined!
>> ERROR: modpost: "unregister_sja1000dev" [drivers/net/can/sja1000/f81601.ko] undefined!
>> ERROR: modpost: "alloc_sja1000dev" [drivers/net/can/sja1000/kvaser_pci.ko] undefined!
WARNING: modpost: suppressed 12 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

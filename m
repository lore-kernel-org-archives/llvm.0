Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB4C14F;
	Wed, 13 Dec 2023 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSm7XT1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702452312; x=1733988312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ONUJ67HwzX+N3TQPttgAdD9jpiNnw5Uko+y1ifQCXLA=;
  b=WSm7XT1yEwqZesxBqFSLHL9WmEKHw1wsKQ5CkghCU6uOzt61xc5fKPqj
   zQ6UaD0WXoJMQgz3rlWiEe22Y5xztFIOJjYuFddolvSp30s6u3tLZEJlE
   o6uyzpxzAfReQUIDr07uoeKrhozouqOcpemHJKLN8ca2tcuVpB1Tt9+jJ
   2Pktog5HJjEmT5xT3B9SR0PKO2vuvw6Q8XZxW9b60GeTvgCmiH88/lDwO
   Gai+vhR7iXD7rcvmf8OXJsingaLBfwuJr3rER2qKO7V7N+619Q3YuCeR0
   TRrh2gZtwy/0nvzcYqNAMWffZ59F/TQxAbBA9WOj0BLl7VU2gBZrO9O45
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="392099241"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="392099241"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 23:25:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="844212166"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="844212166"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Dec 2023 23:25:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDJcA-000KCJ-2h;
	Wed, 13 Dec 2023 07:25:07 +0000
Date: Wed, 13 Dec 2023 15:24:39 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Yin <peteryin.openbmc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Joel Stanley <joel@jms.id.au>
Subject: [joel-bmc:for-next 8/8] make[4]: *** No rule to make target
 'arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb', needed by
 'arch/arm/boot/dts/aspeed/'.
Message-ID: <202312131521.WbnXuCOh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git for-next
head:   70fe22dd623e9bf48323c9dec08693dd553a4e35
commit: 70fe22dd623e9bf48323c9dec08693dd553a4e35 [8/8] ARM: dts: aspeed: Harma: Add Meta Harma (AST2600) BMC
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231213/202312131521.WbnXuCOh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131521.WbnXuCOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131521.WbnXuCOh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb', needed by 'arch/arm/boot/dts/aspeed/'.
   make[4]: Target 'arch/arm/boot/dts/aspeed/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

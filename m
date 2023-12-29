Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DF111188;
	Fri, 29 Dec 2023 12:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFT2GuSA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703851620; x=1735387620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y72wBz5SaBKmTpJnS27DNp3Kr6pFexm8rEy+xMvT0kg=;
  b=CFT2GuSARGqYt4gnDPNPOxKgwD1dE05aIbv2yAktwzqSLpLDvnsK0QAX
   YPyxEwz/ksrdqhAdRVFJnIm5+v1TrO2Dxa0D0V6Cg8ZKX3AoTDl/6IQVe
   pK/0DM6VSkg4DZOStOMUFwEfxYWDhrTXJviQbDKzGu1dYlNBYvTzjx1El
   QTLDiFc7RRzgx24GyjiE6ZWRKLeOyFuz9kLxf6nh1Owa2ycjFHE7CGU1C
   6E/0pZV6Zu8ib7HtO3Q+3NBNEByp6olqUInEoQQat5Kp0lZKwFcyJ3i9r
   DiVjRsGlIJo4K6UVumHSope9mdrUBtnG7OvB0/5LuHJUSVfYHCc54rwsM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="399422503"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="399422503"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 04:07:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="952067127"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="952067127"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Dec 2023 04:06:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJBdg-000HQB-2U;
	Fri, 29 Dec 2023 12:06:56 +0000
Date: Fri, 29 Dec 2023 20:06:40 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Helbech Kleist <andreaskleist@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kleist:ipu4-dev 26/59]
 drivers/media/i2c/ambu-gen2-tc358748-regs.h:7:9: warning:
 'AMBU_GEN2_TC358748_REGS_H' is used as a header guard here, followed by
 #define of a different macro
Message-ID: <202312291920.0pSRyxNe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Kleist/linux ipu4-dev
head:   15245fe26e07c9118f0f5c03af5469832928f3dc
commit: f01e21c206b310fb28e20544a70adbcb1099e81a [26/59] EMB-1955: ambu: tc358748: Implement s_stream for 800x800
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231229/202312291920.0pSRyxNe-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312291920.0pSRyxNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312291920.0pSRyxNe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/ambu-tc358748.c:19:
>> drivers/media/i2c/ambu-gen2-tc358748-regs.h:7:9: warning: 'AMBU_GEN2_TC358748_REGS_H' is used as a header guard here, followed by #define of a different macro [-Wheader-guard]
       7 | #ifndef AMBU_GEN2_TC358748_REGS_H
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ambu-gen2-tc358748-regs.h:8:9: note: 'AMBU_GEN2_TC358748_REGS_' is defined here; did you mean 'AMBU_GEN2_TC358748_REGS_H'?
       8 | #define AMBU_GEN2_TC358748_REGS_
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         AMBU_GEN2_TC358748_REGS_H
   1 warning generated.


vim +/AMBU_GEN2_TC358748_REGS_H +7 drivers/media/i2c/ambu-gen2-tc358748-regs.h

   > 7	#ifndef AMBU_GEN2_TC358748_REGS_H
     8	#define AMBU_GEN2_TC358748_REGS_
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

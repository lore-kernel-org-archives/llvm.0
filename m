Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7EC110B;
	Wed, 23 Aug 2023 12:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692794880; x=1724330880;
  h=date:from:cc:subject:message-id:mime-version;
  bh=RRs6jsWiZW5jdTc65L8I1vLbiWNf10jxH1Z4gz1KlUA=;
  b=hbwIJlr6pHf51Z8RIqrztjJIiGBrgyhhDx8Olf8Sf3HsJ4x4qoRNRPiS
   G+CNqjNlJMNvCEe/jYuaWX8IyZ7L6eiYheLiLv3LRlK5m2stn+1Pw7OzY
   5t7Gha+zcAvFnQfjBmcJIHDgwln/jyl6bho/duQSkkw15Pd0HznNNR0t9
   zNsNa7jDP2tJZ3R/B0neOUQQiGwyJFPd8H1iX2nrcbCjfqkTsOSIG+1QL
   rngg2rEn+sSWS1yiv7DHiPwMAX/GVBa80i8T0zYsEOKnSW0z4XOipfKJ3
   2QSNSG9Y7O8woeXHAG57Gojn4pfFlg5RshAA8rXBulUoVRmsirohDPiqq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="376875937"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="376875937"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 05:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="771707186"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="771707186"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 23 Aug 2023 05:47:03 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYnGI-0001Cc-2y;
	Wed, 23 Aug 2023 12:47:02 +0000
Date: Wed, 23 Aug 2023 20:46:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-6.1.y 8410/8698] arch/x86/lib/retpoline.o: warning:
 objtool: srso_untrain_ret+0xd: call without frame pointer save/setup
Message-ID: <202308232056.Ly6kWF9t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   6c44e13dc284f7f4db17706ca48fd016d6b3d49a
commit: ac41e90d8daa8815d8bee774a1975435fbfe1ae7 [8410/8698] x86/srso: Add a Speculative RAS Overflow mitigation
config: x86_64-randconfig-r031-20230823 (https://download.01.org/0day-ci/archive/20230823/202308232056.Ly6kWF9t-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232056.Ly6kWF9t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232056.Ly6kWF9t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/retpoline.o: warning: objtool: srso_untrain_ret+0xd: call without frame pointer save/setup


objdump-func vmlinux.o srso_untrain_ret:
0000 00000000000000be <srso_untrain_ret>:
0000   be:	48                   	rex.W
0001   bf:	b8                   	.byte 0xb8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

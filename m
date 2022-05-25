Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17828EA8
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 09:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653469611; x=1685005611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ti4xqAv2DGZvuVg1zkWwGKZKhmzDTKqwYIi8inbx8ko=;
  b=D6sSEAGtyF1yZv2bXjX5MJxvPLTCJC8Bu8i+Ny24eltYxkLDjaDEwnFW
   o1Fpwa9YV94oZtT+tfJsvybnEvRrRt1YKhtAmx7pFKFmn2jqYyjhVf2ST
   +1vrR0OOQw6Md6RvBAeH5BdxvaiN1eLc458n+hIKToBXRinp5fPCBj84T
   ZllooBm3zX8XyrHi5mPP3oWAkY/CCQLR8UQXVUAQDJPeoZp2EjdMddY2a
   kUztSc+TGF5zWS5fYWTJNcrINffYhr+k2LFjfb81iMeVOIiI9H7Lyr4hx
   vcGpUbScK0TWZXaZmhIwDx8/WQSweUMPP416H3iMatq0ml3Ac8NkA/ih7
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="273760052"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="273760052"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 02:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="609040032"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 May 2022 02:06:49 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntmye-0002tc-BI;
	Wed, 25 May 2022 09:06:48 +0000
Date: Wed, 25 May 2022 17:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [linux-next:master 11985/14193]
 drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1093:9: warning: 'CAUSE'
 macro redefined
Message-ID: <202205251645.gusu3spL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8cb8311e95e3bb58bd84d6350365f14a718faa6d
commit: c1918196427b917d1fbf064b07538410807f8b03 [11985/14193] iwlwifi: pcie: simplify MSI-X cause mapping
config: mips-randconfig-r022-20220524 (https://download.01.org/0day-ci/archive/20220525/202205251645.gusu3spL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d52a6e75b0c402c7f3b42a2b1b2873f151220947)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c1918196427b917d1fbf064b07538410807f8b03
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c1918196427b917d1fbf064b07538410807f8b03
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/net/wireless/intel/iwlwifi/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1093:9: warning: 'CAUSE' macro redefined [-Wmacro-redefined]
   #define CAUSE(reg, mask)                                                \
           ^
   arch/mips/include/uapi/asm/ptrace.h:18:9: note: previous definition is here
   #define CAUSE           65
           ^
   1 warning generated.


vim +/CAUSE +1093 drivers/net/wireless/intel/iwlwifi/pcie/trans.c

  1092	
> 1093	#define CAUSE(reg, mask)						\
  1094		{								\
  1095			.mask_reg = reg,					\
  1096			.bit = ilog2(mask),					\
  1097			.addr = ilog2(mask) +					\
  1098				((reg) == CSR_MSIX_FH_INT_MASK_AD ? -16 :	\
  1099				 (reg) == CSR_MSIX_HW_INT_MASK_AD ? 16 :	\
  1100				 0xffff),	/* causes overflow warning */	\
  1101		}
  1102	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA212A6EA;
	Tue,  6 Jun 2023 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686046337; x=1717582337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ii+7LbAApVLTdesqin/mYoEUUUeioUO8TAp4lcFng5Y=;
  b=c0eZkFxT/56skxvM8J64TZnygFOMRPF1da/19r1vApxfhH/v1MDi0tuV
   YvJ9etP5T6BwLgpm2hqgxhkt0jr2MmLtcvsNwLoMWPEkeOHm1/B9GrkJq
   oZSh8gioqKL5OYzY48xrFIPYuPs+SIrv4+1BFHmSWFH6IS1C3xTRNyRa4
   FKv5afvfymvh36dBMQejgCT62SnH+ZCU9NuHL/IemPiNM668VfHcGPJOJ
   O+uS8LssaI7POW2oKuQwE3MZveswM4F64pLJoyTFs3sXu9hEg9Mi387V8
   n1O25Cu90itv85gFUPXARBYSZk6jAwmkNCslCFmPye/PqlO0VeT6EXDR8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="443002682"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="443002682"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 03:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="703099424"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="703099424"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Jun 2023 03:12:14 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Tfh-00057X-2M;
	Tue, 06 Jun 2023 10:12:13 +0000
Date: Tue, 6 Jun 2023 18:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2309/7345] net/netfilter/ipvs/ip_vs_proto.o:
 warning: objtool: .init.text: unexpected end of section
Message-ID: <202306061802.DUh27KMQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6db29e14f4fb7bce9eb5290288e71b05c2b0d118
commit: 55c84a5cf2c72a821719823ef2ebef01b119025b [2309/7345] fortify: strcat: Move definition to use fortified strlcat()
config: x86_64-randconfig-x062-20230606 (https://download.01.org/0day-ci/archive/20230606/202306061802.DUh27KMQ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=55c84a5cf2c72a821719823ef2ebef01b119025b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 55c84a5cf2c72a821719823ef2ebef01b119025b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/netfilter/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061802.DUh27KMQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/ipvs/ip_vs_proto.o: warning: objtool: .init.text: unexpected end of section

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_CRC32C_INTEL
   Depends on [n]: CRYPTO [=y] && !KMSAN [=y] && X86 [=y]
   Selected by [m]:
   - ISCSI_TARGET [=m] && TARGET_CORE [=m] && INET [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

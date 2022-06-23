Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812331874
	for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655974949; x=1687510949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IadRANFap85jIARCP9dcsvnk+8y2Y7z1GybpfCLJjwo=;
  b=RGLhE/0/DPav3xL+cdStDbh+uLcVoj5sEkP8cSSDTsqIE4vv40EOQ8vm
   pW8ONl+SSHI6WyEoIz4vM2+wt80pvGmsAHWLSgaUr7wPUr10k7E8yj981
   NfcM8SEzd5eYk7RRSZ8pG7UlxEMCGehHtQiBU9eH95i7biGnOFUJh6bbZ
   VSK4LSk71RysIxot80//Dsa5+4jchnZNbOckYvFej4yrUNmgpLxYyo3+R
   K2bx1WN47lgpiHnGGCA+7z+f4AIkwzMzjCo29FhA6j+NUSmsto3mDacdG
   BVBopN/Wu3xmP/+zcGfQ3jYX1tzMm+x7E3wwwDQJDlnQZbay53t9uGMWy
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="269391918"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="269391918"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 02:02:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="715752384"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Jun 2022 02:02:27 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4IjK-0000zn-Qf;
	Thu, 23 Jun 2022 09:02:26 +0000
Date: Thu, 23 Jun 2022 17:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-raid@vger.kernel.org, Song Liu <song@kernel.org>
Subject: [song-md:md-next 26/28] ERROR: modpost: "__hexagon_udivdi3"
 [drivers/md/raid456.ko] undefined!
Message-ID: <202206231700.QHLMIY3O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-next
head:   57c19f921f8081c1a9444dc7f3f6b3ea43fe612e
commit: 681fb14a7100b57c43313f04b4110e7438228bfd [26/28] md/raid5: Pivot raid5_make_request()
config: hexagon-randconfig-r045-20220623 (https://download.01.org/0day-ci/archive/20220623/202206231700.QHLMIY3O-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 46be5faaf03466c3751f8a2882bef5a217e15926)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/song/md.git/commit/?id=681fb14a7100b57c43313f04b4110e7438228bfd
        git remote add song-md git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git
        git fetch --no-tags song-md md-next
        git checkout 681fb14a7100b57c43313f04b4110e7438228bfd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__hexagon_udivdi3" [drivers/md/raid456.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

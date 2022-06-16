Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470CA6AA6
	for <llvm@lists.linux.dev>; Thu, 16 Jun 2022 20:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655411181; x=1686947181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9uL+CYUdpJGAenw0OMW9g+byOMeduUKJUogZVugvppk=;
  b=Bx1Cc8MeK0kgPeNaAyCtuaQN+Naoi9w4sbqiVrxlhn/3J/sS1A8FwZxS
   j44aeAh4bzdoTgSFOaaQmlIhw5zdokm9t7xRCdI5lsIawGIC8pYE2askj
   cv5xjgEMYCAx+tAc3v5CM3KXEAS1xlb8lO1FkrNiReW7LCCwrVn1yOFNY
   IuAM87asM/+RWprJSEj5yufM7gPwoP8BnEp4lSZdXdgptnWMIW6QmaIPm
   uCdjOFM6c7u1UXbCoRM1eo+eG7y6b+9IkJbw0xrV4R77Au25wl+gv9sIV
   SxLDw2aVjX8N+L0PXabVLPvnPPaEV/NFAUFTflFDKp3Rn1nDzHxOQGG1o
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259804849"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="259804849"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 13:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="583774019"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Jun 2022 13:26:19 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1w4D-000OkJ-JL;
	Thu, 16 Jun 2022 20:26:13 +0000
Date: Fri, 17 Jun 2022 04:25:26 +0800
From: kernel test robot <lkp@intel.com>
To: akpm <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4060/4062] ld.lld: error: assignment to symbol
 __pecoff_data_size does not converge
Message-ID: <202206170414.KF8tVLcg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c6d7e3b385f19869ab96e9404c92ff1abc34f2c8
commit: 9a51ac4c3e0f32bba5b2ea0a582e298c2060f16f [4060/4062] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
config: arm64-randconfig-r011-20220616 (https://download.01.org/0day-ci/archive/20220617/202206170414.KF8tVLcg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9a51ac4c3e0f32bba5b2ea0a582e298c2060f16f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 9a51ac4c3e0f32bba5b2ea0a582e298c2060f16f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: assignment to symbol __pecoff_data_size does not converge

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

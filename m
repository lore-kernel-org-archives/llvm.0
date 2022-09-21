Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCD346A1
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663778311; x=1695314311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XmPOi4AZLKygyRKQww6RIkuULMgWoG0tFfEFLejWzk8=;
  b=kuN4xiTbWbQS83g8eoQqvvqdpXMi79viRcW2TLqS7i0eD8lLNmr56OPy
   H3ZpCxOfvZxoQ4ZiAL/abEs8FN4HPeHcqSKRtWy7JoPVsOkvaG+G7jfh+
   EVw/bn+Vj73eVHUXAz4g7UIzwPyjCzlwtmRLwu1RQ6w9SXcnK+GE6donY
   i1bK3ebbdXQyU6YJPY+wkEbMX0tyo6EE2RPHHV4OcjRy1gi0OYGiASFpA
   wt3wPxTt1PIYXCvdONTKsq7Se1az90kRArM5ACL6+32km2Tt4514NgZHu
   TRbNT90puhNSu2BH47F8SvmisqdvIfSz+LsAPTlh7Ao6wLOMk0SZn4HBC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="386343898"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="386343898"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 09:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="708525325"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Sep 2022 09:38:29 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ob2k0-0003lf-2T;
	Wed, 21 Sep 2022 16:38:28 +0000
Date: Thu, 22 Sep 2022 00:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Neal Liu <neal_liu@aspeedtech.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [linux-next:master 4471/8813] make[4]: *** No rule to make target
 'drivers/crypto/aspeed/aspeed_crypto.o', needed by
 'drivers/crypto/aspeed/built-in.a'.
Message-ID: <202209220009.8nYpIPST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Neal,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   483fed3b5dc8ce3644c83d24240cf5756fb0993e
commit: 2be570849efc4e1ceda6a8384184f493f558f188 [4471/8813] crypto: aspeed - fix build module error
config: arm-randconfig-r014-20220921 (https://download.01.org/0day-ci/archive/20220922/202209220009.8nYpIPST-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2be570849efc4e1ceda6a8384184f493f558f188
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2be570849efc4e1ceda6a8384184f493f558f188
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'drivers/crypto/aspeed/aspeed_crypto.o', needed by 'drivers/crypto/aspeed/built-in.a'.
   make[4]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

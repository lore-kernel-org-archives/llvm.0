Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DEA5CAF
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 08:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660118508; x=1691654508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mokVBZqJW1Yse8OYP1CTvEf/PPQJIyLVT1Zlj3li4EM=;
  b=c2HiZvYHUKncfy/+g4+Q1gxuMCjSVqakXsur9Fh1g2zMUF45oFVic+SK
   qBG5cfeXBwbWbe0uUBtvoBvzTDYua5MCj73EKcIfqULQQ2A6MOXu/UWkt
   kkm8BzGSNjmHwUu6ANFu2UWkrEv2HTPiqK3S+Ju1QdSOwzpJa385TwSzD
   imOXtUcfW2LqSu789jbDlfiy50Zp7zvaOIADp6ZqE+ngT9uaNDOyNEqUR
   mJoZr7Mt3xjSJResy3sn1q7TZkelUiZrgnw1oeBvZg1GbCArgbuaWQwHH
   XdBt4lAj6IGOn8sXXH/k8DColuFPei9E6GdU5Mx/8ns55RRoXXmsbyjGY
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="355027415"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="355027415"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2022 01:01:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="633673969"
Received: from lkp-server02.sh.intel.com (HELO 5d6b42aa80b8) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Aug 2022 01:01:43 -0700
Received: from kbuild by 5d6b42aa80b8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLget-00003n-0M;
	Wed, 10 Aug 2022 08:01:43 +0000
Date: Wed, 10 Aug 2022 16:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Simo Sorce <simo@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: ERROR: modpost: "pkcs7_supply_detached_data"
 [crypto/asymmetric_keys/x509_key_parser.ko] undefined!
Message-ID: <202208101504.vAW2fZNR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d4252071b97d2027d246f6a82cbee4d52f618b47
commit: 3cde3174eb910513d32a9ec8a9b95ea59be833df certs: Add FIPS selftests
date:   7 weeks ago
config: s390-randconfig-r026-20220808 (https://download.01.org/0day-ci/archive/20220810/202208101504.vAW2fZNR-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3cde3174eb910513d32a9ec8a9b95ea59be833df
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3cde3174eb910513d32a9ec8a9b95ea59be833df
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pkcs7_supply_detached_data" [crypto/asymmetric_keys/x509_key_parser.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "iounmap" [drivers/pcmcia/pcmcia.ko] undefined!
ERROR: modpost: "ioremap" [drivers/pcmcia/pcmcia.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

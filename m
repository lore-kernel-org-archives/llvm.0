Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E57EEC5
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 23:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656631106; x=1688167106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dfm7axZWAKkEl0Yg6555XwrTd6tTzwlKszTTyyKnpIQ=;
  b=ajbQ08tNYI6OPA71yjfklPrs5Or3/oKCTx7PoZ6gpEn6BmQi37psaZQU
   57s3kLbf2ppHEJAsONo02BReD72Y1mS4tWv53ljMebMIohOtnwOkOJxrG
   eEvcY1ezo2EouG8wbh4hGFpg1lwcbTNFI5oh4aJtShb+4TtlZcBsxLjfx
   CA4RvBia1Bok49MgjHsDQ1FugPo+pqL8+dnPZrpPJ9q+kfafPPkIWl8hi
   ObxFLBvSey/+41iy3PtGlFexeCqtuya6u3n3LMJWhfrenysJxxkAS+pXA
   hBY7/vkPr4On/h6pDl+Sad92spUPvBmr4TL7hGIqC3m1B4hFNcKp8Vs0r
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="344179913"
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="344179913"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 16:18:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="596012036"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jun 2022 16:18:15 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o73QM-000DIY-ND;
	Thu, 30 Jun 2022 23:18:14 +0000
Date: Fri, 1 Jul 2022 07:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 31/56]
 ld.lld: error: undefined symbol: fscache_begin_cache_operation
Message-ID: <202207010740.uNqYXgaP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-linked-list
head:   acac17cdb0f9f6db9fc03eea371e399906146f96
commit: 822bd57525b5cf3038ef9d8086398a8aecc95161 [31/56] fscache: Add a function to begin an cache op from a netfslib request
config: arm64-randconfig-r001-20220629 (https://download.01.org/0day-ci/archive/20220701/202207010740.uNqYXgaP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a774ba7f60d1fef403b5507b1b1a7475d3684d71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/822bd57525b5cf3038ef9d8086398a8aecc95161
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-linked-list
        git checkout 822bd57525b5cf3038ef9d8086398a8aecc95161
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fscache_begin_cache_operation
   >>> referenced by addr.c
   >>>               ceph/addr.o:(ceph_netfs_ops) in archive fs/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5232C80
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 23:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642117576; x=1673653576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jXQMqB5M1B1k0ZRciPQ8qceliwv38BwKOA73t7XuYu8=;
  b=OyOU5vLXjWbNdS7z9dmMk+DEimyHEwfqw8sSooj1UCxf8Lnx7VdIPJ7C
   V+XcwfKOVn1HU2YSndWQ7U2dxGBkWz/6EmAiy+HwqKGqS84gX+eh3WLMT
   jC8VpXeZeULfMfQ8pQYtkTpgcgBWRVSjFpgSex/mudhcD5evcOxR2qMOI
   t3QK+PA1y6L+XeIy1Q0TzvKL1jAPESODDqbV0WB0W1DTtH0fHi3eoPPxK
   N5FpHkLcHwBuyVN18kJfq00zb6mxnfTAuuoV18qPRE2qwW4hFt6YO2wbY
   b85gKfHcxSck/qTLRbxnHnridNqvFmbpAHlsXJPzGmSMZil+7D9iWPIiq
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="231488300"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; 
   d="scan'208";a="231488300"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 15:46:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; 
   d="scan'208";a="473436275"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jan 2022 15:46:14 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n89nJ-0007mw-NR; Thu, 13 Jan 2022 23:46:13 +0000
Date: Fri, 14 Jan 2022 07:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ebiggers:blk-crypto-sysfs-testing 4/4]
 drivers/block/virtio_blk.c:763:5: error: no member named 'crypto_profile' in
 'struct request_queue'
Message-ID: <202201140721.JP8Zzews-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git blk-crypto-sysfs-testing
head:   59eaf05f0496aed45c6825a931254a94381d36ac
commit: 59eaf05f0496aed45c6825a931254a94381d36ac [4/4] virtio-blk: add fake crypto profile for testing
config: hexagon-randconfig-r045-20220113 (https://download.01.org/0day-ci/archive/20220114/202201140721.JP8Zzews-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/commit/?id=59eaf05f0496aed45c6825a931254a94381d36ac
        git remote add ebiggers https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
        git fetch --no-tags ebiggers blk-crypto-sysfs-testing
        git checkout 59eaf05f0496aed45c6825a931254a94381d36ac
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/block/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/block/virtio_blk.c:763:5: error: no member named 'crypto_profile' in 'struct request_queue'
           q->crypto_profile = profile;
           ~  ^
   1 error generated.


vim +763 drivers/block/virtio_blk.c

   751	
   752	static void virtblk_add_crypto_profile(struct request_queue *q)
   753	{
   754		struct blk_crypto_profile *profile;
   755	
   756		profile = kzalloc(sizeof(*profile), GFP_KERNEL);
   757	
   758		blk_crypto_profile_init(profile, 32);
   759		profile->modes_supported[BLK_ENCRYPTION_MODE_AES_256_XTS] =
   760			4096 | 8192;
   761		profile->max_dun_bytes_supported = 8;
   762	
 > 763		q->crypto_profile = profile;
   764	}
   765	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

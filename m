Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1A28F4D;
	Mon, 13 Feb 2023 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676298518; x=1707834518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ca2fl++q9uqe9t4GFMtzFHHUL5BNwJ7uXeCoTeCy9bM=;
  b=HaExuJsZd5swuL0d1GQqLx1+wsK6zZ9NkU8FszipdMd+zFTDteybSCV9
   H0ZczQ2m55D3ksaLxT/3u90cPaLXXS6jF8JezYeyfHujrEp856h0btpd2
   SzSEa9kM4R1XAQPqYxHPtksmZF9iDqrIWdRIFqhLdae9Fzbt2PClS69wq
   5mxXVnfolqAvQdYYh1MEYOgUswg7nK3AKLxKi/g09KcGZExXGaUbIH8dN
   Yge5oY2MPMWBHuk6AbuUoO4Rt7BA07MgsZyqWzUrdMEopresuwBQlfGdD
   DPmSsGkj1KWAvpFDKETMOQURkENab/93ukMQNeoZKqjgvXnEAVAJ8gVuz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="333036956"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="333036956"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 06:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="792744447"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="792744447"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Feb 2023 06:28:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRZoZ-0007mb-0w;
	Mon, 13 Feb 2023 14:28:19 +0000
Date: Mon, 13 Feb 2023 22:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 185/193]
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r525.c:59:1: error: non-void
 function does not return a value in all control paths
Message-ID: <202302132206.uzzkoc7v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 01.03-gsp-ada
head:   ab3448c2873e0fbcf1fd710cccb52dc548bdf449
commit: c24815755c5c79d50fa9370ec1124fedd29743bb [185/193] disp
config: arm64-randconfig-r021-20230212 (https://download.01.org/0day-ci/archive/20230213/202302132206.uzzkoc7v-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout c24815755c5c79d50fa9370ec1124fedd29743bb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302132206.uzzkoc7v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/engine/disp/r525.c:59:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.


vim +59 drivers/gpu/drm/nouveau/nvkm/engine/disp/r525.c

    46	
    47	static u64
    48	r525_chan_user(struct nvkm_disp_chan *chan, u64 *psize)
    49	{
    50		switch (chan->object.oclass & 0xff) {
    51		case 0x7d: *psize = 0x10000; return 0x680000;
    52		case 0x7e: *psize = 0x01000; return 0x690000 + (chan->head * *psize);
    53		case 0x7b: *psize = 0x01000; return 0x6b0000 + (chan->head * *psize);
    54		case 0x7a: *psize = 0x01000; return 0x6d8000 + (chan->head * *psize);
    55		default:
    56			BUG_ON(1);
    57			break;
    58		}
  > 59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4997C
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 19:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663701809; x=1695237809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KGOmGLFXa/AHId60Y5h76Pqaa93QttmT+20FZZNUBns=;
  b=jML7ZKC42zyxvMfs7i0rHMTnQH1iOtheY5X54VGi1CYWQO2UvsBFqFiv
   g/lBo3xZ1HbyKMF05cctkKTb11J2iijXMrNK7LVFyj5nBdNQRK/Ik9T6p
   BxJOGV/sBi3l51nmIXp2RIhitZSO30BC1SxKrI4S3pGd1855LKvwE3ptH
   9WtUzVbfWt5hAi8JPKEoVQ8ytr6S8oDVhQgpVe2OvFtGp9bm7gO0gT4r9
   KKIK+1oM6WUrPoLE5MDsLpKG57cwIzu5lXGLYYPJyT+1pddgBJHYTYcd1
   g4bwEBBBt1zvJ4xdYLKCW6UCt2SlL/PIOVu/UE8V1ZJpPqk0WVH7e1lfb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="361554434"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; 
   d="scan'208";a="361554434"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 12:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; 
   d="scan'208";a="596647284"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Sep 2022 12:23:00 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaipf-0002ub-2r;
	Tue, 20 Sep 2022 19:22:59 +0000
Date: Wed, 21 Sep 2022 03:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ban Tao <fengzheng923@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:20220920_kuninori_morimoto_gx_asoc_soc_h_random_cleanup
 35/44] sound/soc/sunxi/sun50i-dmic.c:268:34: warning: unused variable
 'sun50i_dmic_of_match'
Message-ID: <202209210327.k80A7Kzb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20220920_kuninori_morimoto_gx_asoc_soc_h_random_cleanup
head:   3289dc026a8cf5d6469eb49d838bc971f4370f9d
commit: 9fc2c8ed923d8ec8a49cf5b5076c84867126ca69 [35/44] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
config: arm-randconfig-r024-20220921 (https://download.01.org/0day-ci/archive/20220921/202209210327.k80A7Kzb-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=9fc2c8ed923d8ec8a49cf5b5076c84867126ca69
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci 20220920_kuninori_morimoto_gx_asoc_soc_h_random_cleanup
        git checkout 9fc2c8ed923d8ec8a49cf5b5076c84867126ca69
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/sunxi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/sunxi/sun50i-dmic.c:268:34: warning: unused variable 'sun50i_dmic_of_match' [-Wunused-const-variable]
   static const struct of_device_id sun50i_dmic_of_match[] = {
                                    ^
   1 warning generated.


vim +/sun50i_dmic_of_match +268 sound/soc/sunxi/sun50i-dmic.c

   267	
 > 268	static const struct of_device_id sun50i_dmic_of_match[] = {
   269		{
   270			.compatible = "allwinner,sun50i-h6-dmic",
   271		},
   272		{ /* sentinel */ }
   273	};
   274	MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
   275	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

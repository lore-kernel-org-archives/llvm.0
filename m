Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4DD7D61
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 23:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662160291; x=1693696291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bs2N+4jA8VNqEDPs2v0c4mrKLHEnEKpC+6QMV8EQT10=;
  b=FRBCmTfBhbPDoSmFJGZawZRw0X74rCHdLmebeEVFwP1G+rlSDU5eqIdQ
   J8rfCOit2brZUn7f4n/fEFZnkfMC8UJaTnstyWMxyPa/hHioucYJr+v9+
   J13A97lyrfEClqAEpawPhaGlmjWK+JtSXoYzRbxDFEsw9fcbG+Gmy8qT0
   3UgRcgSg+GHCSC4TW4Q/nhgFa9n7mzdlpuYGcq+R3tN89/YlIw8wQdXLI
   xawLOe9kAK3yCsR/fP8emMbmdpb8XkC7Mj5QRClRGvoZpRaU+IWJGaQmg
   JQ/LBNDJAxnSukPiPUNsT5jICPeNd0Zfjabd4w+5wfB5P0MxCXcAlWI5e
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="360062567"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; 
   d="scan'208";a="360062567"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 16:11:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; 
   d="scan'208";a="941459673"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 02 Sep 2022 16:11:29 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUFou-0000ix-22;
	Fri, 02 Sep 2022 23:11:28 +0000
Date: Sat, 3 Sep 2022 07:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Flax <flatmax@flatmax.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [broonie-misc:asoc-6.1 3/80] sound/soc/codecs/src4xxx-i2c.c:28:34:
 warning: unused variable 'src4xxx_of_match'
Message-ID: <202209030710.XtZRjxNg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matt,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-6.1
head:   376be51caf8871419bbcbb755e1e615d30dc3153
commit: 4e6bedd3c396014ba70de2b4c9995c8e024e82b3 [3/80] ASoC: codecs: add support for the TI SRC4392 codec
config: hexagon-randconfig-r045-20220903 (https://download.01.org/0day-ci/archive/20220903/202209030710.XtZRjxNg-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git/commit/?id=4e6bedd3c396014ba70de2b4c9995c8e024e82b3
        git remote add broonie-misc https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git
        git fetch --no-tags broonie-misc asoc-6.1
        git checkout 4e6bedd3c396014ba70de2b4c9995c8e024e82b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/src4xxx-i2c.c:28:34: warning: unused variable 'src4xxx_of_match' [-Wunused-const-variable]
   static const struct of_device_id src4xxx_of_match[] = {
                                    ^
   1 warning generated.


vim +/src4xxx_of_match +28 sound/soc/codecs/src4xxx-i2c.c

    27	
  > 28	static const struct of_device_id src4xxx_of_match[] = {
    29		{ .compatible = "ti,src4392", },
    30		{ }
    31	};
    32	MODULE_DEVICE_TABLE(of, src4xxx_of_match);
    33	
    34	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

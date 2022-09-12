Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C577566E0
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 23:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663024777; x=1694560777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q93oBTx3u5LUtVhSCEgNEkmMyo9rEmqCpu5xieHetws=;
  b=A0fRLrnaPbaLtgh8LbNFMzxFnJTBQtoQIwEe3NFGF5Mzx2x3O2AkGojS
   VZXmcAa3DQTfjHeKxnuGEFsEC3vOWcVn2VK4GVqhsL993iuuDe4ODoXt+
   UDRvWhPuiytoxZNc+qIRY6zETPn+4gPzBq0KVUvkYcaAUhGyhjH839Bnh
   WbtA4xT/5E9+i48xcHRzbX8stJK3vHOzXB6t3TJHYAgxvUTbHuRa8daMK
   ZTCd/3L0+zECXiL+JLcRY7rdjnfm2Ee1hGquDe7HuTnOdhTQvJ9JrNSB8
   tP3VHU+8qXNou1EoBWvLqMPsDO2ew6Ju2Z/hEfneGVl9nfCuwYVy799h0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="281009925"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="281009925"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 16:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="705329009"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2022 16:19:34 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oXsiD-0002xx-30;
	Mon, 12 Sep 2022 23:19:33 +0000
Date: Tue, 13 Sep 2022 07:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: yaliang.wang@windriver.com, tudor.ambarus@microchip.com,
	pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: gd25q256: replace
 gd25q256_default_init with gd25q256_post_bfpt
Message-ID: <202209130732.cQpPG34i-lkp@intel.com>
References: <20220912142833.1739547-1-yaliang.wang@windriver.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912142833.1739547-1-yaliang.wang@windriver.com>

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.0-rc5 next-20220912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yaliang-wang-windriver-com/mtd-spi-nor-gigadevice-gd25q256-replace-gd25q256_default_init-with-gd25q256_post_bfpt/20220912-223028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 80e78fcce86de0288793a0ef0f6acf37656ee4cf
config: i386-randconfig-a016-20220912 (https://download.01.org/0day-ci/archive/20220913/202209130732.cQpPG34i-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0238f8172a76ee5a84dda79b45911a2b63d59721
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review yaliang-wang-windriver-com/mtd-spi-nor-gigadevice-gd25q256-replace-gd25q256_default_init-with-gd25q256_post_bfpt/20220912-223028
        git checkout 0238f8172a76ee5a84dda79b45911a2b63d59721
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mtd/spi-nor/gigadevice.c:23:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.


vim +23 drivers/mtd/spi-nor/gigadevice.c

acb96ecd59f7fd Boris Brezillon 2020-03-13  10  
0238f8172a76ee Yaliang Wang    2022-09-12  11  static int
0238f8172a76ee Yaliang Wang    2022-09-12  12  gd25q256_post_bfpt(struct spi_nor *nor,
0238f8172a76ee Yaliang Wang    2022-09-12  13  			    const struct sfdp_parameter_header *bfpt_header,
0238f8172a76ee Yaliang Wang    2022-09-12  14  			    const struct sfdp_bfpt *bfpt)
acb96ecd59f7fd Boris Brezillon 2020-03-13  15  {
acb96ecd59f7fd Boris Brezillon 2020-03-13  16  	/*
acb96ecd59f7fd Boris Brezillon 2020-03-13  17  	 * Some manufacturer like GigaDevice may use different
acb96ecd59f7fd Boris Brezillon 2020-03-13  18  	 * bit to set QE on different memories, so the MFR can't
acb96ecd59f7fd Boris Brezillon 2020-03-13  19  	 * indicate the quad_enable method for this case, we need
0238f8172a76ee Yaliang Wang    2022-09-12  20  	 * to set it in the post_bfpt fixup hook.
acb96ecd59f7fd Boris Brezillon 2020-03-13  21  	 */
829ec6408dc58d Tudor Ambarus   2020-03-13  22  	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
acb96ecd59f7fd Boris Brezillon 2020-03-13 @23  }
acb96ecd59f7fd Boris Brezillon 2020-03-13  24  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

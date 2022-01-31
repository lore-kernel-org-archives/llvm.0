Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B972CA5
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643640631; x=1675176631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kjxgvtg0vA5ioKCecgDjmRu4lWOUQ43UzEpU3sKhBqI=;
  b=KQJEz2lbgrfel8RSRzF3KejTZ89wZxMN6jiIXJ6pV59DP4ci9FYtOQMW
   CLbmYaeSFG2BJW3dVfPGGYB6j8d8DRmkhueh3Xm7Qak6ulqJd4CabI5bs
   0QjEbC8403R0Aisxv6+MKum22/fTsvlZqaSBAK04zIZZHZeSdhXTfPFFw
   ukauP5qqq47BhBZ7aoAc/CKZ3qfUT6DJZeAaPrj03YCfM/muz6AVFBoFz
   Wu+jC1X70wlLylYPFSDc67nnUwc2P5Wv7RT9cB4boaoIt/YJIWv+m/041
   HT5dZewpFMWMaNhPNxHcc5w5vjQ/cZ6XDHdHCnvH+aUrJYinPhZkv2C1o
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="247690358"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="247690358"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 06:50:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="534193833"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 Jan 2022 06:50:27 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEY0g-000S1u-Pg; Mon, 31 Jan 2022 14:50:26 +0000
Date: Mon, 31 Jan 2022 22:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>, Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Pratyush Yadav <p.yadav@ti.com>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Takahiro Kuwano <tkuw584924@gmail.com>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: spi-mem: check if data buffers are on stack
Message-ID: <202201312233.QPZMOWRk-lkp@intel.com>
References: <20220131114508.1028306-1-p.yadav@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131114508.1028306-1-p.yadav@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Pratyush,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on v5.17-rc2 next-20220131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pratyush-Yadav/spi-spi-mem-check-if-data-buffers-are-on-stack/20220131-195211
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
config: arm-socfpga_defconfig (https://download.01.org/0day-ci/archive/20220131/202201312233.QPZMOWRk-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/0b93f667f8445e744ca4b8f80ce9a1ad4c981a2e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Pratyush-Yadav/spi-spi-mem-check-if-data-buffers-are-on-stack/20220131-195211
        git checkout 0b93f667f8445e744ca4b8f80ce9a1ad4c981a2e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/spi/spi-mem.c:212:6: error: implicit declaration of function 'object_is_on_stack' [-Werror,-Wimplicit-function-declaration]
               object_is_on_stack(op->data.buf.in))
               ^
   1 error generated.


vim +/object_is_on_stack +212 drivers/spi/spi-mem.c

   193	
   194	static int spi_mem_check_op(const struct spi_mem_op *op)
   195	{
   196		if (!op->cmd.buswidth || !op->cmd.nbytes)
   197			return -EINVAL;
   198	
   199		if ((op->addr.nbytes && !op->addr.buswidth) ||
   200		    (op->dummy.nbytes && !op->dummy.buswidth) ||
   201		    (op->data.nbytes && !op->data.buswidth))
   202			return -EINVAL;
   203	
   204		if (!spi_mem_buswidth_is_valid(op->cmd.buswidth) ||
   205		    !spi_mem_buswidth_is_valid(op->addr.buswidth) ||
   206		    !spi_mem_buswidth_is_valid(op->dummy.buswidth) ||
   207		    !spi_mem_buswidth_is_valid(op->data.buswidth))
   208			return -EINVAL;
   209	
   210		/* Buffers must be DMA-able. */
   211		if (op->data.dir == SPI_MEM_DATA_IN &&
 > 212		    object_is_on_stack(op->data.buf.in))
   213			return -EINVAL;
   214	
   215		if (op->data.dir == SPI_MEM_DATA_OUT &&
   216		    object_is_on_stack(op->data.buf.out))
   217			return -EINVAL;
   218	
   219		return 0;
   220	}
   221	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

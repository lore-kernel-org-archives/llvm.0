Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E712C82;
	Sun, 16 Jan 2022 14:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642342022; x=1673878022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x4VQ4nR9VUlZ83fYyFKy/XXbdvbRBwbal6RMpIkpZLk=;
  b=m7bsqatFzagVq5wB+RQIb08uR4V7ZgJcpFILy9vwkd+iPYbXdZJKtIAG
   xOym9jrpn8Z1d0JW58uRMrPrNwj1Kx915k1hrnUOYZAdzZ1iFBZF2xpXI
   gEGn67gsdi99KNSNCt5YZ2Vyqs9rocEiWuGDr3nF+n0adgfj3KEg/iJO5
   etJLlt1eDunpkqwyZt617bk/51oA+v3+yBSNq6KGi3Qryh9+L7PJSjBF0
   o4zwAQG6C3eZpKdrX8xFZ0W6R5qZA8IS+URF7KVh76FioWw2n6hR97qdi
   puSUW2Hot+1rOuLvDLGP8yXLnwCt3dPcER+gmWbgch3thB31KJrVFICoU
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10228"; a="307831905"
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="307831905"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2022 06:07:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,293,1635231600"; 
   d="scan'208";a="517094263"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Jan 2022 06:07:00 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n96BP-000AlI-RA; Sun, 16 Jan 2022 14:06:59 +0000
Date: Sun, 16 Jan 2022 22:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
	gregkh@linuxfoundation.org, realwakka@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: pi433: validate max bit_rate based on
 modulation used
Message-ID: <202201162116.8r1xEw9q-lkp@intel.com>
References: <20220116002333.GA23305@mail.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116002333.GA23305@mail.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Paulo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/0day-ci/linux/commits/Paulo-Miguel-Almeida/staging-pi433-validate-min-max-bit-rate-settings/20220116-082432
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git fa783154524a71ab74e293cd8251155e5971952b
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220116/202201162116.8r1xEw9q-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c63a3175c2947e8c1a2d3bbe16a8586600705c54)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4bbc9e444fd3bab38d93ae4261102db64385a26c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Paulo-Miguel-Almeida/staging-pi433-validate-min-max-bit-rate-settings/20220116-082432
        git checkout 4bbc9e444fd3bab38d93ae4261102db64385a26c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/pi433/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/staging/pi433/rf69.c:238:30: warning: result of comparison of constant 300000 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
               (mod == FSK && bit_rate > 300000) ||
                              ~~~~~~~~ ^ ~~~~~~
   1 warning generated.


vim +238 drivers/staging/pi433/rf69.c

   220	
   221	int rf69_set_bit_rate(struct spi_device *spi, u16 bit_rate)
   222	{
   223		int retval;
   224		u32 bit_rate_reg;
   225		u8 msb;
   226		u8 lsb;
   227		enum modulation mod;
   228	
   229		// check if modulation is configured
   230		mod = rf69_get_modulation(spi);
   231		if (mod == UNDEF) {
   232			dev_dbg(&spi->dev, "setBitRate: modulation is undefined");
   233			return -EINVAL;
   234		}
   235	
   236		// check input value
   237		if (bit_rate < 1200 ||
 > 238		    (mod == FSK && bit_rate > 300000) ||
   239		    (mod == OOK && bit_rate > 32768)) {
   240			dev_dbg(&spi->dev, "setBitRate: illegal input param");
   241			return -EINVAL;
   242		}
   243	
   244		// calculate reg settings
   245		bit_rate_reg = (F_OSC / bit_rate);
   246	
   247		msb = (bit_rate_reg & 0xff00) >> 8;
   248		lsb = (bit_rate_reg & 0xff);
   249	
   250		// transmit to RF 69
   251		retval = rf69_write_reg(spi, REG_BITRATE_MSB, msb);
   252		if (retval)
   253			return retval;
   254		retval = rf69_write_reg(spi, REG_BITRATE_LSB, lsb);
   255		if (retval)
   256			return retval;
   257	
   258		return 0;
   259	}
   260	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

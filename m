Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DC6173
	for <llvm@lists.linux.dev>; Thu, 20 Jan 2022 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642698991; x=1674234991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HtY7FVe4fREWkUe+/uU1sssk4Lk0PvtlSis/lZ7izsM=;
  b=bEwsliFyU/HW4iQRvO4Rhn2sbsFSxra7dO+lhcTbUmo236wBjCn6rjKT
   nmvu4fVJYdRA6A/7YibN8wDADh3wpKZOaZiKmujyWulLVXgk1JYVDPmqn
   aiqqFMwin8bIxFhIV7ukmI2sFiKNYyYfLZHfOy5k6yoMDMuLIZbgc+OYz
   JxVXt6SrMI/6U2BDfdVQ4hFNhWtLc7CwlB0tfRsN/hMdhOzErU0noOCVc
   pOYcTtaGs8TPJOGo8QF3RgjjXz3wr3U/OXAZ0VQ7ka6i8BSFlVH+qyvn2
   2TdrUERkTAl8drvONQIov4AvmN3ZCZmlUDSrzKk19xDte+Wj5b13gqq5V
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245601238"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="245601238"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 09:16:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="622985642"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2022 09:16:12 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAb2h-000EVa-MW; Thu, 20 Jan 2022 17:16:11 +0000
Date: Fri, 21 Jan 2022 01:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v4 2/9] spi: Create helper API to lookup ACPI info for
 spi device
Message-ID: <202201210136.gwZmTll9-lkp@intel.com>
References: <20220120134326.5295-3-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120134326.5295-3-sbinding@opensource.cirrus.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stefan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220120]
[also build test ERROR on v5.16]
[cannot apply to broonie-spi/for-next rafael-pm/linux-next tiwai-sound/for-next linus/master v5.16 v5.16-rc8 v5.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stefan-Binding/Support-Spi-in-i2c-multi-instantiate-driver/20220120-214608
base:    7fc5253f5a13271e9df35d6b936ff97b74540a59
config: riscv-randconfig-r042-20220120 (https://download.01.org/0day-ci/archive/20220121/202201210136.gwZmTll9-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/aedf84002ec1568907471591915e28bed40e8f9a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stefan-Binding/Support-Spi-in-i2c-multi-instantiate-driver/20220120-214608
        git checkout aedf84002ec1568907471591915e28bed40e8f9a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/rtc/rtc-rv3029c2.c:13:
>> include/linux/spi/spi.h:769:1: error: expected identifier or '('
   {
   ^
   1 error generated.


vim +769 include/linux/spi/spi.h

   762	
   763	#if IS_ENABLED(CONFIG_ACPI)
   764	extern struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
   765							struct acpi_device *adev);
   766	#else
   767	static inline struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
   768							       struct acpi_device *adev);
 > 769	{
   770		return ERR_PTR(-EOPNOTSUPP);
   771	}
   772	#endif
   773	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

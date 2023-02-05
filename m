Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C816107B8;
	Sun,  5 Feb 2023 18:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675620513; x=1707156513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zbnxPgxJAJOeyzaKS7zminX1XZlT1Qe+0gr2c1qFaBY=;
  b=F2XkIUetMaman9Qh2g0zAFiT01hL46l0i5QAKJn3EOZXPn711CLAzpqD
   b7MygIFPGjvivx7prVtbQg65xAIpFcDoyj7eqgZo2E0wMfa58h8Bs3Oyr
   Juzf8zaWk4yjQnvwuSH4b1lIyBAbzHp8NWxw61vsg2CKn+/2+8QtPbrPE
   5ZMpDQ0ppNngm5jXx8MRKT3FFvmPNfQ/TUo+SvPdagfKOZc7OPyXnLody
   C+9o/nG+aegZFc+52qSDMkTt576bUm36B1QSwBQl32VwY1XfFb63V1T6T
   plUExSwgtb1/xHyeLmS08XtYvYOWoY7a8/J3fEy2fnUc4ObZRK1ulriRl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309406024"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="309406024"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 10:08:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="734903714"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="734903714"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Feb 2023 10:08:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOjRB-00028q-2L;
	Sun, 05 Feb 2023 18:08:25 +0000
Date: Mon, 6 Feb 2023 02:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stephen Boyd <swboyd@chromium.org>
Subject: [jic23-iio:testing 3/5] drivers/iio/proximity/sx_common.c:437:48:
 error: call to undeclared function 'acpi_device_hid'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202302060246.TFlpfxH3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   1693e893f058e96fdaccbdb4bb42970811ac9ec6
commit: fef38680d38d39f6f574db2c77df3de215f08e7d [3/5] iio: proximity: sx_common: Add old register mapping
config: mips-buildonly-randconfig-r002-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060246.TFlpfxH3-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=fef38680d38d39f6f574db2c77df3de215f08e7d
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
        git fetch --no-tags jic23-iio testing
        git checkout fef38680d38d39f6f574db2c77df3de215f08e7d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/iio/proximity/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/iio/proximity/sx_common.c:437:48: error: call to undeclared function 'acpi_device_hid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           snprintf(prop, ARRAY_SIZE(prop), "%s,reg_%s", acpi_device_hid(adev), reg_def->property);
                                                         ^
>> drivers/iio/proximity/sx_common.c:437:48: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
           snprintf(prop, ARRAY_SIZE(prop), "%s,reg_%s", acpi_device_hid(adev), reg_def->property);
                                             ~~          ^~~~~~~~~~~~~~~~~~~~~
                                             %d
   1 warning and 1 error generated.


vim +/acpi_device_hid +437 drivers/iio/proximity/sx_common.c

   426	
   427	void sx_common_get_raw_register_config(struct device *dev,
   428					       struct sx_common_reg_default *reg_def)
   429	{
   430		struct acpi_device *adev = ACPI_COMPANION(dev);
   431		u32 raw = 0, ret;
   432		char prop[80];
   433	
   434		if (!reg_def->property || !adev)
   435			return;
   436	
 > 437		snprintf(prop, ARRAY_SIZE(prop), "%s,reg_%s", acpi_device_hid(adev), reg_def->property);
   438		ret = device_property_read_u32(dev, prop, &raw);
   439		if (ret)
   440			return;
   441	
   442		reg_def->def = raw;
   443	}
   444	EXPORT_SYMBOL_NS_GPL(sx_common_get_raw_register_config, SEMTECH_PROX);
   445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346521FA7;
	Wed, 26 Apr 2023 12:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682513796; x=1714049796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FXPqLxBIbf8Zkjcyuo4O8RhUpdAl3Teb3LG2zXL0io4=;
  b=EZBSNkJaBIrS0v7lfcKjHjndZMTw30G9dIeT1lj2pJdX+q3QWE9Ke65m
   LByoH93Ylsoa2i7U2u/nff+t+f5JD5jXxSCHmH7G9eN9BY9NZ45NtWoRD
   D2a4kc4pfNyxHSvLlVNTvaBWSFn4QJJbfafMeP7T8lxjWjjyKat3B9W43
   ZmlFtggTYtEZOYrGqHSV7QEP5OKQZ0XZKSf1DFYJw5ZC3WwyZAXH4KJZS
   nmY2C46ZOtb5rPiE3KmbAea5+HfTP3AQjfKtLOZw1GxYGR2VbwufhHeli
   qZTVpToU6S83NWgtxRcA2RCo1SUei29wtQVvyfpLHw7M83qxDi/Rw5dKW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="344548988"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
   d="scan'208";a="344548988"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 05:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="758602632"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
   d="scan'208";a="758602632"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Apr 2023 05:56:33 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prehE-0000A6-2x;
	Wed, 26 Apr 2023 12:56:32 +0000
Date: Wed, 26 Apr 2023 20:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm1-s3-bug 32/32]
 drivers/char/tpm/tpm_tis_core.c:1238:2: error: use of undeclared identifier
 'rc'
Message-ID: <202304262019.01pU4v2D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm1-s3-bug
head:   f6075147019ca730925d4059a6256ab06fbd5d4c
commit: f6075147019ca730925d4059a6256ab06fbd5d4c [32/32] tpm, tpm_tis: Use tpm_chip_{start,stop}() in tpm_tis_resume()
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20230426/202304262019.01pU4v2D-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=f6075147019ca730925d4059a6256ab06fbd5d4c
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd tpm1-s3-bug
        git checkout f6075147019ca730925d4059a6256ab06fbd5d4c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/char/tpm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304262019.01pU4v2D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_tis_core.c:27:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
>> drivers/char/tpm/tpm_tis_core.c:1238:2: error: use of undeclared identifier 'rc'
           rc = tpm_chip_start(chip);
           ^
   drivers/char/tpm/tpm_tis_core.c:1239:6: error: use of undeclared identifier 'rc'
           if (rc)
               ^
   drivers/char/tpm/tpm_tis_core.c:1239:6: error: use of undeclared identifier 'rc'
   drivers/char/tpm/tpm_tis_core.c:1239:6: error: use of undeclared identifier 'rc'
   1 warning and 4 errors generated.


vim +/rc +1238 drivers/char/tpm/tpm_tis_core.c

  1232	
  1233	int tpm_tis_resume(struct device *dev)
  1234	{
  1235		struct tpm_chip *chip = dev_get_drvdata(dev);
  1236		int ret;
  1237	
> 1238		rc = tpm_chip_start(chip);
  1239		if (rc)
  1240			return ret;
  1241	
  1242		if (chip->flags & TPM_CHIP_FLAG_IRQ)
  1243			tpm_tis_reenable_interrupts(chip);
  1244	
  1245		ret = tpm_pm_resume(dev);
  1246		if (ret)
  1247			goto out;
  1248	
  1249		/*
  1250		 * TPM 1.2 requires self-test on resume. This function actually returns
  1251		 * an error code but for unknown reason it isn't handled.
  1252		 */
  1253		if (!(chip->flags & TPM_CHIP_FLAG_TPM2))
  1254			tpm1_do_selftest(chip);
  1255	
  1256	out:
  1257		tpm_chip_stop(chip);
  1258	
  1259		return ret;
  1260	}
  1261	EXPORT_SYMBOL_GPL(tpm_tis_resume);
  1262	#endif
  1263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

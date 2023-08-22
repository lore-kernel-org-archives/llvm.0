Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D991C1360;
	Tue, 22 Aug 2023 04:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692679441; x=1724215441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DsLjVDruSkUMF7E16G+RW+410ikjkOJm6yxPIBWVkpw=;
  b=UUQByHwtbSmdZX8enaS/YEoead4l8ojfumq+rbvRSRKeHJzJE9szXuDF
   DhU0wzCgkCl+rDUd0AS2FIyM3qzKgGDNvncErP6dM0DcFcfNWah0Dd8uz
   0Dy8VbiScVgb1fiY8NLlmXLHzU3dEPHG9xarHOBC7J0bVj1fz4Y45JFlC
   Vm5Y8ScRJ63b/FhbzeZFeps8IRFW3NMmyAJKcTHXP3U6yQ4ZDXRTVwm3E
   7nhXkPhMp4XaBg4fW8V+/6DvHlBvnYSBJ+S737JG+EonmnBfiq1RbD8uU
   wKSVhNv0EKvPuk8saWezqfjGcOCHP13MT/kVJqcdovdFXJMmKYLrazGd2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358768753"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="358768753"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 21:44:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="1066888922"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="1066888922"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Aug 2023 21:43:54 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYJCZ-0001Mw-0u;
	Tue, 22 Aug 2023 04:42:21 +0000
Date: Tue, 22 Aug 2023 12:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Wenan <maowenan@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	"Sasha Levin (Microsoft)" <sashal@kernel.org>
Subject: [linux-stable-rc:linux-4.14.y 10564/26782]
 drivers/tty/serial/sc16is7xx.c:1503:1: warning: unused label 'err_i2c'
Message-ID: <202308221219.c7BXhDCc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
head:   d4d51e77b58d0c75103d4df5558535d0059ef324
commit: 707615f47db3e240158abe732ef4f99e01c2a91f [10564/26782] sc16is7xx: missing unregister/delete driver on error in sc16is7xx_init()
config: x86_64-randconfig-004-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221219.c7BXhDCc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221219.c7BXhDCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221219.c7BXhDCc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/sc16is7xx.c:1503:1: warning: unused label 'err_i2c' [-Wunused-label]
   err_i2c:
   ^~~~~~~~
   1 warning generated.
   /tmp/sc16is7xx-ac5cc8.s: Assembler messages:
   /tmp/sc16is7xx-ac5cc8.s:3123: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   /tmp/sc16is7xx-ac5cc8.s:3155: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   /tmp/sc16is7xx-ac5cc8.s:3187: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   /tmp/sc16is7xx-ac5cc8.s:3219: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   /tmp/sc16is7xx-ac5cc8.s:3251: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   /tmp/sc16is7xx-ac5cc8.s:3283: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   /tmp/sc16is7xx-ac5cc8.s:3315: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   /tmp/sc16is7xx-ac5cc8.s:3350: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'


vim +/err_i2c +1503 drivers/tty/serial/sc16is7xx.c

  1489	
  1490	#ifdef CONFIG_SERIAL_SC16IS7XX_SPI
  1491		ret = spi_register_driver(&sc16is7xx_spi_uart_driver);
  1492		if (ret < 0) {
  1493			pr_err("failed to init sc16is7xx spi --> %d\n", ret);
  1494			goto err_spi;
  1495		}
  1496	#endif
  1497		return ret;
  1498	
  1499	err_spi:
  1500	#ifdef CONFIG_SERIAL_SC16IS7XX_I2C
  1501		i2c_del_driver(&sc16is7xx_i2c_uart_driver);
  1502	#endif
> 1503	err_i2c:
  1504		uart_unregister_driver(&sc16is7xx_uart);
  1505		return ret;
  1506	}
  1507	module_init(sc16is7xx_init);
  1508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

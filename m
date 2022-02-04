Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07212F2B
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 07:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643960888; x=1675496888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D2TO1FpkU+Fuy9j65t2kAis5Qdf8faJM8dR4Jg9VxN8=;
  b=eA0hz7GzGoKJUKx4alZqBRhtzKpcYMCJhTYg74gFwsIsFT2C6LXBu7Yp
   W1mLCIEc6gJz7LQOYwZPEYrcVSlbISC1x48r+UPo3ZMxplGeD5dW+Nv7L
   wzCMVwpiGHuwrFrXTHfaz8cChXcQGg62sWGCYddyX5EgDh0yI9/So/LAu
   /mRxKcqilDwGpDp4HqVxo4lCcLtdT6GrfDtxfACwojWWKt+8apfUWOU8v
   9iEAiS21D+Dauyc84atTMZ1dH96Md8Uo0hrH/eKzA80CSgmea3CNbhQss
   K30Tfmifxcpu9+md2NIwUsZ/ZAMN4w6D+1A0QWDgEEPgFxqKx3Tanw8Ve
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248088508"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; 
   d="scan'208";a="248088508"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 23:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; 
   d="scan'208";a="620766992"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2022 23:48:04 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFtK7-000XJm-JR; Fri, 04 Feb 2022 07:48:03 +0000
Date: Fri, 4 Feb 2022 15:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: drivers/staging/pi433/pi433_if.c:1131:17: error: implicit
 declaration of function 'rf69_read_reg'
Message-ID: <202202041558.6DmCc4Yr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20220204-130730/Paulo-Miguel-Almeida/staging-pi433-add-debugfs-interface/20220130-105834
head:   fb6abd1aaf517ca9932a8acb1ab639308264bde6
commit: fb6abd1aaf517ca9932a8acb1ab639308264bde6 staging: pi433: add debugfs interface
date:   3 hours ago
config: riscv-randconfig-r042-20220131 (https://download.01.org/0day-ci/archive/20220204/202202041558.6DmCc4Yr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/fb6abd1aaf517ca9932a8acb1ab639308264bde6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review UPDATE-20220204-130730/Paulo-Miguel-Almeida/staging-pi433-add-debugfs-interface/20220130-105834
        git checkout fb6abd1aaf517ca9932a8acb1ab639308264bde6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/staging/pi433/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/staging/pi433/pi433_if.c:1131:17: error: implicit declaration of function 'rf69_read_reg' [-Werror,-Wimplicit-function-declaration]
                   reg_data[i] = rf69_read_reg(dev->spi, i);
                                 ^
   drivers/staging/pi433/pi433_if.c:1131:17: note: did you mean 'rf69_read_fifo'?
   drivers/staging/pi433/rf69.h:67:5: note: 'rf69_read_fifo' declared here
   int rf69_read_fifo(struct spi_device *spi, u8 *buffer, unsigned int size);
       ^
   1 error generated.


vim +/rf69_read_reg +1131 drivers/staging/pi433/pi433_if.c

  1106	
  1107	static int pi433_debugfs_regs_show(struct seq_file *m, void *p)
  1108	{
  1109		struct pi433_device *dev;
  1110		u8 reg_data[114];
  1111		int i;
  1112		char *fmt = "0x%02x, 0x%02x\n";
  1113		int ret;
  1114	
  1115		dev = m->private;
  1116	
  1117		mutex_lock(&dev->tx_fifo_lock);
  1118		mutex_lock(&dev->rx_lock);
  1119	
  1120		// wait for on-going operations to finish
  1121		ret = wait_event_interruptible(dev->rx_wait_queue, !dev->tx_active);
  1122		if (ret)
  1123			goto out_unlock;
  1124	
  1125		ret = wait_event_interruptible(dev->tx_wait_queue, !dev->rx_active);
  1126		if (ret)
  1127			goto out_unlock;
  1128	
  1129		// skip FIFO register (0x0) otherwise this can affect some of uC ops
  1130		for (i = 1; i < 0x50; i++)
> 1131			reg_data[i] = rf69_read_reg(dev->spi, i);
  1132	
  1133		reg_data[REG_TESTLNA] = rf69_read_reg(dev->spi, REG_TESTLNA);
  1134		reg_data[REG_TESTPA1] = rf69_read_reg(dev->spi, REG_TESTPA1);
  1135		reg_data[REG_TESTPA2] = rf69_read_reg(dev->spi, REG_TESTPA2);
  1136		reg_data[REG_TESTDAGC] = rf69_read_reg(dev->spi, REG_TESTDAGC);
  1137		reg_data[REG_TESTAFC] = rf69_read_reg(dev->spi, REG_TESTAFC);
  1138	
  1139		seq_puts(m, "# reg, val\n");
  1140	
  1141		for (i = 1; i < 0x50; i++)
  1142			seq_printf(m, fmt, i, reg_data[i]);
  1143	
  1144		seq_printf(m, fmt, REG_TESTLNA, reg_data[REG_TESTLNA]);
  1145		seq_printf(m, fmt, REG_TESTPA1, reg_data[REG_TESTPA1]);
  1146		seq_printf(m, fmt, REG_TESTPA2, reg_data[REG_TESTPA2]);
  1147		seq_printf(m, fmt, REG_TESTDAGC, reg_data[REG_TESTDAGC]);
  1148		seq_printf(m, fmt, REG_TESTAFC, reg_data[REG_TESTAFC]);
  1149	
  1150	out_unlock:
  1151		mutex_unlock(&dev->rx_lock);
  1152		mutex_unlock(&dev->tx_fifo_lock);
  1153	
  1154		return ret;
  1155	}
  1156	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

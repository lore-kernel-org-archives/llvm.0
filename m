Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F58863D9;
	Sat, 13 May 2023 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683996139; x=1715532139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lRWdBxtjm6jIqtkL1wr4aA9I1a8x7MQqLQpsefkyby8=;
  b=A+2mPLBk1r8JiPRwrL7REyOgMkD9wlPKq1VmbMv4iiw5+BDHKPGN5P1R
   j3y7/25vrfmNQf5sXtg5a4RKrjboNXhYuJiF1r0At6Xcw/jlJDkSiVy5p
   Hm8eLHJ27VS37kTQsj7El+Dw7w1GLTwI+5Z9IHFKFOY26egPl8FnNiRHT
   HlxtXv5+/8m+2d22TD1mvGrHSdNhOtWZVsn8XDkiUYjZPYlGGpKBcdLFW
   k4DAOXwlGWoHs5susuM652ttBx0HElhsHcytvWrX3slzde7+ddOptiO+z
   KRgCj7KwBCLQ31c12TocfWDrh025tw8Vo9475qnt+OJ3QqbwwaeetzdXF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="330589997"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="330589997"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 09:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="812431267"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="812431267"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 May 2023 09:42:13 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxsJx-0005a6-0p;
	Sat, 13 May 2023 16:42:13 +0000
Date: Sun, 14 May 2023 00:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [stable:linux-4.19.y 2317/9999]
 drivers/net/wireless/mediatek/mt76/mt76x0/debugfs.c:110:49: warning: format
 specifies type 'unsigned char' but the argument has type 's16' (aka 'short')
Message-ID: <202305140007.xnnT00as-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fangrui,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   cdfda37ab2cfc783a190b563806cda611c35d1e3
commit: 69c122751164c3c343eea205fd5c3e1d5132f967 [2317/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
config: mips-randconfig-r013-20230513 (https://download.01.org/0day-ci/archive/20230514/202305140007.xnnT00as-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=69c122751164c3c343eea205fd5c3e1d5132f967
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 69c122751164c3c343eea205fd5c3e1d5132f967
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140007.xnnT00as-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt76x0/debugfs.c:110:49: warning: format specifies type 'unsigned char' but the argument has type 's16' (aka 'short') [-Wformat]
           seq_printf(file, "Temperature offset: %hhx\n", dev->ee->temp_off);
                                                 ~~~~     ^~~~~~~~~~~~~~~~~
                                                 %hx
   1 warning generated.


vim +110 drivers/net/wireless/mediatek/mt76/mt76x0/debugfs.c

a79e4638152f31 Stanislaw Gruszka 2018-07-31   97  
a79e4638152f31 Stanislaw Gruszka 2018-07-31   98  static int
a79e4638152f31 Stanislaw Gruszka 2018-07-31   99  mt76x0_eeprom_param_read(struct seq_file *file, void *data)
a79e4638152f31 Stanislaw Gruszka 2018-07-31  100  {
a79e4638152f31 Stanislaw Gruszka 2018-07-31  101  	struct mt76x0_dev *dev = file->private;
a79e4638152f31 Stanislaw Gruszka 2018-07-31  102  	int i;
a79e4638152f31 Stanislaw Gruszka 2018-07-31  103  
a79e4638152f31 Stanislaw Gruszka 2018-07-31  104  	seq_printf(file, "RF freq offset: %hhx\n", dev->ee->rf_freq_off);
a79e4638152f31 Stanislaw Gruszka 2018-07-31  105  	seq_printf(file, "RSSI offset 2GHz: %hhx %hhx\n",
a79e4638152f31 Stanislaw Gruszka 2018-07-31  106  		   dev->ee->rssi_offset_2ghz[0], dev->ee->rssi_offset_2ghz[1]);
a79e4638152f31 Stanislaw Gruszka 2018-07-31  107  	seq_printf(file, "RSSI offset 5GHz: %hhx %hhx %hhx\n",
a79e4638152f31 Stanislaw Gruszka 2018-07-31  108  		   dev->ee->rssi_offset_5ghz[0], dev->ee->rssi_offset_5ghz[1],
a79e4638152f31 Stanislaw Gruszka 2018-07-31  109  		   dev->ee->rssi_offset_5ghz[2]);
a79e4638152f31 Stanislaw Gruszka 2018-07-31 @110  	seq_printf(file, "Temperature offset: %hhx\n", dev->ee->temp_off);
a79e4638152f31 Stanislaw Gruszka 2018-07-31  111  	seq_printf(file, "LNA gain 2Ghz: %hhx\n", dev->ee->lna_gain_2ghz);
a79e4638152f31 Stanislaw Gruszka 2018-07-31  112  	seq_printf(file, "LNA gain 5Ghz: %hhx %hhx %hhx\n",
a79e4638152f31 Stanislaw Gruszka 2018-07-31  113  		   dev->ee->lna_gain_5ghz[0], dev->ee->lna_gain_5ghz[1],
a79e4638152f31 Stanislaw Gruszka 2018-07-31  114  		   dev->ee->lna_gain_5ghz[2]);
a79e4638152f31 Stanislaw Gruszka 2018-07-31  115  	seq_printf(file, "Power Amplifier type %hhx\n", dev->ee->pa_type);
a79e4638152f31 Stanislaw Gruszka 2018-07-31  116  	seq_printf(file, "Reg channels: %hhu-%hhu\n", dev->ee->reg.start,
a79e4638152f31 Stanislaw Gruszka 2018-07-31  117  		   dev->ee->reg.start + dev->ee->reg.num - 1);
a79e4638152f31 Stanislaw Gruszka 2018-07-31  118  
a79e4638152f31 Stanislaw Gruszka 2018-07-31  119  	seq_puts(file, "Per channel power:\n");
a79e4638152f31 Stanislaw Gruszka 2018-07-31  120  	for (i = 0; i < 58; i++)
a79e4638152f31 Stanislaw Gruszka 2018-07-31  121  		seq_printf(file, "\t%d chan:%d pwr:%d\n", i, i,
a79e4638152f31 Stanislaw Gruszka 2018-07-31  122  			   dev->ee->tx_pwr_per_chan[i]);
a79e4638152f31 Stanislaw Gruszka 2018-07-31  123  
a79e4638152f31 Stanislaw Gruszka 2018-07-31  124  	seq_puts(file, "Per rate power 2GHz:\n");
a79e4638152f31 Stanislaw Gruszka 2018-07-31  125  	for (i = 0; i < 5; i++)
a79e4638152f31 Stanislaw Gruszka 2018-07-31  126  		seq_printf(file, "\t %d bw20:%d bw40:%d\n",
a79e4638152f31 Stanislaw Gruszka 2018-07-31  127  			   i, dev->ee->tx_pwr_cfg_2g[i][0],
a79e4638152f31 Stanislaw Gruszka 2018-07-31  128  			      dev->ee->tx_pwr_cfg_5g[i][1]);
a79e4638152f31 Stanislaw Gruszka 2018-07-31  129  
a79e4638152f31 Stanislaw Gruszka 2018-07-31  130  	seq_puts(file, "Per rate power 5GHz:\n");
a79e4638152f31 Stanislaw Gruszka 2018-07-31  131  	for (i = 0; i < 5; i++)
a79e4638152f31 Stanislaw Gruszka 2018-07-31  132  		seq_printf(file, "\t %d bw20:%d bw40:%d\n",
a79e4638152f31 Stanislaw Gruszka 2018-07-31  133  			   i, dev->ee->tx_pwr_cfg_5g[i][0],
a79e4638152f31 Stanislaw Gruszka 2018-07-31  134  			      dev->ee->tx_pwr_cfg_5g[i][1]);
a79e4638152f31 Stanislaw Gruszka 2018-07-31  135  
a79e4638152f31 Stanislaw Gruszka 2018-07-31  136  	return 0;
a79e4638152f31 Stanislaw Gruszka 2018-07-31  137  }
a79e4638152f31 Stanislaw Gruszka 2018-07-31  138  

:::::: The code at line 110 was first introduced by commit
:::::: a79e4638152f315aa24627da062b91f60665cf3b mt76x0: trace and debugfs files

:::::: TO: Stanislaw Gruszka <sgruszka@redhat.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

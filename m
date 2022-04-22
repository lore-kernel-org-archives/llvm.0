Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970F02F3B
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 23:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650671008; x=1682207008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zABS5wFkYW6CaRqAD+VBR8WOZmz+FfZuA2c+J9yGMcw=;
  b=EcpVW4XBVq24+6VjTDnUsT1agmIVZAsoUFAvvO59oItsdpyQ1mQVUmgN
   FI8x9WuDOGqQzMfNeUIgXmQkCm+xvJvT7mgYrSVnKQYzdz1D9u4limfrq
   R30lxVsxAXlnSUm1bZwRpiTgpOmCy8mzyG5HesM7kY9cunTVzB1D1FItd
   EbKOQpPQEHEkNxPSikj/SjkN7WKPuJVs5GSmuRwiSUpemGsFaF1YCpJDa
   Dgv8HXp/3yAuEC5i4kS5kY9VTeOn+n6HV+T+FI0QKFCl7uHMSyjbzEWNB
   kvKL1GzgezAnUNxU8s/W4guwhBZx0XENrn8ZsnDnSfOwI6Cp42Ibn5zK7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="327729454"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="327729454"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 16:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="806202318"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2022 16:43:26 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ni2vt-000Afo-RV;
	Fri, 22 Apr 2022 23:43:25 +0000
Date: Sat, 23 Apr 2022 07:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 4698/5845]
 drivers/gpu/drm/solomon/ssd130x-spi.c:154:35: warning: unused variable
 'ssd130x_spi_table'
Message-ID: <202204230717.gJP3yZ5j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7d6987e09a328d4a949701db40ef63fbb970670
commit: 74373977d2ca26e5735377f8874be70bc2f030f5 [4698/5845] drm/solomon: Add SSD130x OLED displays SPI support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220423/202204230717.gJP3yZ5j-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=74373977d2ca26e5735377f8874be70bc2f030f5
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 74373977d2ca26e5735377f8874be70bc2f030f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/solomon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/solomon/ssd130x-spi.c:154:35: warning: unused variable 'ssd130x_spi_table' [-Wunused-const-variable]
   static const struct spi_device_id ssd130x_spi_table[] = {
                                     ^
   1 warning generated.


vim +/ssd130x_spi_table +154 drivers/gpu/drm/solomon/ssd130x-spi.c

   145	
   146	/*
   147	 * The SPI core always reports a MODALIAS uevent of the form "spi:<dev>", even
   148	 * if the device was registered via OF. This means that the module will not be
   149	 * auto loaded, unless it contains an alias that matches the MODALIAS reported.
   150	 *
   151	 * To workaround this issue, add a SPI device ID table. Even when this should
   152	 * not be needed for this driver to match the registered SPI devices.
   153	 */
 > 154	static const struct spi_device_id ssd130x_spi_table[] = {
   155		{ "sh1106",  SH1106_ID },
   156		{ "ssd1305", SSD1305_ID },
   157		{ "ssd1306", SSD1306_ID },
   158		{ "ssd1307", SSD1307_ID },
   159		{ "ssd1309", SSD1309_ID },
   160		{ /* sentinel */ }
   161	};
   162	MODULE_DEVICE_TABLE(spi, ssd130x_spi_table);
   163	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

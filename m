Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB08E290B;
	Fri,  3 Feb 2023 22:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675463541; x=1706999541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pIGrupTEDXpoUeI3Xj9bt5x4kPdBAZYQHZVaoC2h++c=;
  b=BQ5P6gMB8TGdLEDarZ5TT3qqNAI/pUW+VZbuOyvla1iEvsSMYSdxkw0a
   sspdP+RfRB6K6l21qwaO5FfT+hB49V7TitKz/WFawjMhDI803yEYLo9lX
   FO6EUVBq1ZXd7e50AdUopjv4hugaI/z62v/qRlVfP2vPLFNh8lfaVGVq5
   cojuFymkOd68LekNWYHfysmGvXUWtbrLRLP5ZEPmYy/GYadKOEuhKAEOQ
   DBUB0eVy7QAsodwcfzLbaXvMH+42eXs99fA6gdWAT/AHDGHT4gcFJD1ez
   BoJpj6TSToB+7lRjmwcjhZsLqHBzv+I7EvGeFW3KPM7/M7mEejfTW6MF8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="327507851"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="327507851"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 14:32:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="774476939"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="774476939"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 14:32:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO4bT-0000ob-04;
	Fri, 03 Feb 2023 22:32:19 +0000
Date: Sat, 4 Feb 2023 06:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [linux-next:master 8959/10357]
 drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous prototype for
 function 'pcmcia_collie_init'
Message-ID: <202302040652.zkUBTjyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nathan,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4fafd96910add124586b549ad005dcd179de8a18
commit: 5eb6e280432ddc9b755193552f3a070da8d7455c [8959/10357] ARM: 9289/1: Allow pre-ARMv5 builds with ld.lld 16.0.0 and newer
config: arm-collie_defconfig (https://download.01.org/0day-ci/archive/20230204/202302040652.zkUBTjyo-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5eb6e280432ddc9b755193552f3a070da8d7455c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 5eb6e280432ddc9b755193552f3a070da8d7455c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pcmcia/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous prototype for function 'pcmcia_collie_init' [-Wmissing-prototypes]
   int pcmcia_collie_init(struct device *dev)
       ^
   drivers/pcmcia/pxa2xx_sharpsl.c:206:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pcmcia_collie_init(struct device *dev)
   ^
   static 
   1 warning generated.


vim +/pcmcia_collie_init +206 drivers/pcmcia/pxa2xx_sharpsl.c

a63ae4427c6af6 Richard Purdie 2005-11-08  205  
34cdf25a126f05 Bill Pemberton 2012-11-19 @206  int pcmcia_collie_init(struct device *dev)
77bb86a1b9f8b8 Pavel Machek   2005-10-30  207  {
77bb86a1b9f8b8 Pavel Machek   2005-10-30  208         int ret = -ENODEV;
77bb86a1b9f8b8 Pavel Machek   2005-10-30  209  
77bb86a1b9f8b8 Pavel Machek   2005-10-30  210         if (machine_is_collie())
77bb86a1b9f8b8 Pavel Machek   2005-10-30  211                 ret = sa11xx_drv_pcmcia_probe(dev, &sharpsl_pcmcia_ops, 0, 1);
77bb86a1b9f8b8 Pavel Machek   2005-10-30  212  
77bb86a1b9f8b8 Pavel Machek   2005-10-30  213         return ret;
77bb86a1b9f8b8 Pavel Machek   2005-10-30  214  }
77bb86a1b9f8b8 Pavel Machek   2005-10-30  215  

:::::: The code at line 206 was first introduced by commit
:::::: 34cdf25a126f053698d549cc12a9c30e9a8a0bab pcmcia: remove use of __devinit

:::::: TO: Bill Pemberton <wfp5p@virginia.edu>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

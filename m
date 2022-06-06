Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC91346B7
	for <llvm@lists.linux.dev>; Mon,  6 Jun 2022 02:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654483352; x=1686019352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cYXhc1jT7ezmOoNdV3xqBIghhscJRNwdK2ONb4gnirw=;
  b=MDu6yDqGCVko09pAOPDc37YPS2CaLY6eaFelB/7mki+nnUEERXbF7ebz
   3FSjNc/QSlWL4C86D7p1hrItbqhDqoHrovI2rjg9R77uhU5ERxkFoYNLs
   zitL3yBBfAEf4YVn3sLTGxywikCd/yMYgBawZu6Y1pGb2n+zccq88vlRh
   D+XJu9GMfgyTyVPvedi8GZXHgA+20TrqHFe6XR6GZaYQUDObaapSiiWwQ
   yaq8qZHuDIX6RTeVMXzbc5DEpLsCWeCGbCUz+bwRqcdoGgSIP9JOWr+JN
   pZyyRd/JGsMjbZ5E06GN/ORdb0zWmnRsQN/JeY/1XBtC2RIhq9RyAszCC
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="362958102"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="362958102"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2022 19:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="669265976"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2022 19:42:04 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ny2gt-000CQa-PU;
	Mon, 06 Jun 2022 02:42:03 +0000
Date: Mon, 6 Jun 2022 10:41:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>, pavel@ucw.cz,
	krzk+dt@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, robh+dt@kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: Re: [PATCH v2 2/3] leds: Add driver for the TLC5925 LED controller
Message-ID: <202206060923.vYFzGndu-lkp@intel.com>
References: <20220603155332.112272-3-jjhiblot@traphandler.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603155332.112272-3-jjhiblot@traphandler.com>

Hi Jean-Jacques,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on pavel-leds/for-next]
[also build test WARNING on v5.18 next-20220603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jean-Jacques-Hiblot/Add-support-for-the-TLC5925/20220605-235250
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-next
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220606/202206060923.vYFzGndu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 416a5080d89066029f9889dc23f94de47c2fa895)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/e8ae916efd705311a0bdeb2a8f9a1649174867be
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jean-Jacques-Hiblot/Add-support-for-the-TLC5925/20220605-235250
        git checkout e8ae916efd705311a0bdeb2a8f9a1649174867be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/leds/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-tlc5925.c:144:35: warning: unused variable 'tlc5925_id' [-Wunused-const-variable]
   static const struct spi_device_id tlc5925_id[] = {
                                     ^
   1 warning generated.


vim +/tlc5925_id +144 drivers/leds/leds-tlc5925.c

   143	
 > 144	static const struct spi_device_id tlc5925_id[] = {
   145		{"tlc5925", 0},
   146		{}
   147	};
   148	MODULE_DEVICE_TABLE(spi, tlc5925_id);
   149	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

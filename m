Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF1E2F3A
	for <llvm@lists.linux.dev>; Tue,  5 Apr 2022 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649167572; x=1680703572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CFa5A1SPasxdt/faFPNQMzhbyj0FQCps6LoEV//jNAc=;
  b=gB0h8A2ET2bChIXSXnws/J6KxfoebkBHYYjr9Vc7co6wu7I3DJ6qnxHS
   hO1tDWaxR+dH6xk8EPXNc+J2+UUxrmhHTAlQP85P6qis4pUOyIej4zdQ3
   hkpZXndYo5OAmvCaoftCOOITjQ1/xHdC0a/aedHCJFn6y4RS/csHLyvkt
   9PEceEw4Ylk3rllDweyQ3/40eaC0nai/0LQ3By81OUKukNr2OPmjzyAu+
   l94MXcHNFyOaNEA5a5tDyY6jZItoi8x44ARXSVvN9U0lvAy5apL0rXg/7
   XweLcIGe73xSKGbENHqpHx9gPJUT9YL07/88TdLF0ZVvNklMgU+GXd1K4
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="260451467"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="260451467"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 07:06:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="523471853"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Apr 2022 07:06:08 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbjot-0003Mn-HR;
	Tue, 05 Apr 2022 14:06:07 +0000
Date: Tue, 5 Apr 2022 22:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, alsa-devel@alsa-project.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
	kernel@pengutronix.de, dmaengine@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v3 12/20] ASoC: fsl_micfil: add multi fifo support
Message-ID: <202204052146.aQF1Px8G-lkp@intel.com>
References: <20220405075959.2744803-13-s.hauer@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405075959.2744803-13-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Sascha,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on shawnguo/for-next vkoul-dmaengine/next linus/master v5.18-rc1 next-20220405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sascha-Hauer/ASoC-fsl_micfil-Driver-updates/20220405-161030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220405/202204052146.aQF1Px8G-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/05755df1cf507c46e44c4742bed6090e546b2905
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sascha-Hauer/ASoC-fsl_micfil-Driver-updates/20220405-161030
        git checkout 05755df1cf507c46e44c4742bed6090e546b2905
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/fsl/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_micfil.c:19:10: fatal error: 'linux/platform_data/dma-imx.h' file not found
   #include <linux/platform_data/dma-imx.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +19 sound/soc/fsl/fsl_micfil.c

     3	
     4	#include <linux/bitfield.h>
     5	#include <linux/clk.h>
     6	#include <linux/device.h>
     7	#include <linux/interrupt.h>
     8	#include <linux/kobject.h>
     9	#include <linux/kernel.h>
    10	#include <linux/module.h>
    11	#include <linux/of.h>
    12	#include <linux/of_address.h>
    13	#include <linux/of_irq.h>
    14	#include <linux/of_platform.h>
    15	#include <linux/pm_runtime.h>
    16	#include <linux/regmap.h>
    17	#include <linux/sysfs.h>
    18	#include <linux/types.h>
  > 19	#include <linux/platform_data/dma-imx.h>
    20	#include <sound/dmaengine_pcm.h>
    21	#include <sound/pcm.h>
    22	#include <sound/soc.h>
    23	#include <sound/tlv.h>
    24	#include <sound/core.h>
    25	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CB51841
	for <llvm@lists.linux.dev>; Thu, 26 May 2022 15:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653577993; x=1685113993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eo04dMoSFmSo3nxdW9QEasimDjpp0m2IU8Sbp5hd+fc=;
  b=OKCIwOnNzNaGknvkQK2TSV8c46XH63VCASlSPGXJFgooHjLXjPOtY7Xn
   4TYSh78XYABMxBmteifRgw4bjnAwB+nMHQTnYhvTXlBdMJ3oaB4JA4xWd
   R6xTJJJUqqme608rQLLJrViGtHmbll8Bimfv+SA5cgU+Bx8lz0hY+RY6z
   tOnqUjccxBvEJ0kwhlN+8a6SCEJmNorrMnXoQhuasxVFCL/r4DmKXY9jR
   W2Sjcou0Seswjq0ZlqvWKE1Q4DiJ8Grv7fSmD8TnNFjJpjJ+B+jYfR7ox
   xJE4nP1h1BJ62E5bAKl4maBz+a49kHZc7OijowiUETP6CW+t8+4Vs01/G
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="272999448"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="272999448"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2022 08:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="560241410"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 May 2022 08:13:09 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nuFAj-0003wy-9J;
	Thu, 26 May 2022 15:13:09 +0000
Date: Thu, 26 May 2022 23:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	lgirdwood@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, broonie@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 4/4] regulator: Add driver for MT6332 PMIC regulators
Message-ID: <202205262341.pY4PkDL7-lkp@intel.com>
References: <20220523154709.118663-5-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523154709.118663-5-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on v5.18 next-20220526]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/MediaTek-Helio-X10-MT6795-MT6331-6332-Regulators/20220523-235049
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220526/202205262341.pY4PkDL7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3d546191ad9d7d2ad2c7928204b9de51deafa675)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/062027827142f02db7e65b052d458f424811e30e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/MediaTek-Helio-X10-MT6795-MT6331-6332-Regulators/20220523-235049
        git checkout 062027827142f02db7e65b052d458f424811e30e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/regulator/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/regulator/mt6332-regulator.c:15:10: fatal error: 'linux/mfd/mt6332/registers.h' file not found
   #include <linux/mfd/mt6332/registers.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +15 drivers/regulator/mt6332-regulator.c

     9	
    10	#include <linux/module.h>
    11	#include <linux/of.h>
    12	#include <linux/platform_device.h>
    13	#include <linux/regmap.h>
    14	#include <linux/mfd/mt6397/core.h>
  > 15	#include <linux/mfd/mt6332/registers.h>
    16	#include <linux/regulator/driver.h>
    17	#include <linux/regulator/machine.h>
    18	#include <linux/regulator/mt6332-regulator.h>
    19	#include <linux/regulator/of_regulator.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

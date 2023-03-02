Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070B2A23;
	Thu,  2 Mar 2023 00:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677718255; x=1709254255;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KlpgGeaB3rdWSdovNpnT3QMbCnBVcYqxPw6F21oYYvE=;
  b=GVcvw5qq+6Zm2h3mk8TCuffwATm8OHupoN0yhJ12B+rHq38NM7H6p06l
   5OZbpXunMTKX14pSS9/SJ8uvYLof4g3M5fabGBismy9qIjXPnaF8O+N2d
   QANWrCV5wwXfzZa8LuLXoooj8PZgEi1ZMV34UhNe5FX/2plCna2MtLyAh
   lp40D81ISzzRvVTwkq59yhtk4MNZRm0WGrBKAsuipYsCAe6mg8Gwvw9bg
   xFHIUfBmns5VLw2b9NBCdzs0KS+RkwDWntsk7qw73azGP6YzkCLa2HjgV
   RrvScfwnuuit1bJSgAcr2RNHHNFhgvSoSZL9pzjMbmESGJa44wjjkBmsB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="362158866"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="362158866"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 16:50:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="674766147"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="674766147"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Mar 2023 16:50:53 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXX9o-000011-0W;
	Thu, 02 Mar 2023 00:50:52 +0000
Date: Thu, 2 Mar 2023 08:49:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: Intel: avs: Use struct_size for struct
 avs_modcfg_ext size
Message-ID: <202303020847.qH3c80x2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

In-Reply-To: <20230301204628.1073819-1-jacob.e.keller@intel.com>
References: <20230301204628.1073819-1-jacob.e.keller@intel.com>
TO: Jacob Keller <jacob.e.keller@intel.com>
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: alsa-devel@alsa-project.org
CC: Jacob Keller <jacob.e.keller@intel.com>
CC: "Amadeusz Sławiński" <amadeuszx.slawinski@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>

Hi Jacob,

I love your patch! Yet something to improve:

[auto build test ERROR on ee3f96b164688dae21e2466a57f2e806b64e8a37]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacob-Keller/ASoC-Intel-avs-Use-struct_size-for-struct-avs_modcfg_ext-size/20230302-045013
base:   ee3f96b164688dae21e2466a57f2e806b64e8a37
patch link:    https://lore.kernel.org/r/20230301204628.1073819-1-jacob.e.keller%40intel.com
patch subject: [PATCH] ASoC: Intel: avs: Use struct_size for struct avs_modcfg_ext size
config: riscv-randconfig-r016-20230302 (https://download.01.org/0day-ci/archive/20230302/202303020847.qH3c80x2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/0c496f11f1cbd44739410a2d4eb069c09cffd52c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jacob-Keller/ASoC-Intel-avs-Use-struct_size-for-struct-avs_modcfg_ext-size/20230302-045013
        git checkout 0c496f11f1cbd44739410a2d4eb069c09cffd52c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020847.qH3c80x2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function init_setup: .init.text+0xae): relocation R_RISCV_HI20 out of range: 527014 is not in [-524288, 524287]; references execute_command
   >>> referenced by main.c:240 (init/main.c:240)
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

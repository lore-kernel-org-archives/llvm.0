Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFCABA36;
	Thu, 13 Apr 2023 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681417744; x=1712953744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/s///dNIOtpPvweuCdxqrXTsgzxqOnKOmCp0SZMTDXw=;
  b=Z3hMu1oGEhtlnARP9e3Ztm5bpKTCtF3ezQcabE5S9FUliTp2kO+6fP9V
   1nsTWnUOaquwabkaBoK/IyaJWP+LHxuwFx0K4ykRR4g/Ixz28fZxPgT3P
   uR9ZYH/mocn6lupN1n3Yxxi1amIzBMhjw+Zwa6rX3S6a/FbqB9iw7sWak
   eP4bazo0qSUwl7Qc6CedojLWo1/UztNyfQoOhV0XUx4ifR6/X9fE48FmF
   bzo9P6kEoCQ+259FFGMmsYINVohztr7rp23Yt1TMmYKFXdCnj1o3llz2t
   chVLoRDCWd8yByrRuds4Pdk5S3B46ZhxSLkA0ClQKIVGOEJLBfcsdoODS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="341793874"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="341793874"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 13:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="935738112"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="935738112"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Apr 2023 13:29:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn3Yz-000Yw1-2j;
	Thu, 13 Apr 2023 20:29:01 +0000
Date: Fri, 14 Apr 2023 04:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 08/14] arm64: dts: qcom: pm8150b: Add a TCPM
 description
Message-ID: <202304140402.JsxaGCU5-lkp@intel.com>
References: <20230413113438.1577658-9-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413113438.1577658-9-bryan.odonoghue@linaro.org>

Hi Bryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus robh/for-next broonie-regulator/for-next linus/master v6.3-rc6 next-20230412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/dt-bindings-regulator-qcom-usb-vbus-regulator-Mark-reg-as-required/20230413-193753
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230413113438.1577658-9-bryan.odonoghue%40linaro.org
patch subject: [PATCH v5 08/14] arm64: dts: qcom: pm8150b: Add a TCPM description
config: arm-randconfig-r046-20230409 (https://download.01.org/0day-ci/archive/20230414/202304140402.JsxaGCU5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/f70460d49d6af0c5f743cf69873fbc60dbd2c4be
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bryan-O-Donoghue/dt-bindings-regulator-qcom-usb-vbus-regulator-Mark-reg-as-required/20230413-193753
        git checkout f70460d49d6af0c5f743cf69873fbc60dbd2c4be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140402.JsxaGCU5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

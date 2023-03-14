Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0A6D2F6;
	Tue, 14 Mar 2023 23:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678836238; x=1710372238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9JSluFsQgkYA1CSEXZw29hUEPKHlRuKNC1VLjY8g/5I=;
  b=XPNranuZ1mISccNUwK/M1OIapBhPFta4we665n9K/S9Ju3T6u8ojIPkU
   pqlJxDRxj2gVcyaFW4/yyHMy+6spSGLO86ccFmjYr41dlBiqYJ1UUbceC
   4chcB4QkQKoRM+8UNyxGA3gYCT5RtcgVLY8zr7W62faNFzNppj3cOEDPU
   EajgV7P/YwfMZBrRCkEHEdeGlN2KkvTCIr/OX6A7+qKg7nemiPKtrA9BM
   N2bVXSDE9aoe9T+OktBj+jKL7a/zMe2Ty8M+pgU3DUGqFyzpJu62jFFAD
   XByscWU2wrHfl/B0z7NoJKO6kyzFtUJWIXaNLzSQNteq1EcO1vXaEfchJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="321410898"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; 
   d="scan'208";a="321410898"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 16:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="789560177"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; 
   d="scan'208";a="789560177"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2023 16:23:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcDzm-0007GC-0h;
	Tue, 14 Mar 2023 23:23:54 +0000
Date: Wed, 15 Mar 2023 07:23:28 +0800
From: kernel test robot <lkp@intel.com>
To: Komal Bajaj <quic_kbajaj@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rishabh Bhatnagar <rishabhb@codeaurora.org>,
	Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andy Gross <agross@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Komal Bajaj <quic_kbajaj@quicinc.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/5] soc: qcom: Add LLCC support for multi channel DDR
Message-ID: <202303150713.cMgW2Qnu-lkp@intel.com>
References: <20230313124040.9463-5-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313124040.9463-5-quic_kbajaj@quicinc.com>

Hi Komal,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.3-rc2 next-20230314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Komal-Bajaj/soc-qcom-llcc-Refactor-llcc-driver-to-support-multiple-configuration/20230313-204310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230313124040.9463-5-quic_kbajaj%40quicinc.com
patch subject: [PATCH v2 4/5] soc: qcom: Add LLCC support for multi channel DDR
config: mips-randconfig-r021-20230312 (https://download.01.org/0day-ci/archive/20230315/202303150713.cMgW2Qnu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/fe14182092383680f24bc88d81d199261453fa71
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Komal-Bajaj/soc-qcom-llcc-Refactor-llcc-driver-to-support-multiple-configuration/20230313-204310
        git checkout fe14182092383680f24bc88d81d199261453fa71
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303150713.cMgW2Qnu-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "qcom_scm_io_readl" [drivers/soc/qcom/llcc-qcom.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

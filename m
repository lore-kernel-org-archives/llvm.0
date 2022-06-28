Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC03368
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 03:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656387126; x=1687923126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0aHN4mfLxYQCQhyA6ZlbNE5JoJBgYv0+uTjZnOONln0=;
  b=TE5TUd+Ass0by5U0X1i/qNqR2tOCHTSlJdIGPwxyr3sw4mSxGGtDpHEV
   TW6JekVaW6+6e6IapjwvDcnaKX0wETgmpDKONxOIp5MvSyyOpT89mNvyM
   RHHPrSJ6sF/CT2/9rcrL2gCad5mG0YguM239Trt3vBjit0ZnQzj2BRMlm
   JNrK5HteacVH5gTcW5SriproiJ/6oQjX7IylpKIyWml4Kbo8Mb/AtjakI
   ifsWhAvX7s96shYlvbf15uX52Q4crTwIe2UviCRJqP8JBEdCgnVqpZmn0
   UZj2qUO9bvwvQz29RumOEsCZeeycv6mwWZUJEI1kKQcIvlw4XRCAIFgfG
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="282714616"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="282714616"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 20:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="836485895"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2022 20:32:01 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o61xI-0009Sd-HC;
	Tue, 28 Jun 2022 03:32:00 +0000
Date: Tue, 28 Jun 2022 11:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan R <quic_srichara@quicinc.com>, agross@kernel.org,
	bjorn.andersson@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	sboyd@kernel.org, linus.walleij@linaro.org, catalin.marinas@arm.com,
	p.zabel@pengutronix.de, quic_varada@quicinc.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH V2 5/8] pinctrl: qcom: Add IPQ5018 pinctrl driver
Message-ID: <202206281113.juwklxoO-lkp@intel.com>
References: <20220621161126.15883-6-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621161126.15883-6-quic_srichara@quicinc.com>

Hi Sricharan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next linusw-pinctrl/devel linus/master v5.19-rc4 next-20220627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sricharan-R/Add-minimal-boot-support-for-IPQ5018/20220622-001751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220628/202206281113.juwklxoO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 016342e319fd31e41cf5ed16a6140a8ea2de74dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/5986a00923b330deb4c2c70e0d531507a19fb840
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sricharan-R/Add-minimal-boot-support-for-IPQ5018/20220622-001751
        git checkout 5986a00923b330deb4c2c70e0d531507a19fb840
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/ drivers/clk/qcom/ drivers/pinctrl/qcom/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/qcom/pinctrl-ipq5018.c:252:27: warning: unused variable '_groups' [-Wunused-const-variable]
   static const char * const _groups[] = {
                             ^
   1 warning generated.


vim +/_groups +252 drivers/pinctrl/qcom/pinctrl-ipq5018.c

   251	
 > 252	static const char * const _groups[] = {
   253		"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7",
   254		"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
   255		"gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21",
   256		"gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", "gpio28",
   257		"gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
   258		"gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", "gpio42",
   259		"gpio43", "gpio44", "gpio45", "gpio46",
   260	};
   261	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

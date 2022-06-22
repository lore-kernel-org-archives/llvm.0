Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0AB1843
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 21:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655934727; x=1687470727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OKSjDCXBPWAqYOO2qdqkra9IDNhXCaifuwSh1mco7lw=;
  b=n3V2YEHp6hS6lhXR2hE5PiSf52yrE2/AVjGx3oy2bDh/q2NOTiX4cKdC
   +i3myZL3HYgUrziMxkSsfjYSyOW2TJZH7dithQpwdTYN3KeN+7OvMhEKl
   KBH051ycH9dfHDzb+zA3ZxepqLT1zGo2YLatlRs+pu/mBHl2/KuK0FaPI
   eNl5UwjrfFKmsXg4aN3YrBfF8ag5Huz0fSvxeiy49qAxGht7OkOtFTNPJ
   KcWx9dgoIVxEjFYXbbYlpw+1GSaV5OFxHuxGpZ7R6R2cMTLzxsIJJHEmT
   WCC7hPOi/2AiZJLhlCoF7FqI/cr3+uhvFO4Aicdx5xmTfonCrMkhrh74M
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="280603032"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="280603032"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 14:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="765057657"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Jun 2022 14:52:03 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o48GY-0001jI-TA;
	Wed, 22 Jun 2022 21:52:02 +0000
Date: Thu, 23 Jun 2022 05:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>, agross@kernel.org,
	bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	quic_msavaliy@quicinc.com, dianders@chromium.org, mka@chromium.org,
	swboyd@chromium.org,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: Re: [PATCH] tty: serial: qcom-geni-serial: Fix get_clk_div_rate()
 which otherwise could return a sub-optimal clock rate.
Message-ID: <202206230511.W02MMaf8-lkp@intel.com>
References: <1655834239-20812-1-git-send-email-quic_vnivarth@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1655834239-20812-1-git-send-email-quic_vnivarth@quicinc.com>

Hi Vijaya,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on linus/master v5.19-rc3 next-20220622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vijaya-Krishna-Nivarthi/tty-serial-qcom-geni-serial-Fix-get_clk_div_rate-which-otherwise-could-return-a-sub-optimal-clock-rate/20220622-015826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
config: arm-randconfig-r036-20220622 (https://download.01.org/0day-ci/archive/20220623/202206230511.W02MMaf8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8b8d126598ce7bd5243da7f94f69fa1104288bee)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/668659f1481053090a9dbe9c83bd769de527a5c2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vijaya-Krishna-Nivarthi/tty-serial-qcom-geni-serial-Fix-get_clk_div_rate-which-otherwise-could-return-a-sub-optimal-clock-rate/20220622-015826
        git checkout 668659f1481053090a9dbe9c83bd769de527a5c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_uldivmod
   >>> referenced by qcom_geni_serial.c
   >>>               tty/serial/qcom_geni_serial.o:(find_clk_rate_in_tol) in archive drivers/built-in.a
   >>> did you mean: __aeabi_uidivmod
   >>> defined in: arch/arm/lib/lib.a(lib1funcs.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

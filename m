Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE4E210B
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 09:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654767212; x=1686303212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LXu/9U0BdgUxliXYEM/+Ql+iYlIl9zqzpjen+/HOcWM=;
  b=FLXSO2sUmZrN9EsF1eRG74lv5NL+9pH6ovW9ex+mgFZ+Xt5+/p8I0oep
   xsqlaPTkwOxdmyrMcmLhf4/m0DP/RwMxX7DYmnzqWIJcACzAlO+79sOjV
   83ugIA3kjbTmXh8kvwTNA8mN5bnrKn1VZDopD6zSrbP54dFWgw60cFh+l
   6/bs6/OxYiJADD2bZsK4ChWFHHrJCDQZ8ea/0MM5Pya0jgy4ntKxpdar5
   m/pmgYM/8syVHhb8qBM/5pN19OHCfNRRyXWD5bmuYymKAFH0TNrlTypXr
   1BRBL0b94ZPuIv2i/Ww9+UnDqCc4/Sdn3uk8rizhBnOBvMJ8WD/fv3BtO
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="275986152"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="275986152"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 02:33:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="724333416"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2022 02:33:28 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzEXg-000FqZ-4Y;
	Thu, 09 Jun 2022 09:33:28 +0000
Date: Thu, 9 Jun 2022 17:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: qcom: msm8974-*: re-add remoteproc supplies
Message-ID: <202206091706.4QP4H2JW-lkp@intel.com>
References: <20220606160421.1641778-2-luca@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606160421.1641778-2-luca@z3ntu.xyz>

Hi Luca,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on robh/for-next v5.19-rc1 next-20220609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Weiss/ARM-dts-qcom-msm8974-re-add-missing-pinctrl/20220607-002318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f2906aa863381afb0015a9eb7fefad885d4e5a56
config: arm-randconfig-c002-20220608 (https://download.01.org/0day-ci/archive/20220609/202206091706.4QP4H2JW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/68b0d8fbd2f10572118c481ea108f3dfb7f46a4f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Luca-Weiss/ARM-dts-qcom-msm8974-re-add-missing-pinctrl/20220607-002318
        git checkout 68b0d8fbd2f10572118c481ea108f3dfb7f46a4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   also defined at arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts:291.18-293.3
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

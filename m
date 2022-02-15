Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BAE1561
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 13:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644932875; x=1676468875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sOvWmHCfNTGwnxKIrR6Zs268ld65whSnGZFHC7shh/M=;
  b=EgLymGLsXzX6e88ywqx9XFCNjWrfnPjOJ+Q5z29na5QTSksSO81NccQv
   DJ3MCl0Lcpi8VN4mPzRpWvn4pgAhYjELukKQMwR3K5HSIJenu05QsCB5x
   o9jojrmo26E0J7mRbE+c2uG8np6Y/bmdAjWniyjn+h49ShjahapHvg82A
   IoBf3w0WOS8V3ACGO44cWhXmooAHnug/KnpK4HFdq9LcUITmlwFWxa9gM
   0Fn7GxWsFF8RGTGi2L0rnjOgcbQfGspYArZDCTznNqhdtlurBCzWGAxQG
   K2qUoTgbCeAOjtVUBMv+SEwBKyqOLHvpnmXr2mUKc611QHgBtdiwRm6Fc
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="250094383"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="250094383"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 05:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="681038721"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2022 05:47:50 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJyBK-0009hq-7O; Tue, 15 Feb 2022 13:47:50 +0000
Date: Tue, 15 Feb 2022 21:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Satya Priya <quic_c_skakit@quicinc.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Lee Jones <lee.jones@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Das Srinagesh <gurus@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	swboyd@chromium.org, quic_collinsd@quicinc.com,
	quic_subbaram@quicinc.com, quic_jprakash@quicinc.com,
	Satya Priya <quic_c_skakit@quicinc.com>
Subject: Re: [PATCH V6 3/6] mfd: pm8008: Add mfd cell struct to register LDOs
Message-ID: <202202152150.MRo3NhGR-lkp@intel.com>
References: <1644915231-7308-4-git-send-email-quic_c_skakit@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644915231-7308-4-git-send-email-quic_c_skakit@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Satya,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220214]
[also build test ERROR on v5.17-rc4]
[cannot apply to robh/for-next broonie-regulator/for-next lee-mfd/for-mfd-next v5.17-rc4 v5.17-rc3 v5.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Satya-Priya/Add-Qualcomm-Technologies-Inc-PM8008-regulator-driver/20220215-165525
base:    259cbfc98c55ba3b6ef6e61fb7cfc3751dfded1e
config: i386-randconfig-a005-20220214 (https://download.01.org/0day-ci/archive/20220215/202202152150.MRo3NhGR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/12b686033a10eae2956b1c8436bfaa8c411baa92
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Satya-Priya/Add-Qualcomm-Technologies-Inc-PM8008-regulator-driver/20220215-165525
        git checkout 12b686033a10eae2956b1c8436bfaa8c411baa92
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/mfd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mfd/qcom-pm8008.c:270:38: error: expected ';' after top level declarator
   MODULE_DEVICE_TABLE(of, pm8008_match)
                                        ^
                                        ;
   1 error generated.


vim +270 drivers/mfd/qcom-pm8008.c

   265	
   266	static const struct of_device_id pm8008_match[] = {
   267		{ .compatible = "qcom,pm8008", .data = (void *)PM8008_INFRA},
   268		{ .compatible = "qcom,pm8008-regulators", .data = (void *)PM8008_REGULATORS},
   269	};
 > 270	MODULE_DEVICE_TABLE(of, pm8008_match)
   271	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

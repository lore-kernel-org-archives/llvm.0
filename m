Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B2DAD2D;
	Mon, 17 Apr 2023 22:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681769293; x=1713305293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+rWAufT+1XCj4iPA+P7vctkwd0W/JIPu4RUm6R0PmOE=;
  b=dWwO/6Az+cGoez2x+kL8gRzraJM6v+9cvzXsWUq/sU5e6z79wL9L0G6u
   e4zMX6ZAsFpvYbKjhJU4OF93hw9gu0PWqpGsijW7jLY1TFVF28yPIA1a3
   Vx5QuvSR50H+XeO8fAswABxL7eEeEkVIp3F57GLw+XYhNxda2d+BwO5ic
   s2bJRy7/X/+13bzfIAbbTgHU4an21kDbwHi995IJzHYiN2WYNcuH7+1Tz
   3HunEUJRhI1nUoyekuCT+LVX4owa6hvz+oCOxllkE7r5dTNrC17w4LL9E
   A27E+D947OQf7kdR1XSfYfvItAPDPv/JySkkLnf08h+3Uz9hNTnVFT13+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="410235682"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="410235682"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 15:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="937016979"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="937016979"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Apr 2023 15:08:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poX12-000chP-2Y;
	Mon, 17 Apr 2023 22:08:04 +0000
Date: Tue, 18 Apr 2023 06:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:wip/sm8450-hdmi-audio-on-qcomlt 297/357]
 drivers/interconnect/qcom/icc-rpm.c:206:5: warning: no previous prototype
 for function 'qcom_icc_rpm_set'
Message-ID: <202304180615.pXigsxUc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/sm8450-hdmi-audio-on-qcomlt
head:   aaffc85ea59d991971812124737973d89355d8b1
commit: 9a39bdbadcf01035fa85765c18a6fd048c177ba8 [297/357] [HACK] Push DDR to FMAX frequency at boot
config: arm64-randconfig-r036-20230416 (https://download.01.org/0day-ci/archive/20230418/202304180615.pXigsxUc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/krzk/linux/commit/9a39bdbadcf01035fa85765c18a6fd048c177ba8
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/sm8450-hdmi-audio-on-qcomlt
        git checkout 9a39bdbadcf01035fa85765c18a6fd048c177ba8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/interconnect/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180615.pXigsxUc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/interconnect/qcom/icc-rpm.c:206:5: warning: no previous prototype for function 'qcom_icc_rpm_set' [-Wmissing-prototypes]
   int qcom_icc_rpm_set(int mas_rpm_id, int slv_rpm_id, u64 sum_bw)
       ^
   drivers/interconnect/qcom/icc-rpm.c:206:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int qcom_icc_rpm_set(int mas_rpm_id, int slv_rpm_id, u64 sum_bw)
   ^
   static 
   1 warning generated.


vim +/qcom_icc_rpm_set +206 drivers/interconnect/qcom/icc-rpm.c

   205	
 > 206	int qcom_icc_rpm_set(int mas_rpm_id, int slv_rpm_id, u64 sum_bw)
   207	{
   208		int ret = 0;
   209	
   210		if (mas_rpm_id != -1) {
   211			ret = qcom_icc_rpm_smd_send(QCOM_SMD_RPM_ACTIVE_STATE,
   212						    RPM_BUS_MASTER_REQ,
   213						    mas_rpm_id,
   214						    sum_bw);
   215			if (ret) {
   216				pr_err("qcom_icc_rpm_smd_send mas %d error %d\n",
   217				       mas_rpm_id, ret);
   218				return ret;
   219			}
   220		}
   221	
   222		if (slv_rpm_id != -1) {
   223			ret = qcom_icc_rpm_smd_send(QCOM_SMD_RPM_ACTIVE_STATE,
   224						    RPM_BUS_SLAVE_REQ,
   225						    slv_rpm_id,
   226						    sum_bw);
   227			if (ret) {
   228				pr_err("qcom_icc_rpm_smd_send slv %d error %d\n",
   229				       slv_rpm_id, ret);
   230				return ret;
   231			}
   232		}
   233	
   234		return ret;
   235	}
   236	EXPORT_SYMBOL_GPL(qcom_icc_rpm_set);
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

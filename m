Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2609A4A11;
	Wed,  3 May 2023 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683126028; x=1714662028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tyiQTnIxa8bdwBCJ+TBh6oqAz+SAyj2893SjETgWMwU=;
  b=joMnRxO6Sj8Oq8GBeL1J1OAy0xUlo0mqEVXIt+Z5qY/b7WjPs2XQ6oWj
   uELG1tPMaR9uapD+msdnU154ZMMkvJKxQTlwc4uC4xqLdZKT4JF2tpuUi
   0hkt79qHndgb6UHADzB2ID2bPpJa3qg062JynnewV0pASmfaickFQHNS6
   HuO1FsMTK8tN88C8YlCBrNBdVnr65+NDjCdDMKhsYlw10OSsYbEhCP+7h
   miUTMFNCJaxSlr6D+WpP6F7rJBGtA62hIAx+yicnyTZ/bcvWYT0P5gHMy
   /mJj3xtq8pkc8xx2ACv/5AJ9bfvz4Cm1lDdT5bItV0WfyIUzaVSexokgF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="328301351"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="328301351"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 08:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="729366193"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="729366193"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 May 2023 08:00:25 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puDxr-00024Q-1w;
	Wed, 03 May 2023 15:00:19 +0000
Date: Wed, 3 May 2023 22:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 57/59]
 drivers/remoteproc/qcom_wcnss_iris.c:96:34: warning: unused variable
 'iris_of_match'
Message-ID: <202305032255.VxPBajjZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   8ef08ce8c4d8d4899b12a53891d5a5fa97d15f71
commit: e83eea32c6f9da3743beeb240da6fb3c75ee65f2 [57/59] Use of_device_get_match_data
config: arm64-randconfig-r011-20230501 (https://download.01.org/0day-ci/archive/20230503/202305032255.VxPBajjZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=e83eea32c6f9da3743beeb240da6fb3c75ee65f2
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout e83eea32c6f9da3743beeb240da6fb3c75ee65f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/remoteproc/ lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305032255.VxPBajjZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/qcom_wcnss_iris.c:96:34: warning: unused variable 'iris_of_match' [-Wunused-const-variable]
   static const struct of_device_id iris_of_match[] = {
                                    ^
   1 warning generated.


vim +/iris_of_match +96 drivers/remoteproc/qcom_wcnss_iris.c

aed361adca9ff1 Bjorn Andersson 2016-08-12   95  
1fcef985c8bdd5 Bjorn Andersson 2021-03-11  @96  static const struct of_device_id iris_of_match[] = {
1fcef985c8bdd5 Bjorn Andersson 2021-03-11   97  	{ .compatible = "qcom,wcn3620", .data = &wcn3620_data },
1fcef985c8bdd5 Bjorn Andersson 2021-03-11   98  	{ .compatible = "qcom,wcn3660", .data = &wcn3660_data },
1fcef985c8bdd5 Bjorn Andersson 2021-03-11   99  	{ .compatible = "qcom,wcn3660b", .data = &wcn3680_data },
1fcef985c8bdd5 Bjorn Andersson 2021-03-11  100  	{ .compatible = "qcom,wcn3680", .data = &wcn3680_data },
1fcef985c8bdd5 Bjorn Andersson 2021-03-11  101  	{}
1fcef985c8bdd5 Bjorn Andersson 2021-03-11  102  };
1fcef985c8bdd5 Bjorn Andersson 2021-03-11  103  

:::::: The code at line 96 was first introduced by commit
:::::: 1fcef985c8bdd542c43da0d87bd9d51980c3859b remoteproc: qcom: wcnss: Fix race with iris probe

:::::: TO: Bjorn Andersson <bjorn.andersson@linaro.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F0639;
	Wed, 12 Jul 2023 00:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689121951; x=1720657951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WAPj4RMR1UrT97Z8Sl+MsKNVUz7RZF9XY1eRji0I6CI=;
  b=IIk9yOswlCgaElkBX+DLjQdfSxFfoEjlmgbhykOPdUDj1SjmhmeDWsvf
   +zKVohvAUn2e1ZwB9NdivFgI/h0abe3M2y7zfVDXZyt9iz23KpEuHh1oP
   DHJM/oJ0N/VJN+wkoqafTOPpkytov9DvddDt2VfGcu8O+2YpWmJsS+rbV
   V/muMB8Knfb0FAwj3h8PbgYBsxM3K4G9zEvNqlw0IhdJLQxftopUH9Z6b
   ArCy3KlmIt6tzayZ/C1PI42z3HJ0IR1f9eQ6JU+OrhT91CTQ/ptNvcQaP
   viONRKWnYQ1He8TXsy5Hqzmc138CrKYjRdrJ+a6BRvwJO1Ie+OMMmexbE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="354672322"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="354672322"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 17:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="1051979953"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="1051979953"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jul 2023 17:32:28 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJNmN-0005Dr-1y;
	Wed, 12 Jul 2023 00:32:27 +0000
Date: Wed, 12 Jul 2023 08:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Nitheesh Sekar <quic_nsekar@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: drivers/pinctrl/qcom/pinctrl-ipq5018.c:244:27: warning: unused
 variable '_groups'
Message-ID: <202307120814.vWPY6URk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sricharan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f01e9fed8454dcd89727016c3e5b2fbb8f8e50c
commit: 725d1c8916583f9c09e5f05e5a55dd47fdca61c1 pinctrl: qcom: Add IPQ5018 pinctrl driver
date:   5 weeks ago
config: arm64-randconfig-r015-20230712 (https://download.01.org/0day-ci/archive/20230712/202307120814.vWPY6URk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120814.vWPY6URk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120814.vWPY6URk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/qcom/pinctrl-ipq5018.c:244:27: warning: unused variable '_groups' [-Wunused-const-variable]
   static const char * const _groups[] = {
                             ^
   1 warning generated.


vim +/_groups +244 drivers/pinctrl/qcom/pinctrl-ipq5018.c

   243	
 > 244	static const char * const _groups[] = {
   245		"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7",
   246		"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
   247		"gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21",
   248		"gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", "gpio28",
   249		"gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
   250		"gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", "gpio42",
   251		"gpio43", "gpio44", "gpio45", "gpio46",
   252	};
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

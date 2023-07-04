Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4667139A;
	Tue,  4 Jul 2023 02:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688438495; x=1719974495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yzaZaHeFj+MtIkZZG8c9b0aePx4PJL7zZMDi9ZMeGLk=;
  b=bmpSoRJw0uuSG8vZOIOTNNsAw3VEju+QAUXSkD1R0bNEtuoXLIBrQP0l
   xjE9Q1BQz8VKPLNNjRcfetEUfqnpea36D6MUfVQ0sBS3qGzgDZu9w3ZNB
   PT6uGzWA+z4lK3DQFtC6wLgT3d1GfkUciiDQ8kmnHzANRSA2uO8Ii1uaB
   LUVIpqHxIlOntEq6iZxVTh8/nZiESQ8GG4IInNEthQRUtdlcujqz5IpWj
   fQtHNvingtZFNqE9qV+7J4AD2yUtAaKNG+xTJ3cwMztzAHqWIG6LuSals
   F2Lix+X5IbxXqkxyAcbkmUulS4LNj3hgQqaSqo3LpRHYy6taiABrH6Lp8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="347803817"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="347803817"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 19:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="832005652"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="832005652"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2023 19:41:30 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGVyr-000HoP-31;
	Tue, 04 Jul 2023 02:41:29 +0000
Date: Tue, 4 Jul 2023 10:41:25 +0800
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
Message-ID: <202307041035.xpbEVRNs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24be4d0b46bb0c3c1dc7bacd30957d6144a70dfc
commit: 725d1c8916583f9c09e5f05e5a55dd47fdca61c1 pinctrl: qcom: Add IPQ5018 pinctrl driver
date:   4 weeks ago
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230704/202307041035.xpbEVRNs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041035.xpbEVRNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307041035.xpbEVRNs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/qcom/pinctrl-ipq5018.c:244:27: warning: unused variable '_groups' [-Wunused-const-variable]
     244 | static const char * const _groups[] = {
         |                           ^
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

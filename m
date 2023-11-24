Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04DD249E6;
	Fri, 24 Nov 2023 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEjoKDuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700836816; x=1732372816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Uxc0d4c4aiMUWgnl/99+3ExpFREygOtI/KFwWyU28A=;
  b=NEjoKDuVz8OZTiDpHL9s4ibHaaPW34onG3CILNKJwiIOUGt1fb8O1vqJ
   XMKBxAEy8DPjSX/qMQzUg7DvewjCW0r4b6sCInD57k68eeDaNLKLbk0e7
   I/Gr0yzzvfmKNuZJC1lRiQad5ryuEIXRRbeJ+F5oDw63fceT3obWYB2/w
   1nTLbc93CrYD7hhypEwTwYYRFN7dzRJVBV7r1ycvN4AEEh4FeOJW2yZ/d
   tLD7Ow4AJCjpTUklxulRFnZJIdFgsf73WmOtKe1hV+ajtQr4GT3pQKBBs
   3YQofo5uM0ivqlfZOie03YpycC4WBHr0Fe3+yn9o8vHm2fF8ugSR7VYCa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395249016"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="395249016"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:40:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="760975142"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="760975142"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 06:40:10 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6XLi-0002tp-2p;
	Fri, 24 Nov 2023 14:40:06 +0000
Date: Fri, 24 Nov 2023 22:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Add driver support for
 DWMAC5 fault IRQ Support
Message-ID: <202311241513.D6JpHWGg-lkp@intel.com>
References: <62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj@quicinc.com>

Hi Suraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Jaiswal/dt-bindings-net-qcom-ethqos-add-binding-doc-for-fault-IRQ-for-sa8775p/20231123-202252
base:   net-next/main
patch link:    https://lore.kernel.org/r/62eaaace3713751cb1ecac3163e857737107ca0e.1700737841.git.quic_jsuraj%40quicinc.com
patch subject: [PATCH net-next v3 3/3] net: stmmac: Add driver support for DWMAC5 fault IRQ Support
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231124/202311241513.D6JpHWGg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241513.D6JpHWGg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241513.D6JpHWGg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:693:5: warning: no previous prototype for function 'stmmac_get_fault_intr_config' [-Wmissing-prototypes]
   int stmmac_get_fault_intr_config(struct platform_device *pdev, struct stmmac_resources *res)
       ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:693:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int stmmac_get_fault_intr_config(struct platform_device *pdev, struct stmmac_resources *res)
   ^
   static 
   1 warning generated.


vim +/stmmac_get_fault_intr_config +693 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

   692	
 > 693	int stmmac_get_fault_intr_config(struct platform_device *pdev, struct stmmac_resources *res)
   694	{
   695		int ret = 0;
   696	
   697		res->safety_common_intr = platform_get_irq_byname(pdev, "safety");
   698	
   699		if (res->safety_common_intr < 0) {
   700			if (res->safety_common_intr != -EPROBE_DEFER)
   701				dev_err(&pdev->dev, "safety IRQ configuration information not found\n");
   702			ret = 1;
   703		}
   704	
   705		return ret;
   706	}
   707	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

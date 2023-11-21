Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377B954F93;
	Tue, 21 Nov 2023 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwZUGY0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700575490; x=1732111490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XZP4lfw1143zghvYLcKoFwr5cIz7iQ/mX6yCIhP2bbY=;
  b=ZwZUGY0qOre3tBdPJARwnpjvNy0aqeHgw85l6vOhrztPeW5Wt6FgVaQ6
   HDTVPXmJTfYlfRCA1YGGudR0LBc2L8mlCdk/BG8fKUvdcG5kytXvQZxZ/
   8Ns6spTH0o2ZSHQBWXn2TTHAbrVWFQpemsRFqbgrJwzZPH+YcguxyJBk+
   TeS0/es6AxB6xa9DtzD7Xhq/6ywq65+XQCPdzPEbrLX1Xl82K+NF3dZFN
   d5P2c2nLbHPnwWSUA4IrEO+utzpmbqASHClDiQhCK6NKMvgDiI4fVNxTx
   UXFFXwcvXiRKa1Y+TvHRGmluND9QcrUE3cJr4akH9/yuhFnmEnsezDrOu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="422939288"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="422939288"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 06:04:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="890261425"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="890261425"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Nov 2023 06:04:39 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5RMj-0007ta-09;
	Tue, 21 Nov 2023 14:04:37 +0000
Date: Tue, 21 Nov 2023 22:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
	ulf.hansson@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, agross@kernel.org,
	conor+dt@kernel.org, ayan.kumar.halder@amd.com, j@jannau.net,
	dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
	m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com,
	lpieralisi@kernel.org, quic_rjendra@quicinc.com,
	abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_tsoni@quicinc.com,
	neil.armstrong@linaro.org, Sibi Sankar <quic_sibis@quicinc.com>
Subject: Re: [PATCH V2 3/5] arm64: dts: qcom: Add base X1E80100 dtsi and the
 QCP dts
Message-ID: <202311212100.eIdoZhGN-lkp@intel.com>
References: <20231117113931.26660-4-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117113931.26660-4-quic_sibis@quicinc.com>

Hi Sibi,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.7-rc1]
[also build test ERROR on linus/master next-20231121]
[cannot apply to robh/for-next arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sibi-Sankar/dt-bindings-arm-cpus-Add-qcom-oryon-compatible/20231117-194253
base:   v6.7-rc1
patch link:    https://lore.kernel.org/r/20231117113931.26660-4-quic_sibis%40quicinc.com
patch subject: [PATCH V2 3/5] arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311212100.eIdoZhGN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311212100.eIdoZhGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311212100.eIdoZhGN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/x1e80100-qcp.dts:10:
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:7:10: fatal error: 'dt-bindings/clock/qcom,x1e80100-gcc.h' file not found
       7 | #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +7 arch/arm64/boot/dts/qcom/x1e80100.dtsi

   > 7	#include <dt-bindings/clock/qcom,x1e80100-gcc.h>
     8	#include <dt-bindings/dma/qcom-gpi.h>
     9	#include <dt-bindings/interconnect/qcom,icc.h>
    10	#include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
    11	#include <dt-bindings/interrupt-controller/arm-gic.h>
    12	#include <dt-bindings/power/qcom,rpmhpd.h>
    13	#include <dt-bindings/power/qcom-rpmpd.h>
    14	#include <dt-bindings/soc/qcom,rpmh-rsc.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

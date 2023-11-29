Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698FF1850;
	Wed, 29 Nov 2023 01:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbsWcUtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701220291; x=1732756291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Ztz3I+XcXE7EnPrEmSxi/fBX/uCg6GXn2cC6TYKYOg=;
  b=KbsWcUtPAwcYt04I+nfjdU/+Ip5Po/Fqp3K7LOvMMr0lgZlTQSIP0DTq
   8/qm7ssnWMeMeA3N5S67OgqKV0+fCuTGEfD1aDo5CwXQ3GtaPwwaIfRVI
   mTVCVYIobtxrSxAaCZRlmLiQm2pR3FbJLrfUy86I/aLXXPNybjjxsoLZf
   52rupxbG8Wc9pBepDQeyMxYj8DDwmBrCzJRSlx0x94AiN7llW87Q8sQgQ
   r9W2m+ZXmlPER5z7zU9ndKGJTGhR/VKF1srBbS+KNMWfuFVe0GhPNtpmr
   zHWEyyZ69lcODkrUE9Znlh8m1HNhfUE11l5oZp3LgGB+O52b/LZXxH/gI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="391929085"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="391929085"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:11:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="10171897"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Nov 2023 17:11:27 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r896q-0008Na-1G;
	Wed, 29 Nov 2023 01:11:24 +0000
Date: Wed, 29 Nov 2023 09:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jacky Huang <ychuang570808@gmail.com>, linus.walleij@linaro.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de, j.neuschaefer@gmx.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ychuang3@nuvoton.com, schung@nuvoton.com
Subject: Re: [PATCH v2 3/4] arm64: dts: nuvoton: Add pinctrl support for
 ma35d1
Message-ID: <202311290550.7HCXMJCy-lkp@intel.com>
References: <20231128061118.575847-4-ychuang570808@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128061118.575847-4-ychuang570808@gmail.com>

Hi Jacky,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next robh/for-next linus/master v6.7-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Huang/dt-bindings-reset-Add-syscon-to-nuvoton-ma35d1-system-management-node/20231128-141443
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20231128061118.575847-4-ychuang570808%40gmail.com
patch subject: [PATCH v2 3/4] arm64: dts: nuvoton: Add pinctrl support for ma35d1
config: arm64-randconfig-001-20231128 (https://download.01.org/0day-ci/archive/20231129/202311290550.7HCXMJCy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311290550.7HCXMJCy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311290550.7HCXMJCy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts:9:
>> arch/arm64/boot/dts/nuvoton/ma35d1.dtsi:13:10: fatal error: 'dt-bindings/pinctrl/ma35d1-pinfunc.h' file not found
      13 | #include <dt-bindings/pinctrl/ma35d1-pinfunc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +13 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi

  > 13	#include <dt-bindings/pinctrl/ma35d1-pinfunc.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

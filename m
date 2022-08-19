Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91504A05
	for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 18:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660934292; x=1692470292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iNZ8OTgrcP4HEsJvk4GqUiryuR+PawK94q78dSQ8mT8=;
  b=SvNDKSNwjm5nCz2W+JGW2DAwvnNV2ZYI52/hYWz57Dae6//UVdgSBqt9
   lMn2Nd8EwhGIE/vTBDe3M2OtGbnqDWsk+gCQJA/RLrHOnal0Ioc/eAP3h
   MiJx1V9otCeRh3+1gMIcc2kw0W4cBbigxR7jrLtCZHrG+AD+MYzXcbuP8
   YPUA9P4d3NQjlBM1BSWlMt/zRI21zwsAzgbtvSJMByJSllR/q+Ds9rRgx
   PQFj4Sdx0Y+arwiOeBTFiiBB16ALOKX/yZBpo3F2XVUBXbzUYjYm8AVrC
   6Prt79hMaqOs29P1vPSRNuG6raQ3gq3qTg7n9kWB0vwcsz9v7jiDcuaOa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="290643541"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="290643541"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 11:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="697645941"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2022 11:38:07 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oP6sg-0001ht-1W;
	Fri, 19 Aug 2022 18:38:06 +0000
Date: Sat, 20 Aug 2022 02:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: [PATCH net-next v1 7/7] ethtool: add interface to interact with
 Ethernet Power Equipment
Message-ID: <202208200202.pmwCMvZd-lkp@intel.com>
References: <20220819120109.3857571-8-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819120109.3857571-8-o.rempel@pengutronix.de>

Hi Oleksij,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/add-generic-PSE-support/20220819-200408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 268603d79cc48dba671e9caf108fab32315b86a2
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220820/202208200202.pmwCMvZd-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 0ac597f3cacf60479ffd36b03766fa7462dabd78)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ac5a14669dbe6cac4972ff01ea6291d12152e78f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oleksij-Rempel/add-generic-PSE-support/20220819-200408
        git checkout ac5a14669dbe6cac4972ff01ea6291d12152e78f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'net/ethtool/pse.o', needed by 'net/ethtool/built-in.a'.
   make[3]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C52B7B
	for <llvm@lists.linux.dev>; Sat, 18 Jun 2022 09:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655545759; x=1687081759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1OXQHD0LSLa+uiFYelC0N5daUwCWp9TjAq8t0jXAo+0=;
  b=Ib/z2BLDiba7jCl0GZ5Nr32DE1DzicD74UWRl1bKLB4p6cCjjEDe1Bac
   S/KrrQmG/OlBoGZtjdnefKf3mcQb9yE253lGpBSe8akolM0kcFNlLFE7r
   gMVAQhU44l4+nAWxG6hp7dmk/7X17JswQOYoLaqKjeXzLOZb/dultLpWy
   ToNyI4GkC5+qXiYUV1m8o3o1HlnNU93Qsm2KWJH6BZbG7/M1wcDc5jFIh
   so8PdoB2fxqqdUtPwd7nYi+NM5wHITGYxgI0ji11bHPgbhv2nQB5nwguX
   6tcGtmnazk4gt7ZxhelH/IQJWuvnuPXQECbAQzow17LJi75/rR8cHphIA
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="278417528"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="278417528"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2022 02:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="580578514"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Jun 2022 02:49:13 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2V4q-000QEB-Gw;
	Sat, 18 Jun 2022 09:49:12 +0000
Date: Sat, 18 Jun 2022 17:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Lemon <jonathan.lemon@gmail.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kernel-team@fb.com,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Lasse Johnsen <l@ssejohnsen.me>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH net-next v8 2/3] net: phy: broadcom: Add PTP support for
 some Broadcom PHYs.
Message-ID: <202206181756.RQjX7jiS-lkp@intel.com>
References: <20220616195218.217408-3-jonathan.lemon@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616195218.217408-3-jonathan.lemon@gmail.com>

Hi Jonathan,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Lemon/Broadcom-PTP-PHY-support/20220617-035307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 5dcb50c009c9f8ec1cfca6a81a05c0060a5bbf68
config: hexagon-randconfig-r016-20220617 (https://download.01.org/0day-ci/archive/20220618/202206181756.RQjX7jiS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 91688716ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8eadce9504aa8672818c2f8ebedb0a807a2608ac
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Lemon/Broadcom-PTP-PHY-support/20220617-035307
        git checkout 8eadce9504aa8672818c2f8ebedb0a807a2608ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ptp_cancel_worker_sync
   >>> referenced by bcm-phy-ptp.c:650 (drivers/net/phy/bcm-phy-ptp.c:650)
   >>> net/phy/bcm-phy-ptp.o:(bcm_ptp_stop) in archive drivers/built-in.a
   >>> referenced by bcm-phy-ptp.c:650 (drivers/net/phy/bcm-phy-ptp.c:650)
   >>> net/phy/bcm-phy-ptp.o:(bcm_ptp_stop) in archive drivers/built-in.a
   >>> referenced by bcm-phy-ptp.c:618 (drivers/net/phy/bcm-phy-ptp.c:618)
   >>> net/phy/bcm-phy-ptp.o:(bcm_ptp_hwtstamp) in archive drivers/built-in.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: ptp_clock_register
   >>> referenced by bcm-phy-ptp.c:706 (drivers/net/phy/bcm-phy-ptp.c:706)
   >>> net/phy/bcm-phy-ptp.o:(bcm_ptp_probe) in archive drivers/built-in.a
   >>> referenced by bcm-phy-ptp.c:706 (drivers/net/phy/bcm-phy-ptp.c:706)
   >>> net/phy/bcm-phy-ptp.o:(bcm_ptp_probe) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ptp_schedule_worker
   >>> referenced by bcm-phy-ptp.c:554 (drivers/net/phy/bcm-phy-ptp.c:554)
   >>> net/phy/bcm-phy-ptp.o:(bcm_ptp_txtstamp) in archive drivers/built-in.a
   >>> referenced by bcm-phy-ptp.c:554 (drivers/net/phy/bcm-phy-ptp.c:554)
   >>> net/phy/bcm-phy-ptp.o:(bcm_ptp_txtstamp) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ptp_clock_index
   >>> referenced by bcm-phy-ptp.c:631 (drivers/net/phy/bcm-phy-ptp.c:631)
   >>> net/phy/bcm-phy-ptp.o:(bcm_ptp_ts_info) in archive drivers/built-in.a
   >>> referenced by bcm-phy-ptp.c:631 (drivers/net/phy/bcm-phy-ptp.c:631)
   >>> net/phy/bcm-phy-ptp.o:(bcm_ptp_ts_info) in archive drivers/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BCM_NET_PHYPTP
   Depends on NETDEVICES && PHYLIB && PTP_1588_CLOCK_OPTIONAL
   Selected by
   - BROADCOM_PHY && NETDEVICES && PHYLIB && NETWORK_PHY_TIMESTAMPING

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

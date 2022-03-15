Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806DB110C
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 10:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647340288; x=1678876288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BKdKfUow0O5/kI9+9p24H9wMrL1nAtlaFqxWtERolQ4=;
  b=AtDisqW3dAXUL8la7WZlKULuQiA/euBqndeYcvv8z7NvD5smsR8MAv/K
   juZ6QDad54uxdd8w6wB3ztcMCDqgKhtqrVzfHCGi6gAj+K4g6U8NSaMT6
   5afoiMNDS7TW/Rd6ZaTKwdrpVDcfbt1iYTp19IUJouTX7bux0E8qT3SrO
   cD31GTW4Fjvkdwtxy/GogtGsW/Y37wI5ZbewKB05lHqvyYLvLDvv4x5Dl
   hsoABtTlwZZjYw9ERQTXhez1ZCqFudNOwxkPcWBW7vjkQSxAhET0ep9++
   2Ik1VzQK/9Xx+h/m/MjVNlK1XPUchFktNg3M/NVjOI/fysa1NiNjmnpdA
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256217852"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; 
   d="scan'208";a="256217852"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 03:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; 
   d="scan'208";a="497965885"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2022 03:31:25 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nU4Sb-000AqZ-1q; Tue, 15 Mar 2022 10:31:25 +0000
Date: Tue, 15 Mar 2022 18:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Raju Lakkaraju <Raju.Lakkaraju@microchip.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, davem@davemloft.net,
	kuba@kernel.org, UNGLinuxDriver@microchip.com,
	Ian.Saturley@microchip.com
Subject: Re: [PATCH net-next 4/5] net: lan743x: Add support for PTP-IO Event
 Input External Timestamp (extts)
Message-ID: <202203151830.yeCpaesp-lkp@intel.com>
References: <20220315061701.3006-5-Raju.Lakkaraju@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315061701.3006-5-Raju.Lakkaraju@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Raju,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Raju-Lakkaraju/net-lan743x-PCI11010-PCI11414-devices-Enhancements/20220315-141814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git bdd6a89de44b9e07d0b106076260d2367fe0e49a
config: i386-randconfig-a015-20220314 (https://download.01.org/0day-ci/archive/20220315/202203151830.yeCpaesp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/11e2990b814fce8f91e9aa9d11d9dc04869d6856
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Raju-Lakkaraju/net-lan743x-PCI11010-PCI11414-devices-Enhancements/20220315-141814
        git checkout 11e2990b814fce8f91e9aa9d11d9dc04869d6856
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/ethernet/microchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/microchip/lan743x_ptp.c:776:24: warning: variable 'extts' set but not used [-Wunused-but-set-variable]
           struct lan743x_extts *extts;
                                 ^
   1 warning generated.


vim +/extts +776 drivers/net/ethernet/microchip/lan743x_ptp.c

   769	
   770	static int lan743x_ptp_io_extts(struct lan743x_adapter *adapter, int on,
   771					struct ptp_extts_request *extts_request)
   772	{
   773		struct lan743x_ptp *ptp = &adapter->ptp;
   774		u32 flags = extts_request->flags;
   775		u32 index = extts_request->index;
 > 776		struct lan743x_extts *extts;
   777		int extts_pin;
   778		int ret = 0;
   779	
   780		extts = &ptp->extts[index];
   781	
   782		if (on) {
   783			extts_pin = ptp_find_pin(ptp->ptp_clock, PTP_PF_EXTTS, index);
   784			if (extts_pin < 0)
   785				return -EBUSY;
   786	
   787			ret = lan743x_ptp_io_event_cap_en(adapter, flags, index);
   788		} else {
   789			lan743x_ptp_io_extts_off(adapter, index);
   790		}
   791	
   792		return ret;
   793	}
   794	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

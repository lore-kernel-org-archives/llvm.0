Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD52622
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 01:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662687223; x=1694223223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cpfqbiN827DWASpI7Ob7nVNzGtLFeMV+/cQBnW0US6E=;
  b=lpp+5VsvqJBoZ7Pci3XsOxIUXY3TUsFO/ZFGizDI/ik2jRz2IQABbtKE
   US+0F8omvKi49/Po0EKjBt8Y8WvKg0DnPbOxn/pxSftpvcOhMnBebFN1i
   IycV4la2hT9JBZBfrCSgiDnr7N//rJuZ5CDRJnScH8hqOAGc1kU3ouo0Q
   oaG7pi2EDXe1HFUTTb8KvMwxwhDirusqXd3Zk5A/g+UxAqcpRuhzf9srP
   m+xdqwkO/AQ6bB5GSJu97HDyKtL4Ox4nr9Iii7ZQ9uW/BkmvzG806jcb8
   pxcsgy8cg7gDVM4LfLPXUFZJSLmQKxr3uWgUVo5LvnbSur/2dATO3jxkP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="284388699"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="284388699"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 18:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="757431079"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2022 18:33:40 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWStn-0000Y9-1U;
	Fri, 09 Sep 2022 01:33:39 +0000
Date: Fri, 9 Sep 2022 09:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: Olliver Schinagl <oliver@schinagl.nl>, netdev@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	inux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCH] phy: Add helpers for setting/clearing bits in paged
 registers
Message-ID: <202209090938.3xBYyNyf-lkp@intel.com>
References: <20220904225555.1994290-1-oliver@schinagl.nl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220904225555.1994290-1-oliver@schinagl.nl>

Hi Olliver,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc4 next-20220908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Olliver-Schinagl/phy-Add-helpers-for-setting-clearing-bits-in-paged-registers/20220905-070318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 7e18e42e4b280c85b76967a9106a13ca61c16179
config: arm64-randconfig-r016-20220907 (https://download.01.org/0day-ci/archive/20220909/202209090938.3xBYyNyf-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/342260cb7603ad567f4799836ad4ed390ccedf2a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Olliver-Schinagl/phy-Add-helpers-for-setting-clearing-bits-in-paged-registers/20220905-070318
        git checkout 342260cb7603ad567f4799836ad4ed390ccedf2a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/stmicro/stmmac/enh_desc.c:11:
   In file included from include/linux/stmmac.h:16:
   include/linux/phy.h:1275:9: error: call to undeclared function 'phy_modify_paged'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return phy_modify_paged(phydev, page, regnum, 0, val);
                  ^
   include/linux/phy.h:1275:9: note: did you mean 'phy_modify_changed'?
   include/linux/phy.h:1142:5: note: 'phy_modify_changed' declared here
   int phy_modify_changed(struct phy_device *phydev, u32 regnum, u16 mask,
       ^
   include/linux/phy.h:1288:9: error: call to undeclared function 'phy_modify_paged'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return phy_modify_paged(phydev, page, regnum, val, 0);
                  ^
   include/linux/phy.h:1447:5: error: conflicting types for 'phy_modify_paged'
   int phy_modify_paged(struct phy_device *phydev, int page, u32 regnum,
       ^
   include/linux/phy.h:1275:9: note: previous implicit declaration is here
           return phy_modify_paged(phydev, page, regnum, 0, val);
                  ^
   In file included from drivers/net/ethernet/stmicro/stmmac/enh_desc.c:13:
>> drivers/net/ethernet/stmicro/stmmac/descs_com.h:39:26: warning: implicit conversion from 'unsigned long' to '__u32' (aka 'unsigned int') changes value from 18446744073707454463 to 4292870143 [-Wconstant-conversion]
                   p->des0 &= cpu_to_le32(~ETDES0_END_RING);
                              ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
   #define cpu_to_le32 __cpu_to_le32
                       ^
   include/uapi/linux/byteorder/big_endian.h:34:53: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
                                             ~~~~~~~~~~^~~
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
           ~~~~~~~~~ ^
   In file included from drivers/net/ethernet/stmicro/stmmac/enh_desc.c:13:
   drivers/net/ethernet/stmicro/stmmac/descs_com.h:73:26: warning: implicit conversion from 'unsigned long' to '__u32' (aka 'unsigned int') changes value from 18446744073675997183 to 4261412863 [-Wconstant-conversion]
                   p->des1 &= cpu_to_le32(~TDES1_END_RING);
                              ~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
   #define cpu_to_le32 __cpu_to_le32
                       ^
   include/uapi/linux/byteorder/big_endian.h:34:53: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
                                             ~~~~~~~~~~^~~
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
           ~~~~~~~~~ ^
   2 warnings and 3 errors generated.
--
   In file included from drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:11:
   In file included from include/linux/stmmac.h:16:
   include/linux/phy.h:1275:9: error: call to undeclared function 'phy_modify_paged'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return phy_modify_paged(phydev, page, regnum, 0, val);
                  ^
   include/linux/phy.h:1275:9: note: did you mean 'phy_modify_changed'?
   include/linux/phy.h:1142:5: note: 'phy_modify_changed' declared here
   int phy_modify_changed(struct phy_device *phydev, u32 regnum, u16 mask,
       ^
   include/linux/phy.h:1288:9: error: call to undeclared function 'phy_modify_paged'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return phy_modify_paged(phydev, page, regnum, val, 0);
                  ^
   include/linux/phy.h:1447:5: error: conflicting types for 'phy_modify_paged'
   int phy_modify_paged(struct phy_device *phydev, int page, u32 regnum,
       ^
   include/linux/phy.h:1275:9: note: previous implicit declaration is here
           return phy_modify_paged(phydev, page, regnum, 0, val);
                  ^
>> drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:541:26: warning: implicit conversion from 'unsigned long' to '__u32' (aka 'unsigned int') changes value from 18446744073675997183 to 4261412863 [-Wconstant-conversion]
                   p->des3 &= cpu_to_le32(~RDES3_BUFFER2_VALID_ADDR);
                              ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
   #define cpu_to_le32 __cpu_to_le32
                       ^
   include/uapi/linux/byteorder/big_endian.h:34:53: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
                                             ~~~~~~~~~~^~~
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
           __fswab32(x))
           ~~~~~~~~~ ^
   1 warning and 3 errors generated.


vim +39 drivers/net/ethernet/stmicro/stmmac/descs_com.h

286a837217204b Giuseppe CAVALLARO 2011-10-18  33  
293e4365a1adb1 Giuseppe Cavallaro 2016-02-29  34  static inline void enh_desc_end_tx_desc_on_ring(struct dma_desc *p, int end)
286a837217204b Giuseppe CAVALLARO 2011-10-18  35  {
293e4365a1adb1 Giuseppe Cavallaro 2016-02-29  36  	if (end)
f8be0d78be6e7f Michael Weiser     2016-11-14  37  		p->des0 |= cpu_to_le32(ETDES0_END_RING);
293e4365a1adb1 Giuseppe Cavallaro 2016-02-29  38  	else
f8be0d78be6e7f Michael Weiser     2016-11-14 @39  		p->des0 &= cpu_to_le32(~ETDES0_END_RING);
286a837217204b Giuseppe CAVALLARO 2011-10-18  40  }
286a837217204b Giuseppe CAVALLARO 2011-10-18  41  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

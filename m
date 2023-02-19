Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42342F2E;
	Sun, 19 Feb 2023 18:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676832524; x=1708368524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7/PzdycqBv5/IMG7ol73HHUSJLtlZRgbpENHRWBCIgY=;
  b=POCk1SXpkTysyd0ONcRYlkvWv+dgU3FQ9JWK1jmQTWdoyOAyWC5SCC8y
   cjY6vTSOJRPeo2IahbgWeviR+rETk41JmMw9lON3jFUT5JDQ0w3t2QYR+
   znHdhsnkJoMiJPLGoX0ozx4JNGOq3T1N9lvDzD5mwbS+lSQIalE6yySef
   I4kSgG5oa51tWgq0nxde92qWkPIiTXp+puS0Hq1EH+MZASVIelleOWgO3
   CIA9ug8sJCgjHeL/Bac0ijoweJOig0FVv26/YLqfZtkngIWECYvZDxXaJ
   NE8T35s3QSOmPfbfyUQUaZcjimCKOPetdi3llc93fK0mb0ezeX+DQercN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="312642306"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="312642306"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 10:48:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="648620705"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="648620705"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Feb 2023 10:48:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTojp-000DPn-1e;
	Sun, 19 Feb 2023 18:48:41 +0000
Date: Mon, 20 Feb 2023 02:47:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:atcphy-20230219 52/54]
 drivers/phy/apple/atc-display-crossbar.c:127:4: error: call to undeclared
 function 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202302200216.iIsNDudV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux atcphy-20230219
head:   9928386c36c8def0becc6ce2db8f18f2111f9b3c
commit: aec02a74177421dde96d55515aef500059d6f8ab [52/54] phy: apple: Add display crossbar
config: hexagon-buildonly-randconfig-r003-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200216.iIsNDudV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/aec02a74177421dde96d55515aef500059d6f8ab
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux atcphy-20230219
        git checkout aec02a74177421dde96d55515aef500059d6f8ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/phy/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200216.iIsNDudV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/phy/apple/atc-display-crossbar.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/phy/apple/atc-display-crossbar.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/phy/apple/atc-display-crossbar.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/phy/apple/atc-display-crossbar.c:127:4: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           FIELD_PREP(CROSSBAR_MUX_CTRL_DPPHY_SELECT0, mux_state) |
                           ^
   6 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TYPEC
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - PHY_APPLE_ATC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])


vim +/FIELD_PREP +127 drivers/phy/apple/atc-display-crossbar.c

    93	
    94	static int apple_dpxbar_set(struct mux_control *mux, int state)
    95	{
    96		struct apple_dpxbar *dpxbar = mux_chip_priv(mux->chip);
    97		unsigned int index = mux_control_get_index(mux);
    98		unsigned long flags;
    99		unsigned int mux_state;
   100		unsigned int dispext_bit;
   101		unsigned int atc_bit;
   102		bool enable;
   103		int ret = 0;
   104		u32 mux_mask, mux_set;
   105	
   106		if (state == MUX_IDLE_DISCONNECT) {
   107			/*
   108			 * Technically this will select dispext0,0 in the mux control
   109			 * register. Practically that doesn't matter since everything
   110			 * else is disabled.
   111			 */
   112			mux_state = 0;
   113			enable = false;
   114		} else if (state >= 0 && state < 9) {
   115			dispext_bit = 1 << state;
   116			mux_state = state;
   117			enable = true;
   118		} else {
   119			return -EINVAL;
   120		}
   121	
   122		switch (index) {
   123		case MUX_DPPHY:
   124			mux_mask = CROSSBAR_MUX_CTRL_DPPHY_SELECT0 |
   125				   CROSSBAR_MUX_CTRL_DPPHY_SELECT1;
   126			mux_set =
 > 127				FIELD_PREP(CROSSBAR_MUX_CTRL_DPPHY_SELECT0, mux_state) |
   128				FIELD_PREP(CROSSBAR_MUX_CTRL_DPPHY_SELECT1, mux_state);
   129			atc_bit = ATC_DPPHY;
   130			break;
   131		case MUX_DPIN0:
   132			mux_mask = CROSSBAR_MUX_CTRL_DPIN0_SELECT0 |
   133				   CROSSBAR_MUX_CTRL_DPIN0_SELECT1;
   134			mux_set =
   135				FIELD_PREP(CROSSBAR_MUX_CTRL_DPIN0_SELECT0, mux_state) |
   136				FIELD_PREP(CROSSBAR_MUX_CTRL_DPIN0_SELECT1, mux_state);
   137			atc_bit = ATC_DPIN0;
   138			break;
   139		case MUX_DPIN1:
   140			mux_mask = CROSSBAR_MUX_CTRL_DPIN1_SELECT0 |
   141				   CROSSBAR_MUX_CTRL_DPIN1_SELECT1;
   142			mux_set =
   143				FIELD_PREP(CROSSBAR_MUX_CTRL_DPIN1_SELECT0, mux_state) |
   144				FIELD_PREP(CROSSBAR_MUX_CTRL_DPIN1_SELECT1, mux_state);
   145			atc_bit = ATC_DPIN1;
   146			break;
   147		default:
   148			return -EINVAL;
   149		}
   150	
   151		spin_lock_irqsave(&dpxbar->lock, flags);
   152	
   153		/* ensure the selected dispext isn't already used in this crossbar */
   154		if (enable) {
   155			for (int i = 0; i < MUX_MAX; ++i) {
   156				if (i == index)
   157					continue;
   158				if (dpxbar->selected_dispext[i] == state) {
   159					spin_unlock_irqrestore(&dpxbar->lock, flags);
   160					return -EBUSY;
   161				}
   162			}
   163		}
   164	
   165		dpxbar_set32(dpxbar, OUT_N_CLK_EN, atc_bit);
   166		dpxbar_clear32(dpxbar, OUT_UNK_EN, atc_bit);
   167		dpxbar_clear32(dpxbar, OUT_PCLK1_EN, atc_bit);
   168		dpxbar_clear32(dpxbar, CROSSBAR_ATC_EN, atc_bit);
   169	
   170		if (dpxbar->selected_dispext[index] >= 0) {
   171			u32 prev_dispext_bit = 1 << dpxbar->selected_dispext[index];
   172	
   173			dpxbar_set32(dpxbar, FIFO_WR_N_CLK_EN, prev_dispext_bit);
   174			dpxbar_set32(dpxbar, FIFO_RD_N_CLK_EN, prev_dispext_bit);
   175			dpxbar_clear32(dpxbar, FIFO_WR_UNK_EN, prev_dispext_bit);
   176			dpxbar_clear32(dpxbar, FIFO_RD_UNK_EN, prev_dispext_bit);
   177			dpxbar_clear32(dpxbar, FIFO_WR_DPTX_CLK_EN, prev_dispext_bit);
   178			dpxbar_clear32(dpxbar, FIFO_RD_PCLK1_EN, prev_dispext_bit);
   179			dpxbar_clear32(dpxbar, CROSSBAR_DISPEXT_EN, prev_dispext_bit);
   180	
   181			dpxbar->selected_dispext[index] = -1;
   182		}
   183	
   184		dpxbar_mask32(dpxbar, CROSSBAR_MUX_CTRL, mux_mask, mux_set);
   185	
   186		if (enable) {
   187			dpxbar_clear32(dpxbar, FIFO_WR_N_CLK_EN, dispext_bit);
   188			dpxbar_clear32(dpxbar, FIFO_RD_N_CLK_EN, dispext_bit);
   189			dpxbar_clear32(dpxbar, OUT_N_CLK_EN, atc_bit);
   190			dpxbar_set32(dpxbar, FIFO_WR_UNK_EN, dispext_bit);
   191			dpxbar_set32(dpxbar, FIFO_RD_UNK_EN, dispext_bit);
   192			dpxbar_set32(dpxbar, OUT_UNK_EN, atc_bit);
   193			dpxbar_set32(dpxbar, FIFO_WR_DPTX_CLK_EN, dispext_bit);
   194			dpxbar_set32(dpxbar, FIFO_RD_PCLK1_EN, dispext_bit);
   195			dpxbar_set32(dpxbar, OUT_PCLK1_EN, atc_bit);
   196			dpxbar_set32(dpxbar, CROSSBAR_ATC_EN, atc_bit);
   197			dpxbar_set32(dpxbar, CROSSBAR_DISPEXT_EN, dispext_bit);
   198	
   199			/*
   200			 * This workaround was observed by tracing XNU's memory access
   201			 * and seems to work around some HW quirk:
   202			 * Without toggling the RD_PCLK enable here the connection
   203			 * doesn't come up. Testing has shown that a delay of about
   204			 * 5 usec is required which is doubled here to be on the
   205			 * safe side.
   206			 */
   207			dpxbar_clear32(dpxbar, FIFO_RD_PCLK1_EN, dispext_bit);
   208			udelay(10);
   209			dpxbar_set32(dpxbar, FIFO_RD_PCLK1_EN, dispext_bit);
   210	
   211			dpxbar->selected_dispext[index] = state;
   212		}
   213	
   214		spin_unlock_irqrestore(&dpxbar->lock, flags);
   215	
   216		if (enable)
   217			dev_err(dpxbar->dev, "Switched %s to dispext%u,%u\n",
   218				apple_dpxbar_names[index], mux_state >> 1,
   219				mux_state & 1);
   220		else
   221			dev_err(dpxbar->dev, "Switched %s to disconnected state\n",
   222				apple_dpxbar_names[index]);
   223	
   224		return ret;
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

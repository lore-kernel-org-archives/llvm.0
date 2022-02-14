Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08D1A35
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 19:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644865338; x=1676401338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7D1GO4YJHOIRP96aOncYfWj1zSTB7tfZJ+Mw8NP2NSo=;
  b=WIV8vgtCIoEwXzDhsH8fSunfidqhYHNRhJCcYlpEzSeotJNWKDxq+QxM
   g+HC5znciWvk3K4C0G8UVXJpjao40A+yRCpAlnRFhiBs48pSxoKNXKExH
   v5JuYnx/b6QY406aVDRJrUmvRhCvowMlfepqhjkY5htlMZbwS7Xlf4YFF
   /1B51avK5GH0qfUUA7aO7dR7BA1lixHcrShP/Ie8Yyxv6orGKljGHynAF
   FMKR5fd+EhCoIl0Bda0nYWEhjp6xhtHdi+d0GwJn+zuVQHZCt5F3fCXBN
   yiaCTC59ikNsQUYhS8FpdPR5Af7lSB+iVo8N/dwPfYUY+nYOMD/ZzyLVs
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="247757371"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="247757371"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 11:02:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="495930947"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Feb 2022 11:02:16 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJgc3-0008qU-Hk; Mon, 14 Feb 2022 19:02:15 +0000
Date: Tue, 15 Feb 2022 03:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [nbd168-wireless:mtk-flow-offload 9/9]
 drivers/net/wireless/mediatek/mt76/dma.c:145:17: warning: variable 'ring'
 set but not used
Message-ID: <202202150257.O7iGQocg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/nbd168/wireless mtk-flow-offload
head:   6dbc6b1e07e9f4face597784cf4069cff9f3a043
commit: 6dbc6b1e07e9f4face597784cf4069cff9f3a043 [9/9] mt76: mt7915: add Wireless Ethernet Dispatch support
config: x86_64-randconfig-a005-20220214 (https://download.01.org/0day-ci/archive/20220215/202202150257.O7iGQocg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/nbd168/wireless/commit/6dbc6b1e07e9f4face597784cf4069cff9f3a043
        git remote add nbd168-wireless https://github.com/nbd168/wireless
        git fetch --no-tags nbd168-wireless mtk-flow-offload
        git checkout 6dbc6b1e07e9f4face597784cf4069cff9f3a043
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/wireless/mediatek/mt76/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/dma.c:145:17: warning: variable 'ring' set but not used [-Wunused-but-set-variable]
           int ret, type, ring;
                          ^
>> drivers/net/wireless/mediatek/mt76/dma.c:165:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case MT76_WED_Q_TXFREE:
                ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.c:182:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/net/wireless/mediatek/mt76/dma.c:158:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case MT76_WED_Q_TX:
                ^~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.c:182:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/net/wireless/mediatek/mt76/dma.c:145:9: note: initialize the variable 'ret' to silence this warning
           int ret, type, ring;
                  ^
                   = 0
   3 warnings generated.


vim +/ring +145 drivers/net/wireless/mediatek/mt76/dma.c

   140	
   141	static int
   142	mt76_dma_wed_setup(struct mt76_dev *dev, struct mt76_queue *q)
   143	{
   144		struct mtk_wed_device *wed = &dev->mmio.wed;
 > 145		int ret, type, ring;
   146		u8 flags = q->flags;
   147	
   148		if (!mtk_wed_device_active(wed))
   149			q->flags &= ~MT_QFLAG_WED;
   150	
   151		if (!(q->flags & MT_QFLAG_WED))
   152			return 0;
   153	
   154		type = FIELD_GET(MT_QFLAG_WED_TYPE, q->flags);
   155		ring = FIELD_GET(MT_QFLAG_WED_RING, q->flags);
   156	
   157		switch (type) {
   158		case MT76_WED_Q_TX:
   159	#ifdef CONFIG_NET_MEDIATEK_SOC_WED
   160			ret = mtk_wed_device_tx_ring_setup(wed, ring, q->regs);
   161			if (!ret)
   162				q->wed_regs = wed->tx_ring[ring].reg_base;
   163	#endif
   164			break;
 > 165		case MT76_WED_Q_TXFREE:
   166			/* WED txfree queue needs ring to be initialized before setup */
   167			q->flags = 0;
   168			mt76_dma_queue_reset(dev, q);
   169			mt76_dma_rx_fill(dev, q);
   170			q->flags = flags;
   171	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

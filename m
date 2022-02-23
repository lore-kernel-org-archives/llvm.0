Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E68EBD
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 17:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645636167; x=1677172167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vRdsv3Fy6NbuApbaB3ggHyhSGJ4vHsHhQh9jBEiyj/U=;
  b=IQzsuUXF/fMYR7yotfh3ckQSHtpXGqan3xp4Hnr810zgzTh9iZRwJgow
   m89m0SPf+2RIppKW2j6MyniNd4lYgZY90BlCC5QPF9UESVAKvOoH9o0+t
   993Cx/R/kK0r1TYPUtpJbO1r+lm+4hNbjn2aSgduHTKGNVnuCF0gvoxZ9
   jmcVQJSGgRfkURQvYyv8ub1h5PBCEA5uUMmh+o1f1YR9/OmSPSMD9snyE
   Hjz0ouG97xRdx4xuioQm3EGfl2PkF5NaaTQKiz8uWiFHdrNfxQtInD2jE
   /Cl2HV9FdY66zzZs717r4xnrWU8fwHiwa/0o1dWHhvkpod5tBr/pNC+zM
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="250853803"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="250853803"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 09:03:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="548344664"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Feb 2022 09:03:40 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMv3D-0001dl-Go; Wed, 23 Feb 2022 17:03:39 +0000
Date: Thu, 24 Feb 2022 01:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1583/2340]
 drivers/net/ieee802154/ca8210.c:1782:4: error: implicit declaration of
 function 'dev_kfree_skb_any'
Message-ID: <202202240010.CSrNf18k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   97c5eeb4de3ad324ed2a4656b46465299cfd010a
commit: ea46cc7b8232972f12361f456922beddc7ab3d14 [1583/2340] headers/deps: networking/headers: Remove the <linux/netdevice_api.h> inclusion from <linux/netdevice.h>
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220224/202202240010.CSrNf18k-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=ea46cc7b8232972f12361f456922beddc7ab3d14
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout ea46cc7b8232972f12361f456922beddc7ab3d14
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/dsa/ drivers/net/ieee802154/ net/dsa/ net/smc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the mingo-tip/sched/headers HEAD 97c5eeb4de3ad324ed2a4656b46465299cfd010a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/net/ieee802154/ca8210.c:1782:4: error: implicit declaration of function 'dev_kfree_skb_any' [-Werror,-Wimplicit-function-declaration]
                           dev_kfree_skb_any(priv->tx_skb);
                           ^
   1 error generated.


vim +/dev_kfree_skb_any +1782 drivers/net/ieee802154/ca8210.c

ded845a781a578 Harry Morris  2017-03-28  1745  
ded845a781a578 Harry Morris  2017-03-28  1746  /**
ded845a781a578 Harry Morris  2017-03-28  1747   * ca8210_async_xmit_complete() - Called to announce that an asynchronous
ded845a781a578 Harry Morris  2017-03-28  1748   *                                transmission has finished
ded845a781a578 Harry Morris  2017-03-28  1749   * @hw:          ieee802154_hw of ca8210 that has finished exchange
ded845a781a578 Harry Morris  2017-03-28  1750   * @msduhandle:  Identifier of transmission that has completed
ded845a781a578 Harry Morris  2017-03-28  1751   * @status:      Returned 802.15.4 status code of the transmission
ded845a781a578 Harry Morris  2017-03-28  1752   *
ded845a781a578 Harry Morris  2017-03-28  1753   * Return: 0 or linux error code
ded845a781a578 Harry Morris  2017-03-28  1754   */
ded845a781a578 Harry Morris  2017-03-28  1755  static int ca8210_async_xmit_complete(
ded845a781a578 Harry Morris  2017-03-28  1756  	struct ieee802154_hw  *hw,
ded845a781a578 Harry Morris  2017-03-28  1757  	u8                     msduhandle,
ded845a781a578 Harry Morris  2017-03-28  1758  	u8                     status)
ded845a781a578 Harry Morris  2017-03-28  1759  {
ded845a781a578 Harry Morris  2017-03-28  1760  	struct ca8210_priv *priv = hw->priv;
ded845a781a578 Harry Morris  2017-03-28  1761  
ded845a781a578 Harry Morris  2017-03-28  1762  	if (priv->nextmsduhandle != msduhandle) {
ded845a781a578 Harry Morris  2017-03-28  1763  		dev_err(
ded845a781a578 Harry Morris  2017-03-28  1764  			&priv->spi->dev,
ded845a781a578 Harry Morris  2017-03-28  1765  			"Unexpected msdu_handle on data confirm, Expected %d, got %d\n",
ded845a781a578 Harry Morris  2017-03-28  1766  			priv->nextmsduhandle,
ded845a781a578 Harry Morris  2017-03-28  1767  			msduhandle
ded845a781a578 Harry Morris  2017-03-28  1768  		);
ded845a781a578 Harry Morris  2017-03-28  1769  		return -EIO;
ded845a781a578 Harry Morris  2017-03-28  1770  	}
ded845a781a578 Harry Morris  2017-03-28  1771  
ded845a781a578 Harry Morris  2017-03-28  1772  	priv->async_tx_pending = false;
ded845a781a578 Harry Morris  2017-03-28  1773  	priv->nextmsduhandle++;
ded845a781a578 Harry Morris  2017-03-28  1774  
ded845a781a578 Harry Morris  2017-03-28  1775  	if (status) {
ded845a781a578 Harry Morris  2017-03-28  1776  		dev_err(
ded845a781a578 Harry Morris  2017-03-28  1777  			&priv->spi->dev,
ded845a781a578 Harry Morris  2017-03-28  1778  			"Link transmission unsuccessful, status = %d\n",
ded845a781a578 Harry Morris  2017-03-28  1779  			status
ded845a781a578 Harry Morris  2017-03-28  1780  		);
ded845a781a578 Harry Morris  2017-03-28  1781  		if (status != MAC_TRANSACTION_OVERFLOW) {
621b24b09eb61c Miquel Raynal 2022-01-25 @1782  			dev_kfree_skb_any(priv->tx_skb);
ded845a781a578 Harry Morris  2017-03-28  1783  			ieee802154_wake_queue(priv->hw);
ded845a781a578 Harry Morris  2017-03-28  1784  			return 0;
ded845a781a578 Harry Morris  2017-03-28  1785  		}
ded845a781a578 Harry Morris  2017-03-28  1786  	}
ded845a781a578 Harry Morris  2017-03-28  1787  	ieee802154_xmit_complete(priv->hw, priv->tx_skb, true);
ded845a781a578 Harry Morris  2017-03-28  1788  
ded845a781a578 Harry Morris  2017-03-28  1789  	return 0;
ded845a781a578 Harry Morris  2017-03-28  1790  }
ded845a781a578 Harry Morris  2017-03-28  1791  

:::::: The code at line 1782 was first introduced by commit
:::::: 621b24b09eb61c63f262da0c9c5f0e93348897e5 net: ieee802154: ca8210: Stop leaking skb's

:::::: TO: Miquel Raynal <miquel.raynal@bootlin.com>
:::::: CC: Stefan Schmidt <stefan@datenfreihafen.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

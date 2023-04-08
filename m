Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AB37E3;
	Sat,  8 Apr 2023 00:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680912735; x=1712448735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wh3MYgls2fE6uDrvLEqQ7Hffs54o7AvAfj8b5Y3whPs=;
  b=PcQVZ39B7pLXfM2dI5pETv9PLMMqGMlianJ5psSHtf0icMe0qwtH7I4I
   95yvd3eJ/ByQauHcY1m4/CtYRpbuIBeDC0MJw8+SqSrhv0ikXaysnnd4G
   g2N9yGwLbAmX6Mij83O4uvjXTcUyeu+JTarjLCFEh0xKnYfZL+n8PqtnG
   ZNtbE/xtXU5ULJmQCUa0CiQO/kDL+uZmvWGpy/Tl5xwQF1Hzn09vqmbQ2
   uPeXFMcPLrF8uNCfqf8Q3GUF3tX39QPG06cnrLlET/cQFlHKRb14+mWZV
   IM6CUSruquMA1qHMAN/AdK5dDbgyOwooUKUKvp3X+bKX0+Xn13t8u8IkE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="344869605"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="344869605"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 17:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="687669998"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="687669998"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Apr 2023 17:12:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkwBg-000T2L-39;
	Sat, 08 Apr 2023 00:12:12 +0000
Date: Sat, 8 Apr 2023 08:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-bluetooth@vger.kernel.org
Subject: [bluetooth:master 1/10] net/bluetooth/hci_conn.c:1202:7: warning:
 variable 'params' is uninitialized when used here
Message-ID: <202304080849.qKBeBzNR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
head:   501455403627300b45e33d41e0730f862618449b
commit: 8d16a274706c7c3156f84b6e950a1b3736cc9506 [1/10] Bluetooth: hci_conn: Fix not cleaning up on LE Connection failure
config: hexagon-buildonly-randconfig-r006-20230404 (https://download.01.org/0day-ci/archive/20230408/202304080849.qKBeBzNR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git/commit/?id=8d16a274706c7c3156f84b6e950a1b3736cc9506
        git remote add bluetooth https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git
        git fetch --no-tags bluetooth master
        git checkout 8d16a274706c7c3156f84b6e950a1b3736cc9506
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080849.qKBeBzNR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/bluetooth/hci_conn.c:30:
   In file included from include/net/bluetooth/bluetooth.h:29:
   In file included from include/net/sock.h:38:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
   In file included from net/bluetooth/hci_conn.c:30:
   In file included from include/net/bluetooth/bluetooth.h:29:
   In file included from include/net/sock.h:38:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from net/bluetooth/hci_conn.c:30:
   In file included from include/net/bluetooth/bluetooth.h:29:
   In file included from include/net/sock.h:38:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
>> net/bluetooth/hci_conn.c:1202:7: warning: variable 'params' is uninitialized when used here [-Wuninitialized]
               (params && params->explicit_connect))
                ^~~~~~
   net/bluetooth/hci_conn.c:1191:32: note: initialize the variable 'params' to silence this warning
           struct hci_conn_params *params;
                                         ^
                                          = NULL
   7 warnings generated.


vim +/params +1202 net/bluetooth/hci_conn.c

^1da177e4c3f41 Linus Torvalds         2005-04-16  1186  
9bb3c01fdb2201 Andre Guedes           2014-01-30  1187  /* This function requires the caller holds hdev->lock */
9b3628d79b46f0 Luiz Augusto von Dentz 2022-04-22  1188  static void hci_le_conn_failed(struct hci_conn *conn, u8 status)
9bb3c01fdb2201 Andre Guedes           2014-01-30  1189  {
9bb3c01fdb2201 Andre Guedes           2014-01-30  1190  	struct hci_dev *hdev = conn->hdev;
f161dd4122ffa7 Johan Hedberg          2014-08-15  1191  	struct hci_conn_params *params;
f161dd4122ffa7 Johan Hedberg          2014-08-15  1192  
8d16a274706c7c Luiz Augusto von Dentz 2023-03-24  1193  	hci_connect_le_scan_cleanup(conn);
9bb3c01fdb2201 Andre Guedes           2014-01-30  1194  
acb9f911ea1f82 Johan Hedberg          2015-12-03  1195  	/* If the status indicates successful cancellation of
91641b79e1e153 Zheng Yongjun          2021-06-02  1196  	 * the attempt (i.e. Unknown Connection Id) there's no point of
acb9f911ea1f82 Johan Hedberg          2015-12-03  1197  	 * notifying failure since we'll go back to keep trying to
acb9f911ea1f82 Johan Hedberg          2015-12-03  1198  	 * connect. The only exception is explicit connect requests
acb9f911ea1f82 Johan Hedberg          2015-12-03  1199  	 * where a timeout + cancel does indicate an actual failure.
acb9f911ea1f82 Johan Hedberg          2015-12-03  1200  	 */
acb9f911ea1f82 Johan Hedberg          2015-12-03  1201  	if (status != HCI_ERROR_UNKNOWN_CONN_ID ||
acb9f911ea1f82 Johan Hedberg          2015-12-03 @1202  	    (params && params->explicit_connect))
acb9f911ea1f82 Johan Hedberg          2015-12-03  1203  		mgmt_connect_failed(hdev, &conn->dst, conn->type,
acb9f911ea1f82 Johan Hedberg          2015-12-03  1204  				    conn->dst_type, status);
9bb3c01fdb2201 Andre Guedes           2014-01-30  1205  
abfeea476c68af Luiz Augusto von Dentz 2021-10-27  1206  	/* Enable advertising in case this was a failed connection
3c857757ef6e5a Johan Hedberg          2014-03-25  1207  	 * attempt as a peripheral.
3c857757ef6e5a Johan Hedberg          2014-03-25  1208  	 */
abfeea476c68af Luiz Augusto von Dentz 2021-10-27  1209  	hci_enable_advertising(hdev);
9bb3c01fdb2201 Andre Guedes           2014-01-30  1210  }
9bb3c01fdb2201 Andre Guedes           2014-01-30  1211  

:::::: The code at line 1202 was first introduced by commit
:::::: acb9f911ea1f828822001d72b21f7cc06e6718c7 Bluetooth: Don't treat connection timeout as a failure

:::::: TO: Johan Hedberg <johan.hedberg@intel.com>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

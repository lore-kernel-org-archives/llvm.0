Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336F7173
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 16:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643042701; x=1674578701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aM9YJcSBXC3yFsRIAO+XebEgJNs0dEaVhB0zbDtZ3xQ=;
  b=htuVKGBmdDBB1FW9PTRnnk+UaidyJUFnheeppiCxE6/MKzu2LKL5su/3
   mf/kM/PdJi/tlS+yLS2oNq2SjlHFrJkAanXbXTOkQ6pNyX6qkQsFis1MY
   WCOHCoIG46Qvnf7Ya0VdQv80ZpUl4WdGI/sPBFpm4sQPK39DtJlx6QAPo
   TChSO5XsPYhYF0+Va4RElKOaCjqKGAnXOnm341fg3VNVTsp1YouPQJNNu
   0kTQPeXb+BITrVQ9UpAAtaO8FEmojTE6dq2+N+i6mInuPwXO6LvETHoMj
   lBEPBFnVQGTj4SLwGHmNUIVXK7Oa6lkrEXU18U4bI/E3KbbGcuVWPi5cz
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="306803366"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="306803366"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 08:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="627562188"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Jan 2022 08:44:56 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nC2Sd-000Icf-Q6; Mon, 24 Jan 2022 16:44:55 +0000
Date: Tue, 25 Jan 2022 00:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ronak Vijay Raheja <rraheja@codeaurora.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Jack Pham <jackp@codeaurora.org>,
	Eddie Hung <eddie.hung@mediatek.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10
 2301/9999] drivers/usb/gadget/configfs.c:1620:2: error: implicit declaration
 of function 'acc_disconnect'
Message-ID: <202201250013.vOmQcvaI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Ronak,

FYI, the error/warning still remains.

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.10
head:   eb69f26fe8e2177cfb7cbf859a23fc5ac59cacb7
commit: 80fef39de7e9dbe706d0cbc820a09b5c05dc366f [2301/9999] ANDROID: usb: gadget: Resolve NULL pointer dereference in composite_disconnect
config: arm64-randconfig-r021-20220120 (https://download.01.org/0day-ci/archive/20220125/202201250013.vOmQcvaI-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/80fef39de7e9dbe706d0cbc820a09b5c05dc366f
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.10
        git checkout 80fef39de7e9dbe706d0cbc820a09b5c05dc366f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/usb/gadget/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/configfs.c:1620:2: error: implicit declaration of function 'acc_disconnect' [-Werror,-Wimplicit-function-declaration]
           acc_disconnect();
           ^
   1 error generated.


vim +/acc_disconnect +1620 drivers/usb/gadget/configfs.c

  1603	
  1604	static void configfs_composite_disconnect(struct usb_gadget *gadget)
  1605	{
  1606		struct usb_composite_dev *cdev;
  1607		struct gadget_info *gi;
  1608		unsigned long flags;
  1609	
  1610		cdev = get_gadget_data(gadget);
  1611		if (!cdev)
  1612			return;
  1613	
  1614	#ifdef CONFIG_USB_CONFIGFS_F_ACC
  1615		/*
  1616		 * accessory HID support can be active while the
  1617		 * accessory function is not actually enabled,
  1618		 * so we need to inform it when we are disconnected.
  1619		 */
> 1620		acc_disconnect();
  1621	#endif
  1622		gi = container_of(cdev, struct gadget_info, cdev);
  1623		spin_lock_irqsave(&gi->spinlock, flags);
  1624		cdev = get_gadget_data(gadget);
  1625		if (!cdev || gi->unbind) {
  1626			spin_unlock_irqrestore(&gi->spinlock, flags);
  1627			return;
  1628		}
  1629	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

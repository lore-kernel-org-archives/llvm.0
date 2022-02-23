Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0067A
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 23:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645660435; x=1677196435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Mf0e2eBXQJHN82IgAISmTACADyQuLrd9vNr/6vogps=;
  b=Tx35dpzXKuZsY79oRFx5TzOom09mfJWA6lMZj9ITdMiqApp370X7MhVV
   KzlTDGPKvoCymQbuAjKtaS5mxFV98QuXgB3bz1RodT//LDGe/zYKGGlXG
   TiLrpkG30XAgaveSHsZg8ANiiVzfsc1+6lwhYlhlizGZsVvoTATtrBjZ+
   Frf5cythi57LrEJ4Vd7yU5w0i12maLx0J4ImCV8BtHZAV3b0be+dAv1uy
   uO/+awEV1tD+gVfBYyq/pc+RS0IFLlu503HN+myXf9uvXKylSjmZnYcHF
   MZckTx1LKIboRanDPxMkAFiQBkXeDry+8yEd5JfNWPBGn7azGZnnI/ijL
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="249689575"
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="249689575"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 15:53:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="506114190"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Feb 2022 15:53:52 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nN1SC-0001z2-5k; Wed, 23 Feb 2022 23:53:52 +0000
Date: Thu, 24 Feb 2022 07:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Phil Edworthy <phil.edworthy@renesas.com>
Subject: [miquelraynal:renesas/0-day/uart-dma 15/16] ERROR: modpost:
 "serial8250_rx_dma" [drivers/tty/serial/8250/8250_dw.ko] undefined!
Message-ID: <202202240719.lGPmYS8a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/miquelraynal/linux-0day.git renesas/0-day/uart-dma
head:   cac854e8b055133a489d6aa5ca301cabaf4721a0
commit: 27904fce5a96f06bd80cd303a511ef7c2e9cc11b [15/16] serial: 8250_dw: Add support for RZ/N1 DMA
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220224/202202240719.lGPmYS8a-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/miquelraynal/linux-0day/commit/27904fce5a96f06bd80cd303a511ef7c2e9cc11b
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal renesas/0-day/uart-dma
        git checkout 27904fce5a96f06bd80cd303a511ef7c2e9cc11b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "serial8250_rx_dma" [drivers/tty/serial/8250/8250_dw.ko] undefined!
>> ERROR: modpost: "serial8250_tx_dma" [drivers/tty/serial/8250/8250_dw.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468ED2F3E;
	Wed,  1 Mar 2023 22:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677711220; x=1709247220;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qEzYZmVb6lrJSfaZu7wCE0F+rEH1V0FBs+35ptj/ITU=;
  b=WeAEW3Rytr/vTPpVnbUR8SblY9UH5uzTR3NFDRY48Nz8sjo3jLx4+BCx
   Gmmzz+0U4y/MCV67ELgrBJ06hygtpz2TqOHBgaLigBINKWCjz68jOe2bk
   l2nrqSci6JFBb+6N7h6KkDUxGciaMFiOAiFkk7Cjxx3SwmQGOvbRqC0cn
   govaVgvf7xAhUYbeA2Xe/BZ475ocpHlhGbYgDLnKfHI7vK+mhukQOziIS
   sGJ/cDNBjJa89dZA7qJf/D3ZAHVQQU7IyxyCTDPr+rKcYdzxm+tQiBE1P
   oFU87iwdhoujZAwgGlR4xaa7lX8ZjSDbJWKdW6OiZJZ6JR2SmpreKUNTt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="362129279"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="362129279"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 14:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="674730264"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="674730264"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Mar 2023 14:53:38 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXVKL-0006Tf-0p;
	Wed, 01 Mar 2023 22:53:37 +0000
Date: Thu, 2 Mar 2023 06:53:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 9228/9999]
 drivers/net/wireless/ath/ath10k/htt_rx.o: warning: objtool:
 ath10k_update_per_peer_tx_stats()+0x285: can't find switch jump table
Message-ID: <202303020626.oUzKKPcw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Anilkumar Kolli <akolli@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>
CC: Wen Gong <wgong@codeaurora.org>
CC: Claire Chang <tientzu@chromium.org>
CC: Sean Paul <seanpaul@chromium.org>

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 5ce12519c6797b9beed57f0caaa1799bfca1396c [9228/9999] UPSTREAM: ath10k: report tx rate using ieee80211_tx_rate_update()
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20230302/202303020626.oUzKKPcw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/5ce12519c6797b9beed57f0caaa1799bfca1396c
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout 5ce12519c6797b9beed57f0caaa1799bfca1396c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ lib/ net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020626.oUzKKPcw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath10k/htt_rx.o: warning: objtool: ath10k_update_per_peer_tx_stats()+0x285: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

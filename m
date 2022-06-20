Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB7B7B
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 03:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655694953; x=1687230953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37q6K5GB9nUBM0k53WgyJvLHPC9T4QPmhH050MONlOo=;
  b=Fm2hr0CEA6KolJu/MYSGQxFvMGpHLKERF47iOqgJAbXf56v25Lr6sLEM
   BH4pX7AQQr0JB/KY/uI/Xz0E7ur0hU9HfLRXnhFcAzsJQKJpycDuGIm58
   dBuFCDXAEnD2wcBHest5t4C1KEemSG8NneCv6wzjZ513XAgItLlGlApQs
   7jXMOtCboCavTY7tMfET0SeQMEfWVf8g51Lo/shrT6pJP5n3wshZgsfgS
   ZrNABde0e98/P//WtrTama3NWU2CKLAxDlJuJaKORWrgHZpkvzbkBf4ON
   wapFWkLR6P9tAoBYWC3A21AaF9MaOZjIAVBuL307DZqUFWNkOQOV8PCzJ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259611527"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="259611527"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2022 20:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="590969255"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jun 2022 20:15:51 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o37tG-000Rvz-PL;
	Mon, 20 Jun 2022 03:15:50 +0000
Date: Mon, 20 Jun 2022 11:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [morse:mpam/snapshot/v5.18 145/146]
 drivers/perf/resctrl_pmu.c:241:11: warning: variable 'id' is uninitialized
 when used within its own initialization
Message-ID: <202206201130.h6t8Rjbz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v5.18
head:   bac90d25cbdee0fc233b9b1c47d5b6f44101a384
commit: 03bff3df8a6f1e3120c7140d4c569bbb78d6e6d4 [145/146] drivers/perf: Add PMU to support reading resctrl counters via perf
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220620/202206201130.h6t8Rjbz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?id=03bff3df8a6f1e3120c7140d4c569bbb78d6e6d4
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
        git fetch --no-tags morse mpam/snapshot/v5.18
        git checkout 03bff3df8a6f1e3120c7140d4c569bbb78d6e6d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/perf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/perf/resctrl_pmu.c:241:11: warning: variable 'id' is uninitialized when used within its own initialization [-Wuninitialized]
           u64 id = id;
               ~~   ^~
   1 warning generated.


vim +/id +241 drivers/perf/resctrl_pmu.c

   232	
   233	/*
   234	 * Not all architetures do anything with resctrl_arch_mon_ctx_alloc_no_wait(),
   235	 * so hwc->idx may be meaningless.
   236	 */
   237	static int resctrl_pmu_event_idx(struct perf_event *event)
   238	{
   239		u16 event_num = get_event(event);
   240		u32 closid, rmid, idx;
 > 241		u64 id = id;
   242	
   243		__resctrl_id_decode(id, &closid, &rmid);
   244		idx = resctrl_arch_rmid_idx_encode(closid, rmid);
   245	
   246		return idx << ilog2(RESCTRL_MAX_EVENT_NUM) | event_num;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

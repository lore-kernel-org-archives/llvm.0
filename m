Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8704414
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 15:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657641084; x=1689177084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OsbDyE3YnVvtPN31c8IWoJq9a7qi8GTlkb72sPxTnZo=;
  b=fW8Y4pe9MmHjWIeQzvnHojJ5NSRVn+ul9Q6ecRcJqUSBTfpJrVkK3M8L
   vGJ3r2WNc8CEWlQ0LfqrRbRL8/3VS6iT4z1bTv7ES33USydaZ28JwIioC
   7R3pD0ARWAtx+wzUAQJwLNJ+tmodUqPPoMMtaoYMdZ4mRvkQTMJxHwu23
   NFHtoatMOK+s1AUDtsA5kXjDcyc3xK2fPQ+/UPm5CYeAHl0ud7sMXJNQi
   2a8MIJrG/4Clx4rL/TW8Hav79tMEkb8hNjlipa0TcOOTKC2NpY5Sdf4xx
   vbb0PDCAEpbWpzHj/3g9XYgEPJVTgQxTLQfc5KaEdFxftZh3CP3gp396v
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285713680"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="285713680"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 08:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="627942879"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Jul 2022 08:51:22 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBIAT-0002M7-E2;
	Tue, 12 Jul 2022 15:51:21 +0000
Date: Tue, 12 Jul 2022 23:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Collingbourne <pcc@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: mm/kasan/sw_tags.c:211:6: warning: no previous prototype for
 function 'kasan_tag_mismatch'
Message-ID: <202207122314.QtmUlhky-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a29232d870d9e63fe5ff30b081be6ea7cc2465d
commit: 1cbdf60bd1b74e397d48aa877367cfc621f45ffe kasan: arm64: support specialized outlined tag mismatch checks
date:   1 year, 2 months ago
config: arm64-randconfig-r002-20220712 (https://download.01.org/0day-ci/archive/20220712/202207122314.QtmUlhky-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project badda4ac3c489a8c8cccdad1f74b9308c350a9e0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1cbdf60bd1b74e397d48aa877367cfc621f45ffe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1cbdf60bd1b74e397d48aa877367cfc621f45ffe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash mm/kasan/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> mm/kasan/sw_tags.c:211:6: warning: no previous prototype for function 'kasan_tag_mismatch' [-Wmissing-prototypes]
   void kasan_tag_mismatch(unsigned long addr, unsigned long access_info,
        ^
   mm/kasan/sw_tags.c:211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kasan_tag_mismatch(unsigned long addr, unsigned long access_info,
   ^
   static 
   1 warning generated.


vim +/kasan_tag_mismatch +211 mm/kasan/sw_tags.c

   210	
 > 211	void kasan_tag_mismatch(unsigned long addr, unsigned long access_info,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

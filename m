Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172367D61
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 23:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662162153; x=1693698153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/efY59gkiZTSJsslrvg6cTfqOJ/AgFh7wmsPP3MseGU=;
  b=lZeEPompXWmKP/IqXbXgA9U581LD1puPCH3jDp5dkmsLBNvWJffhbwKB
   7ECg1AuUn/g/s6nQko8gOur8u61E4B4ZkKovFWvfTC7wT3BBL22IelyfN
   7Pco2Og18XxpKCDkKRRhKxJyGaeEuZ4n8SexSaS+IJAYZDA3Hik3TkPjL
   JWQWkkmqhnELuoKqyKlrbEPEhL4vadZGL8UPTQxFw8taIjQt0thT2zkq+
   7+luPLsjgOcLYH8TxNItO1jS1uQBpZ1EhFPh9NcOskVEFD9dVttIjQUio
   Pq8sb1FI4AEHi+7ltEDvXaJfaC6JGXlyKS5ucAefOZ8zw97+n/BlHrJeg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="296891978"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; 
   d="scan'208";a="296891978"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 16:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; 
   d="scan'208";a="646286064"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 02 Sep 2022 16:42:31 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUGIw-0000k7-1X;
	Fri, 02 Sep 2022 23:42:30 +0000
Date: Sat, 3 Sep 2022 07:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [linux-next:master 4318/4736] arch/x86/mm/init.c:1057:15: warning:
 no previous prototype for function 'arch_max_swapfile_size'
Message-ID: <202209030733.wJOuJq5j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
commit: c21e4d92cbb920b50a809409bc56c6ca4f09e7bf [4318/4736] mm/swap: cache maximum swapfile size when init swap
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220903/202209030733.wJOuJq5j-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c21e4d92cbb920b50a809409bc56c6ca4f09e7bf
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c21e4d92cbb920b50a809409bc56c6ca4f09e7bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/mm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/mm/init.c:1057:15: warning: no previous prototype for function 'arch_max_swapfile_size' [-Wmissing-prototypes]
   unsigned long arch_max_swapfile_size(void)
                 ^
   arch/x86/mm/init.c:1057:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long arch_max_swapfile_size(void)
   ^
   static 
   1 warning generated.


vim +/arch_max_swapfile_size +1057 arch/x86/mm/init.c

  1055	
  1056	#ifdef CONFIG_SWAP
> 1057	unsigned long arch_max_swapfile_size(void)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

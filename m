Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB4B256E;
	Fri, 20 Jan 2023 23:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674257074; x=1705793074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i2Kz2Ki18gYc4Eh9rn7zozY5S7hTLmiNvjzBVfSWqeU=;
  b=QEGpLCGkID2dDsFSVzpJCblnh5qSSHcv4yiIILOeXkLDTxpjMU/AHX1B
   t4t4Ct7nm60vlCaGIY47MwchWPUZBAYsf69gg2LTHixHoeC2e/20A12JT
   KBbnUyqEQWwvvjBn/EbJNR5pNERawf5QKZMp8YZo7iS7ygTyxpExiqWWV
   MZa+/Rw2TmEKZL9X7HibL7wdh/+JXxaAUM6RwulMZ4df8hyAZZ0OobuSU
   YlB1+xR27LJb+QGvfFSmitJjLTWjsounRqiewrM4n/PmSKA59+Ief2qJv
   6Lluu7JAuQ8G5frHfjoS0R7pEPyPprAT4iaCPItETLE14jzrNkRvcE2aH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="388084177"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="388084177"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 15:24:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="610624383"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="610624383"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2023 15:24:32 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ0kJ-00035m-0B;
	Fri, 20 Jan 2023 23:24:31 +0000
Date: Sat, 21 Jan 2023 07:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/attach_btfid 1/2] net/bpf/test_func_2.c:8:5:
 warning: no previous prototype for function 'bpf_test_func2_globl'
Message-ID: <202301210742.Zfz0SOHI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/attach_btfid
head:   cfc34e8e2edc1d8ab7dde3a065bf708448ee9680
commit: 52454dab859150561a4e93ff6c98a7d9be86679c [1/2] bpf: Add multiple bpf_test_func functions
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230121/202301210742.Zfz0SOHI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=52454dab859150561a4e93ff6c98a7d9be86679c
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/attach_btfid
        git checkout 52454dab859150561a4e93ff6c98a7d9be86679c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/bpf/test_func_2.c:8:5: warning: no previous prototype for function 'bpf_test_func2_globl' [-Wmissing-prototypes]
   int bpf_test_func2_globl(int a)
       ^
   net/bpf/test_func_2.c:8:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_test_func2_globl(int a)
   ^
   static 
   1 warning generated.
--
>> net/bpf/test_func_1.c:9:5: warning: no previous prototype for function 'bpf_test_func1_globl' [-Wmissing-prototypes]
   int bpf_test_func1_globl(struct bpf_prog *prog)
       ^
   net/bpf/test_func_1.c:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_test_func1_globl(struct bpf_prog *prog)
   ^
   static 
   1 warning generated.
--
>> net/bpf/test_func_3.c:9:5: warning: no previous prototype for function 'bpf_test_func3_globl' [-Wmissing-prototypes]
   int bpf_test_func3_globl(struct bpf_prog *prog)
       ^
   net/bpf/test_func_3.c:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_test_func3_globl(struct bpf_prog *prog)
   ^
   static 
   1 warning generated.


vim +/bpf_test_func2_globl +8 net/bpf/test_func_2.c

     7	
   > 8	int bpf_test_func2_globl(int a)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

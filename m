Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A752B2C82
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 21:53:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="217018683"
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; 
   d="scan'208";a="217018683"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 13:53:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; 
   d="scan'208";a="459777204"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Nov 2021 13:53:28 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1msB43-000Do7-NN; Tue, 30 Nov 2021 21:53:27 +0000
Date: Wed, 1 Dec 2021 05:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 01/20] ima: Add IMA namespace support
Message-ID: <202112010524.0QqCKzjC-lkp@intel.com>
References: <20211130160654.1418231-2-stefanb@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130160654.1418231-2-stefanb@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stefan,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on zohar-integrity/next-integrity]
[also build test WARNING on pcmoore-selinux/next linus/master v5.16-rc3 next-20211130]
[cannot apply to jmorris-security/next-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stefan-Berger/ima-Namespace-IMA-with-audit-support-in-IMA-ns/20211201-001242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git next-integrity
config: arm-randconfig-r014-20211128 (https://download.01.org/0day-ci/archive/20211201/202112010524.0QqCKzjC-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/38ca49ebd9eb92c7975ca8d04ed1a4aa4959e96a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stefan-Berger/ima-Namespace-IMA-with-audit-support-in-IMA-ns/20211201-001242
        git checkout 38ca49ebd9eb92c7975ca8d04ed1a4aa4959e96a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash security/integrity/ima/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_ns.c:77:12: warning: no previous prototype for function 'imans_cache_init' [-Wmissing-prototypes]
   int __init imans_cache_init(void)
              ^
   security/integrity/ima/ima_ns.c:77:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init imans_cache_init(void)
   ^
   static 
   1 warning generated.


vim +/imans_cache_init +77 security/integrity/ima/ima_ns.c

    76	
  > 77	int __init imans_cache_init(void)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

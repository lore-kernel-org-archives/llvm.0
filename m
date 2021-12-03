Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787862C9D
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 11:05:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="236895538"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="236895538"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 03:05:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="541592388"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Dec 2021 03:05:07 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mt6NG-000HTW-MK; Fri, 03 Dec 2021 11:05:06 +0000
Date: Fri, 3 Dec 2021 19:04:59 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC v2 19/19] ima: Setup securityfs for IMA namespace
Message-ID: <202112031932.qCorYl4u-lkp@intel.com>
References: <20211203023118.1447229-20-stefanb@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203023118.1447229-20-stefanb@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stefan,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on zohar-integrity/next-integrity]
[also build test ERROR on linus/master v5.16-rc3]
[cannot apply to pcmoore-selinux/next next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stefan-Berger/ima-Namespace-IMA-with-audit-support-in-IMA-ns/20211203-103412
base:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git next-integrity
config: mips-buildonly-randconfig-r002-20211203 (https://download.01.org/0day-ci/archive/20211203/202112031932.qCorYl4u-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 1e328b06c15273edf4a40a27ca24931b5efb3a87)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/8766e0181c2639c814f7391feaa411d8c767e37b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stefan-Berger/ima-Namespace-IMA-with-audit-support-in-IMA-ns/20211203-103412
        git checkout 8766e0181c2639c814f7391feaa411d8c767e37b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> security/inode.c:69:19: error: no member named 'ima_ns' in 'struct user_namespace'
           if (fc->user_ns->ima_ns->late_fs_init) {
               ~~~~~~~~~~~  ^
   security/inode.c:70:21: error: no member named 'ima_ns' in 'struct user_namespace'
                   rc = fc->user_ns->ima_ns->late_fs_init(fc->user_ns);
                        ~~~~~~~~~~~  ^
   2 errors generated.


vim +69 security/inode.c

    64	
    65	static int securityfs_init_fs_context(struct fs_context *fc)
    66	{
    67		int rc;
    68	
  > 69		if (fc->user_ns->ima_ns->late_fs_init) {
    70			rc = fc->user_ns->ima_ns->late_fs_init(fc->user_ns);
    71			if (rc)
    72				return rc;
    73		}
    74		fc->ops = &securityfs_context_ops;
    75		return 0;
    76	}
    77	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

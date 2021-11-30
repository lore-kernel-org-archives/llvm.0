Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2662C2C99
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 23:22:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="299729999"
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; 
   d="scan'208";a="299729999"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2021 15:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,277,1631602800"; 
   d="scan'208";a="609314234"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Nov 2021 15:22:30 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1msCSD-000Dts-ON; Tue, 30 Nov 2021 23:22:29 +0000
Date: Wed, 1 Dec 2021 07:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 02/20] ima: Define ns_status for storing namespaced iint
 data
Message-ID: <202112010752.p7PfhOZ8-lkp@intel.com>
References: <20211130160654.1418231-3-stefanb@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130160654.1418231-3-stefanb@linux.ibm.com>
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
config: arm-randconfig-r014-20211128 (https://download.01.org/0day-ci/archive/20211201/202112010752.p7PfhOZ8-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/21749848be3e256e789659aa2b343eee70dd3f65
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stefan-Berger/ima-Namespace-IMA-with-audit-support-in-IMA-ns/20211201-001242
        git checkout 21749848be3e256e789659aa2b343eee70dd3f65
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash security/integrity/ima/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_ns_status.c:72:6: warning: no previous prototype for function 'insert_ns_status' [-Wmissing-prototypes]
   void insert_ns_status(struct ima_namespace *ns, struct inode *inode,
        ^
   security/integrity/ima/ima_ns_status.c:72:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void insert_ns_status(struct ima_namespace *ns, struct inode *inode,
   ^
   static 
   1 warning generated.


vim +/insert_ns_status +72 security/integrity/ima/ima_ns_status.c

    71	
  > 72	void insert_ns_status(struct ima_namespace *ns, struct inode *inode,
    73			      struct ns_status *status)
    74	{
    75		struct rb_node **p;
    76		struct rb_node *node, *parent = NULL;
    77		struct ns_status *test_status;
    78	
    79		p = &ns->ns_status_tree.rb_node;
    80		while (*p) {
    81			parent = *p;
    82			test_status = rb_entry(parent, struct ns_status, rb_node);
    83			if (inode < test_status->inode)
    84				p = &(*p)->rb_left;
    85			else
    86				p = &(*p)->rb_right;
    87		}
    88		node = &status->rb_node;
    89		rb_link_node(node, parent, p);
    90		rb_insert_color(node, &ns->ns_status_tree);
    91	}
    92	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

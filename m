Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CC728EA
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 20:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652214836; x=1683750836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zYtNsqm7P4ux1SxLtztomDlMzZKSu6d2ZQ4npwDOTBc=;
  b=k1ODeBxHve0pFe3UR1iOa+qUaiCAqQqH97FHEYjVibgRLoGrKsNA4oc1
   Q9zDK94gn7maHnEejJMJroWtX3Cvuy9yLuBSFx+LXmuGZc59+U5CP68+j
   wG4Ft8TWq4GQhHeFJ9shmalLEam7BbMKeCSRqM8GSEWwFcPd3+2Zw4TRn
   tnl92c1IW1b4iQnRJRfXFrWM1IrMBuj1TEMcOaRSB4xnEx6tlfjMLSqmB
   p4QqEKq1r4DYgXeSHrMLbKdSumCfYjDJ2nnrlXiTV7Ytjj75Cj+Yq+qbs
   w5K/miaZY+WBN8EdgYd+fpypQU80ABBSrgSxjiEoVjq/v9C4iCF6mEn7p
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="330094969"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; 
   d="scan'208";a="330094969"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 13:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; 
   d="scan'208";a="593746365"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 May 2022 13:33:31 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noWXy-000ILg-PX;
	Tue, 10 May 2022 20:33:30 +0000
Date: Wed, 11 May 2022 04:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH bpf-next 8/9] bpf: Introduce cgroup iter
Message-ID: <202205110411.3JurYrRA-lkp@intel.com>
References: <20220510001807.4132027-9-yosryahmed@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510001807.4132027-9-yosryahmed@google.com>

Hi Yosry,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf/master]
[also build test ERROR on tj-cgroup/for-next v5.18-rc6]
[cannot apply to bpf-next/master next-20220510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/bpf-cgroup-hierarchical-stats-collection/20220510-082111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
config: arm-randconfig-c002-20220509 (https://download.01.org/0day-ci/archive/20220511/202205110411.3JurYrRA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/28d32eb29ab73ce2230db49f2c8af1e4ce371e11
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yosry-Ahmed/bpf-cgroup-hierarchical-stats-collection/20220510-082111
        git checkout 28d32eb29ab73ce2230db49f2c8af1e4ce371e11
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/cgroup_iter.c:5:
   include/linux/cgroup.h:764:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
   {}
    ^
>> kernel/bpf/cgroup_iter.c:91:14: error: too many arguments to function call, expected 0, have 1
                   cgroup_put(aux->cgroup);
                   ~~~~~~~~~~ ^~~~~~~~~~~
   include/linux/cgroup.h:763:30: note: 'cgroup_put' declared here
   static inline struct cgroup *cgroup_put(void)
                                ^
>> kernel/bpf/cgroup_iter.c:112:2: error: call to undeclared function 'cgroup_path_ns'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           cgroup_path_ns(aux->cgroup, buf, sizeof(buf),
           ^
   kernel/bpf/cgroup_iter.c:112:2: note: did you mean 'cgroup_parent'?
   include/linux/cgroup.h:734:30: note: 'cgroup_parent' declared here
   static inline struct cgroup *cgroup_parent(struct cgroup *cgrp)
                                ^
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_DSA_SMSC_LAN9303
   Depends on NETDEVICES && NET_DSA && (VLAN_8021Q || VLAN_8021Q
   Selected by
   - NET_DSA_SMSC_LAN9303_I2C && NETDEVICES && NET_DSA && I2C


vim +91 kernel/bpf/cgroup_iter.c

    87	
    88	static void bpf_iter_detach_cgroup(struct bpf_iter_aux_info *aux)
    89	{
    90		if (aux->cgroup)
  > 91			cgroup_put(aux->cgroup);
    92	}
    93	
    94	static void bpf_iter_cgroup_show_fdinfo(const struct bpf_iter_aux_info *aux,
    95						struct seq_file *seq)
    96	{
    97		char *buf;
    98	
    99		seq_printf(seq, "cgroup_id:\t%llu\n", cgroup_id(aux->cgroup));
   100	
   101		buf = kmalloc(PATH_MAX, GFP_KERNEL);
   102		if (!buf) {
   103			seq_puts(seq, "cgroup_path:\n");
   104			return;
   105		}
   106	
   107		/* If cgroup_path_ns() fails, buf will be an empty string, cgroup_path
   108		 * will print nothing.
   109		 *
   110		 * Cgroup_path is the path in the calliing process's cgroup namespace.
   111		 */
 > 112		cgroup_path_ns(aux->cgroup, buf, sizeof(buf),
   113			       current->nsproxy->cgroup_ns);
   114		seq_printf(seq, "cgroup_path:\t%s\n", buf);
   115		kfree(buf);
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

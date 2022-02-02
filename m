Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824C22F24
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 03:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643773233; x=1675309233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eRFeMaPnGD7vFSVM4dcL1syNt2lw+fAiSq1D8XUkbXc=;
  b=irnW338yCtvAXETx+9j7fhXkAsLO+eDg734pATBADVbWVpAkXwfF54uf
   6rfm49DrT+MFQHJK11/CN9pR0M73ugzNa4v/MkSstdPzHCs+p40EzuJ3v
   71Bmoq0Ug0DQjlcB4DjQkMoZZP1SJsLYeqKFSdgWdNvwhVBDHHVjT4niV
   WuCeFaXDnpeDcp3qwh9S4VuCJSlwe0ZySa1tX8KYH6mF2BE4CkuRAij31
   BCnIJGfSOuOEX6lOQwZOZImxsDLEtzJmgqZO3NLWwrbUVkKHLeZOrIb7/
   /PTHlFHDm81idX8k8w2xXgnwq6uZMt7MSLsA+I9rxtOQIPoXKA/aqloBz
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="308573902"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="308573902"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 19:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="497605378"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Feb 2022 19:40:31 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nF6VT-000U60-5d; Wed, 02 Feb 2022 03:40:31 +0000
Date: Wed, 2 Feb 2022 11:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Luo <haoluo@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC bpf-next v2 3/5] bpf: cgroup_view iter
Message-ID: <202202021120.j2esP3IH-lkp@intel.com>
References: <20220201205534.1962784-4-haoluo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201205534.1962784-4-haoluo@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hao,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Hao-Luo/Extend-cgroup-interface-with-bpf/20220202-045743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: hexagon-randconfig-r022-20220131 (https://download.01.org/0day-ci/archive/20220202/202202021120.j2esP3IH-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/717a4c31e5bc20e5c7abf8c78a8c434fb15788a3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hao-Luo/Extend-cgroup-interface-with-bpf/20220202-045743
        git checkout 717a4c31e5bc20e5c7abf8c78a8c434fb15788a3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/bpf/cgroup_view_iter.c:32:18: error: implicit declaration of function 'cgroup_tryget' [-Werror,-Wimplicit-function-declaration]
           if (!cgroup || !cgroup_tryget(cgroup))
                           ^
>> kernel/bpf/cgroup_view_iter.c:77:3: error: implicit declaration of function 'cgroup_put' [-Werror,-Wimplicit-function-declaration]
                   cgroup_put(v);
                   ^
   kernel/bpf/cgroup_view_iter.c:77:3: note: did you mean 'cgroup_psi'?
   include/linux/cgroup.h:736:33: note: 'cgroup_psi' declared here
   static inline struct psi_group *cgroup_psi(struct cgroup *cgrp)
                                   ^
   2 errors generated.


vim +/cgroup_tryget +32 kernel/bpf/cgroup_view_iter.c

    11	
    12	static void *cgroup_view_seq_start(struct seq_file *seq, loff_t *pos)
    13	{
    14		struct bpf_dir_tag *tag;
    15		struct kernfs_node *kn;
    16		struct cgroup *cgroup;
    17		struct inode *dir;
    18	
    19		/* Only one session is supported. */
    20		if (*pos > 0)
    21			return NULL;
    22	
    23		dir = d_inode(seq->file->f_path.dentry->d_parent);
    24		tag = dir->i_private;
    25		if (!tag)
    26			return NULL;
    27	
    28		kn = tag->private;
    29	
    30		rcu_read_lock();
    31		cgroup = rcu_dereference(*(void __rcu __force **)&kn->priv);
  > 32		if (!cgroup || !cgroup_tryget(cgroup))
    33			cgroup = NULL;
    34		rcu_read_unlock();
    35	
    36		if (!cgroup)
    37			return NULL;
    38	
    39		if (*pos == 0)
    40			++*pos;
    41		return cgroup;
    42	}
    43	
    44	static void *cgroup_view_seq_next(struct seq_file *seq, void *v, loff_t *pos)
    45	{
    46		++*pos;
    47		return NULL;
    48	}
    49	
    50	struct bpf_iter__cgroup_view {
    51		__bpf_md_ptr(struct bpf_iter_meta *, meta);
    52		__bpf_md_ptr(struct cgroup *, cgroup);
    53	};
    54	
    55	DEFINE_BPF_ITER_FUNC(cgroup_view, struct bpf_iter_meta *meta, struct cgroup *cgroup)
    56	
    57	static int cgroup_view_seq_show(struct seq_file *seq, void *v)
    58	{
    59		struct bpf_iter__cgroup_view ctx;
    60		struct bpf_iter_meta meta;
    61		struct bpf_prog *prog;
    62		int ret = 0;
    63	
    64		ctx.meta = &meta;
    65		ctx.cgroup = v;
    66		meta.seq = seq;
    67		prog = bpf_iter_get_info(&meta, false);
    68		if (prog)
    69			ret = bpf_iter_run_prog(prog, &ctx);
    70	
    71		return ret;
    72	}
    73	
    74	static void cgroup_view_seq_stop(struct seq_file *seq, void *v)
    75	{
    76		if (v)
  > 77			cgroup_put(v);
    78	}
    79	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

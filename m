Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365772F21
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 05:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643778701; x=1675314701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+NE6bYfLUbePmW3bdM3nA5ICqnwVwqWbTQHNJZZC9cI=;
  b=nrVjEk9WE4BSupNGe9sglFoD0A2xGNVA4sVTRCm2nNuV2SQQg54uwmrC
   LszYsBMus8NKgYVrQ4I5Cg2KlFqU0+6K0kXAOmb/kynwnzrXsrHNfMKBy
   RNcUKqmRj25REYpWMTLCcpD3MTvSZmpn2/05PPAhPxz0u84pH/Qx6qejR
   i6uT4snzmB7hAONNlxuXoB5SviYewdfh2pPYwHjF5LcdQSkTgZiYbT9hq
   mEbHZZHmxn8K+PrtrLiBvkV5o7n9xOtCcEdHH7ksUQ/m8ziK80/zMWCy/
   vLLxOjap9pLWuY/Kws3gubKq9NOL/r4LBJvHYYYtDk6FGN3E8JlBNjFmd
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="248071470"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="248071470"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 21:11:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="523346281"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Feb 2022 21:11:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nF7ve-000UA9-ET; Wed, 02 Feb 2022 05:11:38 +0000
Date: Wed, 2 Feb 2022 13:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Luo <haoluo@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC bpf-next v2 4/5] bpf: Pin cgroup_view
Message-ID: <202202021337.jFrbh3Yq-lkp@intel.com>
References: <20220201205534.1962784-5-haoluo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201205534.1962784-5-haoluo@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hao,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Hao-Luo/Extend-cgroup-interface-with-bpf/20220202-045743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: hexagon-randconfig-r041-20220131 (https://download.01.org/0day-ci/archive/20220202/202202021337.jFrbh3Yq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5ecb726d4b2336b6c49a58f013fe270f2c3dfdd1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hao-Luo/Extend-cgroup-interface-with-bpf/20220202-045743
        git checkout 5ecb726d4b2336b6c49a58f013fe270f2c3dfdd1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/bpf/inode.c:638:18: error: use of undeclared identifier 'cgrp_dfl_root'
                   tag->private = cgrp_dfl_root.kf_root->kn;
                                  ^
   1 error generated.


vim +/cgrp_dfl_root +638 kernel/bpf/inode.c

   600	
   601	/* bpf_inherit_object - register an object in a diretory tag's inherit list
   602	 * @dentry: dentry of the location to pin
   603	 * @mode: mode of created file entry
   604	 * @obj: bpf object
   605	 * @type: type of bpf object
   606	 *
   607	 * Could be called from bpf_obj_do_pin() or from mkdir().
   608	 */
   609	static int bpf_inherit_object(struct dentry *dentry, umode_t mode,
   610				      void *obj, enum bpf_type type)
   611	{
   612		struct inode *dir = d_inode(dentry->d_parent);
   613		struct obj_list *inherits;
   614		struct bpf_inherit_entry *e;
   615		struct bpf_dir_tag *tag;
   616		const char *name;
   617		bool queued = false, new_tag = false;
   618	
   619		/* allocate bpf_dir_tag */
   620		tag = inode_tag(dir);
   621		if (!tag) {
   622			new_tag = true;
   623			tag = kzalloc(sizeof(struct bpf_dir_tag), GFP_KERNEL);
   624			if (unlikely(!tag))
   625				return -ENOMEM;
   626	
   627			tag->type = BPF_DIR_KERNFS_REP;
   628			inherits = kzalloc(sizeof(struct obj_list), GFP_KERNEL);
   629			if (unlikely(!inherits)) {
   630				kfree(tag);
   631				return -ENOMEM;
   632			}
   633	
   634			kref_init(&inherits->refcnt);
   635			INIT_LIST_HEAD(&inherits->list);
   636			tag->inherit_objects = inherits;
   637			/* initial tag points to the default root cgroup. */
 > 638			tag->private = cgrp_dfl_root.kf_root->kn;
   639			dir->i_private = tag;
   640		} else {
   641			inherits = tag->inherit_objects;
   642		}
   643	
   644		list_for_each_entry_rcu(e, &inherits->list, list) {
   645			if (!strcmp(dentry->d_name.name, e->name.name)) {
   646				queued = true;
   647				break;
   648			}
   649		}
   650	
   651		/* queue in tag's inherit_list. */
   652		if (!queued) {
   653			e = kzalloc(sizeof(struct bpf_inherit_entry), GFP_KERNEL);
   654			if (!e) {
   655				if (new_tag) {
   656					kfree(tag);
   657					kfree(inherits);
   658				}
   659				return -ENOMEM;
   660			}
   661	
   662			INIT_LIST_HEAD(&e->list);
   663			e->mode = mode;
   664			e->obj = obj;
   665			e->type = type;
   666			name = kstrdup(dentry->d_name.name, GFP_USER | __GFP_NOWARN);
   667			e->name = (struct qstr)QSTR_INIT(name, strlen(name));
   668			list_add_rcu(&e->list, &inherits->list);
   669		}
   670		return 0;
   671	}
   672	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

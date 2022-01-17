Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0A12C9D
	for <llvm@lists.linux.dev>; Mon, 17 Jan 2022 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642427918; x=1673963918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5eGULNquc8PWrPd6ybyqgziUKXX4BtpHOyNvbgPQrek=;
  b=FAt1DpUet12bsLC1EiHuR4Gbv9+lSYLQaWyBgjJEpBsCN72zo/9iB0Lx
   GbZ8mOW+GK/XLldkO7TYHlPC8AW79D0pp70T2DdS7mKjFux7ivJQVPf6n
   zCmwRhw5VzfVtx9wCorKT66qxrhuJUg4KBxtuOoyAbtUX2SMJfKfUeeps
   0StnxAHZLr8libh469MdeDI4ofxkAEQaAbFu/bZR/eI1Y0JdbmgzFlWwn
   OMGBM6f2l75JvHvVQpU+4BeW3Pt4wNGaHidWgZrgXpfLL25HRl0tj7l7U
   g74IvunIyE2GQbltRL6gehqqU7xdSQdzigzjCjKZpoJXQmvoY78HZnv8d
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="243450017"
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="243450017"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2022 05:58:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="474461925"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Jan 2022 05:58:35 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9SWo-000BbD-Vy; Mon, 17 Jan 2022 13:58:34 +0000
Date: Mon, 17 Jan 2022 21:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Milind Changire <milindchangire@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 1/1] ceph: add getvxattr op
Message-ID: <202201171943.GKWl1yqQ-lkp@intel.com>
References: <20220117034747.22229-2-mchangir@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220117034747.22229-2-mchangir@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Milind,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ceph-client/for-linus]
[also build test WARNING on v5.16 next-20220117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Milind-Changire/ceph-add-getvxattr-op-support/20220117-114947
base:   https://github.com/ceph/ceph-client.git for-linus
config: x86_64-randconfig-a006-20220117 (https://download.01.org/0day-ci/archive/20220117/202201171943.GKWl1yqQ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f782d25a742302d25ef3c8b84b54f7483c2deb9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ed42f71060fc0c0c0c43a582f0bb817713836ddb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Milind-Changire/ceph-add-getvxattr-op-support/20220117-114947
        git checkout ed42f71060fc0c0c0c43a582f0bb817713836ddb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/ceph/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/ceph/inode.c:2326:53: warning: format specifies type 'unsigned int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
           dout("do_getvxattr xattr_value_len:%u, size:%u\n", xattr_value_len, size);
                                              ~~              ^~~~~~~~~~~~~~~
                                              %lu
   include/linux/ceph/ceph_debug.h:35:45: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:580:38: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
                                       ~~~     ^~~~~~~~~~~
   include/linux/printk.h:132:17: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                          ~~~    ^~~~~~~~~~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   fs/ceph/inode.c:2326:70: warning: format specifies type 'unsigned int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
           dout("do_getvxattr xattr_value_len:%u, size:%u\n", xattr_value_len, size);
                                                       ~~                      ^~~~
                                                       %lu
   include/linux/ceph/ceph_debug.h:35:45: note: expanded from macro 'dout'
   # define dout(fmt, ...) pr_debug(" " fmt, ##__VA_ARGS__)
                                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:580:38: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
                                       ~~~     ^~~~~~~~~~~
   include/linux/printk.h:132:17: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                          ~~~    ^~~~~~~~~~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +2326 fs/ceph/inode.c

  2293	
  2294	int ceph_do_getvxattr(struct inode *inode, const char *name, void *value,
  2295			      size_t size)
  2296	{
  2297		struct ceph_fs_client *fsc = ceph_sb_to_client(inode->i_sb);
  2298		struct ceph_mds_client *mdsc = fsc->mdsc;
  2299		struct ceph_mds_request *req;
  2300		int mode = USE_AUTH_MDS;
  2301		int err;
  2302		char *xattr_value;
  2303		size_t xattr_value_len;
  2304	
  2305		req = ceph_mdsc_create_request(mdsc, CEPH_MDS_OP_GETVXATTR, mode);
  2306		if (IS_ERR(req)) {
  2307			err = -ENOMEM;
  2308			goto out;
  2309		}
  2310	
  2311		req->r_path2 = kstrdup(name, GFP_NOFS);
  2312		if (!req->r_path2) {
  2313			err = -ENOMEM;
  2314			goto put;
  2315		}
  2316	
  2317		ihold(inode);
  2318		req->r_inode = inode;
  2319		err = ceph_mdsc_do_request(mdsc, NULL, req);
  2320		if (err < 0)
  2321			goto put;
  2322	
  2323		xattr_value = req->r_reply_info.xattr_info.xattr_value;
  2324		xattr_value_len = req->r_reply_info.xattr_info.xattr_value_len;
  2325	
> 2326		dout("do_getvxattr xattr_value_len:%u, size:%u\n", xattr_value_len, size);
  2327	
  2328		err = xattr_value_len;
  2329		if (size == 0)
  2330			goto put;
  2331	
  2332		if (xattr_value_len > size) {
  2333			err = -ERANGE;
  2334			goto put;
  2335		}
  2336	
  2337		memcpy(value, xattr_value, xattr_value_len);
  2338	put:
  2339		ceph_mdsc_put_request(req);
  2340	out:
  2341		dout("do_getvxattr result=%d\n", err);
  2342		return err;
  2343	}
  2344	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

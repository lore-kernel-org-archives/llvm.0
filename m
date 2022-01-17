Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351CD2C9C
	for <llvm@lists.linux.dev>; Mon, 17 Jan 2022 07:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642406372; x=1673942372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J6L442D4+wPyafdBb32yJmo2x0TLNTOrMacOc2ikUhI=;
  b=AeD8WUgEhMpFRg6deF2PkDzARKlkcbg1LrNOvlj5LULO9y/2wpyccYM+
   d0FjLZwk8dUGeyPnY1mrSGPgraK+L135jULR7U/+vKpEoBjtKuJInC3vz
   egedl4Q5gPSGzgZzw4dDDS//ck5nzCeXjLthAPDxOUzKoZ4jBTXTP4XSQ
   ik7BJDZmUfnnfcuLKxs2Xw6aqXr4fovnci48uUPNsYyL6N9SVTwtq/aUx
   qAHm3dcX1yEjJ5LudwKFyeVMxJUHG80TxE0YyocwKAfyUQusDWRVClhNl
   Yu0w1O73OePgj1wua0qqf27vFIOsnvrgHTAvtbBaB5W/+Q99Wp+ioKj3y
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242132658"
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="242132658"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2022 23:59:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; 
   d="scan'208";a="625107861"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 16 Jan 2022 23:59:27 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9MvG-000BMz-Lm; Mon, 17 Jan 2022 07:59:26 +0000
Date: Mon, 17 Jan 2022 15:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Milind Changire <milindchangire@gmail.com>,
	Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
	ceph-devel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Milind Changire <mchangir@redhat.com>
Subject: Re: [PATCH v3 1/1] ceph: add getvxattr op
Message-ID: <202201171516.ilKzMFxt-lkp@intel.com>
References: <20220117035946.22442-2-mchangir@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220117035946.22442-2-mchangir@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Milind,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on fd84bfdddd169c219c3a637889a8b87f70a072c2]

url:    https://github.com/0day-ci/linux/commits/Milind-Changire/ceph-add-support-for-getvxattr-op/20220117-120129
base:   fd84bfdddd169c219c3a637889a8b87f70a072c2
config: x86_64-randconfig-r002-20220117 (https://download.01.org/0day-ci/archive/20220117/202201171516.ilKzMFxt-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f782d25a742302d25ef3c8b84b54f7483c2deb9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2c3b424994ab41a8d52471eb5a6721f466d515dc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Milind-Changire/ceph-add-support-for-getvxattr-op/20220117-120129
        git checkout 2c3b424994ab41a8d52471eb5a6721f466d515dc
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
   include/linux/ceph/ceph_debug.h:26:29: note: expanded from macro 'dout'
                           printk(KERN_DEBUG fmt, ##__VA_ARGS__);  \
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
   include/linux/ceph/ceph_debug.h:26:29: note: expanded from macro 'dout'
                           printk(KERN_DEBUG fmt, ##__VA_ARGS__);  \
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

Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D642F2F
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 18:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646765704; x=1678301704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XikT9LcfOEBTWylAnmX0FzDRFbtIsY7OHfomsC6NN78=;
  b=Y94GO1UPEj8t64ftI6asQzizwtp2e4OtWkdcZlBPgK1G+04+T2mpE6nZ
   1RxQ07/OnqcFhc6PA0B9fb280eYNKwTDncY9/1ZXaDu/7FAh2v4b9Aeiu
   QHsr4+tw/GyKnz2sI8GieMcMSkqLGUZ4CFf/AoCP5/XMm6EAR3QOVu7qs
   iM16VE6v31ml4v7WYV57JfjBCUqCndEyAMbeOZ5OdoE+oOaO9nVEIHJ6L
   XkD9GFrBN+iOiUqMhB4q5gnDsVd1SPO2QHODItPEvb0Rl4tO34/7L3gqn
   Lm4CZnsjKbShgS/fTMyUlUERnpO3EZSTEoL4BTfNxvHMa1neNUVhplkAz
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="234738244"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="234738244"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 10:54:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="814181655"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2022 10:54:35 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nReyh-0001pq-7A; Tue, 08 Mar 2022 18:54:35 +0000
Date: Wed, 9 Mar 2022 02:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: Eugene Zemtsov <ezemtsov@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	Paul Lawrence <paullawrence@google.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android-trusty-5.4
 2532/6879] fs/incfs/data_mgmt.c:790:21: warning: variable 'mi' set but not
 used
Message-ID: <202203090212.bPXFBNNd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-trusty-5.4
head:   d556bac5a4d65c759ce3c5a7529aef568f05f650
commit: 1be052b20ba04b635cf87bcff80de5314697953e [2532/6879] ANDROID: Initial commit of Incremental FS
config: x86_64-randconfig-c007-20220307 (https://download.01.org/0day-ci/archive/20220309/202203090212.bPXFBNNd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/1be052b20ba04b635cf87bcff80de5314697953e
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-trusty-5.4
        git checkout 1be052b20ba04b635cf87bcff80de5314697953e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/xen/ fs/incfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/incfs/data_mgmt.c:790:21: warning: variable 'mi' set but not used [-Wunused-but-set-variable]
           struct mount_info *mi = NULL;
                              ^
   1 warning generated.


vim +/mi +790 fs/incfs/data_mgmt.c

   785	
   786	int incfs_process_new_hash_block(struct data_file *df,
   787					 struct incfs_new_data_block *block, u8 *data)
   788	{
   789		struct backing_file_context *bfc = NULL;
 > 790		struct mount_info *mi = NULL;
   791		struct mtree *hash_tree = NULL;
   792		struct ondisk_signature *sig = NULL;
   793		loff_t hash_area_base = 0;
   794		loff_t hash_area_size = 0;
   795		int error = 0;
   796	
   797		if (!df || !block)
   798			return -EFAULT;
   799	
   800		if (!(block->flags & INCFS_BLOCK_FLAGS_HASH))
   801			return -EINVAL;
   802	
   803		bfc = df->df_backing_file_context;
   804		mi = df->df_mount_info;
   805	
   806		if (!df)
   807			return -ENOENT;
   808	
   809		hash_tree = df->df_hash_tree;
   810		sig = df->df_signature;
   811		if (!hash_tree || !sig || sig->mtree_offset == 0)
   812			return -ENOTSUPP;
   813	
   814		hash_area_base = sig->mtree_offset;
   815		hash_area_size = sig->mtree_size;
   816		if (hash_area_size < block->block_index * INCFS_DATA_FILE_BLOCK_SIZE
   817					+ block->data_len) {
   818			/* Hash block goes beyond dedicated hash area of this file. */
   819			return -ERANGE;
   820		}
   821	
   822		error = mutex_lock_interruptible(&bfc->bc_mutex);
   823		if (!error)
   824			error = incfs_write_hash_block_to_backing_file(
   825				bfc, range(data, block->data_len), block->block_index,
   826				hash_area_base);
   827		mutex_unlock(&bfc->bc_mutex);
   828		return error;
   829	}
   830	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

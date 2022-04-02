Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3450A10E8
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 05:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648877317; x=1680413317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F7zjgHAH+pGl/TMQC/7d/VqXWgf8vJh+d0CYoE6AAes=;
  b=lKDArIc6Dx9lhiuGRKO1nLMAmCaMP3wGpWlVjkATAeBeLWyijPxtT2Sj
   yGNSD/H+GLE3+LMHByAQ46yARDuVTVtQA436lcKsog5eFEIi69aCE7MZ0
   vNRsT2cGjvnJcovWjwu24nzvQm8zenH6IQTerI0JgGKjs7K9LFy+Los9u
   kU+OwbxqitMNAqnZfSGthro+lfpKP6es51KUdHKP7ZvOB0eTDKX+C9yIV
   uN84Paeb18dHYyUw6AwunB2nQi2stbkZxqGxd8zefdgFuu3gVFt9cIFaH
   z7NaU8oJj50reNbrF0/dTJEe0L6U8dfRX9IP09yg8RBUVEB3ZPEZ8u+oW
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="260456875"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; 
   d="scan'208";a="260456875"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 22:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; 
   d="scan'208";a="587079352"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 01 Apr 2022 22:28:34 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1naWJN-0001l9-PF;
	Sat, 02 Apr 2022 05:28:33 +0000
Date: Sat, 2 Apr 2022 13:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Xiang Gao <xiang@kernel.org>, linux-kernel@vger.kernel.org,
	Gao Xiang <hsiangkao@linux.alibaba.com>
Subject: [xiang:jeffle/fscache 2/19] fs/cachefiles/namei.c:478:8: error: use
 of undeclared label 'out_unuse'
Message-ID: <202204021317.7QFcS38O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/linux.git jeffle/fscache
head:   c536a60b958806d427fb66e3f53a1201826fdcf4
commit: 6e3731398f863eec9b10f9e0cead9f2ec09d8b4d [2/19] cachefiles: notify user daemon with anon_fd when looking up cookie
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220402/202204021317.7QFcS38O-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/xiang/linux.git/commit/?id=6e3731398f863eec9b10f9e0cead9f2ec09d8b4d
        git remote add xiang https://git.kernel.org/pub/scm/linux/kernel/git/xiang/linux.git
        git fetch --no-tags xiang jeffle/fscache
        git checkout 6e3731398f863eec9b10f9e0cead9f2ec09d8b4d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/cachefiles/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/cachefiles/namei.c:478:8: error: use of undeclared label 'out_unuse'
                   goto out_unuse;
                        ^
   1 error generated.


vim +/out_unuse +478 fs/cachefiles/namei.c

   434	
   435	/*
   436	 * Create a temporary file and leave it unattached and un-xattr'd until the
   437	 * time comes to discard the object from memory.
   438	 */
   439	struct file *cachefiles_create_tmpfile(struct cachefiles_object *object)
   440	{
   441		struct cachefiles_volume *volume = object->volume;
   442		struct cachefiles_cache *cache = volume->cache;
   443		const struct cred *saved_cred;
   444		struct dentry *fan = volume->fanout[(u8)object->cookie->key_hash];
   445		struct file *file;
   446		struct path path;
   447		uint64_t ni_size;
   448		long ret;
   449	
   450	
   451		cachefiles_begin_secure(cache, &saved_cred);
   452	
   453		path.mnt = cache->mnt;
   454		ret = cachefiles_inject_write_error();
   455		if (ret == 0)
   456			path.dentry = vfs_tmpfile(&init_user_ns, fan, S_IFREG, O_RDWR);
   457		else
   458			path.dentry = ERR_PTR(ret);
   459		if (IS_ERR(path.dentry)) {
   460			trace_cachefiles_vfs_error(object, d_inode(fan), PTR_ERR(path.dentry),
   461						   cachefiles_trace_tmpfile_error);
   462			if (PTR_ERR(path.dentry) == -EIO)
   463				cachefiles_io_error_obj(object, "Failed to create tmpfile");
   464			file = ERR_CAST(path.dentry);
   465			goto out;
   466		}
   467	
   468		trace_cachefiles_tmpfile(object, d_backing_inode(path.dentry));
   469	
   470		if (!cachefiles_mark_inode_in_use(object, path.dentry)) {
   471			file = ERR_PTR(-EBUSY);
   472			goto out_dput;
   473		}
   474	
   475		ret = cachefiles_ondemand_init_object(object);
   476		if (ret < 0) {
   477			file = ERR_PTR(ret);
 > 478			goto out_unuse;
   479		}
   480	
   481		ni_size = object->cookie->object_size;
   482		ni_size = round_up(ni_size, CACHEFILES_DIO_BLOCK_SIZE);
   483	
   484		if (ni_size > 0) {
   485			trace_cachefiles_trunc(object, d_backing_inode(path.dentry), 0, ni_size,
   486					       cachefiles_trunc_expand_tmpfile);
   487			ret = cachefiles_inject_write_error();
   488			if (ret == 0)
   489				ret = vfs_truncate(&path, ni_size);
   490			if (ret < 0) {
   491				trace_cachefiles_vfs_error(
   492					object, d_backing_inode(path.dentry), ret,
   493					cachefiles_trace_trunc_error);
   494				file = ERR_PTR(ret);
   495				goto out_dput;
   496			}
   497		}
   498	
   499		file = open_with_fake_path(&path, O_RDWR | O_LARGEFILE | O_DIRECT,
   500					   d_backing_inode(path.dentry), cache->cache_cred);
   501		if (IS_ERR(file)) {
   502			trace_cachefiles_vfs_error(object, d_backing_inode(path.dentry),
   503						   PTR_ERR(file),
   504						   cachefiles_trace_open_error);
   505			goto out_dput;
   506		}
   507		if (unlikely(!file->f_op->read_iter) ||
   508		    unlikely(!file->f_op->write_iter)) {
   509			fput(file);
   510			pr_notice("Cache does not support read_iter and write_iter\n");
   511			file = ERR_PTR(-EINVAL);
   512		}
   513	
   514	out_dput:
   515		dput(path.dentry);
   516	out:
   517		cachefiles_end_secure(cache, saved_cred);
   518		return file;
   519	}
   520	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

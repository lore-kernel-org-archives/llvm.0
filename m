Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824BB1E3DDE;
	Wed, 12 Mar 2025 11:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741777939; cv=none; b=ASVP9prs6zrfx4v4pTPB8Ow1fNHM+zyqWyhqGMxmX1hKOxRh2lXYNiCZtB9KGBTzXA3YwCjVkNsTuzVy13qlkNl+d9fKIjlrt+iyiY6UbCa2RYYRSN2KKX+OWxEJKK4gQXThsMLFwPw6h6JyqvXmMcWa/c7IItxmPZudWgr+D4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741777939; c=relaxed/simple;
	bh=iTstUYuzVqCDZ2/4t9wiwHTlVlL3L3ofOchi20PXQyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBUPj19Zm2s6MErijis8d+p1GjO6itghyFSAGintixa/ySDf2ZiH9kRcMfj+sW5pzmm4FmlClDHflk4ViiB715znd9kXe5v1OPb66jmbaw3fbD4RL0GYen4jTNLcKFMswY6FFIwLVkct1mcGtQwCtXPuavFjrWemPfW3EEIx7U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdJTw/lb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdJTw/lb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741777937; x=1773313937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iTstUYuzVqCDZ2/4t9wiwHTlVlL3L3ofOchi20PXQyk=;
  b=RdJTw/lbcyPHdqxHLJuHbqnuiBn+f4madmZJG43Mxrd3mEM/ttAat3I4
   l/WpSYSyE/2LU42F7Q+G1kIHkb0+uIn6dWaEMwMyjHI/LH6frTPAPdPhd
   sAvihP5usXPCB6KCXX7B2wTZ4SPyBL/MMMNsYq8HXkURk4SvA1JXYuh7x
   c+B93nu8bENRGoVua5ydDDB5uLL7Bx/4+z+UJCBxNsjp8mG4yppRq1AOT
   JkT28mcl3AQIc2b6/jZ9YEUEOuq8YiC0w6GHbZR9TbaUXejOkYIXiDTvm
   cOSz9jgoH3UHQI0OPglIubKBZ03QTtwiSuoFQApthrexxPASkZtJc1Oug
   Q==;
X-CSE-ConnectionGUID: IR/GKbO5QvqnlzxqlrG58g==
X-CSE-MsgGUID: xTB6/rKBQouqRWSqjIeIjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42725033"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42725033"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 04:12:15 -0700
X-CSE-ConnectionGUID: tULoO3RDSBqWQlWa+E5adA==
X-CSE-MsgGUID: 4TVAtkGrReCVVZ6F6fzb7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120824096"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 12 Mar 2025 04:12:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsK0S-0008QG-1F;
	Wed, 12 Mar 2025 11:12:12 +0000
Date: Wed, 12 Mar 2025 19:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] btrfs: ioctl: use registered buffer for
 IORING_URING_CMD_FIXED
Message-ID: <202503121808.6NloJdpM-lkp@intel.com>
References: <20250311114053.216359-3-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311114053.216359-3-sidong.yang@furiosa.ai>

Hi Sidong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250307]
[also build test ERROR on v6.14-rc6]
[cannot apply to kdave/for-next linus/master v6.14-rc6 v6.14-rc5 v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sidong-Yang/io_uring-cmd-introduce-io_uring_cmd_import_fixed_vec/20250311-194620
base:   next-20250307
patch link:    https://lore.kernel.org/r/20250311114053.216359-3-sidong.yang%40furiosa.ai
patch subject: [RFC PATCH 2/2] btrfs: ioctl: use registered buffer for IORING_URING_CMD_FIXED
config: i386-buildonly-randconfig-006-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121808.6NloJdpM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121808.6NloJdpM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121808.6NloJdpM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/btrfs/ioctl.c:7:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2306:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/btrfs/ioctl.c:32:
   include/linux/io_uring/cmd.h:51:14: warning: declaration of 'struct iou_vec' will not be visible outside of this function [-Wvisibility]
      51 |                                   struct iou_vec *iou_vec, bool compat,
         |                                          ^
>> fs/btrfs/ioctl.c:4647:17: error: field has incomplete type 'struct iou_vec'
    4647 |         struct iou_vec iou_vec;
         |                        ^
   fs/btrfs/ioctl.c:4647:9: note: forward declaration of 'struct iou_vec'
    4647 |         struct iou_vec iou_vec;
         |                ^
>> fs/btrfs/ioctl.c:4827:17: error: variable has incomplete type 'struct iou_vec'
    4827 |         struct iou_vec iou_vec = {};
         |                        ^
   fs/btrfs/ioctl.c:4647:9: note: forward declaration of 'struct iou_vec'
    4647 |         struct iou_vec iou_vec;
         |                ^
   2 warnings and 2 errors generated.


vim +4647 fs/btrfs/ioctl.c

  4636	
  4637	/*
  4638	 * Context that's attached to an encoded read io_uring command, in cmd->pdu. It
  4639	 * contains the fields in btrfs_uring_read_extent that are necessary to finish
  4640	 * off and cleanup the I/O in btrfs_uring_read_finished.
  4641	 */
  4642	struct btrfs_uring_priv {
  4643		struct io_uring_cmd *cmd;
  4644		struct page **pages;
  4645		unsigned long nr_pages;
  4646		struct kiocb iocb;
> 4647		struct iou_vec iou_vec;
  4648		struct iovec *iov;
  4649		struct iov_iter iter;
  4650		struct extent_state *cached_state;
  4651		u64 count;
  4652		u64 start;
  4653		u64 lockend;
  4654		int err;
  4655		bool compressed;
  4656	};
  4657	
  4658	struct io_btrfs_cmd {
  4659		struct btrfs_uring_priv *priv;
  4660	};
  4661	
  4662	static void btrfs_uring_read_finished(struct io_uring_cmd *cmd, unsigned int issue_flags)
  4663	{
  4664		struct io_btrfs_cmd *bc = io_uring_cmd_to_pdu(cmd, struct io_btrfs_cmd);
  4665		struct btrfs_uring_priv *priv = bc->priv;
  4666		struct btrfs_inode *inode = BTRFS_I(file_inode(priv->iocb.ki_filp));
  4667		struct extent_io_tree *io_tree = &inode->io_tree;
  4668		unsigned long index;
  4669		u64 cur;
  4670		size_t page_offset;
  4671		ssize_t ret;
  4672	
  4673		/* The inode lock has already been acquired in btrfs_uring_read_extent.  */
  4674		btrfs_lockdep_inode_acquire(inode, i_rwsem);
  4675	
  4676		if (priv->err) {
  4677			ret = priv->err;
  4678			goto out;
  4679		}
  4680	
  4681		if (priv->compressed) {
  4682			index = 0;
  4683			page_offset = 0;
  4684		} else {
  4685			index = (priv->iocb.ki_pos - priv->start) >> PAGE_SHIFT;
  4686			page_offset = offset_in_page(priv->iocb.ki_pos - priv->start);
  4687		}
  4688		cur = 0;
  4689		while (cur < priv->count) {
  4690			size_t bytes = min_t(size_t, priv->count - cur, PAGE_SIZE - page_offset);
  4691	
  4692			if (copy_page_to_iter(priv->pages[index], page_offset, bytes,
  4693					      &priv->iter) != bytes) {
  4694				ret = -EFAULT;
  4695				goto out;
  4696			}
  4697	
  4698			index++;
  4699			cur += bytes;
  4700			page_offset = 0;
  4701		}
  4702		ret = priv->count;
  4703	
  4704	out:
  4705		unlock_extent(io_tree, priv->start, priv->lockend, &priv->cached_state);
  4706		btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
  4707	
  4708		io_uring_cmd_done(cmd, ret, 0, issue_flags);
  4709		add_rchar(current, ret);
  4710	
  4711		for (index = 0; index < priv->nr_pages; index++)
  4712			__free_page(priv->pages[index]);
  4713	
  4714		kfree(priv->pages);
  4715		kfree(priv->iov);
  4716		if (priv->iou_vec.iovec)
  4717			kfree(priv->iou_vec.iovec);
  4718		kfree(priv);
  4719	}
  4720	
  4721	void btrfs_uring_read_extent_endio(void *ctx, int err)
  4722	{
  4723		struct btrfs_uring_priv *priv = ctx;
  4724		struct io_btrfs_cmd *bc = io_uring_cmd_to_pdu(priv->cmd, struct io_btrfs_cmd);
  4725	
  4726		priv->err = err;
  4727		bc->priv = priv;
  4728	
  4729		io_uring_cmd_complete_in_task(priv->cmd, btrfs_uring_read_finished);
  4730	}
  4731	
  4732	static int btrfs_uring_read_extent(struct kiocb *iocb, struct iov_iter *iter,
  4733					   u64 start, u64 lockend,
  4734					   struct extent_state *cached_state,
  4735					   u64 disk_bytenr, u64 disk_io_size,
  4736					   size_t count, bool compressed,
  4737					   struct iovec *iov, struct io_uring_cmd *cmd,
  4738					   struct iou_vec *iou_vec)
  4739	{
  4740		struct btrfs_inode *inode = BTRFS_I(file_inode(iocb->ki_filp));
  4741		struct extent_io_tree *io_tree = &inode->io_tree;
  4742		struct page **pages;
  4743		struct btrfs_uring_priv *priv = NULL;
  4744		unsigned long nr_pages;
  4745		int ret;
  4746	
  4747		nr_pages = DIV_ROUND_UP(disk_io_size, PAGE_SIZE);
  4748		pages = kcalloc(nr_pages, sizeof(struct page *), GFP_NOFS);
  4749		if (!pages)
  4750			return -ENOMEM;
  4751		ret = btrfs_alloc_page_array(nr_pages, pages, 0);
  4752		if (ret) {
  4753			ret = -ENOMEM;
  4754			goto out_fail;
  4755		}
  4756	
  4757		priv = kmalloc(sizeof(*priv), GFP_NOFS);
  4758		if (!priv) {
  4759			ret = -ENOMEM;
  4760			goto out_fail;
  4761		}
  4762	
  4763		priv->iocb = *iocb;
  4764		priv->iov = iov;
  4765		priv->iter = *iter;
  4766		priv->count = count;
  4767		priv->cmd = cmd;
  4768		priv->cached_state = cached_state;
  4769		priv->compressed = compressed;
  4770		priv->nr_pages = nr_pages;
  4771		priv->pages = pages;
  4772		priv->start = start;
  4773		priv->lockend = lockend;
  4774		priv->err = 0;
  4775		priv->iou_vec = *iou_vec;
  4776	
  4777		ret = btrfs_encoded_read_regular_fill_pages(inode, disk_bytenr,
  4778							    disk_io_size, pages, priv);
  4779		if (ret && ret != -EIOCBQUEUED)
  4780			goto out_fail;
  4781	
  4782		/*
  4783		 * If we return -EIOCBQUEUED, we're deferring the cleanup to
  4784		 * btrfs_uring_read_finished(), which will handle unlocking the extent
  4785		 * and inode and freeing the allocations.
  4786		 */
  4787	
  4788		/*
  4789		 * We're returning to userspace with the inode lock held, and that's
  4790		 * okay - it'll get unlocked in a worker thread.  Call
  4791		 * btrfs_lockdep_inode_release() to avoid confusing lockdep.
  4792		 */
  4793		btrfs_lockdep_inode_release(inode, i_rwsem);
  4794	
  4795		return -EIOCBQUEUED;
  4796	
  4797	out_fail:
  4798		unlock_extent(io_tree, start, lockend, &cached_state);
  4799		btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
  4800		kfree(priv);
  4801		return ret;
  4802	}
  4803	
  4804	struct btrfs_uring_encoded_data {
  4805		struct btrfs_ioctl_encoded_io_args args;
  4806		struct iovec iovstack[UIO_FASTIOV];
  4807		struct iovec *iov;
  4808		struct iov_iter iter;
  4809	};
  4810	
  4811	static int btrfs_uring_encoded_read(struct io_uring_cmd *cmd, unsigned int issue_flags)
  4812	{
  4813		size_t copy_end_kernel = offsetofend(struct btrfs_ioctl_encoded_io_args, flags);
  4814		size_t copy_end;
  4815		int ret;
  4816		u64 disk_bytenr, disk_io_size;
  4817		struct file *file;
  4818		struct btrfs_inode *inode;
  4819		struct btrfs_fs_info *fs_info;
  4820		struct extent_io_tree *io_tree;
  4821		loff_t pos;
  4822		struct kiocb kiocb;
  4823		struct extent_state *cached_state = NULL;
  4824		u64 start, lockend;
  4825		void __user *sqe_addr;
  4826		struct btrfs_uring_encoded_data *data = io_uring_cmd_get_async_data(cmd)->op_data;
> 4827		struct iou_vec iou_vec = {};
  4828	
  4829		if (!capable(CAP_SYS_ADMIN)) {
  4830			ret = -EPERM;
  4831			goto out_acct;
  4832		}
  4833		file = cmd->file;
  4834		inode = BTRFS_I(file->f_inode);
  4835		fs_info = inode->root->fs_info;
  4836		io_tree = &inode->io_tree;
  4837		sqe_addr = u64_to_user_ptr(READ_ONCE(cmd->sqe->addr));
  4838	
  4839		if (issue_flags & IO_URING_F_COMPAT) {
  4840	#if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)
  4841			copy_end = offsetofend(struct btrfs_ioctl_encoded_io_args_32, flags);
  4842	#else
  4843			return -ENOTTY;
  4844	#endif
  4845		} else {
  4846			copy_end = copy_end_kernel;
  4847		}
  4848	
  4849		if (!data) {
  4850			data = kzalloc(sizeof(*data), GFP_NOFS);
  4851			if (!data) {
  4852				ret = -ENOMEM;
  4853				goto out_acct;
  4854			}
  4855	
  4856			io_uring_cmd_get_async_data(cmd)->op_data = data;
  4857	
  4858			if (issue_flags & IO_URING_F_COMPAT) {
  4859	#if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)
  4860				struct btrfs_ioctl_encoded_io_args_32 args32;
  4861	
  4862				if (copy_from_user(&args32, sqe_addr, copy_end)) {
  4863					ret = -EFAULT;
  4864					goto out_acct;
  4865				}
  4866	
  4867				data->args.iov = compat_ptr(args32.iov);
  4868				data->args.iovcnt = args32.iovcnt;
  4869				data->args.offset = args32.offset;
  4870				data->args.flags = args32.flags;
  4871	#endif
  4872			} else {
  4873				if (copy_from_user(&data->args, sqe_addr, copy_end)) {
  4874					ret = -EFAULT;
  4875					goto out_acct;
  4876				}
  4877			}
  4878	
  4879			if (data->args.flags != 0) {
  4880				ret = -EINVAL;
  4881				goto out_acct;
  4882			}
  4883	
  4884			data->iov = data->iovstack;
  4885	
  4886			if (cmd && (cmd->flags & IORING_URING_CMD_FIXED)) {
  4887				ret = io_uring_cmd_import_fixed_vec(
  4888					data->args.iov, data->args.iovcnt, ITER_DEST,
  4889					&data->iter, cmd, &iou_vec, false, issue_flags);
  4890				data->iov = NULL;
  4891			} else {
  4892				ret = import_iovec(ITER_DEST, data->args.iov,
  4893						   data->args.iovcnt,
  4894						   ARRAY_SIZE(data->iovstack),
  4895						   &data->iov, &data->iter);
  4896			}
  4897	
  4898			if (ret < 0)
  4899				goto out_acct;
  4900	
  4901			if (iov_iter_count(&data->iter) == 0) {
  4902				ret = 0;
  4903				goto out_free;
  4904			}
  4905		}
  4906	
  4907		pos = data->args.offset;
  4908		ret = rw_verify_area(READ, file, &pos, data->args.len);
  4909		if (ret < 0)
  4910			goto out_free;
  4911	
  4912		init_sync_kiocb(&kiocb, file);
  4913		kiocb.ki_pos = pos;
  4914	
  4915		if (issue_flags & IO_URING_F_NONBLOCK)
  4916			kiocb.ki_flags |= IOCB_NOWAIT;
  4917	
  4918		start = ALIGN_DOWN(pos, fs_info->sectorsize);
  4919		lockend = start + BTRFS_MAX_UNCOMPRESSED - 1;
  4920	
  4921		ret = btrfs_encoded_read(&kiocb, &data->iter, &data->args, &cached_state,
  4922					 &disk_bytenr, &disk_io_size);
  4923		if (ret < 0 && ret != -EIOCBQUEUED)
  4924			goto out_free;
  4925	
  4926		file_accessed(file);
  4927	
  4928		if (copy_to_user(sqe_addr + copy_end,
  4929				 (const char *)&data->args + copy_end_kernel,
  4930				 sizeof(data->args) - copy_end_kernel)) {
  4931			if (ret == -EIOCBQUEUED) {
  4932				unlock_extent(io_tree, start, lockend, &cached_state);
  4933				btrfs_inode_unlock(inode, BTRFS_ILOCK_SHARED);
  4934			}
  4935			ret = -EFAULT;
  4936			goto out_free;
  4937		}
  4938	
  4939		if (ret == -EIOCBQUEUED) {
  4940			u64 count = min_t(u64, iov_iter_count(&data->iter), disk_io_size);
  4941	
  4942			/* Match ioctl by not returning past EOF if uncompressed. */
  4943			if (!data->args.compression)
  4944				count = min_t(u64, count, data->args.len);
  4945	
  4946			ret = btrfs_uring_read_extent(&kiocb, &data->iter, start, lockend,
  4947						      cached_state, disk_bytenr, disk_io_size,
  4948						      count, data->args.compression,
  4949						      data->iov, cmd, &iou_vec);
  4950	
  4951			goto out_acct;
  4952		}
  4953	
  4954	out_free:
  4955		kfree(data->iov);
  4956	
  4957	out_acct:
  4958		if (ret > 0)
  4959			add_rchar(current, ret);
  4960		inc_syscr(current);
  4961	
  4962		return ret;
  4963	}
  4964	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

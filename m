Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A7639DBEB;
	Fri, 10 Apr 2026 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775822320; cv=none; b=tUueNd0Uc8d8L9JMgLxcam7OwW7bvF1G+JLKfFBHRB5yo9Z75e1Nd2dXg40UIROKQerFldREaX+CJrkDDEXJPnfUKsttwiqzFGimnmWjqvAmOmuo1ZGSLatvSST5895hYYz+3EBHCbzUZlnHP72dD53ucQV9wMglOF5RoB6GMAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775822320; c=relaxed/simple;
	bh=mE/mJ7ssgrHJWy0XO+nJwqerIb+kkzRjBF3/oJXiM9o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cnm7y5FtUk/uj1KWQ6rdCjT5J/1DukJ2zQg2L0sbxuj5uMDndIrBHcb7weVgrQ1l5TUkPsI2LelY1Qc5m+O3HV5fDGVfmkIlSTnWllbxsUpImCzlb1p6v/vnwyxyzFy9L7HxnL8qM0IeLD/vkdCGdv4TBJsxkNqgfGcfEpB53DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YaYw2Znn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YaYw2Znn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775822318; x=1807358318;
  h=date:from:to:cc:subject:message-id;
  bh=mE/mJ7ssgrHJWy0XO+nJwqerIb+kkzRjBF3/oJXiM9o=;
  b=YaYw2Znnm185nCnbadDr5p/u5eKLUjhkSqiLVu5DOYqeb+2z8LOa92Pb
   r2Cy3N/ZOHVPbr4gyOHSKy1dY7vkdbr0h8Bw1FkdNR/S40KOBo+wZ4x1K
   jT0sR+ELDQYgBHsFfs+cbrSgf0TpE+O9S65siCOJNxjhsmHInD5uOqmyt
   lNZox9MnX5WaMhi7ODyewRzrnB+BwI0gvMJbCD9ruckfuPoSjOyswPeos
   rqjpXyVpIm52tt3TQSGaq6+chaimPCGgtztGNh5tWDDyJkfja0k9tt3V0
   v47CkkYwME+OFR44bSV64GJ3wf3eD72vFA47xHxifN4KYh5dWyZcYvY9p
   w==;
X-CSE-ConnectionGUID: Hd8NYkyxRlKP3Qt+IC9R7Q==
X-CSE-MsgGUID: yKXj+0pnT1iScZs+63UgjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76857254"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76857254"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:58:35 -0700
X-CSE-ConnectionGUID: sj0bT00LS2uYqcpc+ZIozw==
X-CSE-MsgGUID: VaqhSpHiSrSFFWgCct8Tag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252433284"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 04:58:33 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBAVK-000000003g5-2dAQ;
	Fri, 10 Apr 2026 11:58:30 +0000
Date: Fri, 10 Apr 2026 19:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <tom.leiming@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>
Subject: [axboe:for-7.1/block 80/87]
 drivers/block/ublk_drv.c:5364:20: warning: result of comparison of constant
 4294967296 with expression of type 'unsigned long' is always false
Message-ID: <202604101952.3NOzqnu9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.1/block
head:   539fb773a3f7c07cf7fd00617f33ed4e33058d72
commit: 23b3b6f0b584b70a427d5bb826d320151890d7da [80/87] ublk: widen ublk_shmem_buf_reg.len to __u64 for 4GB buffer support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260410/202604101952.3NOzqnu9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101952.3NOzqnu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101952.3NOzqnu9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/ublk_drv.c:5364:20: warning: result of comparison of constant 4294967296 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
    5364 |         if (!size || size > UBLK_SHMEM_BUF_SIZE_MAX ||
         |                      ~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +5364 drivers/block/ublk_drv.c

  5326	
  5327	/*
  5328	 * Register a shared memory buffer for zero-copy I/O.
  5329	 * Pins pages, builds PFN maple tree, freezes/unfreezes the queue
  5330	 * internally. Returns buffer index (>= 0) on success.
  5331	 */
  5332	static int ublk_ctrl_reg_buf(struct ublk_device *ub,
  5333				     struct ublksrv_ctrl_cmd *header)
  5334	{
  5335		void __user *argp = (void __user *)(unsigned long)header->addr;
  5336		struct ublk_shmem_buf_reg buf_reg;
  5337		unsigned long addr, size, nr_pages;
  5338		struct page **pages = NULL;
  5339		unsigned int gup_flags;
  5340		struct gendisk *disk;
  5341		struct ublk_buf *ubuf;
  5342		long pinned;
  5343		u32 index;
  5344		int ret;
  5345	
  5346		if (!ublk_dev_support_shmem_zc(ub))
  5347			return -EOPNOTSUPP;
  5348	
  5349		memset(&buf_reg, 0, sizeof(buf_reg));
  5350		if (copy_from_user(&buf_reg, argp,
  5351				   min_t(size_t, header->len, sizeof(buf_reg))))
  5352			return -EFAULT;
  5353	
  5354		if (buf_reg.flags & ~UBLK_SHMEM_BUF_READ_ONLY)
  5355			return -EINVAL;
  5356	
  5357		if (buf_reg.reserved)
  5358			return -EINVAL;
  5359	
  5360		addr = buf_reg.addr;
  5361		size = buf_reg.len;
  5362		nr_pages = size >> PAGE_SHIFT;
  5363	
> 5364		if (!size || size > UBLK_SHMEM_BUF_SIZE_MAX ||
  5365		    !PAGE_ALIGNED(size) || !PAGE_ALIGNED(addr))
  5366			return -EINVAL;
  5367	
  5368		disk = ublk_get_disk(ub);
  5369		if (!disk)
  5370			return -ENODEV;
  5371	
  5372		/* Pin pages before quiescing (may sleep) */
  5373		ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
  5374		if (!ubuf) {
  5375			ret = -ENOMEM;
  5376			goto put_disk;
  5377		}
  5378	
  5379		pages = kvmalloc_array(nr_pages, sizeof(*pages), GFP_KERNEL);
  5380		if (!pages) {
  5381			ret = -ENOMEM;
  5382			goto err_free;
  5383		}
  5384	
  5385		gup_flags = FOLL_LONGTERM;
  5386		if (!(buf_reg.flags & UBLK_SHMEM_BUF_READ_ONLY))
  5387			gup_flags |= FOLL_WRITE;
  5388	
  5389		pinned = pin_user_pages_fast(addr, nr_pages, gup_flags, pages);
  5390		if (pinned < 0) {
  5391			ret = pinned;
  5392			goto err_free_pages;
  5393		}
  5394		if (pinned != nr_pages) {
  5395			ret = -EFAULT;
  5396			goto err_unpin;
  5397		}
  5398		ubuf->nr_pages = nr_pages;
  5399	
  5400		/*
  5401		 * Drain inflight I/O and quiesce the queue so no new requests
  5402		 * are dispatched while we modify the maple tree. Keep freeze
  5403		 * and mutex non-nested to avoid lock dependency.
  5404		 */
  5405		ublk_quiesce_and_release(disk);
  5406	
  5407		mutex_lock(&ub->mutex);
  5408	
  5409		ret = xa_alloc(&ub->bufs_xa, &index, ubuf, xa_limit_16b, GFP_KERNEL);
  5410		if (ret)
  5411			goto err_unlock;
  5412	
  5413		ret = __ublk_ctrl_reg_buf(ub, ubuf, pages, index, buf_reg.flags);
  5414		if (ret) {
  5415			xa_erase(&ub->bufs_xa, index);
  5416			goto err_unlock;
  5417		}
  5418	
  5419		mutex_unlock(&ub->mutex);
  5420	
  5421		kvfree(pages);
  5422		ublk_unquiesce_and_resume(disk);
  5423		ublk_put_disk(disk);
  5424		return index;
  5425	
  5426	err_unlock:
  5427		mutex_unlock(&ub->mutex);
  5428		ublk_unquiesce_and_resume(disk);
  5429	err_unpin:
  5430		unpin_user_pages(pages, pinned);
  5431	err_free_pages:
  5432		kvfree(pages);
  5433	err_free:
  5434		kfree(ubuf);
  5435	put_disk:
  5436		ublk_put_disk(disk);
  5437		return ret;
  5438	}
  5439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB5828FD;
	Thu, 11 Apr 2024 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712841155; cv=none; b=hpyv8jwI4lYdn2DB4gViroY+ryfiGJ06qZbW3VQSoM6QTyGV+qUe90oo7lPzoy5xqVsZa3cITqd3vJKlpvgMxEdZjPkhMvZd4mnE/rFwel0dwLAzz4WKghWJL9tQ6RI2CgOVaqUHMIrMoI+4JbvzORvalu3bqOqi+JvdTHkXUPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712841155; c=relaxed/simple;
	bh=6jWALG/0GeQr3sgh4U39X/vqP7I/qGQuzIrJ0LkrsAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNs3s0iBJlIMG/J/1AzzCOhqLS/6d0zqgWIxb58cNrh0WqNOBF33El8JLeAxBUd6eGRorvm7y2rY30+0Qf62a2xW1FT6e6/HV7lCxg5AKRnRzJFsUk6lGqMxbu17zVkO2xO6zyGdMx1B8zJXV+RowRzj/EVMbyhcsQCwXiJt5h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lpw4Jpp9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lpw4Jpp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712841153; x=1744377153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6jWALG/0GeQr3sgh4U39X/vqP7I/qGQuzIrJ0LkrsAM=;
  b=Lpw4Jpp91AQyeLlSK0p4KZnM6P+4+7VRKsvxeO6EMbRMAR8O8xh5YYUr
   +pdyMtVqvJsrljJ2+B+B+1ymvhWKY2QK3Y+rM83ZaQST2D+m/33GbJlbB
   hvDuqmwJpJSxzK5vSYQ+muuQ5jg2zoK9BLRmq4xQ4faYqQacgUnsrIGm9
   wX7tyeS1XL41Mbp8FpbSh1LfcNgEgeQuOTlJoCYjH+Pgf8UAgsG3ZJ+xR
   TLGnvtgDwupDxsfcQJ6BKm6Um6RH9wK68SZCAKISTKA01IoKOddhjPKYL
   iOnO9eKj6X3AwhR7hmLm9pLImOqJfg7atB4sJmsp+IQuJPhPEMOBhmbKY
   A==;
X-CSE-ConnectionGUID: sFlf+DW0T+eIBlMAV9xC1w==
X-CSE-MsgGUID: jOtyOeolQAGB4OOPLJZUeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8103635"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8103635"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 06:12:32 -0700
X-CSE-ConnectionGUID: k/28Xh8SSSakOEdflrloxA==
X-CSE-MsgGUID: sc8JA6qkQfWdHcAvS7l84g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="21398867"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2024 06:12:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruuE9-0008dd-00;
	Thu, 11 Apr 2024 13:12:29 +0000
Date: Thu, 11 Apr 2024 21:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 205/415] drivers/misc/cxl/file.c:422:9: error:
 conflicting types for 'afu_read'
Message-ID: <202404112138.TKDNBBBS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2cdbd541e4481cb9cbd08913e0586dc8a2570aec
commit: 2ff4bdb9c46f5a8cb1b473cd9fa7ca74a1c675d4 [205/415] misc: cxl: convert to read/write iterators
config: powerpc64-randconfig-001-20240411 (https://download.01.org/0day-ci/archive/20240411/202404112138.TKDNBBBS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112138.TKDNBBBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112138.TKDNBBBS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/misc/cxl/file.c:15:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/cxl/file.c:422:9: error: conflicting types for 'afu_read'
     422 | ssize_t afu_read(struct kiocb *iocb, struct iov_iter *to)
         |         ^
   drivers/misc/cxl/cxl.h:1048:9: note: previous declaration is here
    1048 | ssize_t afu_read(struct file *file, char __user *buf, size_t count, loff_t *off);
         |         ^
>> drivers/misc/cxl/file.c:508:37: error: use of undeclared identifier 'buf'
     508 |                 return afu_driver_event_copy(ctx, buf, &event, pl);
         |                                                   ^
>> drivers/misc/cxl/file.c:528:15: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t *)' (aka 'long (struct file *, char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
     528 |         .read_iter      = afu_read,
         |                           ^~~~~~~~
   drivers/misc/cxl/file.c:539:15: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'long (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'ssize_t (struct file *, char *, size_t, loff_t *)' (aka 'long (struct file *, char *, unsigned long, long long *)') [-Wincompatible-function-pointer-types]
     539 |         .read_iter      = afu_read,
         |                           ^~~~~~~~
   4 warnings and 4 errors generated.


vim +/afu_read +422 drivers/misc/cxl/file.c

   421	
 > 422	ssize_t afu_read(struct kiocb *iocb, struct iov_iter *to)
   423	{
   424		struct cxl_context *ctx = iocb->ki_filp->private_data;
   425		struct cxl_event_afu_driver_reserved *pl = NULL;
   426		size_t count = iov_iter_count(to);
   427		struct cxl_event event;
   428		unsigned long flags;
   429		int rc;
   430		DEFINE_WAIT(wait);
   431	
   432		if (!cxl_ops->link_ok(ctx->afu->adapter, ctx->afu))
   433			return -EIO;
   434	
   435		if (count < CXL_READ_MIN_SIZE)
   436			return -EINVAL;
   437	
   438		spin_lock_irqsave(&ctx->lock, flags);
   439	
   440		for (;;) {
   441			prepare_to_wait(&ctx->wq, &wait, TASK_INTERRUPTIBLE);
   442			if (ctx_event_pending(ctx) || (ctx->status == CLOSED))
   443				break;
   444	
   445			if (!cxl_ops->link_ok(ctx->afu->adapter, ctx->afu)) {
   446				rc = -EIO;
   447				goto out;
   448			}
   449	
   450			if (iocb->ki_filp->f_flags & O_NONBLOCK) {
   451				rc = -EAGAIN;
   452				goto out;
   453			}
   454	
   455			if (signal_pending(current)) {
   456				rc = -ERESTARTSYS;
   457				goto out;
   458			}
   459	
   460			spin_unlock_irqrestore(&ctx->lock, flags);
   461			pr_devel("afu_read going to sleep...\n");
   462			schedule();
   463			pr_devel("afu_read woken up\n");
   464			spin_lock_irqsave(&ctx->lock, flags);
   465		}
   466	
   467		finish_wait(&ctx->wq, &wait);
   468	
   469		memset(&event, 0, sizeof(event));
   470		event.header.process_element = ctx->pe;
   471		event.header.size = sizeof(struct cxl_event_header);
   472		if (ctx->afu_driver_ops && atomic_read(&ctx->afu_driver_events)) {
   473			pr_devel("afu_read delivering AFU driver specific event\n");
   474			pl = ctx->afu_driver_ops->fetch_event(ctx);
   475			atomic_dec(&ctx->afu_driver_events);
   476			event.header.type = CXL_EVENT_AFU_DRIVER;
   477		} else if (ctx->pending_irq) {
   478			pr_devel("afu_read delivering AFU interrupt\n");
   479			event.header.size += sizeof(struct cxl_event_afu_interrupt);
   480			event.header.type = CXL_EVENT_AFU_INTERRUPT;
   481			event.irq.irq = find_first_bit(ctx->irq_bitmap, ctx->irq_count) + 1;
   482			clear_bit(event.irq.irq - 1, ctx->irq_bitmap);
   483			if (bitmap_empty(ctx->irq_bitmap, ctx->irq_count))
   484				ctx->pending_irq = false;
   485		} else if (ctx->pending_fault) {
   486			pr_devel("afu_read delivering data storage fault\n");
   487			event.header.size += sizeof(struct cxl_event_data_storage);
   488			event.header.type = CXL_EVENT_DATA_STORAGE;
   489			event.fault.addr = ctx->fault_addr;
   490			event.fault.dsisr = ctx->fault_dsisr;
   491			ctx->pending_fault = false;
   492		} else if (ctx->pending_afu_err) {
   493			pr_devel("afu_read delivering afu error\n");
   494			event.header.size += sizeof(struct cxl_event_afu_error);
   495			event.header.type = CXL_EVENT_AFU_ERROR;
   496			event.afu_error.error = ctx->afu_err;
   497			ctx->pending_afu_err = false;
   498		} else if (ctx->status == CLOSED) {
   499			pr_devel("afu_read fatal error\n");
   500			spin_unlock_irqrestore(&ctx->lock, flags);
   501			return -EIO;
   502		} else
   503			WARN(1, "afu_read must be buggy\n");
   504	
   505		spin_unlock_irqrestore(&ctx->lock, flags);
   506	
   507		if (event.header.type == CXL_EVENT_AFU_DRIVER)
 > 508			return afu_driver_event_copy(ctx, buf, &event, pl);
   509	
   510		if (!copy_to_iter_full(&event, event.header.size, to))
   511			return -EFAULT;
   512		return event.header.size;
   513	
   514	out:
   515		finish_wait(&ctx->wq, &wait);
   516		spin_unlock_irqrestore(&ctx->lock, flags);
   517		return rc;
   518	}
   519	
   520	/* 
   521	 * Note: if this is updated, we need to update api.c to patch the new ones in
   522	 * too
   523	 */
   524	const struct file_operations afu_fops = {
   525		.owner		= THIS_MODULE,
   526		.open           = afu_open,
   527		.poll		= afu_poll,
 > 528		.read_iter	= afu_read,
   529		.release        = afu_release,
   530		.unlocked_ioctl = afu_ioctl,
   531		.compat_ioctl   = afu_compat_ioctl,
   532		.mmap           = afu_mmap,
   533	};
   534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9191FA21;
	Sun, 18 Jun 2023 06:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687070230; x=1718606230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1qhO3RODYrWAdMnMdiLCilqlI2D2BthhK99I/FhNJ4U=;
  b=fdJW7378ZY+cLIGYkE26C6R0LZvwub0Z9g1gQ3swAl8OR1PeAZpekud6
   ON0/WH/TgluhQI7JEKNYNR/1QGkS2KAz2DQcFJIUZJLh274LY9ccN3cq3
   mO/YYlK5mNd44vdHe8xNg46CdcMEyAajvcNIBV7wPnT3QwrmvM1q+eSeC
   anYBRGbKfOi69sFJRKAFbTxvi/W1GdOmqV6MFazn90fIS460/rwhQY/p0
   FIy42dnIT1tFAWfnilCUf9J71+X6pzOuTOjJaY3uw0NHgf6Sk8dy30xxL
   PZRJVos+ymI8l/UxZi88szAHHUQrDOkhjONCq3Z9xdRONMjFhbnsJAKRx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="349170161"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="349170161"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 23:37:09 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="747010152"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="747010152"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jun 2023 23:37:07 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAm26-0003VY-2e;
	Sun, 18 Jun 2023 06:37:06 +0000
Date: Sun, 18 Jun 2023 14:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-20230616-hacks 3/38] block/fops.c:604:11:
 error: no member named 'backing_dev_info' in 'struct task_struct'
Message-ID: <202306181459.ybZNx5Ki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230616-hacks
head:   5416cb31017b28b25627f4f5b8292af96bb65f58
commit: 62bfaecc35641804b36660d656020acd8fc4672d [3/38] block: open code __generic_file_write_iter for blkdev writes
config: x86_64-randconfig-a003-20230616 (https://download.01.org/0day-ci/archive/20230618/202306181459.ybZNx5Ki-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181459.ybZNx5Ki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181459.ybZNx5Ki-lkp@intel.com/

Note: the mcgrof-next/large-block-20230616-hacks HEAD 5416cb31017b28b25627f4f5b8292af96bb65f58 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> block/fops.c:604:11: error: no member named 'backing_dev_info' in 'struct task_struct'
           current->backing_dev_info = bdev->bd_disk->bdi;
           ~~~~~~~  ^
   block/fops.c:613:11: error: no member named 'backing_dev_info' in 'struct task_struct'
           current->backing_dev_info = NULL;
           ~~~~~~~  ^
   2 errors generated.


vim +604 block/fops.c

   558	
   559	/*
   560	 * Write data to the block device.  Only intended for the block device itself
   561	 * and the raw driver which basically is a fake block device.
   562	 *
   563	 * Does not take i_mutex for the write and thus is not for general purpose
   564	 * use.
   565	 */
   566	static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
   567	{
   568		struct block_device *bdev = I_BDEV(iocb->ki_filp->f_mapping->host);
   569		struct file *file = iocb->ki_filp;
   570		struct inode *bd_inode = bdev->bd_inode;
   571		loff_t size = bdev_nr_bytes(bdev);
   572		size_t shorted = 0;
   573		ssize_t ret;
   574	
   575		if (bdev_read_only(bdev))
   576			return -EPERM;
   577	
   578		if (IS_SWAPFILE(bd_inode) && !is_hibernate_resume_dev(bd_inode->i_rdev))
   579			return -ETXTBSY;
   580	
   581		if (!iov_iter_count(from))
   582			return 0;
   583	
   584		if (iocb->ki_pos >= size)
   585			return -ENOSPC;
   586	
   587		if ((iocb->ki_flags & (IOCB_NOWAIT | IOCB_DIRECT)) == IOCB_NOWAIT)
   588			return -EOPNOTSUPP;
   589	
   590		ret = file_remove_privs(file);
   591		if (ret)
   592			return ret;
   593	
   594		ret = file_update_time(file);
   595		if (ret)
   596			return ret;
   597	
   598		size -= iocb->ki_pos;
   599		if (iov_iter_count(from) > size) {
   600			shorted = iov_iter_count(from) - size;
   601			iov_iter_truncate(from, size);
   602		}
   603	
 > 604		current->backing_dev_info = bdev->bd_disk->bdi;
   605		if (iocb->ki_flags & IOCB_DIRECT) {
   606			ret = blkdev_direct_write(iocb, from);
   607			if (ret >= 0 && iov_iter_count(from))
   608				ret = direct_write_fallback(iocb, from, ret,
   609						generic_perform_write(iocb, from));
   610		} else {
   611			ret = generic_perform_write(iocb, from);
   612		}
   613		current->backing_dev_info = NULL;
   614	
   615		if (ret > 0)
   616			ret = generic_write_sync(iocb, ret);
   617		iov_iter_reexpand(from, iov_iter_count(from) + shorted);
   618		return ret;
   619	}
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A833E305E01;
	Tue,  4 Nov 2025 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762249450; cv=none; b=P76DXC+d6a1RbuGe1souEJnVVHN6mO94gLxTkgLpvWMRHsAN1NSS7w0lNCAARznMSzYwWn32SSKAxCDyA8n08dsN9TSg0JUldbOfMtnH+sgOjuqFTneiXxHLKgy/B3ssHI8FaPDzmcxoNjuDaeWMLkApebKil8bf/q/apie0YAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762249450; c=relaxed/simple;
	bh=oJLH3QxltSjXqw9VFcrwEOsDkMdy/+3c5tR6NFv/jx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7eKxI3booa5KDri6nSrpb5kb2SjzJW1axh/uqp4lGA6Dl0ZDliyUBGIIsY+9zuuBHxEk11QN8931RsRi7qiXQtbzXA93ZQsLwbW4FfYWe2yrNb9/35U7c/PmjXBdPHbWusO/siiai2mYnzNsZvhq7vK9JrJz1BKDm5upYiBspU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmuTQzkN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmuTQzkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762249448; x=1793785448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oJLH3QxltSjXqw9VFcrwEOsDkMdy/+3c5tR6NFv/jx0=;
  b=XmuTQzkNsto5xT2SMZZvj87J4Qrk8/1XMWeYnf0l5WOCwQ1zZX0Y7eGk
   MIdR0D8CqBPRQfKRacEbmF5RCil8+k/h2xs/PbnDRHzYgrUZgLVs4DweD
   b3soXSzBIldsbxokGZLzKJUaS08+5tFKEquvehlLu5wuqPXklp72Nxzje
   F3wdmgcbK2pWi0AzBhoEhFv0YCQ6xghVjykxRu6ETaKHpbElPd+ZpOMKr
   nc80vE/JEoWN3acMxmAy30rNqG87DWSvUk1m5CohsPVkwl5X1px9DhcEQ
   tDt4Sh1zrgmfrz47tncQjlo9pnm9fxNoSo78aW+wOXkHG28ISRQlpl2x1
   w==;
X-CSE-ConnectionGUID: ddkXzJk+Q1+GYtXrwhNgzQ==
X-CSE-MsgGUID: 6TbFzXKoRlGGmYv03qsbBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64436971"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="64436971"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 01:44:06 -0800
X-CSE-ConnectionGUID: XIslrqBITE27+526Qkt9AQ==
X-CSE-MsgGUID: Ip8r9d9PRXylvFxA9lgghQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="192202968"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2025 01:44:05 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGDa7-000RDy-0N;
	Tue, 04 Nov 2025 09:44:03 +0000
Date: Tue, 4 Nov 2025 17:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>
Subject: [brauner-github:kernel-6.19.cred 12/39] fs/backing-file.c:209:9:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202511041731.OPKyrqmX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git kernel-6.19.cred
head:   59e578cf86c391d6595e005247ebefd4f371242c
commit: b9455f57e32048146ad5b98fb477b96eba6e8ffd [12/39] backing-file: use credential guards for reads
config: hexagon-randconfig-002-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041731.OPKyrqmX-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041731.OPKyrqmX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041731.OPKyrqmX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/backing-file.c:209:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
           return ret;
                  ^~~
   fs/backing-file.c:191:13: note: initialize the variable 'ret' to silence this warning
           ssize_t ret;
                      ^
                       = 0
   1 warning generated.


vim +/ret +209 fs/backing-file.c

b9455f57e320481 Christian Brauner 2025-11-03  186  
b9455f57e320481 Christian Brauner 2025-11-03  187  ssize_t backing_file_read_iter(struct file *file, struct iov_iter *iter,
b9455f57e320481 Christian Brauner 2025-11-03  188  			       struct kiocb *iocb, int flags,
b9455f57e320481 Christian Brauner 2025-11-03  189  			       struct backing_file_ctx *ctx)
b9455f57e320481 Christian Brauner 2025-11-03  190  {
b9455f57e320481 Christian Brauner 2025-11-03  191  	ssize_t ret;
b9455f57e320481 Christian Brauner 2025-11-03  192  
b9455f57e320481 Christian Brauner 2025-11-03  193  	if (WARN_ON_ONCE(!(file->f_mode & FMODE_BACKING)))
b9455f57e320481 Christian Brauner 2025-11-03  194  		return -EIO;
b9455f57e320481 Christian Brauner 2025-11-03  195  
b9455f57e320481 Christian Brauner 2025-11-03  196  	if (!iov_iter_count(iter))
b9455f57e320481 Christian Brauner 2025-11-03  197  		return 0;
b9455f57e320481 Christian Brauner 2025-11-03  198  
b9455f57e320481 Christian Brauner 2025-11-03  199  	if (iocb->ki_flags & IOCB_DIRECT &&
b9455f57e320481 Christian Brauner 2025-11-03  200  	    !(file->f_mode & FMODE_CAN_ODIRECT))
b9455f57e320481 Christian Brauner 2025-11-03  201  		return -EINVAL;
b9455f57e320481 Christian Brauner 2025-11-03  202  
b9455f57e320481 Christian Brauner 2025-11-03  203  	scoped_with_creds(ctx->cred)
b9455f57e320481 Christian Brauner 2025-11-03  204  		do_backing_file_read_iter(file, iter, iocb, flags);
a6293b3e285cd0d Amir Goldstein    2023-11-22  205  
a6293b3e285cd0d Amir Goldstein    2023-11-22  206  	if (ctx->accessed)
48b50624aec454c Miklos Szeredi    2024-10-21  207  		ctx->accessed(iocb->ki_filp);
a6293b3e285cd0d Amir Goldstein    2023-11-22  208  
a6293b3e285cd0d Amir Goldstein    2023-11-22 @209  	return ret;
a6293b3e285cd0d Amir Goldstein    2023-11-22  210  }
a6293b3e285cd0d Amir Goldstein    2023-11-22  211  EXPORT_SYMBOL_GPL(backing_file_read_iter);
a6293b3e285cd0d Amir Goldstein    2023-11-22  212  

:::::: The code at line 209 was first introduced by commit
:::::: a6293b3e285cd0d7692141d7981a5f144f0e2f0b fs: factor out backing_file_{read,write}_iter() helpers

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Amir Goldstein <amir73il@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

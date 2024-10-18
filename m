Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B4E20494E;
	Fri, 18 Oct 2024 18:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729277165; cv=none; b=MaQTgLA5ChIIDy77UT0G2i6PXUxZF5X/9cFhjP0D+eWJRoUxvGf+BpR4E4TlQBzH0gfV+qr+VM6LKyfDwQu97HFnpZ6YiAEUyj0Uw2Kw4Z+jaU6k9mkXkSrFQ8JJ+kdSnMKA03yW1hUM42MyiDIueb9zc78Z/nTJf39n1I05x58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729277165; c=relaxed/simple;
	bh=phEX9ymVimk2sUfotD4QxcaLIVr47XMFLKtpw5UFHlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRvwYH0H5uB6rDlf7haYBhj0ypBcyccpqHxNrTxETByp4tipOqDkLD2AAoDIWkQY2FW1AsLuh954eNBsUKrsjIdzIPlPddT73T/59kWXydVnoU8H97XL89nnGMDeR1oXyy0iW01soQHlTyCQNtBu7l8TpNWqMaWc+Q2p2XuN9Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IzK/5pTo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IzK/5pTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729277163; x=1760813163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=phEX9ymVimk2sUfotD4QxcaLIVr47XMFLKtpw5UFHlw=;
  b=IzK/5pToJipZCDsVrrvcPE2Xm3ouN5nd+y2WtV1CmiBwhO0H2QFDHqxu
   Qxbx37yoTE3FZWjTcXXir+SZn/eRgfseMpu4QAD0IKV04UMsT1XyDmtIA
   rLD4fvJDtYCav4hSTAcvfQNDbY+VILDdCycFiF6BdtLQjdRjHYLM0K+wu
   l/u3WXDudLDAf7ufIOsMxBZh8rtKNXrCd/FFCjDYNKwR+sIhn7mg9AaZU
   HhIUT/a/J68cxnRSkrFfhU6mkaEtqfChaZxvdWaA19cjVOet0MoWUcFW/
   EGpMsKuI7P0D5SysmkxjVnG9ZLQ6VvyUJ17bXeftbazR2TVw5C84gA0Af
   Q==;
X-CSE-ConnectionGUID: FFS9o1ElQFuA+F9JPrIERw==
X-CSE-MsgGUID: 3Mmt8Hi3QTmqURg93SAakg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40182400"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="40182400"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 11:45:59 -0700
X-CSE-ConnectionGUID: gfyqjxktSYqWipjgpQmU9g==
X-CSE-MsgGUID: 8/lcsv35T3iOGWVLfp224w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="83571247"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Oct 2024 11:45:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1rz1-000OBt-2L;
	Fri, 18 Oct 2024 18:45:55 +0000
Date: Sat, 19 Oct 2024 02:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ming Lei <ming.lei@redhat.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] block: model freeze & enter queue as rwsem for
 supporting lockdep
Message-ID: <202410190214.KgZovHXy-lkp@intel.com>
References: <20241018013542.3013963-1-ming.lei@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018013542.3013963-1-ming.lei@redhat.com>

Hi Ming,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/block-model-freeze-enter-queue-as-rwsem-for-supporting-lockdep/20241018-093704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20241018013542.3013963-1-ming.lei%40redhat.com
patch subject: [PATCH] block: model freeze & enter queue as rwsem for supporting lockdep
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241019/202410190214.KgZovHXy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190214.KgZovHXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190214.KgZovHXy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq.c:125:6: warning: variable 'sub_class' set but not used [-Wunused-but-set-variable]
     125 |         int sub_class;
         |             ^
   1 warning generated.


vim +/sub_class +125 block/blk-mq.c

   122	
   123	void blk_freeze_queue_start(struct request_queue *q)
   124	{
 > 125		int sub_class;
   126	
   127		mutex_lock(&q->mq_freeze_lock);
   128		sub_class = q->mq_freeze_depth;
   129		if (++q->mq_freeze_depth == 1) {
   130			percpu_ref_kill(&q->q_usage_counter);
   131			mutex_unlock(&q->mq_freeze_lock);
   132			if (queue_is_mq(q))
   133				blk_mq_run_hw_queues(q, false);
   134		} else {
   135			mutex_unlock(&q->mq_freeze_lock);
   136		}
   137		/*
   138		 * model as down_write_trylock() so that two concurrent freeze queue
   139		 * can be allowed
   140		 */
   141		if (blk_queue_freeze_lockdep(q))
   142			rwsem_acquire(&q->q_usage_counter_map, sub_class, 1, _RET_IP_);
   143	}
   144	EXPORT_SYMBOL_GPL(blk_freeze_queue_start);
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E85F28C009;
	Tue, 17 Jun 2025 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164572; cv=none; b=fumDoU2lQi31pJg1/JEvHvpLgPCe9lsHVcedYghHNIWSW3Adfvx2l4Szu4I3MsIGLEbv1CHDIKFuNXSKHyU0NepguXKAMwPhkZ5S3xeyVe/rP8Alqais3C0q3+6EOZTWk/MTerc/VKeHWLX0rsuo0IIJE0xiH3kb9HtgK2IfeDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164572; c=relaxed/simple;
	bh=D+LcSyS0PK5Nc7olf/xwZi2RS4RgAvmr4qgTE2QM/kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJxUc+gvMsLznS6i2IkeiJmIe2xdBuYCk9W1nR0CW0mcQrXdxiilW2u1cuLc0NgvGustoKHdXQ1JvVcfB7P1QrC9Ez5NL/2NN9ugdbzu4QosKYJd7+jYRTqSarEDJSkHXdUO7H2s/st+7ZuFiHPYxC1vGDQ2xLVTZvXd3giROhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCi4ChGF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCi4ChGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750164571; x=1781700571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D+LcSyS0PK5Nc7olf/xwZi2RS4RgAvmr4qgTE2QM/kY=;
  b=nCi4ChGFasruKVGC6gaGtTD55RtUHbN6TxofqWOKo9zGnxJwiFGyuIY+
   8CJW1ZwZngREXTBprDLWHPQw7q6HgiQYtBmxMZlE9XJWbTEb8HKArmewJ
   b7ynn+y5hR6V4Hr3Ttbwrp4n9t2h5Qfdbm+j2HVp0kNecDpjHqbQB+xcP
   bYlOFhFIdbGp3f28ZwvAJzqsvcffsBcw1TaIsX723I8MOM1PH2o29avhM
   jUL1x3adVITOYZLj4GnDggLZ2aWnFomT2eGPJYHgIr25YFpaoa8IVo4E1
   bPYIk6zGt2ZCoIs9HR86DOmJSMSzogWuDemran0H2iaaZEJwZc29XvH9k
   A==;
X-CSE-ConnectionGUID: CLoRsQKSS0+finGOWrXIYQ==
X-CSE-MsgGUID: iepbJrxdSIuOu1LmIp7NoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51567134"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="51567134"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:49:30 -0700
X-CSE-ConnectionGUID: G1s732f5ROaxIR6lSh7XDQ==
X-CSE-MsgGUID: gT/oVb7sRdSd5AswM69nGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="186026479"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jun 2025 05:49:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRVkk-000Fyk-2C;
	Tue, 17 Jun 2025 12:49:26 +0000
Date: Tue, 17 Jun 2025 20:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v18 05/12] blk-zoned: Add an argument to
 blk_zone_plug_bio()
Message-ID: <202506172033.GPdkXO1C-lkp@intel.com>
References: <20250616223312.1607638-6-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616223312.1607638-6-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on jejb-scsi/for-next mkp-scsi/for-next linus/master v6.16-rc2 next-20250617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/block-Support-block-drivers-that-preserve-the-order-of-write-requests/20250617-063905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250616223312.1607638-6-bvanassche%40acm.org
patch subject: [PATCH v18 05/12] blk-zoned: Add an argument to blk_zone_plug_bio()
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20250617/202506172033.GPdkXO1C-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506172033.GPdkXO1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506172033.GPdkXO1C-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-mq.c:3187:63: error: too many arguments to function call, expected 2, have 3
    3187 |         if (blk_queue_is_zoned(q) && blk_zone_plug_bio(bio, nr_segs, &from_cpu))
         |                                      ~~~~~~~~~~~~~~~~~               ^~~~~~~~~
   include/linux/blkdev.h:874:20: note: 'blk_zone_plug_bio' declared here
     874 | static inline bool blk_zone_plug_bio(struct bio *bio, unsigned int nr_segs)
         |                    ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +3187 block/blk-mq.c

  3122	
  3123	/**
  3124	 * blk_mq_submit_bio - Create and send a request to block device.
  3125	 * @bio: Bio pointer.
  3126	 *
  3127	 * Builds up a request structure from @q and @bio and send to the device. The
  3128	 * request may not be queued directly to hardware if:
  3129	 * * This request can be merged with another one
  3130	 * * We want to place request at plug queue for possible future merging
  3131	 * * There is an IO scheduler active at this queue
  3132	 *
  3133	 * It will not queue the request if there is an error with the bio, or at the
  3134	 * request creation.
  3135	 */
  3136	void blk_mq_submit_bio(struct bio *bio)
  3137	{
  3138		struct request_queue *q = bdev_get_queue(bio->bi_bdev);
  3139		struct blk_plug *plug = current->plug;
  3140		const int is_sync = op_is_sync(bio->bi_opf);
  3141		struct blk_mq_hw_ctx *hctx;
  3142		unsigned int nr_segs;
  3143		struct request *rq;
  3144		int from_cpu = -1;
  3145		blk_status_t ret;
  3146	
  3147		/*
  3148		 * A BIO that was released from a zone write plug has already been
  3149		 * through the preparation in this function, already holds a reference
  3150		 * on the queue usage counter, and is the only write BIO in-flight for
  3151		 * the target zone. Go straight to preparing a request for it.
  3152		 */
  3153		if (bio_zone_write_plugging(bio)) {
  3154			nr_segs = bio->__bi_nr_segments;
  3155			goto new_request;
  3156		}
  3157	
  3158		if (unlikely(bio_queue_enter(bio)))
  3159			return;
  3160	
  3161		/*
  3162		 * Device reconfiguration may change logical block size or reduce the
  3163		 * number of poll queues, so the checks for alignment and poll support
  3164		 * have to be done with queue usage counter held.
  3165		 */
  3166		if (unlikely(bio_unaligned(bio, q))) {
  3167			bio_io_error(bio);
  3168			goto queue_exit;
  3169		}
  3170	
  3171		if ((bio->bi_opf & REQ_POLLED) && !blk_mq_can_poll(q)) {
  3172			bio->bi_status = BLK_STS_NOTSUPP;
  3173			bio_endio(bio);
  3174			goto queue_exit;
  3175		}
  3176	
  3177		bio = __bio_split_to_limits(bio, &q->limits, &nr_segs);
  3178		if (!bio)
  3179			goto queue_exit;
  3180	
  3181		if (!bio_integrity_prep(bio))
  3182			goto queue_exit;
  3183	
  3184		if (blk_mq_attempt_bio_merge(q, bio, nr_segs))
  3185			goto queue_exit;
  3186	
> 3187		if (blk_queue_is_zoned(q) && blk_zone_plug_bio(bio, nr_segs, &from_cpu))
  3188			goto queue_exit;
  3189	
  3190	new_request:
  3191		rq = blk_mq_peek_cached_request(plug, q, from_cpu, bio->bi_opf);
  3192		if (rq) {
  3193			blk_mq_use_cached_rq(rq, plug, bio);
  3194			/*
  3195			 * Here we hold two references: one because of the
  3196			 * bio_queue_enter() call and a second one as the result of
  3197			 * request allocation. Drop one.
  3198			 */
  3199			blk_queue_exit(q);
  3200		} else {
  3201			rq = blk_mq_get_new_requests(q, from_cpu, plug, bio);
  3202			if (unlikely(!rq)) {
  3203				if (bio->bi_opf & REQ_NOWAIT)
  3204					bio_wouldblock_error(bio);
  3205				goto queue_exit;
  3206			}
  3207		}
  3208	
  3209		trace_block_getrq(bio);
  3210	
  3211		rq_qos_track(q, rq, bio);
  3212	
  3213		blk_mq_bio_to_request(rq, bio, nr_segs);
  3214	
  3215		ret = blk_crypto_rq_get_keyslot(rq);
  3216		if (ret != BLK_STS_OK) {
  3217			bio->bi_status = ret;
  3218			bio_endio(bio);
  3219			blk_mq_free_request(rq);
  3220			return;
  3221		}
  3222	
  3223		if (bio_zone_write_plugging(bio))
  3224			blk_zone_write_plug_init_request(rq);
  3225	
  3226		if (op_is_flush(bio->bi_opf) && blk_insert_flush(rq))
  3227			return;
  3228	
  3229		if (plug) {
  3230			blk_add_rq_to_plug(plug, rq);
  3231			return;
  3232		}
  3233	
  3234		hctx = rq->mq_hctx;
  3235		if ((rq->rq_flags & RQF_USE_SCHED) ||
  3236		    (hctx->dispatch_busy && (q->nr_hw_queues == 1 || !is_sync))) {
  3237			blk_mq_insert_request(rq, 0);
  3238			blk_mq_run_hw_queue(hctx, true);
  3239		} else {
  3240			blk_mq_run_dispatch_ops(q, blk_mq_try_issue_directly(hctx, rq));
  3241		}
  3242		return;
  3243	
  3244	queue_exit:
  3245		blk_queue_exit(q);
  3246	}
  3247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

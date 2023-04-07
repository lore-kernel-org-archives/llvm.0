Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2EA6FC8;
	Fri,  7 Apr 2023 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680887344; x=1712423344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BgdkcoVR/pnvFB+7qjF4XbaAFJTo0ViwRtuDQqZbeFY=;
  b=NOUJjhpw/ZEaiVrXFg8KvPLt/hG1Td1nCHI1uaALgzjuTk0+OfIDMTZg
   oBuHnYkkDQvxNu9ass4RmHKyGOSy8Hvb9UF4/4tj32BP6HZHZedWeZkS6
   1zB/CBkeOuRgP2RL5MK5GLmT1ky24PmuuGOB43t8mClwzFythMLHeWoL3
   +qZhjBZ0I0rcahLWhOLPa20MbFaHvFoB+ObZ4i2deOdL5+UcJiKDzxBIy
   mtU6r5hp2/ESY6uvJpAsMU2h/9vZSQI7mxlStJlOnjrMZIEpaY6uo+/ZN
   m8+4fcPaDMRGm4+suNagBI83udS53c3uIgwP+1rTZL3SsClrWftKADPnU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="344805054"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="344805054"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="637764967"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="637764967"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 10:09:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkpa3-000Sib-2o;
	Fri, 07 Apr 2023 17:08:55 +0000
Date: Sat, 8 Apr 2023 01:08:23 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 11/12] block: mq-deadline: Fix a race condition related
 to zoned writes
Message-ID: <202304080013.UtHGCZkg-lkp@intel.com>
References: <20230407001710.104169-12-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407001710.104169-12-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/block-Send-zoned-writes-to-the-I-O-scheduler/20230407-081846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230407001710.104169-12-bvanassche%40acm.org
patch subject: [PATCH 11/12] block: mq-deadline: Fix a race condition related to zoned writes
config: i386-randconfig-r031-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080013.UtHGCZkg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/10abd923538d71bd2d53f8d8ec2f7bbfe746e6cb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bart-Van-Assche/block-Send-zoned-writes-to-the-I-O-scheduler/20230407-081846
        git checkout 10abd923538d71bd2d53f8d8ec2f7bbfe746e6cb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080013.UtHGCZkg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/mq-deadline.c:392:22: error: implicit declaration of function 'blk_rq_zone_no' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   unsigned int zno = blk_rq_zone_no(rq);
                                      ^
   1 error generated.


vim +/blk_rq_zone_no +392 block/mq-deadline.c

   362	
   363	/*
   364	 * For the specified data direction, return the next request to
   365	 * dispatch using sector position sorted lists.
   366	 */
   367	static struct request *
   368	deadline_next_request(struct deadline_data *dd, struct dd_per_prio *per_prio,
   369			      enum dd_data_dir data_dir)
   370	{
   371		struct request_queue *q;
   372		struct request *rq;
   373		unsigned long flags;
   374	
   375		rq = per_prio->next_rq[data_dir];
   376		if (!rq)
   377			return NULL;
   378	
   379		q = rq->q;
   380		if (data_dir == DD_READ || !blk_queue_is_zoned(q))
   381			return rq;
   382	
   383		/*
   384		 * Look for a write request that can be dispatched, that is one with
   385		 * an unlocked target zone. For some HDDs, breaking a sequential
   386		 * write stream can lead to lower throughput, so make sure to preserve
   387		 * sequential write streams, even if that stream crosses into the next
   388		 * zones and these zones are unlocked.
   389		 */
   390		spin_lock_irqsave(&dd->zone_lock, flags);
   391		while (rq) {
 > 392			unsigned int zno = blk_rq_zone_no(rq);
   393	
   394			if (blk_req_can_dispatch_to_zone(rq))
   395				break;
   396	
   397			WARN_ON_ONCE(!blk_queue_is_zoned(q));
   398	
   399			if (!blk_queue_nonrot(q)) {
   400				rq = deadline_skip_seq_writes(dd, rq);
   401				if (!rq)
   402					break;
   403				rq = deadline_earlier_request(rq);
   404				if (WARN_ON_ONCE(!rq))
   405					break;
   406			}
   407	
   408			/*
   409			 * Skip all other write requests for the zone with zone number
   410			 * 'zno'. This prevents that this function selects a zoned write
   411			 * that is not the first write for a given zone.
   412			 */
   413			while ((rq = deadline_latter_request(rq)) &&
   414			       blk_rq_zone_no(rq) == zno)
   415				;
   416		}
   417		spin_unlock_irqrestore(&dd->zone_lock, flags);
   418	
   419		return rq;
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

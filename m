Received: from mga05.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146912F52;
	Wed, 19 Apr 2023 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681899243; x=1713435243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CjFqxz7UXdM+AFHpm2eusThnG0zyFEE7qWTGXadf1Zg=;
  b=Z4Kz3QFAbYaEXT/he8LEwIFzvNqAabeaT1/Xx5aAqV4YN59Kyi+WpgFK
   KLXL/9I+n9ikAjq1nt1byUtUC3wNDFZhEsli0vRnYWaxK8ulv6QX21iDS
   YPQy+2MhZXaRJ+en9n1Nhx1jIIGY+1Vwxyk2TdEOsiVY4ohC6XP3G/0Mr
   tKzelKi2VQAyMfEaBkTyCw5LtHKtocx2PSk3fti4VRLTC6t6Hc4pKAF1/
   ww41WDn10kRi342BJa4a1dVC/rfewYcQDUbAWpEhMJVHu53P2D7cIzukF
   v9pHKEfGNP5Orxg0Ldr/9tuD23XnUkWzOsCOG7+/LkzxgWslFkRSKZXQm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431685533"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="431685533"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 03:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="684933075"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="684933075"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Apr 2023 03:13:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp4os-000enb-1T;
	Wed, 19 Apr 2023 10:13:46 +0000
Date: Wed, 19 Apr 2023 18:13:09 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:retain-zoned-write-order 15/15]
 block/mq-deadline.c:189:19: error: no member named 'max_active_zones' in
 'struct gendisk'
Message-ID: <202304191840.OXmGgJ6k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux retain-zoned-write-order
head:   2bdceaa60eb460189b66d717bce55dc354512fe8
commit: 2bdceaa60eb460189b66d717bce55dc354512fe8 [15/15] block: mq-deadline: Respect the active zone limit
config: x86_64-randconfig-a013-20230417 (https://download.01.org/0day-ci/archive/20230419/202304191840.OXmGgJ6k-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/2bdceaa60eb460189b66d717bce55dc354512fe8
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche retain-zoned-write-order
        git checkout 2bdceaa60eb460189b66d717bce55dc354512fe8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191840.OXmGgJ6k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/mq-deadline.c:189:19: error: no member named 'max_active_zones' in 'struct gendisk'
           if (rq->q->disk->max_active_zones == 0)
               ~~~~~~~~~~~  ^
   block/mq-deadline.c:206:44: error: no member named 'max_active_zones' in 'struct gendisk'
           return dd_active_zones(dd) < rq->q->disk->max_active_zones;
                                        ~~~~~~~~~~~  ^
   block/mq-deadline.c:216:32: error: no member named 'max_active_zones' in 'struct gendisk'
           if (WARN_ON_ONCE(rq->q->disk->max_active_zones == 0))
                            ~~~~~~~~~~~  ^
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
           int __ret_warn_on = !!(condition);                      \
                                  ^~~~~~~~~
   block/mq-deadline.c:762:25: error: no member named 'max_active_zones' in 'struct gendisk'
           if (rq && rq->q->disk->max_active_zones)
                     ~~~~~~~~~~~  ^
   block/mq-deadline.c:1080:19: error: no member named 'max_active_zones' in 'struct gendisk'
           if (rq->q->disk->max_active_zones) {
               ~~~~~~~~~~~  ^
   5 errors generated.


vim +189 block/mq-deadline.c

   177	
   178	/*
   179	 * Returns true if and only if dispatching request @rq won't cause the active
   180	 * zones limit to be exceeded.
   181	 */
   182	static bool dd_check_zone(struct deadline_data *dd, struct request *rq)
   183	{
   184		unsigned int zno = blk_rq_zone_no(rq);
   185		struct dd_zone *zone;
   186	
   187		lockdep_assert_held(&dd->lock);
   188	
 > 189		if (rq->q->disk->max_active_zones == 0)
   190			return true;
   191	
   192		switch (req_op(rq)) {
   193		case REQ_OP_WRITE:
   194		case REQ_OP_WRITE_ZEROES:
   195		case REQ_OP_ZONE_APPEND:
   196			break;
   197		default:
   198			return true;
   199		}
   200	
   201		hash_for_each_possible(dd->active_zones, zone, entry, zno)
   202			if (zone->zno == zno)
   203				return true; /* zone already open */
   204	
   205		/* zone is empty or closed */
   206		return dd_active_zones(dd) < rq->q->disk->max_active_zones;
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

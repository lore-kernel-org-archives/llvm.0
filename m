Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C5A7F
	for <llvm@lists.linux.dev>; Wed,  3 Aug 2022 02:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659493191; x=1691029191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XvWc6/IhE9bacJZzGsb8jS7BDC9vN0R4MZJc4qnjiyg=;
  b=bYvT3S/u7SDjGUYf6odwmelxzzKV4enu90pUT6lvvAgJ1ucwtH/bZNze
   ZWaLf9WpqwZXGovXlkFWox4rHOjssnuDGDydcUVi92/JZ2rDnWFWuwuhJ
   fdx/WuxMDIFd+L67D+omsBdVF/cx/CnAhztJodsh0wx8S4L/9bheDDH9E
   4/VVKM5DjE+sbpX70hLvonDMfAGrIWasaHu5nzEYqF3H1kQIlqqdq8Giv
   okJzpVn7XHWm+pUgj0TphwhiyZRbf01rkIT22cLIrIKrWV4a8or3iSWVw
   Y+Oec+fz3GVCnNUluapLNSkO83phMh/9kscGhnyBkyXi2GuIwz1DHfmnw
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="288319765"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="288319765"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 19:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="635510327"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Aug 2022 19:19:43 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJ3z4-000Ggy-2J;
	Wed, 03 Aug 2022 02:19:42 +0000
Date: Wed, 3 Aug 2022 10:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [ammarfaizi2-block:axboe/linux-block/for-5.20/drivers 116/128]
 drivers/md/dm.c:1019:32: error: no member named 'bio_split' in 'struct
 request_queue'
Message-ID: <202208031056.CwBNWtsS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/for-5.20/drivers
head:   4a60e6e655b81b817569ee42f481de06506848b3
commit: faf18cbbdb8631b48bf103f9e06e944f80e3b6bf [116/128] block: move ->bio_split to the gendisk
config: hexagon-randconfig-r041-20220801 (https://download.01.org/0day-ci/archive/20220803/202208031056.CwBNWtsS-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/faf18cbbdb8631b48bf103f9e06e944f80e3b6bf
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block axboe/linux-block/for-5.20/drivers
        git checkout faf18cbbdb8631b48bf103f9e06e944f80e3b6bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/md/dm.c:1019:32: error: no member named 'bio_split' in 'struct request_queue'
                   dm_io_rewind(io, &md->queue->bio_split);
                                     ~~~~~~~~~  ^
   1 error generated.


vim +1019 drivers/md/dm.c

e27363472f9bc9 Mike Snitzer 2022-03-09  1002  
8b211aaccb915b Ming Lei     2022-06-24  1003  static void dm_wq_requeue_work(struct work_struct *work)
8b211aaccb915b Ming Lei     2022-06-24  1004  {
8b211aaccb915b Ming Lei     2022-06-24  1005  	struct mapped_device *md = container_of(work, struct mapped_device,
8b211aaccb915b Ming Lei     2022-06-24  1006  						requeue_work);
8b211aaccb915b Ming Lei     2022-06-24  1007  	unsigned long flags;
8b211aaccb915b Ming Lei     2022-06-24  1008  	struct dm_io *io;
8b211aaccb915b Ming Lei     2022-06-24  1009  
8b211aaccb915b Ming Lei     2022-06-24  1010  	/* reuse deferred lock to simplify dm_handle_requeue */
8b211aaccb915b Ming Lei     2022-06-24  1011  	spin_lock_irqsave(&md->deferred_lock, flags);
8b211aaccb915b Ming Lei     2022-06-24  1012  	io = md->requeue_list;
8b211aaccb915b Ming Lei     2022-06-24  1013  	md->requeue_list = NULL;
8b211aaccb915b Ming Lei     2022-06-24  1014  	spin_unlock_irqrestore(&md->deferred_lock, flags);
8b211aaccb915b Ming Lei     2022-06-24  1015  
8b211aaccb915b Ming Lei     2022-06-24  1016  	while (io) {
8b211aaccb915b Ming Lei     2022-06-24  1017  		struct dm_io *next = io->next;
8b211aaccb915b Ming Lei     2022-06-24  1018  
8b211aaccb915b Ming Lei     2022-06-24 @1019  		dm_io_rewind(io, &md->queue->bio_split);
8b211aaccb915b Ming Lei     2022-06-24  1020  
8b211aaccb915b Ming Lei     2022-06-24  1021  		io->next = NULL;
8b211aaccb915b Ming Lei     2022-06-24  1022  		__dm_io_complete(io, false);
8b211aaccb915b Ming Lei     2022-06-24  1023  		io = next;
8b211aaccb915b Ming Lei     2022-06-24  1024  	}
8b211aaccb915b Ming Lei     2022-06-24  1025  }
8b211aaccb915b Ming Lei     2022-06-24  1026  

:::::: The code at line 1019 was first introduced by commit
:::::: 8b211aaccb915bbf4f4a68f1910c4de701df393b dm: add two stage requeue mechanism

:::::: TO: Ming Lei <ming.lei@redhat.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

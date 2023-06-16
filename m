Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0ED36D;
	Fri, 16 Jun 2023 00:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686876242; x=1718412242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6VMIw7zq8N8fDGyfLPP18isZxHcdtduQ/eil4I+EYWE=;
  b=ITtnPYezHYtKwg6aZxfqrdEg6/lvBWqQYo8/gnO0nVuliY+0Hu2WhZ1R
   M+2cdzxrfj7D5saYWUo2fi5tdXEj6ZfvSHu17WeVYQi1WVzAu3UIiRVVt
   1wxtAtFrrYxhsCXEyjptOfGoo9Yr8qt+RsfdfhRVeLAPuPmmlcTzebf+k
   YxXKwssUVv3iGIsVMZOaUmqUQZfD2qtnUanzpSQZLvNeY/60g1RvmOSor
   oP3asL5xEUkrzF362ThvPr4gW89VXDhW4D1fvmK29TWvXTdhKDSmpoewq
   Jqw2+MMLPTFlNbuSpYleeAHuQBYL6x5LSauLcBTgeF8pYw3PbLwIrXLQr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="357953751"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="357953751"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 17:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="857183114"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="857183114"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2023 17:43:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9xZG-0000aa-2l;
	Fri, 16 Jun 2023 00:43:58 +0000
Date: Fri, 16 Jun 2023 08:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-next:master 6153/10326] drivers/block/pktcdvd.c:1315:13:
 warning: stack frame size (2496) exceeds limit (2048) in
 'pkt_handle_packets'
Message-ID: <202306160811.nV1bMsK4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   925294c9aa184801cc0a451b69a18dd0fe7d847d
commit: 3a41db531e5124adaa3a9ab9ca0c724aee85b10c [6153/10326] pktcdvd: Get rid of custom printing macros
config: riscv-buildonly-randconfig-r001-20230615 (https://download.01.org/0day-ci/archive/20230616/202306160811.nV1bMsK4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3a41db531e5124adaa3a9ab9ca0c724aee85b10c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3a41db531e5124adaa3a9ab9ca0c724aee85b10c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/ mm//

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160811.nV1bMsK4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/pktcdvd.c:1364:12: warning: stack frame size (3648) exceeds limit (2048) in 'kcdrwd' [-Wframe-larger-than]
   static int kcdrwd(void *foobar)
              ^
>> drivers/block/pktcdvd.c:1315:13: warning: stack frame size (2496) exceeds limit (2048) in 'pkt_handle_packets' [-Wframe-larger-than]
   static void pkt_handle_packets(struct pktcdvd_device *pd)
               ^
   2 warnings generated.


vim +/pkt_handle_packets +1315 drivers/block/pktcdvd.c

4b83e99ee7092d Jens Axboe      2023-01-04  1314  
4b83e99ee7092d Jens Axboe      2023-01-04 @1315  static void pkt_handle_packets(struct pktcdvd_device *pd)
4b83e99ee7092d Jens Axboe      2023-01-04  1316  {
3a41db531e5124 Andy Shevchenko 2023-03-10  1317  	struct device *ddev = disk_to_dev(pd->disk);
4b83e99ee7092d Jens Axboe      2023-01-04  1318  	struct packet_data *pkt, *next;
4b83e99ee7092d Jens Axboe      2023-01-04  1319  
4b83e99ee7092d Jens Axboe      2023-01-04  1320  	/*
4b83e99ee7092d Jens Axboe      2023-01-04  1321  	 * Run state machine for active packets
4b83e99ee7092d Jens Axboe      2023-01-04  1322  	 */
4b83e99ee7092d Jens Axboe      2023-01-04  1323  	list_for_each_entry(pkt, &pd->cdrw.pkt_active_list, list) {
4b83e99ee7092d Jens Axboe      2023-01-04  1324  		if (atomic_read(&pkt->run_sm) > 0) {
4b83e99ee7092d Jens Axboe      2023-01-04  1325  			atomic_set(&pkt->run_sm, 0);
4b83e99ee7092d Jens Axboe      2023-01-04  1326  			pkt_run_state_machine(pd, pkt);
4b83e99ee7092d Jens Axboe      2023-01-04  1327  		}
4b83e99ee7092d Jens Axboe      2023-01-04  1328  	}
4b83e99ee7092d Jens Axboe      2023-01-04  1329  
4b83e99ee7092d Jens Axboe      2023-01-04  1330  	/*
4b83e99ee7092d Jens Axboe      2023-01-04  1331  	 * Move no longer active packets to the free list
4b83e99ee7092d Jens Axboe      2023-01-04  1332  	 */
4b83e99ee7092d Jens Axboe      2023-01-04  1333  	spin_lock(&pd->cdrw.active_list_lock);
4b83e99ee7092d Jens Axboe      2023-01-04  1334  	list_for_each_entry_safe(pkt, next, &pd->cdrw.pkt_active_list, list) {
4b83e99ee7092d Jens Axboe      2023-01-04  1335  		if (pkt->state == PACKET_FINISHED_STATE) {
4b83e99ee7092d Jens Axboe      2023-01-04  1336  			list_del(&pkt->list);
4b83e99ee7092d Jens Axboe      2023-01-04  1337  			pkt_put_packet_data(pd, pkt);
3a41db531e5124 Andy Shevchenko 2023-03-10  1338  			pkt_set_state(ddev, pkt, PACKET_IDLE_STATE);
4b83e99ee7092d Jens Axboe      2023-01-04  1339  			atomic_set(&pd->scan_queue, 1);
4b83e99ee7092d Jens Axboe      2023-01-04  1340  		}
4b83e99ee7092d Jens Axboe      2023-01-04  1341  	}
4b83e99ee7092d Jens Axboe      2023-01-04  1342  	spin_unlock(&pd->cdrw.active_list_lock);
4b83e99ee7092d Jens Axboe      2023-01-04  1343  }
4b83e99ee7092d Jens Axboe      2023-01-04  1344  

:::::: The code at line 1315 was first introduced by commit
:::::: 4b83e99ee7092df37a5cf292fde976ebc475ea63 Revert "pktcdvd: remove driver."

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

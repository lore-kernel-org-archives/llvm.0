Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7C568
	for <llvm@lists.linux.dev>; Sat, 11 Dec 2021 05:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639200093; x=1670736093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4jeFRTkBneJ9Tg0hGd9/F1vN4Ck2h1BgrDoHalejcwQ=;
  b=XOH2suBgSy0SarfpCZhQii1yVn0YhbYxbk2T0NZlNufu9cas3iFBVILI
   Z/LlYKTwrNJfM2k5IQ2wX7Lu4QqhgPASSlpJMCqH5b1PLjMT5o6v8whzf
   PEhCX5P81h/f5lir9VXVBPdUuhtk/zqCYTc3Tuis7bmIQ6VyFfu42i5i2
   U+LKV+pB0SYOebDiaGY7zFCE18uSz6nf7Cs5wvMXXY2ygRUVStfnmxylh
   ZVxxrERiBsTzvs4/HqDtFygdL77i8Vj9MrdldcV3JBuli2HKcI7C03p8x
   a9s1zw/6zTI9hjz1yK5aUeVR5OqCpo/lb/YC4gC491BavxeUS3kWPjlum
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="219195486"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; 
   d="scan'208";a="219195486"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 21:21:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; 
   d="scan'208";a="480966268"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 10 Dec 2021 21:21:30 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvup7-000492-Ik; Sat, 11 Dec 2021 05:21:29 +0000
Date: Sat, 11 Dec 2021 13:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Wander Lairson Costa <wander@redhat.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-rt-users@vger.kernel.org,
	Wander Lairson Costa <wander@redhat.com>
Subject: Re: [PREEMPT_RT PATCH 1/2] block: Avoid sleeping function called
 from invalid context bug
Message-ID: <202112111300.2jYSEVK1-lkp@intel.com>
References: <20211210204156.96336-2-wander@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210204156.96336-2-wander@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Wander,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linux/master linus/master v5.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Wander-Lairson-Costa/Fix-warnings-in-blktrace/20211211-044405
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: i386-randconfig-a016-20211210 (https://download.01.org/0day-ci/archive/20211211/202112111300.2jYSEVK1-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/37b10b13961fb1af60139789717a018f788f714e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Wander-Lairson-Costa/Fix-warnings-in-blktrace/20211211-044405
        git checkout 37b10b13961fb1af60139789717a018f788f714e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> block/blk-cgroup.c:1915:8: error: implicit declaration of function 'get_cpu_light' [-Werror,-Wimplicit-function-declaration]
           cpu = get_cpu_light();
                 ^
>> block/blk-cgroup.c:1932:2: error: implicit declaration of function 'put_cpu_light' [-Werror,-Wimplicit-function-declaration]
           put_cpu_light();
           ^
   block/blk-cgroup.c:1932:2: note: did you mean 'get_cpu_light'?
   block/blk-cgroup.c:1915:8: note: 'get_cpu_light' declared here
           cpu = get_cpu_light();
                 ^
   2 errors generated.


vim +/get_cpu_light +1915 block/blk-cgroup.c

  1908	
  1909	void blk_cgroup_bio_start(struct bio *bio)
  1910	{
  1911		int rwd = blk_cgroup_io_type(bio), cpu;
  1912		struct blkg_iostat_set *bis;
  1913		unsigned long flags;
  1914	
> 1915		cpu = get_cpu_light();
  1916		bis = per_cpu_ptr(bio->bi_blkg->iostat_cpu, cpu);
  1917		flags = u64_stats_update_begin_irqsave(&bis->sync);
  1918	
  1919		/*
  1920		 * If the bio is flagged with BIO_CGROUP_ACCT it means this is a split
  1921		 * bio and we would have already accounted for the size of the bio.
  1922		 */
  1923		if (!bio_flagged(bio, BIO_CGROUP_ACCT)) {
  1924			bio_set_flag(bio, BIO_CGROUP_ACCT);
  1925			bis->cur.bytes[rwd] += bio->bi_iter.bi_size;
  1926		}
  1927		bis->cur.ios[rwd]++;
  1928	
  1929		u64_stats_update_end_irqrestore(&bis->sync, flags);
  1930		if (cgroup_subsys_on_dfl(io_cgrp_subsys))
  1931			cgroup_rstat_updated(bio->bi_blkg->blkcg->css.cgroup, cpu);
> 1932		put_cpu_light();
  1933	}
  1934	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

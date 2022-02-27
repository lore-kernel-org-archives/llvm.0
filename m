Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F4F7A
	for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 20:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645993305; x=1677529305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+VN32GYTCkyxY4Igt2eulV9Tjn4RHjCmM6mPT/iF5BY=;
  b=P5ydQUGWE6iCLb4UCS5NXDv1BUnK895aMtaC9oWG0FQQ3JQu7Dy/lDNx
   YUWuMWpZ6iW+1W9BcJlRr0v2hS/v14ccVFLEtq81KoPQQGz0EKkAnAioG
   WAKs+ab/YGQVPG13u/D9IPK1APZHl2lt2NxGfKv2/V4B/VJIcL4T/72pZ
   W40ohWGes2ic/73tZoyd313OT9hwOs7xi/2IIu0Ld4IEgyrObcEyCJbQQ
   SubT3WttmU1Og7c2URCh1QJgVAef4tbJ2imN9v21hWA83QZ9m1PBu2MfF
   l4SslasHbIDv2IYLkGg02eMyCYgE9IDFxQ4HeutSpey5Xevnrh7UUbOUi
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="315974690"
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; 
   d="scan'208";a="315974690"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2022 12:21:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; 
   d="scan'208";a="492507154"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Feb 2022 12:21:43 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOQ34-0006mn-7o; Sun, 27 Feb 2022 20:21:42 +0000
Date: Mon, 28 Feb 2022 04:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: Olivier Langlois <olivier@trillion01.com>, Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Hao Xu <haoxu@linux.alibaba.com>,
	io-uring <io-uring@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] io_uring: Add support for napi_busy_poll
Message-ID: <202202280457.dz7FiDNh-lkp@intel.com>
References: <53ae4884ede7faab1f409ec635f723a0745d3656.1645981935.git.olivier@trillion01.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53ae4884ede7faab1f409ec635f723a0745d3656.1645981935.git.olivier@trillion01.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Olivier,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.17-rc5 next-20220225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Olivier-Langlois/io_uring-Add-support-for-napi_busy_poll/20220228-012140
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2293be58d6a18cab800e25e42081bacb75c05752
config: mips-qi_lb60_defconfig (https://download.01.org/0day-ci/archive/20220228/202202280457.dz7FiDNh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/65e72f78c66272f7cf0e87dfeef88f5b79de2d91
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Olivier-Langlois/io_uring-Add-support-for-napi_busy_poll/20220228-012140
        git checkout 65e72f78c66272f7cf0e87dfeef88f5b79de2d91
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/io_uring.c:7840:3: warning: comparison of distinct pointer types ('typeof ((to)) *' (aka 'long long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
                   do_div(to, 1000);
                   ^~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
           (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
                  ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   1 warning generated.


vim +7840 fs/io_uring.c

  7826	
  7827	#ifdef CONFIG_NET_RX_BUSY_POLL
  7828	static void io_adjust_busy_loop_timeout(struct timespec64 *ts,
  7829						struct io_wait_queue *iowq)
  7830	{
  7831		unsigned busy_poll_to = READ_ONCE(sysctl_net_busy_poll);
  7832		struct timespec64 pollto = ns_to_timespec64(1000 * (s64)busy_poll_to);
  7833	
  7834		if (timespec64_compare(ts, &pollto) > 0) {
  7835			*ts = timespec64_sub(*ts, pollto);
  7836			iowq->busy_poll_to = busy_poll_to;
  7837		} else {
  7838			s64 to = timespec64_to_ns(ts);
  7839	
> 7840			do_div(to, 1000);
  7841			iowq->busy_poll_to = to;
  7842			ts->tv_sec = 0;
  7843			ts->tv_nsec = 0;
  7844		}
  7845	}
  7846	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

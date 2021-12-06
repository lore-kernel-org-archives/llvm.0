Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26B32C9E
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 07:18:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="300649535"
X-IronPort-AV: E=Sophos;i="5.87,290,1631602800"; 
   d="scan'208";a="300649535"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2021 23:18:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,290,1631602800"; 
   d="scan'208";a="611151161"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Dec 2021 23:17:59 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mu8G6-000Kwi-CU; Mon, 06 Dec 2021 07:17:58 +0000
Date: Mon, 6 Dec 2021 15:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yajun Deng <yajun.deng@linux.dev>, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] completion: introduce complete_put() helper function
Message-ID: <202112061502.0pJtOzSU-lkp@intel.com>
References: <20211206040319.7063-1-yajun.deng@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206040319.7063-1-yajun.deng@linux.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Yajun,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on v5.16-rc4 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yajun-Deng/completion-introduce-complete_put-helper-function/20211206-120632
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 8c92606ab81086db00cbb73347d124b4eb169b7e
config: hexagon-randconfig-r031-20211206 (https://download.01.org/0day-ci/archive/20211206/202112061502.0pJtOzSU-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f50be8eb0a12a61d23db6cda452c693001d76898)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6d181628873250fd66a8f2da19182fec95973b6e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yajun-Deng/completion-introduce-complete_put-helper-function/20211206-120632
        git checkout 6d181628873250fd66a8f2da19182fec95973b6e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/sched/completion.c:41:6: warning: no previous prototype for function 'complete_put' [-Wmissing-prototypes]
   void complete_put(refcount_t *r, struct completion *x)
        ^
   kernel/sched/completion.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void complete_put(refcount_t *r, struct completion *x)
   ^
   static 
   1 warning generated.


vim +/complete_put +41 kernel/sched/completion.c

    40	
  > 41	void complete_put(refcount_t *r, struct completion *x)
    42	{
    43		if (refcount_dec_and_test(r))
    44			complete(x);
    45	}
    46	EXPORT_SYMBOL(complete_put);
    47	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

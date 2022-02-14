Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D56A35
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644864738; x=1676400738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kWYAiQSwLurW6gnqQpOqmFvca/DUjsnHzrUszupOuks=;
  b=AJ/nIurSGxXeMvzQjIXGxaa05wDSxPf9PMFg7NZ0WDjMjo1HNvA0R9H8
   q8hrjFEgsdCV6Rp+hIiGCx82PFZPCWxkx5VpMMOHmBpgmuTlk0571F0//
   7tFz4uJ8hurrfaFJ/2KZswK1zODaNq5S/QHZ7mKosgcP0GiTIjnCLzrZW
   xG9O60z7P+wKDxzUhg+iDlxJtz+QMkynjnGgZDgI+RxM/I1svnMpi2ZL1
   E8bexU5HhMSWFjPsum+8A2/FoZJnT6G3gdDrp+oLd36fHO4hZA+Cae3nn
   C7kvyWy3TEHQ9DiVkPIsXdVIPmTixVz5oyasNJXyI8aF1khYI9ib06G2P
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="336587521"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="336587521"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 10:52:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="485638559"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Feb 2022 10:52:15 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJgSN-0008pm-7e; Mon, 14 Feb 2022 18:52:15 +0000
Date: Tue, 15 Feb 2022 02:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC V2 02/21] rv: Add runtime reactors interface
Message-ID: <202202150232.GmgML41h-lkp@intel.com>
References: <d69a5d389928803ec62055f3cffa704c656f803a.1644830251.git.bristot@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d69a5d389928803ec62055f3cffa704c656f803a.1644830251.git.bristot@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on lwn/docs-next linus/master v5.17-rc4 next-20220214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Bristot-de-Oliveira/The-Runtime-Verification-RV-interface/20220214-193144
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220215/202202150232.GmgML41h-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e716a88380b48ccbfe62acc96f536718e439130e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Bristot-de-Oliveira/The-Runtime-Verification-RV-interface/20220214-193144
        git checkout e716a88380b48ccbfe62acc96f536718e439130e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/trace/rv/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/trace/rv/rv_reactors.c:76:24: warning: no previous prototype for function 'get_reactor_rdef_by_name' [-Wmissing-prototypes]
   struct rv_reactor_def *get_reactor_rdef_by_name(char *name)
                          ^
   kernel/trace/rv/rv_reactors.c:76:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct rv_reactor_def *get_reactor_rdef_by_name(char *name)
   ^
   static 
   1 warning generated.


vim +/get_reactor_rdef_by_name +76 kernel/trace/rv/rv_reactors.c

    75	
  > 76	struct rv_reactor_def *get_reactor_rdef_by_name(char *name)
    77	{
    78		struct rv_reactor_def *r;
    79		list_for_each_entry(r, &rv_reactors_list, list) {
    80			if (strcmp(name, r->reactor->name) == 0)
    81				return r;
    82		}
    83	
    84		return NULL;
    85	}
    86	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

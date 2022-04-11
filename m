Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3917B1872
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 22:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649717902; x=1681253902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VrbcnKuJCcmQ8F5cpboYWC7WAymRLjMIzdTCu+xLz1k=;
  b=IL7lNLpuCdHrjicDP9BVRX/47VygiPkvPpo+Gi6bh5QyN5OAcQxtsGuL
   4DijEe8A6QmTq/GgpGMSFicFEyHFoKfyD4PlhY641ia0q82l020q/zvx4
   o8lMt3KA2dbPaZSGhB/MRN8wU1WQudBuykIUPbxTEapFzuYD7Fp9TQ37f
   tWaogbp6xNGgMbFVijng1If7iDIHydmmp8ZHeU5jbYYn+Zkqi4V42t2+Z
   TMwoO9RIVwpeh6BJUPf8Ny5LW3yf0cySBAFWHT199AOYrzmAOgWNhoMLm
   ht3BM6mRqPxZf1uc4IMFaJ4OGj0O16y/KzS3EYlPDPkYetNNG1rjY0jOH
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="287245141"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="287245141"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 15:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="525761721"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 11 Apr 2022 15:58:19 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ne2zC-0002I2-7z;
	Mon, 11 Apr 2022 22:58:18 +0000
Date: Tue, 12 Apr 2022 06:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kui-Feng Lee <kuifeng@fb.com>, bpf@vger.kernel.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, kernel-team@fb.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Kui-Feng Lee <kuifeng@fb.com>
Subject: Re: [PATCH bpf-next v4 1/5] bpf, x86: Generate trampolines from
 bpf_tramp_links
Message-ID: <202204120650.7IbxkPWZ-lkp@intel.com>
References: <20220411173429.4139609-2-kuifeng@fb.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411173429.4139609-2-kuifeng@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Kui-Feng,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Kui-Feng-Lee/Attach-a-cookie-to-a-tracing-program/20220412-013832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: hexagon-randconfig-r041-20220411 (https://download.01.org/0day-ci/archive/20220412/202204120650.7IbxkPWZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2f80aef15065fec24c46badf374a2e72d989fa16
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kui-Feng-Lee/Attach-a-cookie-to-a-tracing-program/20220412-013832
        git checkout 2f80aef15065fec24c46badf374a2e72d989fa16
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/bpf/syscall.c:2648:42: error: incompatible pointer types passing 'struct bpf_tramp_link *' to parameter of type 'struct bpf_link *' [-Werror,-Wincompatible-pointer-types]
           WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link,
                                                   ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONCE'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   include/linux/bpf.h:867:63: note: passing argument to parameter 'link' here
   static inline int bpf_trampoline_unlink_prog(struct bpf_link *link,
                                                                 ^
   kernel/bpf/syscall.c:2836:33: error: incompatible pointer types passing 'struct bpf_tramp_link *' to parameter of type 'struct bpf_link *' [-Werror,-Wincompatible-pointer-types]
           err = bpf_trampoline_link_prog(&link->link, tr);
                                          ^~~~~~~~~~~
   include/linux/bpf.h:862:61: note: passing argument to parameter 'link' here
   static inline int bpf_trampoline_link_prog(struct bpf_link *link,
                                                               ^
   2 errors generated.


vim +2648 kernel/bpf/syscall.c

  2642	
  2643	static void bpf_tracing_link_release(struct bpf_link *link)
  2644	{
  2645		struct bpf_tracing_link *tr_link =
  2646			container_of(link, struct bpf_tracing_link, link.link);
  2647	
> 2648		WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link,
  2649							tr_link->trampoline));
  2650	
  2651		bpf_trampoline_put(tr_link->trampoline);
  2652	
  2653		/* tgt_prog is NULL if target is a kernel function */
  2654		if (tr_link->tgt_prog)
  2655			bpf_prog_put(tr_link->tgt_prog);
  2656	}
  2657	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

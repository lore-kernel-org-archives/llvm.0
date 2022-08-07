Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0441C1852
	for <llvm@lists.linux.dev>; Sun,  7 Aug 2022 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659880074; x=1691416074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=77FBl3vUx49zjQlv3n6/4RN63oc5IH0eL4s0Jvvhj8Y=;
  b=jn1ThMPLXLKaj+xVI1Uqykbo0VUj7ayoZmswC1KI1qgoxmaZPqzUFIo8
   m9xo9QZ6N7jUXeGN5Y1ppYSLW3xtDNYBJ8AMyud9/CIBiR+fB3QMlFkrq
   OXN+PViI8vfiLXzV1BgDDy137MCnY6RDFMn1EHwzQtOe/4/iRbEUK+Idr
   N5S4Yxvdoa5R2EZlOuKVjU6SyALHYOhHDdAd5LC/Hi8nzNnSieiSOHOGP
   udK4JgTh7xVqJdL9yVm+LH4IZqDuSVgsfDYVs6Cb19sPvaxTPJR4sRtnJ
   LcZNj9scUM7+72EQvxTHJOxeM4zewDSmv7n0d/fC/rkUDywbOr777QxOV
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="376733320"
X-IronPort-AV: E=Sophos;i="5.93,220,1654585200"; 
   d="scan'208";a="376733320"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2022 06:47:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,220,1654585200"; 
   d="scan'208";a="554620105"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Aug 2022 06:47:33 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKgcv-000LKn-0b;
	Sun, 07 Aug 2022 13:47:33 +0000
Date: Sun, 7 Aug 2022 21:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>, will@kernel.org, arnd@arndb.de,
	catalin.marinas@arm.com, mark.rutland@arm.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v2] arm64: run softirqs on the per-CPU IRQ stack
Message-ID: <202208072125.pTMPctXF-lkp@intel.com>
References: <20220802065325.39740-1-zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802065325.39740-1-zhengqi.arch@bytedance.com>

Hi Qi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on soc/for-next]
[also build test WARNING on v5.19]
[cannot apply to arm64/for-next/core linus/master next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/arm64-run-softirqs-on-the-per-CPU-IRQ-stack/20220802-145547
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: arm64-randconfig-r032-20220801 (https://download.01.org/0day-ci/archive/20220807/202208072125.pTMPctXF-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/34ac9375ce5e75127084159f724fcb2208c022a3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Qi-Zheng/arm64-run-softirqs-on-the-per-CPU-IRQ-stack/20220802-145547
        git checkout 34ac9375ce5e75127084159f724fcb2208c022a3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/irq.c:81:6: warning: no previous prototype for function 'do_softirq_own_stack' [-Wmissing-prototypes]
   void do_softirq_own_stack(void)
        ^
   arch/arm64/kernel/irq.c:81:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void do_softirq_own_stack(void)
   ^
   static 
   arch/arm64/kernel/irq.c:120:13: warning: no previous prototype for function 'init_IRQ' [-Wmissing-prototypes]
   void __init init_IRQ(void)
               ^
   arch/arm64/kernel/irq.c:120:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init init_IRQ(void)
   ^
   static 
   2 warnings generated.


vim +/do_softirq_own_stack +81 arch/arm64/kernel/irq.c

    80	
  > 81	void do_softirq_own_stack(void)
    82	{
    83		call_on_irq_stack(NULL, ____do_softirq);
    84	}
    85	#endif
    86	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D05C7C
	for <llvm@lists.linux.dev>; Sat, 25 Jun 2022 04:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656131632; x=1687667632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W8ERiG5aSsAljoIt3xOl/MaLfKI2i9Wb2rrd/G1FEao=;
  b=UTVFySjJKVBvamsPy4fcmzgnY3nzto/2gHAr0BJlaTvffe9mstli+i/l
   3SDYWOujEqTGwSYdGXJDfm9ruwc6U7fcRztoxhdNVovQho0rxJJe0DVdj
   lsNg/YKvVtWqZ/3z2VzFC9dlwPjZbU2cu7YcCWnkHBHq5D6A2N08c6+f2
   AZC49EQgQadLG84qBvTC79+HKKzEx2nu1z+f12jzN75VVrkisET4YUc39
   DYw9zpVNV9bIZsO6AdS+m6LgIBsN1JVc1bnWaBTIUQfyC9xeSbXpwYYeM
   oQJAbMuCEwlvcPGgGdznoSmmU6qs2cSTqvIN1khyDhINet3ZIWYgadand
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="281190380"
X-IronPort-AV: E=Sophos;i="5.92,221,1650956400"; 
   d="scan'208";a="281190380"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2022 21:33:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,221,1650956400"; 
   d="scan'208";a="593507604"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jun 2022 21:33:50 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4xUU-0005Lz-8v;
	Sat, 25 Jun 2022 04:33:50 +0000
Date: Sat, 25 Jun 2022 12:33:19 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC bpf-next 1/2] bpf: add a kallsyms BPF iterator
Message-ID: <202206251225.nDavCyPn-lkp@intel.com>
References: <1656089118-577-2-git-send-email-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1656089118-577-2-git-send-email-alan.maguire@oracle.com>

Hi Alan,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Maguire/bpf-add-a-kallsyms-BPF-iterator/20220625-004938
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: mips-randconfig-r031-20220624
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 42a7ddb428c999229491b0effbb1a4059149fba8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/bee65a1c850426a5b6f798753bb50c74a6dca06b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alan-Maguire/bpf-add-a-kallsyms-BPF-iterator/20220625-004938
        git checkout bee65a1c850426a5b6f798753bb50c74a6dca06b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/kallsyms.c:591:12: warning: no previous prototype for function 'arch_get_kallsym' [-Wmissing-prototypes]
   int __weak arch_get_kallsym(unsigned int symnum, unsigned long *value,
              ^
   kernel/kallsyms.c:591:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_get_kallsym(unsigned int symnum, unsigned long *value,
   ^
   static 
>> kernel/kallsyms.c:839:36: warning: unused variable 'bpf_iter_kallsyms_ops' [-Wunused-const-variable]
   static const struct seq_operations bpf_iter_kallsyms_ops = {
                                      ^
   2 warnings generated.


vim +/bpf_iter_kallsyms_ops +839 kernel/kallsyms.c

   838	
 > 839	static const struct seq_operations bpf_iter_kallsyms_ops = {
   840		.start = s_start,
   841		.next = s_next,
   842		.stop = bpf_iter_s_seq_stop,
   843		.show = bpf_iter_s_seq_show,
   844	};
   845	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

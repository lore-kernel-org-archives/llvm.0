Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7FD168
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 19:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642014318; x=1673550318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BNb3DwgUGQA9PRZd4fzHLbCeYwyy5bxb0E5ML6267Hk=;
  b=Z7HSx6L2fSC837KdnNT7g+wqu/xKjJqPdNGZsnTU4e8Sq0nZLyjovz7t
   aHt/EPv1mqeWWXr6M4wPdlCtl00ci5tkFtfeniSkM80V/Y3na+x2Sa+0N
   llaejUvrDdO558jX1sToHNlcS/cZNHErwx9oAL4Xjrhyd/94jLWEmSfVb
   g9G3S5ER6xKKWQIOxMZwYd9HrAU6q3thtGOPFBl9mWZJkfIY01syf42/K
   P1Qs7F5ndkp/VvlJVNYPpf7BCMve7nK8GUxFDakDnHcoafF6NsEfdcsXi
   PQHp9gdmiOLmSsmuHJAqRDaFg3onSKhUXaBJV2WCsYcq+c5Gk28HyDvge
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="268175811"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="268175811"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 11:04:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="472942267"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Jan 2022 11:04:08 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7ium-0006GO-2t; Wed, 12 Jan 2022 19:04:08 +0000
Date: Thu, 13 Jan 2022 03:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2 1/2] rseq: x86: implement abort-at-ip extension
Message-ID: <202201130222.lBbn1hO4-lkp@intel.com>
References: <20220110171611.8351-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110171611.8351-1-mathieu.desnoyers@efficios.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Mathieu,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on tip/x86/core tip/master linus/master v5.16 next-20220112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mathieu-Desnoyers/rseq-x86-implement-abort-at-ip-extension/20220111-011941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220113/202201130222.lBbn1hO4-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8731a339925d9270b03a51b7c1b54e718dded248
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mathieu-Desnoyers/rseq-x86-implement-abort-at-ip-extension/20220111-011941
        git checkout 8731a339925d9270b03a51b7c1b54e718dded248
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/ptrace.c:1372:5: warning: no previous prototype for function 'rseq_abort_at_ip' [-Wmissing-prototypes]
   int rseq_abort_at_ip(struct pt_regs *regs, unsigned long ip)
       ^
   arch/x86/kernel/ptrace.c:1372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int rseq_abort_at_ip(struct pt_regs *regs, unsigned long ip)
   ^
   static 
   1 warning generated.


vim +/rseq_abort_at_ip +1372 arch/x86/kernel/ptrace.c

  1371	
> 1372	int rseq_abort_at_ip(struct pt_regs *regs, unsigned long ip)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA222C9D
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 23:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642029623; x=1673565623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xAUCP0qx3ZmBvo2ttf1on8KFOY+HDj5RbJjKea/QDrM=;
  b=gEbGRNRPjFJFvDDXkVY/fZ9uI6BmxmZ2ai6Px7ge/pOMkjdr/BUYH198
   HK6F3sB04jP5H8udTCjRawdAj6gKbb1dUCy8L3Cie1F1RVi18AFVhCtP1
   bQA5gYxqCinCFQ97cpTdLrHXonjG8zJ8QzqbJYEhgjTWibahWnp4KO5m1
   AYoz2JbejyucR7ajkNnb5YBTx65PLi6tvaPt5BMmb4fvCPd8azDiMIN1v
   IINha877xBMKlok/L9CD+fQdR/h5al3GBVnjk+uVpsEDDQYD73SB7rNB2
   rdMb1r4M0F/zz1m9cwJA4RXhZpK2ctv5lyeWTCIBYGTpubQTSl5WfJKYV
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="307223080"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="307223080"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 15:20:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="475093301"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jan 2022 15:20:22 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7muj-0006Xl-Ge; Wed, 12 Jan 2022 23:20:21 +0000
Date: Thu, 13 Jan 2022 07:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 6/6] bpf: Add kprobe link for attaching raw kprobes
Message-ID: <202201130747.yNR0J8tO-lkp@intel.com>
References: <164191328259.806991.14418649843650864871.stgit@devnote2>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164191328259.806991.14418649843650864871.stgit@devnote2>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Masami,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on bpf-next/master bpf/master linus/master v5.16]
[cannot apply to next-20220112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Masami-Hiramatsu/fprobe-Add-ftrace-based-probe-APIs/20220112-000050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: hexagon-randconfig-r001-20220112 (https://download.01.org/0day-ci/archive/20220113/202201130747.yNR0J8tO-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ba002e6556acd9e0af16442f4226ddb2a8759567
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Masami-Hiramatsu/fprobe-Add-ftrace-based-probe-APIs/20220112-000050
        git checkout ba002e6556acd9e0af16442f4226ddb2a8759567
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/syscall.c:34:
   include/linux/fprobes.h:28:20: error: field has incomplete type 'struct ftrace_ops'
           struct ftrace_ops       ftrace;
                                   ^
   include/linux/ftrace.h:332:8: note: forward declaration of 'struct ftrace_ops'
   struct ftrace_ops;
          ^
   In file included from kernel/bpf/syscall.c:34:
>> include/linux/fprobes.h:57:22: warning: no previous prototype for function 'fprobe_find_entry' [-Wmissing-prototypes]
   struct fprobe_entry *fprobe_find_entry(struct fprobe *fp, unsigned long addr)
                        ^
   include/linux/fprobes.h:57:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct fprobe_entry *fprobe_find_entry(struct fprobe *fp, unsigned long addr)
   ^
   static 
   1 warning and 1 error generated.


vim +/fprobe_find_entry +57 include/linux/fprobes.h

7b8ed3653f37559 Masami Hiramatsu 2022-01-12  43  
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  44  #ifdef CONFIG_FPROBES
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  45  int register_fprobe(struct fprobe *fp);
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  46  int unregister_fprobe(struct fprobe *fp);
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  47  struct fprobe_entry *fprobe_find_entry(struct fprobe *fp, unsigned long addr);
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  48  #else
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  49  static inline int register_fprobe(struct fprobe *fp)
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  50  {
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  51  	return -ENOTSUPP;
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  52  }
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  53  static inline int unregister_fprobe(struct fprobe *fp)
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  54  {
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  55  	return -ENOTSUPP;
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  56  }
7b8ed3653f37559 Masami Hiramatsu 2022-01-12 @57  struct fprobe_entry *fprobe_find_entry(struct fprobe *fp, unsigned long addr)
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  58  {
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  59  	return NULL;
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  60  }
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  61  #endif
7b8ed3653f37559 Masami Hiramatsu 2022-01-12  62  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

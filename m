Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3852C80
	for <llvm@lists.linux.dev>; Tue,  4 Jan 2022 12:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641297825; x=1672833825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Si4q1b2acvmzvksTGeaV8F4uObozN3IQZiVivl85Ni4=;
  b=LCSAfXQepZ8wBmUTzOQ4hM1y5cjPDvUPOtbV/oPrIyGFk1bYQeIIJDWv
   wWBCTFlwkBKF8j65T8/XObmy4Wjxlk0/wNlgW6BWC7b5w10v7BiKZMGbB
   9dYDwqEWuCYo/7jpzqEa4rlvv/qLpkFLHDZDRpTxPHlwR4CKB0aXaijdW
   qzyFRAQWGcbEFt5tZRO0FiHlqPifPjPClogo8SLmH29Mo7zNtVorcP3xz
   i9ePo79b9vz0wApKt8FNNdtHupwdBekRjqoXMneEr9aKLOpkyuXrFbISY
   dTXxEEFJxTIO6IMbtYTu9ATEmtCMq7fsbAn9mqZafUxspQ0NDgGYmcEVF
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="239754222"
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="239754222"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 04:02:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="688546698"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Jan 2022 04:02:47 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n4iWd-000FIT-Ay; Tue, 04 Jan 2022 12:02:47 +0000
Date: Tue, 4 Jan 2022 20:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jolsa-perf:kprobe/multi 9/14] kernel/bpf/syscall.c:3101:25: error:
 implicit declaration of function 'get_kretprobe'
Message-ID: <202201041923.vrtf9Rke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git kprobe/multi
head:   27d253a29de023f664387fcc049edeeaadf23c8e
commit: b8b03607ea9875a92ea20941ebe6813fb052aeff [9/14] bpf: Add kprobe link for attaching raw kprobes
config: i386-buildonly-randconfig-r001-20220104 (https://download.01.org/0day-ci/archive/20220104/202201041923.vrtf9Rke-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b50fea47b6c454581fce89af359f3afe5154986c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=b8b03607ea9875a92ea20941ebe6813fb052aeff
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf kprobe/multi
        git checkout b8b03607ea9875a92ea20941ebe6813fb052aeff
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/syscall.c:35:
   include/linux/kprobes.h:77:21: error: field has incomplete type 'struct ftrace_ops'
                   struct ftrace_ops ops;
                                     ^
   include/linux/ftrace.h:332:8: note: forward declaration of 'struct ftrace_ops'
   struct ftrace_ops;
          ^
>> kernel/bpf/syscall.c:3101:25: error: implicit declaration of function 'get_kretprobe' [-Werror,-Wimplicit-function-declaration]
           struct kretprobe *rp = get_kretprobe(ri);
                                  ^
   kernel/bpf/syscall.c:3101:25: note: did you mean 'get_kprobe'?
   include/linux/kprobes.h:479:30: note: 'get_kprobe' declared here
   static inline struct kprobe *get_kprobe(void *addr)
                                ^
   kernel/bpf/syscall.c:3101:20: warning: incompatible integer to pointer conversion initializing 'struct kretprobe *' with an expression of type 'int' [-Wint-conversion]
           struct kretprobe *rp = get_kretprobe(ri);
                             ^    ~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/get_kretprobe +3101 kernel/bpf/syscall.c

  3097	
  3098	static int
  3099	kretprobe_dispatcher(struct kretprobe_instance *ri, struct pt_regs *regs)
  3100	{
> 3101		struct kretprobe *rp = get_kretprobe(ri);
  3102		struct bpf_kprobe_link *kprobe_link;
  3103	
  3104		kprobe_link = container_of(rp, struct bpf_kprobe_link, rp);
  3105		return kprobe_link_prog_run(kprobe_link, regs);
  3106	}
  3107	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

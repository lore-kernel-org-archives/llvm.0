Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73FF1C28;
	Fri, 14 Jul 2023 03:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689306507; x=1720842507;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zuVAK3yiKs9KIZzjfjXz4SRZJBC3EdqRW+7sz8lMm4s=;
  b=Z5WkQAYXSmKU9HvRwMT8LukHwyCTjf8Kjo3+DFLPx8l/nD3YKAHHp+Bp
   xP0yJSM5iDIkjZBRoRI4ZKreZc3UdCFCMrGlhhrrU+lGROva86KWRYfWX
   108n2TIkE3J1Pb3PKDcJg4ZvIAWaojr8hvhyjvSBYR4Xm+pN2aXCHhWYr
   7cFFL7Epe1hDQNjrshQg6GGiD8fgTJOxIa3yF2KuOREjfSSbcpId1VqcE
   PEXnQ7pcQPXPUoOlwXEnh1QvWvHzXpvqavI3lcKV+bmkmmLaoK6qh9/ac
   aehVwVmLuV9lNiptsXHy8krtIjwJ7nETfSEnJoa26KuLHmig24fcFzPXN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451746310"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="451746310"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 20:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792302594"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="792302594"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2023 20:48:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK9n2-00079L-2N;
	Fri, 14 Jul 2023 03:48:20 +0000
Date: Fri, 14 Jul 2023 11:48:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: ip_vs_protocol_init() falls through to
 next function ip_vs_wrr_init()
Message-ID: <202307141159.8ePAaujS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4b810bf037e524b54669acbe4e0df54b15d87ea1
commit: 55c84a5cf2c72a821719823ef2ebef01b119025b fortify: strcat: Move definition to use fortified strlcat()
date:   8 weeks ago
config: x86_64-randconfig-x006-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141159.8ePAaujS-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141159.8ePAaujS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141159.8ePAaujS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0xf: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: ip_vs_protocol_init() falls through to next function ip_vs_wrr_init()
   vmlinux.o: warning: objtool: native_sched_clock+0xc9: call to preempt_schedule_notrace_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_clock_read+0x27: call to preempt_schedule_notrace_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock+0xe3: call to preempt_schedule_notrace_thunk() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ibt_selftest+0x19: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

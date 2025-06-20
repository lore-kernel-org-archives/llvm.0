Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A3F277C99;
	Fri, 20 Jun 2025 08:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409273; cv=none; b=Aw6iy84JF1RlaH6bFlgRKj0R8svdaTYDYfhRHiO+Kv2rHyWo8aMu2c02PuwcIe8SKN7FNoGnBaZquHyMF0nDU3J1R/4NcYj53D3YCpqpYhayU6ZY6paJZCcUux9k9uyGZsuvk8a2uIBc4HJMuqeaaQunD8LQ1g3zpyr1G/NBX+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409273; c=relaxed/simple;
	bh=+gEywTXdSm8gwSh8w+Wn9om1FK5igRNpIq6M2oOY3to=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLyRjTz8W3ZmJpNiXK9cEhpqX2WEcZAD83j/WlqyfY1YAqpItaDC0bPrHTwktLd42OSPkUl0J+OiL4B2+oerIni1rLSnv2DKM2ekYuXZhrKLayLCq9pq70gS0og7CSc0Hj1izDxIp0+KmJ0W/MYIwFOaZVn2o5ogffapHtW/ctc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZbEWiQzk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZbEWiQzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750409271; x=1781945271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+gEywTXdSm8gwSh8w+Wn9om1FK5igRNpIq6M2oOY3to=;
  b=ZbEWiQzki0ZZxKCfMzLwdWadG26oVK2bQgSRWK9JsuNc+OIUoE7Cg5om
   ehxMGIgv693wjbiG8cZU2fp6dtzJ3EwS74uUg7BdM0199LJUc6kijy5rC
   IdepVe5/WB141hvqg+BXw8+sjWawK7p2b9E7RUPNjzWCvTlfPgmljIhQL
   xoMhqOSUQjfpusXsv7oMBgBFJacUztwvoCoIpUVPN5oj0MW3BL3I7j0DA
   K3xNylTCM8mp1+6VWwj7PqsgVoyZkjpr/TJFszAwThAp/qekti7pu9pdt
   1Sk1V5XpZWjzVVcyxYwgkR/INuo0vzA1idOuFNlxJZ5E8oe5Qaj0Nr7Wa
   w==;
X-CSE-ConnectionGUID: YE+tp4wfQ5KMBwbkyWHn1w==
X-CSE-MsgGUID: uhwiVJPtQvaYZBdb5uhMiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="55297116"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="55297116"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 01:47:50 -0700
X-CSE-ConnectionGUID: hHEWFIDzQpWuO+y6e+ZotQ==
X-CSE-MsgGUID: gWvTserKSZ+OCROv7bl83Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="156357529"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jun 2025 01:47:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSXPX-000LWy-1I;
	Fri, 20 Jun 2025 08:47:47 +0000
Date: Fri, 20 Jun 2025 16:47:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 5/10] kernel/trace/trace.h:907:24:
 error: incomplete definition of type 'struct ftrace_hash'
Message-ID: <202506201650.V96wIO7r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   b288c6b15d20122d59ddf3bce2fb86afe6ed56c3
commit: ff2779fb5dbd0d7cdfcdbdaa689bb88eba65e911 [5/10] ftrace: Export some of hash related functions
config: x86_64-buildonly-randconfig-003-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201650.V96wIO7r-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201650.V96wIO7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201650.V96wIO7r-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/trace_printk.c:12:
   include/linux/ftrace.h:575:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     575 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:575:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     575 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:580:5: warning: no previous prototype for function 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     580 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     580 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:585:5: warning: no previous prototype for function 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     585 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         |     ^
   include/linux/ftrace.h:585:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     585 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         | ^
         | static 
   In file included from kernel/trace/trace_printk.c:20:
>> kernel/trace/trace.h:907:24: error: incomplete definition of type 'struct ftrace_hash'
     907 |         return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
         |                           ~~~~^
   include/linux/ftrace.h:84:8: note: forward declaration of 'struct ftrace_hash'
      84 | struct ftrace_hash;
         |        ^
   In file included from kernel/trace/trace_printk.c:20:
   kernel/trace/trace.h:907:40: error: incomplete definition of type 'struct ftrace_hash'
     907 |         return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
         |                                           ~~~~^
   include/linux/ftrace.h:84:8: note: forward declaration of 'struct ftrace_hash'
      84 | struct ftrace_hash;
         |        ^
   3 warnings and 2 errors generated.


vim +907 kernel/trace/trace.h

4046bf023b0647 Namhyung Kim            2017-01-20  904  
eb583cd484f9a7 Arnd Bergmann           2017-01-23  905  static __always_inline bool ftrace_hash_empty(struct ftrace_hash *hash)
4046bf023b0647 Namhyung Kim            2017-01-20  906  {
8c08f0d5c6fb10 Steven Rostedt (VMware  2017-06-26 @907) 	return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
4046bf023b0647 Namhyung Kim            2017-01-20  908  }
4046bf023b0647 Namhyung Kim            2017-01-20  909  

:::::: The code at line 907 was first introduced by commit
:::::: 8c08f0d5c6fb10ff93ffb1cbf416f4f1c3a52a80 ftrace: Have cached module filters be an active filter

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

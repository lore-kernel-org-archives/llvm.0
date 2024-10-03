Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42EF17BA3;
	Thu,  3 Oct 2024 20:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727985713; cv=none; b=EaVoMfROYFJZGuSCl8sWp7LTGezr9hH8n4zL5mAWFjMzfWF5A9+shXJ75Asi+0w5xl55ORGBNQoKSFLG5a+gsbpx0sg0eoKypIQtyqM/UZeYXQi/gAW3fIQR7AACWdO7Mpc0Z0nq7Mf+ABVKkpp4v8JQTKyK7JnlSAky1+WLcKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727985713; c=relaxed/simple;
	bh=/oYqDlZ6Vlw0/om9THOLUYe3n5towioZU50JUlDE6w8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksieW+9rusM42jT2g8JeK+ZSXiPCRKXd3/OWJOIsDGCMtRGMRvm1ojVEiK96dHWEVHZY3oStBPYiMd8TpmPcIgS0MeQ0x9aD7cXZzGwr9iFLUwxDPNwFjmYv+bBc5W1rzS5XstYD6X3+ATqLvdjqpavKfkOZkZGqU5N6j2Oy1uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kql9frFQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kql9frFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727985712; x=1759521712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/oYqDlZ6Vlw0/om9THOLUYe3n5towioZU50JUlDE6w8=;
  b=Kql9frFQSRG1JfheG5XQ9nCf1sy7z3xlfQIuxCl41I1uXRbEoRd3u2A4
   +YBxO6xVdKRTblI9XYy1lEXSnxu4tKtwuyOEIjiB/oqjdRzsAUssVE0Sc
   O/I2olSLLTaWQX6JYc5VaPpYscyQ/CioM+TYTznruUmzFQ1qubzbDTlcL
   +FSpQub0vidJ9DEwfARWOQxke6C7Ie7cPfhikRcF0fxjqTeoXusBgIs4S
   hFUFBP5o18+NfXCULpCz06GevyZUfFem+GJbJQp6iWKJ9xNEX2exoliJo
   eh+7wKYi8djQygi6moAEZ+hvdKP9i1UU58GKJUFNda7WkpsO5a1xLdb9/
   w==;
X-CSE-ConnectionGUID: z6dlBgGQT4+ySzn9Kul7Pg==
X-CSE-MsgGUID: 9tPtRAZXR6y7S92HeZFfqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27371978"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="27371978"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 13:01:51 -0700
X-CSE-ConnectionGUID: PzFDQxsySEuQBHQoEAAf3g==
X-CSE-MsgGUID: nKpt6EqdS3SimN8DepW/TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="79309393"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Oct 2024 13:01:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swS1D-0000qW-2x;
	Thu, 03 Oct 2024 20:01:47 +0000
Date: Fri, 4 Oct 2024 04:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-key-deprecated 1/18]
 kernel/trace/trace_events_hist.c:825:36: error: no member named 'enabled' in
 'struct static_key_false'
Message-ID: <202410040337.AVKyOkE0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josh,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-key-deprecated
head:   02560a85ce2d5e66cd2b6f92bc5491f6fd199e02
commit: dcb3457da83c22aae3efcd93357f35c70645c4bb [1/18] tracepoints: Use new static branch API
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241004/202410040337.AVKyOkE0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040337.AVKyOkE0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040337.AVKyOkE0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_events_hist.c:825:36: error: no member named 'enabled' in 'struct static_key_false'
     825 |         if (unlikely(atomic_read(&tp->key.enabled) > 0)) {
         |                                   ~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   1 error generated.


vim +825 kernel/trace/trace_events_hist.c

7bbab38d07f318 Masami Hiramatsu        2018-11-05  816  
726721a51838e3 Tom Zanussi             2020-05-28  817  typedef void (*synth_probe_func_t) (void *__data, u64 *var_ref_vals,
726721a51838e3 Tom Zanussi             2020-05-28  818  				    unsigned int *var_ref_idx);
4b147936fa5096 Tom Zanussi             2018-01-15  819  
726721a51838e3 Tom Zanussi             2020-05-28  820  static inline void trace_synth(struct synth_event *event, u64 *var_ref_vals,
726721a51838e3 Tom Zanussi             2020-05-28  821  			       unsigned int *var_ref_idx)
4b147936fa5096 Tom Zanussi             2018-01-15  822  {
726721a51838e3 Tom Zanussi             2020-05-28  823  	struct tracepoint *tp = event->tp;
4b147936fa5096 Tom Zanussi             2018-01-15  824  
726721a51838e3 Tom Zanussi             2020-05-28 @825  	if (unlikely(atomic_read(&tp->key.enabled) > 0)) {
726721a51838e3 Tom Zanussi             2020-05-28  826  		struct tracepoint_func *probe_func_ptr;
726721a51838e3 Tom Zanussi             2020-05-28  827  		synth_probe_func_t probe_func;
726721a51838e3 Tom Zanussi             2020-05-28  828  		void *__data;
17911ff38aa58d Steven Rostedt (VMware  2019-10-11  829) 
726721a51838e3 Tom Zanussi             2020-05-28  830  		if (!(cpu_online(raw_smp_processor_id())))
726721a51838e3 Tom Zanussi             2020-05-28  831  			return;
4b147936fa5096 Tom Zanussi             2018-01-15  832  
726721a51838e3 Tom Zanussi             2020-05-28  833  		probe_func_ptr = rcu_dereference_sched((tp)->funcs);
726721a51838e3 Tom Zanussi             2020-05-28  834  		if (probe_func_ptr) {
726721a51838e3 Tom Zanussi             2020-05-28  835  			do {
726721a51838e3 Tom Zanussi             2020-05-28  836  				probe_func = probe_func_ptr->func;
726721a51838e3 Tom Zanussi             2020-05-28  837  				__data = probe_func_ptr->data;
726721a51838e3 Tom Zanussi             2020-05-28  838  				probe_func(__data, var_ref_vals, var_ref_idx);
726721a51838e3 Tom Zanussi             2020-05-28  839  			} while ((++probe_func_ptr)->func);
726721a51838e3 Tom Zanussi             2020-05-28  840  		}
726721a51838e3 Tom Zanussi             2020-05-28  841  	}
4b147936fa5096 Tom Zanussi             2018-01-15  842  }
4b147936fa5096 Tom Zanussi             2018-01-15  843  

:::::: The code at line 825 was first introduced by commit
:::::: 726721a51838e3983023f906580722fc83f804ee tracing: Move synthetic events to a separate file

:::::: TO: Tom Zanussi <zanussi@kernel.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

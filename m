Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965D23290B8;
	Thu, 26 Feb 2026 17:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772126742; cv=none; b=GQa/qsh2cnG+xphqrL1qxniYb2w2l2zcP89FN48OYqJfn+vsCfP3s8RuVs6IP+VEETXhEggANTItz1XDxBY7kYj02oBwrwo3I1o26DsgLp6GLcoMqL0WOc7bXGWuHDGV/m1LyO5tb3QDumzRVuI3u3Sx0VR42yFM2WBW0NrLP8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772126742; c=relaxed/simple;
	bh=HXHhap6egqWT8XC6RhfJfz56j5ScHe5sDUGa7n+j+mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CExuJ8JconWgZLxazBzCGYPPM92Zd/bhSpKSNnVb5aaMrM3/BKfOz6SUmmqGD6AWuOfO/Uyl2jDJFdokQsj1/4MfNnbb+GWvOXDSUxh1360uW4yaqOwVw0kGzhlEpTtqkK9JN7FVUNFrrdq/acjswHptyur65eTYpwBR+oen5C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTqKj8NQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTqKj8NQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772126740; x=1803662740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HXHhap6egqWT8XC6RhfJfz56j5ScHe5sDUGa7n+j+mc=;
  b=cTqKj8NQfUXQGhPwly8BAF4Gh5bEuFmseE+lCIU1BoiUbRx+DlGg8DVq
   L0RWQyg4zNHiD1KDs4v9NDup4qElDIXY6YEQ7JAfIQN+wxKyn+mglSSRY
   lGlOdOGFluiA+DJWVzQqBgFKJ4PxoAXKuzKwJlmdu344xV8tqXBJjC+Q3
   s4rJZhR7Fi6TDvyZrT784+3CT8oYCeJqX/R+QIjyTkapDhSKsvftZnwpZ
   v6GlNXphgRN4QnnQ8IOxIKFiEtroHDXN4eGlQH8o9eaMKXNX69rd8lhcb
   2xFyqMwJaFMgMSCVRk3kOvUJWbGC4KACSk4MBsM+LyG3w2SM3brfvUdVa
   Q==;
X-CSE-ConnectionGUID: 9UWTIpa5RwOm4Zw24mOAYA==
X-CSE-MsgGUID: 9MgH8bM0S0GcYM88Vl0pZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83903764"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="83903764"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 09:25:40 -0800
X-CSE-ConnectionGUID: /rZY5GHOQya2xaziO9V65A==
X-CSE-MsgGUID: IUiPNpQITlKNMrDTm6YNBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="254405774"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Feb 2026 09:25:38 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvf7H-000000009h9-3brh;
	Thu, 26 Feb 2026 17:25:35 +0000
Date: Fri, 27 Feb 2026 01:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] ring-buffer: Flush and stop persistent ring
 buffer on panic
Message-ID: <202602270132.zddhkLDS-lkp@intel.com>
References: <177211311593.419230.2212568977306190482.stgit@mhiramat.tok.corp.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177211311593.419230.2212568977306190482.stgit@mhiramat.tok.corp.google.com>

Hi Masami,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc1 next-20260226]
[cannot apply to trace/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/ring-buffer-Flush-and-stop-persistent-ring-buffer-on-panic/20260226-222418
base:   linus/master
patch link:    https://lore.kernel.org/r/177211311593.419230.2212568977306190482.stgit%40mhiramat.tok.corp.google.com
patch subject: [PATCH v5 1/3] ring-buffer: Flush and stop persistent ring buffer on panic
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260227/202602270132.zddhkLDS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270132.zddhkLDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270132.zddhkLDS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:2481:2: error: call to undeclared function 'flush_cache_all'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2481 |         flush_cache_all();
         |         ^
   kernel/trace/ring_buffer.c:2481:2: note: did you mean 'flush_dcache_page'?
   arch/sparc/include/asm/cacheflush_64.h:51:20: note: 'flush_dcache_page' declared here
      51 | static inline void flush_dcache_page(struct page *page)
         |                    ^
   1 error generated.


vim +/flush_cache_all +2481 kernel/trace/ring_buffer.c

  2475	
  2476	static int rb_flush_buffer_cb(struct notifier_block *nb, unsigned long event, void *data)
  2477	{
  2478		struct trace_buffer *buffer = container_of(nb, struct trace_buffer, flush_nb);
  2479	
  2480		ring_buffer_record_off(buffer);
> 2481		flush_cache_all();
  2482		return NOTIFY_DONE;
  2483	}
  2484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

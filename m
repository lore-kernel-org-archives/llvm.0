Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB96833D502;
	Tue,  3 Feb 2026 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120795; cv=none; b=ZD5Ya22vpgw2VKvhP2NeJNwSch9QyyR25GJP6HT1d9Soz7+W1bHlf1xz/Ai08g87SFeZvFenU5jmboN+P+9V8Am1VBq5SRndqhQ/aRxAa+KqC3NQ9ReUolUVUxSNkTMBcnpMVI66r7XOT0POMjifdy+KHtfamNQDDs46KRYqDlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120795; c=relaxed/simple;
	bh=EJ3LnE8q3TaYue/6JRSSE8ScZ+X65Vqv7A3J1Op26pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTxN1JAK7sN6kjdUMmasceaagdu2OXVt0nL3w0b4z84PqMIM95OTbSfYPWBR9RrNkGICQ6VU0Jee3u4RPFn6KIBQec6Vx70PQkSJqAWJBvarhNOTP5t9wvRL35OCIgGrNSaXfrQRN6QYd/g2ufopreFlnvajBog2myfVMIv698A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbRIJimc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbRIJimc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770120792; x=1801656792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EJ3LnE8q3TaYue/6JRSSE8ScZ+X65Vqv7A3J1Op26pU=;
  b=hbRIJimcQ3ZBWA59OdbggXsaAb370HFA/MDeLxfTkVPFpXbx0TcPyuWW
   T9Uqa3UsvChP9+hbFlkRoHLk7WV6QlnP8YM51VVZGP26Y7VY4MX2bV9hS
   hs5gGayk6iz3e8wDT13HAppmXEQJq18SewOIRGe+qadzxjqtMokzVO2aq
   qP2xDbuJQdeLybkuA40BYGyp4NPHwnPi0FHtqrD+6bHxLlTht5+5vyLBX
   HVoR1v/i6oWWEMyYEbWFn+VLibq+thQ5PN1i5SaQuAgKl4SlG5DtZQpVM
   7VJgcxcS2j+Xv3C6wXoCgktNbUW4GKzLtA+mkauiaSIOGsoIWRrTLKZRP
   A==;
X-CSE-ConnectionGUID: AORVjIcATcugiCLbJk/ewA==
X-CSE-MsgGUID: S0nzdlXZQ4OwJAEnKeBFLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58869528"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="58869528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 04:13:11 -0800
X-CSE-ConnectionGUID: fQ0yhWwURwO+qWpT5qZTOA==
X-CSE-MsgGUID: 6CdExaoMTyel01JhIX6pkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209250856"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2026 04:13:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnFHE-00000000gcK-1HST;
	Tue, 03 Feb 2026 12:13:04 +0000
Date: Tue, 3 Feb 2026 20:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Simon Horman <horms@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	Anna Schumaker <anna.schumaker@oracle.com>,
	Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Yury Norov <ynorov@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: remove __printf() attribute on
 __ftrace_vbprintk()
Message-ID: <202602032036.FQK7gJvV-lkp@intel.com>
References: <20260202095834.1328352-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202095834.1328352-1-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260130]
[cannot apply to trace/for-next linus/master v6.19-rc8 v6.19-rc7 v6.19-rc6 v6.19-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/tracing-remove-__printf-attribute-on-__ftrace_vbprintk/20260202-180958
base:   next-20260130
patch link:    https://lore.kernel.org/r/20260202095834.1328352-1-arnd%40kernel.org
patch subject: [PATCH] tracing: remove __printf() attribute on __ftrace_vbprintk()
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260203/202602032036.FQK7gJvV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602032036.FQK7gJvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602032036.FQK7gJvV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_printk.c:212:34: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of '__trace_bprintk' [-Wmissing-format-attribute]
     212 |         ret = trace_vbprintk(ip, fmt, ap);
         |                                         ^
   include/linux/trace_printk.h:110:5: note: '__trace_bprintk' declared here
     110 | int __trace_bprintk(unsigned long ip, const char *fmt, ...);
         |     ^
   1 warning generated.


vim +212 kernel/trace/trace_printk.c

1ba28e02a18cbd kernel/trace/trace_bprintk.c Lai Jiangshan            2009-03-06  199  
48ead02030f849 kernel/trace/trace_printk.c  Frederic Weisbecker      2009-03-12  200  int __trace_bprintk(unsigned long ip, const char *fmt, ...)
1427cdf0592368 kernel/trace/trace_bprintk.c Lai Jiangshan            2009-03-06  201  {
769b0441f438c4 kernel/trace/trace_printk.c  Frederic Weisbecker      2009-03-06  202  	int ret;
769b0441f438c4 kernel/trace/trace_printk.c  Frederic Weisbecker      2009-03-06  203  	va_list ap;
1427cdf0592368 kernel/trace/trace_bprintk.c Lai Jiangshan            2009-03-06  204  
769b0441f438c4 kernel/trace/trace_printk.c  Frederic Weisbecker      2009-03-06  205  	if (unlikely(!fmt))
769b0441f438c4 kernel/trace/trace_printk.c  Frederic Weisbecker      2009-03-06  206  		return 0;
769b0441f438c4 kernel/trace/trace_printk.c  Frederic Weisbecker      2009-03-06  207  
b9f9108cad3998 kernel/trace/trace_printk.c  Steven Rostedt (Red Hat  2015-09-29  208) 	if (!trace_printk_enabled)
769b0441f438c4 kernel/trace/trace_printk.c  Frederic Weisbecker      2009-03-06  209  		return 0;
769b0441f438c4 kernel/trace/trace_printk.c  Frederic Weisbecker      2009-03-06  210  
769b0441f438c4 kernel/trace/trace_printk.c  Frederic Weisbecker      2009-03-06  211  	va_start(ap, fmt);
40ce74f19c2807 kernel/trace/trace_printk.c  Steven Rostedt           2009-03-19 @212  	ret = trace_vbprintk(ip, fmt, ap);
769b0441f438c4 kernel/trace/trace_printk.c  Frederic Weisbecker      2009-03-06  213  	va_end(ap);
769b0441f438c4 kernel/trace/trace_printk.c  Frederic Weisbecker      2009-03-06  214  	return ret;
1427cdf0592368 kernel/trace/trace_bprintk.c Lai Jiangshan            2009-03-06  215  }
48ead02030f849 kernel/trace/trace_printk.c  Frederic Weisbecker      2009-03-12  216  EXPORT_SYMBOL_GPL(__trace_bprintk);
1427cdf0592368 kernel/trace/trace_bprintk.c Lai Jiangshan            2009-03-06  217  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

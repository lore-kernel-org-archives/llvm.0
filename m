Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892BC2AD20;
	Sun, 23 Mar 2025 14:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742740780; cv=none; b=JysCdPeS50o5wlr9iP/Wht2GY/Qlg1nkgX2nYOG/m3wNUSN/VkjOmVpuYhFhnO5nAu6GeMNAYpfBw9yd7MT+UbWQquqqFAQ34yFJDvlfnoe3/tbv7PPAoVq4V7vMoz7Nr43Nixj58l0EYlvhMg0dgUPgIWiL/fikfIXVXCI9SPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742740780; c=relaxed/simple;
	bh=dzeePklCjjDXcwlEKKOvsCYGgJAbfAR98wRHWSSvePE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GK8wCAhI0fivmBNw1Xewn7ykhFwhD4Wj83YW5W7ah2rDGbl/+is8b+NVBspORkdfEXpyB7eG2HlwkJGB+tFGSkfujCY5P34Bg1/10zQCkGIoGp0jDM+WWkEcdmD6X8EWWEWPLpj1GmnFUd2vv6A7U7yVM461jVWJiN2cv4hJRk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRH8F2hN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRH8F2hN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742740779; x=1774276779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dzeePklCjjDXcwlEKKOvsCYGgJAbfAR98wRHWSSvePE=;
  b=fRH8F2hNQto8T6R7OgMnGxyJREPr564NO6++3q6MzHjRJNhVGJ3FDshW
   zPB98c/7zvX935FxSq7srSOT0zTCs0X3iFHkQ6YJypkWZFf7a8kdlOS0y
   MRgUvqPn4n+f8SupaxTSnmiSwJ9XvNKUs260rHx/X5f2WktNpNct82WF+
   IUTYQs4cBGpMZxv7O868ToGDMfYCLEyEXjl4zZULFqkFQKwaklmgCzrcj
   4C0twcCJgJ+7H9ayOUKj6lb7BD9pkFoC6u2BOyMmHiHXNLw5xlVBS+eqt
   BqI2NY8h65RxiYgX8/eyXKzgnY+/xwfD/Cj/Xu/C/FSAJcGetT6nsn8OM
   w==;
X-CSE-ConnectionGUID: K6IR+RTdS461ank+/1qfxQ==
X-CSE-MsgGUID: VYticP1USXKXnDmd0xq3RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="47826512"
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="47826512"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 07:39:38 -0700
X-CSE-ConnectionGUID: gwOJvhC+SWWIwKb1Tb50Zg==
X-CSE-MsgGUID: cxJ1jymFQjuURaRGos+MtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="124609095"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Mar 2025 07:39:36 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twMUA-0002mx-12;
	Sun, 23 Mar 2025 14:39:34 +0000
Date: Sun, 23 Mar 2025 22:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Raillard <douglas.raillard@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:trace/for-next 15/16]
 kernel/trace/trace_events_synth.c:862:7: error: use of undeclared identifier
 'TRACE_REG_PERF_REGISTER'
Message-ID: <202503232230.TeREVy8R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   a1e3ad43115efe4c764775dc3e6d8e22e5870339
commit: 21581dd4e7ff6c07d0ab577e3c32b13a74b31522 [15/16] tracing: Ensure module defining synth event cannot be unloaded while tracing
config: um-randconfig-002-20250323 (https://download.01.org/0day-ci/archive/20250323/202503232230.TeREVy8R-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503232230.TeREVy8R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503232230.TeREVy8R-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_events_synth.c:862:7: error: use of undeclared identifier 'TRACE_REG_PERF_REGISTER'
     862 |         case TRACE_REG_PERF_REGISTER:
         |              ^
>> kernel/trace/trace_events_synth.c:874:7: error: use of undeclared identifier 'TRACE_REG_PERF_UNREGISTER'; did you mean 'TRACE_REG_UNREGISTER'?
     874 |         case TRACE_REG_PERF_UNREGISTER:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              TRACE_REG_UNREGISTER
   include/linux/trace_events.h:249:2: note: 'TRACE_REG_UNREGISTER' declared here
     249 |         TRACE_REG_UNREGISTER,
         |         ^
>> kernel/trace/trace_events_synth.c:874:7: error: duplicate case value 'TRACE_REG_UNREGISTER'
     874 |         case TRACE_REG_PERF_UNREGISTER:
         |              ^
   kernel/trace/trace_events_synth.c:873:7: note: previous case defined here
     873 |         case TRACE_REG_UNREGISTER:
         |              ^
   3 errors generated.


vim +/TRACE_REG_PERF_REGISTER +862 kernel/trace/trace_events_synth.c

   854	
   855	static int synth_event_reg(struct trace_event_call *call,
   856			    enum trace_reg type, void *data)
   857	{
   858		struct synth_event *event = container_of(call, struct synth_event, call);
   859	
   860		switch (type) {
   861		case TRACE_REG_REGISTER:
 > 862		case TRACE_REG_PERF_REGISTER:
   863			if (!try_module_get(event->mod))
   864				return -EBUSY;
   865			break;
   866		default:
   867			break;
   868		}
   869	
   870		int ret = trace_event_reg(call, type, data);
   871	
   872		switch (type) {
   873		case TRACE_REG_UNREGISTER:
 > 874		case TRACE_REG_PERF_UNREGISTER:
   875			module_put(event->mod);
   876			break;
   877		default:
   878			break;
   879		}
   880		return ret;
   881	}
   882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2A01A841B;
	Thu, 27 Feb 2025 16:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740673983; cv=none; b=VC/4jn5PlbKND6qOmJB6SIWxMG7zGoy7NHwLJimPcYGIKWAzS7AiXv0QqvHSfOuoJP7Rw2ZVwB8W5zG07yM68cNfQDjSIV5VHltcOtuKjyJ6mVArnEgj+LpFvcOqSGu5uc+zzJOBUhmOEnYzaNiOJ/ehQyZNYaKHWI523Usp3MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740673983; c=relaxed/simple;
	bh=PxRMUeFEamREPmtQZc3fxutf2JnTd8UN84HgX0/6asw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVdBEw2G+mq81idUExGThuxESa7+l+tib2NPCahxFdWFe8K1Jhor4T9Ywp66puyECRHUksbLfxrUw7ro8oDU+oZbEhjpSsCvur+//dZe35iFNlYQpu/+elnqA3+J5oJPNIIU95DQS/wr6+SCb3kyIXNOaHbDYPQ672hETpaJnxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTZEPKmo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTZEPKmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740673982; x=1772209982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PxRMUeFEamREPmtQZc3fxutf2JnTd8UN84HgX0/6asw=;
  b=VTZEPKmohrqovlHcRZNtx8/sTcUIBQwmfJOn73xT7no1IHOp7i8ubi8a
   3uxqOS9Js5+hShGpmFfZANsZJa2o5/9hsKVlOuyDhMEgD518Hzb1kcyo3
   Uwkzo8M9TsgaAoXPXcA2s6d7xhC89tqNrqhY4r110FzlVL8oy7a8pD8G2
   c+wBM9wvyHLtbil3umqBB3cK5Xof9FChj0sIVCpPnyhEON03w07xK83gt
   ld5knG1wDfCyB9KsGGpKl/w9bS7JdsoSz+S6HwjVyGfoCOhYO6yj0W3OM
   /uT/ygO+r4mnWbu5NI0U6juZQ7IyhGkdsVQqrMgx7yn8FyarPSLJFQWSg
   A==;
X-CSE-ConnectionGUID: bHVndROHRpaSjBcKgC/1YA==
X-CSE-MsgGUID: oHQazHRGQxijnPmMZSFKcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52985955"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52985955"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 08:33:01 -0800
X-CSE-ConnectionGUID: P9PzRs9xQmGfB9QwTupwow==
X-CSE-MsgGUID: vC1SwDCjTRm0YBeAWIdMZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="140303905"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Feb 2025 08:33:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tngoj-000Dhq-2K;
	Thu, 27 Feb 2025 16:32:57 +0000
Date: Fri, 28 Feb 2025 00:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/4] ftrace: Add arguments to function tracer
Message-ID: <202502280024.KCZLllFN-lkp@intel.com>
References: <20250225222654.069143074@goodmis.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225222654.069143074@goodmis.org>

Hi Steven,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc4 next-20250227]
[cannot apply to trace/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/ftrace-Add-print_function_args/20250226-063252
base:   linus/master
patch link:    https://lore.kernel.org/r/20250225222654.069143074%40goodmis.org
patch subject: [PATCH v3 4/4] ftrace: Add arguments to function tracer
config: i386-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280024.KCZLllFN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280024.KCZLllFN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280024.KCZLllFN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_output.c:1121:19: error: use of undeclared identifier 'FTRACE_REGS_MAX_ARGS'
    1121 |         if (args_size >= FTRACE_REGS_MAX_ARGS * sizeof(long))
         |                          ^
   1 error generated.
--
>> kernel/trace/trace.c:2888:10: error: use of undeclared identifier 'FTRACE_REGS_MAX_ARGS'
    2888 |         size += FTRACE_REGS_MAX_ARGS * !!fregs * sizeof(long);
         |                 ^
   kernel/trace/trace.c:2899:23: error: use of undeclared identifier 'FTRACE_REGS_MAX_ARGS'
    2899 |                 for (int i = 0; i < FTRACE_REGS_MAX_ARGS; i++)
         |                                     ^
>> kernel/trace/trace.c:2900:21: error: call to undeclared function 'ftrace_regs_get_argument'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2900 |                         entry->args[i] = ftrace_regs_get_argument(fregs, i);
         |                                          ^
   3 errors generated.


vim +/FTRACE_REGS_MAX_ARGS +1121 kernel/trace/trace_output.c

  1108	
  1109	/* TRACE_FN */
  1110	static enum print_line_t trace_fn_trace(struct trace_iterator *iter, int flags,
  1111						struct trace_event *event)
  1112	{
  1113		struct ftrace_entry *field;
  1114		struct trace_seq *s = &iter->seq;
  1115		unsigned long *args;
  1116		int args_size;
  1117	
  1118		trace_assign_type(field, iter->ent);
  1119	
  1120		args_size = iter->ent_size - offsetof(struct ftrace_entry, args);
> 1121		if (args_size >= FTRACE_REGS_MAX_ARGS * sizeof(long))
  1122			args = field->args;
  1123		else
  1124			args = NULL;
  1125	
  1126		print_fn_trace(s, field->ip, field->parent_ip, iter->tr->text_delta,
  1127			       args, flags);
  1128		trace_seq_putc(s, '\n');
  1129	
  1130		return trace_handle_return(s);
  1131	}
  1132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

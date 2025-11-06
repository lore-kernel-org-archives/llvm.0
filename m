Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BB81FF7D7;
	Thu,  6 Nov 2025 16:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762447273; cv=none; b=kC2+a6wo5HCgbdsPKOwj0siB0iQBUAtVPiPlzo1CJVWd9MgdMJvbK95wdIuc2MFY69Dq+vgkpReL0Yj47tTHw49kbl0Tg8+SyQdth4Rf8t9b7WlkPp+nrJDkaPmEwswWabtErdxNs2B09+MeCVH+pltRjEFlnEh/VdFQ72Aq2+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762447273; c=relaxed/simple;
	bh=ogZNIzVWkz/k2+RT7HnZNpd3hrdM9VwAbthBK3TGKcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toCGE956cykkrnueeStZXlZm1/e/RP8HIB4EznRyWCmLq6asO+3DwJIEvlWhTs9KBpst/U/F3VGjm5tAIHyYqvhJB27lHn1aq4XyZSa1qyzYhJeopjmVtGyQoLRpF1AHtD9hNnTFT79lXBDxM3qXAvCdedd38/wNd78XNUSqCbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/zTllvx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/zTllvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762447272; x=1793983272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ogZNIzVWkz/k2+RT7HnZNpd3hrdM9VwAbthBK3TGKcI=;
  b=X/zTllvx9RQXLGuJoh8cEL4Xa4Fk1YsagAkOfTOGL2tM2od3voeqIHNF
   g2y696IPm4P8h+kBEO6tf611d7i1VAiL1hRyjnor+xE2HBHs0N2fuNz8w
   jn3Zf3ENc9N3rzjRWa75L4P+ZMB7hvMWW4VJ0PS66Bq7i+5Yr2zTQZWGf
   N8N+hyxpucGqHy6FzTmHhIsSwiIOewuW6tXkPxwwOVS9eUN73in9t8ohQ
   aOzGpzWqeSYM2u51MzrD7KO277pTtbXg0GrLRGMizXPaVbVBwSRH7SZDe
   CWuOPGEwkDd3iMu/W5uQNWWldXp2vDu5KSGAaGQfR9BH8NrrVxK7pUkw4
   Q==;
X-CSE-ConnectionGUID: EdplCsKpSfKnJQqD4flc2A==
X-CSE-MsgGUID: 7KBWnT9CS/W/J/0Kbd1MPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="52157537"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="52157537"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:41:11 -0800
X-CSE-ConnectionGUID: fXbj9bdTSW+l0i47v7cREw==
X-CSE-MsgGUID: JNGmufwPTjCfXLnHBaFwhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="211259045"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2025 08:41:10 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vH32p-000U9c-2B;
	Thu, 06 Nov 2025 16:41:07 +0000
Date: Fri, 7 Nov 2025 00:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] tracing: wprobe: Use a new seq_print_ip_sym_offset()
 wrapper
Message-ID: <202511070042.0X3oQDrB-lkp@intel.com>
References: <176226550596.59499.18020648957674458755.stgit@devnote2>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176226550596.59499.18020648957674458755.stgit@devnote2>

Hi Masami,

kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]
[also build test ERROR on next-20251106]
[cannot apply to linus/master v6.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/tracing-wprobe-Use-a-new-seq_print_ip_sym_offset-wrapper/20251104-221949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/176226550596.59499.18020648957674458755.stgit%40devnote2
patch subject: [PATCH] tracing: wprobe: Use a new seq_print_ip_sym_offset() wrapper
config: i386-randconfig-063-20251105 (https://download.01.org/0day-ci/archive/20251107/202511070042.0X3oQDrB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511070042.0X3oQDrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511070042.0X3oQDrB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_wprobe.c:264:7: error: call to undeclared function 'seq_print_ip_sym_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     264 |         if (!seq_print_ip_sym_offset(s, field->ip, flags))
         |              ^
   kernel/trace/trace_wprobe.c:264:7: note: did you mean 'seq_print_ip_sym'?
   kernel/trace/trace_output.h:16:1: note: 'seq_print_ip_sym' declared here
      16 | seq_print_ip_sym(struct trace_seq *s, unsigned long ip,
         | ^
   1 error generated.


vim +/seq_print_ip_sym_offset +264 kernel/trace/trace_wprobe.c

   247	
   248	static enum print_line_t
   249	print_wprobe_event(struct trace_iterator *iter, int flags,
   250			   struct trace_event *event)
   251	{
   252		struct wprobe_trace_entry_head *field;
   253		struct trace_seq *s = &iter->seq;
   254		struct trace_probe *tp;
   255	
   256		field = (struct wprobe_trace_entry_head *)iter->ent;
   257		tp = trace_probe_primary_from_call(
   258			container_of(event, struct trace_event_call, event));
   259		if (WARN_ON_ONCE(!tp))
   260			goto out;
   261	
   262		trace_seq_printf(s, "%s: (", trace_probe_name(tp));
   263	
 > 264		if (!seq_print_ip_sym_offset(s, field->ip, flags))
   265			goto out;
   266	
   267		trace_seq_putc(s, ')');
   268	
   269		if (trace_probe_print_args(s, tp->args, tp->nr_args,
   270				     (u8 *)&field[1], field) < 0)
   271			goto out;
   272	
   273		trace_seq_putc(s, '\n');
   274	out:
   275		return trace_handle_return(s);
   276	}
   277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

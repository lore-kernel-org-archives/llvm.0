Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFF5245B01;
	Fri, 14 Feb 2025 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526774; cv=none; b=mPeVJjHIfG7W/BZ+tjBs70UhNqU01PLWzPXwUQ7X/mCn0NOFcZD5IeWgTD5B+7pshdXcXi5SkWK0XoH9d9okppQCQ2PlkrDLlCawv9J/TMYaFuZVw/iU/z4hZzYKhpC8C9i8huz2rePJjc7D4V68wskLbeWao/c05w4oglxuipw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526774; c=relaxed/simple;
	bh=Q2GLg2Ix3oJH2aSftQVDhySr55iaLzQztNTe7NKGzs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMlB0jjvtk4Fj9YOhB6KJtubvyO4EvLHAAKbLiztAgnoYg93cGVDzEiAe5ongQagZopiUfGqbr0uqzeQJpdnDazMraVbdlbb0CNqeKAIKyQ0Odr9QsldqolcKluRcOOLaCstuz47ReEMbENbPQpfTgduUGNuzW7m+guP32/sgB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9SPymFp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9SPymFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739526773; x=1771062773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q2GLg2Ix3oJH2aSftQVDhySr55iaLzQztNTe7NKGzs0=;
  b=G9SPymFp8ZeTxhIveT5/1n6qSCUeX3bgaTe017QCRB2bS/JkfvIMTcux
   pkkMAWmF2VP6woUvvPUolojv3tUL2TpKFYvFcippYgn06Z+EweYF2W+8O
   qc091pQMDClTEIe5Xxj/8h6w7FGVY/XyAviXQr6x8LfyKAD33f3hTEXsA
   g2PBEzhtV6hC4UV6UPIHM5D1SJD1R/3KAoMNV61hGYxlK6UMsgZqk/fLc
   WDStaIMY/lpHidh3/K/Utgg6JjXjg9RdoDOmurKRP3fj2wzfNlUKFHm5C
   EopEhQwus5KCCkulRZM2RQRvoqyLtLM02lzY2tBtob0GD3MpD/HfVwuWI
   w==;
X-CSE-ConnectionGUID: UuIZr37wRiCgGypPIBDPXg==
X-CSE-MsgGUID: xKDB1M88RJa6oPVAOrpyNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50484976"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="50484976"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 01:52:53 -0800
X-CSE-ConnectionGUID: 0Vjz3su7Tf6WLgy7UW1g6A==
X-CSE-MsgGUID: fb6+pPMbSDS6uIG0KS32Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="113605790"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2025 01:52:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tisNL-0019LX-1U;
	Fri, 14 Feb 2025 09:52:47 +0000
Date: Fri, 14 Feb 2025 17:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gabriele Monaco <gmonaco@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: Re: [PATCH v2 03/11] sched: Add sched tracepoints for RV task model
Message-ID: <202502141719.Jdm44al4-lkp@intel.com>
References: <20250213090819.419470-4-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213090819.419470-4-gmonaco@redhat.com>

Hi Gabriele,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4dc1d1bec89864d8076e5ab314f86f46442bfb02]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/tracing-Fix-DECLARE_TRACE_CONDITION/20250213-171642
base:   4dc1d1bec89864d8076e5ab314f86f46442bfb02
patch link:    https://lore.kernel.org/r/20250213090819.419470-4-gmonaco%40redhat.com
patch subject: [PATCH v2 03/11] sched: Add sched tracepoints for RV task model
config: arm-randconfig-001-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141719.Jdm44al4-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141719.Jdm44al4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141719.Jdm44al4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:503:2: error: call to undeclared function '__do_trace_sched_set_state_tp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           __do_trace_sched_set_state_tp(current, current->__state, state_value);
           ^
   kernel/sched/core.c:503:2: note: did you mean 'trace_sched_set_state_tp'?
   include/trace/events/sched.h:835:1: note: 'trace_sched_set_state_tp' declared here
   DECLARE_TRACE_CONDITION(sched_set_state_tp,
   ^
   include/linux/tracepoint.h:472:2: note: expanded from macro 'DECLARE_TRACE_CONDITION'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:409:2: note: expanded from macro '__DECLARE_TRACE'
           __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto))
           ^
   include/linux/tracepoint.h:385:21: note: expanded from macro '__DECLARE_TRACE_COMMON'
           static inline void trace_##name(proto)                          \
                              ^
   <scratch space>:84:1: note: expanded from here
   trace_sched_set_state_tp
   ^
   1 error generated.


vim +/__do_trace_sched_set_state_tp +503 kernel/sched/core.c

   496	
   497	/*
   498	 * Do not call this function directly since it won't check if the tp is enabled.
   499	 * Call the helper macro trace_set_current_state instead.
   500	 */
   501	void __do_trace_set_current_state(int state_value)
   502	{
 > 503		__do_trace_sched_set_state_tp(current, current->__state, state_value);
   504	}
   505	EXPORT_SYMBOL(__do_trace_set_current_state);
   506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

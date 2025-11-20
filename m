Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88D2DF701;
	Thu, 20 Nov 2025 09:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629371; cv=none; b=f+kxdgaIjc3PPVhtWSmxuX+H+HlOWmAnQ5FQ7AbKMKJRuOysa9CDl4IljFWA3gWEDFmv86NrDvixV1v47GF9onrBEND9IZatKSon0XQfvGTO5WI4z2GZpX7X+NyZOmebskahKvzwQxH0IRbVAneMXU00DoHhPPbdwFQA3uyKx18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629371; c=relaxed/simple;
	bh=yXvs2KDycSylVISwJ73D/rNosGM3R6yQRiEMNCjLckQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+rfmVp/11az2QlaPXdwWX1TzlPGtu55t9r5d5QzB5J88MOOPMiN1ODj0wiMovf6ZPm/YPrrvmcg5DSx+TosDnLS0OkgPu20kohpzetrzs7qN/wlKQ/Q+BXdq49CW1Ig10vMTxsjZ9HejCxIz/T08oAD5D/ByUj5CJR8aXRDlnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Am9OD9ml; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Am9OD9ml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763629370; x=1795165370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yXvs2KDycSylVISwJ73D/rNosGM3R6yQRiEMNCjLckQ=;
  b=Am9OD9mlZ7TCvHtPYqfr//bT4pIaWUdpe7TKof6oePdXIW8ipPL92iG6
   RgBy+A8Iznv0W1/tDm/nt71gSCCm9+ySLg4IlL6r2R0YsEBXqwJ3mcwUE
   brhUoTCesUXI0Aotdip0y1pe9l3EPIc7ePaL/tKWIiNiSW7AKtAsKb0pu
   2DiSpyskyEDdgyI9uxdflUwNv3Jl4AtmokDqxscfBlrDSiGp3c1Q7uf+k
   skhoFQgKuTXLZ2b8CTsm2qp9Q7pCIWr4xZeu/8QSGS9vSVgzPjTShx4B/
   JEsMxzzopVDzxaYKdHurCsyfIeP6Z7hBcNqp73d/RrL6zYWcC0/ymm29I
   g==;
X-CSE-ConnectionGUID: LqBzta/4Spi8NYHfBFyLUw==
X-CSE-MsgGUID: RiPByFbZQkOzpHcZq/jTMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68297907"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="68297907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 01:02:48 -0800
X-CSE-ConnectionGUID: hCgqMp//RxiOA5LSoCf0UA==
X-CSE-MsgGUID: CnkPL94dRy+Da8fmHhDuDQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2025 01:02:46 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM0Yu-0003nb-0m;
	Thu, 20 Nov 2025 09:02:44 +0000
Date: Thu, 20 Nov 2025 17:01:44 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [POC][RFC][PATCH 1/3] tracing: Add perf events
Message-ID: <202511201858.3pMxCiBz-lkp@intel.com>
References: <20251118003531.644484343@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118003531.644484343@kernel.org>

Hi Steven,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]
[also build test ERROR on next-20251119]
[cannot apply to linus/master v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Add-perf-events/20251118-083721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20251118003531.644484343%40kernel.org
patch subject: [POC][RFC][PATCH 1/3] tracing: Add perf events
config: s390-randconfig-001-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201858.3pMxCiBz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201858.3pMxCiBz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201858.3pMxCiBz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_output.c:1681:18: error: incomplete definition of type 'struct perf_event_entry'
    1681 |         for (val = field->values; val < end; val++) {
         |                    ~~~~~^
   kernel/trace/trace_output.c:1672:9: note: forward declaration of 'struct perf_event_entry'
    1672 |         struct perf_event_entry *field;
         |                ^
   kernel/trace/trace_output.c:1682:19: error: incomplete definition of type 'struct perf_event_entry'
    1682 |                 if (val != field->values)
         |                            ~~~~~^
   kernel/trace/trace_output.c:1672:9: note: forward declaration of 'struct perf_event_entry'
    1672 |         struct perf_event_entry *field;
         |                ^
>> kernel/trace/trace_output.c:1684:11: error: call to undeclared function 'PERF_TRACE_VALUE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1684 |                 value = PERF_TRACE_VALUE(*val);
         |                         ^
>> kernel/trace/trace_output.c:1685:11: error: call to undeclared function 'PERF_TRACE_TYPE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1685 |                 switch (PERF_TRACE_TYPE(*val)) {
         |                         ^
>> kernel/trace/trace_output.c:1686:8: error: use of undeclared identifier 'PERF_TRACE_CYCLES'; did you mean 'PERF_TRACE_TYPE'?
    1686 |                 case PERF_TRACE_CYCLES:
         |                      ^~~~~~~~~~~~~~~~~
         |                      PERF_TRACE_TYPE
   kernel/trace/trace_output.c:1685:11: note: 'PERF_TRACE_TYPE' declared here
    1685 |                 switch (PERF_TRACE_TYPE(*val)) {
         |                         ^
>> kernel/trace/trace_output.c:1686:8: error: integer constant expression must have integer type, not 'int ()'
    1686 |                 case PERF_TRACE_CYCLES:
         |                      ^~~~~~~~~~~~~~~~~
>> kernel/trace/trace_output.c:1689:8: error: use of undeclared identifier 'PERF_TRACE_CACHE'; did you mean 'PERF_TRACE_VALUE'?
    1689 |                 case PERF_TRACE_CACHE:
         |                      ^~~~~~~~~~~~~~~~
         |                      PERF_TRACE_VALUE
   kernel/trace/trace_output.c:1684:11: note: 'PERF_TRACE_VALUE' declared here
    1684 |                 value = PERF_TRACE_VALUE(*val);
         |                         ^
   kernel/trace/trace_output.c:1689:8: error: integer constant expression must have integer type, not 'int ()'
    1689 |                 case PERF_TRACE_CACHE:
         |                      ^~~~~~~~~~~~~~~~
   kernel/trace/trace_output.c:1714:18: error: incomplete definition of type 'struct perf_event_entry'
    1714 |         for (val = field->values; val < end; val++) {
         |                    ~~~~~^
   kernel/trace/trace_output.c:1705:9: note: forward declaration of 'struct perf_event_entry'
    1705 |         struct perf_event_entry *field;
         |                ^
   kernel/trace/trace_output.c:1715:19: error: incomplete definition of type 'struct perf_event_entry'
    1715 |                 if (val != field->values)
         |                            ~~~~~^
   kernel/trace/trace_output.c:1705:9: note: forward declaration of 'struct perf_event_entry'
    1705 |         struct perf_event_entry *field;
         |                ^
   10 errors generated.


vim +1681 kernel/trace/trace_output.c

  1665	
  1666	static enum print_line_t
  1667	trace_perf_event_print(struct trace_iterator *iter, int flags,
  1668			       struct trace_event *event)
  1669	{
  1670		struct trace_entry *entry = iter->ent;
  1671		struct trace_seq *s = &iter->seq;
  1672		struct perf_event_entry *field;
  1673		u64 value;
  1674		u64 *val;
  1675		u64 *end;
  1676	
  1677		end = (u64 *)((long)iter->ent + iter->ent_size);
  1678	
  1679		trace_assign_type(field, entry);
  1680	
> 1681		for (val = field->values; val < end; val++) {
  1682			if (val != field->values)
  1683				trace_seq_putc(s, ' ');
> 1684			value = PERF_TRACE_VALUE(*val);
> 1685			switch (PERF_TRACE_TYPE(*val)) {
> 1686			case PERF_TRACE_CYCLES:
  1687				trace_seq_printf(s, "cpu_cycles: %lld", value);
  1688				break;
> 1689			case PERF_TRACE_CACHE:
  1690				trace_seq_printf(s, "cache_misses: %lld", value);
  1691				break;
  1692			default:
  1693				trace_seq_printf(s, "unkown(%d): %lld",
  1694						 (int)PERF_TRACE_TYPE(*val), value);
  1695			}
  1696		}
  1697		trace_seq_putc(s, '\n');
  1698		return trace_handle_return(s);
  1699	}
  1700	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

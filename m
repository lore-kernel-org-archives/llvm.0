Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A0D748A;
	Wed, 11 Sep 2024 03:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726025963; cv=none; b=kZI5Ir+CAR+XQonM6lmhumZyyh6jcIo5WShOOvhGDcnaHAHbQSwUVPaUM1lzpClAquXswXgmAlU0kYXE/trqHq24rieufSfJrprVOW5G3idh3UxROse1+KVKba1DOWg4wg8KKvkAkKXQWKgSvzOCvaG/pzp9wkhZBPPWCh0ttz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726025963; c=relaxed/simple;
	bh=L7h6NF/2DgBU0EtDVSJPLPCv+0ZhaDnRDR/m3EqRXFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPWLd8TUb5Ggp2e9Lv3wh1qcn2+5bjkKDi+/NXyzVfgtPvcQNsi40455LpidESkrFJqOcIqkNJrlYGIGWsKHySVyHaTYQArWHjL9UoXak7n5ba0GvpRZp+hEELiMB9FC4NapLPGaMEeGq0dr1HCuXC9ilpDCr5z958v+mgP/dR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nr0Kk+u8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nr0Kk+u8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726025962; x=1757561962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L7h6NF/2DgBU0EtDVSJPLPCv+0ZhaDnRDR/m3EqRXFE=;
  b=Nr0Kk+u8ejz15vItrCzZBPwqP92E8k3HFnEffiLKb1QsAK1BFEVeT/Sv
   Db1ftc6OQer94OfI00pxrQO0aL1GqgYWrIhXiM+kDUlDWqE4+HSOY30JY
   PvuASUDN/b1k5mPVZz/pCnq2sWJlO9ubf8YetOBwE5VSf3LiAWkXDfOOE
   42tHO0K0ap53SBEO1JJHW7DdxRCRqRNjonbZGpF4t2melRsTm0dS+o6PH
   NZSfvCwaUnXzidcbzOM8P8HKl82T5PgbdCvOkjoRi4ZVCDQPS2ng0bJtZ
   IeVCJdsIxvIK7T+gPmNotX9C8PhBf4pOErm2OYMWsNJ6xVxgyGi+Nua+l
   Q==;
X-CSE-ConnectionGUID: D3eXF3soRR+oGqiedbbJ4w==
X-CSE-MsgGUID: iVThA4pESd2sh6hVd6LFoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24743519"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24743519"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 20:38:29 -0700
X-CSE-ConnectionGUID: pOwEa6sOR2i6ndaarmOiZw==
X-CSE-MsgGUID: k2j81DtjSG2kGaEoXMLYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="67737788"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Sep 2024 20:38:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soEBV-00030k-2A;
	Wed, 11 Sep 2024 03:38:25 +0000
Date: Wed, 11 Sep 2024 11:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Donglin Peng <dolinux.peng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] function_graph: Support recording and printing the
 function return address
Message-ID: <202409111115.i1L43FTN-lkp@intel.com>
References: <20240908142544.1409032-1-dolinux.peng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240908142544.1409032-1-dolinux.peng@gmail.com>

Hi Donglin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc7]
[cannot apply to next-20240910]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donglin-Peng/function_graph-Support-recording-and-printing-the-function-return-address/20240908-222737
base:   linus/master
patch link:    https://lore.kernel.org/r/20240908142544.1409032-1-dolinux.peng%40gmail.com
patch subject: [RFC PATCH] function_graph: Support recording and printing the function return address
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240911/202409111115.i1L43FTN-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111115.i1L43FTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111115.i1L43FTN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_functions_graph.c:830:3: error: call to undeclared function 'print_graph_retaddr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     830 |                 print_graph_retaddr(s, call, tr->trace_flags, true);
         |                 ^
   1 error generated.


vim +/print_graph_retaddr +830 kernel/trace/trace_functions_graph.c

   797	
   798	static enum print_line_t
   799	print_graph_entry_nested(struct trace_iterator *iter,
   800				 struct ftrace_graph_ent_entry *entry,
   801				 struct trace_seq *s, int cpu, u32 flags)
   802	{
   803		struct ftrace_graph_ent *call = &entry->graph_ent;
   804		struct fgraph_data *data = iter->private;
   805		struct trace_array *tr = iter->tr;
   806		int i;
   807	
   808		if (data) {
   809			struct fgraph_cpu_data *cpu_data;
   810			int cpu = iter->cpu;
   811	
   812			cpu_data = per_cpu_ptr(data->cpu_data, cpu);
   813			cpu_data->depth = call->depth;
   814	
   815			/* Save this function pointer to see if the exit matches */
   816			if (call->depth < FTRACE_RETFUNC_DEPTH &&
   817			    !WARN_ON_ONCE(call->depth < 0))
   818				cpu_data->enter_funcs[call->depth] = call->func;
   819		}
   820	
   821		/* No time */
   822		print_graph_duration(tr, 0, s, flags | FLAGS_FILL_FULL);
   823	
   824		/* Function */
   825		for (i = 0; i < call->depth * TRACE_GRAPH_INDENT; i++)
   826			trace_seq_putc(s, ' ');
   827	
   828		trace_seq_printf(s, "%ps() {", (void *)call->func);
   829		if (flags & __TRACE_GRAPH_PRINT_RETADDR)
 > 830			print_graph_retaddr(s, call, tr->trace_flags, true);
   831		trace_seq_putc(s, '\n');
   832	
   833		if (trace_seq_has_overflowed(s))
   834			return TRACE_TYPE_PARTIAL_LINE;
   835	
   836		/*
   837		 * we already consumed the current entry to check the next one
   838		 * and see if this is a leaf.
   839		 */
   840		return TRACE_TYPE_NO_CONSUME;
   841	}
   842	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

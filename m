Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88602F0C6B;
	Sat, 20 Dec 2025 19:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766259528; cv=none; b=TkO7OFXM0qAYdhuzCCBz33cXOBGtDB2qZcoXkSGbJke9Nc7p32SitUeJL8aWM9DFt4Y9WG4B5foNaJJx72obphVdOW53vIKxSAv+HH8KL62cuT5C8H1NWcjuQovBMf++jVm4nY1lKaIT5G9F35IzOkuGK32GIXmb4CaCcdhK6+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766259528; c=relaxed/simple;
	bh=1GWReUGplOwGxcytr02vQVe2hYUxmjhJo00fyQ3IrEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YK4xzVBTfeB1mODjotZ+IpJGRe/INFVPYRPwwsUTmzke0m0hN8bhlJ8coZL228HXQqm9pJLv3u6Br2mKk7K7CPt09CtlZ8AutrPvzjo0FQBVd4D6CVONnb/N4dz3/9jXJjnXBBoe+lf63NzcvUdKvyEZYCyxoFns+VCBXNT7gz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OA5yoWfK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OA5yoWfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766259526; x=1797795526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1GWReUGplOwGxcytr02vQVe2hYUxmjhJo00fyQ3IrEk=;
  b=OA5yoWfKMA/E2cMIuvC0PpipRmyVsH6rY4ErUclNEXVWshF/3NDpH7Md
   x2O5Hs5lIKUIbcK75TE+GwGQkFXi6wWkDWysA1A9DpoP2etDK7Blmusvz
   rz6UCF5ggk1AOaRx6FLsu8KTM6si5FihsNCTCQP5MPyxfryknirZKKrJw
   dXzbSHdU+Olt6SeMeCsYBNShj1iV2bHTnonFHbXCuKsE9Damy5fJy+j8v
   siO64jIPHdXsN/EJipMyYyUoiI6mGMCQmunNLG0HlXQT54C1bZqDt296Y
   DXIvfbImdrRowfOUfh69rdWvxHjNnlTV8uKZVvzV4k39yR2vnS9o5SB/5
   Q==;
X-CSE-ConnectionGUID: aUEv8WVpTtyy1kVW5BbIDA==
X-CSE-MsgGUID: vxuzAiN+Rx6A0DLmo1DGQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85599363"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85599363"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:38:46 -0800
X-CSE-ConnectionGUID: 4UvXX/ZDQCemeNPyxn8PdA==
X-CSE-MsgGUID: n4ZP9A7dTKKU/y9jQj5Wjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198907422"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2025 11:38:42 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2ml-0000000054r-2AIJ;
	Sat, 20 Dec 2025 19:38:39 +0000
Date: Sun, 21 Dec 2025 03:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: Re: [PATCHv5 bpf-next 9/9] bpf,x86: Use single ftrace_ops for direct
 calls
Message-ID: <202512210241.4wuAmCHu-lkp@intel.com>
References: <20251215211402.353056-10-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215211402.353056-10-jolsa@kernel.org>

Hi Jiri,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/ftrace-bpf-Remove-FTRACE_OPS_FL_JMP-ftrace_ops-flag/20251216-052916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251215211402.353056-10-jolsa%40kernel.org
patch subject: [PATCHv5 bpf-next 9/9] bpf,x86: Use single ftrace_ops for direct calls
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20251221/202512210241.4wuAmCHu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b324c9f4fa112d61a553bf489b5f4f7ceea05ea8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210241.4wuAmCHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210241.4wuAmCHu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:367:9: error: call to undeclared function 'direct_ops_del'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     367 |                 ret = direct_ops_del(tr, old_addr);
         |                       ^
   kernel/bpf/trampoline.c:367:9: note: did you mean 'direct_ops_free'?
   kernel/bpf/trampoline.c:298:13: note: 'direct_ops_free' declared here
     298 | static void direct_ops_free(struct bpf_trampoline *tr) { }
         |             ^
>> kernel/bpf/trampoline.c:381:9: error: call to undeclared function 'direct_ops_mod'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     381 |                 ret = direct_ops_mod(tr, new_addr, lock_direct_mutex);
         |                       ^
   kernel/bpf/trampoline.c:381:9: note: did you mean 'direct_ops_free'?
   kernel/bpf/trampoline.c:298:13: note: 'direct_ops_free' declared here
     298 | static void direct_ops_free(struct bpf_trampoline *tr) { }
         |             ^
>> kernel/bpf/trampoline.c:404:9: error: call to undeclared function 'direct_ops_add'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     404 |                 ret = direct_ops_add(tr, new_addr);
         |                       ^
   kernel/bpf/trampoline.c:404:9: note: did you mean 'direct_ops_free'?
   kernel/bpf/trampoline.c:298:13: note: 'direct_ops_free' declared here
     298 | static void direct_ops_free(struct bpf_trampoline *tr) { }
         |             ^
   3 errors generated.


vim +/direct_ops_del +367 kernel/bpf/trampoline.c

   360	
   361	static int unregister_fentry(struct bpf_trampoline *tr, u32 orig_flags,
   362				     void *old_addr)
   363	{
   364		int ret;
   365	
   366		if (tr->func.ftrace_managed)
 > 367			ret = direct_ops_del(tr, old_addr);
   368		else
   369			ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr, NULL);
   370	
   371		return ret;
   372	}
   373	
   374	static int modify_fentry(struct bpf_trampoline *tr, u32 orig_flags,
   375				 void *old_addr, void *new_addr,
   376				 bool lock_direct_mutex)
   377	{
   378		int ret;
   379	
   380		if (tr->func.ftrace_managed) {
 > 381			ret = direct_ops_mod(tr, new_addr, lock_direct_mutex);
   382		} else {
   383			ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr,
   384							   new_addr);
   385		}
   386		return ret;
   387	}
   388	
   389	/* first time registering */
   390	static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
   391	{
   392		void *ip = tr->func.addr;
   393		unsigned long faddr;
   394		int ret;
   395	
   396		faddr = ftrace_location((unsigned long)ip);
   397		if (faddr) {
   398			if (!tr->fops)
   399				return -ENOTSUPP;
   400			tr->func.ftrace_managed = true;
   401		}
   402	
   403		if (tr->func.ftrace_managed) {
 > 404			ret = direct_ops_add(tr, new_addr);
   405		} else {
   406			ret = bpf_trampoline_update_fentry(tr, 0, NULL, new_addr);
   407		}
   408	
   409		return ret;
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630C11B6CE4;
	Sat, 17 May 2025 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747471585; cv=none; b=ZRNKIzSfoMyLT19ttOQvLHhfEUjSWRKY28q517xu4MwUKd9hS50dwfWzRRfe1eirqyXSThlUVOEB11XWCUHrjYbdh77hLJzx1YiNhcy8r1h17C7wY3Q4Kq15pGmPzfyu6lJQYOmmrEcNYuNZqE0YSQ30ot8UCU3luo7+6C15YE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747471585; c=relaxed/simple;
	bh=hdQyCEyJVkHdstU2HK3NhtnPK5BAJSVFBJnj/nXFts4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElsNVtaa/Npa+3YWM1tIx+2oUaDDsGghCSve4AnPeLTTkiyvwXhgDuQFTNu1AWEAZ0wdaoHHTphOsGpmi4kBYxvOhVE9v3vFxJZqKPjE842GDNS2paaIP+ap9gR63P4IMb4bLdczEfSNI/gb1klESUC4tHhYuQ3ETxktYO9tjEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpkCGCpa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpkCGCpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747471582; x=1779007582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hdQyCEyJVkHdstU2HK3NhtnPK5BAJSVFBJnj/nXFts4=;
  b=bpkCGCpao8d3c8nCXNzO1nldE6BSgHKNV0quLnC9dOFOeIj0SqOJPjiv
   wryPec7roI76CgKd+6qE3BZS7odR5pj6sO/GVFjh3TmGFNeWkeZkppqea
   I+E1QKzRkvNK+C6qaQRzFsE2LEBku1N9LAIQ13QCXJgyYU4xtZr/QvDSZ
   wNyyfu9LUL+9Ph7Dfwh44effTsKkWoC+Zdu1Awzwax31rxSgE6/sSmUZa
   906nyT4PM/Ak5LZlmVztJycQtKQBXDBNoAcsT9rnf7WZATs/7jYiCpv/a
   6i1OHPrXZ5Q5aXQ6Ps7Wcu8wKxk5tBV9siYXawarzyRWQoF/jynBs5hpm
   w==;
X-CSE-ConnectionGUID: z6j6V3WvSH2jCkqPSVwQkQ==
X-CSE-MsgGUID: sYZT6Cc+QwKffXaxSXhTgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49579826"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="49579826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 01:46:20 -0700
X-CSE-ConnectionGUID: IlETRW7KQeCtYCz/vJB3iw==
X-CSE-MsgGUID: BMbftkicRHusI1hAIfxFVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="139925721"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 May 2025 01:46:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGDBR-000K21-1h;
	Sat, 17 May 2025 08:46:17 +0000
Date: Sat, 17 May 2025 16:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 3/4] drivers: firmware: add riscv SSE support
Message-ID: <202505171615.CDDgY2HV-lkp@intel.com>
References: <20250516152355.560448-4-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516152355.560448-4-cleger@rivosinc.com>

Hi Clément,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.15-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-L-ger/riscv-add-SBI-SSE-extension-definitions/20250516-232636
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250516152355.560448-4-cleger%40rivosinc.com
patch subject: [PATCH v4 3/4] drivers: firmware: add riscv SSE support
config: riscv-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171615.CDDgY2HV-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171615.CDDgY2HV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171615.CDDgY2HV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/riscv/riscv_sse.c:395:31: warning: variable 'reg_evt' set but not used [-Wunused-but-set-variable]
     395 |         struct sse_registered_event *reg_evt;
         |                                      ^
   1 warning generated.


vim +/reg_evt +395 drivers/firmware/riscv/riscv_sse.c

   390	
   391	int sse_event_enable(struct sse_event *event)
   392	{
   393		int ret = 0, cpu;
   394		struct sse_per_cpu_evt cpu_evt;
 > 395		struct sse_registered_event *reg_evt;
   396	
   397		scoped_guard(mutex, &sse_mutex) {
   398			cpus_read_lock();
   399			if (sse_event_is_global(event->evt_id)) {
   400				reg_evt = event->global;
   401				ret = sse_event_enable_local(event);
   402			} else {
   403				cpu_evt.event = event;
   404				atomic_set(&cpu_evt.error, 0);
   405				cpu_evt.func = SBI_SSE_EVENT_ENABLE;
   406				on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
   407				ret = atomic_read(&cpu_evt.error);
   408				if (ret) {
   409					cpu_evt.func = SBI_SSE_EVENT_DISABLE;
   410					on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
   411				} else {
   412					for_each_online_cpu(cpu) {
   413	
   414					}
   415				}
   416			}
   417			cpus_read_unlock();
   418		}
   419	
   420		return ret;
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

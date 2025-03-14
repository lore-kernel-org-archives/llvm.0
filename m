Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AEF1FA272;
	Fri, 14 Mar 2025 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958264; cv=none; b=Yvc7BeOdN+NIYqB9NIudgKkuDQVVMsjAKWPoSkNhfrLAr87M2Kb0NONKQ/YnyhWAOXP+8l0MZq+ukfnTo311KjilQxIMZuNY3AYjw4w/VhJwlYDaa3Y6ccxSGCvFPEHGlt6enXfOw4VzDvu5PP2iPBnkOYOh+TyEDweAzMntxoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958264; c=relaxed/simple;
	bh=i0RUTrC9FArwpoikzWhzz/4Mx27vZuQrifBU6jKpdAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aba7AzinWu4+fKK030LF04FDi613DI7j3T8CtTouSMaiV/x/gotkG1Wb9ud3L2JqF+Tf4TtxYjzZD16v6REfZg/Lg0xrqHvMuf1/VqzTd5THt8gmfXXKwLFNfCryUyfSilTeQIrz8l3Tq7koC5c2ywVDrfIitkgr7zuJ/Y2gJGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9C09LUg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9C09LUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741958263; x=1773494263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i0RUTrC9FArwpoikzWhzz/4Mx27vZuQrifBU6jKpdAA=;
  b=V9C09LUgoXN2/L4qOgSum8+1SKxRyQNKmjlvwktYJs7B4SpLOWQL+O2M
   Oo5Vwerf57GvsM63kzaFY7zmHrqHnusbBrgTdTh5NJc4peJcxb4yBrBOf
   VNkjJN6SQkAyDKDykEYt90rTCSH2FGRI2gZX7tQkaYyrfsGEP3Ulw4R1B
   tFAYJNSE2uqD4hEjGugmymv83s9Mwyx7pmdM4QEAJhQuWt6MC0UX/2tjQ
   ru0zIB4NZK04QnZRwgziPjYR0iVRu/MpjmAKfpXZS6f890mJRyolkKtsV
   1/TDgaTkVOEGKUArgvjlXIDgEHHpPHTyHRIipfmoFXuJdAh8DdOFtde6g
   g==;
X-CSE-ConnectionGUID: hugzCZ2jQIWQ8O/QufWN+w==
X-CSE-MsgGUID: CWoXP86WQC6vL4W/lWuLZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="47005041"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="47005041"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 06:17:36 -0700
X-CSE-ConnectionGUID: IRMnjMhLTnSC16EIsR02pw==
X-CSE-MsgGUID: mJXH0MOjSiqIV7GBUg3iOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121994941"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Mar 2025 06:17:35 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt4uq-000ATn-2P;
	Fri, 14 Mar 2025 13:17:32 +0000
Date: Fri, 14 Mar 2025 21:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [linux-next:master 7927/11207] kernel/trace/trace.c:6021:38: error:
 incomplete definition of type 'struct module'
Message-ID: <202503142112.7icZH5p9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: dca91c1c54686914dec4dabea8bae4f365c02007 [7927/11207] tracing: Have persistent trace instances save module addresses
config: arm64-randconfig-003-20250314 (https://download.01.org/0day-ci/archive/20250314/202503142112.7icZH5p9-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503142112.7icZH5p9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503142112.7icZH5p9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:6021:38: error: incomplete definition of type 'struct module'
           entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
                                            ~~~^
   include/linux/printk.h:394:8: note: forward declaration of 'struct module'
   struct module;
          ^
>> kernel/trace/trace.c:6021:44: error: use of undeclared identifier 'MOD_TEXT'
           entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
                                                     ^
   kernel/trace/trace.c:6022:30: error: incomplete definition of type 'struct module'
           strscpy(entry->mod_name, mod->name);
                                    ~~~^
   include/linux/string.h:114:55: note: expanded from macro 'strscpy'
           CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
                                                                ^~~
   include/linux/string.h:80:21: note: expanded from macro '__strscpy0'
           sized_strscpy(dst, src, sizeof(dst) + __must_be_array(dst) +    \
                              ^~~
   include/linux/printk.h:394:8: note: forward declaration of 'struct module'
   struct module;
          ^
   3 errors generated.


vim +6021 kernel/trace/trace.c

  6001	
  6002	static int save_mod(struct module *mod, void *data)
  6003	{
  6004		struct trace_array *tr = data;
  6005		struct trace_scratch *tscratch;
  6006		struct trace_mod_entry *entry;
  6007		unsigned int size;
  6008	
  6009		tscratch = tr->scratch;
  6010		if (!tscratch)
  6011			return -1;
  6012		size = tr->scratch_size;
  6013	
  6014		if (struct_size(tscratch, entries, tscratch->nr_entries + 1) > size)
  6015			return -1;
  6016	
  6017		entry = &tscratch->entries[tscratch->nr_entries];
  6018	
  6019		tscratch->nr_entries++;
  6020	
> 6021		entry->mod_addr = (unsigned long)mod->mem[MOD_TEXT].base;
  6022		strscpy(entry->mod_name, mod->name);
  6023	
  6024		return 0;
  6025	}
  6026	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBB919C54F;
	Thu, 23 Oct 2025 01:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761181693; cv=none; b=iPSV3y9DnJ/6huuJjVxR8nwoQVoTx/ZUnsekXMm2TqUKN/1Be0GcUYxdJ8vlSc6EOVN9N3bSVfp9KPESyFPpp8xPQ6qEP58n1kx4ahGEDkGGMFjVPZb+/htwuhHQJ8lTAp7Ktg6b7avhCTcsV/9zjXGhUNmXMw0xEPd/doNP/L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761181693; c=relaxed/simple;
	bh=V2xH8CrV0x07Tz9IL7s+/J8UUldR4fEYaOHHzniw8J0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CPRIZIvRIFABy/RGol9ww13Jg2Q9DGXEwrB0X52cNGUKWFmBtEQ0TEiFluY73V8RJfAo2Q2Wv1Od01oh314FrADky5JdND7/7X/agnjLGyde637a1q6Pdm911mdpEg8zptSR6gmuydXtkapgI2/WVle9TpdLDWR6cffwsYA7vgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mplkn7Ng; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mplkn7Ng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761181691; x=1792717691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2xH8CrV0x07Tz9IL7s+/J8UUldR4fEYaOHHzniw8J0=;
  b=Mplkn7NgcSl2gnU10SPgs04pOgjYSV8yZVUCKi2Mf1D45+6rPFzHKSQX
   Dm6/4dLsdYzCaqHUISMhvO9QLGFNme2IGy7noPQeKPcgaUkoxwYp/qKTJ
   ei1Jc7S/uUw3/kDJIFT/ph3slGjrxeHRG3gSmTemsq6L+R104tneb7mwd
   RycbTX+0yAG2CNzTByLKg27Noy+VQIr5wqWZmj8dHv/BEn6b6tgotUq0P
   6By7BV1Z+exFlYb8OEglq3n7+NJtL9nT1nDR4pOKCcjYgnFHcHvN+IJxP
   0BkFcMmzlsAaIRKDO3bCF9p+wyPugYZx6EAIX7HFL2FpRHCOgz+CYfoyj
   g==;
X-CSE-ConnectionGUID: p1AH6Hh/Tiqd+Hwre6z97w==
X-CSE-MsgGUID: 15oahBHVTWqm34h4FDu2Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63235935"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63235935"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 18:08:10 -0700
X-CSE-ConnectionGUID: hgPEflC6ShC+oXOGyvWzbA==
X-CSE-MsgGUID: oPWwwFNtQu+Zvk5W9owg4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="207679102"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2025 18:08:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBjoF-000CsN-19;
	Thu, 23 Oct 2025 01:08:07 +0000
Date: Thu, 23 Oct 2025 09:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 5/9] kernel/trace/trace.h:907:24:
 error: incomplete definition of type 'struct ftrace_hash'
Message-ID: <202510230912.B4itW3wM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   3d31a310468694e4395d61e15c65edaa618fbb5c
commit: f8ebea380de850914a1a05fd98c4e7c683626424 [5/9] ftrace: Export some of hash related functions
config: hexagon-randconfig-002-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230912.B4itW3wM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230912.B4itW3wM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230912.B4itW3wM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/trace_sched_wakeup.c:16:
   include/linux/ftrace.h:575:5: warning: no previous prototype for function 'update_ftrace_direct_add' [-Wmissing-prototypes]
     575 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:575:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     575 | int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:580:5: warning: no previous prototype for function 'update_ftrace_direct_del' [-Wmissing-prototypes]
     580 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:580:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     580 | int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:585:5: warning: no previous prototype for function 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     585 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         |     ^
   include/linux/ftrace.h:585:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     585 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         | ^
         | static 
   In file included from kernel/trace/trace_sched_wakeup.c:20:
>> kernel/trace/trace.h:907:24: error: incomplete definition of type 'struct ftrace_hash'
     907 |         return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
         |                           ~~~~^
   include/linux/ftrace.h:84:8: note: forward declaration of 'struct ftrace_hash'
      84 | struct ftrace_hash;
         |        ^
   In file included from kernel/trace/trace_sched_wakeup.c:20:
   kernel/trace/trace.h:907:40: error: incomplete definition of type 'struct ftrace_hash'
     907 |         return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
         |                                           ~~~~^
   include/linux/ftrace.h:84:8: note: forward declaration of 'struct ftrace_hash'
      84 | struct ftrace_hash;
         |        ^
   3 warnings and 2 errors generated.


vim +907 kernel/trace/trace.h

4046bf023b0647 Namhyung Kim            2017-01-20  904  
eb583cd484f9a7 Arnd Bergmann           2017-01-23  905  static __always_inline bool ftrace_hash_empty(struct ftrace_hash *hash)
4046bf023b0647 Namhyung Kim            2017-01-20  906  {
8c08f0d5c6fb10 Steven Rostedt (VMware  2017-06-26 @907) 	return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
4046bf023b0647 Namhyung Kim            2017-01-20  908  }
4046bf023b0647 Namhyung Kim            2017-01-20  909  

:::::: The code at line 907 was first introduced by commit
:::::: 8c08f0d5c6fb10ff93ffb1cbf416f4f1c3a52a80 ftrace: Have cached module filters be an active filter

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

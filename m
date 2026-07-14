Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C645B2E173D;
	Tue, 14 Jul 2026 06:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011792; cv=none; b=TLhvPTNJbib4EjTImbQV/Nbkvc7UjDkHhXvdZNZanHTYRS7CLbVWAejZZODBsSdbWxwYd/aoqE9APBSkH7AeCiiwVTj+eFHy+UQztzulMZNYlDRcX7RzuNQYN67fRn6vMJabiwc+RGkpy+nUPU6WYceYJQ1Vb8VZEA6wlw1bTFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011792; c=relaxed/simple;
	bh=k25tR3t/12RBKq2b3YV6UPKsIMCjvTXZilkpDi2/D6k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CZiFVz4nvNRRKfLMg74Z22IIfxyoknFGwjSDRJeV4Ehovgm/U4OfdtNGZWh9rC5e5IzJr1QMse5Fyh++/aSyvcIeQdxGVyEg+XRLDYAgpmDFuW5YcM/VOEI2OnWV42b3DzkLgNSWGE5x/ygGCqCLVgaKEA2y7D4UT4+IYpixE9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5X7FMZ4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5X7FMZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784011789; x=1815547789;
  h=date:from:to:cc:subject:message-id;
  bh=k25tR3t/12RBKq2b3YV6UPKsIMCjvTXZilkpDi2/D6k=;
  b=Q5X7FMZ4n//wNl8Dd4GfLr89S6+4JTHehTy29TEsfWipJbZiG4YlMOz7
   hyppoV50fCOcAlbv7bpI8D+nEZCm/RcYZvdoG0cCYqpVnQrX4crqn/svC
   HCPS7M3kEhMfNnYS8yk6z6rvfuvjDYCGxWjva3zYT+jKqPfDGU1dxWlen
   QE/uqSjvAJSbhSUMOtLwsQHPHl9co7fKMI/j9VToxCi62sCAieTXLAQLd
   ilV6XijTLKKcuIoKV9KtV2csZVuzjz/CuhQHPl4dRl0SheYX0+/o31Rbl
   avHvHIFLx5ZV50xmSPJQPmz36KJ7cBoVjRg9b/HVFupLAk0//DZsZSGQj
   w==;
X-CSE-ConnectionGUID: 29m8BcekSce73hMoiIZJ3g==
X-CSE-MsgGUID: x/i2c8VMQAO95sr49RHqoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95273433"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="95273433"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 23:49:48 -0700
X-CSE-ConnectionGUID: q43yn4OiQWyhjhGcpdDluw==
X-CSE-MsgGUID: 3BdGRF+PT3i8pEucSC0eGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="254027844"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 Jul 2026 23:49:48 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjWxd-000000003uX-1Of8;
	Tue, 14 Jul 2026 06:49:45 +0000
Date: Tue, 14 Jul 2026 08:48:46 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/bpf/diagnostics.c:179:40: warning: diagnostic
 behavior may be improved by adding the 'format(printf, 2, 3)' attribute to
 the declaration of 'diag_write'
Message-ID: <202607140852.i9ntTAJ9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/bpf-Add-verifier-diagnostics-report-helpers/20260713-235352
head:   481b092f62f3f331a53a188543b27495e7a1763c
commit: 1d00722166456d81ed4d556f7d213f162146d1ce bpf: Add verifier diagnostic event log
date:   15 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260714/202607140852.i9ntTAJ9-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607140852.i9ntTAJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607140852.i9ntTAJ9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/diagnostics.c:179:40: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'diag_write' [-Wmissing-format-attribute]
     171 | static void diag_write(struct bpf_verifier_env *env, const char *fmt, ...)
         | __attribute__((format(printf, 2, 3))) 
     172 | {
     173 |         va_list args;
     174 | 
     175 |         if (!bpf_diag_enabled(env))
     176 |                 return;
     177 | 
     178 |         va_start(args, fmt);
     179 |         bpf_verifier_vlog(&env->log, fmt, args);
         |                                               ^
   kernel/bpf/diagnostics.c:171:13: note: 'diag_write' declared here
     171 | static void diag_write(struct bpf_verifier_env *env, const char *fmt, ...)
         |             ^
   kernel/bpf/diagnostics.c:321:48: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'diag_vprint_indented' [-Wmissing-format-attribute]
     314 | static void diag_vprint_indented(struct bpf_verifier_env *env, const char *fmt, va_list args)
         | __attribute__((format(printf, 2, 0))) 
     315 | {
     316 |         char *buf;
     317 | 
     318 |         if (!bpf_diag_enabled(env))
     319 |                 return;
     320 | 
     321 |         buf = kvasprintf(GFP_KERNEL_ACCOUNT, fmt, args);
         |                                                       ^
   kernel/bpf/diagnostics.c:314:13: note: 'diag_vprint_indented' declared here
     314 | static void diag_vprint_indented(struct bpf_verifier_env *env, const char *fmt, va_list args)
         |             ^
   kernel/bpf/diagnostics.c:432:77: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'diag_insn_print' [-Wmissing-format-attribute]
     422 | static void diag_insn_print(void *private_data, const char *fmt, ...)
         | __attribute__((format(printf, 2, 3))) 
     423 | {
     424 |         struct bpf_diag_insn_ctx *ctx = private_data;
     425 |         struct bpf_diag_insn_buf *buf = &ctx->buf;
     426 |         va_list args;
     427 | 
     428 |         if (buf->len >= buf->size)
     429 |                 return;
     430 | 
     431 |         va_start(args, fmt);
     432 |         buf->len += vscnprintf(buf->buf + buf->len, buf->size - buf->len, fmt, args);
         |                                                                                    ^
   kernel/bpf/diagnostics.c:422:13: note: 'diag_insn_print' declared here
     422 | static void diag_insn_print(void *private_data, const char *fmt, ...)
         |             ^
   kernel/bpf/diagnostics.c:738:13: warning: unused function 'diag_print_history' [-Wunused-function]
     738 | static void diag_print_history(struct bpf_verifier_env *env)
         |             ^~~~~~~~~~~~~~~~~~
   kernel/bpf/diagnostics.c:594:13: warning: unused function 'diag_report_reason' [-Wunused-function]
     594 | static void diag_report_reason(struct bpf_verifier_env *env, const char *fmt, ...)
         |             ^~~~~~~~~~~~~~~~~~
   kernel/bpf/diagnostics.c:608:13: warning: unused function 'diag_report_suggestion' [-Wunused-function]
     608 | static void diag_report_suggestion(struct bpf_verifier_env *env, const char *fmt, ...)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +179 kernel/bpf/diagnostics.c

   170	
   171	static void diag_write(struct bpf_verifier_env *env, const char *fmt, ...)
   172	{
   173		va_list args;
   174	
   175		if (!bpf_diag_enabled(env))
   176			return;
   177	
   178		va_start(args, fmt);
 > 179		bpf_verifier_vlog(&env->log, fmt, args);
   180		va_end(args);
   181	}
   182	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

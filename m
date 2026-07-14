Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC952D8DCA;
	Tue, 14 Jul 2026 05:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005669; cv=none; b=lDwywBNUjChvdSkMobnl+K95/ANHkApJRQ5EYQttTqlcR5KZzDA4OoJAn8qlm0IjFKbaOLRW0398fWqcriVBykFtVMjJq/I3QmsUAOzSx5YOYMU21QMU4NZNGitrSRifrErXbJFfMSQ0OkVCDXbUjtdrrzpbV28k4NSrYAPTo+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005669; c=relaxed/simple;
	bh=fIqr3w7apKhaTPAR89n/+Iu9ke2D6YI+23vEXTDhR6w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JMmLZKwGswR9EeyAuuxT6nX87QY4NQusJuPySeCdLvTbWhaRMayPUUo5iPZQjuK6F7cmNI0W1ywXmB4N+9Zcs9pAhAW8o/ofLwVw28bJyUzuS9swd3Fcvms6w3trWBXA9x/P/Y/pW7bK29/uwye333da/mDwNzbTt+3VaXiGSc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyn2ZFhe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyn2ZFhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784005667; x=1815541667;
  h=date:from:to:cc:subject:message-id;
  bh=fIqr3w7apKhaTPAR89n/+Iu9ke2D6YI+23vEXTDhR6w=;
  b=cyn2ZFheuqTC33vaA8OmrgEwrJggo2sD5uylGQ898fDu9EtKAuyso0+l
   CCRUISrNm7Alc+SbIRLV1jvbUAG8+d/Ybo71aQtVdC1Euq39gngldj/H/
   VQgWakaAOc+rSoj4KMArA84K7sFf4+mk7+8EzG3YJEIVTAj88ECmR0Rxi
   z/+8sECczcoYNONo1mX/6jlZCmh6Krbl49k9jFM3TZI2wtCgvnpcbeIQK
   bw+Q5BW9zZN67lYngfRg1Ds2r4GdlHSvNbZB8SqJ8I1zkv+1wUvy4Fkfj
   WtMj2WVvU9F+SXW10TnqGMfmZKLoKpxdx76VdcLSiYMjySQhcYvQmWL+8
   Q==;
X-CSE-ConnectionGUID: oUYlQ1daTEWUMTR5hlYySA==
X-CSE-MsgGUID: jYPxWCfZRKGKHxMrVylujQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84640885"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84640885"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:07:46 -0700
X-CSE-ConnectionGUID: tyHskaqWTAq2tYsSimRsPg==
X-CSE-MsgGUID: u5h4PeZYT2CbD5K6wT9zgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="279011426"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jul 2026 22:07:45 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjVMt-000000003sT-1gWr;
	Tue, 14 Jul 2026 05:07:43 +0000
Date: Tue, 14 Jul 2026 07:07:30 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/bpf/diagnostics.c:328:77: warning: diagnostic
 behavior may be improved by adding the 'format(printf, 2, 3)' attribute to
 the declaration of 'diag_insn_print'
Message-ID: <202607140753.mH4et9Aj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/bpf-Add-verifier-diagnostics-report-helpers/20260713-235352
head:   481b092f62f3f331a53a188543b27495e7a1763c
commit: 680f28821329be1a104e6110eadde4658c51eab7 bpf: Add source and instruction diagnostic context
date:   13 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260714/202607140753.mH4et9Aj-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607140753.mH4et9Aj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607140753.mH4et9Aj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/diagnostics.c:166:40: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'diag_log' [-Wmissing-format-attribute]
     158 | static void diag_log(struct bpf_verifier_env *env, const char *fmt, ...)
         | __attribute__((format(printf, 2, 3))) 
     159 | {
     160 |         va_list args;
     161 | 
     162 |         if (!bpf_diag_enabled(env))
     163 |                 return;
     164 | 
     165 |         va_start(args, fmt);
     166 |         bpf_verifier_vlog(&env->log, fmt, args);
         |                                               ^
   kernel/bpf/diagnostics.c:158:13: note: 'diag_log' declared here
     158 | static void diag_log(struct bpf_verifier_env *env, const char *fmt, ...)
         |             ^
   kernel/bpf/diagnostics.c:217:48: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'diag_vprint_indented' [-Wmissing-format-attribute]
     210 | static void diag_vprint_indented(struct bpf_verifier_env *env, const char *fmt, va_list args)
         | __attribute__((format(printf, 2, 0))) 
     211 | {
     212 |         char *buf;
     213 | 
     214 |         if (!bpf_diag_enabled(env))
     215 |                 return;
     216 | 
     217 |         buf = kvasprintf(GFP_KERNEL_ACCOUNT, fmt, args);
         |                                                       ^
   kernel/bpf/diagnostics.c:210:13: note: 'diag_vprint_indented' declared here
     210 | static void diag_vprint_indented(struct bpf_verifier_env *env, const char *fmt, va_list args)
         |             ^
>> kernel/bpf/diagnostics.c:328:77: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'diag_insn_print' [-Wmissing-format-attribute]
     318 | static void diag_insn_print(void *private_data, const char *fmt, ...)
         | __attribute__((format(printf, 2, 3))) 
     319 | {
     320 |         struct bpf_diag_insn_ctx *ctx = private_data;
     321 |         struct bpf_diag_insn_buf *buf = &ctx->buf;
     322 |         va_list args;
     323 | 
     324 |         if (buf->len >= buf->size)
     325 |                 return;
     326 | 
     327 |         va_start(args, fmt);
     328 |         buf->len += vscnprintf(buf->buf + buf->len, buf->size - buf->len, fmt, args);
         |                                                                                    ^
   kernel/bpf/diagnostics.c:318:13: note: 'diag_insn_print' declared here
     318 | static void diag_insn_print(void *private_data, const char *fmt, ...)
         |             ^
   kernel/bpf/diagnostics.c:446:2: error: call to undeclared function 'diag_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     446 |         diag_write(env, "  %s\n", source_lane);
         |         ^
   kernel/bpf/diagnostics.c:446:2: note: did you mean 'down_write'?
   include/linux/rwsem.h:241:13: note: 'down_write' declared here
     241 | extern void down_write(struct rw_semaphore *sem) __acquires(sem);
         |             ^
   kernel/bpf/diagnostics.c:455:2: error: call to undeclared function 'diag_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     455 |         diag_write(env, "  %s%*d | %s\n", diag_insn->idx == focus_insn_idx ? ">>> " : "    ",
         |         ^
   kernel/bpf/diagnostics.c:531:3: error: call to undeclared function 'diag_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     531 |                 diag_write(env, "  %*s | %*s^-- %s: %s\n", line_width + 4, "", indent, "", label,
         |                 ^
   kernel/bpf/diagnostics.c:606:2: error: call to undeclared function 'diag_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     606 |         diag_write(env, "  Source context:\n");
         |         ^
   3 warnings and 4 errors generated.


vim +328 kernel/bpf/diagnostics.c

   317	
   318	static void diag_insn_print(void *private_data, const char *fmt, ...)
   319	{
   320		struct bpf_diag_insn_ctx *ctx = private_data;
   321		struct bpf_diag_insn_buf *buf = &ctx->buf;
   322		va_list args;
   323	
   324		if (buf->len >= buf->size)
   325			return;
   326	
   327		va_start(args, fmt);
 > 328		buf->len += vscnprintf(buf->buf + buf->len, buf->size - buf->len, fmt, args);
   329		va_end(args);
   330	}
   331	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

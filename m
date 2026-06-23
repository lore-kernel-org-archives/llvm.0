Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE5E3CCFD8;
	Tue, 23 Jun 2026 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204723; cv=none; b=ejDLPFD74CffLwTP88g7Fy6GUOdIK/OAZAei979XPy34B7JxekHU2W3hjFQ/KGnDhIvlFdRHlilymztAHF7ssGyn9WvjGBJTFlE+OILvZ0c7qjKEXk70XMGFDrzOLxdT7rjLuOApIVvN3AgBBpSiOSwFrl88bFErghfjpwceKZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204723; c=relaxed/simple;
	bh=OTCxlHEqbG2Wi/zdqEVbVk9ZvO8Iv8a984+v97hZGMA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TTkCNqbl8DIoNVEIf8M/+XwfnGBtcWy68MgsbTN7kyzVIev2vrzo34aaq3T4MVDhOwcmiaNRYixi5QICffWIbfbWePOretLyc38Bc2gfA4nMs+cKKOYmSZ4d3thL97ifFOKITYiW3FyOV4SVuUL8u5IyGqYXDaO2TG4et1hDUXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JN+/CZ9U; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JN+/CZ9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782204723; x=1813740723;
  h=date:from:to:cc:subject:message-id;
  bh=OTCxlHEqbG2Wi/zdqEVbVk9ZvO8Iv8a984+v97hZGMA=;
  b=JN+/CZ9UTfZOFZcaxMiTiJs0QePNxEZPqnNtKo8aylxGzanrrKhZpovb
   EXKosCzXiqXUP+D/nhOR8rpsMfmiPQ2Gywk7w94gEQuWfyD92lo2G8yOR
   0ynGkfZdOaIcFWCGfTLxP86hEkrLPW4yO5IrJ5bE1xrRrcLY2Wjn74kNI
   jTVkOEisKe9XRQOeGYBaUdcQrUp4Bfbz1hbF0OoAc8rt3W/w0ZnKExNh8
   Ap9jCbhZajshiVqtsaxlg5NJSu6T/NtGrmU+/e1qLPmtIVCD92WzbdhYD
   IAMAwTZG9QdZusPpAlVQ5C1R8LDuBSPgJFcy47t21eDipATccgjHkPhZT
   A==;
X-CSE-ConnectionGUID: co+ur0vURW2VeBHT/cxurg==
X-CSE-MsgGUID: 4hZKt5MnTfqSAtL9EANBNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93306256"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="93306256"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 01:52:02 -0700
X-CSE-ConnectionGUID: +i/1EcrzTt2uIEYSX01LvQ==
X-CSE-MsgGUID: GaqP4nNnRoCfjDqCfpD9Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="253805681"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Jun 2026 01:51:59 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbwrN-000000006B7-1lEl;
	Tue, 23 Jun 2026 08:51:57 +0000
Date: Tue, 23 Jun 2026 10:51:28 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/bpf/diagnostics.c:173:40: warning: diagnostic
 behavior may be improved by adding the 'format(printf, 2, 3)' attribute to
 the declaration of 'bpf_diag_write'
Message-ID: <202606231057.ZN9yj6BS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/bpf-Add-verifier-diagnostics-report-helpers/20260623-020036
head:   f493879d5527a2a895391233ef60947426c29e36
commit: 3792cb60c085922cb245644004fbaa8eef02e73f bpf: Add verifier diagnostic event log
date:   15 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260623/202606231057.ZN9yj6BS-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231057.ZN9yj6BS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231057.ZN9yj6BS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/diagnostics.c:173:40: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'bpf_diag_write' [-Wmissing-format-attribute]
     165 | static void bpf_diag_write(struct bpf_verifier_env *env, const char *fmt, ...)
         | __attribute__((format(printf, 2, 3))) 
     166 | {
     167 |         va_list args;
     168 | 
     169 |         if (!bpf_diag_enabled(env))
     170 |                 return;
     171 | 
     172 |         va_start(args, fmt);
     173 |         bpf_verifier_vlog(&env->log, fmt, args);
         |                                               ^
   kernel/bpf/diagnostics.c:165:13: note: 'bpf_diag_write' declared here
     165 | static void bpf_diag_write(struct bpf_verifier_env *env, const char *fmt, ...)
         |             ^
   kernel/bpf/diagnostics.c:310:48: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'bpf_diag_vprint_indented' [-Wmissing-format-attribute]
     302 | static void bpf_diag_vprint_indented(struct bpf_verifier_env *env,
         | __attribute__((format(printf, 2, 0))) 
     303 |                                      const char *fmt, va_list args)
     304 | {
     305 |         char *buf;
     306 | 
     307 |         if (!bpf_diag_enabled(env))
     308 |                 return;
     309 | 
     310 |         buf = kvasprintf(GFP_KERNEL_ACCOUNT, fmt, args);
         |                                                       ^
   kernel/bpf/diagnostics.c:302:13: note: 'bpf_diag_vprint_indented' declared here
     302 | static void bpf_diag_vprint_indented(struct bpf_verifier_env *env,
         |             ^
   kernel/bpf/diagnostics.c:457:20: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 3)' attribute to the declaration of 'bpf_diag_insn_print' [-Wmissing-format-attribute]
     446 | static void bpf_diag_insn_print(void *private_data, const char *fmt, ...)
         | __attribute__((format(printf, 2, 3))) 
     447 | {
     448 |         struct bpf_diag_insn_ctx *ctx = private_data;
     449 |         struct bpf_diag_insn_buf *buf = &ctx->buf;
     450 |         va_list args;
     451 | 
     452 |         if (buf->len >= buf->size)
     453 |                 return;
     454 | 
     455 |         va_start(args, fmt);
     456 |         buf->len += vscnprintf(buf->buf + buf->len, buf->size - buf->len,
     457 |                                fmt, args);
         |                                         ^
   kernel/bpf/diagnostics.c:446:13: note: 'bpf_diag_insn_print' declared here
     446 | static void bpf_diag_insn_print(void *private_data, const char *fmt, ...)
         |             ^
   kernel/bpf/diagnostics.c:638:13: warning: unused function 'bpf_diag_report_reason' [-Wunused-function]
     638 | static void bpf_diag_report_reason(struct bpf_verifier_env *env,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/diagnostics.c:653:13: warning: unused function 'bpf_diag_report_suggestion' [-Wunused-function]
     653 | static void bpf_diag_report_suggestion(struct bpf_verifier_env *env,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +173 kernel/bpf/diagnostics.c

   164	
   165	static void bpf_diag_write(struct bpf_verifier_env *env, const char *fmt, ...)
   166	{
   167		va_list args;
   168	
   169		if (!bpf_diag_enabled(env))
   170			return;
   171	
   172		va_start(args, fmt);
 > 173		bpf_verifier_vlog(&env->log, fmt, args);
   174		va_end(args);
   175	}
   176	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

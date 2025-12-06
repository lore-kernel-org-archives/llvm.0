Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5481E199230;
	Sat,  6 Dec 2025 06:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765003487; cv=none; b=mwMkOocJBTyjxFVej+zZ/sXPOJ7sG8xVTBNScKcPuzBBgByX9NTayexAt2OKJ4/fvRBtNXvCS01OpbzDGE+03wXnA8Y+k4NnvsLAJ358KUK03G7eS61PqdCeb8fq46LxxCyNRx7gBcLpln7+NzLzrEc+WZXb7BCypQW2xoEXFok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765003487; c=relaxed/simple;
	bh=a2dqGkWGyL4FC1bL0CDuUmiCMrT1OE0ADiDLW/2YVn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mm4RMBfwyqvKuP48kOwDRpUvpr3bQ9ue9sMftiF89h/+rj5o74U0nHfKjb91AB39xotV9QsmUjNSA/Mb34PZwU/8X28BSV+kcRqMUrIysGGnmESveQ8CX7H0NpmOJvgf7nesCGDWw0J1kX5hcADdESFzREX/Soun+nyWT45Mnu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbQkOVyx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbQkOVyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765003485; x=1796539485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a2dqGkWGyL4FC1bL0CDuUmiCMrT1OE0ADiDLW/2YVn4=;
  b=fbQkOVyx1NfQmZuAbDLv4mWkM+Cqt95BfZU2K5SY0zTZ+vyQfJSOdjjt
   8cQ49nhd0Q9xgz48/VCeP0krw6ICcLjMYYZ+ucQhe8eJf5TZuNlWFFlal
   gemkzE1MjJRbnljVAtYcc/o0Trhj8tU1j1uifSBZBN3xC2Wm1VkDzpyQd
   VHXdz29XlvgwyDzfT+vocKuYugLHhumyK2VhdjJQDDA/xrj9w5wSInKlu
   fGdW6qrFhPJkdYbu1/3blu4NemN1MoezHInYpGLaoAGfsoAQddRjxnzLV
   gR1M7XOQuOY57K9iLV+oZLIB8xzxkRO2nRyBNeDDZbNDzHVL08W0//yny
   Q==;
X-CSE-ConnectionGUID: pa6ARu0ARNeAKjOweF1WOg==
X-CSE-MsgGUID: iClYHeRRTBmPaNhiDfJulw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78498639"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="78498639"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 22:44:45 -0800
X-CSE-ConnectionGUID: gDd0UWynSfmHWc1Raf0dnQ==
X-CSE-MsgGUID: yLPZTwk0TOaV4QSOEYEjrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195108321"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Dec 2025 22:44:43 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRm24-00000000Fwh-2vLh;
	Sat, 06 Dec 2025 06:44:40 +0000
Date: Sat, 6 Dec 2025 14:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
	Kees Cook <kees@kernel.org>
Subject: kernel/trace/bpf_trace.c:475:35: warning: diagnostic behavior may be
 improved by adding the 'format(printf, 2, 0)' attribute to the declaration
 of '____bpf_seq_printf'
Message-ID: <202512061425.x0qTt9ww-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f19b84186d297063a1006ca9e1c8597f77a75581
commit: 6b2c1e30ad6846624d935a7ea98dae60458126b8 seq_file: Mark binary printing functions with __printf() attribute
date:   8 months ago
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20251206/202512061425.x0qTt9ww-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061425.x0qTt9ww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061425.x0qTt9ww-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/bpf_trace.c:475:35: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of '____bpf_seq_printf' [-Wmissing-format-attribute]
     458 |         seq_bprintf(m, fmt, data.bin_args);
         |                                          ^
   kernel/trace/bpf_trace.c:458:1: note: '____bpf_seq_printf' declared here
     458 | BPF_CALL_5(bpf_seq_printf, struct seq_file *, m, char *, fmt, u32, fmt_size,
         | ^
   include/linux/filter.h:613:31: note: expanded from macro 'BPF_CALL_5'
     613 | #define BPF_CALL_5(name, ...)   BPF_CALL_x(5, __NOATTR, name, __VA_ARGS__)
         |                                 ^
   include/linux/filter.h:597:6: note: expanded from macro 'BPF_CALL_x'
     597 |         u64 ____##name(__BPF_MAP(x, __BPF_DECL_ARGS, __BPF_V, __VA_ARGS__));   \
         |             ^
   <scratch space>:169:1: note: expanded from here
     169 | ____bpf_seq_printf
         | ^
   kernel/trace/bpf_trace.c:3382:10: warning: default initialization of an object of type 'typeof ((attr->link_create.uprobe_multi.path))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    3382 |         upath = u64_to_user_ptr(attr->link_create.uprobe_multi.path);
         |                 ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   kernel/trace/bpf_trace.c:3383:13: warning: default initialization of an object of type 'typeof ((attr->link_create.uprobe_multi.offsets))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    3383 |         uoffsets = u64_to_user_ptr(attr->link_create.uprobe_multi.offsets);
         |                    ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   kernel/trace/bpf_trace.c:3392:21: warning: default initialization of an object of type 'typeof ((attr->link_create.uprobe_multi.ref_ctr_offsets))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    3392 |         uref_ctr_offsets = u64_to_user_ptr(attr->link_create.uprobe_multi.ref_ctr_offsets);
         |                            ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   kernel/trace/bpf_trace.c:3393:13: warning: default initialization of an object of type 'typeof ((attr->link_create.uprobe_multi.cookies))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    3393 |         ucookies = u64_to_user_ptr(attr->link_create.uprobe_multi.cookies);
         |                    ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   5 warnings generated.


vim +475 kernel/trace/bpf_trace.c

10aceb629e1984 Dave Marchevsky 2021-09-17  457  
492e639f0c2227 Yonghong Song   2020-05-09  458  BPF_CALL_5(bpf_seq_printf, struct seq_file *, m, char *, fmt, u32, fmt_size,
78aa1cc9404399 Jiri Olsa       2022-12-15  459  	   const void *, args, u32, data_len)
492e639f0c2227 Yonghong Song   2020-05-09  460  {
78aa1cc9404399 Jiri Olsa       2022-12-15  461  	struct bpf_bprintf_data data = {
78aa1cc9404399 Jiri Olsa       2022-12-15  462  		.get_bin_args	= true,
78aa1cc9404399 Jiri Olsa       2022-12-15  463  	};
d9c9e4db186ab4 Florent Revest  2021-04-19  464  	int err, num_args;
492e639f0c2227 Yonghong Song   2020-05-09  465  
335ff4990cf3bf Dave Marchevsky 2021-09-17  466  	if (data_len & 7 || data_len > MAX_BPRINTF_VARARGS * 8 ||
78aa1cc9404399 Jiri Olsa       2022-12-15  467  	    (data_len && !args))
d9c9e4db186ab4 Florent Revest  2021-04-19  468  		return -EINVAL;
492e639f0c2227 Yonghong Song   2020-05-09  469  	num_args = data_len / 8;
492e639f0c2227 Yonghong Song   2020-05-09  470  
78aa1cc9404399 Jiri Olsa       2022-12-15  471  	err = bpf_bprintf_prepare(fmt, fmt_size, args, num_args, &data);
492e639f0c2227 Yonghong Song   2020-05-09  472  	if (err < 0)
d9c9e4db186ab4 Florent Revest  2021-04-19  473  		return err;
492e639f0c2227 Yonghong Song   2020-05-09  474  
78aa1cc9404399 Jiri Olsa       2022-12-15 @475  	seq_bprintf(m, fmt, data.bin_args);
48cac3f4a96ddf Florent Revest  2021-04-27  476  
f19a4050455aad Jiri Olsa       2022-12-15  477  	bpf_bprintf_cleanup(&data);
d9c9e4db186ab4 Florent Revest  2021-04-19  478  
d9c9e4db186ab4 Florent Revest  2021-04-19  479  	return seq_has_overflowed(m) ? -EOVERFLOW : 0;
492e639f0c2227 Yonghong Song   2020-05-09  480  }
492e639f0c2227 Yonghong Song   2020-05-09  481  

:::::: The code at line 475 was first introduced by commit
:::::: 78aa1cc9404399a15d2a1205329c6a06236f5378 bpf: Add struct for bin_args arg in bpf_bprintf_prepare

:::::: TO: Jiri Olsa <jolsa@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D082DF128;
	Sat,  6 Dec 2025 08:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765008773; cv=none; b=mJ1zttOiNIYwWNxSFGpemL2Ha50jU4lmYjEKlUoHo9rrm6FOBXyn2stgdVyAztabXebQofuTHM+dJij/EHMsiDe/4kNW4tCQSOV5pQ9GA6gjpZu//GektLpdy5KEZIB31ms6ZG2RwIjSmnZumNRzQeqetRoevrooXCcGaKrt4eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765008773; c=relaxed/simple;
	bh=yDxHJs6T9B471OqsL+FQGFFswPPHIJ0Ji1wBu1SmeRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CcAy+G/LdMd1VrhB2fge5Ep9UlTcHQIMAhZfC0iuv28hSm09DgTVunRryHvnYYKahHoVzXLot1p6Fp8PJnHSfkiRPk/iFeG2ZJszxEZEUjPqymH3knQVIr75WEndpp3yYUoEsFvGGQSgkT3hZ+6Iqn4QgoVIEJZz288JwA10s7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIXvqHD+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIXvqHD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765008772; x=1796544772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDxHJs6T9B471OqsL+FQGFFswPPHIJ0Ji1wBu1SmeRQ=;
  b=oIXvqHD+ZbUy5PJ7yVGaQtlaA1aC2vLQrvWHUlh64V5BXlnBToYrdhCH
   p9Po2//8NuifOhL71yAdNqHWouV0ICgKsKEZfeO6DwwPM+td7PBwBtuD0
   Q6QkA/dg/zrCdWzvYAWrsO7wR8afFfNa5Y5Zc8QDK3FBFIpJ9PuiLgZfD
   pHlXCBmze9BPF7T+vJmcuKLaM+N0LKIpuXzEmvukN+b0QHa4NCY/4qoU/
   pP2EBwTt4wzruWSuocxLfceMvKIs4ycX5bD3ZO6qUQMW/rsTTK3Rw8LK2
   HpR41xhqO56PzVz9SqDTGaFDewmNzxT1zTcOO3ZkeBMEH/1ZOa/v96P/1
   Q==;
X-CSE-ConnectionGUID: McoN0omTScmiQnAXlDtrzw==
X-CSE-MsgGUID: DVTUmwLOSemX2p8SB8zmOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77719287"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="77719287"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 00:12:51 -0800
X-CSE-ConnectionGUID: KeOq250bQu+JVJoyH5av+g==
X-CSE-MsgGUID: mGblOftSTWqDbho4sAyseQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="232860184"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Dec 2025 00:12:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRnPL-00000000G1H-081z;
	Sat, 06 Dec 2025 08:12:47 +0000
Date: Sat, 6 Dec 2025 16:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
	Kees Cook <kees@kernel.org>
Subject: kernel/trace/bpf_trace.c:378:65: warning: diagnostic behavior may be
 improved by adding the 'format(printf, 1, 0)' attribute to the declaration
 of '____bpf_trace_printk'
Message-ID: <202512061640.9hKTnB8p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   416f99c3b16f582a3fc6d64a1f77f39d94b76de5
commit: 7bf819aa992faee980610e9021aec0c38aac53be vsnprintf: Mark binary printing functions with __printf() attribute
date:   8 months ago
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20251206/202512061640.9hKTnB8p-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061640.9hKTnB8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061640.9hKTnB8p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/bpf_trace.c:378:65: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of '____bpf_trace_printk' [-Wmissing-format-attribute]
     363 | BPF_CALL_5(bpf_trace_printk, char *, fmt, u32, fmt_size, u64, arg1,
         | __attribute__((format(printf, 1, 0))) 
     364 |            u64, arg2, u64, arg3)
     365 | {
     366 |         u64 args[MAX_TRACE_PRINTK_VARARGS] = { arg1, arg2, arg3 };
     367 |         struct bpf_bprintf_data data = {
     368 |                 .get_bin_args   = true,
     369 |                 .get_buf        = true,
     370 |         };
     371 |         int ret;
     372 | 
     373 |         ret = bpf_bprintf_prepare(fmt, fmt_size, args,
     374 |                                   MAX_TRACE_PRINTK_VARARGS, &data);
     375 |         if (ret < 0)
     376 |                 return ret;
     377 | 
     378 |         ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt, data.bin_args);
         |                                                                        ^
   kernel/trace/bpf_trace.c:363:1: note: '____bpf_trace_printk' declared here
     363 | BPF_CALL_5(bpf_trace_printk, char *, fmt, u32, fmt_size, u64, arg1,
         | ^
   include/linux/filter.h:613:31: note: expanded from macro 'BPF_CALL_5'
     613 | #define BPF_CALL_5(name, ...)   BPF_CALL_x(5, __NOATTR, name, __VA_ARGS__)
         |                                 ^
   include/linux/filter.h:597:6: note: expanded from macro 'BPF_CALL_x'
     597 |         u64 ____##name(__BPF_MAP(x, __BPF_DECL_ARGS, __BPF_V, __VA_ARGS__));   \
         |             ^
   <scratch space>:141:1: note: expanded from here
     141 | ____bpf_trace_printk
         | ^
>> kernel/trace/bpf_trace.c:433:65: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of '____bpf_trace_vprintk' [-Wmissing-format-attribute]
     415 |         ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt, data.bin_args);
         |                                                                        ^
   kernel/trace/bpf_trace.c:415:1: note: '____bpf_trace_vprintk' declared here
     415 | BPF_CALL_4(bpf_trace_vprintk, char *, fmt, u32, fmt_size, const void *, args,
         | ^
   include/linux/filter.h:612:31: note: expanded from macro 'BPF_CALL_4'
     612 | #define BPF_CALL_4(name, ...)   BPF_CALL_x(4, __NOATTR, name, __VA_ARGS__)
         |                                 ^
   include/linux/filter.h:597:6: note: expanded from macro 'BPF_CALL_x'
     597 |         u64 ____##name(__BPF_MAP(x, __BPF_DECL_ARGS, __BPF_V, __VA_ARGS__));   \
         |             ^
   <scratch space>:154:1: note: expanded from here
     154 | ____bpf_trace_vprintk
         | ^
   kernel/trace/bpf_trace.c:475:35: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of '____bpf_seq_printf' [-Wmissing-format-attribute]
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
   7 warnings generated.


vim +378 kernel/trace/bpf_trace.c

ac5a72ea5c8989 Alan Maguire       2020-07-13  362  
d9c9e4db186ab4 Florent Revest     2021-04-19  363  BPF_CALL_5(bpf_trace_printk, char *, fmt, u32, fmt_size, u64, arg1,
d9c9e4db186ab4 Florent Revest     2021-04-19  364  	   u64, arg2, u64, arg3)
ac5a72ea5c8989 Alan Maguire       2020-07-13  365  {
d9c9e4db186ab4 Florent Revest     2021-04-19  366  	u64 args[MAX_TRACE_PRINTK_VARARGS] = { arg1, arg2, arg3 };
78aa1cc9404399 Jiri Olsa          2022-12-15  367  	struct bpf_bprintf_data data = {
78aa1cc9404399 Jiri Olsa          2022-12-15  368  		.get_bin_args	= true,
e2bb9e01d589f7 Jiri Olsa          2022-12-15  369  		.get_buf	= true,
78aa1cc9404399 Jiri Olsa          2022-12-15  370  	};
ac5a72ea5c8989 Alan Maguire       2020-07-13  371  	int ret;
ac5a72ea5c8989 Alan Maguire       2020-07-13  372  
78aa1cc9404399 Jiri Olsa          2022-12-15  373  	ret = bpf_bprintf_prepare(fmt, fmt_size, args,
78aa1cc9404399 Jiri Olsa          2022-12-15  374  				  MAX_TRACE_PRINTK_VARARGS, &data);
d9c9e4db186ab4 Florent Revest     2021-04-19  375  	if (ret < 0)
d9c9e4db186ab4 Florent Revest     2021-04-19  376  		return ret;
d9c9e4db186ab4 Florent Revest     2021-04-19  377  
e2bb9e01d589f7 Jiri Olsa          2022-12-15 @378  	ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt, data.bin_args);
d9c9e4db186ab4 Florent Revest     2021-04-19  379  
e2bb9e01d589f7 Jiri Olsa          2022-12-15  380  	trace_bpf_trace_printk(data.buf);
ac5a72ea5c8989 Alan Maguire       2020-07-13  381  
f19a4050455aad Jiri Olsa          2022-12-15  382  	bpf_bprintf_cleanup(&data);
ac5a72ea5c8989 Alan Maguire       2020-07-13  383  
d9c9e4db186ab4 Florent Revest     2021-04-19  384  	return ret;
9c959c863f8217 Alexei Starovoitov 2015-03-25  385  }
9c959c863f8217 Alexei Starovoitov 2015-03-25  386  
9c959c863f8217 Alexei Starovoitov 2015-03-25  387  static const struct bpf_func_proto bpf_trace_printk_proto = {
9c959c863f8217 Alexei Starovoitov 2015-03-25  388  	.func		= bpf_trace_printk,
9c959c863f8217 Alexei Starovoitov 2015-03-25  389  	.gpl_only	= true,
9c959c863f8217 Alexei Starovoitov 2015-03-25  390  	.ret_type	= RET_INTEGER,
216e3cd2f28dbb Hao Luo            2021-12-16  391  	.arg1_type	= ARG_PTR_TO_MEM | MEM_RDONLY,
39f19ebbf57b40 Alexei Starovoitov 2017-01-09  392  	.arg2_type	= ARG_CONST_SIZE,
9c959c863f8217 Alexei Starovoitov 2015-03-25  393  };
9c959c863f8217 Alexei Starovoitov 2015-03-25  394  
10aceb629e1984 Dave Marchevsky    2021-09-17  395  static void __set_printk_clr_event(void)
0756ea3e85139d Alexei Starovoitov 2015-06-12  396  {
0756ea3e85139d Alexei Starovoitov 2015-06-12  397  	/*
ac5a72ea5c8989 Alan Maguire       2020-07-13  398  	 * This program might be calling bpf_trace_printk,
ac5a72ea5c8989 Alan Maguire       2020-07-13  399  	 * so enable the associated bpf_trace/bpf_trace_printk event.
ac5a72ea5c8989 Alan Maguire       2020-07-13  400  	 * Repeat this each time as it is possible a user has
ac5a72ea5c8989 Alan Maguire       2020-07-13  401  	 * disabled bpf_trace_printk events.  By loading a program
ac5a72ea5c8989 Alan Maguire       2020-07-13  402  	 * calling bpf_trace_printk() however the user has expressed
ac5a72ea5c8989 Alan Maguire       2020-07-13  403  	 * the intent to see such events.
0756ea3e85139d Alexei Starovoitov 2015-06-12  404  	 */
ac5a72ea5c8989 Alan Maguire       2020-07-13  405  	if (trace_set_clr_event("bpf_trace", "bpf_trace_printk", 1))
ac5a72ea5c8989 Alan Maguire       2020-07-13  406  		pr_warn_ratelimited("could not enable bpf_trace_printk events");
10aceb629e1984 Dave Marchevsky    2021-09-17  407  }
0756ea3e85139d Alexei Starovoitov 2015-06-12  408  
10aceb629e1984 Dave Marchevsky    2021-09-17  409  const struct bpf_func_proto *bpf_get_trace_printk_proto(void)
10aceb629e1984 Dave Marchevsky    2021-09-17  410  {
10aceb629e1984 Dave Marchevsky    2021-09-17  411  	__set_printk_clr_event();
0756ea3e85139d Alexei Starovoitov 2015-06-12  412  	return &bpf_trace_printk_proto;
0756ea3e85139d Alexei Starovoitov 2015-06-12  413  }
0756ea3e85139d Alexei Starovoitov 2015-06-12  414  
78aa1cc9404399 Jiri Olsa          2022-12-15  415  BPF_CALL_4(bpf_trace_vprintk, char *, fmt, u32, fmt_size, const void *, args,
10aceb629e1984 Dave Marchevsky    2021-09-17  416  	   u32, data_len)
10aceb629e1984 Dave Marchevsky    2021-09-17  417  {
78aa1cc9404399 Jiri Olsa          2022-12-15  418  	struct bpf_bprintf_data data = {
78aa1cc9404399 Jiri Olsa          2022-12-15  419  		.get_bin_args	= true,
e2bb9e01d589f7 Jiri Olsa          2022-12-15  420  		.get_buf	= true,
78aa1cc9404399 Jiri Olsa          2022-12-15  421  	};
10aceb629e1984 Dave Marchevsky    2021-09-17  422  	int ret, num_args;
10aceb629e1984 Dave Marchevsky    2021-09-17  423  
10aceb629e1984 Dave Marchevsky    2021-09-17  424  	if (data_len & 7 || data_len > MAX_BPRINTF_VARARGS * 8 ||
78aa1cc9404399 Jiri Olsa          2022-12-15  425  	    (data_len && !args))
10aceb629e1984 Dave Marchevsky    2021-09-17  426  		return -EINVAL;
10aceb629e1984 Dave Marchevsky    2021-09-17  427  	num_args = data_len / 8;
10aceb629e1984 Dave Marchevsky    2021-09-17  428  
78aa1cc9404399 Jiri Olsa          2022-12-15  429  	ret = bpf_bprintf_prepare(fmt, fmt_size, args, num_args, &data);
10aceb629e1984 Dave Marchevsky    2021-09-17  430  	if (ret < 0)
10aceb629e1984 Dave Marchevsky    2021-09-17  431  		return ret;
10aceb629e1984 Dave Marchevsky    2021-09-17  432  
e2bb9e01d589f7 Jiri Olsa          2022-12-15 @433  	ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt, data.bin_args);
10aceb629e1984 Dave Marchevsky    2021-09-17  434  
e2bb9e01d589f7 Jiri Olsa          2022-12-15  435  	trace_bpf_trace_printk(data.buf);
10aceb629e1984 Dave Marchevsky    2021-09-17  436  
f19a4050455aad Jiri Olsa          2022-12-15  437  	bpf_bprintf_cleanup(&data);
10aceb629e1984 Dave Marchevsky    2021-09-17  438  
10aceb629e1984 Dave Marchevsky    2021-09-17  439  	return ret;
10aceb629e1984 Dave Marchevsky    2021-09-17  440  }
10aceb629e1984 Dave Marchevsky    2021-09-17  441  

:::::: The code at line 378 was first introduced by commit
:::::: e2bb9e01d589f7fa82573aedd2765ff9b277816a bpf: Remove trace_printk_lock

:::::: TO: Jiri Olsa <jolsa@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

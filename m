Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8736B49652;
	Wed, 23 Oct 2024 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729684133; cv=none; b=UzFrzAHUkXOsRnne2muh9OZPS8qAwJJNcd+rNfrUMOk8FujTkz57oPJAQsNBbQOGTRkRtw3oUtiNjdh0muzTtQ3C/lyZ+snv6l9QOhd79E6n3kSgygouKoZxQKrDV/IdtjadErWFewdrRESn1z21FIBETe8E0rOg2froYW/CkMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729684133; c=relaxed/simple;
	bh=43Zf78XEYRR4k7/eivlulsx8Vgz7uNU007UyUijKV6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dt1UySLxiBzLlFhbMH4UB4NQKHosFUjNl0bUiU30X/AhtNuejOlx/0WZ7VJToJIh+Gah2nhCMhUeRO/ql+U8Crf6jirgWWmYaE6EwbDBcfq4bqly86MWrHv8AYmiOsjfqA4dP6c1YPX+xJ0gB3XlGDL3IGBs/FKyPugqUlpV7TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIjI4zHh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIjI4zHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729684130; x=1761220130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=43Zf78XEYRR4k7/eivlulsx8Vgz7uNU007UyUijKV6A=;
  b=cIjI4zHh90U58iPCcX+Q5FftU+CG5wtFxqmfM+JDuIuGdUgJSOV+K88N
   7TUYAtNDZ0nH0Ep3sXMqpM3S2aZILXuF7nS0t0ey5B/aOG41+piwRlLqy
   WWfjQqcFtT/ERDhLkO1X6czRARYoVheGzD1VjB4sULrF4pSWarAdH1ynx
   aMfhRRendKtJxyH/JGBWfdQKhG1rmJepn9gao4HnjtLRsYLYLmq2r13AX
   X7WXaZjo/d2t5QO8ro67tjeE9Hdm0KYaCjaEZe3CphrELUaXw+ezA/VD5
   Obj5lXcNb/TmIJPncAjzCQam3Y9nfVnnAXeZfILOHz8OtAhlQColnMb61
   Q==;
X-CSE-ConnectionGUID: LeKxApGmQdS64frMnilHzQ==
X-CSE-MsgGUID: SjX74kyHQ6Scz5XyzNCP0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="54669106"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="54669106"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 04:48:50 -0700
X-CSE-ConnectionGUID: U9c1UnrmR0O+JY3TdDs5UQ==
X-CSE-MsgGUID: J5yzbSQ7RNCRnwzzayLOow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80358817"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Oct 2024 04:48:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Zr4-000UrW-1L;
	Wed, 23 Oct 2024 11:48:46 +0000
Date: Wed, 23 Oct 2024 19:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:trampoline_multi_10 17/21]
 kernel/trace/bpf_trace.c:3501:2: error: call to undeclared function
 'bpf_trampoline_multi_detach'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202410231955.T13VLcJ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git trampoline_multi_10
head:   48132820c5a21b82d1a4507a86a67b3742fb110e
commit: c19eedd8a81d51880a58e66419820e592292cb95 [17/21] bpf: Add support to create tracing multi link
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241023/202410231955.T13VLcJ9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231955.T13VLcJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231955.T13VLcJ9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/bpf_trace.c:8:
   include/linux/bpf.h:1393:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1393 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1399:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1399 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/trace/bpf_trace.c:3501:2: error: call to undeclared function 'bpf_trampoline_multi_detach'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3501 |         bpf_trampoline_multi_detach(link->prog, tr_link);
         |         ^
   kernel/trace/bpf_trace.c:3501:2: note: did you mean 'bpf_tracing_multi_attach'?
   include/linux/trace_events.h:781:5: note: 'bpf_tracing_multi_attach' declared here
     781 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr);
         |     ^
>> kernel/trace/bpf_trace.c:3589:8: error: call to undeclared function 'bpf_trampoline_multi_attach'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3589 |         err = bpf_trampoline_multi_attach(prog, ids, link);
         |               ^
   kernel/trace/bpf_trace.c:3589:8: note: did you mean 'bpf_tracing_multi_attach'?
   kernel/trace/bpf_trace.c:3538:5: note: 'bpf_tracing_multi_attach' declared here
    3538 | int bpf_tracing_multi_attach(struct bpf_prog *prog,
         |     ^
   2 warnings and 2 errors generated.


vim +/bpf_trampoline_multi_detach +3501 kernel/trace/bpf_trace.c

  3495	
  3496	static void bpf_tracing_multi_link_release(struct bpf_link *link)
  3497	{
  3498		struct bpf_tracing_multi_link *tr_link =
  3499			container_of(link, struct bpf_tracing_multi_link, link);
  3500	
> 3501		bpf_trampoline_multi_detach(link->prog, tr_link);
  3502	}
  3503	
  3504	static void bpf_tracing_multi_link_dealloc(struct bpf_link *link)
  3505	{
  3506		struct bpf_tracing_multi_link *tr_link =
  3507			container_of(link, struct bpf_tracing_multi_link, link);
  3508	
  3509		kfree(tr_link);
  3510	}
  3511	
  3512	static void bpf_tracing_multi_link_show_fdinfo(const struct bpf_link *link,
  3513						       struct seq_file *seq)
  3514	{
  3515		struct bpf_tracing_multi_link *tr_link =
  3516			container_of(link, struct bpf_tracing_multi_link, link);
  3517	
  3518		seq_printf(seq, "attach_type:\t%d\n", tr_link->attach_type);
  3519	}
  3520	
  3521	static int bpf_tracing_multi_link_fill_link_info(const struct bpf_link *link,
  3522							 struct bpf_link_info *info)
  3523	{
  3524		struct bpf_tracing_multi_link *tr_link =
  3525			container_of(link, struct bpf_tracing_multi_link, link);
  3526	
  3527		info->tracing.attach_type = tr_link->attach_type;
  3528		return 0;
  3529	}
  3530	
  3531	static const struct bpf_link_ops bpf_tracing_multi_link_lops = {
  3532		.release = bpf_tracing_multi_link_release,
  3533		.dealloc = bpf_tracing_multi_link_dealloc,
  3534		.show_fdinfo = bpf_tracing_multi_link_show_fdinfo,
  3535		.fill_link_info = bpf_tracing_multi_link_fill_link_info,
  3536	};
  3537	
  3538	int bpf_tracing_multi_attach(struct bpf_prog *prog,
  3539				     const union bpf_attr *attr)
  3540	{
  3541		struct bpf_attach_target_info tgt_info = {};
  3542		struct bpf_tracing_multi_link *link = NULL;
  3543		struct bpf_link_primer link_primer;
  3544		u32 i, j, cnt, *ids = NULL;
  3545		u32 __user *uids;
  3546		int err;
  3547	
  3548		if (check_multi_prog_type(prog))
  3549			return -EINVAL;
  3550	
  3551		uids = u64_to_user_ptr(attr->link_create.tracing_multi.btf_ids);
  3552		cnt = attr->link_create.tracing_multi.btf_ids_cnt;
  3553	
  3554		if (!cnt || !uids)
  3555			return -EINVAL;
  3556	
  3557		ids = kvmalloc_array(cnt, sizeof(*ids), GFP_KERNEL);
  3558		if (!ids)
  3559			return -ENOMEM;
  3560	
  3561		if (copy_from_user(ids, uids, cnt * sizeof(*ids))) {
  3562			err = -EFAULT;
  3563			goto error;
  3564		}
  3565	
  3566		link = kzalloc(struct_size(link, nodes, cnt), GFP_KERNEL);
  3567		if (!link) {
  3568			err = -ENOMEM;
  3569			goto error;
  3570		}
  3571	
  3572		bpf_link_init(&link->link, BPF_LINK_TYPE_TRACING_MULTI,
  3573			      &bpf_tracing_multi_link_lops, prog);
  3574		link->attach_type = prog->expected_attach_type;
  3575	
  3576		err = bpf_link_prime(&link->link, &link_primer);
  3577		if (err)
  3578			goto error;
  3579	
  3580		for (i = 0, j = 0; i < cnt; i++) {
  3581			err = bpf_check_attach_target(NULL, prog, NULL, ids[i], &tgt_info);
  3582			if (err)
  3583				continue;
  3584			ids[j++] = ids[i];
  3585		}
  3586	
  3587		link->nodes_cnt = j;
  3588	
> 3589		err = bpf_trampoline_multi_attach(prog, ids, link);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

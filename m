Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DDA333439;
	Tue, 10 Feb 2026 07:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770708272; cv=none; b=Uk93GhoeXqfHlWSA7d+9MzBnxs5FMZJqNfN1Twpm1+vQ4T3oTv4Ak72JB1Zdy8zdjdltdXExKgcCUrpqvmqeFnUoE/GXWQbdYvs1lQgP6UYhdp6fgtYK65tnhJBCuMoRw13tGGe72P4XKnsWaTbjMUtUgl1BTgex6GSY5i7g7TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770708272; c=relaxed/simple;
	bh=9rbt9WlQ8kdKW7ryM1YnazXIHBR0NPez6HTM8TRZd0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SWqQ699vALobUZg6RA+YcCQcWBpLDWOXShitSJUEQ4nJlJ3i9GZSIuz9lXQe4jA2yn9FmUDlDbuQk+ybQA84vWnDzmFPZh9aj6wnuWz5LFu169zTCZ3abjA9+87651q/y+6xeq0RbCuTjI7wMMm7fukC+Opc6rDsEHxxD54pN88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ra3+X9Lz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ra3+X9Lz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770708271; x=1802244271;
  h=date:from:to:cc:subject:message-id;
  bh=9rbt9WlQ8kdKW7ryM1YnazXIHBR0NPez6HTM8TRZd0g=;
  b=Ra3+X9Lz3rYGarDN48kuLf3B/ZD2KiSj0lYSHlReHP2IL8N0Y65IPkih
   FM3cdGhn2cw7BzWCrBvJCKeXQGTUN6ocYHxAitgYdUtxgCEZSPYm06BiE
   v9njtaFrXGpwZIfWHCnrP/H+iUEm44zRNjW//Gop+U18Oa3YyIJelbvOt
   atSOmWfpj4uXBFuVfkfSqHOTU0/m0PqpbMA/xHOaIjNVJgopMNC588atZ
   iwc0MWB+HKVOLQfYsKfe7Jd8PIGIzBdNjPvtgXFOpCGraPekv6CMPJrGb
   XJ9MjsdQkie4Ck+gFC5BcjTEjn+Y9WMz1xvNsjv67pIe3j1MccOxpYh3P
   Q==;
X-CSE-ConnectionGUID: jYvxP/lYSRO+W5Sn/aq2Sg==
X-CSE-MsgGUID: VTwczqDEQGy/spS6i7mHSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="72013932"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72013932"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:24:30 -0800
X-CSE-ConnectionGUID: RZURYc1aQq2aQ31dcj80cw==
X-CSE-MsgGUID: LvtN1rDpTuaY6G8SOwOxqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210927615"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Feb 2026 23:24:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpi6k-00000000olk-0ZsC;
	Tue, 10 Feb 2026 07:24:26 +0000
Date: Tue, 10 Feb 2026 15:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 7/12]
 kernel/trace/bpf_trace.c:3604:2: error: call to undeclared function
 'bpf_trampoline_multi_detach'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202602101545.50lTosiQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   95bf1a3ff57efabf9b7c50b8a0d3583a6714f5d8
commit: f9c3bd532d93de85903acf5e9010bd5cf76ec697 [7/12] bpf: Add support to create tracing multi link
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260210/202602101545.50lTosiQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101545.50lTosiQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101545.50lTosiQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/bpf_trace.c:8:
   include/linux/bpf.h:1551:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1551 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1557:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1557 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/trace/bpf_trace.c:3604:2: error: call to undeclared function 'bpf_trampoline_multi_detach'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3604 |         bpf_trampoline_multi_detach(link->prog, tr_link);
         |         ^
   kernel/trace/bpf_trace.c:3604:2: note: did you mean 'bpf_tracing_multi_attach'?
   include/linux/trace_events.h:781:5: note: 'bpf_tracing_multi_attach' declared here
     781 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr);
         |     ^
>> kernel/trace/bpf_trace.c:3679:8: error: call to undeclared function 'bpf_trampoline_multi_attach'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3679 |         err = bpf_trampoline_multi_attach(prog, ids, link);
         |               ^
   kernel/trace/bpf_trace.c:3679:8: note: did you mean 'bpf_tracing_multi_attach'?
   kernel/trace/bpf_trace.c:3641:5: note: 'bpf_tracing_multi_attach' declared here
    3641 | int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
         |     ^
   2 warnings and 2 errors generated.


vim +/bpf_trampoline_multi_detach +3604 kernel/trace/bpf_trace.c

  3598	
  3599	static void bpf_tracing_multi_link_release(struct bpf_link *link)
  3600	{
  3601		struct bpf_tracing_multi_link *tr_link =
  3602			container_of(link, struct bpf_tracing_multi_link, link);
  3603	
> 3604		bpf_trampoline_multi_detach(link->prog, tr_link);
  3605	}
  3606	
  3607	static void bpf_tracing_multi_link_dealloc(struct bpf_link *link)
  3608	{
  3609		struct bpf_tracing_multi_link *tr_link =
  3610			container_of(link, struct bpf_tracing_multi_link, link);
  3611	
  3612		kfree(tr_link);
  3613	}
  3614	
  3615	static void bpf_tracing_multi_link_show_fdinfo(const struct bpf_link *link,
  3616						       struct seq_file *seq)
  3617	{
  3618		struct bpf_tracing_multi_link *tr_link =
  3619			container_of(link, struct bpf_tracing_multi_link, link);
  3620	
  3621		seq_printf(seq, "attach_type:\t%d\n", tr_link->attach_type);
  3622	}
  3623	
  3624	static int bpf_tracing_multi_link_fill_link_info(const struct bpf_link *link,
  3625							 struct bpf_link_info *info)
  3626	{
  3627		struct bpf_tracing_multi_link *tr_link =
  3628			container_of(link, struct bpf_tracing_multi_link, link);
  3629	
  3630		info->tracing.attach_type = tr_link->attach_type;
  3631		return 0;
  3632	}
  3633	
  3634	static const struct bpf_link_ops bpf_tracing_multi_link_lops = {
  3635		.release = bpf_tracing_multi_link_release,
  3636		.dealloc = bpf_tracing_multi_link_dealloc,
  3637		.show_fdinfo = bpf_tracing_multi_link_show_fdinfo,
  3638		.fill_link_info = bpf_tracing_multi_link_fill_link_info,
  3639	};
  3640	
  3641	int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
  3642	{
  3643		struct bpf_tracing_multi_link *link = NULL;
  3644		struct bpf_link_primer link_primer;
  3645		u32 cnt, *ids = NULL;
  3646		u32 __user *uids;
  3647		int err;
  3648	
  3649		uids = u64_to_user_ptr(attr->link_create.tracing_multi.btf_ids);
  3650		cnt = attr->link_create.tracing_multi.btf_ids_cnt;
  3651	
  3652		if (!cnt || !uids)
  3653			return -EINVAL;
  3654	
  3655		ids = kvmalloc_array(cnt, sizeof(*ids), GFP_KERNEL);
  3656		if (!ids)
  3657			return -ENOMEM;
  3658	
  3659		if (copy_from_user(ids, uids, cnt * sizeof(*ids))) {
  3660			err = -EFAULT;
  3661			goto error;
  3662		}
  3663	
  3664		link = kzalloc(struct_size(link, nodes, cnt), GFP_KERNEL);
  3665		if (!link) {
  3666			err = -ENOMEM;
  3667			goto error;
  3668		}
  3669	
  3670		link->nodes_cnt = cnt;
  3671	
  3672		bpf_link_init(&link->link, BPF_LINK_TYPE_TRACING_MULTI,
  3673			      &bpf_tracing_multi_link_lops, prog, prog->expected_attach_type);
  3674	
  3675		err = bpf_link_prime(&link->link, &link_primer);
  3676		if (err)
  3677			goto error;
  3678	
> 3679		err = bpf_trampoline_multi_attach(prog, ids, link);
  3680		kvfree(ids);
  3681		if (err) {
  3682			bpf_link_cleanup(&link_primer);
  3683			return err;
  3684		}
  3685		return bpf_link_settle(&link_primer);
  3686	
  3687	error:
  3688		kvfree(ids);
  3689		kfree(link);
  3690		return err;
  3691	}
  3692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

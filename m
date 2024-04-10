Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBF740872;
	Wed, 10 Apr 2024 06:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712731001; cv=none; b=eH86p+gpMjBG8PiSkQTRxkBsSMhUYf8XQCGY0iC365Lqm1g+Y4Qnng1wGO7l1RKT/qMcvquZnxq+WvbSBhRxiGiw4714GitBLGd18y6Z33ipenmfeynpH9p5tbi6aVg15zLbuumN8TWFyDza7ILmogHfUTjPxcpqrb/a+u1xy2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712731001; c=relaxed/simple;
	bh=mwOC/r2oofWyVcw9QOCChSCSNQlZ8bn41u+0kTTobm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HH29xLwe/Rbwh7/vhl852ZOh8eSyr0uRZ1XZBtq5jtmepJzXSlod76qTr6WPD9+rPBcSWd7Cis5dFgSjuPAGHP0WCb/Pgg/NtxEhymSoSBnPBkfptyA00TTv3kpBzJrybmLQ53tf/B0/UTBrWV0jRyQmmRgtHD7Vc5J98rPJUz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtaXO6Pu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtaXO6Pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712730999; x=1744266999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mwOC/r2oofWyVcw9QOCChSCSNQlZ8bn41u+0kTTobm8=;
  b=gtaXO6Pu+FwUh+tdZP/RIB3+53hEF7p72B6a2SKVUQETdLI3CE+f9UBp
   uW8vgLG+KsrifW05wj+HpDb0FWn8DGCKYfIXYBN5aZJj5DsBPnUHwKziU
   c1/Zh04AqzuexIsXm/eN3VUOHk+A0/YrKwXQCXoCTBpugoDUoqYTRY0ny
   2A0w+Jtd2wlcoPgbXKA+X6iHuYVLENcGuNZZRyo4q4qETXzxiRiJKyGlL
   a5qU7WO+goOWoN8BmD2OdQeecrp3HatE8InXT8sBvQJ8v8L3KCtbWlWUH
   OZ/15Qn6E2Owg2eqA+GIpCRzB1iyrkrvuwnQjM0QxNMTccUGbxvkbymSM
   w==;
X-CSE-ConnectionGUID: Qo1EvPLFTyC5ZErsq2bE9w==
X-CSE-MsgGUID: q/hFMYdFRRWQpBbyUvj07w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8201174"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8201174"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:36:33 -0700
X-CSE-ConnectionGUID: jGZN9r4jSyufejHxiiqVng==
X-CSE-MsgGUID: 3G66QjnzTCqvIAJcrWpmvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25060280"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Apr 2024 23:36:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruRZM-00070P-2r;
	Wed, 10 Apr 2024 06:36:28 +0000
Date: Wed, 10 Apr 2024 14:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/3] btf: Avoid weak external references
Message-ID: <202404101451.ic99Xrk8-lkp@intel.com>
References: <20240409150132.4097042-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409150132.4097042-8-ardb+git@google.com>

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on bpf-next/master bpf/master linus/master v6.9-rc3 next-20240409]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/kallsyms-Avoid-weak-references-for-kallsyms-symbols/20240409-230510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20240409150132.4097042-8-ardb%2Bgit%40google.com
patch subject: [PATCH v2 3/3] btf: Avoid weak external references
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240410/202404101451.ic99Xrk8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101451.ic99Xrk8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101451.ic99Xrk8-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: kernel/bpf/btf.o: in function `btf_parse_vmlinux':
>> kernel/bpf/btf.c:5910:(.text+0x3b72): undefined reference to `__start_BTF'
>> s390x-linux-ld: kernel/bpf/btf.c:5911:(.text+0x3b78): undefined reference to `__stop_BTF'


vim +5910 kernel/bpf/btf.c

49f4e6720748c7 Jiri Olsa               2020-07-11  5888  
8580ac9404f624 Alexei Starovoitov      2019-10-15  5889  struct btf *btf_parse_vmlinux(void)
8580ac9404f624 Alexei Starovoitov      2019-10-15  5890  {
8580ac9404f624 Alexei Starovoitov      2019-10-15  5891  	struct btf_verifier_env *env = NULL;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5892  	struct bpf_verifier_log *log;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5893  	struct btf *btf = NULL;
49f4e6720748c7 Jiri Olsa               2020-07-11  5894  	int err;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5895  
8580ac9404f624 Alexei Starovoitov      2019-10-15  5896  	env = kzalloc(sizeof(*env), GFP_KERNEL | __GFP_NOWARN);
8580ac9404f624 Alexei Starovoitov      2019-10-15  5897  	if (!env)
8580ac9404f624 Alexei Starovoitov      2019-10-15  5898  		return ERR_PTR(-ENOMEM);
8580ac9404f624 Alexei Starovoitov      2019-10-15  5899  
8580ac9404f624 Alexei Starovoitov      2019-10-15  5900  	log = &env->log;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5901  	log->level = BPF_LOG_KERNEL;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5902  
8580ac9404f624 Alexei Starovoitov      2019-10-15  5903  	btf = kzalloc(sizeof(*btf), GFP_KERNEL | __GFP_NOWARN);
8580ac9404f624 Alexei Starovoitov      2019-10-15  5904  	if (!btf) {
8580ac9404f624 Alexei Starovoitov      2019-10-15  5905  		err = -ENOMEM;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5906  		goto errout;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5907  	}
8580ac9404f624 Alexei Starovoitov      2019-10-15  5908  	env->btf = btf;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5909  
90ceddcb495008 Fangrui Song            2020-03-18 @5910  	btf->data = __start_BTF;
90ceddcb495008 Fangrui Song            2020-03-18 @5911  	btf->data_size = __stop_BTF - __start_BTF;
5329722057d41a Andrii Nakryiko         2020-11-09  5912  	btf->kernel_btf = true;
5329722057d41a Andrii Nakryiko         2020-11-09  5913  	snprintf(btf->name, sizeof(btf->name), "vmlinux");
8580ac9404f624 Alexei Starovoitov      2019-10-15  5914  
8580ac9404f624 Alexei Starovoitov      2019-10-15  5915  	err = btf_parse_hdr(env);
8580ac9404f624 Alexei Starovoitov      2019-10-15  5916  	if (err)
8580ac9404f624 Alexei Starovoitov      2019-10-15  5917  		goto errout;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5918  
8580ac9404f624 Alexei Starovoitov      2019-10-15  5919  	btf->nohdr_data = btf->data + btf->hdr.hdr_len;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5920  
8580ac9404f624 Alexei Starovoitov      2019-10-15  5921  	err = btf_parse_str_sec(env);
8580ac9404f624 Alexei Starovoitov      2019-10-15  5922  	if (err)
8580ac9404f624 Alexei Starovoitov      2019-10-15  5923  		goto errout;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5924  
8580ac9404f624 Alexei Starovoitov      2019-10-15  5925  	err = btf_check_all_metas(env);
8580ac9404f624 Alexei Starovoitov      2019-10-15  5926  	if (err)
8580ac9404f624 Alexei Starovoitov      2019-10-15  5927  		goto errout;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5928  
eb596b0905584a Kumar Kartikeya Dwivedi 2022-04-19  5929  	err = btf_check_type_tags(env, btf, 1);
eb596b0905584a Kumar Kartikeya Dwivedi 2022-04-19  5930  	if (err)
eb596b0905584a Kumar Kartikeya Dwivedi 2022-04-19  5931  		goto errout;
eb596b0905584a Kumar Kartikeya Dwivedi 2022-04-19  5932  
a2d0d62f4d9e35 Andrey Ignatov          2020-06-19  5933  	/* btf_parse_vmlinux() runs under bpf_verifier_lock */
49f4e6720748c7 Jiri Olsa               2020-07-11  5934  	bpf_ctx_convert.t = btf_type_by_id(btf, bpf_ctx_convert_btf_id[0]);
91cc1a99740e2e Alexei Starovoitov      2019-11-14  5935  
d3e42bb0a329fa Martin KaFai Lau        2020-01-27  5936  	bpf_struct_ops_init(btf, log);
27ae7997a66174 Martin KaFai Lau        2020-01-08  5937  
8580ac9404f624 Alexei Starovoitov      2019-10-15  5938  	refcount_set(&btf->refcnt, 1);
5329722057d41a Andrii Nakryiko         2020-11-09  5939  
5329722057d41a Andrii Nakryiko         2020-11-09  5940  	err = btf_alloc_id(btf);
5329722057d41a Andrii Nakryiko         2020-11-09  5941  	if (err)
5329722057d41a Andrii Nakryiko         2020-11-09  5942  		goto errout;
5329722057d41a Andrii Nakryiko         2020-11-09  5943  
5329722057d41a Andrii Nakryiko         2020-11-09  5944  	btf_verifier_env_free(env);
8580ac9404f624 Alexei Starovoitov      2019-10-15  5945  	return btf;
8580ac9404f624 Alexei Starovoitov      2019-10-15  5946  
8580ac9404f624 Alexei Starovoitov      2019-10-15  5947  errout:
8580ac9404f624 Alexei Starovoitov      2019-10-15  5948  	btf_verifier_env_free(env);
8580ac9404f624 Alexei Starovoitov      2019-10-15  5949  	if (btf) {
8580ac9404f624 Alexei Starovoitov      2019-10-15  5950  		kvfree(btf->types);
8580ac9404f624 Alexei Starovoitov      2019-10-15  5951  		kfree(btf);
8580ac9404f624 Alexei Starovoitov      2019-10-15  5952  	}
8580ac9404f624 Alexei Starovoitov      2019-10-15  5953  	return ERR_PTR(err);
8580ac9404f624 Alexei Starovoitov      2019-10-15  5954  }
8580ac9404f624 Alexei Starovoitov      2019-10-15  5955  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

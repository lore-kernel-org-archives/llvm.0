Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD7A199384;
	Wed, 23 Oct 2024 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729674766; cv=none; b=Uqca2iVsyqU4LewPKsom6bZAiCMk+d8KONp3jaEmm38yi20cl1ZsSh3zFXyBfhTptdiNMRmwQKgbCEjtrDuAjIOPRJYLrmYQahWRoH//28c90f3MEEzTpg2Wp1xXI+rOchTJCv3jAg+Q6OQuJXRoRU0TVpbtbTp4I+ksNwZ43AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729674766; c=relaxed/simple;
	bh=gVdV2Bnn6OcoRVW0O3Dqc0Vc2bGdjMYolywSFuOa8mI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aw19eAmvIRncng3wIVJaIeePRfhpMThh3bdhcKR0HHZp+7YhlaoymMRtKnDyachotPpBem19jreFwGAPSaUnDDef9qPuOQVsvBHxwIUPovwe06rRCDlq07NPnwTJCHXrrAuIqi2LEq9NHn8pE5bgLsGAXDNTWCY3Z+HWqIkwEao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5wI08ly; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5wI08ly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729674765; x=1761210765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gVdV2Bnn6OcoRVW0O3Dqc0Vc2bGdjMYolywSFuOa8mI=;
  b=L5wI08lyIPFXwCfJ1OhA/iC29TPJLNddZqf7cSklps0VdAtvjuNKS7Vq
   L+4oYEoZrFH6+U9zJ/zrLMQ71k2bCJCEnmolFHYBtPcqeQ/1CyNkhESX3
   2kk/IxsaT2y8wgX6+sRMkGsnTperS03dwupVh2xwdNlcmrcqHeefKUcFS
   LF/ykvhIzjnPHU0KTFTfZMYbKQnGgH7EwFcnrfxYX6WMxFWubx2rbr3vs
   ldjY25UaP2BSjbc71iaHrrtdWUCx4iCMGRFDWT4tXhsEBe4tF9GkSgyLe
   ur35QrhZleZDiNuV/7Uuli11GL6dnk8sRvkgITMrpxdXCwXOyYx7sHjA4
   w==;
X-CSE-ConnectionGUID: M2ur1CItT1mGDpddtNE1qw==
X-CSE-MsgGUID: FPKZyyX3Q1exUVMx3zL5Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39798749"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39798749"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 02:12:43 -0700
X-CSE-ConnectionGUID: lOUmtXCoQRG+SBBVE/CgEg==
X-CSE-MsgGUID: uMo5Qmo7Rt6F9kiUjBHJAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="110971642"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2024 02:12:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3XPz-000Uik-0k;
	Wed, 23 Oct 2024 09:12:39 +0000
Date: Wed, 23 Oct 2024 17:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:trampoline_multi_10 14/21] kernel/bpf/syscall.c:3216:42:
 error: incompatible pointer types passing 'struct bpf_tramp_node *' to
 parameter of type 'struct bpf_tramp_link *'
Message-ID: <202410231731.xZ3KM5Fj-lkp@intel.com>
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
commit: 265c1db5da4835a0823af297c907ea7961bd6af0 [14/21] bpf: Rename bpf_tramp_link struct to bpf_tramp_node
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241023/202410231731.xZ3KM5Fj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231731.xZ3KM5Fj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231731.xZ3KM5Fj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/bpf/core.c:21:
   In file included from include/linux/filter.h:9:
>> include/linux/bpf.h:1387:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1387 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1393:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1393 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
   2 warnings generated.
--
   In file included from kernel/bpf/syscall.c:4:
>> include/linux/bpf.h:1387:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1387 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1393:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1393 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/bpf/syscall.c:3216:42: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Werror,-Wincompatible-pointer-types]
    3216 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->node,
         |                                                 ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:111:25: note: expanded from macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   include/linux/bpf.h:1393:69: note: passing argument to parameter 'link' here
    1393 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                                     ^
   kernel/bpf/syscall.c:3432:33: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Werror,-Wincompatible-pointer-types]
    3432 |         err = bpf_trampoline_link_prog(&link->node, tr, tgt_prog);
         |                                        ^~~~~~~~~~~
   include/linux/bpf.h:1387:67: note: passing argument to parameter 'link' here
    1387 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                                   ^
   2 warnings and 2 errors generated.


vim +3216 kernel/bpf/syscall.c

  3210	
  3211	static void bpf_tracing_link_release(struct bpf_link *link)
  3212	{
  3213		struct bpf_tracing_link *tr_link =
  3214			container_of(link, struct bpf_tracing_link, link);
  3215	
> 3216		WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->node,
  3217							tr_link->trampoline,
  3218							tr_link->tgt_prog));
  3219	
  3220		bpf_trampoline_put(tr_link->trampoline);
  3221	
  3222		/* tgt_prog is NULL if target is a kernel function */
  3223		if (tr_link->tgt_prog)
  3224			bpf_prog_put(tr_link->tgt_prog);
  3225	}
  3226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

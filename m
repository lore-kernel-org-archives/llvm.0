Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAF61A8BEA;
	Wed, 31 Jul 2024 09:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722416615; cv=none; b=g0HJC207YtV1XtlpYwttBtCMe5lcZBinKHtZPtp8pYDjr+9hwVuCX4Mt8bviM4F7FJS9jSWlGdtmtFUdQofUz0/7ua6VT6XjiFKLj9lxn4GcLh5AUDsBk+wDID4Nx/KzNLGTBJoQj+GAY9DOzdLGK1OIcdDO02bShdaYA5bW3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722416615; c=relaxed/simple;
	bh=1xL4ScgYE0AjGwCs/m6ZktlgCQEzWRD7FzEYWLZ8E24=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F+gn8JQp1lTaP+rb6/PpUSiOlTrqcVLbeMXi7mtyu8SEQHIDRqkQxK7ttrzduKgwUUwQG3TupLB2w0iLMeNJI4RFoq1+2QLXZVPkaeLeLfz2jsWUbQtbm8yiS4etoxpZaenrPgLx4Y4BjvYON+2sei75/JBXD0ZBT5IdN96/QbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkk5ZreK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkk5ZreK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722416612; x=1753952612;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1xL4ScgYE0AjGwCs/m6ZktlgCQEzWRD7FzEYWLZ8E24=;
  b=hkk5ZreK2pNE0uddIvBN381uUEkJAWpje7TRPiunzBbEje53hVphrRo3
   OV/p2XOIeTjBXC7hT6TRimVG7fu9a6/D8ajOy+6RsUOoIUX/WZaZiy4oj
   Lj7uIPw8PdxF4WjR09fViCLGIHIThI7F+gniU9/qAuN+r9637NYLBe9Gf
   k7u63DqYcaFIuL2b0EsJCOAFyre+d84mN5QTuFcG+7MhgqN1Mo6es1qFp
   fUU0I3jFA/qW+aTzmZ6T1VBJiJYqnnE/+cTNK4czFH4if+DN0HwltrnHQ
   zMjgLcaEoKO8mgeM9diItAvxZEkF89fnkDxPxErr50/T0oU6SyElnea1k
   Q==;
X-CSE-ConnectionGUID: uX8WvMeJT7qh1gXLoAfZGw==
X-CSE-MsgGUID: tDIcz6hMRQu052Xl6GP8ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30862083"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="30862083"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 02:03:29 -0700
X-CSE-ConnectionGUID: 3b9CKRLGQxC1UcxcuTDy9g==
X-CSE-MsgGUID: dkgZDfiEQZ25sVCmz1kKRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="92137902"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Jul 2024 02:03:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ5F0-000u4R-0I;
	Wed, 31 Jul 2024 09:03:26 +0000
Date: Wed, 31 Jul 2024 17:03:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: rust_fmt_argument+0x76: missing int3
 after ret
Message-ID: <202407311733.KVI8Ey68-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Breno Leitao <leitao@debian.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e4fc196f5ba36eb7b9758cf2c73df49a44199895
commit: 7b75782ffd8243288d0661750b2dcc2596d676cb x86/bugs: Rename CONFIG_SLS                  => CONFIG_MITIGATION_SLS
date:   7 months ago
config: x86_64-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240731/202407311733.KVI8Ey68-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311733.KVI8Ey68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311733.KVI8Ey68-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: _RNvXs75_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_4credNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs76_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_14sighand_structNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs77_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_20multiprocess_signalsNtNtCse0oTBvBC9oH_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs79_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_10core_stateNtNtCse0oTBvBC9oH_4core7default7Default7default+0x72: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7a_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_13signal_structNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7d_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_8rcu_syncNtNtCse0oTBvBC9oH_4core7default7Default7default+0x6a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7e_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_19percpu_rw_semaphoreNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7i_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_5io_cqNtNtCse0oTBvBC9oH_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7j_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_8vfsmountNtNtCse0oTBvBC9oH_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7k_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_15percpu_ref_dataNtNtCse0oTBvBC9oH_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7p_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_5iattrNtNtCse0oTBvBC9oH_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7q_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_16qtree_mem_dqinfoNtNtCse0oTBvBC9oH_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7t_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_10mem_dqinfoNtNtCse0oTBvBC9oH_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7u_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_5dquotNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7v_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_17quota_format_typeNtNtCse0oTBvBC9oH_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7w_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_10quota_infoNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7z_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_5kiocbNtNtCse0oTBvBC9oH_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7A_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_13address_spaceNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7F_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_5inodeNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7G_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_11fown_structNtNtCse0oTBvBC9oH_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7I_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_4fileNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7J_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_13fasync_structNtNtCse0oTBvBC9oH_4core7default7Default7default+0x62: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7K_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_10sb_writersNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7L_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_11super_blockNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7M_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_10renamedataNtNtCse0oTBvBC9oH_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7N_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_16inode_operationsNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7O_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_8filenameNtNtCse0oTBvBC9oH_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7Q_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_10offset_ctxNtNtCse0oTBvBC9oH_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7R_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_18user32_fxsr_structNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7T_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_42compat_siginfo__bindgen_ty_1__bindgen_ty_2NtNtCse0oTBvBC9oH_4core7default7Default7default+0x11: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7V_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_56compat_siginfo__bindgen_ty_1__bindgen_ty_5__bindgen_ty_1NtNtCse0oTBvBC9oH_4core7default7Default7default+0x11: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7W_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_42compat_siginfo__bindgen_ty_1__bindgen_ty_5NtNtCse0oTBvBC9oH_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7X_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_28compat_siginfo__bindgen_ty_1NtNtCse0oTBvBC9oH_4core7default7Default7default+0x79: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7Y_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_14compat_siginfoNtNtCse0oTBvBC9oH_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7Z_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_13compat_direntNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs80_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_29compat_sigevent__bindgen_ty_1NtNtCse0oTBvBC9oH_4core7default7Default7default+0x39: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs81_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_15compat_sigeventNtNtCse0oTBvBC9oH_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs83_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_26compat_ifreq__bindgen_ty_2NtNtCse0oTBvBC9oH_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs84_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_12compat_ifreqNtNtCse0oTBvBC9oH_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs85_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_16user_i387_structNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs86_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_4userNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs88_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_29user_xstateregs__bindgen_ty_1NtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs89_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_15user_xstateregsNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8a_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_10vdso_imageNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8b_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_12va_alignmentNtNtCse0oTBvBC9oH_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8f_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_9Elf64_DynNtNtCse0oTBvBC9oH_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8g_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_3idrNtNtCse0oTBvBC9oH_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8h_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_3idaNtNtCse0oTBvBC9oH_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8i_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_19kernfs_global_locksNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8j_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_15kernfs_elem_dirNtNtCse0oTBvBC9oH_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8n_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_11kernfs_nodeNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8o_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_16kernfs_open_fileNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8r_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_23kobj_ns_type_operationsNtNtCse0oTBvBC9oH_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8s_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_9attributeNtNtCse0oTBvBC9oH_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8v_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_13bin_attributeNtNtCse0oTBvBC9oH_4core7default7Default7default+0x62: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8w_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_7kobjectNtNtCse0oTBvBC9oH_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8z_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_15kobj_uevent_envNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8A_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_14kobj_attributeNtNtCse0oTBvBC9oH_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8B_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_4ksetNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8D_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_12kernel_paramNtNtCse0oTBvBC9oH_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8G_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_15latch_tree_nodeNtNtCse0oTBvBC9oH_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8H_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_15latch_tree_rootNtNtCse0oTBvBC9oH_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8I_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_7__ddebugNtNtCse0oTBvBC9oH_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8K_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_16ddebug_class_mapNtNtCse0oTBvBC9oH_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8L_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_12__ddebug_infoNtNtCse0oTBvBC9oH_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8N_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_18ddebug_class_paramNtNtCse0oTBvBC9oH_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8P_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_15modversion_infoNtNtCse0oTBvBC9oH_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8Q_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_14module_kobjectNtNtCse0oTBvBC9oH_4core7default7Default7default+0x62: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8R_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_16module_attributeNtNtCse0oTBvBC9oH_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8S_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_24module_version_attributeNtNtCse0oTBvBC9oH_4core7default7Default7default+0x62: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8T_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_10module_useNtNtCse0oTBvBC9oH_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8U_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_13mod_tree_nodeNtNtCse0oTBvBC9oH_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8V_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_13module_memoryNtNtCse0oTBvBC9oH_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8W_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_12mod_kallsymsNtNtCse0oTBvBC9oH_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8Y_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_10kunit_caseNtNtCse0oTBvBC9oH_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8Z_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_11kunit_suiteNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs91_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_5kunitNtNtCse0oTBvBC9oH_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs92_NtCsfUwkYmtA92T_8bindings12bindings_rawNtB6_14kunit_resourceNtNtCse0oTBvBC9oH_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs3W1cgBU1ewb_5alloc7raw_vec11finish_growNtNtB4_5alloc6GlobalECs5SDWJrlPZ8_6kernel+0x11e: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCse0oTBvBC9oH_4core3ptr13drop_in_placeQNtNtCs5SDWJrlPZ8_6kernel3str12RawFormatterEBL_+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCse0oTBvBC9oH_4core3ptr13drop_in_placelECs5SDWJrlPZ8_6kernel+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtCse0oTBvBC9oH_4core3fmtQNtNtCs5SDWJrlPZ8_6kernel3str12RawFormatterNtB2_5Write10write_charBw_+0x117: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtCse0oTBvBC9oH_4core3fmtQNtNtCs5SDWJrlPZ8_6kernel3str12RawFormatterNtB2_5Write9write_fmtBw_+0x1b: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtCse0oTBvBC9oH_4core3fmtQNtNtCs5SDWJrlPZ8_6kernel3str12RawFormatterNtB2_5Write9write_strBw_+0x61: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtCse0oTBvBC9oH_4core3fmtQNtNtCs5SDWJrlPZ8_6kernel3str9FormatterNtB2_5Write10write_charBw_+0x125: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtCse0oTBvBC9oH_4core3fmtQNtNtCs5SDWJrlPZ8_6kernel3str9FormatterNtB2_5Write9write_fmtBw_+0x1b: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtCse0oTBvBC9oH_4core3fmtQNtNtCs5SDWJrlPZ8_6kernel3str9FormatterNtB2_5Write9write_strBw_+0x67: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCs5SDWJrlPZ8_6kernel5errorNtB2_5Error8to_errno+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCs5SDWJrlPZ8_6kernel5errorNtB2_5Error4name+0x43: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NtCs5SDWJrlPZ8_6kernel5errorNtB4_5ErrorNtNtCse0oTBvBC9oH_4core3fmt5Debug3fmt+0x8c: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs0_NtCs5SDWJrlPZ8_6kernel5errorNtB5_5ErrorINtNtCse0oTBvBC9oH_4core7convert4FromNtNtBN_5alloc10AllocErrorE4from+0x5: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1_NtCs5SDWJrlPZ8_6kernel5errorNtB5_5ErrorINtNtCse0oTBvBC9oH_4core7convert4FromNtNtNtBN_3num5error15TryFromIntErrorE4from+0x5: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2_NtCs5SDWJrlPZ8_6kernel5errorNtB5_5ErrorINtNtCse0oTBvBC9oH_4core7convert4FromNtNtNtBN_3str5error9Utf8ErrorE4from+0x5: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3_NtCs5SDWJrlPZ8_6kernel5errorNtB5_5ErrorINtNtCse0oTBvBC9oH_4core7convert4FromNtNtCs3W1cgBU1ewb_5alloc11collections15TryReserveErrorE4from+0x5: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs5SDWJrlPZ8_6kernel5error9to_result+0x8: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs8_NtNtCs5SDWJrlPZ8_6kernel4init10___internalNtB5_16OnlyCallFromDrop3new+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs5SDWJrlPZ8_6kernel5ioctl8__IOC_DIR+0x5: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs5SDWJrlPZ8_6kernel5ioctl9__IOC_TYPE+0x5: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs5SDWJrlPZ8_6kernel5ioctl7__IOC_NR+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs5SDWJrlPZ8_6kernel5ioctl9__IOC_SIZE+0xa: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_fmt_argument+0x76: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtCs5SDWJrlPZ8_6kernel5print14format_strings8generate+0xb3: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs5SDWJrlPZ8_6kernel3strNtB4_4CStr19from_bytes_with_nul+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs5SDWJrlPZ8_6kernel3strNtB4_4CStr10to_cstring+0xd: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs0_NtCs5SDWJrlPZ8_6kernel3strNtB5_4CStrNtNtCse0oTBvBC9oH_4core3fmt7Display3fmt+0x10a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1_NtCs5SDWJrlPZ8_6kernel3strNtB5_4CStrNtNtCse0oTBvBC9oH_4core3fmt5Debug3fmt+0x175: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8_NtCs5SDWJrlPZ8_6kernel3strNtB5_12RawFormatterNtNtCse0oTBvBC9oH_4core3fmt5Write9write_str+0x61: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsa_NtCs5SDWJrlPZ8_6kernel3strNtB5_9FormatterNtNtNtCse0oTBvBC9oH_4core3ops5deref5Deref5deref+0x3: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsb_NtCs5SDWJrlPZ8_6kernel3strNtB5_9FormatterNtNtCse0oTBvBC9oH_4core3fmt5Write9write_str+0x67: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMsc_NtCs5SDWJrlPZ8_6kernel3strNtB5_7CString12try_from_fmt+0x22b: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsd_NtCs5SDWJrlPZ8_6kernel3strNtB5_7CStringNtNtNtCse0oTBvBC9oH_4core3ops5deref5Deref5deref+0xc: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXse_NtCs5SDWJrlPZ8_6kernel3strNtB5_7CStringINtNtCse0oTBvBC9oH_4core7convert7TryFromRNtB5_4CStrE8try_from+0xc6: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtNtCs5SDWJrlPZ8_6kernel4sync7condvarNtB5_7CondVar3new+0xe: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs5SDWJrlPZ8_6kernel4syncNtB4_12LockClassKey3new+0x3: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs5SDWJrlPZ8_6kernel4syncNtB4_12LockClassKey6as_ptr+0x3: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs5SDWJrlPZ8_6kernel4taskNtB5_4Task7current+0xb: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNvMs0_NtCs5SDWJrlPZ8_6kernel4taskNtB8_4Task7currentNtB2_7TaskRefNtNtNtCse0oTBvBC9oH_4core3ops5deref5Deref5deref+0x3: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs5SDWJrlPZ8_6kernel4taskNtB5_4Task12group_leader+0xb: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs5SDWJrlPZ8_6kernel4taskNtB5_4Task3pid+0x6: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs5SDWJrlPZ8_6kernel4taskNtB5_4Task14signal_pending+0xc: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NtCs5SDWJrlPZ8_6kernel5typesuNtB4_14ForeignOwnable12into_foreign+0x5: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NtCs5SDWJrlPZ8_6kernel5typesuNtB4_14ForeignOwnable12from_foreign+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs5SDWJrlPZ8_6kernel9workqueueNtB5_5Queue8from_raw+0x3: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs5SDWJrlPZ8_6kernel9workqueue6system+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs5SDWJrlPZ8_6kernel9workqueue14system_highpri+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs5SDWJrlPZ8_6kernel9workqueue11system_long+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs5SDWJrlPZ8_6kernel9workqueue14system_unbound+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs5SDWJrlPZ8_6kernel9workqueue16system_freezable+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs5SDWJrlPZ8_6kernel9workqueue22system_power_efficient+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs5SDWJrlPZ8_6kernel9workqueue32system_freezable_power_efficient+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_Cs5SDWJrlPZ8_6kernelNtB4_10ThisModule8from_ptr+0x3: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXCs8kFVvruG1ec_4uapiNtB2_32ftrace_branch_data__bindgen_ty_1NtNtCse0oTBvBC9oH_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_Cs8kFVvruG1ec_4uapiNtB4_18ftrace_branch_dataNtNtCse0oTBvBC9oH_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs3W1cgBU1ewb_5alloc7raw_vec11finish_growNtNtB4_5alloc6GlobalECs88S2v0RilCB_25doctests_kernel_generated+0x9d: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCse0oTBvBC9oH_4core3ptr13drop_in_placeNtNtCs5SDWJrlPZ8_6kernel3str16CStrConvertErrorECs88S2v0RilCB_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCse0oTBvBC9oH_4core3ptr13drop_in_placeNtNtCs5SDWJrlPZ8_6kernel5error5ErrorECs88S2v0RilCB_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCse0oTBvBC9oH_4core3ptr13drop_in_placeRjECs88S2v0RilCB_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs3W1cgBU1ewb_5alloc7raw_vecINtB4_6RawVechE20try_reserve_for_pushCs88S2v0RilCB_25doctests_kernel_generated+0xad: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsP_NtCse0oTBvBC9oH_4core3fmtRINtNtB7_6option6OptionjENtB5_5Debug3fmtCs88S2v0RilCB_25doctests_kernel_generated+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsP_NtCse0oTBvBC9oH_4core3fmtRTmENtB5_5Debug3fmtCs88S2v0RilCB_25doctests_kernel_generated+0x48: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_build_assert_rs_0+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_build_assert_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_0+0x46: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_1+0xfd: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_2+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_3+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNvNvNvCs88S2v0RilCB_25doctests_kernel_generated29rust_doctest_kernel_init_rs_34main60__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_122_08bindings11destroy_foo+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNvNvNvCs88S2v0RilCB_25doctests_kernel_generated29rust_doctest_kernel_init_rs_34main60__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_122_08bindings10enable_foo+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NvNvNvCs88S2v0RilCB_25doctests_kernel_generated29rust_doctest_kernel_init_rs_34main60__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_122_0NtB4_6RawFoo3new+0x2: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_4+0x118: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_5+0x46: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_6+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_7+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_8+0x46: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_9+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNvNvNvCs88S2v0RilCB_25doctests_kernel_generated29rust_doctest_kernel_init_rs_94main60__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_468_0NtB2_3Foo3new+0x0: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_10+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_12+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_13+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_14+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_15+0xd0: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_16+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_17+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_prelude_rs_0+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_0+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_1+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_2+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_3+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_4+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_5+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_6+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_7+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_8+0xbf: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_static_assert_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_0+0x2a7: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_1+0x375: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_2+0x1f1: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_3+0xfb: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_4+0xfa: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNvNvNvCs88S2v0RilCB_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0x224: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_0+0x182: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_2+0x3d5: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_3+0x3db: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_4+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_5+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_6+0x4c8: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_0+0x182: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_1+0x1a8: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_2+0x190: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_3+0xa1: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_4+0x99: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_5+0x37f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_6+0xa1: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_7+0x190: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_condvar_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_mutex_rs_0+0x488: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_mutex_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_spinlock_rs_0+0x479: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_spinlock_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_locked_by_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_task_rs_0+0x5b: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_task_rs_1+0x63: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_task_rs_2+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_types_rs_0+0xd3: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_types_rs_1+0x219: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNvNvNvCs88S2v0RilCB_25doctests_kernel_generated30rust_doctest_kernel_types_rs_14main61__doctest_main__kbuild_src_consumer_rust_kernel_types_rs_132_08example3+0x1d8: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_types_rs_2+0x11d: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NvNvNvCs88S2v0RilCB_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_04main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_35_0NtB4_8MyStructNtNtCs5SDWJrlPZ8_6kernel9workqueue8WorkItem3run+0x85: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_2+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_3+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NvNvNvCs88S2v0RilCB_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_34main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_78_0NtB4_8MyStructINtNtCs5SDWJrlPZ8_6kernel9workqueue8WorkItemKy1_E3run+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs0_NvNvNvCs88S2v0RilCB_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_34main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_78_0NtB5_8MyStructINtNtCs5SDWJrlPZ8_6kernel9workqueue8WorkItemKy2_E3run+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNvNvNvNvCs88S2v0RilCB_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1219_01__NtB2_12___ThePinDataNtNtCse0oTBvBC9oH_4core5clone5Clone5clone+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4_NvNvNvNvCs88S2v0RilCB_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1219_01__NtB7_3FooNtNtNtCse0oTBvBC9oH_4core3ops4drop4Drop4drop+0x57: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNvNvNvCs88S2v0RilCB_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1219_0NtB2_3FooNtNtCs5SDWJrlPZ8_6kernel4init10PinnedDrop4drop+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs3W1cgBU1ewb_5alloc7raw_vec11finish_growNtNtB4_5alloc6GlobalECs4P7a0KxXUiy_12rust_minimal+0x9d: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCse0oTBvBC9oH_4core3ptr13drop_in_placeINtNtB4_6option6OptionNtCs4P7a0KxXUiy_12rust_minimal11RustMinimalEEB14_+0xde: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCse0oTBvBC9oH_4core3ptr13drop_in_placeRjECs4P7a0KxXUiy_12rust_minimal+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs3W1cgBU1ewb_5alloc7raw_vecINtB4_6RawVeclE20try_reserve_for_pushCs4P7a0KxXUiy_12rust_minimal+0xbd: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsk_NtCs3W1cgBU1ewb_5alloc3vecINtB5_3VeclENtNtCse0oTBvBC9oH_4core3fmt5Debug3fmtCs4P7a0KxXUiy_12rust_minimal+0x75: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXCs4P7a0KxXUiy_12rust_minimalNtB2_11RustMinimalNtCs5SDWJrlPZ8_6kernel6Module4init+0x1d3: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_Cs4P7a0KxXUiy_12rust_minimalNtB4_11RustMinimalNtNtNtCse0oTBvBC9oH_4core3ops4drop4Drop4drop+0xab: missing int3 after ret
   vmlinux.o: warning: objtool: __rust_minimal_init+0x41: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXCsccsOw2AQuff_10rust_printNtB2_9RustPrintNtCs5SDWJrlPZ8_6kernel6Module4init+0xa58: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_CsccsOw2AQuff_10rust_printNtB4_9RustPrintNtNtNtCse0oTBvBC9oH_4core3ops4drop4Drop4drop+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: __rust_print_init+0x78: missing int3 after ret


objdump-func vmlinux.o rust_fmt_argument:
0000 00000000000d1cb0 <rust_fmt_argument>:
0000    d1cb0:	48 83 ec 58          	sub    $0x58,%rsp
0004    d1cb4:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
0009    d1cb9:	f6 c2 07             	test   $0x7,%dl
000c    d1cbc:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
0011    d1cc1:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
0016    d1cc6:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
001b    d1ccb:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0020    d1cd0:	75 55                	jne    d1d27 <rust_fmt_argument+0x77>
0022    d1cd2:	48 8b 42 28          	mov    0x28(%rdx),%rax
0026    d1cd6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
002b    d1cdb:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	d1cde: R_X86_64_32S	.rodata+0x10160
0032    d1ce2:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
0037    d1ce7:	48 8b 42 20          	mov    0x20(%rdx),%rax
003b    d1ceb:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
0040    d1cf0:	48 8b 42 18          	mov    0x18(%rdx),%rax
0044    d1cf4:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
0049    d1cf9:	48 8b 42 10          	mov    0x10(%rdx),%rax
004d    d1cfd:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
0052    d1d02:	48 8b 02             	mov    (%rdx),%rax
0055    d1d05:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
0059    d1d09:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
005e    d1d0e:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
0063    d1d13:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
0068    d1d18:	e8 00 00 00 00       	call   d1d1d <rust_fmt_argument+0x6d>	d1d19: R_X86_64_PLT32	_RNvNtCse0oTBvBC9oH_4core3fmt5write-0x4
006d    d1d1d:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0072    d1d22:	48 83 c4 58          	add    $0x58,%rsp
0076    d1d26:	c3                   	ret
0077    d1d27:	48 89 d6             	mov    %rdx,%rsi
007a    d1d2a:	bf 08 00 00 00       	mov    $0x8,%edi
007f    d1d2f:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	d1d32: R_X86_64_32S	.rodata+0x102f8
0086    d1d36:	e8 00 00 00 00       	call   d1d3b <rust_fmt_argument+0x8b>	d1d37: R_X86_64_PLT32	_RNvNtCse0oTBvBC9oH_4core9panicking36panic_misaligned_pointer_dereference-0x4
008b    d1d3b:	0f 0b                	ud2
008d    d1d3d:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B28339719;
	Thu, 13 Aug 2026 06:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602983; cv=none; b=ixycXwNXcfaZ0MmPnF84PfPTNawGICWiLXnEBoxUCbdTMCPPp85xxpfohkxKhBTBtcPwdSM7NbOLyHEQSSsuP7tAg8wjHokVtrXU6lA3F58pBSC68dzU8WkGFuXzN1+6a8/ugz1mEMzx5GLJfYBHZYwHolQz+0/1q+GPg0dKn7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602983; c=relaxed/simple;
	bh=VgV0Uz8+qXZzqCcuLVF1y6P8owwmCy+S2aFJGFdOxmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dyaDNSJL7pPxoPffmPYg7NS1fWa0Ikwb8rZNxHUXDp75cjHw60/JOhv0WJH3wT9TnS2TGzYj0lke3zPvs0xlBFpq3n37KJ6K4YEPDqiBFyIpRVoNQy+vKin3WHffUDR+IrTSgFfBuYXQxAlg3B+x1untbE+enxl7l34sUChrllk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jd0jVGhI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jd0jVGhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786602982; x=1818138982;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VgV0Uz8+qXZzqCcuLVF1y6P8owwmCy+S2aFJGFdOxmQ=;
  b=jd0jVGhIvz9pXvKZ4T3RxZnGCeWwceRv8nndcPNn6FFsN0OPoWgpWdKL
   n0UFgEnqYKUNH+FWZp6oXWnU/g1joD+20iZXQVlTXniNDmDN63YHhftZ9
   kZfHpMpFaIzKEwz1wTO3sE4D3/aLqtLrykwjo0cwk3a9NO0mpRBbcEfeV
   aedigvu3h6MQasrWkn3e861ju+7jc9lNnAxjnCxbuhz7eKfByN9AZINWn
   v9KqEupo7XW1/mojlkeMJOs+HW0v9BxynWrWA/L9boO04khBfF5u3979J
   LyLjP8I/peYiJwHedrapvmRqLWgvSrIcc2zseCuCFSIf7Uqu/wNDCsKh+
   g==;
X-CSE-ConnectionGUID: +I9FlvEjTwmMfB6Zalgafg==
X-CSE-MsgGUID: moKAr6fGTjK78YwvB9mUOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86934296"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="86934296"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 23:36:22 -0700
X-CSE-ConnectionGUID: h+pdhoNwQpuK2KFB9kYKGA==
X-CSE-MsgGUID: JuuUdnbBRtGQ4f6yASuYmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="260035026"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2026 23:36:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuP33-00000000T5a-0Bnp;
	Thu, 13 Aug 2026 06:36:17 +0000
Date: Thu, 13 Aug 2026 14:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-asm-generic-vsyscall-h 12/12]
 arch/riscv/kernel/sys_hwprobe.c:525:31: error: use of undeclared identifier
 'vdso_k_arch_data'
Message-ID: <202608131414.71jXPtRk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-asm-generic-vsyscall-h
head:   adcfde532be640a97064a7f9ecb20b6026a4c3d2
commit: adcfde532be640a97064a7f9ecb20b6026a4c3d2 [12/12] remove
config: riscv-randconfig-001-20260813 (https://download.01.org/0day-ci/arch=
ive/20260813/202608131414.71jXPtRk-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6ea=
395e4fe4db26920d57779ddae98eac6ba945d)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260813/202608131414.71jXPtRk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131414.71jXPtRk-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/sys_hwprobe.c:525:31: error: use of undeclared identif=
ier 'vdso_k_arch_data'
     525 |         struct vdso_arch_data *avd =3D vdso_k_arch_data;
         |                                      ^~~~~~~~~~~~~~~~
>> arch/riscv/kernel/sys_hwprobe.c:543:6: error: incomplete definition of t=
ype 'struct vdso_arch_data'
     543 |                 avd->all_cpu_hwprobe_values[key] =3D pair.value;
         |                 ~~~^
   arch/riscv/kernel/sys_hwprobe.c:525:9: note: forward declaration of 'str=
uct vdso_arch_data'
     525 |         struct vdso_arch_data *avd =3D vdso_k_arch_data;
         |                ^
   arch/riscv/kernel/sys_hwprobe.c:559:5: error: incomplete definition of t=
ype 'struct vdso_arch_data'
     559 |         avd->homogeneous_cpus =3D id_bitsmash !=3D 0 && id_bitsm=
ash !=3D -1;
         |         ~~~^
   arch/riscv/kernel/sys_hwprobe.c:525:9: note: forward declaration of 'str=
uct vdso_arch_data'
     525 |         struct vdso_arch_data *avd =3D vdso_k_arch_data;
         |                ^
   arch/riscv/kernel/sys_hwprobe.c:567:5: error: incomplete definition of t=
ype 'struct vdso_arch_data'
     567 |         avd->ready =3D true;
         |         ~~~^
   arch/riscv/kernel/sys_hwprobe.c:525:9: note: forward declaration of 'str=
uct vdso_arch_data'
     525 |         struct vdso_arch_data *avd =3D vdso_k_arch_data;
         |                ^
   arch/riscv/kernel/sys_hwprobe.c:573:31: error: use of undeclared identif=
ier 'vdso_k_arch_data'
     573 |         struct vdso_arch_data *avd =3D vdso_k_arch_data;
         |                                      ^~~~~~~~~~~~~~~~
   arch/riscv/kernel/sys_hwprobe.c:579:5: error: incomplete definition of t=
ype 'struct vdso_arch_data'
     579 |         avd->ready =3D false;
         |         ~~~^
   arch/riscv/kernel/sys_hwprobe.c:573:9: note: forward declaration of 'str=
uct vdso_arch_data'
     573 |         struct vdso_arch_data *avd =3D vdso_k_arch_data;
         |                ^
   6 errors generated.


vim +/vdso_k_arch_data +525 arch/riscv/kernel/sys_hwprobe.c

53b2b22850e1ff Andrew Jones     2023-11-22  522 =20
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  523  static int complete_hwprob=
e_vdso_data(void)
53b2b22850e1ff Andrew Jones     2023-11-22  524  {
46fe55b204bfb0 Thomas Wei=C3=9Fschuh 2025-02-04 @525  	struct vdso_arch_dat=
a *avd =3D vdso_k_arch_data;
53b2b22850e1ff Andrew Jones     2023-11-22  526  	u64 id_bitsmash =3D 0;
53b2b22850e1ff Andrew Jones     2023-11-22  527  	struct riscv_hwprobe pair;
53b2b22850e1ff Andrew Jones     2023-11-22  528  	int key;
53b2b22850e1ff Andrew Jones     2023-11-22  529 =20
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  530  	if (unlikely(!atomic_dec_=
and_test(&pending_boot_probes)))
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  531  		wait_for_completion(&boo=
t_probes_done);
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  532 =20
53b2b22850e1ff Andrew Jones     2023-11-22  533  	/*
53b2b22850e1ff Andrew Jones     2023-11-22  534  	 * Initialize vDSO data w=
ith the answers for the "all CPUs" case, to
53b2b22850e1ff Andrew Jones     2023-11-22  535  	 * save a syscall in the =
common case.
53b2b22850e1ff Andrew Jones     2023-11-22  536  	 */
53b2b22850e1ff Andrew Jones     2023-11-22  537  	for (key =3D 0; key <=3D =
RISCV_HWPROBE_MAX_KEY; key++) {
53b2b22850e1ff Andrew Jones     2023-11-22  538  		pair.key =3D key;
53b2b22850e1ff Andrew Jones     2023-11-22  539  		hwprobe_one_pair(&pair, =
cpu_online_mask);
53b2b22850e1ff Andrew Jones     2023-11-22  540 =20
53b2b22850e1ff Andrew Jones     2023-11-22  541  		WARN_ON_ONCE(pair.key < =
0);
53b2b22850e1ff Andrew Jones     2023-11-22  542 =20
53b2b22850e1ff Andrew Jones     2023-11-22 @543  		avd->all_cpu_hwprobe_val=
ues[key] =3D pair.value;
53b2b22850e1ff Andrew Jones     2023-11-22  544  		/*
53b2b22850e1ff Andrew Jones     2023-11-22  545  		 * Smash together the ve=
ndor, arch, and impl IDs to see if
53b2b22850e1ff Andrew Jones     2023-11-22  546  		 * they're all 0 or any =
negative.
53b2b22850e1ff Andrew Jones     2023-11-22  547  		 */
53b2b22850e1ff Andrew Jones     2023-11-22  548  		if (key <=3D RISCV_HWPRO=
BE_KEY_MIMPID)
53b2b22850e1ff Andrew Jones     2023-11-22  549  			id_bitsmash |=3D pair.v=
alue;
53b2b22850e1ff Andrew Jones     2023-11-22  550  	}
53b2b22850e1ff Andrew Jones     2023-11-22  551 =20
53b2b22850e1ff Andrew Jones     2023-11-22  552  	/*
53b2b22850e1ff Andrew Jones     2023-11-22  553  	 * If the arch, vendor, a=
nd implementation ID are all the same across
53b2b22850e1ff Andrew Jones     2023-11-22  554  	 * all harts, then assume=
 all CPUs are the same, and allow the vDSO to
53b2b22850e1ff Andrew Jones     2023-11-22  555  	 * answer queries for arb=
itrary masks. However if all values are 0 (not
53b2b22850e1ff Andrew Jones     2023-11-22  556  	 * populated) or any valu=
e returns -1 (varies across CPUs), then the
53b2b22850e1ff Andrew Jones     2023-11-22  557  	 * vDSO should defer to t=
he kernel for exotic cpu masks.
53b2b22850e1ff Andrew Jones     2023-11-22  558  	 */
53b2b22850e1ff Andrew Jones     2023-11-22  559  	avd->homogeneous_cpus =3D =
id_bitsmash !=3D 0 && id_bitsmash !=3D -1;
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  560 =20
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  561  	/*
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  562  	 * Make sure all the VDSO=
 values are visible before we look at them.
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  563  	 * This pairs with the im=
plicit "no speculativly visible accesses"
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  564  	 * barrier in the VDSO hw=
probe code.
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  565  	 */
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  566  	smp_wmb();
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  567  	avd->ready =3D true;
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  568  	return 0;
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  569  }
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  570 =20

:::::: The code at line 525 was first introduced by commit
:::::: 46fe55b204bfb007e0f0a5409dcda063ad98b089 riscv: vdso: Switch to gene=
ric storage implementation

:::::: TO: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

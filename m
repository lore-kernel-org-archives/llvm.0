Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6A83750C4;
	Tue,  7 Apr 2026 03:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534012; cv=none; b=p2YZpq5YVX57U7S0MRSj9IiqGrtivx2w/2eye0lU8Akf+9FEqNV4Km4Kwv1ezHmi7rlwjNcVwriC4DqJTDKP19yibJyflQV8Vcn66WrBlIy/573VPZnyTkIz4pRvSAKxp623nbRkJuM5Fbn2gbNchmpnWcyB5Ldk+vwvnjU16ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534012; c=relaxed/simple;
	bh=O4CG9a4o9kyZghvY7/Mtw1QVmUnry1erfOtRNYNo7Kw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VB5y/qZ5BTiIvtU1ZZQnBIZuUkt7Jb+OYVIT4VZXT8X03nnQtPPZTHrm3ngUYU0Uq3xYOc7QrQ8BGk3fWifPfK+kvWoGVQrpj40qGosDh7mvf9kVA3lCGC8uElc9Pv9kr8R2tXArbLs4emDZLLDd5Pn+veW1obzZogexgT9aoYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EL6C88u8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EL6C88u8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534011; x=1807070011;
  h=date:from:to:cc:subject:message-id;
  bh=O4CG9a4o9kyZghvY7/Mtw1QVmUnry1erfOtRNYNo7Kw=;
  b=EL6C88u8hiOyoHFTGhxUCfJnSJ/SKmX+8L1NWxdNNpgKr+WL44NsKib+
   d0/2arveiCh3ubYA7AsIQWVFbALNe41MjltPPRwTM5QCOU6GN8mILJG0D
   AkkWEi4VUnvG/XRahshcdP3QokYbfaKUikCuDPNEZzmFLXiN/ZuHh/UFC
   Go22OOBjmeSzY/YBLORkZkIdgjDfCEGzjPXdRsh3AHvaP/+G69HL2sEmV
   wbnZsAzSPROsSk4YhEy259zjr0aOvKrT+q6AN3wJd/P934eqZ2ZCMFNAB
   X7nSI5qqfkYupQ3PxjdEzL+5/JfvPNG8PQ/Zveuaj39b6j9H0J8FmL74D
   g==;
X-CSE-ConnectionGUID: lrljtBc4TJWomV1ji1Il3w==
X-CSE-MsgGUID: 0ZRrfsdxTnCNWigXP68BRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781631"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781631"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:53:26 -0700
X-CSE-ConnectionGUID: C1JbWrIGTiC64GINcI7rHg==
X-CSE-MsgGUID: R7gcf58WS/mDfMnUaes1rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225303591"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:53:24 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xVB-0000000003R-3HNf;
	Tue, 07 Apr 2026 03:53:21 +0000
Date: Tue, 07 Apr 2026 11:52:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:q/future_nested 21/28] arch/x86/kvm/xen.c:1687:6:
 warning: variable 'input' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202604040903.VcDtbfIf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux q/future_nested
head:   f0450993519d901739b7014042b6620b1ef1fe6d
commit: 366718c9acb94b80773c6575ba3138cc712b4a75 [21/28] KVM: x86/xen: Don't truncate RAX when handling hypercall from protected guest
config: i386-randconfig-014-20260404 (https://download.01.org/0day-ci/archive/20260404/202604040903.VcDtbfIf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040903.VcDtbfIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040903.VcDtbfIf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/xen.c:1687:6: warning: variable 'input' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1687 |         if (!longmode) {
         |             ^~~~~~~~~
   arch/x86/kvm/xen.c:1708:31: note: uninitialized use occurs here
    1708 |         trace_kvm_xen_hypercall(cpl, input, params[0], params[1], params[2],
         |                                      ^~~~~
   arch/x86/kvm/xen.c:1687:2: note: remove the 'if' if its condition is always true
    1687 |         if (!longmode) {
         |         ^~~~~~~~~~~~~~
   arch/x86/kvm/xen.c:1677:11: note: initialize the variable 'input' to silence this warning
    1677 |         u64 input, params[6], r = -ENOSYS;
         |                  ^
         |                   = 0
   1 warning generated.


vim +1687 arch/x86/kvm/xen.c

536395260582be Joao Martins        2022-03-03  1673  
23200b7a30de31 Joao Martins        2018-06-13  1674  int kvm_xen_hypercall(struct kvm_vcpu *vcpu)
23200b7a30de31 Joao Martins        2018-06-13  1675  {
23200b7a30de31 Joao Martins        2018-06-13  1676  	bool longmode;
2fd6df2f2b47d4 Joao Martins        2022-03-03  1677  	u64 input, params[6], r = -ENOSYS;
2fd6df2f2b47d4 Joao Martins        2022-03-03  1678  	bool handled = false;
c2b8cdfaf3a672 David Woodhouse     2022-11-12  1679  	u8 cpl;
23200b7a30de31 Joao Martins        2018-06-13  1680  
79033bebf6fa30 Joao Martins        2018-06-13  1681  	/* Hyper-V hypercalls get bit 31 set in EAX */
366718c9acb94b Sean Christopherson 2026-04-03  1682  	if ((kvm_rax_read(vcpu) & 0x80000000) &&
8f014550dfb114 Vitaly Kuznetsov    2021-01-26  1683  	    kvm_hv_hypercall_enabled(vcpu))
79033bebf6fa30 Joao Martins        2018-06-13  1684  		return kvm_hv_hypercall(vcpu);
79033bebf6fa30 Joao Martins        2018-06-13  1685  
b5aead0064f33a Tom Lendacky        2021-05-24  1686  	longmode = is_64_bit_hypercall(vcpu);
23200b7a30de31 Joao Martins        2018-06-13 @1687  	if (!longmode) {
366718c9acb94b Sean Christopherson 2026-04-03  1688  		input = (u32)kvm_rax_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1689  		params[0] = (u32)kvm_rbx_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1690  		params[1] = (u32)kvm_rcx_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1691  		params[2] = (u32)kvm_rdx_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1692  		params[3] = (u32)kvm_rsi_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1693  		params[4] = (u32)kvm_rdi_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1694  		params[5] = (u32)kvm_rbp_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1695  	}
23200b7a30de31 Joao Martins        2018-06-13  1696  #ifdef CONFIG_X86_64
23200b7a30de31 Joao Martins        2018-06-13  1697  	else {
366718c9acb94b Sean Christopherson 2026-04-03  1698  		input = (u64)kvm_rax_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1699  		params[0] = (u64)kvm_rdi_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1700  		params[1] = (u64)kvm_rsi_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1701  		params[2] = (u64)kvm_rdx_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1702  		params[3] = (u64)kvm_r10_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1703  		params[4] = (u64)kvm_r8_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1704  		params[5] = (u64)kvm_r9_read(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1705  	}
23200b7a30de31 Joao Martins        2018-06-13  1706  #endif
896046474f8d2e Wei Wang            2024-05-07  1707  	cpl = kvm_x86_call(get_cpl)(vcpu);
c3f3719952b9ab David Woodhouse     2022-11-14  1708  	trace_kvm_xen_hypercall(cpl, input, params[0], params[1], params[2],
23200b7a30de31 Joao Martins        2018-06-13  1709  				params[3], params[4], params[5]);
23200b7a30de31 Joao Martins        2018-06-13  1710  
c2b8cdfaf3a672 David Woodhouse     2022-11-12  1711  	/*
c2b8cdfaf3a672 David Woodhouse     2022-11-12  1712  	 * Only allow hypercall acceleration for CPL0. The rare hypercalls that
c2b8cdfaf3a672 David Woodhouse     2022-11-12  1713  	 * are permitted in guest userspace can be handled by the VMM.
c2b8cdfaf3a672 David Woodhouse     2022-11-12  1714  	 */
c2b8cdfaf3a672 David Woodhouse     2022-11-12  1715  	if (unlikely(cpl > 0))
c2b8cdfaf3a672 David Woodhouse     2022-11-12  1716  		goto handle_in_userspace;
c2b8cdfaf3a672 David Woodhouse     2022-11-12  1717  
2fd6df2f2b47d4 Joao Martins        2022-03-03  1718  	switch (input) {
28d1629f751c4a David Woodhouse     2022-03-03  1719  	case __HYPERVISOR_xen_version:
28d1629f751c4a David Woodhouse     2022-03-03  1720  		if (params[0] == XENVER_version && vcpu->kvm->arch.xen.xen_version) {
28d1629f751c4a David Woodhouse     2022-03-03  1721  			r = vcpu->kvm->arch.xen.xen_version;
28d1629f751c4a David Woodhouse     2022-03-03  1722  			handled = true;
28d1629f751c4a David Woodhouse     2022-03-03  1723  		}
28d1629f751c4a David Woodhouse     2022-03-03  1724  		break;
2fd6df2f2b47d4 Joao Martins        2022-03-03  1725  	case __HYPERVISOR_event_channel_op:
2fd6df2f2b47d4 Joao Martins        2022-03-03  1726  		if (params[0] == EVTCHNOP_send)
2fd6df2f2b47d4 Joao Martins        2022-03-03  1727  			handled = kvm_xen_hcall_evtchn_send(vcpu, params[1], &r);
2fd6df2f2b47d4 Joao Martins        2022-03-03  1728  		break;
0ec6c5c5bb6585 Joao Martins        2022-03-03  1729  	case __HYPERVISOR_sched_op:
1a65105a5aba9f Boris Ostrovsky     2022-03-03  1730  		handled = kvm_xen_hcall_sched_op(vcpu, longmode, params[0],
1a65105a5aba9f Boris Ostrovsky     2022-03-03  1731  						 params[1], &r);
0ec6c5c5bb6585 Joao Martins        2022-03-03  1732  		break;
536395260582be Joao Martins        2022-03-03  1733  	case __HYPERVISOR_vcpu_op:
536395260582be Joao Martins        2022-03-03  1734  		handled = kvm_xen_hcall_vcpu_op(vcpu, longmode, params[0], params[1],
536395260582be Joao Martins        2022-03-03  1735  						params[2], &r);
536395260582be Joao Martins        2022-03-03  1736  		break;
536395260582be Joao Martins        2022-03-03  1737  	case __HYPERVISOR_set_timer_op: {
536395260582be Joao Martins        2022-03-03  1738  		u64 timeout = params[0];
536395260582be Joao Martins        2022-03-03  1739  		/* In 32-bit mode, the 64-bit timeout is in two 32-bit params. */
536395260582be Joao Martins        2022-03-03  1740  		if (!longmode)
536395260582be Joao Martins        2022-03-03  1741  			timeout |= params[1] << 32;
536395260582be Joao Martins        2022-03-03  1742  		handled = kvm_xen_hcall_set_timer_op(vcpu, timeout, &r);
536395260582be Joao Martins        2022-03-03  1743  		break;
536395260582be Joao Martins        2022-03-03  1744  	}
2fd6df2f2b47d4 Joao Martins        2022-03-03  1745  	default:
2fd6df2f2b47d4 Joao Martins        2022-03-03  1746  		break;
2fd6df2f2b47d4 Joao Martins        2022-03-03  1747  	}
2fd6df2f2b47d4 Joao Martins        2022-03-03  1748  
2fd6df2f2b47d4 Joao Martins        2022-03-03  1749  	if (handled)
2fd6df2f2b47d4 Joao Martins        2022-03-03  1750  		return kvm_xen_hypercall_set_result(vcpu, r);
2fd6df2f2b47d4 Joao Martins        2022-03-03  1751  
c2b8cdfaf3a672 David Woodhouse     2022-11-12  1752  handle_in_userspace:
23200b7a30de31 Joao Martins        2018-06-13  1753  	vcpu->run->exit_reason = KVM_EXIT_XEN;
23200b7a30de31 Joao Martins        2018-06-13  1754  	vcpu->run->xen.type = KVM_EXIT_XEN_HCALL;
23200b7a30de31 Joao Martins        2018-06-13  1755  	vcpu->run->xen.u.hcall.longmode = longmode;
c2b8cdfaf3a672 David Woodhouse     2022-11-12  1756  	vcpu->run->xen.u.hcall.cpl = cpl;
23200b7a30de31 Joao Martins        2018-06-13  1757  	vcpu->run->xen.u.hcall.input = input;
23200b7a30de31 Joao Martins        2018-06-13  1758  	vcpu->run->xen.u.hcall.params[0] = params[0];
23200b7a30de31 Joao Martins        2018-06-13  1759  	vcpu->run->xen.u.hcall.params[1] = params[1];
23200b7a30de31 Joao Martins        2018-06-13  1760  	vcpu->run->xen.u.hcall.params[2] = params[2];
23200b7a30de31 Joao Martins        2018-06-13  1761  	vcpu->run->xen.u.hcall.params[3] = params[3];
23200b7a30de31 Joao Martins        2018-06-13  1762  	vcpu->run->xen.u.hcall.params[4] = params[4];
23200b7a30de31 Joao Martins        2018-06-13  1763  	vcpu->run->xen.u.hcall.params[5] = params[5];
23200b7a30de31 Joao Martins        2018-06-13  1764  	vcpu->arch.xen.hypercall_rip = kvm_get_linear_rip(vcpu);
23200b7a30de31 Joao Martins        2018-06-13  1765  	vcpu->arch.complete_userspace_io =
23200b7a30de31 Joao Martins        2018-06-13  1766  		kvm_xen_hypercall_complete_userspace;
23200b7a30de31 Joao Martins        2018-06-13  1767  
23200b7a30de31 Joao Martins        2018-06-13  1768  	return 0;
23200b7a30de31 Joao Martins        2018-06-13  1769  }
14243b387137a4 David Woodhouse     2021-12-10  1770  

:::::: The code at line 1687 was first introduced by commit
:::::: 23200b7a30de315d0e9a40663c905869d29d833c KVM: x86/xen: intercept xen hypercalls if enabled

:::::: TO: Joao Martins <joao.m.martins@oracle.com>
:::::: CC: David Woodhouse <dwmw@amazon.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

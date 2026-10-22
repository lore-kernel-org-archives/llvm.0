Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792633327;
	b=djHjMnEzkjObokxR7L/grkOjMnFlpfUy/mXlUNj9rpdjvG+RbAHBaJpKd1yVen/FDHKA
	 a5jScMKQHP8dFKqp9ZohRWxX5BtTukOlBWTOeexU3XxNTvGtDyennmMv61RqAoPLdtjHv
	 Ofnm6A4ETnBmYcHPqligfJyjgWWTDGBonlv+tbBkQlVcHDiEBVnsnHqhlW+LNbbrEiD2E
	 LAtzflH6hAsZZbjte0KPLRrYnHXbIXzLcwBJcXKocFSU/2/6O+0302BEeyXD9wF6iBuHH
	 TbBVjDajMsr+pNDDeuOgmT42FcWvcSV4EJkbjZMskZHZI/YsEkaFt/rnzGUiNrfx5HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633327;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KboKhG+u8HiGyMUeQoJlf60E/FtBxEgdIbA8zYMnlk0=;
	b=0+5IKx/xFhAKoIlp/J2pmt0ztWNtVmX6rfEVvE+dqbuEpNegjSyC5pjLw6blCXgJXa6y
	 +yhfp/nZY2V0eDtUhTrvaj+gmT+jITU8AZ0JH+0EiQ5LyQXFT0iNkzdY72dz3x+OGQayg
	 2ZpaDQbzmL/Xsq1YZCOcmikW+DoBIi8qOg4H0uLqqxxb1NbthVfrHwkKMFmvzsRdcAtB8
	 NcjkSl9koV1XsmKlDsOE67hDncqcYVsD+zM67DBuTlRHR77lS8bVlpa6MXBdK5r988Gs9
	 xkvkjE4nLzJT5kOZ/ymFuF+r+Sj1Hff6JlvxS3GW6iSy4HKbd7BJstKXQf0ELMsU5ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZqzTqnNF;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BEB606A319;
	Thu, 22 Oct 2026 01:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BEB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZqzTqnNF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792633325; x=1824169325;
  h=date:from:to:cc:subject:message-id;
  bh=1zT58Oo4VfG7aEdKNS+2W+BKuTfsualaGBxInIodGOw=;
  b=ZqzTqnNFzIksK9XeZaDhP+xN4+vn+q0ox1zzUO+wmP0lz3842HkctKP8
   Ayq3MoE/PLi+CYG0ZhBJrLnLeh+lXgTmsy/wqPkzd7T/16YAHpgcAh0D4
   Iq1Gsy2nFfzi0tmYJmCQbpbIPSdwQDdsQFdoCkyZbrgq9BOkS08tq4OhI
   +R7VqfI4Pg8q0hkydK67UsmR4u/qWclo4azAD+BtayJcP0Nna4LoC9/KT
   viVQjHlAsL3fjXbisA82E8fOMKs3+Q0zvIwNvH/F43xN1DZTS7BMMHUDd
   GAnNIANiIyt41APHPrPoZPDurjmccA2qIkwW8OMUytpctZ3WSVqsia/8L
   A==;
X-CSE-ConnectionGUID: eHUH/v+8SLOVMrKS7RKqAg==
X-CSE-MsgGUID: x/ZJ5amkSBCFnpBuHn9oAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1377216"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1377216"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 18:42:05 -0700
X-CSE-ConnectionGUID: xehPM/52ToCc8ulPRwzdTg==
X-CSE-MsgGUID: sLgnk31eR4e9kUQ/TCZNqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3155950"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 18:42:04 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJhof-00000000QMw-0Fdr;
	Thu, 22 Oct 2026 01:42:01 +0000
Date: Thu, 22 Oct 2026 09:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: [dwmw2:vsm 24/115] arch/loongarch/kvm/vcpu.c:167:53: error:
 expected ')'
Message-ID: <202610220917.Huyunnnm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   git://git.infradead.org/users/dwmw2/linux vsm
head:   0d3b0d77a4f09382bf67c82ed7e64ff81d4fb803
commit: e107e0e18513558d7ed0c750f6878d90a2f58a26 [24/115] KVM: Introduce kvm_check_gen()/kvm_memslots_check_gen()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261022/202610220917.Huyunnnm-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610220917.Huyunnnm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610220917.Huyunnnm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/kvm/vcpu.c:167:53: error: expected ')'
     167 |                      kvm_is_error_hva(ghc->hva) || !ghc->memslot) {
         |                                                                   ^
   arch/loongarch/kvm/vcpu.c:166:5: note: to match this '('
     166 |         if (unlikely(!kvm_check_gen(vcpu->kvm, ghc->generation) || gpa != ghc->gpa ||
         |            ^
   arch/loongarch/kvm/vcpu.c:1834:53: error: expected ')'
    1834 |                      kvm_is_error_hva(ghc->hva) || !ghc->memslot) {
         |                                                                   ^
   arch/loongarch/kvm/vcpu.c:1833:5: note: to match this '('
    1833 |         if (unlikely(!kvm_check_gen(vcpu->kvm, ghc->generation) || gpa != ghc->gpa ||
         |            ^
   2 errors generated.


vim +167 arch/loongarch/kvm/vcpu.c

   151	
   152	static void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
   153	{
   154		u32 version;
   155		u64 steal;
   156		gpa_t gpa;
   157		struct kvm_steal_time __user *st;
   158		struct gfn_to_hva_cache *ghc;
   159	
   160		ghc = &vcpu->arch.st.cache;
   161		gpa = vcpu->arch.st.guest_addr;
   162		if (!(gpa & KVM_STEAL_PHYS_VALID))
   163			return;
   164	
   165		gpa &= KVM_STEAL_PHYS_MASK;
   166		if (unlikely(!kvm_check_gen(vcpu->kvm, ghc->generation) || gpa != ghc->gpa ||
 > 167			     kvm_is_error_hva(ghc->hva) || !ghc->memslot) {
   168			if (kvm_gfn_to_hva_cache_init(vcpu->kvm, ghc, gpa, sizeof(*st))) {
   169				ghc->gpa = INVALID_GPA;
   170				return;
   171			}
   172		}
   173	
   174		st = (struct kvm_steal_time __user *)ghc->hva;
   175		if (kvm_guest_has_pv_feature(vcpu, KVM_FEATURE_PREEMPT)) {
   176			unsafe_put_user(0, &st->preempted, out);
   177			vcpu->arch.st.preempted = 0;
   178		}
   179	
   180		unsafe_get_user(version, &st->version, out);
   181		if (version & 1)
   182			version += 1; /* first time write, random junk */
   183	
   184		version += 1;
   185		unsafe_put_user(version, &st->version, out);
   186		smp_wmb();
   187	
   188		unsafe_get_user(steal, &st->steal, out);
   189		steal += current->sched_info.run_delay - vcpu->arch.st.last_steal;
   190		vcpu->arch.st.last_steal = current->sched_info.run_delay;
   191		unsafe_put_user(steal, &st->steal, out);
   192	
   193		smp_wmb();
   194		version += 1;
   195		unsafe_put_user(version, &st->version, out);
   196	out:
   197		mark_page_dirty_in_slot(vcpu->kvm, ghc->memslot, gpa_to_gfn(ghc->gpa));
   198	}
   199	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

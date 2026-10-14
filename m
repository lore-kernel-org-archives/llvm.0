Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C5931B101;
	Wed, 14 Oct 2026 22:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792018088; cv=none; b=nygqHPXHL3VGgRCRZ/CCpZxMSJ4rsZw+agouaVPAEMex5MbV1Eh+W67c0g/xOYIXB8cOePn9L3af49JHVmkbx8bGhLgVa93odZAVocp4T3inR+E6SER4T3ytIe1l6Rie8yMq8/vXgjHo2H1XSTtrF0LKn02MMBeUf5ww3Trh9n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792018088; c=relaxed/simple;
	bh=9ABpgmu2hbVNbQLfygALqCGTRC6G0ir9rn9jlbHsvA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i/Ko8oFJtGcgTBNFgioe7HVtFolqrSJWdl0krsS9KeslrCo/eCySP7s1XIwxd8/5JtzmsJx7PnrDWO0F0NLiAPIzfBd6PaW8RxrOEywG2+P/bQ3DBS3oECdEYDgNgM95s1AhVQ8T+QCArMQsRu/M/lxtExJYFRoxGv39YiG4dFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joy/36SX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joy/36SX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792018086; x=1823554086;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9ABpgmu2hbVNbQLfygALqCGTRC6G0ir9rn9jlbHsvA8=;
  b=joy/36SXHdbT7sOs84UgJnRTU2bud0uLe9j8PUYCvwDpZP+r+8VB+84X
   sDmiliw42ZmHZ26v/lCUMmW6lL8mCAuQU4R0ifiJdBoxKNICLzvd/Jm3l
   ehfjlcopkN8W90/O2tnhROug/vpW4DHf376UPdbPullnA9xr7nbUOFF37
   JllXtNgZSE77fQ51T8SDLuqWYl0m4HFVk/LovBOkeRFfff7TcUw2xc2QR
   CeKnlPuNRAXl43E3HqI+YcZxeUHDxFAHUNP0YCsdbvkgnFCp/AsNxLdor
   9XdgnfkZ/OiHemeLXHjpJz9cZwEXo1vBqXToydSbW61ESznacTMHpa8Kq
   A==;
X-CSE-ConnectionGUID: rYgbdZWZTUOrCLZ+NCyLsA==
X-CSE-MsgGUID: hcs32e3fRmuEcxWSkeCnKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="667585"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="667585"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:48:05 -0700
X-CSE-ConnectionGUID: 1SuskPsHTkqzIcsAFNOLmg==
X-CSE-MsgGUID: ThwvIAIKTYS9ZgEDnddXgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1567394"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Oct 2026 15:48:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH7lR-00000000FIz-2vZZ;
	Wed, 14 Oct 2026 22:48:01 +0000
Date: Thu, 15 Oct 2026 06:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kill_should_kick_with_force 6/7]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:3872:51: error: use of undeclared
 identifier 'wait'
Message-ID: <202610150646.zXJuIa3R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/sean-jc/linux x86/kill_should_kick_with_force
head:   01d71338eb030f22b384bb16b117a6429b0ed13a
commit: b5478e7ec85c764e4e846b20f8aafc5b0af2502f [6/7] KVM: Plumb the full =
request into __kvm_vcpu_kick()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261015/2026=
10150646.zXJuIa3R-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261015/202610150646.zXJuIa3R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150646.zXJuIa3R-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:3872:51: error: use of undecla=
red identifier 'wait'
    3872 |                                 smp_call_function_single(cpu, ac=
k_kick, NULL, wait);
         |                                                                 =
              ^~~~
   1 error generated.


vim +/wait +3872 arch/x86/kvm/../../../virt/kvm/kvm_main.c

dd1a4cc1fbdf51 Radim Kr=C4=8Dm=C3=A1=C5=99        2016-05-04  3824 =20
0266c894b51c41 Paolo Bonzini       2017-05-04  3825  #ifndef CONFIG_S390
dd1a4cc1fbdf51 Radim Kr=C4=8Dm=C3=A1=C5=99        2016-05-04  3826  /*
dd1a4cc1fbdf51 Radim Kr=C4=8Dm=C3=A1=C5=99        2016-05-04  3827   * Kick=
 a sleeping VCPU, or a guest VCPU in guest mode, into host kernel mode.
dd1a4cc1fbdf51 Radim Kr=C4=8Dm=C3=A1=C5=99        2016-05-04  3828   */
b5478e7ec85c76 Sean Christopherson 2026-10-13  3829  void __kvm_vcpu_kick(s=
truct kvm_vcpu *vcpu, int req, bool force)
dd1a4cc1fbdf51 Radim Kr=C4=8Dm=C3=A1=C5=99        2016-05-04  3830  {
85b640450ddcfa Sean Christopherson 2021-08-27  3831  	int me, cpu;
dd1a4cc1fbdf51 Radim Kr=C4=8Dm=C3=A1=C5=99        2016-05-04  3832 =20
178f02ffafafc5 Radim Kr=C4=8Dm=C3=A1=C5=99        2017-04-26  3833  	if (kv=
m_vcpu_wake_up(vcpu))
178f02ffafafc5 Radim Kr=C4=8Dm=C3=A1=C5=99        2017-04-26  3834  		retur=
n;
178f02ffafafc5 Radim Kr=C4=8Dm=C3=A1=C5=99        2017-04-26  3835 =20
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3836  	me =3D get_cpu();
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3837  	/*
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3838  	 * The only state cha=
nge done outside the vcpu mutex is IN_GUEST_MODE
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3839  	 * to EXITING_GUEST_M=
ODE.  Therefore the moderately expensive "should
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3840  	 * kick" check does n=
ot need atomic operations if kvm_vcpu_kick is used
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3841  	 * within the vCPU th=
read itself.
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3842  	 */
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3843  	if (vcpu =3D=3D __thi=
s_cpu_read(kvm_running_vcpu)) {
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3844  		if (vcpu->mode =3D=
=3D IN_GUEST_MODE)
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3845  			WRITE_ONCE(vcpu->mo=
de, EXITING_GUEST_MODE);
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3846  		goto out;
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3847  	}
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3848 =20
85b640450ddcfa Sean Christopherson 2021-08-27  3849  	/*
85b640450ddcfa Sean Christopherson 2021-08-27  3850  	 * Note, the vCPU cou=
ld get migrated to a different pCPU at any point
82c1e532e026a2 Sean Christopherson 2026-10-13  3851  	 * after kvm_vcpu_sho=
uld_kick(), which could result in sending an
85b640450ddcfa Sean Christopherson 2021-08-27  3852  	 * IPI to the previou=
s pCPU.  But, that's ok because the purpose of the
85b640450ddcfa Sean Christopherson 2021-08-27  3853  	 * IPI is to force th=
e vCPU to leave IN_GUEST_MODE, and migrating the
cc49503cc46665 Sean Christopherson 2026-10-13  3854  	 * vCPU also requires=
 it to leave IN_GUEST_MODE
cc49503cc46665 Sean Christopherson 2026-10-13  3855  	 *
cc49503cc46665 Sean Christopherson 2026-10-13  3856  	 * Note #2, do NOT ch=
eck if an IPI is needed if @force is true, as the
cc49503cc46665 Sean Christopherson 2026-10-13  3857  	 * check also modifie=
s vcpu->mode and KVM PPC needs to avoid that side
cc49503cc46665 Sean Christopherson 2026-10-13  3858  	 * effect for unknown=
 historical reasons.
85b640450ddcfa Sean Christopherson 2021-08-27  3859  	 */
82c1e532e026a2 Sean Christopherson 2026-10-13  3860  	if (force || kvm_vcpu=
_should_kick(vcpu)) {
85b640450ddcfa Sean Christopherson 2021-08-27  3861  		cpu =3D READ_ONCE(vc=
pu->cpu);
309d28576f0a23 Tom Lendacky        2025-03-27  3862  		if (cpu !=3D me && (=
unsigned int)cpu < nr_cpu_ids && cpu_online(cpu)) {
309d28576f0a23 Tom Lendacky        2025-03-27  3863  			/*
b5478e7ec85c76 Sean Christopherson 2026-10-13  3864  			 * Use a reschedule=
 IPI to kick the vCPU if the request
b5478e7ec85c76 Sean Christopherson 2026-10-13  3865  			 * doesn't need to =
wait for a response (or there is no
b5478e7ec85c76 Sean Christopherson 2026-10-13  3866  			 * request), as KVM=
 allows kicking vCPUs while IRQs are
b5478e7ec85c76 Sean Christopherson 2026-10-13  3867  			 * disabled, but us=
ing the SMP function call framework
b5478e7ec85c76 Sean Christopherson 2026-10-13  3868  			 * with IRQs disabl=
ed can deadlock due to taking cross-
b5478e7ec85c76 Sean Christopherson 2026-10-13  3869  			 * CPU locks.
309d28576f0a23 Tom Lendacky        2025-03-27  3870  			 */
b5478e7ec85c76 Sean Christopherson 2026-10-13  3871  			if (req & KVM_REQUE=
ST_WAIT)
309d28576f0a23 Tom Lendacky        2025-03-27 @3872  				smp_call_function_=
single(cpu, ack_kick, NULL, wait);
309d28576f0a23 Tom Lendacky        2025-03-27  3873  			else
b6d33834bd4e8b Christoffer Dall    2012-03-08  3874  				smp_send_reschedul=
e(cpu);
85b640450ddcfa Sean Christopherson 2021-08-27  3875  		}
309d28576f0a23 Tom Lendacky        2025-03-27  3876  	}
aefdc2ed445eb4 Paolo Bonzini       2021-10-20  3877  out:
b6d33834bd4e8b Christoffer Dall    2012-03-08  3878  	put_cpu();
b6d33834bd4e8b Christoffer Dall    2012-03-08  3879  }
20c48920583675 Sean Christopherson 2025-09-18  3880  EXPORT_SYMBOL_FOR_KVM_=
INTERNAL(__kvm_vcpu_kick);
0266c894b51c41 Paolo Bonzini       2017-05-04  3881  #endif /* !CONFIG_S390=
 */
b6d33834bd4e8b Christoffer Dall    2012-03-08  3882 =20

:::::: The code at line 3872 was first introduced by commit
:::::: 309d28576f0a23931a36bf67324868448f79a77e KVM: SVM: Fix SNP AP destro=
y race with VMRUN

:::::: TO: Tom Lendacky <thomas.lendacky@amd.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

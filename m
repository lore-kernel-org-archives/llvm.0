Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5864C36AEF;
	Wed, 20 Mar 2024 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710923228; cv=none; b=U7dxlB8gcZFXwHTJ8DRay8s66XzyFumWVDvQ6GPBlZB4468/dN3RP0W+njYqb//dWEUpl7ncuV6FlzJMrXPbEffYF88kE/DotFtScR1o0cZk/Atb+znB0g/tP2exspAu7AIBpmk7aaV6TcY46WWscQkaS2OGuRutSAVKWIh0fkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710923228; c=relaxed/simple;
	bh=MluTIc1gidA1DFYkYYxsbiaZ+pFE9xQasd5vTWas8R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+WZX3Faa1hLN1EyVNbKjydXnZFJOlm9Spy2eIeH4/YWPCszvscF0iI30ZUK8OY+wzt+nx4rJjCIaOFw48orQ537DsAW9C2Ihrj6nm6qmFdkHOrC+75sUy3oUC3H5T+iTFDtA9f0uE4mvf1zcySCYqNvcMd6SxI0IPsPb7gk1Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRL0hkUa; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRL0hkUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710923225; x=1742459225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MluTIc1gidA1DFYkYYxsbiaZ+pFE9xQasd5vTWas8R8=;
  b=TRL0hkUa5LL5aPU7Ow0oSKA+7BmaxrviTzIIG5/GsRLwDGnCMdum+g33
   5XfOMAHbkaYCIBI+clxMdHhKRMP9b2zqcfrE1osBsajT3+sL14WtN9rhQ
   +KuULKeLur5oSDbkErpz6MUc6UkSpUu+jEIAWY3FLx9u7vpooKPNClHl1
   3AFUYBPc5gQhVL6ImZDgR3PNsxZ4SIiVlTpWMYPeT2rwNkFtKFIEXk1nT
   3Xhni0FRBGJWMHkHhsQVxYsRq0KX6VEoZjMp+AAM8Veu2RJr8QmjIfwQ3
   nMHWNMkqsELJGkcfflbm+rqv8b9rIVxAkGOQezpLCBw1lUhGV1YfQi3dI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5669372"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5669372"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 01:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="14154086"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Mar 2024 01:27:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmrHo-000ITP-2R;
	Wed, 20 Mar 2024 08:27:00 +0000
Date: Wed, 20 Mar 2024 16:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 02/15] KVM: SVM: Compile sev.c if and only if
 CONFIG_KVM_AMD_SEV=y
Message-ID: <202403201614.EaivvQmz-lkp@intel.com>
References: <20240318233352.2728327-3-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318233352.2728327-3-pbonzini@redhat.com>

Hi Paolo,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on linus/master next-20240320]
[cannot apply to tip/x86/core mst-vhost/linux-next kvm/linux-next v6.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Bonzini/KVM-SVM-Invert-handling-of-SEV-and-SEV_ES-feature-flags/20240319-074252
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20240318233352.2728327-3-pbonzini%40redhat.com
patch subject: [PATCH v4 02/15] KVM: SVM: Compile sev.c if and only if CONFIG_KVM_AMD_SEV=y
config: x86_64-buildonly-randconfig-001-20240319 (https://download.01.org/0day-ci/archive/20240320/202403201614.EaivvQmz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403201614.EaivvQmz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403201614.EaivvQmz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/x86/kvm/svm/svm.c:1367:3: error: call to undeclared function 'sev_init_vmcb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1367 |                 sev_init_vmcb(svm);
         |                 ^
>> arch/x86/kvm/svm/svm.c:1391:3: error: call to undeclared function 'sev_es_vcpu_reset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1391 |                 sev_es_vcpu_reset(svm);
         |                 ^
   arch/x86/kvm/svm/svm.c:1391:3: note: did you mean 'kvm_vcpu_reset'?
   arch/x86/include/asm/kvm_host.h:2222:6: note: 'kvm_vcpu_reset' declared here
    2222 | void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event);
         |      ^
>> arch/x86/kvm/svm/svm.c:1512:3: error: call to undeclared function 'sev_es_unmap_ghcb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1512 |                 sev_es_unmap_ghcb(svm);
         |                 ^
>> arch/x86/kvm/svm/svm.c:1526:3: error: call to undeclared function 'sev_es_prepare_switch_to_guest'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1526 |                 sev_es_prepare_switch_to_guest(hostsa);
         |                 ^
   arch/x86/kvm/svm/svm.c:1526:3: note: did you mean 'svm_prepare_switch_to_guest'?
   arch/x86/kvm/svm/svm.c:1506:13: note: 'svm_prepare_switch_to_guest' declared here
    1506 | static void svm_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
         |             ^
>> arch/x86/kvm/svm/svm.c:2226:11: error: call to undeclared function 'sev_es_string_io'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2226 |                         return sev_es_string_io(svm, size, port, in);
         |                                ^
   arch/x86/kvm/svm/svm.c:2226:11: note: did you mean 'kvm_sev_es_string_io'?
   arch/x86/kvm/x86.h:537:5: note: 'kvm_sev_es_string_io' declared here
     537 | int kvm_sev_es_string_io(struct kvm_vcpu *vcpu, unsigned int size,
         |     ^
>> arch/x86/kvm/svm/svm.c:3549:10: error: call to undeclared function 'pre_sev_run'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3549 |                 return pre_sev_run(svm, vcpu->cpu);
         |                        ^
   arch/x86/kvm/svm/svm.c:3549:10: note: did you mean 'pre_svm_run'?
   arch/x86/kvm/svm/svm.c:3532:13: note: 'pre_svm_run' declared here
    3532 | static void pre_svm_run(struct kvm_vcpu *vcpu)
         |             ^
>> arch/x86/kvm/svm/svm.c:3549:3: warning: void function 'pre_svm_run' should not return a value [-Wreturn-type]
    3549 |                 return pre_sev_run(svm, vcpu->cpu);
         |                 ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/svm/svm.c:4356:3: error: call to undeclared function 'sev_vcpu_after_set_cpuid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4356 |                 sev_vcpu_after_set_cpuid(svm);
         |                 ^
   arch/x86/kvm/svm/svm.c:4356:3: note: did you mean 'svm_vcpu_after_set_cpuid'?
   arch/x86/kvm/svm/svm.c:4309:13: note: 'svm_vcpu_after_set_cpuid' declared here
    4309 | static void svm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
         |             ^
>> arch/x86/kvm/svm/svm.c:4883:2: error: call to undeclared function 'sev_vcpu_deliver_sipi_vector'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4883 |         sev_vcpu_deliver_sipi_vector(vcpu, vector);
         |         ^
   arch/x86/kvm/svm/svm.c:4883:2: note: did you mean 'svm_vcpu_deliver_sipi_vector'?
   arch/x86/kvm/svm/svm.c:4878:13: note: 'svm_vcpu_deliver_sipi_vector' declared here
    4878 | static void svm_vcpu_deliver_sipi_vector(struct kvm_vcpu *vcpu, u8 vector)
         |             ^
    4879 | {
    4880 |         if (!sev_es_guest(vcpu->kvm))
    4881 |                 return kvm_vcpu_deliver_sipi_vector(vcpu, vector);
    4882 | 
    4883 |         sev_vcpu_deliver_sipi_vector(vcpu, vector);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         svm_vcpu_deliver_sipi_vector
   1 warning and 8 errors generated.


vim +/sev_init_vmcb +1367 arch/x86/kvm/svm/svm.c

36e8194dcd749c arch/x86/kvm/svm/svm.c Paolo Bonzini         2021-09-23  1226  
63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini         2021-03-02  1227  static void init_vmcb(struct kvm_vcpu *vcpu)
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1228  {
63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini         2021-03-02  1229  	struct vcpu_svm *svm = to_svm(vcpu);
1ee73a332f80dd arch/x86/kvm/svm/svm.c Maxim Levitsky        2022-03-22  1230  	struct vmcb *vmcb = svm->vmcb01.ptr;
1ee73a332f80dd arch/x86/kvm/svm/svm.c Maxim Levitsky        2022-03-22  1231  	struct vmcb_control_area *control = &vmcb->control;
1ee73a332f80dd arch/x86/kvm/svm/svm.c Maxim Levitsky        2022-03-22  1232  	struct vmcb_save_area *save = &vmcb->save;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1233  
830bd71f2c0684 arch/x86/kvm/svm/svm.c Babu Moger            2020-09-11  1234  	svm_set_intercept(svm, INTERCEPT_CR0_READ);
830bd71f2c0684 arch/x86/kvm/svm/svm.c Babu Moger            2020-09-11  1235  	svm_set_intercept(svm, INTERCEPT_CR3_READ);
830bd71f2c0684 arch/x86/kvm/svm/svm.c Babu Moger            2020-09-11  1236  	svm_set_intercept(svm, INTERCEPT_CR4_READ);
830bd71f2c0684 arch/x86/kvm/svm/svm.c Babu Moger            2020-09-11  1237  	svm_set_intercept(svm, INTERCEPT_CR0_WRITE);
830bd71f2c0684 arch/x86/kvm/svm/svm.c Babu Moger            2020-09-11  1238  	svm_set_intercept(svm, INTERCEPT_CR3_WRITE);
830bd71f2c0684 arch/x86/kvm/svm/svm.c Babu Moger            2020-09-11  1239  	svm_set_intercept(svm, INTERCEPT_CR4_WRITE);
63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini         2021-03-02  1240  	if (!kvm_vcpu_apicv_active(vcpu))
830bd71f2c0684 arch/x86/kvm/svm/svm.c Babu Moger            2020-09-11  1241  		svm_set_intercept(svm, INTERCEPT_CR8_WRITE);
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1242  
5315c716b69f47 arch/x86/kvm/svm.c     Paolo Bonzini         2014-03-03  1243  	set_dr_intercepts(svm);
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1244  
18c918c5f59bc3 arch/x86/kvm/svm.c     Joerg Roedel          2010-11-30  1245  	set_exception_intercept(svm, PF_VECTOR);
18c918c5f59bc3 arch/x86/kvm/svm.c     Joerg Roedel          2010-11-30  1246  	set_exception_intercept(svm, UD_VECTOR);
18c918c5f59bc3 arch/x86/kvm/svm.c     Joerg Roedel          2010-11-30  1247  	set_exception_intercept(svm, MC_VECTOR);
54a20552e1eae0 arch/x86/kvm/svm.c     Eric Northup          2015-11-03  1248  	set_exception_intercept(svm, AC_VECTOR);
cbdb967af3d549 arch/x86/kvm/svm.c     Paolo Bonzini         2015-11-10  1249  	set_exception_intercept(svm, DB_VECTOR);
9718420e9fd462 arch/x86/kvm/svm.c     Liran Alon            2018-03-12  1250  	/*
9718420e9fd462 arch/x86/kvm/svm.c     Liran Alon            2018-03-12  1251  	 * Guest access to VMware backdoor ports could legitimately
9718420e9fd462 arch/x86/kvm/svm.c     Liran Alon            2018-03-12  1252  	 * trigger #GP because of TSS I/O permission bitmap.
9718420e9fd462 arch/x86/kvm/svm.c     Liran Alon            2018-03-12  1253  	 * We intercept those #GP and allow access to them anyway
29de732cc95cb5 arch/x86/kvm/svm/svm.c Alexey Kardashevskiy  2023-06-15  1254  	 * as VMware does.
9718420e9fd462 arch/x86/kvm/svm.c     Liran Alon            2018-03-12  1255  	 */
29de732cc95cb5 arch/x86/kvm/svm/svm.c Alexey Kardashevskiy  2023-06-15  1256  	if (enable_vmware_backdoor)
9718420e9fd462 arch/x86/kvm/svm.c     Liran Alon            2018-03-12  1257  		set_exception_intercept(svm, GP_VECTOR);
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1258  
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1259  	svm_set_intercept(svm, INTERCEPT_INTR);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1260  	svm_set_intercept(svm, INTERCEPT_NMI);
4b639a9f82fcf1 arch/x86/kvm/svm/svm.c Maxim Levitsky        2021-07-07  1261  
4b639a9f82fcf1 arch/x86/kvm/svm/svm.c Maxim Levitsky        2021-07-07  1262  	if (intercept_smi)
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1263  		svm_set_intercept(svm, INTERCEPT_SMI);
4b639a9f82fcf1 arch/x86/kvm/svm/svm.c Maxim Levitsky        2021-07-07  1264  
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1265  	svm_set_intercept(svm, INTERCEPT_SELECTIVE_CR0);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1266  	svm_set_intercept(svm, INTERCEPT_RDPMC);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1267  	svm_set_intercept(svm, INTERCEPT_CPUID);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1268  	svm_set_intercept(svm, INTERCEPT_INVD);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1269  	svm_set_intercept(svm, INTERCEPT_INVLPG);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1270  	svm_set_intercept(svm, INTERCEPT_INVLPGA);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1271  	svm_set_intercept(svm, INTERCEPT_IOIO_PROT);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1272  	svm_set_intercept(svm, INTERCEPT_MSR_PROT);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1273  	svm_set_intercept(svm, INTERCEPT_TASK_SWITCH);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1274  	svm_set_intercept(svm, INTERCEPT_SHUTDOWN);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1275  	svm_set_intercept(svm, INTERCEPT_VMRUN);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1276  	svm_set_intercept(svm, INTERCEPT_VMMCALL);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1277  	svm_set_intercept(svm, INTERCEPT_VMLOAD);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1278  	svm_set_intercept(svm, INTERCEPT_VMSAVE);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1279  	svm_set_intercept(svm, INTERCEPT_STGI);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1280  	svm_set_intercept(svm, INTERCEPT_CLGI);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1281  	svm_set_intercept(svm, INTERCEPT_SKINIT);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1282  	svm_set_intercept(svm, INTERCEPT_WBINVD);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1283  	svm_set_intercept(svm, INTERCEPT_XSETBV);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1284  	svm_set_intercept(svm, INTERCEPT_RDPRU);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1285  	svm_set_intercept(svm, INTERCEPT_RSM);
668fffa3f838ed arch/x86/kvm/svm.c     Michael S. Tsirkin    2017-04-21  1286  
63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini         2021-03-02  1287  	if (!kvm_mwait_in_guest(vcpu->kvm)) {
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1288  		svm_set_intercept(svm, INTERCEPT_MONITOR);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1289  		svm_set_intercept(svm, INTERCEPT_MWAIT);
668fffa3f838ed arch/x86/kvm/svm.c     Michael S. Tsirkin    2017-04-21  1290  	}
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1291  
63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini         2021-03-02  1292  	if (!kvm_hlt_in_guest(vcpu->kvm))
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1293  		svm_set_intercept(svm, INTERCEPT_HLT);
caa057a2cad647 arch/x86/kvm/svm.c     Wanpeng Li            2018-03-12  1294  
d0ec49d4de9080 arch/x86/kvm/svm.c     Tom Lendacky          2017-07-17  1295  	control->iopm_base_pa = __sme_set(iopm_base);
d0ec49d4de9080 arch/x86/kvm/svm.c     Tom Lendacky          2017-07-17  1296  	control->msrpm_base_pa = __sme_set(__pa(svm->msrpm));
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1297  	control->int_ctl = V_INTR_MASKING_MASK;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1298  
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1299  	init_seg(&save->es);
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1300  	init_seg(&save->ss);
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1301  	init_seg(&save->ds);
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1302  	init_seg(&save->fs);
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1303  	init_seg(&save->gs);
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1304  
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1305  	save->cs.selector = 0xf000;
04b66839d312d3 arch/x86/kvm/svm.c     Paolo Bonzini         2013-03-19  1306  	save->cs.base = 0xffff0000;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1307  	/* Executable/Readable Code Segment */
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1308  	save->cs.attrib = SVM_SELECTOR_READ_MASK | SVM_SELECTOR_P_MASK |
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1309  		SVM_SELECTOR_S_MASK | SVM_SELECTOR_CODE_MASK;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1310  	save->cs.limit = 0xffff;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1311  
4f117ce4aefca0 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-07-13  1312  	save->gdtr.base = 0;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1313  	save->gdtr.limit = 0xffff;
4f117ce4aefca0 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-07-13  1314  	save->idtr.base = 0;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1315  	save->idtr.limit = 0xffff;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1316  
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1317  	init_sys_seg(&save->ldtr, SEG_TYPE_LDT);
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1318  	init_sys_seg(&save->tr, SEG_TYPE_BUSY_TSS16);
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1319  
709ddebf81cb40 arch/x86/kvm/svm.c     Joerg Roedel          2008-02-07  1320  	if (npt_enabled) {
709ddebf81cb40 arch/x86/kvm/svm.c     Joerg Roedel          2008-02-07  1321  		/* Setup VMCB for Nested Paging */
cea3a19b007a69 arch/x86/kvm/svm.c     Tom Lendacky          2017-12-04  1322  		control->nested_ctl |= SVM_NESTED_CTL_NP_ENABLE;
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1323  		svm_clr_intercept(svm, INTERCEPT_INVLPG);
18c918c5f59bc3 arch/x86/kvm/svm.c     Joerg Roedel          2010-11-30  1324  		clr_exception_intercept(svm, PF_VECTOR);
830bd71f2c0684 arch/x86/kvm/svm/svm.c Babu Moger            2020-09-11  1325  		svm_clr_intercept(svm, INTERCEPT_CR3_READ);
830bd71f2c0684 arch/x86/kvm/svm/svm.c Babu Moger            2020-09-11  1326  		svm_clr_intercept(svm, INTERCEPT_CR3_WRITE);
63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini         2021-03-02  1327  		save->g_pat = vcpu->arch.pat;
709ddebf81cb40 arch/x86/kvm/svm.c     Joerg Roedel          2008-02-07  1328  		save->cr3 = 0;
709ddebf81cb40 arch/x86/kvm/svm.c     Joerg Roedel          2008-02-07  1329  	}
193015adf40d04 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-12  1330  	svm->current_vmcb->asid_generation = 0;
7e8e6eed75e290 arch/x86/kvm/svm/svm.c Cathy Avery           2020-10-11  1331  	svm->asid = 0;
1371d90460189d arch/x86/kvm/svm.c     Alexander Graf        2008-11-25  1332  
c74ad08f3333db arch/x86/kvm/svm/svm.c Maxim Levitsky        2021-05-03  1333  	svm->nested.vmcb12_gpa = INVALID_GPA;
c74ad08f3333db arch/x86/kvm/svm/svm.c Maxim Levitsky        2021-05-03  1334  	svm->nested.last_vmcb12_gpa = INVALID_GPA;
2af9194d1b683f arch/x86/kvm/svm.c     Joerg Roedel          2009-08-07  1335  
63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini         2021-03-02  1336  	if (!kvm_pause_in_guest(vcpu->kvm)) {
8566ac8b8e7cac arch/x86/kvm/svm.c     Babu Moger            2018-03-16  1337  		control->pause_filter_count = pause_filter_count;
8566ac8b8e7cac arch/x86/kvm/svm.c     Babu Moger            2018-03-16  1338  		if (pause_filter_thresh)
8566ac8b8e7cac arch/x86/kvm/svm.c     Babu Moger            2018-03-16  1339  			control->pause_filter_thresh = pause_filter_thresh;
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1340  		svm_set_intercept(svm, INTERCEPT_PAUSE);
8566ac8b8e7cac arch/x86/kvm/svm.c     Babu Moger            2018-03-16  1341  	} else {
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1342  		svm_clr_intercept(svm, INTERCEPT_PAUSE);
565d0998ecac83 arch/x86/kvm/svm.c     Mark Langsdorf        2009-10-06  1343  	}
565d0998ecac83 arch/x86/kvm/svm.c     Mark Langsdorf        2009-10-06  1344  
3b195ac9260235 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-05-04  1345  	svm_recalc_instruction_intercepts(vcpu, svm);
4407a797e9412a arch/x86/kvm/svm/svm.c Babu Moger            2020-09-11  1346  
89c8a4984fc98e arch/x86/kvm/svm.c     Janakarajan Natarajan 2017-07-06  1347  	/*
d00b99c514b33a arch/x86/kvm/svm/svm.c Babu Moger            2021-02-17  1348  	 * If the host supports V_SPEC_CTRL then disable the interception
d00b99c514b33a arch/x86/kvm/svm/svm.c Babu Moger            2021-02-17  1349  	 * of MSR_IA32_SPEC_CTRL.
89c8a4984fc98e arch/x86/kvm/svm.c     Janakarajan Natarajan 2017-07-06  1350  	 */
d00b99c514b33a arch/x86/kvm/svm/svm.c Babu Moger            2021-02-17  1351  	if (boot_cpu_has(X86_FEATURE_V_SPEC_CTRL))
d00b99c514b33a arch/x86/kvm/svm/svm.c Babu Moger            2021-02-17  1352  		set_msr_interception(vcpu, svm->msrpm, MSR_IA32_SPEC_CTRL, 1, 1);
d00b99c514b33a arch/x86/kvm/svm/svm.c Babu Moger            2021-02-17  1353  
63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini         2021-03-02  1354  	if (kvm_vcpu_apicv_active(vcpu))
1ee73a332f80dd arch/x86/kvm/svm/svm.c Maxim Levitsky        2022-03-22  1355  		avic_init_vmcb(svm, vmcb);
89c8a4984fc98e arch/x86/kvm/svm.c     Janakarajan Natarajan 2017-07-06  1356  
fa4c027a7956f5 arch/x86/kvm/svm/svm.c Santosh Shukla        2023-02-27  1357  	if (vnmi)
fa4c027a7956f5 arch/x86/kvm/svm/svm.c Santosh Shukla        2023-02-27  1358  		svm->vmcb->control.int_ctl |= V_NMI_ENABLE_MASK;
fa4c027a7956f5 arch/x86/kvm/svm/svm.c Santosh Shukla        2023-02-27  1359  
640bd6e5752274 arch/x86/kvm/svm.c     Janakarajan Natarajan 2017-08-23  1360  	if (vgif) {
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1361  		svm_clr_intercept(svm, INTERCEPT_STGI);
a284ba56a0a4b5 arch/x86/kvm/svm/svm.c Joerg Roedel          2020-06-25  1362  		svm_clr_intercept(svm, INTERCEPT_CLGI);
640bd6e5752274 arch/x86/kvm/svm.c     Janakarajan Natarajan 2017-08-23  1363  		svm->vmcb->control.int_ctl |= V_GIF_ENABLE_MASK;
640bd6e5752274 arch/x86/kvm/svm.c     Janakarajan Natarajan 2017-08-23  1364  	}
640bd6e5752274 arch/x86/kvm/svm.c     Janakarajan Natarajan 2017-08-23  1365  
6defa24d3b12bb arch/x86/kvm/svm/svm.c Peter Gonda           2022-06-23  1366  	if (sev_guest(vcpu->kvm))
6defa24d3b12bb arch/x86/kvm/svm/svm.c Peter Gonda           2022-06-23 @1367  		sev_init_vmcb(svm);
1654efcbc431a3 arch/x86/kvm/svm.c     Brijesh Singh         2017-12-04  1368  
1ee73a332f80dd arch/x86/kvm/svm/svm.c Maxim Levitsky        2022-03-22  1369  	svm_hv_init_vmcb(vmcb);
36e8194dcd749c arch/x86/kvm/svm/svm.c Paolo Bonzini         2021-09-23  1370  	init_vmcb_after_set_cpuid(vcpu);
1e0c7d40758bcd arch/x86/kvm/svm/svm.c Vineeth Pillai        2021-06-03  1371  
1ee73a332f80dd arch/x86/kvm/svm/svm.c Maxim Levitsky        2022-03-22  1372  	vmcb_mark_all_dirty(vmcb);
8d28fec406e4d5 arch/x86/kvm/svm.c     Roedel, Joerg         2010-12-03  1373  
2af9194d1b683f arch/x86/kvm/svm.c     Joerg Roedel          2009-08-07  1374  	enable_gif(svm);
44a95dae1d229a arch/x86/kvm/svm.c     Suravee Suthikulpanit 2016-05-04  1375  }
44a95dae1d229a arch/x86/kvm/svm.c     Suravee Suthikulpanit 2016-05-04  1376  
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1377  static void __svm_vcpu_reset(struct kvm_vcpu *vcpu)
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1378  {
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1379  	struct vcpu_svm *svm = to_svm(vcpu);
44a95dae1d229a arch/x86/kvm/svm.c     Suravee Suthikulpanit 2016-05-04  1380  
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1381  	svm_vcpu_init_msrpm(vcpu, svm->msrpm);
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1382  
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1383  	svm_init_osvw(vcpu);
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1384  	vcpu->arch.microcode_version = 0x01000065;
938c8745bcf2f7 arch/x86/kvm/svm/svm.c Sean Christopherson   2022-05-24  1385  	svm->tsc_ratio_msr = kvm_caps.default_tsc_scaling_ratio;
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1386  
916b54a7688b0b arch/x86/kvm/svm/svm.c Maxim Levitsky        2023-01-30  1387  	svm->nmi_masked = false;
916b54a7688b0b arch/x86/kvm/svm/svm.c Maxim Levitsky        2023-01-30  1388  	svm->awaiting_iret_completion = false;
916b54a7688b0b arch/x86/kvm/svm/svm.c Maxim Levitsky        2023-01-30  1389  
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1390  	if (sev_es_guest(vcpu->kvm))
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20 @1391  		sev_es_vcpu_reset(svm);
44a95dae1d229a arch/x86/kvm/svm.c     Suravee Suthikulpanit 2016-05-04  1392  }
44a95dae1d229a arch/x86/kvm/svm.c     Suravee Suthikulpanit 2016-05-04  1393  
d28bc9dd25ce02 arch/x86/kvm/svm.c     Nadav Amit            2015-04-13  1394  static void svm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
04d2cc7780d48a drivers/kvm/svm.c      Avi Kivity            2007-09-10  1395  {
04d2cc7780d48a drivers/kvm/svm.c      Avi Kivity            2007-09-10  1396  	struct vcpu_svm *svm = to_svm(vcpu);
04d2cc7780d48a drivers/kvm/svm.c      Avi Kivity            2007-09-10  1397  
b2ac58f90540e3 arch/x86/kvm/svm.c     KarimAllah Ahmed      2018-02-03  1398  	svm->spec_ctrl = 0;
ccbcd2674472a9 arch/x86/kvm/svm.c     Thomas Gleixner       2018-05-09  1399  	svm->virt_spec_ctrl = 0;
b2ac58f90540e3 arch/x86/kvm/svm.c     KarimAllah Ahmed      2018-02-03  1400  
63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini         2021-03-02  1401  	init_vmcb(vcpu);
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1402  
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1403  	if (!init_event)
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1404  		__svm_vcpu_reset(vcpu);
04d2cc7780d48a drivers/kvm/svm.c      Avi Kivity            2007-09-10  1405  }
04d2cc7780d48a drivers/kvm/svm.c      Avi Kivity            2007-09-10  1406  
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1407  void svm_switch_vmcb(struct vcpu_svm *svm, struct kvm_vmcb_info *target_vmcb)
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1408  {
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1409  	svm->current_vmcb = target_vmcb;
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1410  	svm->vmcb = target_vmcb->ptr;
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1411  }
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1412  
23e5092b6e2ad1 arch/x86/kvm/svm/svm.c Sean Christopherson   2022-01-28  1413  static int svm_vcpu_create(struct kvm_vcpu *vcpu)
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1414  {
a2fa3e9f52d875 drivers/kvm/svm.c      Gregory Haskins       2007-07-27  1415  	struct vcpu_svm *svm;
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1416  	struct page *vmcb01_page;
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1417  	struct page *vmsa_page = NULL;
fb3f0f51d92d14 drivers/kvm/svm.c      Rusty Russell         2007-07-27  1418  	int err;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1419  
a9dd6f09d7e54d arch/x86/kvm/svm.c     Sean Christopherson   2019-12-18  1420  	BUILD_BUG_ON(offsetof(struct vcpu_svm, vcpu) != 0);
a9dd6f09d7e54d arch/x86/kvm/svm.c     Sean Christopherson   2019-12-18  1421  	svm = to_svm(vcpu);
fb3f0f51d92d14 drivers/kvm/svm.c      Rusty Russell         2007-07-27  1422  
fb3f0f51d92d14 drivers/kvm/svm.c      Rusty Russell         2007-07-27  1423  	err = -ENOMEM;
75253db41a467a arch/x86/kvm/svm/svm.c Brijesh Singh         2024-01-25  1424  	vmcb01_page = snp_safe_alloc_page(vcpu);
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1425  	if (!vmcb01_page)
987b2594ed5d12 arch/x86/kvm/svm.c     Sean Christopherson   2019-12-18  1426  		goto out;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1427  
63129754178c55 arch/x86/kvm/svm/svm.c Paolo Bonzini         2021-03-02  1428  	if (sev_es_guest(vcpu->kvm)) {
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1429  		/*
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1430  		 * SEV-ES guests require a separate VMSA page used to contain
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1431  		 * the encrypted register state of the guest.
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1432  		 */
75253db41a467a arch/x86/kvm/svm/svm.c Brijesh Singh         2024-01-25  1433  		vmsa_page = snp_safe_alloc_page(vcpu);
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1434  		if (!vmsa_page)
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1435  			goto error_free_vmcb_page;
ed02b213098a90 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1436  
ed02b213098a90 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1437  		/*
ed02b213098a90 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1438  		 * SEV-ES guests maintain an encrypted version of their FPU
ed02b213098a90 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1439  		 * state which is restored and saved on VMRUN and VMEXIT.
d69c1382e1b73a arch/x86/kvm/svm/svm.c Thomas Gleixner       2021-10-22  1440  		 * Mark vcpu->arch.guest_fpu->fpstate as scratch so it won't
d69c1382e1b73a arch/x86/kvm/svm/svm.c Thomas Gleixner       2021-10-22  1441  		 * do xsave/xrstor on it.
ed02b213098a90 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1442  		 */
d69c1382e1b73a arch/x86/kvm/svm/svm.c Thomas Gleixner       2021-10-22  1443  		fpstate_set_confidential(&vcpu->arch.guest_fpu);
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1444  	}
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1445  
dfa20099e26e35 arch/x86/kvm/svm.c     Suravee Suthikulpanit 2017-09-12  1446  	err = avic_init_vcpu(svm);
44a95dae1d229a arch/x86/kvm/svm.c     Suravee Suthikulpanit 2016-05-04  1447  	if (err)
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1448  		goto error_free_vmsa_page;
411b44ba80ab00 arch/x86/kvm/svm.c     Suravee Suthikulpanit 2016-08-23  1449  
476c9bd8e997b4 arch/x86/kvm/svm/svm.c Aaron Lewis           2020-09-25  1450  	svm->msrpm = svm_vcpu_alloc_msrpm();
054409ab253d9f arch/x86/kvm/svm/svm.c Chen Zhou             2020-11-17  1451  	if (!svm->msrpm) {
054409ab253d9f arch/x86/kvm/svm/svm.c Chen Zhou             2020-11-17  1452  		err = -ENOMEM;
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1453  		goto error_free_vmsa_page;
054409ab253d9f arch/x86/kvm/svm/svm.c Chen Zhou             2020-11-17  1454  	}
b286d5d8b0836e arch/x86/kvm/svm.c     Alexander Graf        2008-11-25  1455  
091abbf578f926 arch/x86/kvm/svm/svm.c Maxim Levitsky        2022-05-19  1456  	svm->x2avic_msrs_intercepted = true;
091abbf578f926 arch/x86/kvm/svm/svm.c Maxim Levitsky        2022-05-19  1457  
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1458  	svm->vmcb01.ptr = page_address(vmcb01_page);
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1459  	svm->vmcb01.pa = __sme_set(page_to_pfn(vmcb01_page) << PAGE_SHIFT);
9ebe530b9f5da8 arch/x86/kvm/svm/svm.c Sean Christopherson   2021-09-20  1460  	svm_switch_vmcb(svm, &svm->vmcb01);
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1461  
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1462  	if (vmsa_page)
b67a4cc35c9f72 arch/x86/kvm/svm/svm.c Peter Gonda           2021-10-21  1463  		svm->sev_es.vmsa = page_address(vmsa_page);
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1464  
a7fc06dd2f14f8 arch/x86/kvm/svm/svm.c Michael Roth          2021-02-02  1465  	svm->guest_state_loaded = false;
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1466  
a9dd6f09d7e54d arch/x86/kvm/svm.c     Sean Christopherson   2019-12-18  1467  	return 0;
36241b8c7cbcc8 drivers/kvm/svm.c      Avi Kivity            2006-12-22  1468  
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1469  error_free_vmsa_page:
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1470  	if (vmsa_page)
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1471  		__free_page(vmsa_page);
8d22b90e942c26 arch/x86/kvm/svm/svm.c Maxim Levitsky        2020-08-27  1472  error_free_vmcb_page:
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1473  	__free_page(vmcb01_page);
987b2594ed5d12 arch/x86/kvm/svm.c     Sean Christopherson   2019-12-18  1474  out:
a9dd6f09d7e54d arch/x86/kvm/svm.c     Sean Christopherson   2019-12-18  1475  	return err;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1476  }
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1477  
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1478  static void svm_clear_current_vmcb(struct vmcb *vmcb)
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1479  {
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1480  	int i;
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1481  
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1482  	for_each_online_cpu(i)
73412dfeea724e arch/x86/kvm/svm/svm.c Paolo Bonzini         2022-11-09  1483  		cmpxchg(per_cpu_ptr(&svm_data.current_vmcb, i), vmcb, NULL);
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1484  }
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1485  
23e5092b6e2ad1 arch/x86/kvm/svm/svm.c Sean Christopherson   2022-01-28  1486  static void svm_vcpu_free(struct kvm_vcpu *vcpu)
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1487  {
a2fa3e9f52d875 drivers/kvm/svm.c      Gregory Haskins       2007-07-27  1488  	struct vcpu_svm *svm = to_svm(vcpu);
a2fa3e9f52d875 drivers/kvm/svm.c      Gregory Haskins       2007-07-27  1489  
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1490  	/*
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1491  	 * The vmcb page can be recycled, causing a false negative in
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1492  	 * svm_vcpu_load(). So, ensure that no logical CPU has this
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1493  	 * vmcb page recorded as its current vmcb.
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1494  	 */
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1495  	svm_clear_current_vmcb(svm->vmcb);
fd65d3142f734b arch/x86/kvm/svm.c     Jim Mattson           2018-05-22  1496  
917401f26a6af5 arch/x86/kvm/svm/svm.c Maxim Levitsky        2022-11-03  1497  	svm_leave_nested(vcpu);
2fcf4876ada8a2 arch/x86/kvm/svm/svm.c Maxim Levitsky        2020-10-01  1498  	svm_free_nested(svm);
2fcf4876ada8a2 arch/x86/kvm/svm/svm.c Maxim Levitsky        2020-10-01  1499  
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1500  	sev_free_vcpu(vcpu);
add5e2f0454145 arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1501  
4995a3685f1b76 arch/x86/kvm/svm/svm.c Cathy Avery           2021-01-13  1502  	__free_page(pfn_to_page(__sme_clr(svm->vmcb01.pa) >> PAGE_SHIFT));
47903dc10e7ebb arch/x86/kvm/svm/svm.c Krish Sadhukhan       2021-04-12  1503  	__free_pages(virt_to_page(svm->msrpm), get_order(MSRPM_SIZE));
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1504  }
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1505  
23e5092b6e2ad1 arch/x86/kvm/svm/svm.c Sean Christopherson   2022-01-28  1506  static void svm_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity            2006-12-10  1507  {
a2fa3e9f52d875 drivers/kvm/svm.c      Gregory Haskins       2007-07-27  1508  	struct vcpu_svm *svm = to_svm(vcpu);
73412dfeea724e arch/x86/kvm/svm/svm.c Paolo Bonzini         2022-11-09  1509  	struct svm_cpu_data *sd = per_cpu_ptr(&svm_data, vcpu->cpu);
0cc5064d335543 drivers/kvm/svm.c      Avi Kivity            2007-03-25  1510  
ce7ea0cfdc2e9f arch/x86/kvm/svm/svm.c Tom Lendacky          2021-05-06  1511  	if (sev_es_guest(vcpu->kvm))
ce7ea0cfdc2e9f arch/x86/kvm/svm/svm.c Tom Lendacky          2021-05-06 @1512  		sev_es_unmap_ghcb(svm);
ce7ea0cfdc2e9f arch/x86/kvm/svm/svm.c Tom Lendacky          2021-05-06  1513  
a7fc06dd2f14f8 arch/x86/kvm/svm/svm.c Michael Roth          2021-02-02  1514  	if (svm->guest_state_loaded)
a7fc06dd2f14f8 arch/x86/kvm/svm/svm.c Michael Roth          2021-02-02  1515  		return;
94dfbdb3894eda drivers/kvm/svm.c      Anthony Liguori       2007-04-29  1516  
a7fc06dd2f14f8 arch/x86/kvm/svm/svm.c Michael Roth          2021-02-02  1517  	/*
a7fc06dd2f14f8 arch/x86/kvm/svm/svm.c Michael Roth          2021-02-02  1518  	 * Save additional host state that will be restored on VMEXIT (sev-es)
a7fc06dd2f14f8 arch/x86/kvm/svm/svm.c Michael Roth          2021-02-02  1519  	 * or subsequent vmload of host save area.
a7fc06dd2f14f8 arch/x86/kvm/svm/svm.c Michael Roth          2021-02-02  1520  	 */
e287bd005ad9d8 arch/x86/kvm/svm/svm.c Paolo Bonzini         2022-11-07  1521  	vmsave(sd->save_area_pa);
068f7ea61895ff arch/x86/kvm/svm/svm.c Paolo Bonzini         2022-01-25  1522  	if (sev_es_guest(vcpu->kvm)) {
3dd2775b74c9b1 arch/x86/kvm/svm/svm.c Tom Lendacky          2022-04-05  1523  		struct sev_es_save_area *hostsa;
3dd2775b74c9b1 arch/x86/kvm/svm/svm.c Tom Lendacky          2022-04-05  1524  		hostsa = (struct sev_es_save_area *)(page_address(sd->save_area) + 0x400);
068f7ea61895ff arch/x86/kvm/svm/svm.c Paolo Bonzini         2022-01-25  1525  
23e5092b6e2ad1 arch/x86/kvm/svm/svm.c Sean Christopherson   2022-01-28 @1526  		sev_es_prepare_switch_to_guest(hostsa);
861377730aa9db arch/x86/kvm/svm/svm.c Tom Lendacky          2020-12-10  1527  	}
fbc0db76b77125 arch/x86/kvm/svm.c     Joerg Roedel          2011-03-25  1528  
11d39e8cc43e1c arch/x86/kvm/svm/svm.c Maxim Levitsky        2022-06-06  1529  	if (tsc_scaling)
11d39e8cc43e1c arch/x86/kvm/svm/svm.c Maxim Levitsky        2022-06-06  1530  		__svm_write_tsc_multiplier(vcpu->arch.tsc_scaling_ratio);
a7fc06dd2f14f8 arch/x86/kvm/svm/svm.c Michael Roth          2021-02-02  1531  
916e3e5f26abc1 arch/x86/kvm/svm/svm.c Tom Lendacky          2023-09-15  1532  	/*
916e3e5f26abc1 arch/x86/kvm/svm/svm.c Tom Lendacky          2023-09-15  1533  	 * TSC_AUX is always virtualized for SEV-ES guests when the feature is
916e3e5f26abc1 arch/x86/kvm/svm/svm.c Tom Lendacky          2023-09-15  1534  	 * available. The user return MSR support is not required in this case
916e3e5f26abc1 arch/x86/kvm/svm/svm.c Tom Lendacky          2023-09-15  1535  	 * because TSC_AUX is restored on #VMEXIT from the host save area
916e3e5f26abc1 arch/x86/kvm/svm/svm.c Tom Lendacky          2023-09-15  1536  	 * (which has been initialized in svm_hardware_enable()).
916e3e5f26abc1 arch/x86/kvm/svm/svm.c Tom Lendacky          2023-09-15  1537  	 */
916e3e5f26abc1 arch/x86/kvm/svm/svm.c Tom Lendacky          2023-09-15  1538  	if (likely(tsc_aux_uret_slot >= 0) &&
916e3e5f26abc1 arch/x86/kvm/svm/svm.c Tom Lendacky          2023-09-15  1539  	    (!boot_cpu_has(X86_FEATURE_V_TSC_AUX) || !sev_es_guest(vcpu->kvm)))
0caa0a77c2f6fc arch/x86/kvm/svm/svm.c Sean Christopherson   2021-05-04  1540  		kvm_set_user_return_msr(tsc_aux_uret_slot, svm->tsc_aux, -1ull);
8221c13700561b arch/x86/kvm/svm.c     Suravee Suthikulpanit 2016-05-04  1541  
a7fc06dd2f14f8 arch/x86/kvm/svm/svm.c Michael Roth          2021-02-02  1542  	svm->guest_state_loaded = true;
a7fc06dd2f14f8 arch/x86/kvm/svm/svm.c Michael Roth          2021-02-02  1543  }
a7fc06dd2f14f8 arch/x86/kvm/svm/svm.c Michael Roth          2021-02-02  1544  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

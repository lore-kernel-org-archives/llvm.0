Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908F61FDF
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 06:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650609893; x=1682145893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rxI5yS86OfUwenwozfvmkOH68dTCZLi3frLKi4E0CI8=;
  b=nyUzgBR91lAQ8k3GZAMxDoMwGOtOnWLE20eKRIkhhPOUEdxZL/ompdfn
   1lm2r7RMoLIxBmbzJiSr6QvTXVeij4zpL3Ey0w1iXMRk5oI9WOl7nG2Mg
   c/BmX5r2TuMLeD2gnq1pGq/hrZlMQvtL0lw+Y/wdEakRAOkBngP9nYLaK
   v9r18L8Dh/qbLfhRc4hZcJt5QE+5NGTcxFLIAzPwNY12U3wqHvNC/7T+X
   mYzvxj6+zVsOISVkQsSTJ6J/e5G8haNXiPqI7HkIkk7s3lwqdJZrLPm2z
   hkmdCeHAYp4QKuNusUWx8+yTelfmH8h+SnL5sRDD2CzSRCL4zA3PLSnAn
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264065589"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; 
   d="scan'208";a="264065589"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 23:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; 
   d="scan'208";a="728374073"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Apr 2022 23:44:51 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhn2B-0009KS-9q;
	Fri, 22 Apr 2022 06:44:51 +0000
Date: Fri, 22 Apr 2022 14:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v6 3/3] KVM: VMX: Enable Notify VM exit
Message-ID: <202204221404.yI5kHG0x-lkp@intel.com>
References: <20220421072958.16375-4-chenyi.qiang@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421072958.16375-4-chenyi.qiang@intel.com>

Hi Chenyi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220420]
[cannot apply to kvm/master v5.18-rc3 v5.18-rc2 v5.18-rc1 v5.18-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chenyi-Qiang/Introduce-Notify-VM-exit/20220421-152750
base:    f1244c81da13009dbf61cb807f45881501c44789
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220422/202204221404.yI5kHG0x-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d03a8a0979790428b75ba9438199a7ea2c22e0a6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chenyi-Qiang/Introduce-Notify-VM-exit/20220421-152750
        git checkout d03a8a0979790428b75ba9438199a7ea2c22e0a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:6084:7: error: logical not is only applied to the left hand side of this bitwise operator [-Werror,-Wlogical-not-parentheses]
                   if (!(u32)cap->args[0] & KVM_X86_NOTIFY_VMEXIT_ENABLED)
                       ^                  ~
   arch/x86/kvm/x86.c:6084:7: note: add parentheses after the '!' to evaluate the bitwise operator first
                   if (!(u32)cap->args[0] & KVM_X86_NOTIFY_VMEXIT_ENABLED)
                       ^
                        (                                                )
   arch/x86/kvm/x86.c:6084:7: note: add parentheses around left hand side expression to silence this warning
                   if (!(u32)cap->args[0] & KVM_X86_NOTIFY_VMEXIT_ENABLED)
                       ^
                       (                 )
   1 error generated.


vim +6084 arch/x86/kvm/x86.c

  5924	
  5925	int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
  5926				    struct kvm_enable_cap *cap)
  5927	{
  5928		int r;
  5929	
  5930		if (cap->flags)
  5931			return -EINVAL;
  5932	
  5933		switch (cap->cap) {
  5934		case KVM_CAP_DISABLE_QUIRKS2:
  5935			r = -EINVAL;
  5936			if (cap->args[0] & ~KVM_X86_VALID_QUIRKS)
  5937				break;
  5938			fallthrough;
  5939		case KVM_CAP_DISABLE_QUIRKS:
  5940			kvm->arch.disabled_quirks = cap->args[0];
  5941			r = 0;
  5942			break;
  5943		case KVM_CAP_SPLIT_IRQCHIP: {
  5944			mutex_lock(&kvm->lock);
  5945			r = -EINVAL;
  5946			if (cap->args[0] > MAX_NR_RESERVED_IOAPIC_PINS)
  5947				goto split_irqchip_unlock;
  5948			r = -EEXIST;
  5949			if (irqchip_in_kernel(kvm))
  5950				goto split_irqchip_unlock;
  5951			if (kvm->created_vcpus)
  5952				goto split_irqchip_unlock;
  5953			r = kvm_setup_empty_irq_routing(kvm);
  5954			if (r)
  5955				goto split_irqchip_unlock;
  5956			/* Pairs with irqchip_in_kernel. */
  5957			smp_wmb();
  5958			kvm->arch.irqchip_mode = KVM_IRQCHIP_SPLIT;
  5959			kvm->arch.nr_reserved_ioapic_pins = cap->args[0];
  5960			kvm_clear_apicv_inhibit(kvm, APICV_INHIBIT_REASON_ABSENT);
  5961			r = 0;
  5962	split_irqchip_unlock:
  5963			mutex_unlock(&kvm->lock);
  5964			break;
  5965		}
  5966		case KVM_CAP_X2APIC_API:
  5967			r = -EINVAL;
  5968			if (cap->args[0] & ~KVM_X2APIC_API_VALID_FLAGS)
  5969				break;
  5970	
  5971			if (cap->args[0] & KVM_X2APIC_API_USE_32BIT_IDS)
  5972				kvm->arch.x2apic_format = true;
  5973			if (cap->args[0] & KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK)
  5974				kvm->arch.x2apic_broadcast_quirk_disabled = true;
  5975	
  5976			r = 0;
  5977			break;
  5978		case KVM_CAP_X86_DISABLE_EXITS:
  5979			r = -EINVAL;
  5980			if (cap->args[0] & ~KVM_X86_DISABLE_VALID_EXITS)
  5981				break;
  5982	
  5983			if ((cap->args[0] & KVM_X86_DISABLE_EXITS_MWAIT) &&
  5984				kvm_can_mwait_in_guest())
  5985				kvm->arch.mwait_in_guest = true;
  5986			if (cap->args[0] & KVM_X86_DISABLE_EXITS_HLT)
  5987				kvm->arch.hlt_in_guest = true;
  5988			if (cap->args[0] & KVM_X86_DISABLE_EXITS_PAUSE)
  5989				kvm->arch.pause_in_guest = true;
  5990			if (cap->args[0] & KVM_X86_DISABLE_EXITS_CSTATE)
  5991				kvm->arch.cstate_in_guest = true;
  5992			r = 0;
  5993			break;
  5994		case KVM_CAP_MSR_PLATFORM_INFO:
  5995			kvm->arch.guest_can_read_msr_platform_info = cap->args[0];
  5996			r = 0;
  5997			break;
  5998		case KVM_CAP_EXCEPTION_PAYLOAD:
  5999			kvm->arch.exception_payload_enabled = cap->args[0];
  6000			r = 0;
  6001			break;
  6002		case KVM_CAP_X86_USER_SPACE_MSR:
  6003			kvm->arch.user_space_msr_mask = cap->args[0];
  6004			r = 0;
  6005			break;
  6006		case KVM_CAP_X86_BUS_LOCK_EXIT:
  6007			r = -EINVAL;
  6008			if (cap->args[0] & ~KVM_BUS_LOCK_DETECTION_VALID_MODE)
  6009				break;
  6010	
  6011			if ((cap->args[0] & KVM_BUS_LOCK_DETECTION_OFF) &&
  6012			    (cap->args[0] & KVM_BUS_LOCK_DETECTION_EXIT))
  6013				break;
  6014	
  6015			if (kvm_has_bus_lock_exit &&
  6016			    cap->args[0] & KVM_BUS_LOCK_DETECTION_EXIT)
  6017				kvm->arch.bus_lock_detection_enabled = true;
  6018			r = 0;
  6019			break;
  6020	#ifdef CONFIG_X86_SGX_KVM
  6021		case KVM_CAP_SGX_ATTRIBUTE: {
  6022			unsigned long allowed_attributes = 0;
  6023	
  6024			r = sgx_set_attribute(&allowed_attributes, cap->args[0]);
  6025			if (r)
  6026				break;
  6027	
  6028			/* KVM only supports the PROVISIONKEY privileged attribute. */
  6029			if ((allowed_attributes & SGX_ATTR_PROVISIONKEY) &&
  6030			    !(allowed_attributes & ~SGX_ATTR_PROVISIONKEY))
  6031				kvm->arch.sgx_provisioning_allowed = true;
  6032			else
  6033				r = -EINVAL;
  6034			break;
  6035		}
  6036	#endif
  6037		case KVM_CAP_VM_COPY_ENC_CONTEXT_FROM:
  6038			r = -EINVAL;
  6039			if (!kvm_x86_ops.vm_copy_enc_context_from)
  6040				break;
  6041	
  6042			r = static_call(kvm_x86_vm_copy_enc_context_from)(kvm, cap->args[0]);
  6043			break;
  6044		case KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM:
  6045			r = -EINVAL;
  6046			if (!kvm_x86_ops.vm_move_enc_context_from)
  6047				break;
  6048	
  6049			r = static_call(kvm_x86_vm_move_enc_context_from)(kvm, cap->args[0]);
  6050			break;
  6051		case KVM_CAP_EXIT_HYPERCALL:
  6052			if (cap->args[0] & ~KVM_EXIT_HYPERCALL_VALID_MASK) {
  6053				r = -EINVAL;
  6054				break;
  6055			}
  6056			kvm->arch.hypercall_exit_enabled = cap->args[0];
  6057			r = 0;
  6058			break;
  6059		case KVM_CAP_EXIT_ON_EMULATION_FAILURE:
  6060			r = -EINVAL;
  6061			if (cap->args[0] & ~1)
  6062				break;
  6063			kvm->arch.exit_on_emulation_error = cap->args[0];
  6064			r = 0;
  6065			break;
  6066		case KVM_CAP_PMU_CAPABILITY:
  6067			r = -EINVAL;
  6068			if (!enable_pmu || (cap->args[0] & ~KVM_CAP_PMU_VALID_MASK))
  6069				break;
  6070	
  6071			mutex_lock(&kvm->lock);
  6072			if (!kvm->created_vcpus) {
  6073				kvm->arch.enable_pmu = !(cap->args[0] & KVM_PMU_CAP_DISABLE);
  6074				r = 0;
  6075			}
  6076			mutex_unlock(&kvm->lock);
  6077			break;
  6078		case KVM_CAP_X86_NOTIFY_VMEXIT:
  6079			r = -EINVAL;
  6080			if ((u32)cap->args[0] & ~KVM_X86_NOTIFY_VMEXIT_VALID_BITS)
  6081				break;
  6082			if (!kvm_x86_ops.has_notify_vmexit)
  6083				break;
> 6084			if (!(u32)cap->args[0] & KVM_X86_NOTIFY_VMEXIT_ENABLED)
  6085				break;
  6086			kvm->arch.notify_window = cap->args[0] >> 32;
  6087			kvm->arch.notify_vmexit_flags = (u32)cap->args[0];
  6088			r = 0;
  6089			break;
  6090		default:
  6091			r = -EINVAL;
  6092			break;
  6093		}
  6094		return r;
  6095	}
  6096	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

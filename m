Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6787168
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 07:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639466633; x=1671002633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nyOWjgxaBHie8zN5KgQjW7JZ2zK9B6J6kOyl4z95c6I=;
  b=g7ErpZm0jefQ9NXSWb4FPujzNtDS4JI0mZMsB84PQmv+GGubuAcpQ3m9
   9yTqIWpXM+FYcCbtvA4l89hYolcF7Vw3L0eneo9elBMQb/HhFZ37nJ7h9
   sYanUTuqD1cdIFUHOvMnKOSc1ptboCpBnjDFajf5ggoCKWX5hGnY+PtXV
   Pyi819AG3gKAI4nJCQbjf2Ho6jQIaq3tb0p1pc2EgNQPwqKYtJ7OdzP8K
   kbNOWs058HPgMe+B3Nn1HwZavpv11qH4YwMAaKdcXPT4TuJZaIJ9OKYb8
   lwVEo3UsJ0BPSmDgg2pXK4WrZMEjANpzb//pXzZciENDsmZ33PGVJR80c
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="325191757"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="325191757"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 23:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="464965573"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Dec 2021 23:23:51 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mx2AA-00002I-LY; Tue, 14 Dec 2021 07:23:50 +0000
Date: Tue, 14 Dec 2021 15:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kechen Lu <kechenl@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] KVM: x86: add kvm per-vCPU exits disable capability
Message-ID: <202112141509.dBVwl6Ux-lkp@intel.com>
References: <20211214033227.264714-1-kechenl@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211214033227.264714-1-kechenl@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Kechen,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on kvm/queue]
[also build test WARNING on mst-vhost/linux-next tip/master linux/master linus/master v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kechen-Lu/KVM-x86-add-kvm-per-vCPU-exits-disable-capability/20211214-113446
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
config: i386-buildonly-randconfig-r004-20211213 (https://download.01.org/0day-ci/archive/20211214/202112141509.dBVwl6Ux-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/08f20df47a09e327aee3e73a8d7c77b1ffc01bc0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kechen-Lu/KVM-x86-add-kvm-per-vCPU-exits-disable-capability/20211214-113446
        git checkout 08f20df47a09e327aee3e73a8d7c77b1ffc01bc0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:5775:23: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (cap->args[0] & ~KVM_X86_DISABLE_VALID_EXITS)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:806:12: note: expanded from macro 'KVM_X86_DISABLE_VALID_EXITS'
                                                 KVM_X86_DISABLE_EXITS_PER_VCPU)
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:801:51: note: expanded from macro 'KVM_X86_DISABLE_EXITS_PER_VCPU'
   #define KVM_X86_DISABLE_EXITS_PER_VCPU       (1UL << 63)
                                                     ^  ~~
   arch/x86/kvm/x86.c:5787:23: warning: shift count >= width of type [-Wshift-count-overflow]
                   if ((cap->args[0] & KVM_X86_DISABLE_EXITS_PER_VCPU) &&
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:801:51: note: expanded from macro 'KVM_X86_DISABLE_EXITS_PER_VCPU'
   #define KVM_X86_DISABLE_EXITS_PER_VCPU       (1UL << 63)
                                                     ^  ~~
   arch/x86/kvm/x86.c:2335:19: warning: unused function 'gtod_is_based_on_tsc' [-Wunused-function]
   static inline int gtod_is_based_on_tsc(int mode)
                     ^
   3 warnings generated.


vim +5775 arch/x86/kvm/x86.c

23d43cf998275bc Christoffer Dall    2012-07-24  5724  
e5d83c74a5800c2 Paolo Bonzini       2017-02-16  5725  int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
90de4a1875180f8 Nadav Amit          2015-04-13  5726  			    struct kvm_enable_cap *cap)
90de4a1875180f8 Nadav Amit          2015-04-13  5727  {
90de4a1875180f8 Nadav Amit          2015-04-13  5728  	int r;
90de4a1875180f8 Nadav Amit          2015-04-13  5729  
90de4a1875180f8 Nadav Amit          2015-04-13  5730  	if (cap->flags)
90de4a1875180f8 Nadav Amit          2015-04-13  5731  		return -EINVAL;
90de4a1875180f8 Nadav Amit          2015-04-13  5732  
90de4a1875180f8 Nadav Amit          2015-04-13  5733  	switch (cap->cap) {
90de4a1875180f8 Nadav Amit          2015-04-13  5734  	case KVM_CAP_DISABLE_QUIRKS:
90de4a1875180f8 Nadav Amit          2015-04-13  5735  		kvm->arch.disabled_quirks = cap->args[0];
90de4a1875180f8 Nadav Amit          2015-04-13  5736  		r = 0;
90de4a1875180f8 Nadav Amit          2015-04-13  5737  		break;
49df6397edfc5a8 Steve Rutherford    2015-07-29  5738  	case KVM_CAP_SPLIT_IRQCHIP: {
49df6397edfc5a8 Steve Rutherford    2015-07-29  5739  		mutex_lock(&kvm->lock);
b053b2aef25d007 Steve Rutherford    2015-07-29  5740  		r = -EINVAL;
b053b2aef25d007 Steve Rutherford    2015-07-29  5741  		if (cap->args[0] > MAX_NR_RESERVED_IOAPIC_PINS)
b053b2aef25d007 Steve Rutherford    2015-07-29  5742  			goto split_irqchip_unlock;
49df6397edfc5a8 Steve Rutherford    2015-07-29  5743  		r = -EEXIST;
49df6397edfc5a8 Steve Rutherford    2015-07-29  5744  		if (irqchip_in_kernel(kvm))
49df6397edfc5a8 Steve Rutherford    2015-07-29  5745  			goto split_irqchip_unlock;
557abc40d121358 Paolo Bonzini       2016-06-13  5746  		if (kvm->created_vcpus)
49df6397edfc5a8 Steve Rutherford    2015-07-29  5747  			goto split_irqchip_unlock;
49df6397edfc5a8 Steve Rutherford    2015-07-29  5748  		r = kvm_setup_empty_irq_routing(kvm);
5c0aea0e8d98e38 David Hildenbrand   2017-04-28  5749  		if (r)
49df6397edfc5a8 Steve Rutherford    2015-07-29  5750  			goto split_irqchip_unlock;
49df6397edfc5a8 Steve Rutherford    2015-07-29  5751  		/* Pairs with irqchip_in_kernel. */
49df6397edfc5a8 Steve Rutherford    2015-07-29  5752  		smp_wmb();
49776faf93f8074 Radim Krčmář        2016-12-16  5753  		kvm->arch.irqchip_mode = KVM_IRQCHIP_SPLIT;
b053b2aef25d007 Steve Rutherford    2015-07-29  5754  		kvm->arch.nr_reserved_ioapic_pins = cap->args[0];
ef8b4b7203682cc Paolo Bonzini       2021-11-30  5755  		kvm_request_apicv_update(kvm, true, APICV_INHIBIT_REASON_ABSENT);
49df6397edfc5a8 Steve Rutherford    2015-07-29  5756  		r = 0;
49df6397edfc5a8 Steve Rutherford    2015-07-29  5757  split_irqchip_unlock:
49df6397edfc5a8 Steve Rutherford    2015-07-29  5758  		mutex_unlock(&kvm->lock);
49df6397edfc5a8 Steve Rutherford    2015-07-29  5759  		break;
49df6397edfc5a8 Steve Rutherford    2015-07-29  5760  	}
3713131345fbea2 Radim Krčmář        2016-07-12  5761  	case KVM_CAP_X2APIC_API:
3713131345fbea2 Radim Krčmář        2016-07-12  5762  		r = -EINVAL;
3713131345fbea2 Radim Krčmář        2016-07-12  5763  		if (cap->args[0] & ~KVM_X2APIC_API_VALID_FLAGS)
3713131345fbea2 Radim Krčmář        2016-07-12  5764  			break;
3713131345fbea2 Radim Krčmář        2016-07-12  5765  
3713131345fbea2 Radim Krčmář        2016-07-12  5766  		if (cap->args[0] & KVM_X2APIC_API_USE_32BIT_IDS)
3713131345fbea2 Radim Krčmář        2016-07-12  5767  			kvm->arch.x2apic_format = true;
c519265f2aa348b Radim Krčmář        2016-07-12  5768  		if (cap->args[0] & KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK)
c519265f2aa348b Radim Krčmář        2016-07-12  5769  			kvm->arch.x2apic_broadcast_quirk_disabled = true;
3713131345fbea2 Radim Krčmář        2016-07-12  5770  
3713131345fbea2 Radim Krčmář        2016-07-12  5771  		r = 0;
3713131345fbea2 Radim Krčmář        2016-07-12  5772  		break;
4d5422cea3b61f1 Wanpeng Li          2018-03-12  5773  	case KVM_CAP_X86_DISABLE_EXITS:
4d5422cea3b61f1 Wanpeng Li          2018-03-12  5774  		r = -EINVAL;
4d5422cea3b61f1 Wanpeng Li          2018-03-12 @5775  		if (cap->args[0] & ~KVM_X86_DISABLE_VALID_EXITS)
4d5422cea3b61f1 Wanpeng Li          2018-03-12  5776  			break;
4d5422cea3b61f1 Wanpeng Li          2018-03-12  5777  
4d5422cea3b61f1 Wanpeng Li          2018-03-12  5778  		if ((cap->args[0] & KVM_X86_DISABLE_EXITS_MWAIT) &&
4d5422cea3b61f1 Wanpeng Li          2018-03-12  5779  			kvm_can_mwait_in_guest())
4d5422cea3b61f1 Wanpeng Li          2018-03-12  5780  			kvm->arch.mwait_in_guest = true;
766d3571d8e50d3 Michael S. Tsirkin  2018-06-08  5781  		if (cap->args[0] & KVM_X86_DISABLE_EXITS_HLT)
caa057a2cad647f Wanpeng Li          2018-03-12  5782  			kvm->arch.hlt_in_guest = true;
b31c114b82b2b55 Wanpeng Li          2018-03-12  5783  		if (cap->args[0] & KVM_X86_DISABLE_EXITS_PAUSE)
b31c114b82b2b55 Wanpeng Li          2018-03-12  5784  			kvm->arch.pause_in_guest = true;
b51700632e0e532 Wanpeng Li          2019-05-21  5785  		if (cap->args[0] & KVM_X86_DISABLE_EXITS_CSTATE)
b51700632e0e532 Wanpeng Li          2019-05-21  5786  			kvm->arch.cstate_in_guest = true;
08f20df47a09e32 Kechen Lu           2021-12-13  5787  		if ((cap->args[0] & KVM_X86_DISABLE_EXITS_PER_VCPU) &&
08f20df47a09e32 Kechen Lu           2021-12-13  5788  			cap->args[1])
08f20df47a09e32 Kechen Lu           2021-12-13  5789  			kvm->arch.exits_disable_vcpu_mask = cap->args[1];
4d5422cea3b61f1 Wanpeng Li          2018-03-12  5790  		r = 0;
4d5422cea3b61f1 Wanpeng Li          2018-03-12  5791  		break;
6fbbde9a1969dfb Drew Schmitt        2018-08-20  5792  	case KVM_CAP_MSR_PLATFORM_INFO:
6fbbde9a1969dfb Drew Schmitt        2018-08-20  5793  		kvm->arch.guest_can_read_msr_platform_info = cap->args[0];
6fbbde9a1969dfb Drew Schmitt        2018-08-20  5794  		r = 0;
c4f55198c7c2b87 Jim Mattson         2018-10-16  5795  		break;
c4f55198c7c2b87 Jim Mattson         2018-10-16  5796  	case KVM_CAP_EXCEPTION_PAYLOAD:
c4f55198c7c2b87 Jim Mattson         2018-10-16  5797  		kvm->arch.exception_payload_enabled = cap->args[0];
c4f55198c7c2b87 Jim Mattson         2018-10-16  5798  		r = 0;
6fbbde9a1969dfb Drew Schmitt        2018-08-20  5799  		break;
1ae099540e8c7f1 Alexander Graf      2020-09-25  5800  	case KVM_CAP_X86_USER_SPACE_MSR:
1ae099540e8c7f1 Alexander Graf      2020-09-25  5801  		kvm->arch.user_space_msr_mask = cap->args[0];
1ae099540e8c7f1 Alexander Graf      2020-09-25  5802  		r = 0;
1ae099540e8c7f1 Alexander Graf      2020-09-25  5803  		break;
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5804  	case KVM_CAP_X86_BUS_LOCK_EXIT:
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5805  		r = -EINVAL;
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5806  		if (cap->args[0] & ~KVM_BUS_LOCK_DETECTION_VALID_MODE)
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5807  			break;
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5808  
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5809  		if ((cap->args[0] & KVM_BUS_LOCK_DETECTION_OFF) &&
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5810  		    (cap->args[0] & KVM_BUS_LOCK_DETECTION_EXIT))
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5811  			break;
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5812  
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5813  		if (kvm_has_bus_lock_exit &&
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5814  		    cap->args[0] & KVM_BUS_LOCK_DETECTION_EXIT)
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5815  			kvm->arch.bus_lock_detection_enabled = true;
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5816  		r = 0;
fe6b6bc802b4008 Chenyi Qiang        2020-11-06  5817  		break;
fe7e948837f312d Sean Christopherson 2021-04-12  5818  #ifdef CONFIG_X86_SGX_KVM
fe7e948837f312d Sean Christopherson 2021-04-12  5819  	case KVM_CAP_SGX_ATTRIBUTE: {
fe7e948837f312d Sean Christopherson 2021-04-12  5820  		unsigned long allowed_attributes = 0;
fe7e948837f312d Sean Christopherson 2021-04-12  5821  
fe7e948837f312d Sean Christopherson 2021-04-12  5822  		r = sgx_set_attribute(&allowed_attributes, cap->args[0]);
fe7e948837f312d Sean Christopherson 2021-04-12  5823  		if (r)
fe7e948837f312d Sean Christopherson 2021-04-12  5824  			break;
fe7e948837f312d Sean Christopherson 2021-04-12  5825  
fe7e948837f312d Sean Christopherson 2021-04-12  5826  		/* KVM only supports the PROVISIONKEY privileged attribute. */
fe7e948837f312d Sean Christopherson 2021-04-12  5827  		if ((allowed_attributes & SGX_ATTR_PROVISIONKEY) &&
fe7e948837f312d Sean Christopherson 2021-04-12  5828  		    !(allowed_attributes & ~SGX_ATTR_PROVISIONKEY))
fe7e948837f312d Sean Christopherson 2021-04-12  5829  			kvm->arch.sgx_provisioning_allowed = true;
fe7e948837f312d Sean Christopherson 2021-04-12  5830  		else
fe7e948837f312d Sean Christopherson 2021-04-12  5831  			r = -EINVAL;
fe7e948837f312d Sean Christopherson 2021-04-12  5832  		break;
fe7e948837f312d Sean Christopherson 2021-04-12  5833  	}
fe7e948837f312d Sean Christopherson 2021-04-12  5834  #endif
54526d1fd59338f Nathan Tempelman    2021-04-08  5835  	case KVM_CAP_VM_COPY_ENC_CONTEXT_FROM:
54526d1fd59338f Nathan Tempelman    2021-04-08  5836  		r = -EINVAL;
54526d1fd59338f Nathan Tempelman    2021-04-08  5837  		if (kvm_x86_ops.vm_copy_enc_context_from)
54526d1fd59338f Nathan Tempelman    2021-04-08  5838  			r = kvm_x86_ops.vm_copy_enc_context_from(kvm, cap->args[0]);
54526d1fd59338f Nathan Tempelman    2021-04-08  5839  		return r;
b56639318bb2be6 Peter Gonda         2021-10-21  5840  	case KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM:
b56639318bb2be6 Peter Gonda         2021-10-21  5841  		r = -EINVAL;
b56639318bb2be6 Peter Gonda         2021-10-21  5842  		if (kvm_x86_ops.vm_move_enc_context_from)
b56639318bb2be6 Peter Gonda         2021-10-21  5843  			r = kvm_x86_ops.vm_move_enc_context_from(
b56639318bb2be6 Peter Gonda         2021-10-21  5844  				kvm, cap->args[0]);
b56639318bb2be6 Peter Gonda         2021-10-21  5845  		return r;
0dbb11230437895 Ashish Kalra        2021-06-08  5846  	case KVM_CAP_EXIT_HYPERCALL:
0dbb11230437895 Ashish Kalra        2021-06-08  5847  		if (cap->args[0] & ~KVM_EXIT_HYPERCALL_VALID_MASK) {
0dbb11230437895 Ashish Kalra        2021-06-08  5848  			r = -EINVAL;
0dbb11230437895 Ashish Kalra        2021-06-08  5849  			break;
0dbb11230437895 Ashish Kalra        2021-06-08  5850  		}
0dbb11230437895 Ashish Kalra        2021-06-08  5851  		kvm->arch.hypercall_exit_enabled = cap->args[0];
0dbb11230437895 Ashish Kalra        2021-06-08  5852  		r = 0;
0dbb11230437895 Ashish Kalra        2021-06-08  5853  		break;
19238e75bd8ed8f Aaron Lewis         2021-05-10  5854  	case KVM_CAP_EXIT_ON_EMULATION_FAILURE:
19238e75bd8ed8f Aaron Lewis         2021-05-10  5855  		r = -EINVAL;
19238e75bd8ed8f Aaron Lewis         2021-05-10  5856  		if (cap->args[0] & ~1)
19238e75bd8ed8f Aaron Lewis         2021-05-10  5857  			break;
19238e75bd8ed8f Aaron Lewis         2021-05-10  5858  		kvm->arch.exit_on_emulation_error = cap->args[0];
19238e75bd8ed8f Aaron Lewis         2021-05-10  5859  		r = 0;
19238e75bd8ed8f Aaron Lewis         2021-05-10  5860  		break;
90de4a1875180f8 Nadav Amit          2015-04-13  5861  	default:
90de4a1875180f8 Nadav Amit          2015-04-13  5862  		r = -EINVAL;
90de4a1875180f8 Nadav Amit          2015-04-13  5863  		break;
90de4a1875180f8 Nadav Amit          2015-04-13  5864  	}
90de4a1875180f8 Nadav Amit          2015-04-13  5865  	return r;
90de4a1875180f8 Nadav Amit          2015-04-13  5866  }
90de4a1875180f8 Nadav Amit          2015-04-13  5867  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

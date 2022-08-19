Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12E4697
	for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 17:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660929968; x=1692465968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1XnqIFNf0XejaRves2bY6Pd9CIDYLky/1ju1aow/fIc=;
  b=fY8bCg6VPVSsl4cebtOItfWT7zTj3WIgVf7JiWCInGrPEvYtgULHgVpj
   LvIm82TntZXXl/CqC19/rb1sfve6KKdYwfuUKg9V091ubl4aSK94B1LDj
   2QaNom5NRm2Ha2y3X3fekL7IY171EnCGPzw3kZ0DNAabr7RdeaXC54OSH
   ZZVwixcJS24OdnGb1palCTQK8+WTVmGHmiWX85ZWFEnw6G/ewwYR5kP26
   YjOgu138/xFYBxyEVEv+NSjNgobja2gboGKOExDV22H6AMxlAFMj+/ePU
   vRssyLUcUTMUT14l9Us124H8P0VI434WCNoUPeLpc6JnUAp0MIqXAx/DM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="290630399"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="290630399"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 10:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="676525066"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Aug 2022 10:26:05 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oP5kz-0001fP-0o;
	Fri, 19 Aug 2022 17:26:05 +0000
Date: Sat, 20 Aug 2022 01:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 142/308]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:4969:1: error: unused label
 'arch_vm_ioctl'
Message-ID: <202208200119.bJFiHQWt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Documentation/virt/kvm/api.rst
arch/x86/include/asm/kvm_host.h
arch/x86/kvm/mmu.h
include/linux/kvm_host.h
virt/kvm/kvm_main.c
tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   85c097fdd1667a842a9e75d8f658fc16bd72981a
commit: 28993d4dc822c5ef68219ec9dfb233a4f988a416 [142/308] KVM: Register/unregister the guest private memory regions
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220820/202208200119.bJFiHQWt-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 0ac597f3cacf60479ffd36b03766fa7462dabd78)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/28993d4dc822c5ef68219ec9dfb233a4f988a416
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 28993d4dc822c5ef68219ec9dfb233a4f988a416
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:4969:1: error: unused label 'arch_vm_ioctl' [-Werror,-Wunused-label]
   arch_vm_ioctl:
   ^~~~~~~~~~~~~~
   1 error generated.


vim +/arch_vm_ioctl +4969 arch/x86/kvm/../../../virt/kvm/kvm_main.c

  4745	
  4746	static long kvm_vm_ioctl(struct file *filp,
  4747				   unsigned int ioctl, unsigned long arg)
  4748	{
  4749		struct kvm *kvm = filp->private_data;
  4750		void __user *argp = (void __user *)arg;
  4751		int r;
  4752	
  4753		if (kvm->mm != current->mm || kvm->vm_dead)
  4754			return -EIO;
  4755		switch (ioctl) {
  4756		case KVM_CREATE_VCPU:
  4757			r = kvm_vm_ioctl_create_vcpu(kvm, arg);
  4758			break;
  4759		case KVM_ENABLE_CAP: {
  4760			struct kvm_enable_cap cap;
  4761	
  4762			r = -EFAULT;
  4763			if (copy_from_user(&cap, argp, sizeof(cap)))
  4764				goto out;
  4765			r = kvm_vm_ioctl_enable_cap_generic(kvm, &cap);
  4766			break;
  4767		}
  4768		case KVM_SET_USER_MEMORY_REGION: {
  4769			struct kvm_user_mem_region mem;
  4770			unsigned long size;
  4771			u32 flags;
  4772	
  4773			kvm_sanity_check_user_mem_region_alias();
  4774	
  4775			memset(&mem, 0, sizeof(mem));
  4776	
  4777			r = -EFAULT;
  4778	
  4779			if (get_user(flags,
  4780				(u32 __user *)(argp + offsetof(typeof(mem), flags))))
  4781				goto out;
  4782	
  4783			if (flags & KVM_MEM_PRIVATE) {
  4784				r = -EINVAL;
  4785				goto out;
  4786			}
  4787	
  4788			size = sizeof(struct kvm_userspace_memory_region);
  4789	
  4790			if (copy_from_user(&mem, argp, size))
  4791				goto out;
  4792	
  4793			r = -EINVAL;
  4794			if ((flags ^ mem.flags) & KVM_MEM_PRIVATE)
  4795				goto out;
  4796	
  4797			r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
  4798			break;
  4799		}
  4800	#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
  4801		case KVM_MEMORY_ENCRYPT_REG_REGION:
  4802		case KVM_MEMORY_ENCRYPT_UNREG_REGION: {
  4803			struct kvm_enc_region region;
  4804	
  4805			if (!kvm_arch_private_mem_supported(kvm))
  4806				goto arch_vm_ioctl;
  4807	
  4808			r = -EFAULT;
  4809			if (copy_from_user(&region, argp, sizeof(region)))
  4810				goto out;
  4811	
  4812			r = kvm_vm_ioctl_set_encrypted_region(kvm, ioctl, &region);
  4813			break;
  4814		}
  4815	#endif
  4816		case KVM_GET_DIRTY_LOG: {
  4817			struct kvm_dirty_log log;
  4818	
  4819			r = -EFAULT;
  4820			if (copy_from_user(&log, argp, sizeof(log)))
  4821				goto out;
  4822			r = kvm_vm_ioctl_get_dirty_log(kvm, &log);
  4823			break;
  4824		}
  4825	#ifdef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
  4826		case KVM_CLEAR_DIRTY_LOG: {
  4827			struct kvm_clear_dirty_log log;
  4828	
  4829			r = -EFAULT;
  4830			if (copy_from_user(&log, argp, sizeof(log)))
  4831				goto out;
  4832			r = kvm_vm_ioctl_clear_dirty_log(kvm, &log);
  4833			break;
  4834		}
  4835	#endif
  4836	#ifdef CONFIG_KVM_MMIO
  4837		case KVM_REGISTER_COALESCED_MMIO: {
  4838			struct kvm_coalesced_mmio_zone zone;
  4839	
  4840			r = -EFAULT;
  4841			if (copy_from_user(&zone, argp, sizeof(zone)))
  4842				goto out;
  4843			r = kvm_vm_ioctl_register_coalesced_mmio(kvm, &zone);
  4844			break;
  4845		}
  4846		case KVM_UNREGISTER_COALESCED_MMIO: {
  4847			struct kvm_coalesced_mmio_zone zone;
  4848	
  4849			r = -EFAULT;
  4850			if (copy_from_user(&zone, argp, sizeof(zone)))
  4851				goto out;
  4852			r = kvm_vm_ioctl_unregister_coalesced_mmio(kvm, &zone);
  4853			break;
  4854		}
  4855	#endif
  4856		case KVM_IRQFD: {
  4857			struct kvm_irqfd data;
  4858	
  4859			r = -EFAULT;
  4860			if (copy_from_user(&data, argp, sizeof(data)))
  4861				goto out;
  4862			r = kvm_irqfd(kvm, &data);
  4863			break;
  4864		}
  4865		case KVM_IOEVENTFD: {
  4866			struct kvm_ioeventfd data;
  4867	
  4868			r = -EFAULT;
  4869			if (copy_from_user(&data, argp, sizeof(data)))
  4870				goto out;
  4871			r = kvm_ioeventfd(kvm, &data);
  4872			break;
  4873		}
  4874	#ifdef CONFIG_HAVE_KVM_MSI
  4875		case KVM_SIGNAL_MSI: {
  4876			struct kvm_msi msi;
  4877	
  4878			r = -EFAULT;
  4879			if (copy_from_user(&msi, argp, sizeof(msi)))
  4880				goto out;
  4881			r = kvm_send_userspace_msi(kvm, &msi);
  4882			break;
  4883		}
  4884	#endif
  4885	#ifdef __KVM_HAVE_IRQ_LINE
  4886		case KVM_IRQ_LINE_STATUS:
  4887		case KVM_IRQ_LINE: {
  4888			struct kvm_irq_level irq_event;
  4889	
  4890			r = -EFAULT;
  4891			if (copy_from_user(&irq_event, argp, sizeof(irq_event)))
  4892				goto out;
  4893	
  4894			r = kvm_vm_ioctl_irq_line(kvm, &irq_event,
  4895						ioctl == KVM_IRQ_LINE_STATUS);
  4896			if (r)
  4897				goto out;
  4898	
  4899			r = -EFAULT;
  4900			if (ioctl == KVM_IRQ_LINE_STATUS) {
  4901				if (copy_to_user(argp, &irq_event, sizeof(irq_event)))
  4902					goto out;
  4903			}
  4904	
  4905			r = 0;
  4906			break;
  4907		}
  4908	#endif
  4909	#ifdef CONFIG_HAVE_KVM_IRQ_ROUTING
  4910		case KVM_SET_GSI_ROUTING: {
  4911			struct kvm_irq_routing routing;
  4912			struct kvm_irq_routing __user *urouting;
  4913			struct kvm_irq_routing_entry *entries = NULL;
  4914	
  4915			r = -EFAULT;
  4916			if (copy_from_user(&routing, argp, sizeof(routing)))
  4917				goto out;
  4918			r = -EINVAL;
  4919			if (!kvm_arch_can_set_irq_routing(kvm))
  4920				goto out;
  4921			if (routing.nr > KVM_MAX_IRQ_ROUTES)
  4922				goto out;
  4923			if (routing.flags)
  4924				goto out;
  4925			if (routing.nr) {
  4926				urouting = argp;
  4927				entries = vmemdup_user(urouting->entries,
  4928						       array_size(sizeof(*entries),
  4929								  routing.nr));
  4930				if (IS_ERR(entries)) {
  4931					r = PTR_ERR(entries);
  4932					goto out;
  4933				}
  4934			}
  4935			r = kvm_set_irq_routing(kvm, entries, routing.nr,
  4936						routing.flags);
  4937			kvfree(entries);
  4938			break;
  4939		}
  4940	#endif /* CONFIG_HAVE_KVM_IRQ_ROUTING */
  4941		case KVM_CREATE_DEVICE: {
  4942			struct kvm_create_device cd;
  4943	
  4944			r = -EFAULT;
  4945			if (copy_from_user(&cd, argp, sizeof(cd)))
  4946				goto out;
  4947	
  4948			r = kvm_ioctl_create_device(kvm, &cd);
  4949			if (r)
  4950				goto out;
  4951	
  4952			r = -EFAULT;
  4953			if (copy_to_user(argp, &cd, sizeof(cd)))
  4954				goto out;
  4955	
  4956			r = 0;
  4957			break;
  4958		}
  4959		case KVM_CHECK_EXTENSION:
  4960			r = kvm_vm_ioctl_check_extension_generic(kvm, arg);
  4961			break;
  4962		case KVM_RESET_DIRTY_RINGS:
  4963			r = kvm_vm_ioctl_reset_dirty_pages(kvm);
  4964			break;
  4965		case KVM_GET_STATS_FD:
  4966			r = kvm_vm_ioctl_get_stats_fd(kvm);
  4967			break;
  4968		default:
> 4969	arch_vm_ioctl:
  4970			r = kvm_arch_vm_ioctl(filp, ioctl, arg);
  4971		}
  4972	out:
  4973		return r;
  4974	}
  4975	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D81CAB2;
	Sat,  6 Apr 2024 05:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712383044; cv=none; b=dsb72XkA4atgTGF80qYAZpJ1i6X9bSqU5VkHGmRkdX3jKLcypSj5lcz3PFe7ABu223r99VJilfO02zhEzKRlLsO/WIcE952RJxpfb9XsjwW+ksVPIUbbLCXlvIFX+N3gCNBG07w2Osi71JkKadiAxG+2WYEAL8cy78oYXTQ7pLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712383044; c=relaxed/simple;
	bh=ykUf3BxPa5UK/A+5B/PLroxrRDJR7La54fwQdZGqGXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwaZs1fF8pIIZv/dt5pTaXYR5IKWkbmoSEwGJz1InwWtKAjFDn6ZUnDw/tzn7BMGAW50ArrI+nLJx09yP+emQtVEtiCoY3y70thMiuWuDr31zxFjXUzU04wYDUDbKe8nX8XZoNGaxLLeZ1TWPns44e7K9eX/fnZilzwF6oekmJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEKHFUup; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEKHFUup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712383043; x=1743919043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ykUf3BxPa5UK/A+5B/PLroxrRDJR7La54fwQdZGqGXA=;
  b=fEKHFUup2GSfBlHWrTYwGGgjdQXzMCyYot1DTfhsHYyCunaZC9HQ6kDl
   Jt7LqjuKxgIytt739nkH0azrHBtTorWJVxfdQ97veU5F0OeZUA2lN8T+P
   EJIZkoxRYhol76xSDu+bqjGuKsApec7GtgwzFvFyRDi90vDXhjVJBOP8F
   33Cj/ndLAQbJAImoqKpoVwwwXiThI4XT9dNfjyJeyfYZsCTXDkx4f3Cqb
   6EEq9FYMXq0w7LRckmhvsMUz7tSyYXONC5GNb1FZ4Z0QG4I5IJobehBYG
   kprW9jkTetQPgHCzLqZjNkHVvsT0Gp8uYKW0UGGz5f0qFNqD0HzsHGTSG
   w==;
X-CSE-ConnectionGUID: UVypGr84S1W91lmOPaz+Eg==
X-CSE-MsgGUID: NsFIeX7eSlyz9No8mAF2LA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18339091"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="18339091"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 22:57:22 -0700
X-CSE-ConnectionGUID: Qj+qGe3CTf+CBoAXwOGNlQ==
X-CSE-MsgGUID: PXOtyJauQISyGnoMwXtTCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="24094274"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Apr 2024 22:57:20 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsz3G-0003BE-0B;
	Sat, 06 Apr 2024 05:57:18 +0000
Date: Sat, 6 Apr 2024 13:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/5] kvm: interface for managing pvsched driver
 for guest VMs
Message-ID: <202404061313.q9dpfHGY-lkp@intel.com>
References: <20240403140116.3002809-4-vineeth@bitbyteword.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403140116.3002809-4-vineeth@bitbyteword.org>

Hi Vineeth,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on sysctl/sysctl-next]
[cannot apply to kvm/queue bpf-next/master bpf/master linus/master kvm/linux-next mcgrof/sysctl-next v6.9-rc2 next-20240405]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vineeth-Pillai-Google/pvsched-paravirt-scheduling-framework/20240404-020438
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git sysctl-next
patch link:    https://lore.kernel.org/r/20240403140116.3002809-4-vineeth%40bitbyteword.org
patch subject: [RFC PATCH v2 3/5] kvm: interface for managing pvsched driver for guest VMs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240406/202404061313.q9dpfHGY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061313.q9dpfHGY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061313.q9dpfHGY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:5549:3: error: expected expression
    5549 |                 struct pvsched_vcpu_ops *ops;
         |                 ^
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:5559:3: error: use of undeclared identifier 'ops'
    5559 |                 ops = rcu_dereference(kvm->pvsched_ops);
         |                 ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:5560:7: error: use of undeclared identifier 'ops'
    5560 |                 if (ops)
         |                     ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:5561:30: error: use of undeclared identifier 'ops'
    5561 |                         strncpy(out_ops.ops_name, ops->name, PVSCHED_NAME_MAX);
         |                                                   ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:5577:3: error: use of undeclared identifier 'ops'
    5577 |                 ops = rcu_dereference(kvm->pvsched_ops);
         |                 ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:5578:7: error: use of undeclared identifier 'ops'
    5578 |                 if (ops)
         |                     ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:5579:30: error: use of undeclared identifier 'ops'
    5579 |                         strncpy(out_ops.ops_name, ops->name, PVSCHED_NAME_MAX);
         |                                                   ^
   7 errors generated.


vim +5549 arch/x86/kvm/../../../virt/kvm/kvm_main.c

  5314	
  5315	static long kvm_vm_ioctl(struct file *filp,
  5316				   unsigned int ioctl, unsigned long arg)
  5317	{
  5318		struct kvm *kvm = filp->private_data;
  5319		void __user *argp = (void __user *)arg;
  5320		int r;
  5321	
  5322		if (kvm->mm != current->mm || kvm->vm_dead)
  5323			return -EIO;
  5324		switch (ioctl) {
  5325		case KVM_CREATE_VCPU:
  5326			r = kvm_vm_ioctl_create_vcpu(kvm, arg);
  5327			break;
  5328		case KVM_ENABLE_CAP: {
  5329			struct kvm_enable_cap cap;
  5330	
  5331			r = -EFAULT;
  5332			if (copy_from_user(&cap, argp, sizeof(cap)))
  5333				goto out;
  5334			r = kvm_vm_ioctl_enable_cap_generic(kvm, &cap);
  5335			break;
  5336		}
  5337		case KVM_SET_USER_MEMORY_REGION2:
  5338		case KVM_SET_USER_MEMORY_REGION: {
  5339			struct kvm_userspace_memory_region2 mem;
  5340			unsigned long size;
  5341	
  5342			if (ioctl == KVM_SET_USER_MEMORY_REGION) {
  5343				/*
  5344				 * Fields beyond struct kvm_userspace_memory_region shouldn't be
  5345				 * accessed, but avoid leaking kernel memory in case of a bug.
  5346				 */
  5347				memset(&mem, 0, sizeof(mem));
  5348				size = sizeof(struct kvm_userspace_memory_region);
  5349			} else {
  5350				size = sizeof(struct kvm_userspace_memory_region2);
  5351			}
  5352	
  5353			/* Ensure the common parts of the two structs are identical. */
  5354			SANITY_CHECK_MEM_REGION_FIELD(slot);
  5355			SANITY_CHECK_MEM_REGION_FIELD(flags);
  5356			SANITY_CHECK_MEM_REGION_FIELD(guest_phys_addr);
  5357			SANITY_CHECK_MEM_REGION_FIELD(memory_size);
  5358			SANITY_CHECK_MEM_REGION_FIELD(userspace_addr);
  5359	
  5360			r = -EFAULT;
  5361			if (copy_from_user(&mem, argp, size))
  5362				goto out;
  5363	
  5364			r = -EINVAL;
  5365			if (ioctl == KVM_SET_USER_MEMORY_REGION &&
  5366			    (mem.flags & ~KVM_SET_USER_MEMORY_REGION_V1_FLAGS))
  5367				goto out;
  5368	
  5369			r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
  5370			break;
  5371		}
  5372		case KVM_GET_DIRTY_LOG: {
  5373			struct kvm_dirty_log log;
  5374	
  5375			r = -EFAULT;
  5376			if (copy_from_user(&log, argp, sizeof(log)))
  5377				goto out;
  5378			r = kvm_vm_ioctl_get_dirty_log(kvm, &log);
  5379			break;
  5380		}
  5381	#ifdef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
  5382		case KVM_CLEAR_DIRTY_LOG: {
  5383			struct kvm_clear_dirty_log log;
  5384	
  5385			r = -EFAULT;
  5386			if (copy_from_user(&log, argp, sizeof(log)))
  5387				goto out;
  5388			r = kvm_vm_ioctl_clear_dirty_log(kvm, &log);
  5389			break;
  5390		}
  5391	#endif
  5392	#ifdef CONFIG_KVM_MMIO
  5393		case KVM_REGISTER_COALESCED_MMIO: {
  5394			struct kvm_coalesced_mmio_zone zone;
  5395	
  5396			r = -EFAULT;
  5397			if (copy_from_user(&zone, argp, sizeof(zone)))
  5398				goto out;
  5399			r = kvm_vm_ioctl_register_coalesced_mmio(kvm, &zone);
  5400			break;
  5401		}
  5402		case KVM_UNREGISTER_COALESCED_MMIO: {
  5403			struct kvm_coalesced_mmio_zone zone;
  5404	
  5405			r = -EFAULT;
  5406			if (copy_from_user(&zone, argp, sizeof(zone)))
  5407				goto out;
  5408			r = kvm_vm_ioctl_unregister_coalesced_mmio(kvm, &zone);
  5409			break;
  5410		}
  5411	#endif
  5412		case KVM_IRQFD: {
  5413			struct kvm_irqfd data;
  5414	
  5415			r = -EFAULT;
  5416			if (copy_from_user(&data, argp, sizeof(data)))
  5417				goto out;
  5418			r = kvm_irqfd(kvm, &data);
  5419			break;
  5420		}
  5421		case KVM_IOEVENTFD: {
  5422			struct kvm_ioeventfd data;
  5423	
  5424			r = -EFAULT;
  5425			if (copy_from_user(&data, argp, sizeof(data)))
  5426				goto out;
  5427			r = kvm_ioeventfd(kvm, &data);
  5428			break;
  5429		}
  5430	#ifdef CONFIG_HAVE_KVM_MSI
  5431		case KVM_SIGNAL_MSI: {
  5432			struct kvm_msi msi;
  5433	
  5434			r = -EFAULT;
  5435			if (copy_from_user(&msi, argp, sizeof(msi)))
  5436				goto out;
  5437			r = kvm_send_userspace_msi(kvm, &msi);
  5438			break;
  5439		}
  5440	#endif
  5441	#ifdef __KVM_HAVE_IRQ_LINE
  5442		case KVM_IRQ_LINE_STATUS:
  5443		case KVM_IRQ_LINE: {
  5444			struct kvm_irq_level irq_event;
  5445	
  5446			r = -EFAULT;
  5447			if (copy_from_user(&irq_event, argp, sizeof(irq_event)))
  5448				goto out;
  5449	
  5450			r = kvm_vm_ioctl_irq_line(kvm, &irq_event,
  5451						ioctl == KVM_IRQ_LINE_STATUS);
  5452			if (r)
  5453				goto out;
  5454	
  5455			r = -EFAULT;
  5456			if (ioctl == KVM_IRQ_LINE_STATUS) {
  5457				if (copy_to_user(argp, &irq_event, sizeof(irq_event)))
  5458					goto out;
  5459			}
  5460	
  5461			r = 0;
  5462			break;
  5463		}
  5464	#endif
  5465	#ifdef CONFIG_HAVE_KVM_IRQ_ROUTING
  5466		case KVM_SET_GSI_ROUTING: {
  5467			struct kvm_irq_routing routing;
  5468			struct kvm_irq_routing __user *urouting;
  5469			struct kvm_irq_routing_entry *entries = NULL;
  5470	
  5471			r = -EFAULT;
  5472			if (copy_from_user(&routing, argp, sizeof(routing)))
  5473				goto out;
  5474			r = -EINVAL;
  5475			if (!kvm_arch_can_set_irq_routing(kvm))
  5476				goto out;
  5477			if (routing.nr > KVM_MAX_IRQ_ROUTES)
  5478				goto out;
  5479			if (routing.flags)
  5480				goto out;
  5481			if (routing.nr) {
  5482				urouting = argp;
  5483				entries = vmemdup_array_user(urouting->entries,
  5484							     routing.nr, sizeof(*entries));
  5485				if (IS_ERR(entries)) {
  5486					r = PTR_ERR(entries);
  5487					goto out;
  5488				}
  5489			}
  5490			r = kvm_set_irq_routing(kvm, entries, routing.nr,
  5491						routing.flags);
  5492			kvfree(entries);
  5493			break;
  5494		}
  5495	#endif /* CONFIG_HAVE_KVM_IRQ_ROUTING */
  5496	#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
  5497		case KVM_SET_MEMORY_ATTRIBUTES: {
  5498			struct kvm_memory_attributes attrs;
  5499	
  5500			r = -EFAULT;
  5501			if (copy_from_user(&attrs, argp, sizeof(attrs)))
  5502				goto out;
  5503	
  5504			r = kvm_vm_ioctl_set_mem_attributes(kvm, &attrs);
  5505			break;
  5506		}
  5507	#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
  5508		case KVM_CREATE_DEVICE: {
  5509			struct kvm_create_device cd;
  5510	
  5511			r = -EFAULT;
  5512			if (copy_from_user(&cd, argp, sizeof(cd)))
  5513				goto out;
  5514	
  5515			r = kvm_ioctl_create_device(kvm, &cd);
  5516			if (r)
  5517				goto out;
  5518	
  5519			r = -EFAULT;
  5520			if (copy_to_user(argp, &cd, sizeof(cd)))
  5521				goto out;
  5522	
  5523			r = 0;
  5524			break;
  5525		}
  5526		case KVM_CHECK_EXTENSION:
  5527			r = kvm_vm_ioctl_check_extension_generic(kvm, arg);
  5528			break;
  5529		case KVM_RESET_DIRTY_RINGS:
  5530			r = kvm_vm_ioctl_reset_dirty_pages(kvm);
  5531			break;
  5532		case KVM_GET_STATS_FD:
  5533			r = kvm_vm_ioctl_get_stats_fd(kvm);
  5534			break;
  5535	#ifdef CONFIG_KVM_PRIVATE_MEM
  5536		case KVM_CREATE_GUEST_MEMFD: {
  5537			struct kvm_create_guest_memfd guest_memfd;
  5538	
  5539			r = -EFAULT;
  5540			if (copy_from_user(&guest_memfd, argp, sizeof(guest_memfd)))
  5541				goto out;
  5542	
  5543			r = kvm_gmem_create(kvm, &guest_memfd);
  5544			break;
  5545		}
  5546	#endif
  5547	#ifdef CONFIG_PARAVIRT_SCHED_KVM
  5548		case KVM_REPLACE_PVSCHED_OPS:
> 5549			struct pvsched_vcpu_ops *ops;
  5550			struct kvm_pvsched_ops in_ops, out_ops;
  5551	
  5552			r = -EFAULT;
  5553			if (copy_from_user(&in_ops, argp, sizeof(in_ops)))
  5554				goto out;
  5555	
  5556			out_ops.ops_name[0] = 0;
  5557	
  5558			rcu_read_lock();
> 5559			ops = rcu_dereference(kvm->pvsched_ops);
  5560			if (ops)
  5561				strncpy(out_ops.ops_name, ops->name, PVSCHED_NAME_MAX);
  5562			rcu_read_unlock();
  5563	
  5564			r = kvm_replace_pvsched_ops(kvm, (char *)in_ops.ops_name);
  5565			if (r)
  5566				goto out;
  5567	
  5568			r = -EFAULT;
  5569			if (copy_to_user(argp, &out_ops, sizeof(out_ops)))
  5570				goto out;
  5571	
  5572			r = 0;
  5573			break;
  5574		case KVM_GET_PVSCHED_OPS:
  5575			out_ops.ops_name[0] = 0;
  5576			rcu_read_lock();
  5577			ops = rcu_dereference(kvm->pvsched_ops);
  5578			if (ops)
  5579				strncpy(out_ops.ops_name, ops->name, PVSCHED_NAME_MAX);
  5580			rcu_read_unlock();
  5581	
  5582			r = -EFAULT;
  5583			if (copy_to_user(argp, &out_ops, sizeof(out_ops)))
  5584				goto out;
  5585	
  5586			r = 0;
  5587			break;
  5588	#endif
  5589		default:
  5590			r = kvm_arch_vm_ioctl(filp, ioctl, arg);
  5591		}
  5592	out:
  5593		return r;
  5594	}
  5595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

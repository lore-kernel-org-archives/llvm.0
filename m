Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558F224B254;
	Fri, 10 Jan 2025 22:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736546960; cv=none; b=DjAvE+0D4zFRCCTXU79Q0YouOYqJWi/Uzh/X8G1ZdRHATKCfeWi86W1bLBuVAgIUORVkoysPzHWnoZBZFJlek3n1jN4bxiXYuTfXS86iVW2VYiBpI1sxxsSjarsuQG7V+KX9klvwDs9E9Irp03+PVcsdPyf09intwLytypLmZqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736546960; c=relaxed/simple;
	bh=YQLfvn+e/rELMj78AgAOa0lhccIl+xfazmuDqIDDWyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blCdG919hZOOepr2MhDhtdUKPorVCpnKOXwIwPP2ThT/wZcHMSVVolX5ZWmCZYm1HUa3EQ1NJWHpFCSEc1oWxDCh/vooHPeR1l/6XQQTFY2z1g4fCP8Lg6k+stfjnW6VzQbhrgUY9d3zuZ1w0jL0QgS+mWzh9xOCW0OZsiwUSFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bi4t2mBA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bi4t2mBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736546957; x=1768082957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YQLfvn+e/rELMj78AgAOa0lhccIl+xfazmuDqIDDWyw=;
  b=bi4t2mBAER/wqNtVZ38k4FXEtlbklfFocIx4AzVAyE/iXmZTbwVDZSqq
   KRSkCMRytx7+iKKyuU3/VZ82eg5bHRpvQHEz3mflVhNIOT6dKLwIiLbhc
   A2rw4CqPYXTt1xcjhmCESlyUVThqnKUzSJVMCV9i4vlb25b5MZY5bk1rn
   03h9iUBj2cTW8hecEDIXUxz94sAKDzrnGytNCMAUIbUvacfGNq8SeeOnW
   ejwlCnfmpvXCJ0JPA8DnBYfPpAgQ0Yv0mTGP/W/8LhuyYJFLQe/0KkXR+
   G/PNY33bXfeHkkEty7rBiUEdOTAmhBK53eEKtcHiS6Mrk4GgkY1ETEn9p
   g==;
X-CSE-ConnectionGUID: u9GZypqWTuqPYHgIdEe6fg==
X-CSE-MsgGUID: Yw/YWOBOTXCjXaEEtnmAWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47847474"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="47847474"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 14:09:16 -0800
X-CSE-ConnectionGUID: Yb28G6HJTx6i8uvpEllBxQ==
X-CSE-MsgGUID: HhnVeRdtR22+VKJouCjm6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141146539"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jan 2025 14:09:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWNBp-000Jnz-15;
	Fri, 10 Jan 2025 22:09:13 +0000
Date: Sat, 11 Jan 2025 06:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V3] drm/xe/guc: Use exec queue hints for GT frequency
Message-ID: <202501110509.PVFzn2GY-lkp@intel.com>
References: <20250110144146.3063366-1-tejas.upadhyay@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110144146.3063366-1-tejas.upadhyay@intel.com>

Hi Tejas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-tip/drm-tip linus/master v6.13-rc6 next-20250110]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tejas-Upadhyay/drm-xe-guc-Use-exec-queue-hints-for-GT-frequency/20250110-223743
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250110144146.3063366-1-tejas.upadhyay%40intel.com
patch subject: [RFC PATCH V3] drm/xe/guc: Use exec queue hints for GT frequency
config: riscv-randconfig-001-20250111 (https://download.01.org/0day-ci/archive/20250111/202501110509.PVFzn2GY-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110509.PVFzn2GY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110509.PVFzn2GY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_exec_queue.c:576:3: warning: variable 'flags' is uninitialized when used here [-Wuninitialized]
     576 |                 flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
         |                 ^~~~~
   drivers/gpu/drm/xe/xe_exec_queue.c:547:21: note: initialize the variable 'flags' to silence this warning
     547 |         unsigned long flags;
         |                            ^
         |                             = 0
   1 warning generated.


vim +/flags +576 drivers/gpu/drm/xe/xe_exec_queue.c

   536	
   537	int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
   538				       struct drm_file *file)
   539	{
   540		struct xe_device *xe = to_xe_device(dev);
   541		struct xe_file *xef = to_xe_file(file);
   542		struct drm_xe_exec_queue_create *args = data;
   543		struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
   544		struct drm_xe_engine_class_instance __user *user_eci =
   545			u64_to_user_ptr(args->instances);
   546		struct xe_hw_engine *hwe;
   547		unsigned long flags;
   548		struct xe_vm *vm;
   549		struct xe_gt *gt;
   550		struct xe_tile *tile;
   551		struct xe_exec_queue *q = NULL;
   552		u32 logical_mask;
   553		u32 id;
   554		u32 len;
   555		int err;
   556	
   557		if (XE_IOCTL_DBG(xe, args->flags &&
   558				 !(args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)) ||
   559		    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
   560			return -EINVAL;
   561	
   562		len = args->width * args->num_placements;
   563		if (XE_IOCTL_DBG(xe, !len || len > XE_HW_ENGINE_MAX_INSTANCE))
   564			return -EINVAL;
   565	
   566		err = __copy_from_user(eci, user_eci,
   567				       sizeof(struct drm_xe_engine_class_instance) *
   568				       len);
   569		if (XE_IOCTL_DBG(xe, err))
   570			return -EFAULT;
   571	
   572		if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
   573			return -EINVAL;
   574	
   575		if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
 > 576			flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
   577	
   578		if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
   579			if (XE_IOCTL_DBG(xe, args->width != 1) ||
   580			    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
   581			    XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
   582				return -EINVAL;
   583	
   584			for_each_tile(tile, xe, id) {
   585				struct xe_exec_queue *new;
   586	
   587				flags |= EXEC_QUEUE_FLAG_VM;
   588				if (id)
   589					flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
   590	
   591				new = xe_exec_queue_create_bind(xe, tile, flags,
   592								args->extensions);
   593				if (IS_ERR(new)) {
   594					err = PTR_ERR(new);
   595					if (q)
   596						goto put_exec_queue;
   597					return err;
   598				}
   599				if (id == 0)
   600					q = new;
   601				else
   602					list_add_tail(&new->multi_gt_list,
   603						      &q->multi_gt_link);
   604			}
   605		} else {
   606			gt = xe_device_get_gt(xe, eci[0].gt_id);
   607			logical_mask = calc_validate_logical_mask(xe, gt, eci,
   608								  args->width,
   609								  args->num_placements);
   610			if (XE_IOCTL_DBG(xe, !logical_mask))
   611				return -EINVAL;
   612	
   613			hwe = xe_hw_engine_lookup(xe, eci[0]);
   614			if (XE_IOCTL_DBG(xe, !hwe))
   615				return -EINVAL;
   616	
   617			vm = xe_vm_lookup(xef, args->vm_id);
   618			if (XE_IOCTL_DBG(xe, !vm))
   619				return -ENOENT;
   620	
   621			err = down_read_interruptible(&vm->lock);
   622			if (err) {
   623				xe_vm_put(vm);
   624				return err;
   625			}
   626	
   627			if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
   628				up_read(&vm->lock);
   629				xe_vm_put(vm);
   630				return -ENOENT;
   631			}
   632	
   633			q = xe_exec_queue_create(xe, vm, logical_mask,
   634						 args->width, hwe, flags,
   635						 args->extensions);
   636			up_read(&vm->lock);
   637			xe_vm_put(vm);
   638			if (IS_ERR(q))
   639				return PTR_ERR(q);
   640	
   641			if (xe_vm_in_preempt_fence_mode(vm)) {
   642				q->lr.context = dma_fence_context_alloc(1);
   643	
   644				err = xe_vm_add_compute_exec_queue(vm, q);
   645				if (XE_IOCTL_DBG(xe, err))
   646					goto put_exec_queue;
   647			}
   648	
   649			if (q->vm && q->hwe->hw_engine_group) {
   650				err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
   651				if (err)
   652					goto put_exec_queue;
   653			}
   654		}
   655	
   656		q->xef = xe_file_get(xef);
   657	
   658		/* user id alloc must always be last in ioctl to prevent UAF */
   659		err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
   660		if (err)
   661			goto kill_exec_queue;
   662	
   663		args->exec_queue_id = id;
   664	
   665		return 0;
   666	
   667	kill_exec_queue:
   668		xe_exec_queue_kill(q);
   669	put_exec_queue:
   670		xe_exec_queue_put(q);
   671		return err;
   672	}
   673	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

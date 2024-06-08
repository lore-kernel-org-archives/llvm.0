Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991E281E;
	Sat,  8 Jun 2024 00:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717807021; cv=none; b=F0i3AW8H9B95vTK76oZuC7zg5Het9BTbhxCRApKHCDajNo8iB+ujXMKwD62jYL6/rscvBL93UsxPTu2uwfrbMxeS4JPrxRD8iq0qEq2QiBJawCXPsQf7BHfgcUdUSNOWASy3UL19MqRYrt30icq8B4EP2IzmUvHeca+8W/lbRlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717807021; c=relaxed/simple;
	bh=4TVl3/W8Bs7GE+ZjnU7KKaGwODpaBriK/Vy8m8LnVH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6lu3q1ChjdvmEbn1G4RbUCkj2OKGwQkH19GAWxau5MRXvUSjUWxQOqu3XJBze9Runt4hwZ+Njow+MMfMpfDRqGAHyvXi0x9dTMw4qD6jjkg8iyODFGj0PsndmeF3avBinIEhhgd8Gfso7D0K9UmfklmypndxDrRl4c1pZNQqq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuWcDoib; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuWcDoib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717807019; x=1749343019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4TVl3/W8Bs7GE+ZjnU7KKaGwODpaBriK/Vy8m8LnVH8=;
  b=YuWcDoibHB6aMJyI2NBN0DOAbD8hdl2SYW3Xs1LSgwWi18iz2EtbDwLz
   9foSwGApmgx15FaTrcBxwjOpP1ydMKuGVDUCWpMZIqoAnk+aK/IPlWXhf
   eypb2OoYN8T2+nEGUGFTFcw383TWWuyn2Xpf2TMdFye+ykvDG9va7utrd
   uGmiqluSrBRgYM0UIZ3peivle/vrmmqbQ1p1JkdS6dCQ8mKmnr+vHZln5
   M4zP/wMlRrq2REsNFse8wZiClwWB1RS8xvr9a1BcYrokJK8cuK8le7YEX
   Y5BZcdoo4+eMJbcQ7wpOZyNqCZi5/kI7gRbmt9CfT2ud2QXvt5jgG4ZDI
   A==;
X-CSE-ConnectionGUID: HivYe7YxSReQA3cU6e2ZtA==
X-CSE-MsgGUID: jquW9fBXTp2+h4iPKsMYeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14682603"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14682603"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 17:36:58 -0700
X-CSE-ConnectionGUID: cz/fKR/cRVuKvaHJaU7yqg==
X-CSE-MsgGUID: k+Lrm3RWTC2j/8SY683HIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38926071"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jun 2024 17:36:55 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFk4i-0000lU-0o;
	Sat, 08 Jun 2024 00:36:52 +0000
Date: Sat, 8 Jun 2024 08:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	ltuikov89@gmail.com, matthew.brost@intel.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
	rostedt@goodmis.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v3 1/4] drm/sched: store the drm_device instead of the
 device
Message-ID: <202406080802.ExIh6NC2-lkp@intel.com>
References: <20240606130629.214827-2-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606130629.214827-2-pierre-eric.pelloux-prayer@amd.com>

Hi Pierre-Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc2 next-20240607]
[cannot apply to drm-xe/drm-xe-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-sched-store-the-drm_device-instead-of-the-device/20240606-211050
base:   linus/master
patch link:    https://lore.kernel.org/r/20240606130629.214827-2-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH v3 1/4] drm/sched: store the drm_device instead of the device
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240608/202406080802.ExIh6NC2-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080802.ExIh6NC2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080802.ExIh6NC2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/imagination/pvr_queue.c:8:
   In file included from drivers/gpu/drm/imagination/pvr_context.h:17:
   In file included from drivers/gpu/drm/imagination/pvr_device.h:9:
   In file included from drivers/gpu/drm/imagination/pvr_fw.h:8:
   In file included from drivers/gpu/drm/imagination/pvr_fw_trace.h:7:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/imagination/pvr_queue.c:807:10: error: incompatible pointer types passing 'struct drm_device *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
     807 |         dev_err(sched->dev, "Job timeout\n");
         |                 ^~~~~~~~~~
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                   ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/linux/dev_printk.h:50:36: note: passing argument to parameter 'dev' here
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |                                    ^
   6 errors generated.


vim +807 drivers/gpu/drm/imagination/pvr_queue.c

eaf01ee5ba28b9 Sarah Walker 2023-11-22  787  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  788  /**
eaf01ee5ba28b9 Sarah Walker 2023-11-22  789   * pvr_queue_timedout_job() - Handle a job timeout event.
eaf01ee5ba28b9 Sarah Walker 2023-11-22  790   * @s_job: The job this timeout occurred on.
eaf01ee5ba28b9 Sarah Walker 2023-11-22  791   *
eaf01ee5ba28b9 Sarah Walker 2023-11-22  792   * FIXME: We don't do anything here to unblock the situation, we just stop+start
eaf01ee5ba28b9 Sarah Walker 2023-11-22  793   * the scheduler, and re-assign parent fences in the middle.
eaf01ee5ba28b9 Sarah Walker 2023-11-22  794   *
eaf01ee5ba28b9 Sarah Walker 2023-11-22  795   * Return:
eaf01ee5ba28b9 Sarah Walker 2023-11-22  796   *  * DRM_GPU_SCHED_STAT_NOMINAL.
eaf01ee5ba28b9 Sarah Walker 2023-11-22  797   */
eaf01ee5ba28b9 Sarah Walker 2023-11-22  798  static enum drm_gpu_sched_stat
eaf01ee5ba28b9 Sarah Walker 2023-11-22  799  pvr_queue_timedout_job(struct drm_sched_job *s_job)
eaf01ee5ba28b9 Sarah Walker 2023-11-22  800  {
eaf01ee5ba28b9 Sarah Walker 2023-11-22  801  	struct drm_gpu_scheduler *sched = s_job->sched;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  802  	struct pvr_queue *queue = container_of(sched, struct pvr_queue, scheduler);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  803  	struct pvr_device *pvr_dev = queue->ctx->pvr_dev;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  804  	struct pvr_job *job;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  805  	u32 job_count = 0;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  806  
eaf01ee5ba28b9 Sarah Walker 2023-11-22 @807  	dev_err(sched->dev, "Job timeout\n");
eaf01ee5ba28b9 Sarah Walker 2023-11-22  808  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  809  	/* Before we stop the scheduler, make sure the queue is out of any list, so
eaf01ee5ba28b9 Sarah Walker 2023-11-22  810  	 * any call to pvr_queue_update_active_state_locked() that might happen
eaf01ee5ba28b9 Sarah Walker 2023-11-22  811  	 * until the scheduler is really stopped doesn't end up re-inserting the
eaf01ee5ba28b9 Sarah Walker 2023-11-22  812  	 * queue in the active list. This would cause
eaf01ee5ba28b9 Sarah Walker 2023-11-22  813  	 * pvr_queue_signal_done_fences() and drm_sched_stop() to race with each
eaf01ee5ba28b9 Sarah Walker 2023-11-22  814  	 * other when accessing the pending_list, since drm_sched_stop() doesn't
eaf01ee5ba28b9 Sarah Walker 2023-11-22  815  	 * grab the job_list_lock when modifying the list (it's assuming the
eaf01ee5ba28b9 Sarah Walker 2023-11-22  816  	 * only other accessor is the scheduler, and it's safe to not grab the
eaf01ee5ba28b9 Sarah Walker 2023-11-22  817  	 * lock since it's stopped).
eaf01ee5ba28b9 Sarah Walker 2023-11-22  818  	 */
eaf01ee5ba28b9 Sarah Walker 2023-11-22  819  	mutex_lock(&pvr_dev->queues.lock);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  820  	list_del_init(&queue->node);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  821  	mutex_unlock(&pvr_dev->queues.lock);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  822  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  823  	drm_sched_stop(sched, s_job);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  824  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  825  	/* Re-assign job parent fences. */
eaf01ee5ba28b9 Sarah Walker 2023-11-22  826  	list_for_each_entry(job, &sched->pending_list, base.list) {
eaf01ee5ba28b9 Sarah Walker 2023-11-22  827  		job->base.s_fence->parent = dma_fence_get(job->done_fence);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  828  		job_count++;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  829  	}
eaf01ee5ba28b9 Sarah Walker 2023-11-22  830  	WARN_ON(atomic_read(&queue->in_flight_job_count) != job_count);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  831  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  832  	/* Re-insert the queue in the proper list, and kick a queue processing
eaf01ee5ba28b9 Sarah Walker 2023-11-22  833  	 * operation if there were jobs pending.
eaf01ee5ba28b9 Sarah Walker 2023-11-22  834  	 */
eaf01ee5ba28b9 Sarah Walker 2023-11-22  835  	mutex_lock(&pvr_dev->queues.lock);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  836  	if (!job_count) {
eaf01ee5ba28b9 Sarah Walker 2023-11-22  837  		list_move_tail(&queue->node, &pvr_dev->queues.idle);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  838  	} else {
eaf01ee5ba28b9 Sarah Walker 2023-11-22  839  		atomic_set(&queue->in_flight_job_count, job_count);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  840  		list_move_tail(&queue->node, &pvr_dev->queues.active);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  841  		pvr_queue_process(queue);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  842  	}
eaf01ee5ba28b9 Sarah Walker 2023-11-22  843  	mutex_unlock(&pvr_dev->queues.lock);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  844  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  845  	drm_sched_start(sched, true);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  846  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  847  	return DRM_GPU_SCHED_STAT_NOMINAL;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  848  }
eaf01ee5ba28b9 Sarah Walker 2023-11-22  849  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

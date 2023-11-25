Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCFF38E;
	Sat, 25 Nov 2023 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+9xSsi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700871584; x=1732407584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8pe+O+7uRAbBNCrnPvIGyRcxlZ2QP1fQ7Btq3XuCu1k=;
  b=B+9xSsi1JyUxh/vftGUwiTDdfQZBoGkW0Rl3AFSi0Z+SLzQfljqdgcUB
   AD8Yb//q3juEidchU0TToNoJU2/rs9RzQPDCCACjYVX/vAb5bK5fP5Q6Y
   VjibLiWD4WGAeZo92znTQOhIAQrj/FOFRWrWdKI5pBUmUO0roVX8GgNjU
   g5bOZT+Khcx/uQrOM4Wu2nnSmX+87CwGQUfOMTZkZ/o4NvmsmDgqc/j7E
   tO2lgBq4oTbXNkLUG6hsI2ffRxgPWfiFuzdJ6NTAAIFFGIAPKXPCvwyrd
   AL281vfwMOY8quGIqI2FknuMNPpGMRKwDyXloxMtfnjl9rweuqk8WV+XY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391350881"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="391350881"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 16:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911558726"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="911558726"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 16:19:38 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6gOW-0003Qh-1q;
	Sat, 25 Nov 2023 00:19:36 +0000
Date: Sat, 25 Nov 2023 08:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: Donald Robson <donald.robson@imgtec.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 17/20] drm/imagination: Implement job submission and
 scheduling
Message-ID: <202311250632.giVEx7MU-lkp@intel.com>
References: <c98dab7a5f5fb891fbed7e4990d19b5d13964365.1700668843.git.donald.robson@imgtec.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c98dab7a5f5fb891fbed7e4990d19b5d13964365.1700668843.git.donald.robson@imgtec.com>

Hi Donald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.7-rc2]
[cannot apply to drm/drm-next drm-tip/drm-tip next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donald-Robson/drm-gpuvm-Helper-to-get-range-of-unmap-from-a-remap-op/20231123-013514
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/c98dab7a5f5fb891fbed7e4990d19b5d13964365.1700668843.git.donald.robson%40imgtec.com
patch subject: [PATCH v9 17/20] drm/imagination: Implement job submission and scheduling
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311250632.giVEx7MU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250632.giVEx7MU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250632.giVEx7MU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imagination/pvr_device.c:129:6: warning: no previous prototype for function 'pvr_device_process_active_queues' [-Wmissing-prototypes]
     129 | void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
         |      ^
   drivers/gpu/drm/imagination/pvr_device.c:129:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     129 | void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
         | ^
         | static 
   1 warning generated.
--
>> drivers/gpu/drm/imagination/pvr_job.c:395: warning: Function parameter or member 'pvr_file' not described in 'prepare_job_syncs_for_each'
>> drivers/gpu/drm/imagination/pvr_job.c:395: warning: Excess function parameter 'file' description in 'prepare_job_syncs_for_each'
>> drivers/gpu/drm/imagination/pvr_job.c:714: warning: Excess function parameter 'job_count' description in 'pvr_submit_jobs'


vim +/pvr_device_process_active_queues +129 drivers/gpu/drm/imagination/pvr_device.c

   121	
   122	/**
   123	 * pvr_device_process_active_queues() - Process all queue related events.
   124	 * @pvr_dev: PowerVR device to check
   125	 *
   126	 * This is called any time we receive a FW event. It iterates over all
   127	 * active queues and calls pvr_queue_process() on them.
   128	 */
 > 129	void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
   130	{
   131		struct pvr_queue *queue, *tmp_queue;
   132		LIST_HEAD(active_queues);
   133	
   134		mutex_lock(&pvr_dev->queues.lock);
   135	
   136		/* Move all active queues to a temporary list. Queues that remain
   137		 * active after we're done processing them are re-inserted to
   138		 * the queues.active list by pvr_queue_process().
   139		 */
   140		list_splice_init(&pvr_dev->queues.active, &active_queues);
   141	
   142		list_for_each_entry_safe(queue, tmp_queue, &active_queues, node)
   143			pvr_queue_process(queue);
   144	
   145		mutex_unlock(&pvr_dev->queues.lock);
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

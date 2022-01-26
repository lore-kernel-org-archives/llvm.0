Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078662CA3
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 20:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643227457; x=1674763457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RugwAQt7UjorKOPqJPVeO2qvaiPk0mbSrBiEs0kHBoc=;
  b=LLpoKrQwd+l3nG9Sr3suD3chTm2Cvt9pnh/Cp5kjjiqHXTbAMsXOE9OO
   atCvtegiPxhD8NtvtLtapDeQG46uAhHPnjsvQWdTH2+YYGZDNpWdmKTCy
   7ss7N3wNvbYUjQYJt2Weh2mWuojC45nLQKRsEaAEZximeweXHoZpSl/wY
   J3reJ247wPZ08EqSPw0PL5Jl0YEEGpIPQDZ41B3GRxeFWBRD17mUrGlLw
   yYe/wKGeDtEE7hAAVN5/V0NBHGKfRpPU6UsJvshah2nZJ8cOfTP0O+/VP
   vq5QJkSSgVt42UCekwh4BKS0RqlBRi0AL6xjwqz3+Gm7nnhe0FFiPo79/
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="307354938"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="307354938"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 12:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; 
   d="scan'208";a="628416968"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Jan 2022 12:04:15 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCoWd-000LbW-1I; Wed, 26 Jan 2022 20:04:15 +0000
Date: Thu, 27 Jan 2022 04:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 18/20] drm/i915/uapi: forbid ALLOC_TOPDOWN
 for error capture
Message-ID: <202201270346.FZrPMvZl-lkp@intel.com>
References: <20220126152155.3070602-19-matthew.auld@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126152155.3070602-19-matthew.auld@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Matthew,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next drm/drm-next v5.17-rc1 next-20220125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matthew-Auld/Initial-support-for-small-BAR-recovery/20220126-232640
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a013-20220124 (https://download.01.org/0day-ci/archive/20220127/202201270346.FZrPMvZl-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/33b0a9f1f9810bd16cef89ce1e5787751583661e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matthew-Auld/Initial-support-for-small-BAR-recovery/20220126-232640
        git checkout 33b0a9f1f9810bd16cef89ce1e5787751583661e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3426:6: error: assigning to 'int' from incompatible type 'void'
           err = eb_capture_stage(&eb);
               ^ ~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +3426 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c

  3381	
  3382		if (args->flags & I915_EXEC_FENCE_OUT) {
  3383			out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
  3384			if (out_fence_fd < 0) {
  3385				err = out_fence_fd;
  3386				goto err_in_fence;
  3387			}
  3388		}
  3389	
  3390		err = eb_create(&eb);
  3391		if (err)
  3392			goto err_out_fence;
  3393	
  3394		GEM_BUG_ON(!eb.lut_size);
  3395	
  3396		err = eb_select_context(&eb);
  3397		if (unlikely(err))
  3398			goto err_destroy;
  3399	
  3400		err = eb_select_engine(&eb);
  3401		if (unlikely(err))
  3402			goto err_context;
  3403	
  3404		err = eb_lookup_vmas(&eb);
  3405		if (err) {
  3406			eb_release_vmas(&eb, true);
  3407			goto err_engine;
  3408		}
  3409	
  3410		i915_gem_ww_ctx_init(&eb.ww, true);
  3411	
  3412		err = eb_relocate_parse(&eb);
  3413		if (err) {
  3414			/*
  3415			 * If the user expects the execobject.offset and
  3416			 * reloc.presumed_offset to be an exact match,
  3417			 * as for using NO_RELOC, then we cannot update
  3418			 * the execobject.offset until we have completed
  3419			 * relocation.
  3420			 */
  3421			args->flags &= ~__EXEC_HAS_RELOC;
  3422			goto err_vma;
  3423		}
  3424	
  3425		ww_acquire_done(&eb.ww.ctx);
> 3426		err = eb_capture_stage(&eb);
  3427		if (err)
  3428			goto err_vma;
  3429	
  3430		out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
  3431		if (IS_ERR(out_fence)) {
  3432			err = PTR_ERR(out_fence);
  3433			out_fence = NULL;
  3434			if (eb.requests[0])
  3435				goto err_request;
  3436			else
  3437				goto err_vma;
  3438		}
  3439	
  3440		err = eb_submit(&eb);
  3441	
  3442	err_request:
  3443		eb_requests_get(&eb);
  3444		err = eb_requests_add(&eb, err);
  3445	
  3446		if (eb.fences)
  3447			signal_fence_array(&eb, eb.composite_fence ?
  3448					   eb.composite_fence :
  3449					   &eb.requests[0]->fence);
  3450	
  3451		if (out_fence) {
  3452			if (err == 0) {
  3453				fd_install(out_fence_fd, out_fence->file);
  3454				args->rsvd2 &= GENMASK_ULL(31, 0); /* keep in-fence */
  3455				args->rsvd2 |= (u64)out_fence_fd << 32;
  3456				out_fence_fd = -1;
  3457			} else {
  3458				fput(out_fence->file);
  3459			}
  3460		}
  3461	
  3462		if (unlikely(eb.gem_context->syncobj)) {
  3463			drm_syncobj_replace_fence(eb.gem_context->syncobj,
  3464						  eb.composite_fence ?
  3465						  eb.composite_fence :
  3466						  &eb.requests[0]->fence);
  3467		}
  3468	
  3469		if (!out_fence && eb.composite_fence)
  3470			dma_fence_put(eb.composite_fence);
  3471	
  3472		eb_requests_put(&eb);
  3473	
  3474	err_vma:
  3475		eb_release_vmas(&eb, true);
  3476		WARN_ON(err == -EDEADLK);
  3477		i915_gem_ww_ctx_fini(&eb.ww);
  3478	
  3479		if (eb.batch_pool)
  3480			intel_gt_buffer_pool_put(eb.batch_pool);
  3481	err_engine:
  3482		eb_put_engine(&eb);
  3483	err_context:
  3484		i915_gem_context_put(eb.gem_context);
  3485	err_destroy:
  3486		eb_destroy(&eb);
  3487	err_out_fence:
  3488		if (out_fence_fd != -1)
  3489			put_unused_fd(out_fence_fd);
  3490	err_in_fence:
  3491		dma_fence_put(in_fence);
  3492	err_ext:
  3493		put_fence_array(eb.fences, eb.num_fences);
  3494		return err;
  3495	}
  3496	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

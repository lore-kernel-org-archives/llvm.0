Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68214154AC;
	Fri, 23 Jun 2023 21:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687556549; x=1719092549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a+4lEskqVhwadWcMhtuHPvVwUEVEbTSuP9GZMSUKTKs=;
  b=Qd+ZPvo0YGroKhA/ewaAKxxY7KsNczaiJnARhkrIIBPjAkrL9Pna2wyv
   P36PX76woT0c+3ANJ/4EVdiKb3w1z9/8ZDfxwV2+ShQ7vc1UYWE+5Zxyk
   Z1E5cGP8VcO1OcF5E+I/oU8j1a9Shc61xiIytqEAqJR861QBXy/qV9sg8
   E/6UmpHHaCcQJx+MaftYn3U7ijdnkZz0ZdHVTgos9ur1b6g13YiH+b4U3
   lhRLo/357uCj2StFtWnhTcnlWMMe+QKXLnk74GgWtxCZRV/PdMoeHL39j
   TPeBajWJ65Vv4uBBfJGBKE89V1HGPXV/gs47tT4D2fU50otHv5HOgA8Bn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="358358831"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="358358831"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 14:42:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="745131232"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="745131232"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jun 2023 14:42:20 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCoXr-0008YP-1f;
	Fri, 23 Jun 2023 21:42:19 +0000
Date: Sat, 24 Jun 2023 05:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Yunxiang Li <Yunxiang.Li@amd.com>
Subject: Re: [PATCH v2] dma-buf: allow nested dma_resv_reserve_fences
Message-ID: <202306240524.WBCHWUlJ-lkp@intel.com>
References: <20230623200113.62051-1-Yunxiang.Li@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623200113.62051-1-Yunxiang.Li@amd.com>

Hi Yunxiang,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20230624-040209/Yunxiang-Li/drm-amdgpu-fix-missing-fence-reserve-in-amdgpu_vm_sdma_commit/20230622-002915
base:   the 2th patch of https://lore.kernel.org/r/20230621162652.10875-3-Yunxiang.Li%40amd.com
patch link:    https://lore.kernel.org/r/20230623200113.62051-1-Yunxiang.Li%40amd.com
patch subject: [PATCH v2] dma-buf: allow nested dma_resv_reserve_fences
config: s390-randconfig-r016-20230621 (https://download.01.org/0day-ci/archive/20230624/202306240524.WBCHWUlJ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240524.WBCHWUlJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306240524.WBCHWUlJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/dma-resv.c:326:2: error: unterminated conditional directive
   #ifdef CONFIG_DEBUG_MUTEXES
    ^
>> drivers/dma-buf/dma-resv.c:817:7: error: expected '}'
   #endif
         ^
   drivers/dma-buf/dma-resv.c:288:1: note: to match this '{'
   {
   ^
   2 errors generated.


vim +326 drivers/dma-buf/dma-resv.c

   274	
   275	/**
   276	 * dma_resv_add_fence - Add a fence to the dma_resv obj
   277	 * @obj: the reservation object
   278	 * @fence: the fence to add
   279	 * @usage: how the fence is used, see enum dma_resv_usage
   280	 *
   281	 * Add a fence to a slot, @obj must be locked with dma_resv_lock(), and
   282	 * dma_resv_reserve_fences() has been called.
   283	 *
   284	 * See also &dma_resv.fence for a discussion of the semantics.
   285	 */
   286	void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
   287				enum dma_resv_usage usage)
   288	{
   289		struct dma_resv_list *fobj;
   290		struct dma_fence *old;
   291		unsigned int i, count;
   292	
   293		dma_fence_get(fence);
   294	
   295		dma_resv_assert_held(obj);
   296	
   297		/* Drivers should not add containers here, instead add each fence
   298		 * individually.
   299		 */
   300		WARN_ON(dma_fence_is_container(fence));
   301	
   302	retry:
   303		fobj = dma_resv_fences_list(obj);
   304		count = fobj->num_fences;
   305	
   306		for (i = 0; i < count; ++i) {
   307			enum dma_resv_usage old_usage;
   308	
   309			dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
   310			if ((old->context == fence->context && old_usage >= usage &&
   311			     dma_fence_is_later(fence, old)) ||
   312			    dma_fence_is_signaled(old)) {
   313				dma_resv_list_set(fobj, i, fence, usage);
   314				dma_fence_put(old);
   315				return;
   316			}
   317		}
   318	
   319		if (WARN_ON(fobj->num_fences == fobj->max_fences)) {
   320			// try our best to avoid memory corruption
   321			dma_resv_reserve_fences(obj, 1);
   322			goto retry;
   323		}
   324		if (fobj->reserved_fences)
   325			fobj->reserved_fences -= 1;
 > 326	#ifdef CONFIG_DEBUG_MUTEXES
   327		else
   328			WARN_ON(1); // missing fence slot allocation
   329	#else
   330		count++;
   331	
   332		dma_resv_list_set(fobj, i, fence, usage);
   333		/* pointer update must be visible before we extend the num_fences */
   334		smp_store_mb(fobj->num_fences, count);
   335	}
   336	EXPORT_SYMBOL(dma_resv_add_fence);
   337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

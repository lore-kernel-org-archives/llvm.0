Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D15346B6
	for <llvm@lists.linux.dev>; Thu, 15 Sep 2022 16:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663259183; x=1694795183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cYNNN0+8ZwSMmk18TAGRFuTA9DwfRpr2zvcHmMgkH3o=;
  b=IJtfEwQ2bbieOMp8QQcTSnBbDd3c/h08YBP/Nt5UPaRxVnFCnEmAE1Ro
   675nMe8Pzpfi/r1TbiZCbvjHYZg6lWGx8p17JIWqqlZxfTFXVKy80lYar
   vKLkfJMFprhPc6jqT+S+MON5wI9rJ0P4h+RLjAL2xy8vJP6h+4bWfvp3C
   X3bnKQwv0I+S1ZbHy47weeDGHwbYvdp9gtdnoGGnrrP3bXJUTBX7E9ReF
   QmpI5It2xP3/Zp/xaXnbhhkGd7IV+o6Fc9hwGucIZH/VefQkJ1T0GDd/7
   5waS1iuZgJuvK4j2oMma9MK8obd4b/h6TyurhvFNcy3dBBa8CECpMR8sy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="297490051"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="297490051"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 09:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="679590588"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Sep 2022 09:25:26 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oYrg6-0000kF-0s;
	Thu, 15 Sep 2022 16:25:26 +0000
Date: Fri, 16 Sep 2022 00:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [RFC 1/1] drm/i915/dgfx: Handling of pin_map against
 rpm
Message-ID: <202209160041.bepKmLCd-lkp@intel.com>
References: <20220915103311.5634-2-anshuman.gupta@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915103311.5634-2-anshuman.gupta@intel.com>

Hi Anshuman,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Gupta/DGFX-pin_map-with-rpm/20220915-183530
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220916/202209160041.bepKmLCd-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b2fef19743a4f93d15f05b06003e884335953797
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Anshuman-Gupta/DGFX-pin_map-with-rpm/20220915-183530
        git checkout b2fef19743a4f93d15f05b06003e884335953797
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_driver.c:52:
   In file included from drivers/gpu/drm/i915/display/intel_display_types.h:49:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:504:2: error: implicit declaration of function 'mutext_lock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mutext_lock(obj->wakeref_lock);
           ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:506:25: error: implicit declaration of function 'to_i915' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:506:49: error: member reference type 'int' is not a pointer
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ~~~~~~~~~~~~~~~~~~~~~~  ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:507:2: error: implicit declaration of function 'mutext_unlock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mutext_unlock(obj->wakeref_lock);
           ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:507:2: note: did you mean 'mutex_unlock'?
   include/linux/mutex.h:218:13: note: 'mutex_unlock' declared here
   extern void mutex_unlock(struct mutex *lock);
               ^
   In file included from drivers/gpu/drm/i915/i915_driver.c:66:
   In file included from drivers/gpu/drm/i915/gem/i915_gem_context.h:12:
   In file included from drivers/gpu/drm/i915/gt/intel_context.h:14:
>> drivers/gpu/drm/i915/i915_drv.h:417:40: error: static declaration of 'to_i915' follows non-static declaration
   static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
                                          ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:506:25: note: previous implicit declaration is here
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ^
   5 errors generated.
--
   In file included from drivers/gpu/drm/i915/gt/gen6_engine_cs.c:7:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:19:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc.h:19:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:13:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:504:2: error: implicit declaration of function 'mutext_lock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mutext_lock(obj->wakeref_lock);
           ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:506:25: error: implicit declaration of function 'to_i915' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:506:49: error: member reference type 'int' is not a pointer
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ~~~~~~~~~~~~~~~~~~~~~~  ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:507:2: error: implicit declaration of function 'mutext_unlock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mutext_unlock(obj->wakeref_lock);
           ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:507:2: note: did you mean 'mutex_unlock'?
   include/linux/mutex.h:218:13: note: 'mutex_unlock' declared here
   extern void mutex_unlock(struct mutex *lock);
               ^
   4 errors generated.
--
   In file included from drivers/gpu/drm/i915/gem/i915_gem_internal.c:11:
   In file included from drivers/gpu/drm/i915/i915_drv.h:47:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:19:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc.h:19:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:13:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:504:2: error: implicit declaration of function 'mutext_lock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mutext_lock(obj->wakeref_lock);
           ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:506:25: error: implicit declaration of function 'to_i915' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:506:49: error: member reference type 'int' is not a pointer
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ~~~~~~~~~~~~~~~~~~~~~~  ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:507:2: error: implicit declaration of function 'mutext_unlock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mutext_unlock(obj->wakeref_lock);
           ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:507:2: note: did you mean 'mutex_unlock'?
   include/linux/mutex.h:218:13: note: 'mutex_unlock' declared here
   extern void mutex_unlock(struct mutex *lock);
               ^
   In file included from drivers/gpu/drm/i915/gem/i915_gem_internal.c:11:
>> drivers/gpu/drm/i915/i915_drv.h:417:40: error: static declaration of 'to_i915' follows non-static declaration
   static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
                                          ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:506:25: note: previous implicit declaration is here
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ^
>> drivers/gpu/drm/i915/gem/i915_gem_internal.c:161:6: warning: shift count >= width of type [-Wshift-count-overflow]
           if (overflows_type(size, obj->base.size))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:116:32: note: expanded from macro 'overflows_type'
           (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
                                         ^  ~~~~~~~~~~~~~~~~
   1 warning and 5 errors generated.
--
   In file included from drivers/gpu/drm/i915/i915_query.c:9:
   In file included from drivers/gpu/drm/i915/i915_drv.h:47:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:19:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc.h:19:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:13:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:504:2: error: implicit declaration of function 'mutext_lock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mutext_lock(obj->wakeref_lock);
           ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:506:25: error: implicit declaration of function 'to_i915' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:506:49: error: member reference type 'int' is not a pointer
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ~~~~~~~~~~~~~~~~~~~~~~  ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:507:2: error: implicit declaration of function 'mutext_unlock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mutext_unlock(obj->wakeref_lock);
           ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:507:2: note: did you mean 'mutex_unlock'?
   include/linux/mutex.h:218:13: note: 'mutex_unlock' declared here
   extern void mutex_unlock(struct mutex *lock);
               ^
   In file included from drivers/gpu/drm/i915/i915_query.c:9:
>> drivers/gpu/drm/i915/i915_drv.h:417:40: error: static declaration of 'to_i915' follows non-static declaration
   static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
                                          ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:506:25: note: previous implicit declaration is here
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ^
   drivers/gpu/drm/i915/i915_query.c:584:7: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (overflows_type(item.query_id - 1, unsigned long))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:116:32: note: expanded from macro 'overflows_type'
           (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
                                         ^  ~~~~~~~~~~~~~~~~
   1 warning and 5 errors generated.
--
   In file included from drivers/gpu/drm/i915/display/intel_fb.c:10:
   In file included from drivers/gpu/drm/i915/i915_drv.h:47:
   In file included from drivers/gpu/drm/i915/gt/intel_engine.h:18:
   In file included from drivers/gpu/drm/i915/gt/intel_gt_types.h:19:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc.h:9:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_guc.h:19:
   In file included from drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h:13:
   In file included from drivers/gpu/drm/i915/i915_vma.h:34:
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:504:2: error: implicit declaration of function 'mutext_lock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mutext_lock(obj->wakeref_lock);
           ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:506:25: error: implicit declaration of function 'to_i915' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:506:49: error: member reference type 'int' is not a pointer
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ~~~~~~~~~~~~~~~~~~~~~~  ^
>> drivers/gpu/drm/i915/gem/i915_gem_object.h:507:2: error: implicit declaration of function 'mutext_unlock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mutext_unlock(obj->wakeref_lock);
           ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:507:2: note: did you mean 'mutex_unlock'?
   include/linux/mutex.h:218:13: note: 'mutex_unlock' declared here
   extern void mutex_unlock(struct mutex *lock);
               ^
   In file included from drivers/gpu/drm/i915/display/intel_fb.c:10:
>> drivers/gpu/drm/i915/i915_drv.h:417:40: error: static declaration of 'to_i915' follows non-static declaration
   static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
                                          ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:506:25: note: previous implicit declaration is here
                   intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
                                         ^
>> drivers/gpu/drm/i915/display/intel_fb.c:1385:3: warning: shift count >= width of type [-Wshift-count-overflow]
                   assign_chk_ovf(i915, remap_info->size,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_fb.c:1356:28: note: expanded from macro 'assign_chk_ovf'
           drm_WARN_ON(&(i915)->drm, overflows_type(val, var)); \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:116:32: note: expanded from macro 'overflows_type'
           (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
                                         ^
   include/drm/drm_print.h:593:19: note: expanded from macro 'drm_WARN_ON'
           drm_WARN((drm), (x), "%s",                                      \
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:583:7: note: expanded from macro 'drm_WARN'
           WARN(condition, "%s %s: " format,                               \
           ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:131:25: note: expanded from macro 'WARN'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   1 warning and 5 errors generated.


vim +/mutext_lock +504 drivers/gpu/drm/i915/gem/i915_gem_object.h

   492	
   493	/**
   494	 * i915_gem_object_unpin_map - releases an earlier mapping
   495	 * @obj: the object to unmap
   496	 *
   497	 * After pinning the object and mapping its pages, once you are finished
   498	 * with your access, call i915_gem_object_unpin_map() to release the pin
   499	 * upon the mapping. Once the pin count reaches zero, that mapping may be
   500	 * removed.
   501	 */
   502	static inline void i915_gem_object_unpin_map(struct drm_i915_gem_object *obj)
   503	{
 > 504		mutext_lock(obj->wakeref_lock);
   505		if (!--obj->wakeref_count)
 > 506			intel_runtime_pm_put(&to_i915(obj->base.dev)->runtime_pm, obj->wakeref);
 > 507		mutext_unlock(obj->wakeref_lock);
   508	
   509		i915_gem_object_unpin_pages(obj);
   510	}
   511	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

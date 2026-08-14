Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75A526ED59;
	Fri, 14 Aug 2026 22:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786748307; cv=none; b=Cl6EkfpKuHNq2C3c4UFINtgCbiNwuzSUQkyAdCmAN9Nb9CtmIIr3m5webfv3mQGmzFxGIJ3+D/i1mCom9mvqK5z5XpR2lJQgDcBXT09msR0EvCwfpx9b7y/LxGssj4Rsy1Aq4U4dKMUx3wTHPlCzOyMJKahiKHkukuSDcR+eh0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786748307; c=relaxed/simple;
	bh=q12BkodPeW4O/kRT4yGVIjlAuMaWxd8heu91kcS0OM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqgtt9S5JdUnUd4h0uq7VGBfR01/X3pahUFbXLvDIG4R5RvvlKdXbyQTxb1GntN/kbVKY7/BAbFOjgnhKCp4U5aO2nDNcka442EORA6jXSLI3fF8QQo5oyJ6YThZST/yFXSkVZn4/4wbi7/a8gmQiJq3FtR/NSRZJtueQxgXwsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XaE/uY5s; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XaE/uY5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786748305; x=1818284305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q12BkodPeW4O/kRT4yGVIjlAuMaWxd8heu91kcS0OM4=;
  b=XaE/uY5s5cXDXdblKGOo2CCXTOTS7aaXtnzcgzZ/X7hot4+/WTX/ncNG
   dRNOTWWb66mywD7dQXDhNdZ2Bg4v2S2yIIWmusF0sT2tDkZoC7/hVbBEi
   JlEfSUbPiPmVX4ksGeTBSDBfCsmw0Z57d5Afifo1pfbnaR+ktJUmYXioi
   O49UCDHSoQuQa55J/bR7qli/8G+xw6GlQkSYrT+sVTDQ13Q3DYPpvQiLh
   YPDAr8J/4+7PfNKgcYcG9Oe3awTba+loY/dzhccRejm8gNz9hgndPpPd0
   CbtqY+ut+2e4aUCH5mFzpWkfGE9u/VXtBMybuIkIdXp0rpSptFaXfUda9
   w==;
X-CSE-ConnectionGUID: 3fKcFbpES96zAUmV20DJOw==
X-CSE-MsgGUID: UBWjZv66RMq3PjiaumDPQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87350023"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="87350023"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 15:58:24 -0700
X-CSE-ConnectionGUID: qtDoGyBqTo+XfAVFdAI7Pw==
X-CSE-MsgGUID: 5U+6nlaWQVK8MIvXPZQ2+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="268198580"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2026 15:58:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv0qy-00000000aRC-3LVy;
	Fri, 14 Aug 2026 22:58:20 +0000
Date: Sat, 15 Aug 2026 06:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: wangyufei <wangyufei@vivo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] writeback: add sysfs to config the number of writeback
 contexts
Message-ID: <202608150637.VqHmBYp4-lkp@intel.com>
References: <20250825122931.13037-2-wangyufei@vivo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825122931.13037-2-wangyufei@vivo.com>

Hi wangyufei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v7.2-rc7 next-20260813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wangyufei/writeback-add-sysfs-to-config-the-number-of-writeback-contexts/20260813-143259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250825122931.13037-2-wangyufei%40vivo.com
patch subject: [RFC 1/1] writeback: add sysfs to config the number of writeback contexts
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260815/202608150637.VqHmBYp4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150637.VqHmBYp4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150637.VqHmBYp4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/do_mounts.c:23:
   In file included from include/linux/nfs_fs.h:43:
   In file included from include/linux/nfs_fs_sb.h:6:
>> include/linux/backing-dev.h:118:58: warning: declaration of 'struct bdi_writeback_ctx' will not be visible outside of this function [-Wvisibility]
     118 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                          ^
   include/linux/backing-dev.h:119:59: warning: declaration of 'struct bdi_writeback_ctx' will not be visible outside of this function [-Wvisibility]
     119 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                           ^
   2 warnings generated.
--
   In file included from mm/page-writeback.c:26:
>> include/linux/backing-dev.h:118:58: warning: declaration of 'struct bdi_writeback_ctx' will not be visible outside of this function [-Wvisibility]
     118 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                          ^
   include/linux/backing-dev.h:119:59: warning: declaration of 'struct bdi_writeback_ctx' will not be visible outside of this function [-Wvisibility]
     119 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                           ^
   mm/page-writeback.c:734:27: error: no member named 'nr_wb_ctx' in 'struct backing_dev_info'
     734 |         for (i = 0; i < min(bdi->nr_wb_ctx, nwritebacks); i++)
         |                             ~~~  ^
   mm/page-writeback.c:735:25: error: no member named 'wb_ctx_arr' in 'struct backing_dev_info'
     735 |                 new_ctx_arr[i] = bdi->wb_ctx_arr[i];
         |                                  ~~~  ^
   mm/page-writeback.c:737:16: error: no member named 'nr_wb_ctx' in 'struct backing_dev_info'
     737 |         for (i = bdi->nr_wb_ctx; i < nwritebacks; i++) {
         |                  ~~~  ^
   mm/page-writeback.c:739:12: error: invalid application of 'sizeof' to an incomplete type 'struct bdi_writeback_ctx'
     739 |                         kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
         |                                 ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1320:59: note: expanded from macro 'kzalloc'
    1320 | #define kzalloc(size, flags)                    alloc_hooks(kzalloc_noprof(size, flags))
         |                                                                            ^~~~
   include/linux/slab.h:1311:47: note: expanded from macro 'kzalloc_noprof'
    1311 | #define kzalloc_noprof(...)                     _kzalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                 ^~~~~~~~~~~
   include/linux/alloc_tag.h:270:31: note: expanded from macro 'alloc_hooks'
     270 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:256:9: note: expanded from macro 'alloc_hooks_tag'
     256 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   mm/page-writeback.c:727:9: note: forward declaration of 'struct bdi_writeback_ctx'
     727 |         struct bdi_writeback_ctx **new_ctx_arr, **old_ctx_arr;
         |                ^
   mm/page-writeback.c:739:12: error: invalid application of 'sizeof' to an incomplete type 'struct bdi_writeback_ctx'
     739 |                         kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
         |                                 ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1320:59: note: expanded from macro 'kzalloc'
    1320 | #define kzalloc(size, flags)                    alloc_hooks(kzalloc_noprof(size, flags))
         |                                                                            ^~~~
   include/linux/slab.h:1311:47: note: expanded from macro 'kzalloc_noprof'
    1311 | #define kzalloc_noprof(...)                     _kzalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                 ^~~~~~~~~~~
   include/linux/alloc_tag.h:270:31: note: expanded from macro 'alloc_hooks'
     270 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:260:10: note: expanded from macro 'alloc_hooks_tag'
     260 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   mm/page-writeback.c:727:9: note: forward declaration of 'struct bdi_writeback_ctx'
     727 |         struct bdi_writeback_ctx **new_ctx_arr, **old_ctx_arr;
         |                ^
   mm/page-writeback.c:739:12: error: invalid application of 'sizeof' to an incomplete type 'struct bdi_writeback_ctx'
     739 |                         kzalloc(sizeof(struct bdi_writeback_ctx), GFP_KERNEL);
         |                                 ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1320:59: note: expanded from macro 'kzalloc'
    1320 | #define kzalloc(size, flags)                    alloc_hooks(kzalloc_noprof(size, flags))
         |                                                                            ^~~~
   include/linux/slab.h:1311:47: note: expanded from macro 'kzalloc_noprof'
    1311 | #define kzalloc_noprof(...)                     _kzalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |                                                                 ^~~~~~~~~~~
   include/linux/alloc_tag.h:270:31: note: expanded from macro 'alloc_hooks'
     270 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:263:10: note: expanded from macro 'alloc_hooks_tag'
     263 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   mm/page-writeback.c:727:9: note: forward declaration of 'struct bdi_writeback_ctx'
     727 |         struct bdi_writeback_ctx **new_ctx_arr, **old_ctx_arr;
         |                ^
   mm/page-writeback.c:742:23: error: no member named 'nr_wb_ctx' in 'struct backing_dev_info'
     742 |                         while (--i >= bdi->nr_wb_ctx)
         |                                       ~~~  ^
   mm/page-writeback.c:747:33: error: incomplete definition of type 'struct bdi_writeback_ctx'
     747 |                 INIT_LIST_HEAD(&new_ctx_arr[i]->wb_list);
         |                                 ~~~~~~~~~~~~~~^
   mm/page-writeback.c:727:9: note: forward declaration of 'struct bdi_writeback_ctx'
     727 |         struct bdi_writeback_ctx **new_ctx_arr, **old_ctx_arr;
         |                ^
   mm/page-writeback.c:748:38: error: incomplete definition of type 'struct bdi_writeback_ctx'
     748 |                 init_waitqueue_head(&new_ctx_arr[i]->wb_waitq);
         |                                      ~~~~~~~~~~~~~~^
   include/linux/wait.h:68:26: note: expanded from macro 'init_waitqueue_head'
      68 |                 __init_waitqueue_head((wq_head), #wq_head, &__key);             \
         |                                        ^~~~~~~
   mm/page-writeback.c:727:9: note: forward declaration of 'struct bdi_writeback_ctx'
     727 |         struct bdi_writeback_ctx **new_ctx_arr, **old_ctx_arr;
         |                ^
   mm/page-writeback.c:751:16: error: no member named 'nr_wb_ctx' in 'struct backing_dev_info'
     751 |         for (i = bdi->nr_wb_ctx; i < nwritebacks; i++) {
         |                  ~~~  ^
   mm/page-writeback.c:752:30: error: incompatible pointer types passing 'struct bdi_writeback_ctx *' to parameter of type 'struct bdi_writeback_ctx *' [-Wincompatible-pointer-types]
     752 |                 ret = bdi_wb_ctx_init(bdi, new_ctx_arr[i]);
         |                                            ^~~~~~~~~~~~~~
   include/linux/backing-dev.h:118:77: note: passing argument to parameter 'bdi_wb_ctx' here
     118 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                                             ^
   mm/page-writeback.c:754:23: error: no member named 'nr_wb_ctx' in 'struct backing_dev_info'
     754 |                         while (--i >= bdi->nr_wb_ctx) {
         |                                       ~~~  ^
   mm/page-writeback.c:755:26: error: incompatible pointer types passing 'struct bdi_writeback_ctx *' to parameter of type 'struct bdi_writeback_ctx *' [-Wincompatible-pointer-types]
     755 |                                 bdi_wb_ctx_exit(bdi, new_ctx_arr[i]);
--
   In file included from mm/backing-dev.c:7:
>> include/linux/backing-dev.h:118:58: warning: declaration of 'struct bdi_writeback_ctx' will not be visible outside of this function [-Wvisibility]
     118 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                          ^
   include/linux/backing-dev.h:119:59: warning: declaration of 'struct bdi_writeback_ctx' will not be visible outside of this function [-Wvisibility]
     119 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |                                                           ^
   mm/backing-dev.c:465:38: error: no member named 'nr_wb_ctx' in 'struct backing_dev_info'
     465 |         return sysfs_emit(buf, "%d\n", bdi->nr_wb_ctx);
         |                                        ~~~  ^
>> mm/backing-dev.c:1015:58: warning: declaration of 'struct bdi_writeback_ctx' will not be visible outside of this function [-Wvisibility]
    1015 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                          ^
   mm/backing-dev.c:1015:5: error: conflicting types for 'bdi_wb_ctx_init'
    1015 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |     ^
   include/linux/backing-dev.h:118:5: note: previous declaration is here
     118 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |     ^
   mm/backing-dev.c:1019:29: error: incomplete definition of type 'struct bdi_writeback_ctx'
    1019 |         INIT_RADIX_TREE(&bdi_wb_ctx->cgwb_tree, GFP_ATOMIC);
         |                          ~~~~~~~~~~^
   mm/backing-dev.c:1015:58: note: forward declaration of 'struct bdi_writeback_ctx'
    1015 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                          ^
   mm/backing-dev.c:1021:24: error: incomplete definition of type 'struct bdi_writeback_ctx'
    1021 |         init_rwsem(&bdi_wb_ctx->wb_switch_rwsem);
         |                     ~~~~~~~~~~^
   mm/backing-dev.c:1015:58: note: forward declaration of 'struct bdi_writeback_ctx'
    1015 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                          ^
   mm/backing-dev.c:1023:27: error: incomplete definition of type 'struct bdi_writeback_ctx'
    1023 |         ret = wb_init(&bdi_wb_ctx->wb, bdi_wb_ctx, bdi, GFP_KERNEL);
         |                        ~~~~~~~~~~^
   mm/backing-dev.c:1015:58: note: forward declaration of 'struct bdi_writeback_ctx'
    1015 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                          ^
   mm/backing-dev.c:1025:13: error: incomplete definition of type 'struct bdi_writeback_ctx'
    1025 |                 bdi_wb_ctx->wb.memcg_css = &root_mem_cgroup->css;
         |                 ~~~~~~~~~~^
   mm/backing-dev.c:1015:58: note: forward declaration of 'struct bdi_writeback_ctx'
    1015 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                          ^
   mm/backing-dev.c:1026:13: error: incomplete definition of type 'struct bdi_writeback_ctx'
    1026 |                 bdi_wb_ctx->wb.blkcg_css = blkcg_root_css;
         |                 ~~~~~~~~~~^
   mm/backing-dev.c:1015:58: note: forward declaration of 'struct bdi_writeback_ctx'
    1015 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                          ^
   mm/backing-dev.c:1270:58: warning: declaration of 'struct bdi_writeback_ctx' will not be visible outside of this function [-Wvisibility]
    1270 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                          ^
   mm/backing-dev.c:1270:5: error: conflicting types for 'bdi_wb_ctx_init'
    1270 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |     ^
   include/linux/backing-dev.h:118:5: note: previous declaration is here
     118 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |     ^
   mm/backing-dev.c:1272:28: error: incomplete definition of type 'struct bdi_writeback_ctx'
    1272 |         return wb_init(&bdi_wb_ctx->wb, bdi_wb_ctx, bdi, GFP_KERNEL);
         |                         ~~~~~~~~~~^
   mm/backing-dev.c:1270:58: note: forward declaration of 'struct bdi_writeback_ctx'
    1270 | int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                          ^
   mm/backing-dev.c:1275:59: warning: declaration of 'struct bdi_writeback_ctx' will not be visible outside of this function [-Wvisibility]
    1275 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                           ^
   mm/backing-dev.c:1275:6: error: conflicting types for 'bdi_wb_ctx_exit'
    1275 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |      ^
   include/linux/backing-dev.h:119:6: note: previous declaration is here
     119 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
         |      ^
   mm/backing-dev.c:1277:25: error: incomplete definition of type 'struct bdi_writeback_ctx'
    1277 |         wb_shutdown(&bdi_wb_ctx->wb);
         |                      ~~~~~~~~~~^
   mm/backing-dev.c:1275:59: note: forward declaration of 'struct bdi_writeback_ctx'
    1275 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                           ^
   mm/backing-dev.c:1278:27: error: too many arguments to function call, expected single argument 'bdi', have 2 arguments
    1278 |         cgwb_bdi_unregister(bdi, bdi_wb_ctx);
         |         ~~~~~~~~~~~~~~~~~~~      ^~~~~~~~~~
   mm/backing-dev.c:881:13: note: 'cgwb_bdi_unregister' declared here
     881 | static void cgwb_bdi_unregister(struct backing_dev_info *bdi)
         |             ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/backing-dev.c:1280:50: error: incomplete definition of type 'struct bdi_writeback_ctx'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                                               ~~~~~~~~~~^
   mm/backing-dev.c:1275:59: note: forward declaration of 'struct bdi_writeback_ctx'
    1275 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                           ^
   mm/backing-dev.c:1280:50: error: incomplete definition of type 'struct bdi_writeback_ctx'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                                               ~~~~~~~~~~^
   mm/backing-dev.c:1275:59: note: forward declaration of 'struct bdi_writeback_ctx'
    1275 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                           ^
   mm/backing-dev.c:1280:50: error: incomplete definition of type 'struct bdi_writeback_ctx'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                                               ~~~~~~~~~~^
   mm/backing-dev.c:1275:59: note: forward declaration of 'struct bdi_writeback_ctx'
    1275 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                           ^
   mm/backing-dev.c:1280:50: error: incomplete definition of type 'struct bdi_writeback_ctx'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));
         |                                               ~~~~~~~~~~^
   mm/backing-dev.c:1275:59: note: forward declaration of 'struct bdi_writeback_ctx'
    1275 | void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx)
         |                                                           ^
   mm/backing-dev.c:1280:50: error: incomplete definition of type 'struct bdi_writeback_ctx'
    1280 |         WARN_ON_ONCE(test_bit(WB_registered, &bdi_wb_ctx->wb.state));


vim +118 include/linux/backing-dev.h

   116	
   117	int bdi_init(struct backing_dev_info *bdi);
 > 118	int bdi_wb_ctx_init(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
   119	void bdi_wb_ctx_exit(struct backing_dev_info *bdi, struct bdi_writeback_ctx *bdi_wb_ctx);
   120	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

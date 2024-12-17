Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9421FA150;
	Tue, 17 Dec 2024 17:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734456893; cv=none; b=tveFGp38QdmnVix4n9r+xhyk8fAAdU+AZb9/C5WHtA5KzMI/VLPnLlrvonICvXeQOzZxZOrBljmhlPDvDT5i6aljI64NuzgDlGyplYBEC+S5MJgzAoA/EX/cb4aZxtxgxrKsUFzmNlc+duFu4Cq/x8RwzJFCaUIf4EoWiizklFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734456893; c=relaxed/simple;
	bh=7YUvOgql5UXPC5K9+DvgQ49j0IrkgPD9X4Yrpc2gabM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNpfV7sVZG62Nyjgzgpu++kRNfE1sm8op/YHZvyBRZikOfNYOC0WkugMpTJqlFJHEFPT/djRvuc5v7cmOD7QGeY++o9/uZi80CM8odq6E7jJDocaeCSX5ai38l0dUstri2u5cfrRFyE/zbeGqdtyM0Q++NJtE9In7t67nqjbYjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ub9DB+1p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ub9DB+1p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D711CC4CED3;
	Tue, 17 Dec 2024 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734456892;
	bh=7YUvOgql5UXPC5K9+DvgQ49j0IrkgPD9X4Yrpc2gabM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ub9DB+1pzmHivS9+iI9k5eKN8CYcSG44BSRtGgGwqlYep+hKXjcG4dVD/Deytic4g
	 CON5PBfo3XixAvxRjCGU554q9giLynE/U6YM6BWXwr8GNV+H9kLT5MaHTS5j6LWAA4
	 XqxXvgpByRVojkBCRiKTMJWMUf0iJP3ndL5dotAMOMvrt9x4F2foyBti8dExyIfFiN
	 EScR+O5NcxLHKEX5SGNNCrgkEIeAc9/oJWQYiZ7B9maIA/o4l7b+iV95G16pOedWh2
	 9RbPU3t3yhcnSZ5A5eERl6CrRfkhrv6muY3dl0PtoxJXVd7vK8er0CkZKMkiPelosV
	 nbziCUaKX/ehA==
Date: Tue, 17 Dec 2024 10:34:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2260/2462]
 drivers/gpu/drm/xe/xe_gt_idle.c:127:33: error: static assertion expression
 is not an integral constant expression
Message-ID: <20241217173448.GA2647780@ax162>
References: <202412080849.sPp82jSi-lkp@intel.com>
 <CAMZ6RqJXWfnNebqxZZL4ANOOTjnLPfVOOdG0Rr6TM+jarJdQZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZ6RqJXWfnNebqxZZL4ANOOTjnLPfVOOdG0Rr6TM+jarJdQZA@mail.gmail.com>

Andrew,

Top posting for visibility. Vincent requested dropping
build_bugh-more-user-friendly-error-messages-in-build_bug_on_zero.patch
because it breaks the build for older clang versions in certain drivers
and I am still seeing those failures in the latest -next. Can you please
drop this patch?

Cheers,
Nathan

On Mon, Dec 09, 2024 at 02:01:49PM +0900, Vincent Mailhol wrote:
> On Mon. 9 Dec. 2024 at 13:34, kernel test robot <lkp@intel.com> wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
> > commit: 86c4e589d5c8fbb5092de0052b89402e86706515 [2260/2462] build_bug.h: more user friendly error messages in BUILD_BUG_ON_ZERO()
> > config: s390-randconfig-001-20241208 (https://download.01.org/0day-ci/archive/20241208/202412080849.sPp82jSi-lkp@intel.com/config)
> > compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080849.sPp82jSi-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202412080849.sPp82jSi-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> drivers/gpu/drm/xe/xe_gt_idle.c:127:33: error: static assertion expression is not an integral constant expression
> >                            gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> >                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/gpu/drm/xe/regs/xe_gt_regs.h:342:40: note: expanded from macro 'VDN_HCP_POWERGATE_ENABLE'
> >    #define   VDN_HCP_POWERGATE_ENABLE(n)           REG_BIT(3 + 2 * (n))
> >                                                    ^~~~~~~~~~~~~~~~~~~~
> >    drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
> >                   BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
> >                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
> >    #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
> >                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
> >    #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
> >                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
> >    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
> >                                                                                ^~~~
> >    drivers/gpu/drm/xe/xe_gt_idle.c:128:12: error: static assertion expression is not an integral constant expression
> >                                                         VDN_MFXVDENC_POWERGATE_ENABLE(j));
> >                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> So, here, j is not an integer constant expression. When passed to
> REG_BIT(), it will eventually expands to:
> 
>   BUILD_BUG_ON_ZERO(__is_constexpr(j) && (j < 0 || j > 31))
> 
> which is a compile time constant but not an integer constant
> expression. It was constant enough for the previous definition of
> BUILD_BUG_ON_ZERO() which relied on bitfields, but not enough constant
> for _Static_assert().
> 
> The reason I did not notice that is because I have another series in
> my tree which solves this issue, precisely, this patch:
> 
>   https://lore.kernel.org/all/20241203-is_constexpr-refactor-v1-8-4e4cbaecc216@wanadoo.fr/
> 
> @Andrew, maybe you can remove this patch from your tree. I thought it
> was standalone, but it is not. I will resend once the above series get
> merged.
> 
> >    drivers/gpu/drm/xe/regs/xe_gt_regs.h:343:44: note: expanded from macro 'VDN_MFXVDENC_POWERGATE_ENABLE'
> >    #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)      REG_BIT(4 + 2 * (n))
> >                                                    ^~~~~~~~~~~~~~~~~~~~
> >    drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
> >                   BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
> >                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
> >    #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
> >                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
> >    #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
> >                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
> >    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
> >                                                                                ^~~~
> >    2 errors generated.
> > --
> > >> drivers/gpu/drm/xe/xe_reg_whitelist.c:139:22: error: static assertion expression is not an integral constant expression
> >            range_start = reg & REG_GENMASK(25, range_bit);
> >                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:49:9: note: expanded from macro 'REG_GENMASK'
> >                   BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
> >                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
> >    #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
> >                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
> >    #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
> >                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
> >    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
> >                                                                                ^~~~
> >    drivers/gpu/drm/xe/xe_reg_whitelist.c:140:28: error: static assertion expression is not an integral constant expression
> >            range_end = range_start | REG_GENMASK(range_bit, 0);
> >                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:49:9: note: expanded from macro 'REG_GENMASK'
> >                   BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
> >                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
> >    #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
> >                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
> >    #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
> >                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
> >    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
> >                                                                                ^~~~
> >    2 errors generated.
> > --
> > >> drivers/gpu/drm/xe/xe_irq.c:303:22: error: static assertion expression is not an integral constant expression
> >                    if (!(master_ctl & GT_DW_IRQ(bank)))
> >                                       ^~~~~~~~~~~~~~~
> >    drivers/gpu/drm/xe/regs/xe_irq_regs.h:22:27: note: expanded from macro 'GT_DW_IRQ'
> >    #define   GT_DW_IRQ(x)                          REG_BIT(x)
> >                                                    ^~~~~~~~~~
> >    drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
> >                   BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
> >                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
> >    #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
> >                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
> >    #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
> >                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
> >    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
> >                                                                                ^~~~
> >    drivers/gpu/drm/xe/xe_irq.c:436:26: error: static assertion expression is not an integral constant expression
> >                    if ((master_tile_ctl & DG1_MSTR_TILE(tile->id)) == 0)
> >                                           ^~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/gpu/drm/xe/regs/xe_irq_regs.h:16:30: note: expanded from macro 'DG1_MSTR_TILE'
> >    #define   DG1_MSTR_TILE(t)                      REG_BIT(t)
> >                                                    ^~~~~~~~~~
> >    drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
> >                   BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
> >                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
> >    #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
> >                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
> >    #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
> >                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
> >    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
> >                                                                                ^~~~
> >    2 errors generated.
> >
> >
> > vim +127 drivers/gpu/drm/xe/xe_gt_idle.c
> >
> > 1c2097bbde107e drivers/gpu/drm/xe/xe_gt_idle_sysfs.c Riana Tauro           2023-06-23   97
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24   98  void xe_gt_idle_enable_pg(struct xe_gt *gt)
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24   99  {
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  100      struct xe_device *xe = gt_to_xe(gt);
> > c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  101      struct xe_gt_idle *gtidle = &gt->gtidle;
> > 50089a9534e258 drivers/gpu/drm/xe/xe_gt_idle.c       Matt Roper            2024-09-10  102      struct xe_mmio *mmio = &gt->mmio;
> > c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  103      u32 vcs_mask, vecs_mask;
> > a66c19895396e6 drivers/gpu/drm/xe/xe_gt_idle.c       Himal Prasad Ghimiray 2024-10-14  104      unsigned int fw_ref;
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  105      int i, j;
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  106
> > ecab82af278733 drivers/gpu/drm/xe/xe_gt_idle.c       Michal Wajdeczko      2024-06-19  107      if (IS_SRIOV_VF(xe))
> > ecab82af278733 drivers/gpu/drm/xe/xe_gt_idle.c       Michal Wajdeczko      2024-06-19  108              return;
> > ecab82af278733 drivers/gpu/drm/xe/xe_gt_idle.c       Michal Wajdeczko      2024-06-19  109
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  110      /* Disable CPG for PVC */
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  111      if (xe->info.platform == XE_PVC)
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  112              return;
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  113
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  114      xe_device_assert_mem_access(gt_to_xe(gt));
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  115
> > c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  116      vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> > c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  117      vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
> > c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  118
> > c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  119      if (vcs_mask || vecs_mask)
> > c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  120              gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
> > c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  121
> > c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  122      if (!xe_gt_is_media_type(gt))
> > c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  123              gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  124
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  125      for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  126              if ((gt->info.engine_mask & BIT(i)))
> > c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06 @127                      gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  128                                                   VDN_MFXVDENC_POWERGATE_ENABLE(j));
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  129      }
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  130
> > a66c19895396e6 drivers/gpu/drm/xe/xe_gt_idle.c       Himal Prasad Ghimiray 2024-10-14  131      fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  132      if (xe->info.skip_guc_pc) {
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  133              /*
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  134               * GuC sets the hysteresis value when GuC PC is enabled
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  135               * else set it to 25 (25 * 1.28us)
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  136               */
> > 50089a9534e258 drivers/gpu/drm/xe/xe_gt_idle.c       Matt Roper            2024-09-10  137              xe_mmio_write32(mmio, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
> > 50089a9534e258 drivers/gpu/drm/xe/xe_gt_idle.c       Matt Roper            2024-09-10  138              xe_mmio_write32(mmio, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  139      }
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  140
> > 50089a9534e258 drivers/gpu/drm/xe/xe_gt_idle.c       Matt Roper            2024-09-10  141      xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
> > a66c19895396e6 drivers/gpu/drm/xe/xe_gt_idle.c       Himal Prasad Ghimiray 2024-10-14  142      xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  143  }
> > 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  144
> >
> > :::::: The code at line 127 was first introduced by commit
> > :::::: c2bf07dd0bbce1f318b73b525e21fbc6d67a3a94 drm/xe/xe_gt_idle: modify powergate enable condition
> >
> > :::::: TO: Riana Tauro <riana.tauro@intel.com>
> > :::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki

Received: from out.smtpout.orange.fr (out-11.smtpout.orange.fr [193.252.22.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D03E4C91;
	Mon,  9 Dec 2024 05:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720533; cv=none; b=G+raOx5BMLJL6oR41e8D4v1Ze3wTLWsoLlW4dL5oew4Lt53JBtpvkV9BdGU/3yj5OFEQuKuZS/TwJhrayvD7m1zlsC+xcze5DcH3GNcU5WbBugtVR141o220GB8vjyw/3SlhgibOOdnRSRo6ps4NxQ8W7s81WKmPdekVBKOVw+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720533; c=relaxed/simple;
	bh=t4yrr5QwmeAnBjGNd00mS8JzyRnZSJZRQw4Rodl8SqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REqtJWzOngBkuyApoNPyeQxFbgJA8MUYZe4Nd/CXRVMO/d7wLi5HbfrPINSkE4r8ehoG6YgStEZIxDKAhHouaUAPo8MFrq8YyYAkKJwaI46ZNPFqS+nTHz+PFBvqrvBdQvnyIpjPYJC7ZC5hGhxgDVaF/5yaC09Zy7Hym6hdijE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=AG/piecQ; arc=none smtp.client-ip=193.252.22.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="AG/piecQ"
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by smtp.orange.fr with ESMTPSA
	id KVuDt7cPL3wKNKVuDtaAvv; Mon, 09 Dec 2024 06:02:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733720521;
	bh=aTPZ4VgwMmi9zdd4AJFg0+p683kZxOGTPo1uSRWjsdE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=AG/piecQICydpkKGpeL7a9De26CYSFRJsBOvHhMR3PLw18Cfs9n/N0dUjIM1qzGsn
	 s29KBupVGF9J994IJ/2aVmIHxDI7jfRGAqLJW3iK4xImkE2XdfiynA6re0K1Y6TTS8
	 +zCM5Zn7ZFmzgl34z5ozonmWqI0a4cnSauOFjyORzgiJulmkkPbjnHcuZJoYkQd8DT
	 kVTNAI9+OFCdT+D0VqCm5cabIw2W2irr5Y9WiCX0is59dv0D1GhaP+qsuNIQp1c/q+
	 mnW36VEnusrqu41BPvjOupTzTNjks2P11V9gosyK59j3KUtIB0/MRJRrmbq7d/w4X0
	 T3mIDHp8WlWCQ==
X-ME-Helo: mail-ej1-f52.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 09 Dec 2024 06:02:01 +0100
X-ME-IP: 209.85.218.52
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso545390666b.1;
        Sun, 08 Dec 2024 21:02:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnjS6cRkwCq4MdZDIm9gsGnXWCDMj0rmlOfexJG6iCsATUB4AfR3eCWqNZqOLH7CPfmR7I+c/tvJK9rB1a@lists.linux.dev
X-Gm-Message-State: AOJu0YwuO2GUapcXmD13sYlT+SlNw1p+rC+y72+zpPOFxS13cK3rCf2+
	u8qtOV02PiuQsxVT6jA9QVuO0ykklC+L2lPpVLADCHjTx6jc3la5FZPgD7n6eW7ihwxW++e92NX
	oMKl/tSRvOUeIOQn2YPcl566YTKM=
X-Google-Smtp-Source: AGHT+IH8qWjE5mOCgZtZokFASR1DguXPsly80DqcUFna93Mz82ezefPpe/7ecZqbAXTYAjWztqhoc75aiEy+jGI1Lw0=
X-Received: by 2002:a17:906:2181:b0:aa6:88ae:22a with SMTP id
 a640c23a62f3a-aa688ae0317mr166937866b.37.1733720520699; Sun, 08 Dec 2024
 21:02:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412080849.sPp82jSi-lkp@intel.com>
In-Reply-To: <202412080849.sPp82jSi-lkp@intel.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Mon, 9 Dec 2024 14:01:49 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqJXWfnNebqxZZL4ANOOTjnLPfVOOdG0Rr6TM+jarJdQZA@mail.gmail.com>
Message-ID: <CAMZ6RqJXWfnNebqxZZL4ANOOTjnLPfVOOdG0Rr6TM+jarJdQZA@mail.gmail.com>
Subject: Re: [linux-next:master 2260/2462] drivers/gpu/drm/xe/xe_gt_idle.c:127:33:
 error: static assertion expression is not an integral constant expression
To: kernel test robot <lkp@intel.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Mon. 9 Dec. 2024 at 13:34, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
> commit: 86c4e589d5c8fbb5092de0052b89402e86706515 [2260/2462] build_bug.h: more user friendly error messages in BUILD_BUG_ON_ZERO()
> config: s390-randconfig-001-20241208 (https://download.01.org/0day-ci/archive/20241208/202412080849.sPp82jSi-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080849.sPp82jSi-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412080849.sPp82jSi-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/gpu/drm/xe/xe_gt_idle.c:127:33: error: static assertion expression is not an integral constant expression
>                            gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
>                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/xe/regs/xe_gt_regs.h:342:40: note: expanded from macro 'VDN_HCP_POWERGATE_ENABLE'
>    #define   VDN_HCP_POWERGATE_ENABLE(n)           REG_BIT(3 + 2 * (n))
>                                                    ^~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
>                   BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
>    #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
>    #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
>                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>                                                                                ^~~~
>    drivers/gpu/drm/xe/xe_gt_idle.c:128:12: error: static assertion expression is not an integral constant expression
>                                                         VDN_MFXVDENC_POWERGATE_ENABLE(j));
>                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

So, here, j is not an integer constant expression. When passed to
REG_BIT(), it will eventually expands to:

  BUILD_BUG_ON_ZERO(__is_constexpr(j) && (j < 0 || j > 31))

which is a compile time constant but not an integer constant
expression. It was constant enough for the previous definition of
BUILD_BUG_ON_ZERO() which relied on bitfields, but not enough constant
for _Static_assert().

The reason I did not notice that is because I have another series in
my tree which solves this issue, precisely, this patch:

  https://lore.kernel.org/all/20241203-is_constexpr-refactor-v1-8-4e4cbaecc216@wanadoo.fr/

@Andrew, maybe you can remove this patch from your tree. I thought it
was standalone, but it is not. I will resend once the above series get
merged.

>    drivers/gpu/drm/xe/regs/xe_gt_regs.h:343:44: note: expanded from macro 'VDN_MFXVDENC_POWERGATE_ENABLE'
>    #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)      REG_BIT(4 + 2 * (n))
>                                                    ^~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
>                   BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
>    #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
>    #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
>                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>                                                                                ^~~~
>    2 errors generated.
> --
> >> drivers/gpu/drm/xe/xe_reg_whitelist.c:139:22: error: static assertion expression is not an integral constant expression
>            range_start = reg & REG_GENMASK(25, range_bit);
>                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:49:9: note: expanded from macro 'REG_GENMASK'
>                   BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
>    #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
>    #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
>                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>                                                                                ^~~~
>    drivers/gpu/drm/xe/xe_reg_whitelist.c:140:28: error: static assertion expression is not an integral constant expression
>            range_end = range_start | REG_GENMASK(range_bit, 0);
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:49:9: note: expanded from macro 'REG_GENMASK'
>                   BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
>    #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
>    #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
>                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>                                                                                ^~~~
>    2 errors generated.
> --
> >> drivers/gpu/drm/xe/xe_irq.c:303:22: error: static assertion expression is not an integral constant expression
>                    if (!(master_ctl & GT_DW_IRQ(bank)))
>                                       ^~~~~~~~~~~~~~~
>    drivers/gpu/drm/xe/regs/xe_irq_regs.h:22:27: note: expanded from macro 'GT_DW_IRQ'
>    #define   GT_DW_IRQ(x)                          REG_BIT(x)
>                                                    ^~~~~~~~~~
>    drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
>                   BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
>    #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
>    #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
>                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>                                                                                ^~~~
>    drivers/gpu/drm/xe/xe_irq.c:436:26: error: static assertion expression is not an integral constant expression
>                    if ((master_tile_ctl & DG1_MSTR_TILE(tile->id)) == 0)
>                                           ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/xe/regs/xe_irq_regs.h:16:30: note: expanded from macro 'DG1_MSTR_TILE'
>    #define   DG1_MSTR_TILE(t)                      REG_BIT(t)
>                                                    ^~~~~~~~~~
>    drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
>                   BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
>    #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
>                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
>    #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
>                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
>    #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>                                                                                ^~~~
>    2 errors generated.
>
>
> vim +127 drivers/gpu/drm/xe/xe_gt_idle.c
>
> 1c2097bbde107e drivers/gpu/drm/xe/xe_gt_idle_sysfs.c Riana Tauro           2023-06-23   97
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24   98  void xe_gt_idle_enable_pg(struct xe_gt *gt)
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24   99  {
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  100      struct xe_device *xe = gt_to_xe(gt);
> c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  101      struct xe_gt_idle *gtidle = &gt->gtidle;
> 50089a9534e258 drivers/gpu/drm/xe/xe_gt_idle.c       Matt Roper            2024-09-10  102      struct xe_mmio *mmio = &gt->mmio;
> c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  103      u32 vcs_mask, vecs_mask;
> a66c19895396e6 drivers/gpu/drm/xe/xe_gt_idle.c       Himal Prasad Ghimiray 2024-10-14  104      unsigned int fw_ref;
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  105      int i, j;
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  106
> ecab82af278733 drivers/gpu/drm/xe/xe_gt_idle.c       Michal Wajdeczko      2024-06-19  107      if (IS_SRIOV_VF(xe))
> ecab82af278733 drivers/gpu/drm/xe/xe_gt_idle.c       Michal Wajdeczko      2024-06-19  108              return;
> ecab82af278733 drivers/gpu/drm/xe/xe_gt_idle.c       Michal Wajdeczko      2024-06-19  109
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  110      /* Disable CPG for PVC */
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  111      if (xe->info.platform == XE_PVC)
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  112              return;
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  113
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  114      xe_device_assert_mem_access(gt_to_xe(gt));
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  115
> c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  116      vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  117      vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
> c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  118
> c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  119      if (vcs_mask || vecs_mask)
> c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  120              gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
> c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  121
> c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  122      if (!xe_gt_is_media_type(gt))
> c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  123              gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  124
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  125      for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  126              if ((gt->info.engine_mask & BIT(i)))
> c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06 @127                      gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  128                                                   VDN_MFXVDENC_POWERGATE_ENABLE(j));
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  129      }
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  130
> a66c19895396e6 drivers/gpu/drm/xe/xe_gt_idle.c       Himal Prasad Ghimiray 2024-10-14  131      fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  132      if (xe->info.skip_guc_pc) {
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  133              /*
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  134               * GuC sets the hysteresis value when GuC PC is enabled
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  135               * else set it to 25 (25 * 1.28us)
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  136               */
> 50089a9534e258 drivers/gpu/drm/xe/xe_gt_idle.c       Matt Roper            2024-09-10  137              xe_mmio_write32(mmio, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
> 50089a9534e258 drivers/gpu/drm/xe/xe_gt_idle.c       Matt Roper            2024-09-10  138              xe_mmio_write32(mmio, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  139      }
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  140
> 50089a9534e258 drivers/gpu/drm/xe/xe_gt_idle.c       Matt Roper            2024-09-10  141      xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
> a66c19895396e6 drivers/gpu/drm/xe/xe_gt_idle.c       Himal Prasad Ghimiray 2024-10-14  142      xe_force_wake_put(gt_to_fw(gt), fw_ref);
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  143  }
> 38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  144
>
> :::::: The code at line 127 was first introduced by commit
> :::::: c2bf07dd0bbce1f318b73b525e21fbc6d67a3a94 drm/xe/xe_gt_idle: modify powergate enable condition
>
> :::::: TO: Riana Tauro <riana.tauro@intel.com>
> :::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

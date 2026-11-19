Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116329;
	b=ZvE1TooAjHl8RiTwFtPwd6njnOVLnTQv0xopbQ2Fxdxjrd8QGc69Lvu4fdxrZYs3kyLS
	 v72bjHFDW9FqsrMZn65bgM4DleRQgT7uG+e61XHkJx3+J9WsLhuxgsWxyZ44ZL/fBIlxq
	 PUOuurbqQzr9NWWja4EZmuoHaH2CSXL3EduEH41t8vxzbCBvY8DMHzDmSyUwFKAI79/wk
	 CY+RoarUXSAxlj/qvBBsEF90nAZADaJ9BmcXLFhgKean51HOnkL/OiC2pX9cD1nSe7w6Z
	 2Xji84KVkMJUsFD3szWhJUVOAkseWOMUWjhPT21mTZZ6Prbonu4tkjr3gVowcol030A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=74VGOpSNCwDOLASOLNhvmRdqpZTelyvflsoJESldCvo=;
	b=x44Lp5JX01PcmVpcPkx0riUiv09FYU7ZmUlasFnf2DIVfX04jycaYJuPEqC7FNE2h0Z6
	 yIaXwDd1EYlgNDA+WZFIWdJdqb80RZzOYFO6oK93GLs3gVRjJyUVB/hA2fVOSTv3cD+2t
	 Z2KN8ZkEhefOZRIUpz2wEqFH2bebOK7rnd6t5fNimUd+fBJXUIbGndTnCH2+YdnNEfF8v
	 dhA+tKkOngkVTvTUbgK6w6K8TBdmizj5s5ccz9chIR3VjK+kWARIqd4pa8GamkuMU6egd
	 XPoR3OFybfdam8TR3J8mxJo5v86s8QDdIUW+BDqqQdHQsK1eima4YRV+h19nQ0dmakw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fvi4QJQ4;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C47D606A332
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 19:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C47D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fvi4QJQ4
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so225198a91.3
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 11:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116328; x=1795721128; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74VGOpSNCwDOLASOLNhvmRdqpZTelyvflsoJESldCvo=;
        b=fvi4QJQ4KpE200cv8etO+gXOkOLBxv67JOPHoMw4OzvRMzFSWr+3Yi64uczgowMe0Z
         +qnWEaWeWrWqVshdT6klBdMcxEalUJt2F+W15tBOO73FN+w8O2KXtYW3iJEyBQxng5J9
         3OR296Trl0leGKaQv44sOeONWj85LAwnZzQzXg8M2KQ25VhyxxLAIkeD3ngsKHdIR0x3
         Z2m3PHaS1pmiXr49GQZITXoG7idllY9fJ/USE1HdDczxuX3vhswtXr9SQDQ6ftWckUMd
         ScqMsucN2ZX6J0wqYM7cRU7bQB17UazODPJKIZMUKMZZ9c9G6y8bwRXgmLDVjMLRzlbX
         UwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116328; x=1795721128;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74VGOpSNCwDOLASOLNhvmRdqpZTelyvflsoJESldCvo=;
        b=zQDCr5DJhqBGaGV65SBtPRvRVr7WaaCVoQNfjN62TwaeFtNbhP7Vi7oKouERN0mbH7
         vyIUtCg2eNqAMXmcDxQ7gwe2sGavGWuGYcOifFGuWK5MEKJHJ2y0cKTbMDgwYMmtLHW9
         qi98MPOxqJWArZTIH+H/6L8GFDqQ1DZG2WwavctylMSYewW5E4lQQ5gjDbBjtbWC0fMd
         zdMQ11ZprnXBSq/QhGRlnmpEovZ4kuDV3QipL31awsPDxl8BWQ/pcC/yjakXingMvXJz
         q07JcEoVDyAjXdOdcdq5bduon/kaK7XOh2gI9e4M3ye5Lq+PLn/ki9r4G0Iak6pezb9G
         iJSA==
X-Forwarded-Encrypted: i=1; AL+hErEsiM3/fCqC13+1y6llQl1bEIClEBjzhUSNjw17xNQkWtSJBwuP3rcgfiRUiARqh5p5JPFa@lists.linux.dev
X-Gm-Message-State: APuU4Z9/vATcyWUXWqybi9y8Y1KSQ/YtncclKGHFvoigMN7R+3wS6c37
	fwCIRSKv40K0FaK1A8c0L+VrfyGMmVCRTVjJOaTEacTYohrufc/U0KaOwKHH1ks1QJBpZnhAjlH
	kjvxV4qmwDg==
X-Received: from pgjh5.prod.google.com ([2002:a63:df45:0:b0:cc7:d53a:a251])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e8c:b0:3b3:b373:6a6a
 with SMTP id 98e67ed59e1d1-3b41c9e45c3mr289799a91.28.1795116327397; Thu, 19
 Nov 2026 11:25:27 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:11 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-1-irogers@google.com>
Subject: [PATCH v4 0/9] Add __must_init and require explicit kobj_type::release
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Clang supports the 'require_explicit_initialization' attribute on struct
fields to enforce that the field is explicitly initialized when an
aggregate object is constructed, emitting -Wuninitialized-explicit-init
(enabled by default) if the field is omitted.

Following discussion at the Linux Plumbers Conference [1], patch 1 adds
the attribute to include/linux/compiler_attributes.h as __must_init. In
v1 it was called __require_explicit_initialization. Kees picked up that
patch with a first seq_file user [2], and in that thread Greg suggested
the shorter __must_init spelling, which Kees and Miguel agreed to. As
the attribute did not land in the v7.4 merge window, Kees asked that
this series carry the renamed attribute.

As Documentation/core-api/kobject.rst notes:
  "One important point cannot be overstated: every kobject must have a
  release() method, and the kobject must persist (in a consistent state)
  until that method is called. If these constraints are not met, the
  code is flawed."

Annotating struct kobj_type::release caught struct kobj_type definitions
across the tree that omitted .release:
- Patches 2-8 fix struct kobj_type definitions where dynamically
  allocated kobjects, ksets, or enclosing structures were either leaked
  on kobject_put(), freed prematurely before kobject release, or missing
  proper static initializers.
- Patch 9 annotates struct kobj_type::release with __must_init and
  explicitly sets .release = NULL on the remaining legacy struct
  kobj_type definitions, distinguishing built-in sites whose backing
  storage remains valid for the lifetime of the kernel (despite
  violating the kobject API contract) from sites with broken kobject
  lifetime management (marked with FIXME comments for follow-up fixes).

Danilo Krummrich offered to route the series as a whole through the
driver-core tree [3], and all subsystem maintainer Acked-by/Reviewed-by
tags for patches 1-8 have now been collected. Follow-up patches are
planned for the broken-lifetime sites documented in patch 9.

Note on tool use: An LLM coding assistant was used to help audit the
compiler diagnostics across the tree, draft the fixes and changelog
descriptions, and verify builds and review feedback.

Changes in v4:
- Rebased on v7.4-rc3.
- Patch 2 (powerpc/secvar): Add Reviewed-by from Srish Srinivasan and
  Acked-by from Madhavan Srinivasan.
- Patch 3 (sh: sq): Add Acked-by from John Paul Adrian Glaubitz.
- Patch 5 (dlm): Clarify subject ("Wait for kobject release before
  freeing dlm_ls") and update Fixes tag to commit 8a4cf500f1dd ("dlm:
  drop kobject release callback handling") (reported by Sashiko).
- Patch 6 (xen/sys-hypervisor): Add Reviewed-by from Juergen Gross.
- Patch 7 (ubifs): Update Fixes tag to commit 2e3cbf425804 ("ubifs:
  Export filesystem error counters") (reported by Sashiko).
- Patch 9 (kobject): Drop the "Pre-existing:" comment prefix and
  explicitly distinguish built-in sites whose storage outlives kobject
  cleanup (arm64 cpuinfo, ACPI hotplug profiles, s390 sclp_mem) from
  drivers and tristate modules with broken kobject lifetime management,
  documenting each lifetime hazard with a FIXME comment for follow-up
  fixes (requested by Danilo Krummrich).

Changes in v3:
- Rebased on v7.4-rc1.
- Note in cover letter that patches 2 (powerpc/secvar), 3 (sh: sq), and
  6 (xen/sys-hypervisor) are still awaiting subsystem Acked-by tags for
  merging through the driver-core tree, and CC those maintainers on the
  cover letter.
- Patch 1: Add Reviewed-by from Kees Cook; clarify that LLVM issue
  #232483 affects Clang versions prior to its upstream fix (pointed out
  by Nathan Chancellor).
- Patch 4 (cpufreq): Drop obsolete reference to cpufreq_governor_dbs in
  the commit message per Zhongqiu Han; add Reviewed-by from Zhongqiu Han
  and Acked-by from Rafael J. Wysocki and Viresh Kumar.
- Patch 5 (dlm): Add Acked-by from Alexander Aring.
- Patch 8 (drm/amdkfd): Add Reviewed-by from Felix Kuehling.
- Patch 9 (kobject): Fix omapfb manager-sysfs.c and overlay-sysfs.c
  comments to describe managers[] and overlays[] as dynamically
  allocated rather than static and note the CONFIG_DEBUG_KOBJECT_RELEASE
  hazard, fix a struct-vs-member wording nit in usnic_ib_sysfs.c, and
  generalize the commit message note on CONFIG_DEBUG_KOBJECT_RELEASE
  (reported by Sashiko).

Changes in v2:
- Rebased on v7.3-16928-g83f32c773255 (v7.4 merge window).
- Patch 1: Rename __require_explicit_initialization to __must_init per
  Greg Kroah-Hartman; document the Clang >= 20 requirement per Miguel
  Ojeda; note the Clang gap for file-scope objects without an
  initializer reported by Kees Cook; add tags from v1 and from Kees's
  posting.
- Move LLM assistance attribution from Assisted-by tags to this cover
  letter per commit 1e035297ffda ("docs: remove Assisted-by
  references").
- Patch 4 (cpufreq): Use "cpufreq: governor:" prefix, drop Fixes tag,
  fix typo, and remove the redundant runtime assignment in
  cpufreq_dbs_governor_init() per Zhongqiu Han.
- Dropped v1 patch 5 (ACPI: CPPC), already fixed upstream by
  commit 27954e29d7de ("ACPI: CPPC: Release CPC descriptors through
  kobject").
- Patch 5 (dlm): Call kobject_del() before dlm_recoverd_stop() in
  release_lockspace() and the new_lockspace() error path, and wait on a
  new ls_kobj_done completion before freeing the lockspace or dropping
  the module reference, avoiding races with delayed kobject release.
- Dropped v1 patch 8 (s390/sclp_mem) per Sumanth Korikkar: the
  /sys/firmware/memory/memoryX kobjects are permanent, so sclp_mem.c is
  folded into patch 9 with .release = NULL.
- Patch 7 (ubifs): Add Tested-by and Reviewed-by from Zhihao Cheng.
- Patch 8 (drm/amdkfd): Check q->kobj.state_in_sysfs before
  kobject_del() in kfd_procfs_del_queue().
- Patch 9 (kobject): Cover sclp_mem.c and the new amdgpu_ualink.c
  ualink_xcp_info_ktype, fix the overlay-sysfs.c comment, and prefix
  legacy .release = NULL comments with "Pre-existing:".
- Patch 9 (kobject): The ioat, kunpeng_hccs and omapfb display comments
  now say that the existing teardown can use-after-free under
  CONFIG_DEBUG_KOBJECT_RELEASE (reported by Sashiko). Fixing those
  drivers is left to follow-up patches.

v3: https://lore.kernel.org/all/20261108223913.3624571-1-irogers@google.com/
v2: https://lore.kernel.org/all/20261027223847.652884-1-irogers@google.com/
v1: https://lore.kernel.org/all/20261013223946.1836757-1-irogers@google.com/
[1] https://lpc.events/event/20/contributions/2392/
[2] https://lore.kernel.org/lkml/20261014225811.i.852-kees@kernel.org/
[3] https://lore.kernel.org/all/DMLWX8NY1N1N.2OMQMQCIVRR18@kernel.org/

Ian Rogers (9):
  Compiler Attributes: Add __must_init macro
  powerpc/secvar: Add missing kobject release callback to secvar_ktype
  sh: sq: Add missing kobject release callback to ktype_percpu_entry
  cpufreq: governor: Initialize kobj_type release callback statically
  dlm: Wait for kobject release before freeing dlm_ls
  xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
  ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
  drm/amdkfd: Free queue in procfs_queue_type kobject release callback
  kobject: Require explicit initialization of struct kobj_type::release

 Documentation/conf.py                         |  1 +
 arch/arm64/kernel/cpuinfo.c                   |  7 +++++
 arch/powerpc/kernel/secvar-sysfs.c            |  6 +++++
 arch/sh/kernel/cpu/sh4/sq.c                   |  6 +++++
 drivers/acpi/sysfs.c                          |  7 +++++
 drivers/cpufreq/cpufreq_conservative.c        |  5 +++-
 drivers/cpufreq/cpufreq_governor.c            |  4 +--
 drivers/cpufreq/cpufreq_governor.h            |  1 +
 drivers/cpufreq/cpufreq_ondemand.c            |  5 +++-
 drivers/dma/ioat/sysfs.c                      |  8 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c    |  8 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       | 17 ++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 12 ++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c        |  5 +++-
 drivers/infiniband/hw/hfi1/sysfs.c            |  7 +++++
 drivers/infiniband/hw/usnic/usnic_ib_sysfs.c  |  7 +++++
 drivers/parisc/pdc_stable.c                   |  8 ++++++
 drivers/power/supply/ab8500_fg.c              |  8 ++++++
 drivers/s390/char/sclp_mem.c                  |  6 +++++
 drivers/soc/hisilicon/kunpeng_hccs.c          | 18 +++++++++++++
 .../fbdev/omap2/omapfb/dss/display-sysfs.c    |  7 +++++
 .../fbdev/omap2/omapfb/dss/manager-sysfs.c    |  8 ++++++
 .../fbdev/omap2/omapfb/dss/overlay-sysfs.c    |  7 +++++
 drivers/xen/sys-hypervisor.c                  |  6 +++++
 fs/dlm/dlm_internal.h                         |  1 +
 fs/dlm/lockspace.c                            | 26 ++++++++++++++-----
 fs/erofs/sysfs.c                              | 14 ++++++++++
 fs/f2fs/sysfs.c                               | 21 +++++++++++++++
 fs/ocfs2/cluster/masklog.c                    |  7 +++++
 fs/ubifs/sysfs.c                              | 24 +++++------------
 include/linux/compiler_attributes.h           | 12 +++++++++
 include/linux/kobject.h                       |  2 +-
 scripts/checkpatch.pl                         |  1 +
 tools/lib/python/kdoc/xforms_lists.py         |  1 +
 34 files changed, 251 insertions(+), 32 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1.708.g77570a6a1d-goog


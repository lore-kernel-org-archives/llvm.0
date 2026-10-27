Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140751;
	b=FrWS6q8t/g8dmapsRYBiDxHw+8eO2BcqMOleio6k6Zl3ErhP9xFswUezi0VHwFdc/UkP
	 zFv2tgW2sNVeaafD4gSaS+Mfpia72ZsOZWUGDur2TdB99on8UPCiwTl2MtiQaBWUbJ7tb
	 8GRYBlsQ1MSPV2YKfLxs1GQa2rA1LARidQ5gN5KYPC8JbKyka/rK8qpEu83Z6KvFEku/j
	 fAjVQukZicMXNWo688HljGX+q7gdbnHoBzAA2Apbm0M/CQPMM4m8HvfLo9/ew4f+OUPZh
	 QlFJ2gKUkKDbj6i6zdZfPERZS6mp19kEgIZHwamVU+qqZ4dRLT88DQXrsmWJAwXW1AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=pEmx5PL3tlnBiGr2rjVOl0G+YHkBW7VB5cziBEiH9l0=;
	b=SjLTfJzSD51gTpEX0TL5SD/WB8f06hRCZhEDZ4XGb/cjswa/dJDnYCeyIa3iclERHe/s
	 1D0wVmyCfe5PrI7QVNJ/LjU5vp3uJL7bDI9mskh2QVXrWd973ZBu0qotnwF6vpcac/cES
	 3Mybk+3cfiV7mJlaal1TeQuD6Kj3yemv7UA0ocIDjhv/cDQ4XeiUt0uuBx0fVQa5f6cDy
	 qWIaEfk2Kiv6clziIzUpbDz/tATMtubXi62nLX1EqL2L70qLXuqk6pfROywoIxqZGICh4
	 RYtbrVURWTG/TRafPe74KSz2AsKb60EydyZ6sbgGp6yy50GURktcoKINSfuGzpnLdRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XJaJkdhg;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1FD606A325
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 22:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D1FD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XJaJkdhg
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2f2ea3c3cso596007c88.0
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 15:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140749; x=1793745549; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEmx5PL3tlnBiGr2rjVOl0G+YHkBW7VB5cziBEiH9l0=;
        b=XJaJkdhg84MLpX8NxKKJxamSxHst5QbgFMJp7i+SzxoMRLRHDOHuYTvYQFkPmtugtQ
         alVv7aiCD7yW6CWvl3x+VvG/cmEoG8IkPp0F/QQ93J4XG0jbOa3MEvuT0keoH9i+ejG1
         faTbzJUrfdbTeHyBs/Q5UkIVM97x26I+QWyFRBNVtBEwQj5BvSbigBQWtt49ffr3/CXc
         ypIClmIjN/6OM3frPT0mayS6UGTn+dBDptUIPzBmjezlFSA0PbPy4KOmYcdnl0MGL6iI
         PLjcc1YYbYOT66g/XVc/9UWm8XsCtpxdzudeZoLv1C+fvijjrGH5zyzIAO7g1XaWDcuC
         rVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140749; x=1793745549;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEmx5PL3tlnBiGr2rjVOl0G+YHkBW7VB5cziBEiH9l0=;
        b=rHj8N+Z9NBL+oLStvNMLlGlkZCpuY3GjVbzlTKKHcFEwA2UnLZcQwoEf5eWouUclmO
         Y+IBMCsLJhOgG3vnc078lTPpEi2DMl2Ik2HfG8P0g7gkfhS7ISRz4jpm9tOddzcu45MJ
         HP3iUoeoTkvvQt6VzbesWwKqFyT68OWHZVPnFcCMIjiL6iWQD0N+mP1d4JgLzWKc7UCD
         zqUd2KRhcmpDIZM6B3li6p1w/1p9N7QjQRzj4WkZSHpTPDNLFwewiLUB5tnu5b/91S9a
         3fjfCTXul1cMkj2mos7jM/WpeJcSB42rfAHvHKLDJWhwHpqo9SED2W54+xcPgt2kC7p6
         3l3Q==
X-Forwarded-Encrypted: i=1; AKwUvBybDDB/KXT0bGQeevh7NoKD83+T6Nf1yXUHfWGkdpNN4uUdRa0lKTSvE1E4dcnSZcH+9TmW@lists.linux.dev
X-Gm-Message-State: AFq9FYI6HtRtlSrKv9cO/IjbM4in9W7rqLRaWRPQ/wx4ROYJoeR8pyCv
	lMrIo4Pd7qNLknFZoSN1mwaIWhwaaBJbzKvyZWwFdBq7SU+KUIe1+igB78B2NZCWfMxtwuuPeAC
	XrZLRmLhj5Q==
X-Received: from dli9.prod.google.com ([2002:a05:7022:289:b0:1a1:da78:f9b9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6989:b0:165:90af:a25f
 with SMTP id a92af1059eb24-1a6cfa0c447mr941563c88.41.1793140748444; Tue, 27
 Oct 2026 15:39:08 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:35 -0700
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-1-irogers@google.com>
Subject: [PATCH v2 0/9] Add __must_init and require explicit kobj_type::release
From: Ian Rogers <irogers@google.com>
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
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
this series carry the renamed attribute. The Acked-by/Reviewed-by tags
on patch 1 were given for the original spelling; the rename is
mechanical.

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
  explicitly sets .release = NULL (with explanatory comments prefixed
  with "Pre-existing:") on the remaining legacy struct kobj_type
  definitions whose kobjects are static, per-CPU, permanent firmware
  structures, or embedded in devm- or parent-managed structures.

Note on tool use: An LLM coding assistant was used to help audit the
compiler diagnostics across the tree, draft the fixes and changelog
descriptions, and verify builds and review feedback.

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

v1: https://lore.kernel.org/all/20261013223946.1836757-1-irogers@google.com/
[1] https://lpc.events/event/20/contributions/2392/
[2] https://lore.kernel.org/lkml/20261014225811.i.852-kees@kernel.org/

Ian Rogers (9):
  Compiler Attributes: Add __must_init macro
  powerpc/secvar: Add missing kobject release callback to secvar_ktype
  sh: sq: Add missing kobject release callback to ktype_percpu_entry
  cpufreq: governor: Initialize kobj_type release callback statically
  dlm: Free dlm_ls in kobject release callback
  xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
  ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
  drm/amdkfd: Free queue in procfs_queue_type kobject release callback
  kobject: Require explicit initialization of struct kobj_type::release

 Documentation/conf.py                         |  1 +
 arch/arm64/kernel/cpuinfo.c                   |  5 ++++
 arch/powerpc/kernel/secvar-sysfs.c            |  6 +++++
 arch/sh/kernel/cpu/sh4/sq.c                   |  6 +++++
 drivers/acpi/sysfs.c                          |  2 ++
 drivers/cpufreq/cpufreq_conservative.c        |  5 +++-
 drivers/cpufreq/cpufreq_governor.c            |  4 +--
 drivers/cpufreq/cpufreq_governor.h            |  1 +
 drivers/cpufreq/cpufreq_ondemand.c            |  5 +++-
 drivers/dma/ioat/sysfs.c                      |  7 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c    |  5 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       | 10 +++++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 12 ++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c        |  5 +++-
 drivers/infiniband/hw/hfi1/sysfs.c            |  5 ++++
 drivers/infiniband/hw/usnic/usnic_ib_sysfs.c  |  2 ++
 drivers/parisc/pdc_stable.c                   |  5 ++++
 drivers/power/supply/ab8500_fg.c              |  5 ++++
 drivers/s390/char/sclp_mem.c                  |  2 ++
 drivers/soc/hisilicon/kunpeng_hccs.c          | 21 +++++++++++++++
 .../fbdev/omap2/omapfb/dss/display-sysfs.c    |  7 +++++
 .../fbdev/omap2/omapfb/dss/manager-sysfs.c    |  5 ++++
 .../fbdev/omap2/omapfb/dss/overlay-sysfs.c    |  5 ++++
 drivers/xen/sys-hypervisor.c                  |  6 +++++
 fs/dlm/dlm_internal.h                         |  1 +
 fs/dlm/lockspace.c                            | 26 ++++++++++++++-----
 fs/erofs/sysfs.c                              | 10 +++++++
 fs/f2fs/sysfs.c                               | 15 +++++++++++
 fs/ocfs2/cluster/masklog.c                    |  5 ++++
 fs/ubifs/sysfs.c                              | 24 +++++------------
 include/linux/compiler_attributes.h           | 12 +++++++++
 include/linux/kobject.h                       |  2 +-
 scripts/checkpatch.pl                         |  1 +
 tools/lib/python/kdoc/xforms_lists.py         |  1 +
 34 files changed, 202 insertions(+), 32 deletions(-)


base-commit: 83f32c773255720a661aa45d83e36278135f23f5
-- 
2.56.0.313.g2479322e68-goog


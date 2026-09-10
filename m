Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8746344052
	for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 23:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083212; cv=none; b=W1L4uVHLGIqNZfJb0kMRZYHhKxxvvYEvFEJ+n0V8ibst5WbBBpZRgI8OJk/6fPdMQYls2pOGIz7GTZsdjuw4LJNXlm8uRc7d4Vcd6Uxit1SApAU5RR8k7tTHP42EHaQczc4Q+k7tuATQe8yNhQ6+NftDgPOCmbfgGXmaraQSISY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083212; c=relaxed/simple;
	bh=jDLmLkCeczOtHajVFOa0utVXnzToYKkhGjYJJdHBMOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N2lCKnIrNTqJV9Q0dgZzffipE4pjezX6W2wqXw4tJ+mmyzYZV3h2nUxPuGnGwOmsW0CKUnPSCZOtP52uhqfEdsey93tLSog+A75XlOiKlm/5XFUVMsKEkRYhi4sYxtYJowSZeOXi2BqytjomuBkEJI81ozU3hMnUy1WlWsL8Eyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+UUxgNL; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+UUxgNL"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so290848a12.0
        for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 16:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789083210; x=1789688010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0E1uJRWOdeWeFR64RXVnaSEl2Q3657otbvouJpAZYtg=;
        b=Z+UUxgNLfW6dhpIPgqUKWlyPll6kp9EhfnNQh0WmWU0HR8/7RggDZSuf5Ks/EL6kCk
         Ti2dUBI2dSVraebTq0XcWNrshKRCpNkaqo8cFpXpFOu9o4CrEA7olmot9IvXSV4q5p3w
         mu9Tg7J4XZ31XiwHrtAgGjgCjE8uc8AUVMp4YBGqu/6XviQNeEyM8T5EP3P1lA4FWyas
         Ri6j+TptNAJS75pdW1nC1FqZeCM/3LVPJRwDOKhf2raOCDd22dCMetfB5ACAaq13ekmj
         rCVruHAA8u3YbuEi8bUtsA9BGIBl9Jfv0fubyPccXUIrIe54N5IQFTP7QbsLwMJFNYx6
         7QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789083210; x=1789688010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0E1uJRWOdeWeFR64RXVnaSEl2Q3657otbvouJpAZYtg=;
        b=kqInSi7QzFXIpZJTPswatJoLiUjfl8rLzS12lCjIiboz5uW1KS+Y+5sYg0r2ESbnyW
         Ks0IYD110Kj9VDbo+UQcqqVdMyKYRcTevhZURm+LutAiNPmRvzgkzhOJk7eBRfQSuX+S
         t4ZJ+EDObi58KnPzmJ/mNmS3pdkDjiQNFpJ7f2P01DNXmNEnMbgvqaARMrN36xmAdmKZ
         7uh3iUElztQhINlKQMg+hG1JyfqvlobUt7lIXPkH6768NYOWPxg338ZAyUySwPb+SBXg
         o9RyUOqGhNU1E1zMJAeFgBqliNRFZcoegxP7g9j/5O+z3m016iBTS79kLaUZvmbYGM6W
         6R3A==
X-Forwarded-Encrypted: i=1; AKwUvBwRb4MM+tE8zIQPeG5CAbfReAuy+MO79mmNX8v7RzAkcO27kE7fRSqGdf1fAqNBLWiLe94m@lists.linux.dev
X-Gm-Message-State: AFuF++ll2d3DNMJ314JrSGlYzsCvcoviJfMAODDzB3D8WxLKsb22FsHR
	tdOJda/7bh8hSz5/AAhw0hAi2ap9X8hFbdaYOxES7K4ctknHqBepcR2a
X-Gm-Gg: AYBFou3t+VHY8O/JmCHki5lvEJmKp/LY/E81pljbyRBFj1pupg0nmEvHnajA0fM1+86
	QxxcjYnNB0V7WHQ0kR61Rl/kIAu0Zy/X7twprkcBxTV7F1Y5XzZYqcoMSnDx21RYAbbIfcDJM0Y
	V9NoJrtOI0vm7taCL5i1j0F75UruOuS4wo4pGKCk5A7E8ONev1Xjnbs7rrmo8vGsuOM1lPHG9jk
	o1R/M1HiEOgLSjKo0/JGVcuTLURBbQtOsl29DPQ5k52lAqSPICXGezL1MYqN1j5dcOsSTIMXdX7
	Mj8YT9yaBi4U0o6gYC9x3SjC96MSLcLOZeAqK6HD81BovPU98XAd0ZcnhpFzVIgHyNvQrOtfbpn
	IGGqV+tGZvIriK3sCyMEDLD65JVoVgvHCgiIvfLLnZU1Yzm1O7g5gwoCAvunNB2uDOP2SPWsBa1
	k04FVinLPXM8S3zZxf6/p+TjBYwHXTHZZmoaXMK4LfQqkCJJ4/PCTMrwFNRv+OjVfEMQ==
X-Received: by 2002:a17:90b:4a8d:b0:39d:8222:6436 with SMTP id 98e67ed59e1d1-39d9bd8f51cmr1753897a91.7.1789083210158;
        Thu, 10 Sep 2026 16:33:30 -0700 (PDT)
Received: from localhost ([2a03:2880:9ff:43::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm1330595eec.11.2026.09.10.16.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:33:29 -0700 (PDT)
From: Ziyang Men <ziyang.meme@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	David Vernet <void@manifault.com>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: Viktor Malik <vmalik@redhat.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	JP Kobryn <inwardvessel@gmail.com>,
	Mykola Lysenko <mykolal@meta.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ziyang Men <ziyang.meme@gmail.com>,
	kernel-team@meta.com,
	linux-kselftest@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-input@vger.kernel.org,
	sched-ext@lists.linux.dev,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] selftests: add shared Makefile for BPF selftests and a new memcg test
Date: Thu, 10 Sep 2026 16:32:59 -0700
Message-ID: <20260910233303.1063501-1-ziyang.meme@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors the BPF-related build machinery that is currently
duplicated across selftests/{bpf,sched_ext,hid}/. It adds the shared
tools/testing/selftests/lib.bpf.mk fragment and wires up three consumers,
simplifying both existing BPF selftests and future additions.

The series also adds a cgroup memory-controller selftest that complements
the existing coverage.

Patch 1 adds lib.bpf.mk.

Patch 2 adds selftests/cgroup/test_memcg_stat_cross_cpu, which verifies a
cgroup flush by comparing values read through BPF memcg kfuncs with the
corresponding cgroupfs values. The existing bpf/cgroup_iter_memcg test only
checks whether selected values are non-zero.

Patches 3 and 4 replace the duplicated BPF build machinery in
selftests/{hid,sched_ext} with lib.bpf.mk.

===
Changes since v4:
- Apply Tejun's suggestion: make the vmlinux.h stamp a normal
  prerequisite so dependent BPF objects rebuild in the same make
  invocation when the header changes.
- Fix AI bot suggestion: assert in the BPF selftest that the memcg event
  enum argument types remain unsigned. This assert might not be
  necessary since these enum values are always uint32 on BTF.

===
Changes since v3:
For shared Makefile:
- Track in-tree libbpf headers directly so a single make invocation rebuilds
  BPF objects and skeletons after a header change.
- Restore the target definitions needed by LoongArch and MIPS cross builds.
- Validate output directories and skeleton suffixes, and reject dotted or
  hyphenated source stems before they reach build and cleanup rules.
- Add stamp tracking for vmlinux.h generation while preserving content-based
  header updates.
- Make skeletons and subskeletons explicit outputs, so a missing subskeleton is
  regenerated and both sets participate in the all target.
- Namespace private variables, expand the caller-visible contract, track a
  supplied VMLINUX_H, and remove unnecessary include search paths.

For cgroup selftest:
- Add CONFIG_BPF_EVENTS and probe every required kfunc plus the sleepable
  cgroup iterator before running.
- Bound CPU fanout, cgroup/process count, and total memory use; skip a case
  when the flush threshold would require more than 256 MiB.
- Check CPU discovery, polling, iterator creation, and BPF errors, with clearer
  diagnostics.
- Compare each BPF statistic against two following memory.stat samples, keeping
  exact equality on a quiet subtree while tolerating values that move between
  the two samples.

For hid and sched_ext:
- Remove unused HID locals instead of suppressing warnings, drop obsolete
  variables and comments, tighten cleanup, and correct the generated-output
  description.

===
Changes since v2:
For shared Makefile:
- Use USERCFLAGS and USERLDFLAGS to extend CFLAGS and LDFLAGS.
- Pass OPT_FLAGS/RELEASE and EXTRA_CFLAGS to the libbpf and bpftool sub-makes.
- Use one rule per BPF source instead of a global vpath that also affected the
  caller's normal %.c rules.
- Take HOSTCC/HOSTLD from lib.mk instead of including Makefile.include, which
  also rewrote the caller's AR, LD, and CFLAGS.
- Report a missing vmlinux from the recipe rather than at parse time, so
  "make clean" still works without BTF.

For cgroup selftest:
- Create one cgroup tree, perform one flush, then read through BPF and
  cgroupfs.
- Use common cgroup helpers such as cg_read_key_long() and values_close().
- Use cpu_set_t rather than manually allocated CPU lists.
- Move test_memcontrol.c's anonymous-memory allocator into cgroup_util.
- Address the remaining review feedback.

===
Changes since v1:
- Generalize lib.bpf.mk for source layouts and suffixes, extra headers and
  flags, skeleton suffixes, subskeletons, and configurable output directories.
- Add patch 3 (hid) and patch 4 (sched_ext), converting those directories to
  the shared fragment.

Ziyang Men (4):
  selftests: add shared lib.bpf.mk to build BPF progs and skeletons
  selftests/cgroup: add memcg_stat_cross_cpu correctness test for flush
  selftests/hid: build the BPF program via the shared lib.bpf.mk
  selftests/sched_ext: build BPF schedulers via the shared lib.bpf.mk

 tools/testing/selftests/cgroup/.gitignore     |   8 +
 tools/testing/selftests/cgroup/Makefile       |  46 ++
 tools/testing/selftests/cgroup/config         |   5 +
 .../selftests/cgroup/lib/cgroup_util.c        |  82 ++
 .../cgroup/lib/include/cgroup_util.h          |   3 +
 .../cgroup/memcg_stat_cross_cpu.bpf.c         | 101 +++
 .../selftests/cgroup/memcg_stat_cross_cpu.h   |  18 +
 .../cgroup/test_memcg_stat_cross_cpu.c        | 755 ++++++++++++++++++
 .../selftests/cgroup/test_memcontrol.c        |  29 +-
 tools/testing/selftests/hid/.gitignore        |   1 +
 tools/testing/selftests/hid/Makefile          | 179 +----
 tools/testing/selftests/hid/progs/hid.c       |   7 +-
 tools/testing/selftests/lib.bpf.mk            | 321 ++++++++
 tools/testing/selftests/sched_ext/Makefile    | 149 +---
 14 files changed, 1388 insertions(+), 316 deletions(-)
 create mode 100644 tools/testing/selftests/cgroup/memcg_stat_cross_cpu.bpf.c
 create mode 100644 tools/testing/selftests/cgroup/memcg_stat_cross_cpu.h
 create mode 100644 tools/testing/selftests/cgroup/test_memcg_stat_cross_cpu.c
 create mode 100644 tools/testing/selftests/lib.bpf.mk

-- 
2.53.0-Meta


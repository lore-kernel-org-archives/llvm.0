Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACA04FD26A
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898123; cv=none; b=Ffps+2y49i74K/8WHFiVqM+In2WLwY6sLoFlGWhe2QccdnA4+Jqb9jXDWt2at2LGYJx3kPYfFVK5W4w0atLPXlFyMZ9nVEeDwko1FTLG6uWjMgpf+6BUZDZi3TBTucTEXRGXi3eOYcnIlfW0FkgqFhdWfXFXDFOa2e8tyw04CqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898123; c=relaxed/simple;
	bh=J9NUI+CHNc4ksCq7lmTM8KEy4XEYi5fuatK7gkUOtXw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PQ7ZHo1MDSWGDaocFtoGJfMvsRPpJQRwaWSIayzT6z7z9S4bYKjia7gUGl8JjaMaKXQIvclXeQAxLxbXjOumeus6cXbpADzp61dVcjFrKDjx2pB8E1ivxR7zz1Yg2Mf5/JIm92k+I0j4U2eBuozmMiXMMpQvNO345Wqa4DegE0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j3wB83Y1DzYQv4c
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 21:27:44 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id C48B44056E
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 21:28:35 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.45])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgDnIvL3Mc5qfU4wAQ--.7133S2;
	Tue, 13 Oct 2026 21:28:35 +0800 (CST)
From: Tengda Wu <wutengda@huaweicloud.com>
To: Namhyung Kim <namhyung@kernel.org>,
	james.clark@linaro.org,
	xueshuai@linux.alibaba.com,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	leo.yan@linux.dev,
	Li Huafei <lihuafei1@huawei.com>,
	Ian Rogers <irogers@google.com>,
	Kim Phillips <kim.phillips@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Zecheng Li <zli94@ncsu.edu>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tengda Wu <wutengda@huaweicloud.com>
Subject: [PATCH v7 00/15] perf annotate arm64: Support instruction tracking for data type profiling
Date: Tue, 13 Oct 2026 13:27:58 +0000
Message-Id: <cover.1791629326.git.wutengda@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgDnIvL3Mc5qfU4wAQ--.7133S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWry8Kry3Zr1rJw4DJFWrZrb_yoWrKr4fpa
	9akw1fJr1Utr40ywn3JrZ7Xrs3Kw4fJa4UW348tFWSy3W2kF9YyFyDKF10yay8Cr9xu347
	Jw1vyF1DZa1UuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBCb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v
	6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkF7I0Ew4C26cxK6c8Ij28Icw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjTRQ2-0DUUUU
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/

This series adds arm64 support to perf's data type profiling by
implementing instruction tracking for the arm64 architecture.

Patches 01-11 of v6 have already been merged. This version only
contains the remaining instruction tracking part, renumbered from 01.

The main changes since v6 include:
v6: https://lore.kernel.org/all/cover.1789521520.git.wutengda@huaweicloud.com/

  * Rebase on the latest tree, since flex array support patches have been
    merged recently.
  * Invalidate lifetime in propagate_load_reg_state(). (Sashiko)
  * Remove the has_reg_type() guard in update_store_insn_state() to avoid
    skipping the stack state invalidation logic. (Sashiko)
  * Fix the issue where TSR_KIND_PERCPU_BASE fails to retry as expected. (Sashiko)

Patch organization
==================

  Patches 1-3:   Shared infrastructure. Extract invalidate_reg_state() as
                 a common helper, add the arch_get_reg_offset() helper for
                 computing operand base offsets, and wire up the arm64
                 entry points (arch_supports_insn_tracking(),
                 init_type_state(), and update_insn_state_arm64()).

  Patches 4-6:   Core instruction tracking for arm64: function return
                 types after calls, load instructions (ldr/ldp and their
                 addressing modes), and store instructions (str/stp).

  Patches 7-9:   Shared data structure improvements and an x86 fix.
                 Expand type_state_reg.imm_value to u64 so 64-bit
                 addresses can be tracked, preserve imm_value for stack
                 variables, and delete stale stack state on store of an
                 untracked register on x86.

  Patches 10-15: Remaining arm64 patterns: stack variable tracking,
                 'mov' (register and immediate forms), 'add' member
                 address calculation, 'adrp' global variable tracking,
                 per-cpu variable access, and 'mrs sp_el0' to resolve the
                 'current' pointer.

Each patch's type profiling results are as follows:

Patch | Feature                    | no_sym | no_var | no_typeinfo | bad_offset | insn_track | ok(%)
------+----------------------------+--------+--------+-------------+------------+------------+------
base  | baseline                   | 6      | 493    | -           | -          | -          | 56.2%
0002  | enable insn tracking       | 6      | 42     | 437         | 2          | 12         | 57.2%
0005  | support 'load' insn        | 6      | 42     | 398         | 1          | 52         | 60.7%
0006  | support 'store' insn       | 6      | 42     | 398         | 1          | 52         | 60.7%
0010  | support stack variable     | 6      | 42     | 391         | 1          | 59         | 61.3%
0011  | support 'mov' insn         | 6      | 42     | 372         | 3          | 76         | 62.8%
0012  | support 'add' insn         | 6      | 42     | 318         | 7          | 126        | 67.2%
0013  | support 'adrp' insn        | 6      | 42     | 238         | 8          | 205        | 74.2%
0014  | support per-cpu variable   | 6      | 42     | 233         | 8          | 210        | 74.6%
0015  | support 'mrs' insn         | 6      | 42     | 230         | 8          | 213        | 74.9%

Testing
=======

Tested on arm64 (all passed):

  # perf test -v "perf data type profiling tests"
  81: perf data type profiling tests                                                                  : Ok

  === Test Summary ===
  Passed main tests : 1
  Passed subtests   : 0
  Skipped tests     : 0
  Failed tests      : 0

Tested on x86. The profiling results show no change before/after applying
this patch series:

  before : total 880, ok 711 (80.8%), bad 169 (19.2%)
  after  : total 880, ok 711 (80.8%), bad 169 (19.2%)

Changelog
=========
v6 -> v7:
  - v6: https://lore.kernel.org/all/cover.1789521520.git.wutengda@huaweicloud.com/
  - Invalidate lifetime in propagate_load_reg_state().
  - Remove the has_reg_type() guard in update_store_insn_state().
  - Fix the issue where TSR_KIND_PERCPU_BASE fails to retry as expected.

Please let me know if you have any feedback.

Thanks,
Tengda

Tengda Wu (15):
  perf annotate-data: Extract invalidate_reg_state() as a common helper
  perf annotate-arm64: Enable instruction tracking support
  perf annotate-data: Add arch_get_reg_offset helper
  perf annotate-arm64: Track return type after call instructions
  perf annotate-arm64: Support load instruction tracking
  perf annotate-arm64: Support store instruction tracking
  perf annotate-data: Expand type_state_reg imm_value to u64
  perf annotate-data: Track imm_value for stack variables
  perf annotate-x86: Delete stale stack state on store of untracked
    register
  perf annotate-arm64: Support stack variable tracking
  perf annotate-arm64: Support 'mov' instruction tracking
  perf annotate-arm64: Support 'add' instruction tracking
  perf annotate-arm64: Support 'adrp' instruction to track global
    variables
  perf annotate-arm64: Support per-cpu variable access tracking
  perf annotate-arm64: Support 'mrs' instruction to track 'current'
    pointer

 .../perf/util/annotate-arch/annotate-arm64.c  | 750 ++++++++++++++++++
 tools/perf/util/annotate-arch/annotate-x86.c  |  38 +-
 tools/perf/util/annotate-data.c               | 209 ++++-
 tools/perf/util/annotate-data.h               |  14 +-
 4 files changed, 963 insertions(+), 48 deletions(-)


base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.34.1


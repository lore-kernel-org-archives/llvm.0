Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3461C3BF68F
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 22:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189092; cv=none; b=DHYDPuBFEzhHZ6V+THTIcQtjTSiKsbRSExp7ZCkeSb9Voo8TKqWDyOjht5nsuKjtaBI3acsXCTG7gNFIR8rQ4pPYxZo63KpmwUp+CMktZjeL5JPno3i7tv5Q3Hx9WvCHKhD9ZhVI/HG6FsVMDjQZIMK/CNun91kDJcT2J+0bQig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189092; c=relaxed/simple;
	bh=TSC8xct7CPjCdOh2QAKkGMk09bdyMNvmRPtbKR70ipM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kLxyhzxo3D1VMvF2glJ0Byo6kzqujgR9mFjXCfDnNxl66DqEIb35A5MYLGkvNfpm4YXatz9VJ8fW3A424c9jqgz+bVF3N+Ei+UGDFqIv1UUDe3kzkGLJz0VcgizIzdy52mTetH/EzXDVx8UEq6Y5JBlu3SsvYCD7wgqcfHoZDk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AaeF6/wi; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AaeF6/wi"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35cbea41088so480075eec.1
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 15:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189090; x=1792793890; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlO3NbwHdj3PU8c4bbM/MsYGnPzoh+/o0HZvALykYYs=;
        b=AaeF6/wi1jrCm1j4odUKv6zhzs7uWefMA3AH6qti6r4gn3eolMtJ+Nh1pHTmQzNmZy
         f4CBfsH47MOGfdytlCnSR9wRA6ThqL8yAo1Brxlbfo5r8ZT8sdCZ69xRFI01xQHQmmS4
         dComVskMX1orD0CKKuYGzzpEKUDF+ca7ghbkQQgbFecV1W39r+tb1UddecC+8oXp0zvt
         vx+5CYdd9c6wbCTZbu4pHRX1yYFtArEsTRjlCiSSumKhNEyCVEofdiW+3kf7vbN2mhYm
         sXxwvDIj5kpPJYtPcNZcIpZyYUjMYVShsLnUT3NX+rS4er4wX4/XQoFTQFFf88eM1SV3
         CJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189090; x=1792793890;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlO3NbwHdj3PU8c4bbM/MsYGnPzoh+/o0HZvALykYYs=;
        b=jhi3SOQdkwEAt80XXPy+IaNy9Jqy67LPZpRpO8ySMwYR3QKvyVHmMj4JzxxTQBYzIR
         cCQftQe1DJn3JOmc5LtKUE9X78eqfq96763Op95Mas8OPUPg6WbAQ2p0KIcZyXnQXdAJ
         jrbLCavs7j90kwMPSJlEMQ1VRuzqDqyIj4Vqy+qi0WTMGvUcC0Hg3V6Uog24NX5ACkZG
         LvxQeDpxsXkGPP4pUq8/D3hwVoEfbMuE9Rbr0GyvCtw5jorGRapsykB2/e61xLYlFTJo
         C0VydoBz9bmQ1QxL3d9sCBFby1+xSyLeXaCrD6K2BdvbMzYPLVj1zOkiAHY3JNgejCt5
         Xdug==
X-Forwarded-Encrypted: i=1; AKwUvBx97Vp+EGN+qjftvmKrSuiXWOTK0SQ+BbDurBC3BRr2H19QmVaeynVgvgAGynY/la3Idl8R@lists.linux.dev
X-Gm-Message-State: AFq9FYLAUyPJ0Sv9jgGZO8Gapy1dwOQsJdPigvu8E13E1zeikvRVsTdb
	ZMukbu2lr0jg7e/dfwSihNopqJK3AVJbSY7tF4xFoMO1ULDC98tMjWIcCPHQNNgG8fHbu/acFFe
	YDiOmsOwPGQ==
X-Received: from dlbrl9.prod.google.com ([2002:a05:7022:f509:b0:166:1a44:a89])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1706:b0:16a:f5cd:365
 with SMTP id a92af1059eb24-1850d087fd9mr1394614c88.5.1792189089758; Fri, 16
 Oct 2026 15:18:09 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:43 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-1-irogers@google.com>
Subject: [PATCH v4 00/17] tools/perf: Adopt kernel compiler-context-analysis.h annotations
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

The perf tool previously added Clang thread-safety annotations in
tools/perf/util/mutex.h (GUARDED_BY, LOCKABLE, EXCLUSIVE_LOCK_FUNCTION,
UNLOCK_FUNCTION, etc.). Since then, the Linux kernel has adopted a
unified set of static context analysis macros and attributes in
include/linux/compiler-context-analysis.h (context_lock_struct,
__guarded_by, __acquires, __releases, __must_hold, etc.).

This series makes tools/include/linux/compiler-context-analysis.h
functional by synchronizing it and the required compiler_types.h helpers
with the kernel headers, converts tools/perf from its custom mutex.h
macros to the kernel-style compiler-context-analysis.h annotations, and
expands context analysis coverage across comm, dso/dsos, thread/threads,
config, intel-tpebs, env, and maps. Along the way, separate preparatory
patches fix an unlocked __dsos__add() call and TOCTOU race in
__machine__addnew_vdso(), avoid dropping _dso__data_open_lock in
dso__list_del() under REFCNT_CHECKING, switch dso__data_open_lock and
tpebs_mtx to DEFINE_MUTEX(), add a read-lock fast path to
dsos__findnew_id(), fix an unlocked read of tpebs_reader_thread and
double-close of tpebs_cmd.out in intel-tpebs, and avoid a potential
read-to-write deadlock in maps__load_first() and out-of-bounds access in
__maps__remove().

This series was developed and reviewed with assistance from an AI coding
agent (Gemini 3.1 Pro) and reviewed with Sashiko.

v4:
  - Place the DSO loaded in addr_filter__resolve_syms() into a dsos
    collection so dso__dsos(dso) is populated (patch 8).
  - Join tpebs_reader_thread on error in evsel__tpebs_open(), document
    why tpebs_cmd.pid is cleared before pthread_join() in tpebs_stop(),
    and include <pthread.h> and <signal.h> in util/intel-tpebs.c
    (patch 13).
  - Include <string.h> in util/maps.c (patch 16).

v3:
  - Rebase onto perf-tools-next (converting the newly added
    dso__find_binary_type() lock annotations in util/dso.c).
  - Separate bug fixes, DEFINE_MUTEX() cleanups, and improvements (vdso,
    dso_data, dso__data_open_lock, dsos__findnew_id, intel-tpebs,
    tpebs_mtx, maps) from the annotation patches.
  - Move AI coding assistant attribution to the cover letter and drop
    per-commit Assisted-by tags per linux-next
    Documentation/process/coding-assistants.rst.
  - Add Marco Elver's Reviewed-by to patch 1.
  - Define __diag_clang_23() and Clang ASM_INPUT_G/ASM_INPUT_RM/
    ASM_OUTPUT_RM overrides in tools/include/linux/compiler-gcc.h
    (patch 2).
  - Probe for -Wthread-safety-pointer/-Wthread-safety-beta in
    Makefile.config (patch 5).
  - Pass write_locked to __dsos__find() (patch 7).
  - Pass struct dso_data * to close_data_fd() and dso__list_del() to
    remove the REFCNT_CHECKING dso pointer from struct dso_data and
    avoid dropping dso__data_open_lock in dso__list_del(), and include
    <assert.h> in util/dso.c (patch 8).
  - Re-validate DSO lookup under the write lock in dsos__findnew_id()
    via __dsos__findnew_id(), and handle NULL dso_id in
    dso__needs_improve_id(), __dso__improve_id(), and dso_id__cmp()
    (patch 10).
  - Reset tpebs_cmd.out = -1 if start_command() fails and include
    <stdint.h>, <stdlib.h>, <string.h>, and <unistd.h> in
    util/intel-tpebs.c (patch 13).
  - Bounds-check the index in __maps__remove() (freeing maps_by_name if
    out of bounds) (patch 16).

v2:
  - Use -c rather than -E when probing for
    -fexperimental-late-parse-attributes in Makefile.config to avoid
    -Werror,-Wunused-command-line-argument.
  - Acquire machine->dsos.lock in write mode across duplicate checking,
    dso__set_long_name(), and __dsos__add() in __machine__addnew_vdso().
  - Avoid dropping dso__data_open_lock in dso__list_del() under
    REFCNT_CHECKING.
  - Pass tpebs_cmd.out directly to __sample_reader() and set
    tpebs_cmd.out = -1 in evsel__tpebs_open() to avoid a double-close in
    tpebs_stop(), and clarify the config_set_mutex comment.
  - Drop maps__lock before calling map__load() in maps__load_first() to
    avoid a read-to-write self-deadlock when loading kernel maps inserts
    additional trampoline maps.

Ian Rogers (17):
  compiler-context-analysis: Avoid unused parameter warning in
    _context_unsafe_alias()
  tools headers compiler: Synchronize compiler_types.h with the kernel
    sources
  tools headers: Synchronize linux/compiler-context-analysis.h with the
    kernel sources
  perf mutex: Use kernel style compiler-context-analysis.h annotations
  perf build: Enable additional Clang thread-safety flags
  perf comm: Add __guarded_by annotations to struct comm_strs
  perf vdso: Fix unlocked __dsos__add() and race in
    __machine__addnew_vdso()
  perf dso: Pass dso_data to close_data_fd() and dso__list_del()
  perf dso: Use DEFINE_MUTEX for dso__data_open_lock
  perf dsos: Use read lock fast path in dsos__findnew_id()
  perf dso: Expand context analysis annotations
  perf thread: Expand context analysis annotations to threads and
    namespaces_lock
  perf intel-tpebs: Fix race in tpebs_stop() and tpebs_cmd.out fd
    handling
  perf intel-tpebs: Use DEFINE_MUTEX for tpebs_mtx
  perf config, intel-tpebs, env: Add __guarded_by and __must_hold
    annotations
  perf maps: Fix lock inversion in maps__load_first() and bounds check
    in __maps__remove()
  perf maps: Add context analysis annotations

 include/linux/compiler-context-analysis.h     |   2 +-
 .../include/linux/compiler-context-analysis.h | 518 ++++++++++++++++--
 tools/include/linux/compiler-gcc.h            |  72 ++-
 tools/include/linux/compiler.h                |  50 +-
 tools/include/linux/compiler_types.h          | 206 ++++++-
 tools/perf/Makefile.config                    |   8 +-
 tools/perf/builtin-sched.c                    |  16 +-
 tools/perf/builtin-top.c                      |   4 +-
 tools/perf/check-headers.sh                   |   1 +
 tools/perf/tests/dso-data.c                   |   4 +
 tools/perf/util/annotate.c                    |   4 +-
 tools/perf/util/annotate.h                    |   8 +-
 tools/perf/util/auxtrace.c                    |  16 +-
 tools/perf/util/bpf-event.h                   |   5 +-
 tools/perf/util/comm.c                        |  10 +-
 tools/perf/util/config.c                      |  43 +-
 tools/perf/util/dso.c                         | 140 +++--
 tools/perf/util/dso.h                         |  15 +-
 tools/perf/util/dsos.c                        |  31 +-
 tools/perf/util/dsos.h                        |  12 +-
 tools/perf/util/env.c                         |   1 +
 tools/perf/util/env.h                         |  19 +-
 tools/perf/util/intel-tpebs.c                 | 128 +++--
 tools/perf/util/libbfd.c                      |   4 +-
 tools/perf/util/maps.c                        | 148 +++--
 tools/perf/util/mutex.c                       |   4 +-
 tools/perf/util/mutex.h                       |  90 +--
 tools/perf/util/rwsem.c                       |   8 +-
 tools/perf/util/rwsem.h                       |  10 +-
 tools/perf/util/thread.c                      |  10 +-
 tools/perf/util/thread.h                      |  30 +-
 tools/perf/util/threads.c                     |   4 +
 tools/perf/util/threads.h                     |   6 +-
 tools/perf/util/vdso.c                        |  17 +-
 34 files changed, 1181 insertions(+), 463 deletions(-)

-- 
2.56.0.212.g129ede20d9-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825955;
	b=ZpyG9aTTNc3VM4atxqWx2jZBKyRN3k6/IBid6NOAGVSgFNmuvd5i7L7hts0l9nttGbvX
	 VTp1o3ZQYxUhLDPf61dGtVydVhDPUrUFN8HZhIukDErdj6akLzGIgqOjVxUCjXqza0RwI
	 UnrmW3+Erlv+2r6jlMvV5sFvHBKJ/ooXiffHPHYimYIhPZ9jSqJS8tFkyNk5t9U7891rR
	 EikiC272BGCe7MfenfvxKr6WBjYj4wFJrZoVd86KMzm2ynyyezEny9ZUHrHZzcLDgYsg0
	 ih5M0keRoxpF572bXxExd9Nzw/E7lfRVxrYenAICus9bhaRIFg2JkaAMupDppj0sxqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=dAk5t7/Uq2hFFngztPZcMYhv97rCmj99qhndfOYN6s0=;
	b=Gw/Mr0VkkjtbBDmQUBRV0BrY6qwkctQGLcR0iUX5g62G409gC3gk6d9+zzAiBwR3HDn3
	 WQhdxj8QBInfJdUJM25jBW9T1R/7FEEwRWAq2BOcL8JsJkiQ2YFWyxCgt/LE6wJuJ+DoF
	 Pt/fWKlxs4NdHwgPhh3KAewkOGStAhbxpAYfcnIdvFh2l86bOTSz0QmtDI702NhUPdXk/
	 NAuHkWjfQVTX42rPA9L3gkPZUoXJLZO/ZlUWLLyBPRmIL/mHLp/kS2mXfB+WifelCgvcK
	 U0Ps3WBkkjo2S7/46kbkdS2K1wXnLQGTbmX+Rz30JWCNsNrQPgD3z+wNHLnvDM/lJzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d36eC9Wy;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36E0606C939
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 20:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36E0606C939
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d36eC9Wy
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a223755e4so3900403eec.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 12:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825954; x=1794430754; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dAk5t7/Uq2hFFngztPZcMYhv97rCmj99qhndfOYN6s0=;
        b=d36eC9Wy4p/P14u036NLiD1leRsNgxVXLBWZ8GhMvGpXg4/Z8NrI6v5iQb7znnqSat
         fiHMLLap7Jo8ogzPn5Y9mBJuz7rlyxW0t5kusA6JFpZZ677pu/cEqjdNuWz4FIdiroep
         /ywNZeuOXXAbPatVf9PrlcHuXLovZuruZOZ9dvv14Kj71DRpLEALL201SD4O4vS0RchI
         Yr62W9JCIWwg7BDP5zaTQraoaLa67RmWY/twZlvam97WCBAx6ZXIoEbfORrO5v08jnaM
         i25NAyhyCjMk+x1Uc3MoLpmhdpO6KhcBwtuhvcoSzibKFHx7XmYE+ewzCUCi1cPaNiPf
         0RRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825954; x=1794430754;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dAk5t7/Uq2hFFngztPZcMYhv97rCmj99qhndfOYN6s0=;
        b=xuSGEprOiJ8gRvPqunGAI0tnP+WYQvaWD8Gt5HnT0AxXJ++rBTZi2zx+cELt1DYjIs
         I7L1/fYI+XR6Iks+fPXhIETC0oNB430fJvmsXL4IPJpN/JFfcRDCPcJGpjQTMMOldlLw
         ggGXP60Qh4uLG9rRDzw2EMb9FeS7/2yexx9aMRFxseiTcYwU12qO5g9fORhl7Yx77DaB
         /VBVP1raHZVVM3x13yi1tTRvQ7Aa1ycwdJdTc7Y3xHxtbahFE+eelVpviTRjnRY+ud8H
         gB+0GPFMzx7UZ/xHIh8yTCGSImdkOySsevaHIh8ly5ToDBswZb7uAgvYeJu1VJSxgyyW
         acDA==
X-Forwarded-Encrypted: i=1; AKwUvBySlWVC5pIklFk3/IROGvGbxapTsZ4ecFgN99bs9+n6t3WVABYLNLhFC0KGFXfJ3QBrZ0Yd@lists.linux.dev
X-Gm-Message-State: APuU4Z8HOKr+8ioGMx2FbGGcCKkB41KZn1irldiIvLUKrZbLQHclGVr2
	E+wV+IgG9XioOYraIdUJHr40MTAulBdwIx3SrWZPJ4mGGHCExfkfOymGl823BB9Qf79cIvEACZ5
	JtLpFsDL1Ng==
X-Received: from dybkf19.prod.google.com ([2002:a05:7301:3a93:b0:35c:f432:c724])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6393:20b0:369:f291:49da
 with SMTP id 5a478bee46e88-36a4243f71emr25862426eec.40.1793825953443; Wed, 04
 Nov 2026 12:59:13 -0800 (PST)
Date: Wed,  4 Nov 2026 12:58:50 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-1-irogers@google.com>
Subject: [PATCH v9 00/19] tools/perf: Adopt kernel compiler-context-analysis.h annotations
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
__machine__addnew_vdso(), skip BPF and OOL DSOs in
dsos__find_kernel_dso(), ensure DSOs created in auxtrace, machine, and
symbol helpers belong to a dsos collection, avoid dropping
_dso__data_open_lock in dso__list_del() under REFCNT_CHECKING, switch
dso__data_open_lock and tpebs_mtx to DEFINE_MUTEX(), add a read-lock
fast path to dsos__findnew_id(), fix an unlocked read of
tpebs_reader_thread and double-close of tpebs_cmd.out in intel-tpebs,
and avoid a potential read-to-write deadlock in maps__load_first() and
out-of-bounds access in __maps__remove().

This series was developed and reviewed with assistance from an AI coding
agent (Gemini 3.1 Pro) and reviewed with Sashiko.

v9:
  - Rebase onto perf-tools-next (resolving the conflict in
    tools/include/linux/compiler.h with ASSERT_STATIC_STORAGE() and
    converting the newly added dso__set_symsrc_filename() lock
    annotation in tools/perf/util/dso.h).
  - Move __must_hold_shared(&dsos->lock) on __dsos__find() from patch 13
    into patch 7 where __dsos__find() is introduced so every commit in
    the series builds cleanly with -Wthread-safety.

v8:
  - Set DSO_BINARY_TYPE__BPF_IMAGE for non-OOL ksymbol DSOs in
    machine__process_ksymbol_register() and skip
    DSO_BINARY_TYPE__BPF_PROG_INFO, DSO_BINARY_TYPE__BPF_IMAGE, and
    DSO_BINARY_TYPE__OOL in dsos__find_kernel_dso_cb() so that
    dsos__find_kernel_dso() does not match ksymbol DSOs in
    machine->dsos (patch 8).
  - Split the dsos__add() additions in auxtrace, machine, and symbol into
    a standalone patch (patch 9) before "perf dso: Pass dso_data to
    close_data_fd() and dso__list_del()" (patch 10).

v7:
  - Add newly created DSOs in machine__process_ksymbol_register() and
    dso__split_kallsyms() to machine->dsos so assert(dso__dsos(dso)) in
    dso__list_add() always holds.
  - Add __guarded_by(&config_mutex) to function-local static parser
    buffers in parse_value() and perf_parse_file().
  - Remove from maps_by_name before calling
    map__put(maps_by_address[address_idx]) in __maps__remove() so
    callers such as maps__remove_maps() that pass maps_by_address[i] as
    map do not use a freed handle in maps__by_name_index() under
    REFCNT_CHECKING.

v6:
  - Rebase onto perf-tools-next.

v5:
  - Hold machine->dsos.lock in write mode across machine->vdso_info
    initialization and temporary file creation in
    machine__findnew_vdso() and __machine__findnew_compat(), and
    annotate __machine__addnew_vdso() with
    __must_hold(&machine->dsos.lock).
  - Reset tpebs_cmd.pid = 0 and return early without setting
    t->started = true if start_command() fails in
    evsel__tpebs_start_perf_record().

v4:
  - Place the DSO loaded in addr_filter__resolve_syms() into a dsos
    collection so dso__dsos(dso) is populated.
  - Join tpebs_reader_thread on error in evsel__tpebs_open(), document
    why tpebs_cmd.pid is cleared before pthread_join() in tpebs_stop(),
    and include <pthread.h> and <signal.h> in util/intel-tpebs.c.
  - Include <string.h> in util/maps.c.

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
    ASM_OUTPUT_RM overrides in tools/include/linux/compiler-gcc.h.
  - Probe for -Wthread-safety-pointer/-Wthread-safety-beta in
    Makefile.config.
  - Pass write_locked to __dsos__find().
  - Pass struct dso_data * to close_data_fd() and dso__list_del() to
    remove the REFCNT_CHECKING dso pointer from struct dso_data and
    avoid dropping dso__data_open_lock in dso__list_del(), and include
    <assert.h> in util/dso.c.
  - Re-validate DSO lookup under the write lock in dsos__findnew_id()
    via __dsos__findnew_id(), and handle NULL dso_id in
    dso__needs_improve_id(), __dso__improve_id(), and dso_id__cmp().
  - Reset tpebs_cmd.out = -1 if start_command() fails and include
    <stdint.h>, <stdlib.h>, <string.h>, and <unistd.h> in
    util/intel-tpebs.c.
  - Bounds-check the index in __maps__remove() (freeing maps_by_name if
    out of bounds).

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

Ian Rogers (19):
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
  perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
  perf dsos: Ensure DSOs in auxtrace, machine, and symbol are in dsos
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
 tools/perf/util/config.c                      |  47 +-
 tools/perf/util/dso.c                         | 140 +++--
 tools/perf/util/dso.h                         |  17 +-
 tools/perf/util/dsos.c                        |  34 +-
 tools/perf/util/dsos.h                        |  12 +-
 tools/perf/util/env.c                         |   1 +
 tools/perf/util/env.h                         |  19 +-
 tools/perf/util/intel-tpebs.c                 | 133 +++--
 tools/perf/util/libbfd.c                      |   4 +-
 tools/perf/util/machine.c                     |  13 +-
 tools/perf/util/maps.c                        | 157 ++++--
 tools/perf/util/mutex.c                       |   4 +-
 tools/perf/util/mutex.h                       |  90 +--
 tools/perf/util/rwsem.c                       |   8 +-
 tools/perf/util/rwsem.h                       |  10 +-
 tools/perf/util/symbol.c                      |   4 +
 tools/perf/util/thread.c                      |  10 +-
 tools/perf/util/thread.h                      |  30 +-
 tools/perf/util/threads.c                     |   4 +
 tools/perf/util/threads.h                     |   6 +-
 tools/perf/util/vdso.c                        |  53 +-
 36 files changed, 1227 insertions(+), 493 deletions(-)

-- 
2.56.0.455.g6c5a503b38-goog


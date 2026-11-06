Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948633;
	b=uBmci/kcQgDkyM9L2++2QD5WE+/WxFA/Mv9Is76j5aT+va4BCVlcv6dZyfBIMZRMQMHy
	 lpytj8zpdsa4OH/ktl1/YPvLu6lAyK+3iCRjZpYoKnzrvORwfXpqQwNdI8cPo/7cF4NCn
	 zILVvFLUo2rSvc9ME7BlWdtLtECDxO2EHF7bAIm5c1kiJYVWoHvl9a/BxPaI+jDWE3/oE
	 OPnRUMzEJsc78Aib/FRcBXzw/Rekv0iaNEVQvjApz96F2w/zO4/4h5CeoyAw6kdfpJ5Nf
	 Wh1KJSzTKPl01gdM1paH43yO85TlcDV/zyA7YGN6VcCEbRA2Bg4SKS4XrfwUmx8mQWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=uJlDN+kEKgQoFs54iqpeRPIxvXPR0Lvj3/5Hca5G7TE=;
	b=VwuwUmPKUvkfZdyQ3i3mLwsvYEU/tGZnRbfcROkcFzHkh0YvDRWi17+NiCdbXrV/YwWq
	 X0V2d3PlBF8P2AKvy0JcCf4I7spKdfHHxFEV5TTghRYGpFvUunf/naKfq34HyJ0DIdnOU
	 lWsFm57TwpP4/ETW2OBKx34Iv6h1ad8SVyBWFkSh4CTb+o0UXQY85JpMGrrkvB2kmwKJm
	 KMCPTrG6bxNqijh7ywmg2EOJlxQf5APwPYYBbmyRUT2abFsKTHPXHH8M8tijNuROY+JPb
	 yZyuwzbJVTok+VjhcQFhjSneXNqTgPrTw2O/Ds9mK9STc5fkHRv8NC+Hi/7MFP1T5pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dIQa7heT;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0648606A329
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 07:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0648606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dIQa7heT
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso671496eec.0
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 23:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948631; x=1794553431; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJlDN+kEKgQoFs54iqpeRPIxvXPR0Lvj3/5Hca5G7TE=;
        b=dIQa7heThsGHfIJFWihCylc+ekPfxWr3X7uu20oYgPyXhCfZkb2Y9WdDlIxFhPyFNQ
         h9hTRtL9wI17lqtjRoFsqwvHzs9+wQMWu15HfIOorcCl5k3DIfbtYLVcpb+6zMC4xZgQ
         wGleiCD7FHOkpkxkGhR8MnZhD14CBC/1mQ0+CCxTcGY8dQn9cjTGa3ImxcpAUY9fmUSA
         L7kay7qWau1zVfLXFewkjEhlztorsZO8YRPGoOWoQgIyZxr9FH+jmvl62hwhGXnT44b6
         KvUFTrn4WOv1f5QKk+k7TY115r/+1+Pk+kPqYFaK5fTQYnEyefchmvKpeNN4olUsmE0e
         DK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948631; x=1794553431;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJlDN+kEKgQoFs54iqpeRPIxvXPR0Lvj3/5Hca5G7TE=;
        b=n8ECgnKc4PhmX3LIUoZbT0ijlVkREuh6mBYOXXiXPjy7qtHhtnl0bafjKtH2E1cTVw
         NgxCRC1KFu71l5QxlBwZQ0aYDuzfLtYiGndamhKJjkTNMyAxrLKbZdHYZVp0tW/9SRBi
         nYAuqOPTobP6ONib2pH2btNO88Eo2zFZOlBun2tGHgHBKyJOcX3uRM6e4xQDZzhP9gtw
         2g0VYpBOE3Nnrxxd1bCLVgKfppEDX+IBoht7U3+14QhMDaudqS1NCxyw3G2Fox5DBHen
         x9Y8T/rPIhLKcrPAm0+eXvHzIJW1mpiKKJTkq81p11RmUPCrU99B6GYWEg5SawMdRlXT
         C2zA==
X-Forwarded-Encrypted: i=1; AKwUvBy3fgRLxgf0CCBQOXDcXjCrYko2FOaIqjRZwNjqegEkiioIfahmO/EYJbw0bocmd5fo7ZQd@lists.linux.dev
X-Gm-Message-State: APuU4Z+VmZt6bCLd1Iw6JbjidicIixBEGacCXJ1YcKq1EFvx08YsTnVj
	vG0ZspgM0Bboi9kT4GXanSZEugUT0LpXUG2jx7/THL72kjxP6YD7srZH0nrnLrSapKNraWuHs9t
	i88kZCknrvA==
X-Received: from dyclw21.prod.google.com ([2002:a05:693c:2115:b0:36a:1f25:64f4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:26c6:b0:369:fa21:ba0b
 with SMTP id 5a478bee46e88-36f7691f2f6mr2244479eec.33.1793948631022; Thu, 05
 Nov 2026 23:03:51 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:24 -0800
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
Message-ID: <20261106070344.329897-1-irogers@google.com>
Subject: [PATCH v10 00/20] tools/perf: Adopt kernel compiler-context-analysis.h
 annotations
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
avoid a potential read-to-write deadlock in maps__load_first(), and fix
map index lookup fallback and removal in maps.

This series was developed and reviewed with assistance from an AI coding
agent (Gemini 3.1 Pro) and reviewed with Sashiko.

v10:
  - Split the maps__load_first() lock inversion fix (patch 18) from the
    maps index lookup and removal fixes (patch 19).
  - Fall back to the linear pointer scan in maps__by_address_index() and
    maps__by_name_index() when bsearch() returns NULL, check
    map__start(prev) < map__start(new) in __maps__insert(), factor out
    __maps__remove_at() so maps__remove_maps() removes at index i
    directly without risking an infinite loop, guard against -1 index
    wraparound in maps__find_next_entry(), refresh sort invariants in
    maps__fixup_end() and machine__create_kernel_maps(), and add a unit
    test in tests/maps.c.

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

Ian Rogers (20):
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
  perf maps: Fix lock inversion in maps__load_first()
  perf maps: Fix map index lookup fallback and removal
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
 tools/perf/tests/maps.c                       | 140 +++++
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
 tools/perf/util/machine.c                     |  34 +-
 tools/perf/util/maps.c                        | 216 +++++---
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
 37 files changed, 1415 insertions(+), 525 deletions(-)

-- 
2.56.0.455.g6c5a503b38-goog


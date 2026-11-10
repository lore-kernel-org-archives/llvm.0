Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794352468;
	b=1lHQJVfGM1MnI9z4Ln1NOLZtYCfhhyxU2nZfe8JfITCwXtAJ8PRWROvc2LP6rzyDs2vS
	 ay2m3sSIQ2D7anZJUjn23k9t+DLMg7igXGsMiTKTyK/F9Y1v9uRho/kIA4hDOuRssnO3L
	 X1ixSzb9ytOtr85402aL1rF9QFJZ0qjyCKzGP/odSunqYXwq0bXAePfJ79LwEYtY5jpDS
	 fcgK/8i1f6CiJnntEM9eJ/KINk6xEGr3qLuCDNyxuaRVgsxp9w0nTxjSuJ5iPpOgsKI5L
	 4GnxYPwvwKDDUB9SNF4Y+2iMOwRbP18kvWsIRWHgEJ02U1/PPvryWCr0dg9mxNk8FeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QFIJPotnPl4zcCi4SEs2Thxfu9rvo/W9PjSXru65Fno=;
	b=NDPD6/qlpRVnb+5505BjRYf6PNaax0kCAtO5yR3pS6UW3LoIsMMyDg0ehfG0Cb1Q0dAj
	 EduUdohf7wqTkXCOhT5MmiaE4MAGHZGUzNV+gDX61FYm8DoEQt15NSLzFWwv8ObOHqnjx
	 maJY7rboQ+ovldMexK5+v2WnfRMsMmW+AY1MmLKZzkSMsOVkXL54ONHHhcPn4t0eKCvAo
	 XTYvNXcKLdwTQaVZ2RHr7F2fd0+IL3mkGUZo+UJXAPQ3lqG2mj6pNcwwgBIl2IDGJF+Gs
	 gPtETUuwT+pWspkZPVwWLv6iDWpj/fHVeGaXF4ZtRjQhqjW2jJrNGySqcTzJ9F1/eqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PyTyPpVK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BAA606A31C
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 23:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74BAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PyTyPpVK
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533202fe429so49711cf.0
        for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 15:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794352466; cv=none;
        d=google.com; s=arc-20260327;
        b=Wcp/oU3m+Rxuu3tjrKMUGoGNJdmhW7mKgc7x9YzPXSvXdy0Mcku/9eyf02ugsVa+de
         D1GfzPESaE6alJPo23bVU730PFCwanbBBw0EQgwltoDhYnue2ElCryKP93sAviYuK0pj
         ywVOLPgrWuiA4vMGGtfcp37bJ5Wwe7Pv0e+x4SLT3Irv+6xUdz/jWOXSdzTXE561c085
         LTmh9+t7SBxOC7mczg24dTb6m+0ycHEChtx4tLAr1V1U672W+s5fv7QFycZz4RKV7AjD
         PaUt0c1YmGb1atETFBedvGrweYaLLEmWcotTu8lx1MlqhakBHVQ9qepD+3jNzdjzPGzH
         Bvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QFIJPotnPl4zcCi4SEs2Thxfu9rvo/W9PjSXru65Fno=;
        fh=WQoR1mxIp8vE3mBtai4hdQZu2GNwiZc2LMtIa2Cypgk=;
        b=Vq43T6aSxeJu6mRlGBGBrLEAObYai3YKBhEKV74iINxFeoPt3wKhRNCVjLhQTDvBK9
         BmnxRBtyc8s+rIUHckGBoW0f89+cUaX/AlplC0O86mbBH2m9FfNEhqfKzgTMVZbC2Xtp
         GIOAj7r+Ue+T2L65J9S2+m05ZedbT186Hzsr2rHnW1dPgqtSM+NEJ5xm1KlbG49ZzbFQ
         mfZH8Ej0FvBehvhbNhDumNmpOwURIOr7MnSVU43638mO8TSycN5X7RZhPhCm6kYAoPED
         RUadgH3wvo8rV3mVnmBn/KqmHDVTAyJQ2DNG3JsYfcyL91/6vqLbA9pXnHj9PrS2wYSa
         sMPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794352466; x=1794957266; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QFIJPotnPl4zcCi4SEs2Thxfu9rvo/W9PjSXru65Fno=;
        b=PyTyPpVKdX5i5MCFnQDQ8Xk/dgVsJLj7XpEDXStVNljLWT2mVhLkaUkN/K/MMOjXvQ
         4hfPdFRrYRVPYtGLqt7gTw18bmAVghcrBDhhplJoESKp+usWe57Bl70q1e0qay547ky4
         //03TCbwOd5EdeO+YQ8HjUuSa56sSsUMrPssu2OCgjKK0SCSsHmQX9vbNjXtdUoLt5S+
         eANi1xz75OfQBxzaXTjWlnuqNJ14Jod6J2OXjZRZJBU54sFtZTxrFC4egh6UO61t3plI
         a/QVfaSlQthNTtddoYLz60nXaIgTSrsv9jjyUFRvp7NpZccRyhcD8CIV4Nmlvuuo6SC7
         grbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352466; x=1794957266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFIJPotnPl4zcCi4SEs2Thxfu9rvo/W9PjSXru65Fno=;
        b=lQzIY3jhz/wOYGoPERM4KxgVABzT+qQdhKANoHl7Yly0dfycd8jY/IwJPscR5rngZr
         hYPuzVqiN1Ug6SsCXQeoIONs9N7tGWKy2Uu4maRzbRZYHmkEBX9lrjAU3w9uVQZNWYer
         tp34qw9QxvTvC13L49How5VJJiHWGlSHpH+g6dR1Uc7PO2+K911Z/MtXat63CRx61+60
         Iecdcy6sxtQEejUL+dZI7whyTWPF8vSqK877Rq9efjYe+9mv80ccQResHSfwG5UFgvAa
         M01Wekt5KrDRoAsjiLqD21t5MNv+GmUpjPvD2FW/DCz5Taq5tJF6Td3uZRDlhEDNPM6y
         YpfA==
X-Forwarded-Encrypted: i=1; AL+hErEfmhMGwYpMfkstaeLSOZan//vy8m1xhCyIElL78Jde31daGhVTijqWhsL+WLqgMWO7NeMk@lists.linux.dev
X-Gm-Message-State: APuU4Z8uU81adAqc9Xm7X8WmBFoIzR+P2DlU17b9xRgC5g6ZBoJ0P5uj
	UyZ/aEaMLjLuiAGK/L4EYibD7H3Z03Rn1J31XtucHSxH+3zdlsFIsIwCJ4HGGvWZxBhdmu0csX2
	wfNUKeaqclAVH5nj/rhUUN38INIws+qawOeZug9FF
X-Gm-Gg: AYBFou05+N7g4Ta4Dg3JxmcQ+eNNjlveDF8PA/EBEu6iNMpVLOep02g4olP4GsZeV2v
	NnbfUhyYMvUzRjwbR6mF5GCL+ks3vKjDDQsQGwObxeW2l8qHVUi9RCyQiqUjvx7K+HWqFsxD7E4
	/V1HGeWRd3htZFbJkEroGTB5WRNlAulxCc3x2D0Z4Zca9YH5bn6B0Mzgx02uWGucAmNH5yTxEk3
	iCEqd0x5nw9A3WYO3iy3yh8DEUaAmlqkbXfRALLrybRz8M6ljjr8UaBmMWOjrvOonT2H/WyKgrM
	LvdJ76UMfaGc03ybF8XRN3fErmeh9hJdIvnxEwJs2o1NHVb9b811SSoaHf49l+AF26CwPzB+v01
	iPyeh+9mUTJiMRO+CO4odHj8AnCkCNgGIEtnQmpHd4heux4yP+S1gBH/1MRl3P0buj48=
X-Received: by 2002:a05:622a:1f88:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-556a15e9f9bmr6139351cf.4.1794352465509; Tue, 10 Nov 2026
 15:14:25 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com> <avOhhIL1EExpcJBi@google.com>
In-Reply-To: <avOhhIL1EExpcJBi@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 10 Nov 2026 15:14:14 -0800
X-Gm-Features: AclHuK9v8ZNyaAA2Ixe1LvY-E-TihixtplvYY9VkvlWYIDhpnTqSGK04R8mheG0
Message-ID: <CAP-5=fW4FLbm2pmUCC2Xohy4RFxnfoP9_eoOCLmUbeX9cabFnw@mail.gmail.com>
Subject: Re: [PATCH v11 00/20] tools/perf: Adopt kernel compiler-context-analysis.h
 annotations
To: Namhyung Kim <namhyung@kernel.org>
Cc: acme@kernel.org, adrian.hunter@intel.com, bvanassche@acm.org, 
	elver@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:58=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hi Ian,
>
> On Fri, Nov 06, 2026 at 08:40:41PM -0800, Ian Rogers wrote:
> > The perf tool previously added Clang thread-safety annotations in
> > tools/perf/util/mutex.h (GUARDED_BY, LOCKABLE, EXCLUSIVE_LOCK_FUNCTION,
> > UNLOCK_FUNCTION, etc.). Since then, the Linux kernel has adopted a
> > unified set of static context analysis macros and attributes in
> > include/linux/compiler-context-analysis.h (context_lock_struct,
> > __guarded_by, __acquires, __releases, __must_hold, etc.).
> >
> > This series makes tools/include/linux/compiler-context-analysis.h
> > functional by synchronizing it and the required compiler_types.h helper=
s
> > with the kernel headers, converts tools/perf from its custom mutex.h
> > macros to the kernel-style compiler-context-analysis.h annotations, and
> > expands context analysis coverage across comm, dso/dsos, thread/threads=
,
> > config, intel-tpebs, env, and maps. Along the way, separate preparatory
> > patches fix an unlocked __dsos__add() call and TOCTOU race in
> > __machine__addnew_vdso(), skip BPF and OOL DSOs in
> > dsos__find_kernel_dso(), ensure DSOs created in auxtrace, machine, and
> > symbol helpers belong to a dsos collection, avoid dropping
> > _dso__data_open_lock in dso__list_del() under REFCNT_CHECKING, switch
> > dso__data_open_lock and tpebs_mtx to DEFINE_MUTEX(), add a read-lock
> > fast path to dsos__findnew_id(), fix an unlocked read of
> > tpebs_reader_thread and double-close of tpebs_cmd.out in intel-tpebs,
> > avoid a potential read-to-write deadlock in maps__load_first(), and fix
> > map index lookup fallback and removal in maps.
> >
> > This series was developed and reviewed with assistance from an AI codin=
g
> > agent (Gemini 3.1 Pro) and reviewed with Sashiko.
>
> Is there any chance other tools than perf can be affected by this
> change?

So previously the annotations were in tools/perf/util in mutex.h
directory, the common context annotations didn't exist under tools/
and so this patch adds them. As such there are no existing users in
tools/ and no impact to other tools.
The minor kernel change avoids an unused parameter warning, but
shouldn't impact anything.

> How can I check this?  Does it require specific build flags?  Does it
> work with GCC as well?  Can we extend the build test to validate this
> automatically?

Building with clang/llvm is sufficient and already covered by the
build-test. I wanted this so the previous Abseil-style lock
annotations would be tested. The changes here rename the annotations
to match the kernel and then adds use of __guarded_by for better
correctness (and fixing the bugs this discovered on the way).

I'm working on a v12 to fix the Sashiko TPEBS finding.

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > v11:
> >   - Rebase onto perf-tools-next.
> >   - Add Fixes tags to patches 7, 15, and 18.
> >   - Serialize tpebs_send_record_cmd() with teardown via
> >     tpebs_cmd_in_flight and tpebs_cmd_cond, check
> >     check_if_command_finished(&tpebs_cmd) under tpebs_mtx only when not
> >     stopping, guard evsel__tpebs_open() against a concurrent tpebs_stop=
()
> >     with a generation counter (tpebs_gen) and tpebs_stopping across
> >     closing the fds and finish_command(), and annotate tpebs_cmd,
> >     control_fd, ack_fd, tpebs_stopping, tpebs_cmd_in_flight, and
> >     tpebs_gen with __guarded_by(&tpebs_mtx) in patch 17.
> >
> > v10:
> >   - Split the maps__load_first() lock inversion fix (patch 18) from the
> >     maps index lookup and removal fixes (patch 19).
> >   - Fall back to the linear pointer scan in maps__by_address_index() an=
d
> >     maps__by_name_index() when bsearch() returns NULL, check
> >     map__start(prev) < map__start(new) in __maps__insert(), factor out
> >     __maps__remove_at() so maps__remove_maps() removes at index i
> >     directly without risking an infinite loop, guard against -1 index
> >     wraparound in maps__find_next_entry(), refresh sort invariants in
> >     maps__fixup_end() and machine__create_kernel_maps(), and add a unit
> >     test in tests/maps.c.
> >
> > v9:
> >   - Rebase onto perf-tools-next (resolving the conflict in
> >     tools/include/linux/compiler.h with ASSERT_STATIC_STORAGE() and
> >     converting the newly added dso__set_symsrc_filename() lock
> >     annotation in tools/perf/util/dso.h).
> >   - Move __must_hold_shared(&dsos->lock) on __dsos__find() from patch 1=
3
> >     into patch 7 where __dsos__find() is introduced so every commit in
> >     the series builds cleanly with -Wthread-safety.
> >
> > v8:
> >   - Set DSO_BINARY_TYPE__BPF_IMAGE for non-OOL ksymbol DSOs in
> >     machine__process_ksymbol_register() and skip
> >     DSO_BINARY_TYPE__BPF_PROG_INFO, DSO_BINARY_TYPE__BPF_IMAGE, and
> >     DSO_BINARY_TYPE__OOL in dsos__find_kernel_dso_cb() so that
> >     dsos__find_kernel_dso() does not match ksymbol DSOs in
> >     machine->dsos (patch 8).
> >   - Split the dsos__add() additions in auxtrace, machine, and symbol in=
to
> >     a standalone patch (patch 9) before "perf dso: Pass dso_data to
> >     close_data_fd() and dso__list_del()" (patch 10).
> >
> > v7:
> >   - Add newly created DSOs in machine__process_ksymbol_register() and
> >     dso__split_kallsyms() to machine->dsos so assert(dso__dsos(dso)) in
> >     dso__list_add() always holds.
> >   - Add __guarded_by(&config_mutex) to function-local static parser
> >     buffers in parse_value() and perf_parse_file().
> >   - Remove from maps_by_name before calling
> >     map__put(maps_by_address[address_idx]) in __maps__remove() so
> >     callers such as maps__remove_maps() that pass maps_by_address[i] as
> >     map do not use a freed handle in maps__by_name_index() under
> >     REFCNT_CHECKING.
> >
> > v6:
> >   - Rebase onto perf-tools-next.
> >
> > v5:
> >   - Hold machine->dsos.lock in write mode across machine->vdso_info
> >     initialization and temporary file creation in
> >     machine__findnew_vdso() and __machine__findnew_compat(), and
> >     annotate __machine__addnew_vdso() with
> >     __must_hold(&machine->dsos.lock).
> >   - Reset tpebs_cmd.pid =3D 0 and return early without setting
> >     t->started =3D true if start_command() fails in
> >     evsel__tpebs_start_perf_record().
> >
> > v4:
> >   - Place the DSO loaded in addr_filter__resolve_syms() into a dsos
> >     collection so dso__dsos(dso) is populated.
> >   - Join tpebs_reader_thread on error in evsel__tpebs_open(), document
> >     why tpebs_cmd.pid is cleared before pthread_join() in tpebs_stop(),
> >     and include <pthread.h> and <signal.h> in util/intel-tpebs.c.
> >   - Include <string.h> in util/maps.c.
> >
> > v3:
> >   - Rebase onto perf-tools-next (converting the newly added
> >     dso__find_binary_type() lock annotations in util/dso.c).
> >   - Separate bug fixes, DEFINE_MUTEX() cleanups, and improvements (vdso=
,
> >     dso_data, dso__data_open_lock, dsos__findnew_id, intel-tpebs,
> >     tpebs_mtx, maps) from the annotation patches.
> >   - Move AI coding assistant attribution to the cover letter and drop
> >     per-commit Assisted-by tags per linux-next
> >     Documentation/process/coding-assistants.rst.
> >   - Add Marco Elver's Reviewed-by to patch 1.
> >   - Define __diag_clang_23() and Clang ASM_INPUT_G/ASM_INPUT_RM/
> >     ASM_OUTPUT_RM overrides in tools/include/linux/compiler-gcc.h.
> >   - Probe for -Wthread-safety-pointer/-Wthread-safety-beta in
> >     Makefile.config.
> >   - Pass write_locked to __dsos__find().
> >   - Pass struct dso_data * to close_data_fd() and dso__list_del() to
> >     remove the REFCNT_CHECKING dso pointer from struct dso_data and
> >     avoid dropping dso__data_open_lock in dso__list_del(), and include
> >     <assert.h> in util/dso.c.
> >   - Re-validate DSO lookup under the write lock in dsos__findnew_id()
> >     via __dsos__findnew_id(), and handle NULL dso_id in
> >     dso__needs_improve_id(), __dso__improve_id(), and dso_id__cmp().
> >   - Reset tpebs_cmd.out =3D -1 if start_command() fails and include
> >     <stdint.h>, <stdlib.h>, <string.h>, and <unistd.h> in
> >     util/intel-tpebs.c.
> >   - Bounds-check the index in __maps__remove() (freeing maps_by_name if
> >     out of bounds).
> >
> > v2:
> >   - Use -c rather than -E when probing for
> >     -fexperimental-late-parse-attributes in Makefile.config to avoid
> >     -Werror,-Wunused-command-line-argument.
> >   - Acquire machine->dsos.lock in write mode across duplicate checking,
> >     dso__set_long_name(), and __dsos__add() in __machine__addnew_vdso()=
.
> >   - Avoid dropping dso__data_open_lock in dso__list_del() under
> >     REFCNT_CHECKING.
> >   - Pass tpebs_cmd.out directly to __sample_reader() and set
> >     tpebs_cmd.out =3D -1 in evsel__tpebs_open() to avoid a double-close=
 in
> >     tpebs_stop(), and clarify the config_set_mutex comment.
> >   - Drop maps__lock before calling map__load() in maps__load_first() to
> >     avoid a read-to-write self-deadlock when loading kernel maps insert=
s
> >     additional trampoline maps.
> >
> > Ian Rogers (20):
> >   compiler-context-analysis: Avoid unused parameter warning in
> >     _context_unsafe_alias()
> >   tools headers compiler: Synchronize compiler_types.h with the kernel
> >     sources
> >   tools headers: Synchronize linux/compiler-context-analysis.h with the
> >     kernel sources
> >   perf mutex: Use kernel style compiler-context-analysis.h annotations
> >   perf build: Enable additional Clang thread-safety flags
> >   perf comm: Add __guarded_by annotations to struct comm_strs
> >   perf vdso: Fix unlocked __dsos__add() and race in
> >     __machine__addnew_vdso()
> >   perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
> >   perf dsos: Ensure DSOs in auxtrace, machine, and symbol are in dsos
> >   perf dso: Pass dso_data to close_data_fd() and dso__list_del()
> >   perf dso: Use DEFINE_MUTEX for dso__data_open_lock
> >   perf dsos: Use read lock fast path in dsos__findnew_id()
> >   perf dso: Expand context analysis annotations
> >   perf thread: Expand context analysis annotations to threads and
> >     namespaces_lock
> >   perf intel-tpebs: Fix race in tpebs_stop() and tpebs_cmd.out fd
> >     handling
> >   perf intel-tpebs: Use DEFINE_MUTEX for tpebs_mtx
> >   perf config, intel-tpebs, env: Add __guarded_by and __must_hold
> >     annotations
> >   perf maps: Fix lock inversion in maps__load_first()
> >   perf maps: Fix map index lookup fallback and removal
> >   perf maps: Add context analysis annotations
> >
> >  include/linux/compiler-context-analysis.h     |   2 +-
> >  .../include/linux/compiler-context-analysis.h | 518 ++++++++++++++++--
> >  tools/include/linux/compiler-gcc.h            |  72 ++-
> >  tools/include/linux/compiler.h                |  50 +-
> >  tools/include/linux/compiler_types.h          | 206 ++++++-
> >  tools/perf/Makefile.config                    |   8 +-
> >  tools/perf/builtin-sched.c                    |  16 +-
> >  tools/perf/builtin-top.c                      |   4 +-
> >  tools/perf/check-headers.sh                   |   1 +
> >  tools/perf/tests/dso-data.c                   |   4 +
> >  tools/perf/tests/maps.c                       | 140 +++++
> >  tools/perf/util/annotate.c                    |   4 +-
> >  tools/perf/util/annotate.h                    |   8 +-
> >  tools/perf/util/auxtrace.c                    |  16 +-
> >  tools/perf/util/bpf-event.h                   |   5 +-
> >  tools/perf/util/comm.c                        |  10 +-
> >  tools/perf/util/config.c                      |  47 +-
> >  tools/perf/util/dso.c                         | 140 +++--
> >  tools/perf/util/dso.h                         |  17 +-
> >  tools/perf/util/dsos.c                        |  34 +-
> >  tools/perf/util/dsos.h                        |  12 +-
> >  tools/perf/util/env.c                         |   1 +
> >  tools/perf/util/env.h                         |  19 +-
> >  tools/perf/util/intel-tpebs.c                 | 206 ++++---
> >  tools/perf/util/libbfd.c                      |   4 +-
> >  tools/perf/util/machine.c                     |  34 +-
> >  tools/perf/util/maps.c                        | 216 +++++---
> >  tools/perf/util/mutex.c                       |   4 +-
> >  tools/perf/util/mutex.h                       |  90 +--
> >  tools/perf/util/rwsem.c                       |   8 +-
> >  tools/perf/util/rwsem.h                       |  10 +-
> >  tools/perf/util/symbol.c                      |   4 +
> >  tools/perf/util/thread.c                      |  10 +-
> >  tools/perf/util/thread.h                      |  30 +-
> >  tools/perf/util/threads.c                     |   4 +
> >  tools/perf/util/threads.h                     |   6 +-
> >  tools/perf/util/vdso.c                        |  53 +-
> >  37 files changed, 1477 insertions(+), 536 deletions(-)
> >
> >
> > base-commit: 13a8d580433a3b72b10be34f0e26787fe5659d3c
> > --
> > 2.56.0.455.g6c5a503b38-goog
> >

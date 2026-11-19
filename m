Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795106385;
	b=wus41UsA2fVZkVGLFu5EHYekRskFLEqx5pIemvezQSTqC3OJk7HB7k63LfreQALUnJ/X
	 WqQjhkregH+byuyShEsEEk3YRCtf8fNMELeyW7GcjJvYdJYaVVRq5bpLvwYzFLsxOA9Ja
	 ASucDVdbic5p6BXGH7amNO8sT+CU+sGgHYtlpYIQR2YlQIIJKyN2KJb+zImR0Fg74/5Rn
	 XOJ/udLin/LwJLzfrYQh2pm2FKitEHdbuB2T8ZJfkuAH7uRj+2A3rYBR+0FpKmJ7bDml+
	 w7Pk9Z8cmrWuM4DT2qtlx3fPiqa7kO1p87iTvYX5Q9RtPXew31GCbun5IBgBMOoIVYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QZgYvU7eym+6lMDcaT36H7kwBZLKrQ+fCTbEjV93l7A=;
	b=cYjFrzX2B3MXx4POIjtSX1XUOhoj12bXNKwGrPvrPOzHglHruDIu77tbUKbEReYM2FXM
	 fcBs4qee0RMjpd8D903TnjleL/+5ZNAAYQTTT6DLWlbIKLXFHiBeXifeimMKTUh8eTxuK
	 Kga7M3zHtmjUa2BPZvdFY2rQtOMoTbFriNRB2La7DuFIzqOgArDoRrQO8D7aqnISlqSUO
	 58TtGO0NRAJfXlleVIW2xQzcJQV/+4ucRJFkqy5wswIa25G4Fqvty3eD2o36OErbbh81m
	 i8ONqKu6yKKtSddVlJvIHnDs48MJaZ7DQKcfrsGtLxhpazJhn5HSUz0EGP/IxMKaVYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AATiAYs0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803A6606A333
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 16:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 803A6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AATiAYs0
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55c7445cf85so347881cf.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 08:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795106383; cv=none;
        d=google.com; s=arc-20260327;
        b=PCZHbP/qAmPn5NVoomvIbiqspfJ1Z0Xm5T0Ko4UaaHNREvvyim47RiqwQGZNH/WKaW
         LXIqKjmD9nfbIVvUl7VQYPlT4zXCadLVW0gq73Ioy1AZh89DHP2JnHcHdTuMab9rSqY9
         n8+96HSf78xS54pA5lYPZPlnClGxs5DojatktCMWTI/D9PIZD4j1Yv5hTM4A4NSe+o8O
         U9IxcKjcLauGQcaeH6qIlIy64EiR0c69qTLl5Km3oVVNQXKIDqvIh0o04aGroX21wG+Q
         exd9WuxVKN+4tFWuebzBdJWYHnLVCv6eGdAeMsf33bgDEIuQVZgK7fs085036NPVx4Yh
         rooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QZgYvU7eym+6lMDcaT36H7kwBZLKrQ+fCTbEjV93l7A=;
        fh=65ucQ9zr2APxooFQB5Y5zQo9xZEtE4sUZfQVPE3YNIk=;
        b=HMOAck982LS/akRSW51OheMyqHIX4BV/2DLdqGC3At5amIsGZzh814GC+bGzpmvpVj
         5sS8sxGf069pdjHMrr4iO60HHbAUCM3DaERAQT1s64lZoVQF1Q2IMWhD0KQpyEWinN2O
         rDturUWHmdGFM9MnIzQjLoe2zHMbpDtDqKxTm+BBBsSyHhnEikIyZRA/G3LnY2czJ47X
         3GG13eYd4EjXXz0LT4s9RpvpcIViuEC9Z/hGEoAD4KzrrGRbBpBN8U136L7JVDc5vrdC
         rqE2i8UCSv8RdIzEpYGq+AzYlNUucIUsnz3TuOVEfwHDo/u9mNzmdb8qAQ25HObpaTM5
         1z1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795106383; x=1795711183; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZgYvU7eym+6lMDcaT36H7kwBZLKrQ+fCTbEjV93l7A=;
        b=AATiAYs07GCM8Iuh6pR7kWZmRhhurjSwUrFj+Fv8JY6d0Zo7NzAxXZb/eQRXq7Ip+q
         B2rktShvlFuZLErpu77iTUS266DFKFQBcf7epEnF8ZBWaLtMTTTE1ID4yFvvYi/hL77G
         VOCRWeTQ2lOiX9fKOVZT7LPcZTjxNDz0aR6a6Seachic1jwBC4m8my281uoMEHzH5NDe
         V0XAgKQBHdv9j3zQ92yVnKEgzRdy4LMcDUvLYM+wz3Byw7xxtBTvfXRE/tCtMrxLUexZ
         liCLTrAtIoqP85AL/W0m5CsElm8p5xd7dLkA85UO5he4nkNP2myxREQtIrm010nBsKqY
         c1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106383; x=1795711183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZgYvU7eym+6lMDcaT36H7kwBZLKrQ+fCTbEjV93l7A=;
        b=dgcCwxLvuWHgKzU0cm8f8QfO8j2Mb8Zvz++XCEMdwpPZ2JPd5JBDprV1+vw6VJbnnf
         WZ5bmXK6O4TZ/YkOF1EI5acmEQuTBPuHOEyrH1wk8jlFL0PjLXwXUAY/zkwB/k4OYvX5
         fNWeVChGaBvexzC6nPisbjiWdGU+LvIMXVxyYZiEGCD0R4qKZUoR5iMKEBSEozr08uPM
         mHr3kYtv6kekm2n9Ij5sLZtP14n50YqIhfSsgYj7xlGATak5TxzTRCh0uh0O/2mMhaC5
         J+Naagy77VfoxMJfmFQanmBPgHZ8CLV6lvEFJ7iS52kyioI+KUkAVdNznWOMooPiwDJ8
         Wsaw==
X-Forwarded-Encrypted: i=1; AL+hErGM8rIY2K+3R7gR4wAj4PbpdjcS4kuZ5YBPq47XlPagJp2dtUgQ45XQMak2STF7daBzwP6m@lists.linux.dev
X-Gm-Message-State: APuU4Z8tdL86wDftmoNC8DtUAu+QZ7WZmtRztHHqr9LFRiodOn8lRw3m
	EAgT+/CELKkYkc7bekO8q+dyOQ4fagB6i+iBIRtAPfB6QprcEyI+sRWtje6XfZCk71m7UFaRzAD
	hbeqXMb8+hAdbEsLZMVpEkoaxrS3YZmRuu9W8jeTv
X-Gm-Gg: AYBFou1Vj0KhbqTZqQP1KU5EHGmENb6LZ+XvgxoeH4SFWfiBivJvxQ2HnP6HPewk3gl
	Wsfz36gEeV9H/l6Xhnoesdj5TDcZodGwmap/CeAPVK8S/8WqJ4Hk4SNbWpY0llun2FZ7oO/kJet
	qbKI6cjM7BJRHrQ+d9qrb1zf7Qip9JdBGJ61lX7OeXpjwKg528w1Cc4RbsNanZa/vsREYd8JyIC
	s7yvUa79uoI6SsQRgDzxN5xMwZ13UWuOUiwokcX6DvCg9Ao5UGUGuu7QBKYOo4eg4YRlMFgrlun
	TixjC/bZ/ICjLq5whMaazZbd3F29wmpI0EZCarmDZWEmLYB49qHTWIYb5DmZC8OA+AEizSR0UJA
	lHwuZsyOC1rEKNelcCvLVnTgkdoH8YWap58BN5DTVwIo/xj2kZJht28OPxFU=
X-Received: by 2002:a05:622a:1e95:b0:55b:ab4a:6fad with SMTP id
 d75a77b69052e-55d6f2ee177mr11384171cf.9.1795106382365; Thu, 19 Nov 2026
 08:39:42 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 19 Nov 2026 08:39:31 -0800
X-Gm-Features: Aa3M54oEAtzUo1O6L9OpyLmsaNSRCcj6uhOG4546z35DOIs3DLm5JDdREmZI0CU
Message-ID: <CAP-5=fXUg_bDxprNnL6x244zRse2UK1OAUVT13Fvg6PWTHWeYw@mail.gmail.com>
Subject: Re: [PATCH v13 00/21] tools/perf: Adopt kernel compiler-context-analysis.h
 annotations
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 8:41=E2=80=AFAM Ian Rogers <irogers@google.com> wro=
te:
>
> The perf tool previously added Clang thread-safety annotations in
> tools/perf/util/mutex.h (GUARDED_BY, LOCKABLE, EXCLUSIVE_LOCK_FUNCTION,
> UNLOCK_FUNCTION, etc.). Since then, the Linux kernel has adopted a
> unified set of static context analysis macros and attributes in
> include/linux/compiler-context-analysis.h (context_lock_struct,
> __guarded_by, __acquires, __releases, __must_hold, etc.).
>
> This series makes tools/include/linux/compiler-context-analysis.h
> functional by synchronizing it and the required compiler_types.h helpers
> with the kernel headers, converts tools/perf from its custom mutex.h
> macros to the kernel-style compiler-context-analysis.h annotations, and
> expands context analysis coverage across comm, dso/dsos, thread/threads,
> config, intel-tpebs, env, and maps. Along the way, separate preparatory
> patches fix an unlocked __dsos__add() call and TOCTOU race in
> __machine__addnew_vdso(), skip BPF and OOL DSOs in
> dsos__find_kernel_dso(), ensure DSOs created in auxtrace, machine, and
> symbol helpers belong to a dsos collection, avoid dropping
> _dso__data_open_lock in dso__list_del() under REFCNT_CHECKING, switch
> dso__data_open_lock and tpebs_mtx to DEFINE_MUTEX(), add a read-lock
> fast path to dsos__findnew_id(), fix an unlocked read of
> tpebs_reader_thread and double-close of tpebs_cmd.out in intel-tpebs,
> avoid a potential read-to-write deadlock in maps__load_first(), and fix
> map index lookup fallback and removal in maps.
>
> This series was developed and reviewed with assistance from an AI coding
> agent (Gemini 3.1 Pro) and reviewed with Sashiko.
>
> v13:
>   - Rebase onto perf-tools-next.
>   - Factor out dso__is_bpf_prog() for dsos__find_kernel_dso_cb() and
>     check ksym_type =3D=3D PERF_RECORD_KSYMBOL_TYPE_BPF &&
>     is_bpf_image(event->ksymbol.name) before setting
>     DSO_BINARY_TYPE__BPF_IMAGE in machine__process_ksymbol_register()
>     (Namhyung).
>   - Prioritize build IDs over inode fields in __dso_id__cmp(),
>     dso__needs_improve_id(), and __dso__improve_id() so an existing DSO
>     with a defined build ID is not updated with inode metadata
>     (Namhyung).
>   - Rewrite patch 15's commit message concisely, fold intel-tpebs lock
>     annotations (with split control_fd/ack_fd declarations) into patch
>     16, and split config and env annotations into standalone patches 17
>     and 18 (Namhyung).

It would be nice to land this series as it touches multiple places in
the code. The series has no Sashiko reported issues:
https://sashiko.dev/#/patchset/20261117184844.99889-1-irogers%40google.com
It has also caught some real bugs, and the bulk of it has been pretty
constant. v1 was sent on 10/13/2026.

Thanks,
Ian

> v12:
>   - Rebase onto perf-tools-next.
>   - Newline-terminate control commands in tpebs_send_record_cmd() so
>     consecutive writes cannot coalesce in evlist__ctlfd_recv(), send
>     SIGTERM in tpebs_stop() if ENABLE had not completed (tpebs_enabled,
>     annotated __guarded_by(&tpebs_mtx) in patch 17) or sending STOP
>     fails, and ignore late samples in process_sample_event() once
>     tpebs_stopping is set.
>
> v11:
>   - Rebase onto perf-tools-next.
>   - Add Fixes tags to patches 7, 15, and 18.
>   - Serialize tpebs_send_record_cmd() with teardown via
>     tpebs_cmd_in_flight and tpebs_cmd_cond, check
>     check_if_command_finished(&tpebs_cmd) under tpebs_mtx only when not
>     stopping, guard evsel__tpebs_open() against a concurrent tpebs_stop()
>     with a generation counter (tpebs_gen) and tpebs_stopping across
>     closing the fds and finish_command(), and annotate tpebs_cmd,
>     control_fd, ack_fd, tpebs_stopping, tpebs_cmd_in_flight, and
>     tpebs_gen with __guarded_by(&tpebs_mtx) in patch 17.
>
> v10:
>   - Split the maps__load_first() lock inversion fix (patch 18) from the
>     maps index lookup and removal fixes (patch 19).
>   - Fall back to the linear pointer scan in maps__by_address_index() and
>     maps__by_name_index() when bsearch() returns NULL, check
>     map__start(prev) < map__start(new) in __maps__insert(), factor out
>     __maps__remove_at() so maps__remove_maps() removes at index i
>     directly without risking an infinite loop, guard against -1 index
>     wraparound in maps__find_next_entry(), refresh sort invariants in
>     maps__fixup_end() and machine__create_kernel_maps(), and add a unit
>     test in tests/maps.c.
>
> v9:
>   - Rebase onto perf-tools-next (resolving the conflict in
>     tools/include/linux/compiler.h with ASSERT_STATIC_STORAGE() and
>     converting the newly added dso__set_symsrc_filename() lock
>     annotation in tools/perf/util/dso.h).
>   - Move __must_hold_shared(&dsos->lock) on __dsos__find() from patch 13
>     into patch 7 where __dsos__find() is introduced so every commit in
>     the series builds cleanly with -Wthread-safety.
>
> v8:
>   - Set DSO_BINARY_TYPE__BPF_IMAGE for non-OOL ksymbol DSOs in
>     machine__process_ksymbol_register() and skip
>     DSO_BINARY_TYPE__BPF_PROG_INFO, DSO_BINARY_TYPE__BPF_IMAGE, and
>     DSO_BINARY_TYPE__OOL in dsos__find_kernel_dso_cb() so that
>     dsos__find_kernel_dso() does not match ksymbol DSOs in
>     machine->dsos (patch 8).
>   - Split the dsos__add() additions in auxtrace, machine, and symbol into
>     a standalone patch (patch 9) before "perf dso: Pass dso_data to
>     close_data_fd() and dso__list_del()" (patch 10).
>
> v7:
>   - Add newly created DSOs in machine__process_ksymbol_register() and
>     dso__split_kallsyms() to machine->dsos so assert(dso__dsos(dso)) in
>     dso__list_add() always holds.
>   - Add __guarded_by(&config_mutex) to function-local static parser
>     buffers in parse_value() and perf_parse_file().
>   - Remove from maps_by_name before calling
>     map__put(maps_by_address[address_idx]) in __maps__remove() so
>     callers such as maps__remove_maps() that pass maps_by_address[i] as
>     map do not use a freed handle in maps__by_name_index() under
>     REFCNT_CHECKING.
>
> v6:
>   - Rebase onto perf-tools-next.
>
> v5:
>   - Hold machine->dsos.lock in write mode across machine->vdso_info
>     initialization and temporary file creation in
>     machine__findnew_vdso() and __machine__findnew_compat(), and
>     annotate __machine__addnew_vdso() with
>     __must_hold(&machine->dsos.lock).
>   - Reset tpebs_cmd.pid =3D 0 and return early without setting
>     t->started =3D true if start_command() fails in
>     evsel__tpebs_start_perf_record().
>
> v4:
>   - Place the DSO loaded in addr_filter__resolve_syms() into a dsos
>     collection so dso__dsos(dso) is populated.
>   - Join tpebs_reader_thread on error in evsel__tpebs_open(), document
>     why tpebs_cmd.pid is cleared before pthread_join() in tpebs_stop(),
>     and include <pthread.h> and <signal.h> in util/intel-tpebs.c.
>   - Include <string.h> in util/maps.c.
>
> v3:
>   - Rebase onto perf-tools-next (converting the newly added
>     dso__find_binary_type() lock annotations in util/dso.c).
>   - Separate bug fixes, DEFINE_MUTEX() cleanups, and improvements (vdso,
>     dso_data, dso__data_open_lock, dsos__findnew_id, intel-tpebs,
>     tpebs_mtx, maps) from the annotation patches.
>   - Move AI coding assistant attribution to the cover letter and drop
>     per-commit Assisted-by tags per linux-next
>     Documentation/process/coding-assistants.rst.
>   - Add Marco Elver's Reviewed-by to patch 1.
>   - Define __diag_clang_23() and Clang ASM_INPUT_G/ASM_INPUT_RM/
>     ASM_OUTPUT_RM overrides in tools/include/linux/compiler-gcc.h.
>   - Probe for -Wthread-safety-pointer/-Wthread-safety-beta in
>     Makefile.config.
>   - Pass write_locked to __dsos__find().
>   - Pass struct dso_data * to close_data_fd() and dso__list_del() to
>     remove the REFCNT_CHECKING dso pointer from struct dso_data and
>     avoid dropping dso__data_open_lock in dso__list_del(), and include
>     <assert.h> in util/dso.c.
>   - Re-validate DSO lookup under the write lock in dsos__findnew_id()
>     via __dsos__findnew_id(), and handle NULL dso_id in
>     dso__needs_improve_id(), __dso__improve_id(), and dso_id__cmp().
>   - Reset tpebs_cmd.out =3D -1 if start_command() fails and include
>     <stdint.h>, <stdlib.h>, <string.h>, and <unistd.h> in
>     util/intel-tpebs.c.
>   - Bounds-check the index in __maps__remove() (freeing maps_by_name if
>     out of bounds).
>
> v2:
>   - Use -c rather than -E when probing for
>     -fexperimental-late-parse-attributes in Makefile.config to avoid
>     -Werror,-Wunused-command-line-argument.
>   - Acquire machine->dsos.lock in write mode across duplicate checking,
>     dso__set_long_name(), and __dsos__add() in __machine__addnew_vdso().
>   - Avoid dropping dso__data_open_lock in dso__list_del() under
>     REFCNT_CHECKING.
>   - Pass tpebs_cmd.out directly to __sample_reader() and set
>     tpebs_cmd.out =3D -1 in evsel__tpebs_open() to avoid a double-close i=
n
>     tpebs_stop(), and clarify the config_set_mutex comment.
>   - Drop maps__lock before calling map__load() in maps__load_first() to
>     avoid a read-to-write self-deadlock when loading kernel maps inserts
>     additional trampoline maps.
>
> Ian Rogers (21):
>   compiler-context-analysis: Avoid unused parameter warning in
>     _context_unsafe_alias()
>   tools headers compiler: Synchronize compiler_types.h with the kernel
>     sources
>   tools headers: Synchronize linux/compiler-context-analysis.h with the
>     kernel sources
>   perf mutex: Use kernel style compiler-context-analysis.h annotations
>   perf build: Enable additional Clang thread-safety flags
>   perf comm: Add __guarded_by annotations to struct comm_strs
>   perf vdso: Fix unlocked __dsos__add() and race in
>     __machine__addnew_vdso()
>   perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
>   perf dsos: Ensure DSOs in auxtrace, machine, and symbol are in dsos
>   perf dso: Pass dso_data to close_data_fd() and dso__list_del()
>   perf dso: Use DEFINE_MUTEX for dso__data_open_lock
>   perf dsos: Use read lock fast path in dsos__findnew_id()
>   perf dso: Expand context analysis annotations
>   perf thread: Expand context analysis annotations to threads and
>     namespaces_lock
>   perf intel-tpebs: Fix race in tpebs_stop() and tpebs_cmd.out fd
>     handling
>   perf intel-tpebs: Use DEFINE_MUTEX for tpebs_mtx and add lock
>     annotations
>   perf config: Add __guarded_by and __must_hold annotations
>   perf env: Add __guarded_by and __must_hold annotations
>   perf maps: Fix lock inversion in maps__load_first()
>   perf maps: Fix map index lookup fallback and removal
>   perf maps: Add context analysis annotations
>
>  include/linux/compiler-context-analysis.h     |   2 +-
>  .../include/linux/compiler-context-analysis.h | 518 ++++++++++++++++--
>  tools/include/linux/compiler-gcc.h            |  72 ++-
>  tools/include/linux/compiler.h                |  50 +-
>  tools/include/linux/compiler_types.h          | 206 ++++++-
>  tools/perf/Makefile.config                    |   8 +-
>  tools/perf/builtin-sched.c                    |  16 +-
>  tools/perf/builtin-top.c                      |   4 +-
>  tools/perf/check-headers.sh                   |   1 +
>  tools/perf/tests/dso-data.c                   |   4 +
>  tools/perf/tests/maps.c                       | 140 +++++
>  tools/perf/util/annotate.c                    |   4 +-
>  tools/perf/util/annotate.h                    |   8 +-
>  tools/perf/util/auxtrace.c                    |  16 +-
>  tools/perf/util/bpf-event.h                   |   5 +-
>  tools/perf/util/comm.c                        |  10 +-
>  tools/perf/util/config.c                      |  47 +-
>  tools/perf/util/dso.c                         | 179 +++---
>  tools/perf/util/dso.h                         |  33 +-
>  tools/perf/util/dsos.c                        |  34 +-
>  tools/perf/util/dsos.h                        |  12 +-
>  tools/perf/util/env.c                         |   1 +
>  tools/perf/util/env.h                         |  19 +-
>  tools/perf/util/intel-tpebs.c                 | 226 +++++---
>  tools/perf/util/libbfd.c                      |   4 +-
>  tools/perf/util/machine.c                     |  34 +-
>  tools/perf/util/map.c                         |  14 +-
>  tools/perf/util/maps.c                        | 216 +++++---
>  tools/perf/util/mutex.c                       |   4 +-
>  tools/perf/util/mutex.h                       |  90 +--
>  tools/perf/util/rwsem.c                       |   8 +-
>  tools/perf/util/rwsem.h                       |  10 +-
>  tools/perf/util/symbol.c                      |   4 +
>  tools/perf/util/thread.c                      |  10 +-
>  tools/perf/util/thread.h                      |  30 +-
>  tools/perf/util/threads.c                     |   4 +
>  tools/perf/util/threads.h                     |   6 +-
>  tools/perf/util/vdso.c                        |  53 +-
>  38 files changed, 1531 insertions(+), 571 deletions(-)
>
>
> base-commit: 4af65363b11fc4fe65fcb497f68bbe4f3e3a4d2c
> --
> 2.56.1.703.gf848ed807c-goog
>

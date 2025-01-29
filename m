Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1098D15666D
	for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 00:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738110352; cv=none; b=r7TV7JfJ9b2tonyCJeuIg97FWoEZdqwUcqXFPonlV9EMmAaxEE0rYZwvWOVAdV8EwN0VjQqn2qRirIMlAtQcjcvznj473EdnSMUy/f2Q3PcG9LQuNZfDIdw/8vPgVwhvjZyiTAgPPiJV7yYxQi7rrU/iKgAvQOfifYZ3DXm6lOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738110352; c=relaxed/simple;
	bh=SVTMW1S7JFSDg+bA7DmzZRGGAfUXEG2NGYwvrvXuhZY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ja2Gwlzp0dAvMUdR1dRXJ5+xN7tnq7QwCM18w+BkypygdlT7GhIu6rEbZrT1IvtBEPzcYRijv+0Ky3YQlgpxGaMPjNQhtQaYD42UU5fm+NjvuIxTMEZXwbDy729IjOEy58PKgi6LdrVBEDddsc1pXNM+dRDIQ59lolf/VidA0ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ME3sYBVC; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ME3sYBVC"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef91d5c863so12758969a91.2
        for <llvm@lists.linux.dev>; Tue, 28 Jan 2025 16:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738110350; x=1738715150; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/FqegXtUqY4HfJigVh80j6ehxCeSFMBdL2Y3cibZPD8=;
        b=ME3sYBVC2rnp+wzKc5TsUUkVxjpZzSL75ZIszb2uBx43JTpMRep6BqJ+H6lvfiiaZR
         v5CZyQPGj91yxuFCyadt/qVs9AXk/A+efeH1nlUGlBqtiFG8XX7etSGt6K2lkmFKLuPg
         Oo/sl28DmJxY8coWVHaE1d8Z0UQa51k5iuwD+98p3JghIP6iH30069JRywBX/MIk7Bx3
         /N0UumHS8UliYusLnXczuvRsAjfW7agwJsx4oPRaVK6OrloKAGgsItudJ8MuWPmxhPMK
         Vgw7XHxyQ9TTxw3UXvwVo0s57Nem5AeaMglhamLipul3Mk79fkwZfWv95BmrVgcQjCt7
         en+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738110350; x=1738715150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/FqegXtUqY4HfJigVh80j6ehxCeSFMBdL2Y3cibZPD8=;
        b=oLmjorks14kYXznYGeqnWO2c0r4PZgpQ3iW8bvNtr8ykyMhg7zInEy26T+1Jyui/X5
         D7lww4FV15n9bxUfN1CymZcnozqoLXrhRIKjLPMQNorN6Jpos73jKGBYcO1PWBG1Xw0/
         YdP253h1BOkOdLm5schLB79L6767KBm2RW99oUwur0rMHHaZPPM1CWhxk0b95Mzs/Jt0
         RXWGqJDABOxDVMRbRzskpbZOvkyrq6I9W0NmXqTJwLLtxI0RVJzH+Y/vDrHaGk2SFl3A
         cePKWr/tO0gQKGcADn2iJ5eBKFRXH5MzYEdwQwtFmhM/TIrLyU0j9Y2/+dfRenqhDnTk
         ATQA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ721mPHD4Jk1mNMTA97F33Xl7Mxp9UC0MLeJdL9W7g7FQjhe/520I45DknJ5d83R9ekA1@lists.linux.dev
X-Gm-Message-State: AOJu0YwauXyOHgPququl6s2ARv7vsrlaCIf07+g9JvgdUeMFzNMxe42g
	6JzASefWun3WUi+6gk8GAn5OjZS1ihStsMoHr1su0TSr4mW+97nLnuZuAlnERBacEhA8v30R9Tg
	BMQ==
X-Google-Smtp-Source: AGHT+IHTLBUhEsTI+ojUVsezlYeIKuENRrT3nfo1YAKzsVdV0xdMPKwAv1CFbEaTsZ8jmOKgYykzXqLPQG0=
X-Received: from pfbay19.prod.google.com ([2002:a05:6a00:3013:b0:725:eeaa:65e2])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d0f:b0:725:96f2:9e63
 with SMTP id d2e1a72fcca58-72fd0c7cb59mr1768559b3a.24.1738110350325; Tue, 28
 Jan 2025 16:25:50 -0800 (PST)
Date: Tue, 28 Jan 2025 16:14:58 -0800
In-Reply-To: <20250129001905.619859-1-ctshao@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250129001905.619859-1-ctshao@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129001905.619859-3-ctshao@google.com>
Subject: [PATCH v3 2/5] perf lock: Retrieve owner callstack in bpf program
From: Chun-Tse Shao <ctshao@google.com>
To: linux-kernel@vger.kernel.org
Cc: Chun-Tse Shao <ctshao@google.com>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Tracing owner callstack in `contention_begin()` and `contention_end()`,
and storing in `owner_stat` bpf map.

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 .../perf/util/bpf_skel/lock_contention.bpf.c  | 237 +++++++++++++++++-
 1 file changed, 235 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/bpf_skel/lock_contention.bpf.c b/tools/perf/util/bpf_skel/lock_contention.bpf.c
index b4961dd86222..1ad2a0793c37 100644
--- a/tools/perf/util/bpf_skel/lock_contention.bpf.c
+++ b/tools/perf/util/bpf_skel/lock_contention.bpf.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 // Copyright (c) 2022 Google
+#include "linux/bpf.h"
 #include "vmlinux.h"
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
@@ -7,6 +8,7 @@
 #include <asm-generic/errno-base.h>
 
 #include "lock_data.h"
+#include <time.h>
 
 /* for collect_lock_syms().  4096 was rejected by the verifier */
 #define MAX_CPUS  1024
@@ -31,7 +33,7 @@ struct {
 struct {
 	__uint(type, BPF_MAP_TYPE_HASH);
 	__uint(key_size, sizeof(__u64)); // owner stacktrace
-	__uint(value_size, sizeof(__u64)); // owner stack id
+	__uint(value_size, sizeof(__s32)); // owner stack id
 	__uint(max_entries, 1);
 } owner_stacks SEC(".maps");
 
@@ -197,6 +199,9 @@ int data_fail;
 int task_map_full;
 int data_map_full;
 
+struct task_struct *bpf_task_from_pid(s32 pid) __ksym;
+void bpf_task_release(struct task_struct *p) __ksym;
+
 static inline __u64 get_current_cgroup_id(void)
 {
 	struct task_struct *task;
@@ -420,6 +425,27 @@ static inline struct tstamp_data *get_tstamp_elem(__u32 flags)
 	return pelem;
 }
 
+static inline s32 get_owner_stack_id(u64 *stacktrace)
+{
+	s32 *id;
+	static s32 id_gen = 1;
+
+	id = bpf_map_lookup_elem(&owner_stacks, stacktrace);
+	if (id)
+		return *id;
+
+	// FIXME: currently `a = __sync_fetch_and_add(...)` cause "Invalid usage of the XADD return
+	// value" error in BPF program: https://github.com/llvm/llvm-project/issues/91888
+	bpf_map_update_elem(&owner_stacks, stacktrace, &id_gen, BPF_NOEXIST);
+	__sync_fetch_and_add(&id_gen, 1);
+
+	id = bpf_map_lookup_elem(&owner_stacks, stacktrace);
+	if (id)
+		return *id;
+
+	return -1;
+}
+
 SEC("tp_btf/contention_begin")
 int contention_begin(u64 *ctx)
 {
@@ -437,6 +463,91 @@ int contention_begin(u64 *ctx)
 	pelem->flags = (__u32)ctx[1];
 
 	if (needs_callstack) {
+		u32 i = 0;
+		u32 id = 0;
+		int owner_pid;
+		u64 *buf;
+		struct task_struct *task;
+		struct owner_tracing_data *otdata;
+
+		if (!lock_owner)
+			goto skip_owner_begin;
+
+		task = get_lock_owner(pelem->lock, pelem->flags);
+		if (!task)
+			goto skip_owner_begin;
+
+		owner_pid = BPF_CORE_READ(task, pid);
+
+		buf = bpf_map_lookup_elem(&stack_buf, &i);
+		if (!buf)
+			goto skip_owner_begin;
+		for (i = 0; i < max_stack; i++)
+			buf[i] = 0x0;
+
+		task = bpf_task_from_pid(owner_pid);
+		if (task) {
+			bpf_get_task_stack(task, buf, max_stack * sizeof(unsigned long), 0);
+			bpf_task_release(task);
+		}
+
+		otdata = bpf_map_lookup_elem(&owner_data, &pelem->lock);
+		id = get_owner_stack_id(buf);
+
+		// Contention just happens, or corner case `lock` is owned by process not
+		// `owner_pid`. For the corner case we treat it as unexpected internal error and
+		// just ignore the precvious tracing record.
+		if (!otdata || otdata->pid != owner_pid) {
+			struct owner_tracing_data first = {
+				.pid = owner_pid,
+				.timestamp = pelem->timestamp,
+				.count = 1,
+				.stack_id = id,
+			};
+			bpf_map_update_elem(&owner_data, &pelem->lock, &first, BPF_ANY);
+		}
+		// Contention is ongoing and new waiter joins.
+		else {
+			__sync_fetch_and_add(&otdata->count, 1);
+
+			// The owner is the same, but stacktrace might be changed. In this case we
+			// store/update `owner_stat` based on current owner stack id.
+			if (id != otdata->stack_id) {
+				u64 duration = otdata->timestamp - pelem->timestamp;
+				struct contention_key ckey = {
+					.stack_id = id,
+					.pid = 0,
+					.lock_addr_or_cgroup = 0,
+				};
+				struct contention_data *cdata =
+					bpf_map_lookup_elem(&owner_stat, &ckey);
+
+				if (!cdata) {
+					struct contention_data first = {
+						.total_time = duration,
+						.max_time = duration,
+						.min_time = duration,
+						.count = 1,
+						.flags = pelem->flags,
+					};
+					bpf_map_update_elem(&owner_stat, &ckey, &first,
+							    BPF_NOEXIST);
+				} else {
+					__sync_fetch_and_add(&cdata->total_time, duration);
+					__sync_fetch_and_add(&cdata->count, 1);
+
+					/* FIXME: need atomic operations */
+					if (cdata->max_time < duration)
+						cdata->max_time = duration;
+					if (cdata->min_time > duration)
+						cdata->min_time = duration;
+				}
+
+				otdata->timestamp = pelem->timestamp;
+				otdata->stack_id = id;
+			}
+		}
+skip_owner_begin:
 		pelem->stack_id = bpf_get_stackid(ctx, &stacks,
 						  BPF_F_FAST_STACK_CMP | stack_skip);
 		if (pelem->stack_id < 0)
@@ -473,6 +584,7 @@ int contention_end(u64 *ctx)
 	struct tstamp_data *pelem;
 	struct contention_key key = {};
 	struct contention_data *data;
+	__u64 timestamp;
 	__u64 duration;
 	bool need_delete = false;
 
@@ -499,12 +611,133 @@ int contention_end(u64 *ctx)
 			return 0;
 		need_delete = true;
 	}
-	duration = bpf_ktime_get_ns() - pelem->timestamp;
+	timestamp = bpf_ktime_get_ns();
+	duration = timestamp - pelem->timestamp;
 	if ((__s64)duration < 0) {
 		__sync_fetch_and_add(&time_fail, 1);
 		goto out;
 	}
 
+	if (needs_callstack && lock_owner) {
+		u64 owner_time;
+		struct contention_key ckey = {};
+		struct contention_data *cdata;
+		struct owner_tracing_data *otdata;
+
+		otdata = bpf_map_lookup_elem(&owner_data, &pelem->lock);
+		if (!otdata)
+			goto skip_owner_end;
+
+		// Update `owner_stat`.
+		owner_time = timestamp - otdata->timestamp;
+		ckey.stack_id = otdata->stack_id;
+		cdata = bpf_map_lookup_elem(&owner_stat, &ckey);
+
+		if (!cdata) {
+			struct contention_data first = {
+				.total_time = owner_time,
+				.max_time = owner_time,
+				.min_time = owner_time,
+				.count = 1,
+				.flags = pelem->flags,
+			};
+			bpf_map_update_elem(&owner_stat, &ckey, &first, BPF_NOEXIST);
+		} else {
+			__sync_fetch_and_add(&cdata->total_time, owner_time);
+			__sync_fetch_and_add(&cdata->count, 1);
+
+			/* FIXME: need atomic operations */
+			if (cdata->max_time < owner_time)
+				cdata->max_time = owner_time;
+			if (cdata->min_time > owner_time)
+				cdata->min_time = owner_time;
+		}
+
+		// No contention is occurring, delete `lock` entry in `owner_data`.
+		if (otdata->count <= 1)
+			bpf_map_delete_elem(&owner_data, &pelem->lock);
+		// Contention is still ongoing, with a new owner (current task). `owner_data`
+		// should be updated accordingly.
+		else {
+			u32 i = 0;
+			u64 *buf;
+
+			// FIXME: __sync_fetch_and_sub(&otdata->count, 1) causes compile error.
+			otdata->count--;
+
+			buf = bpf_map_lookup_elem(&stack_buf, &i);
+			if (!buf)
+				goto skip_owner_end;
+			for (i = 0; i < (u32)max_stack; i++)
+				buf[i] = 0x0;
+
+			// ctx[1] has the return code of the lock function.
+			// If ctx[1] is not 0, the current task terminates lock waiting without
+			// acquiring it. Owner is not changed, but we still need to update the owner
+			// stack.
+			if (!ctx[1]) {
+				s32 id = 0;
+				struct task_struct *task = bpf_task_from_pid(otdata->pid);
+
+				if (task) {
+					bpf_get_task_stack(task, buf,
+							   max_stack * sizeof(unsigned long), 0);
+					bpf_task_release(task);
+				}
+
+				id = get_owner_stack_id(buf);
+
+				// If owner stack is changed, update `owner_data` and `owner_stat`
+				// accordingly.
+				if (id != otdata->stack_id) {
+					u64 duration = otdata->timestamp - pelem->timestamp;
+					struct contention_key ckey = {
+						.stack_id = id,
+						.pid = 0,
+						.lock_addr_or_cgroup = 0,
+					};
+					struct contention_data *cdata =
+						bpf_map_lookup_elem(&owner_stat, &ckey);
+
+					if (!cdata) {
+						struct contention_data first = {
+							.total_time = duration,
+							.max_time = duration,
+							.min_time = duration,
+							.count = 1,
+							.flags = pelem->flags,
+						};
+						bpf_map_update_elem(&owner_stat, &ckey, &first,
+								    BPF_NOEXIST);
+					} else {
+						__sync_fetch_and_add(&cdata->total_time, duration);
+						__sync_fetch_and_add(&cdata->count, 1);
+
+						/* FIXME: need atomic operations */
+						if (cdata->max_time < duration)
+							cdata->max_time = duration;
+						if (cdata->min_time > duration)
+							cdata->min_time = duration;
+					}
+
+					otdata->timestamp = pelem->timestamp;
+					otdata->stack_id = id;
+				}
+			}
+			// If ctx[1] is 0, then update tracinng data with the current task, which is
+			// the new owner.
+			else {
+				otdata->pid = pid;
+				otdata->timestamp = timestamp;
+
+				bpf_get_task_stack(bpf_get_current_task_btf(), buf,
+						   max_stack * sizeof(unsigned long), 0);
+				otdata->stack_id = get_owner_stack_id(buf);
+			}
+		}
+	}
+skip_owner_end:
+
 	switch (aggr_mode) {
 	case LOCK_AGGR_CALLER:
 		key.stack_id = pelem->stack_id;
-- 
2.48.1.262.g85cc9f2d1e-goog


Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A9315534E
	for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 00:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738110427; cv=none; b=Hw7BJ+kAYHpHcSttU92PSJf4rkxFxr8uqjjPwgGvZ4+ssmg6wl0LNq4HcW7j8rB32q2y92nDglEW80ZPR1pVwrfz9IZAbmtMSsK1uvc0ZXYQf3HcD++d6ix+PFmvo0R1hAUP2ViMpE+gjcL5RRfw+zcIUjvQhqv0Y0SjswKLdyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738110427; c=relaxed/simple;
	bh=8Sgp5yu8OBVqSwtXE0quymzsxKTHzx8BbCOes46TEKM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hCTh2sc7O96qvWi7g3oXsl1v721mx3t3P1vKiYGMfl0gkoWZGZnae8SCGwpqgODVdm776rPqpQprCAkWJoYHrJdUDsB/rAXC8NLeNXb7BZbX7IoYseahWUumKHR0nQVczz5XrJG0Eyvsbes3AdPKOX3/+JisC7/5I4HN82nKzJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FF/5vge+; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FF/5vge+"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21650d4612eso167693075ad.2
        for <llvm@lists.linux.dev>; Tue, 28 Jan 2025 16:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738110425; x=1738715225; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sBEvePub/SR9/IDN5Bs+wN21Z641MzpSYW1O9rZmtN0=;
        b=FF/5vge+/+Xvfd7l8rdIBXmuB8iUzZIvGp0XQTprbA5pi5Iv+e/ZVoC2lS3PVj5In9
         RBMNsC2BGG7mOgyJJ2HaLtqAOZOQ7vGJodzyBVFWevG/PcPTsHVN7lROq8qQBwe4QEv+
         yWDM05/Wuie9GklsHnBEh1HYHDEN0FQRmpDZOZxaM3dkg1cSK0CM4Q3Xg8EQDbFb8j5S
         eG/vK6kc0i6xsqljif8rMuP5zVL4Kb4qF3FHDXB386BMz4bRQcUyTWVQH4ZEyXNZ+DSb
         GJdc3INoQUVZdyYwOyn/wfE0oo37m01Y+0w2d0aqW6xCug0IQ6/9M+1yD/wCHtKHXULe
         t0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738110425; x=1738715225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBEvePub/SR9/IDN5Bs+wN21Z641MzpSYW1O9rZmtN0=;
        b=eWEC4rfHRell2Cho5KIe0Suyib1E7GcOHPGLnVvZALyHx7MQm/K8290xX4kxLLy1Di
         fGCy6uGqy0RJCBsPGt5/gsbU8mt5xnXDXrUMga9+8eJ6w8KHlgW6mYSKifMO6jBMavHi
         YOvygALsAqtFX9iln837WFp5LZyW54uoJekKFV6I/aFas6nxlRpsbuNgOWeLofqew4X+
         UGhs/EoG0RDwbclnPm+S/jOX6p+tBByDLga7X5zibLJ1G78yeHZ+e6VvoxJHMmfHwdco
         fc2OCnVGc80DtE14oTiC1jwOjXDb0gXFywM+CaLeoKYfIQBRq8qqFnMfipOksySKrHmg
         MzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWsRDxc8VAUCVBc+aJwqFR34XiLuReb6p9X/AhDnqXgJ14ogWRfrDqxJRMFIky/+sLFDiL@lists.linux.dev
X-Gm-Message-State: AOJu0YwFfklsq/6MSRIDKBb9jxEznLg5u1jKwgHNi0Q4AuROnuSObLdp
	Duw5y97/z3+3bkWTs/wUdBsFIFJC8HSaIkuETb6F7n6yxGuCGjLPScsAdo+fTy8dbrCzVKZ4Vcl
	udg==
X-Google-Smtp-Source: AGHT+IGLXoWuDc+BL3s0utjGdQvHw6YCJ9vbchFUR1aiImf8YniBCyB4qvpzZenwbn+L4cac0UqIBCcC0M0=
X-Received: from pjc3.prod.google.com ([2002:a17:90b:2f43:b0:2ef:7352:9e97])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2446:b0:215:603e:2141
 with SMTP id d9443c01a7336-21dd7c625cemr15041855ad.19.1738110424789; Tue, 28
 Jan 2025 16:27:04 -0800 (PST)
Date: Tue, 28 Jan 2025 16:15:00 -0800
In-Reply-To: <20250129001905.619859-1-ctshao@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250129001905.619859-1-ctshao@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129001905.619859-5-ctshao@google.com>
Subject: [PATCH v3 4/5] perf lock: Report owner stack in usermode
From: Chun-Tse Shao <ctshao@google.com>
To: linux-kernel@vger.kernel.org
Cc: Chun-Tse Shao <ctshao@google.com>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Parse `owner_lock_stat` into a rb tree, and report owner lock stats with
stack trace in order.

Example output:
  $ sudo ~/linux/tools/perf/perf lock con -abvo -Y mutex-spin -E3 perf bench sched pipe
  ...
   contended   total wait     max wait     avg wait         type   caller

         171      1.55 ms     20.26 us      9.06 us        mutex   pipe_read+0x57
                          0xffffffffac6318e7  pipe_read+0x57
                          0xffffffffac623862  vfs_read+0x332
                          0xffffffffac62434b  ksys_read+0xbb
                          0xfffffffface604b2  do_syscall_64+0x82
                          0xffffffffad00012f  entry_SYSCALL_64_after_hwframe+0x76
          36    193.71 us     15.27 us      5.38 us        mutex   pipe_write+0x50
                          0xffffffffac631ee0  pipe_write+0x50
                          0xffffffffac6241db  vfs_write+0x3bb
                          0xffffffffac6244ab  ksys_write+0xbb
                          0xfffffffface604b2  do_syscall_64+0x82
                          0xffffffffad00012f  entry_SYSCALL_64_after_hwframe+0x76
           4     51.22 us     16.47 us     12.80 us        mutex   do_epoll_wait+0x24d
                          0xffffffffac691f0d  do_epoll_wait+0x24d
                          0xffffffffac69249b  do_epoll_pwait.part.0+0xb
                          0xffffffffac693ba5  __x64_sys_epoll_pwait+0x95
                          0xfffffffface604b2  do_syscall_64+0x82
                          0xffffffffad00012f  entry_SYSCALL_64_after_hwframe+0x76

  === owner stack trace ===

           3     31.24 us     15.27 us     10.41 us        mutex   pipe_read+0x348
                          0xffffffffac631bd8  pipe_read+0x348
                          0xffffffffac623862  vfs_read+0x332
                          0xffffffffac62434b  ksys_read+0xbb
                          0xfffffffface604b2  do_syscall_64+0x82
                          0xffffffffad00012f  entry_SYSCALL_64_after_hwframe+0x76
  ...

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 tools/perf/builtin-lock.c             | 20 ++++++++--
 tools/perf/util/bpf_lock_contention.c | 54 +++++++++++++++++++++++++++
 tools/perf/util/lock-contention.h     |  7 ++++
 3 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
index 9bebc186286f..d9b0d7472aea 100644
--- a/tools/perf/builtin-lock.c
+++ b/tools/perf/builtin-lock.c
@@ -42,6 +42,7 @@
 #include <linux/zalloc.h>
 #include <linux/err.h>
 #include <linux/stringify.h>
+#include <linux/rbtree.h>
 
 static struct perf_session *session;
 static struct target target;
@@ -1817,6 +1818,22 @@ static void print_contention_result(struct lock_contention *con)
 			break;
 	}
 
+	if (con->owner && con->save_callstack) {
+		struct rb_root root = RB_ROOT;
+
+		if (symbol_conf.field_sep)
+			fprintf(lock_output, "# owner stack trace:\n");
+		else
+			fprintf(lock_output, "\n=== owner stack trace ===\n\n");
+		while ((st = pop_owner_stack_trace(con)))
+			insert_to(&root, st, compare);
+
+		while ((st = pop_from(&root))) {
+			print_lock_stat(con, st);
+			zfree(st);
+		}
+	}
+
 	if (print_nr_entries) {
 		/* update the total/bad stats */
 		while ((st = pop_from_result())) {
@@ -1962,9 +1979,6 @@ static int check_lock_contention_options(const struct option *options,
 		}
 	}
 
-	if (show_lock_owner)
-		show_thread_stats = true;
-
 	return 0;
 }
 
diff --git a/tools/perf/util/bpf_lock_contention.c b/tools/perf/util/bpf_lock_contention.c
index 795e2374facc..cf3267e46589 100644
--- a/tools/perf/util/bpf_lock_contention.c
+++ b/tools/perf/util/bpf_lock_contention.c
@@ -549,6 +549,60 @@ static const char *lock_contention_get_name(struct lock_contention *con,
 	return name_buf;
 }
 
+struct lock_stat *pop_owner_stack_trace(struct lock_contention *con)
+{
+	int stacks_fd, stat_fd;
+	u64 *stack_trace;
+	s32 stack_id;
+	struct contention_key ckey = {};
+	struct contention_data cdata = {};
+	size_t stack_size = con->max_stack * sizeof(*stack_trace);
+	struct lock_stat *st;
+	char name[KSYM_NAME_LEN];
+
+	stacks_fd = bpf_map__fd(skel->maps.owner_stacks);
+	stat_fd = bpf_map__fd(skel->maps.owner_stat);
+	if (!stacks_fd || !stat_fd)
+		return NULL;
+
+	stack_trace = zalloc(stack_size);
+	if (stack_trace == NULL)
+		return NULL;
+
+	if (bpf_map_get_next_key(stacks_fd, NULL, stack_trace))
+		return NULL;
+
+	bpf_map_lookup_elem(stacks_fd, stack_trace, &stack_id);
+	ckey.stack_id = stack_id;
+	bpf_map_lookup_elem(stat_fd, &ckey, &cdata);
+
+	st = zalloc(sizeof(struct lock_stat));
+	if (!st)
+		return NULL;
+
+	strcpy(name,
+	       stack_trace[0] ? lock_contention_get_name(con, NULL, stack_trace, 0) : "unknown");
+
+	st->name = strdup(name);
+	if (!st->name)
+		return NULL;
+
+	st->flags = cdata.flags;
+	st->nr_contended = cdata.count;
+	st->wait_time_total = cdata.total_time;
+	st->wait_time_max = cdata.max_time;
+	st->wait_time_min = cdata.min_time;
+	st->callstack = stack_trace;
+
+	if (cdata.count)
+		st->avg_wait_time = cdata.total_time / cdata.count;
+
+	bpf_map_delete_elem(stacks_fd, stack_trace);
+	bpf_map_delete_elem(stat_fd, &ckey);
+
+	return st;
+}
+
 int lock_contention_read(struct lock_contention *con)
 {
 	int fd, stack, err = 0;
diff --git a/tools/perf/util/lock-contention.h b/tools/perf/util/lock-contention.h
index a09f7fe877df..97fd33c57f17 100644
--- a/tools/perf/util/lock-contention.h
+++ b/tools/perf/util/lock-contention.h
@@ -168,6 +168,8 @@ int lock_contention_stop(void);
 int lock_contention_read(struct lock_contention *con);
 int lock_contention_finish(struct lock_contention *con);
 
+struct lock_stat *pop_owner_stack_trace(struct lock_contention *con);
+
 #else  /* !HAVE_BPF_SKEL */
 
 static inline int lock_contention_prepare(struct lock_contention *con __maybe_unused)
@@ -187,6 +189,11 @@ static inline int lock_contention_read(struct lock_contention *con __maybe_unuse
 	return 0;
 }
 
+struct lock_stat *pop_owner_stack_trace(struct lock_contention *con)
+{
+	return NULL;
+}
+
 #endif  /* HAVE_BPF_SKEL */
 
 #endif  /* PERF_LOCK_CONTENTION_H */
-- 
2.48.1.262.g85cc9f2d1e-goog


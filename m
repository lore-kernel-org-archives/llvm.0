Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418948;
	b=GupOTCW1potGnPt7dr9Iv+SCh0ezSA5197SloVa9Kiyy9dRcEurFfz/WLFMXvuN8YH5Q
	 PyNXPnt+xt6VUkb8aKkvhrF2kXjgGW/YCvLhkeMwi8rZQEkGoT/rP1up5f65DqtTT2Avp
	 P+r5aDYpgVGGBwIRtTvPyy79pqUyT5IkEOBU9N9XSZz+cgTGf/6T5kr+5aHDqh+wfV0aA
	 9L2Z7MUsRooBDMqdVicop1d/sJ8fr80zoUPGE3TVRi8l3wmvsIvZ/jdTZOyZPNhgvbUXx
	 +T5ePrNICJSfhGdj7CFQirluMRRw7bfiooSl2KV8kk0okbZTcRooNQYem9+ViIy6zLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6jI9+r8vwPhmCnaTXk+n6jcj0heJo/JqEBjYO4szOOA=;
	b=DRCT42NW0C4T72c12XiplFclx2FbAZYF+VwYeNG3ardMx6eWKo65QDegT/0+D/5b+lvk
	 j/nRqb+SwFbI6E2//G4PBQwdM1KOk5fWUsvQabpTi7MObaOssXGxsJbQvffcVd1lkpinI
	 4YJ62q/whSc7tQBH5Km92yOV5QZo/zZhr7N8Yn4vLHYgH6FJ0TfrwQMYYq1oT2HzGZ/l7
	 y5/QBgtFv+UYV8T1jsrFNOgKb0Gb5E2Rau3Zvh0c2RnBxUAS/1c9Hz8UmLJt/J3CNkptl
	 rNo4N1RLnXYXjQyAZ+Njo9Op6qcfNgYSR2Mk/fdtyPukQl8IIcr/gMDoUBgBTCMGIDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z2pBRXtu;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F372F606A330
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 17:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F372F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z2pBRXtu
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so6978628eec.1
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 09:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418947; x=1795023747; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jI9+r8vwPhmCnaTXk+n6jcj0heJo/JqEBjYO4szOOA=;
        b=Z2pBRXtu0UnUIUZWf/b3rR2TeFpHvZ/hIIRIDXuj+c+fhC54v4xGuEAy8T37/ESGdJ
         RNeAUHmCEE7xp3/Y9IzSyfJFe8v5EoqgUMbMVRiEkxOTBD9he2RRLqPaIAVpgGqMSUEg
         gixNsvMNQ4Iv2RzKSZxHLug6wW/Nooe4AjvIWunKXE6USwKHfUbDuPZKnETbV36oBUNK
         Q7OhsIZH4tOvz1AsV4GtEFb1vl4tczqj7cGP5q6sLjagpZHFCjRTa46A7bBovbZ3jjoN
         NhO1uxpCBqD5T39VYW5pG1xmTSu17X3sHUxWpzGZNGeggwwOFkfy3shyFpl7v+RLuvwy
         QZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418947; x=1795023747;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jI9+r8vwPhmCnaTXk+n6jcj0heJo/JqEBjYO4szOOA=;
        b=wY5a/QzqHRe4VPvj9l6PWGlcXn1xi6U+jmUfEThAIzCxmtPeV57bePYx4ZDwCm7z26
         dSquBidVbMgqf6WFmM2mtklDmb93z0HdvrEDN5itH1sxN8MGUljgPe7MwUgnBZvFuOIm
         s6DQUW7bhnbc0KAEFIhIHxs3+kfpDozTasom1Z3BAk+UVIhdjD/QMGw0TKUBx9lle0Kg
         4ELeKfbcNswkqh+5/m7J8vSYj5WQxgZCmk+LWhI7ck22vWdssDMfz13XyG31oOEuEub1
         93RAhehuOiFidLHOyq2Y1UF7FZNDVcQH/eTL5S1jKubqg6NN6V2ETHQ9OhN9/r82Wueq
         BAcA==
X-Forwarded-Encrypted: i=1; AL+hErFBG1i5N2y2PiVJscIkxtJqLLo/3Dz4EYEzty4TNXq3UBuVcGa3M9xRuGa18QtGw5S2LC62@lists.linux.dev
X-Gm-Message-State: APuU4Z9wWfDgGBRR9V4TFAcNgjW/5zv9eRnRDWbqvPvNt41ig+o0yCDv
	Nw5qr6vzBWFKccLcwy9vKxh7aaB76PqpVycK3Hr8AtQcgVy/T/Y8JWe0swAbVoo3R+Bo8cf/vHc
	6HIwMOiqBmg==
X-Received: from dlar3.prod.google.com ([2002:a05:701b:21c3:b0:195:d59a:94bc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4591:10b0:1ab:6b10:461
 with SMTP id a92af1059eb24-1b3c0376279mr2398425c88.45.1794418946775; Wed, 11
 Nov 2026 09:42:26 -0800 (PST)
Date: Wed, 11 Nov 2026 09:41:56 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-5-irogers@google.com>
Subject: [PATCH v12 04/20] perf mutex: Use kernel style compiler-context-analysis.h
 annotations
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Enable -DWARN_CONTEXT_ANALYSIS alongside -Wthread-safety for Clang
builds in tools/perf/Makefile.config, replace the custom lock safety
macros in tools/perf with the kernel's compiler-context-analysis.h
annotations (context_lock_struct, __guarded_by, __acquires,
__acquires_shared, __releases, __releases_shared, __cond_acquires,
__must_hold, __must_hold_shared, __must_not_hold, __returns_ctx_lock,
__no_context_analysis, and __context_unsafe), and remove the redundant
macro definitions from tools/perf/util/mutex.h.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config    |  2 +-
 tools/perf/builtin-sched.c    | 16 +++----
 tools/perf/builtin-top.c      |  4 +-
 tools/perf/util/annotate.c    |  4 +-
 tools/perf/util/annotate.h    |  8 ++--
 tools/perf/util/comm.c        |  4 +-
 tools/perf/util/dso.c         | 30 ++++++------
 tools/perf/util/dso.h         | 11 +++--
 tools/perf/util/dsos.c        |  6 +--
 tools/perf/util/intel-tpebs.c |  6 +--
 tools/perf/util/libbfd.c      |  4 +-
 tools/perf/util/mutex.c       |  4 +-
 tools/perf/util/mutex.h       | 90 +++--------------------------------
 tools/perf/util/rwsem.c       |  8 ++--
 tools/perf/util/rwsem.h       | 10 ++--
 tools/perf/util/thread.c      |  8 ++--
 tools/perf/util/thread.h      |  2 +-
 17 files changed, 70 insertions(+), 147 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index b4764f69f47f..3eb8d095cda0 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,7 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety
+  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
index 39571f03eda2..ee74a6aa5ea3 100644
--- a/tools/perf/builtin-sched.c
+++ b/tools/perf/builtin-sched.c
@@ -828,8 +828,8 @@ static void *thread_func(void *ctx)
 }
 
 static void create_tasks(struct perf_sched *sched)
-	EXCLUSIVE_LOCK_FUNCTION(sched->start_work_mutex)
-	EXCLUSIVE_LOCK_FUNCTION(sched->work_done_wait_mutex)
+	__acquires(&sched->start_work_mutex)
+	__acquires(&sched->work_done_wait_mutex)
 {
 	struct task_desc *task;
 	pthread_attr_t attr;
@@ -858,8 +858,8 @@ static void create_tasks(struct perf_sched *sched)
 }
 
 static void destroy_tasks(struct perf_sched *sched)
-	UNLOCK_FUNCTION(sched->start_work_mutex)
-	UNLOCK_FUNCTION(sched->work_done_wait_mutex)
+	__releases(&sched->start_work_mutex)
+	__releases(&sched->work_done_wait_mutex)
 {
 	struct task_desc *task;
 	unsigned long i;
@@ -878,8 +878,8 @@ static void destroy_tasks(struct perf_sched *sched)
 }
 
 static void wait_for_tasks(struct perf_sched *sched)
-	EXCLUSIVE_LOCKS_REQUIRED(sched->work_done_wait_mutex)
-	EXCLUSIVE_LOCKS_REQUIRED(sched->start_work_mutex)
+	__must_hold(&sched->work_done_wait_mutex)
+	__must_hold(&sched->start_work_mutex)
 {
 	u64 cpu_usage_0, cpu_usage_1;
 	struct task_desc *task;
@@ -930,8 +930,8 @@ static void wait_for_tasks(struct perf_sched *sched)
 }
 
 static void run_one_test(struct perf_sched *sched)
-	EXCLUSIVE_LOCKS_REQUIRED(sched->work_done_wait_mutex)
-	EXCLUSIVE_LOCKS_REQUIRED(sched->start_work_mutex)
+	__must_hold(&sched->work_done_wait_mutex)
+	__must_hold(&sched->start_work_mutex)
 {
 	u64 T0, T1, delta, avg_delta, fluct;
 
diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
index a3442d2d6edf..9049db154fa4 100644
--- a/tools/perf/builtin-top.c
+++ b/tools/perf/builtin-top.c
@@ -201,7 +201,7 @@ static void perf_top__record_precise_ip(struct perf_top *top,
 					struct hist_entry *he,
 					struct perf_sample *sample,
 					u64 ip)
-	EXCLUSIVE_LOCKS_REQUIRED(he->hists->lock)
+	__must_hold(&he->hists->lock)
 {
 	struct annotation *notes;
 	struct symbol *sym = he->ms.sym;
@@ -730,7 +730,7 @@ static void *display_thread(void *arg)
 static int hist_iter__top_callback(struct hist_entry_iter *iter,
 				   struct addr_location *al, bool single,
 				   void *arg)
-	EXCLUSIVE_LOCKS_REQUIRED(iter->he->hists->lock)
+	__must_hold(&iter->he->hists->lock)
 {
 	struct perf_top *top = arg;
 
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 86a4beec6528..c466757e8508 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -655,7 +655,7 @@ static struct mutex *annotation__get_mutex(const struct annotation *notes)
 }
 
 void annotation__lock(struct annotation *notes)
-	NO_THREAD_SAFETY_ANALYSIS
+	__no_context_analysis
 {
 	struct mutex *mutex = annotation__get_mutex(notes);
 
@@ -664,7 +664,7 @@ void annotation__lock(struct annotation *notes)
 }
 
 void annotation__unlock(struct annotation *notes)
-	NO_THREAD_SAFETY_ANALYSIS
+	__no_context_analysis
 {
 	struct mutex *mutex = annotation__get_mutex(notes);
 
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index 1b47c1156b9a..f5465c931721 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -369,7 +369,7 @@ struct annotated_branch {
 	u64			*br_cntr;
 };
 
-struct LOCKABLE annotation {
+context_lock_struct(annotation) {
 	struct annotated_source *src;
 	struct annotated_branch *branch;
 };
@@ -379,9 +379,9 @@ static inline void annotation__init(struct annotation *notes __maybe_unused)
 }
 void annotation__exit(struct annotation *notes);
 
-void annotation__lock(struct annotation *notes) EXCLUSIVE_LOCK_FUNCTION(*notes);
-void annotation__unlock(struct annotation *notes) UNLOCK_FUNCTION(*notes);
-bool annotation__trylock(struct annotation *notes) EXCLUSIVE_TRYLOCK_FUNCTION(true, *notes);
+void annotation__lock(struct annotation *notes) __acquires(notes);
+void annotation__unlock(struct annotation *notes) __releases(notes);
+bool annotation__trylock(struct annotation *notes) __cond_acquires(true, notes);
 
 static inline int annotation__cycles_width(struct annotation *notes)
 {
diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 9880247a2c33..6343a3c9debe 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -24,7 +24,7 @@ static struct comm_strs {
 static void comm_strs__remove_if_last(struct comm_str *cs);
 
 static void comm_strs__init(void)
-	NO_THREAD_SAFETY_ANALYSIS /* Inherently single threaded due to pthread_once. */
+	__context_unsafe(/* Inherently single threaded due to pthread_once. */)
 {
 	init_rwsem(&_comm_strs.lock);
 	_comm_strs.capacity = 16;
@@ -120,7 +120,7 @@ static void comm_strs__remove_if_last(struct comm_str *cs)
 }
 
 static struct comm_str *__comm_strs__find(struct comm_strs *comm_strs, const char *str)
-	SHARED_LOCKS_REQUIRED(comm_strs->lock)
+	__must_hold_shared(&comm_strs->lock)
 {
 	struct comm_str **result;
 
diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index ce98613868e7..24ff066b9878 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -525,14 +525,14 @@ void dso__set_module_info(struct dso *dso, struct kmod_path *m,
  */
 struct mutex _dso__data_open_lock;
 static LIST_HEAD(dso__data_open);
-static long dso__data_open_cnt GUARDED_BY(_dso__data_open_lock);
+static long dso__data_open_cnt __guarded_by(&_dso__data_open_lock);
 
 static void dso__data_open_lock_init(void)
 {
 	mutex_init(&_dso__data_open_lock);
 }
 
-static struct mutex *dso__data_open_lock(void) LOCK_RETURNED(_dso__data_open_lock)
+static struct mutex *dso__data_open_lock(void) __returns_ctx_lock(&_dso__data_open_lock)
 {
 	static pthread_once_t data_open_lock_once = PTHREAD_ONCE_INIT;
 
@@ -541,7 +541,7 @@ static struct mutex *dso__data_open_lock(void) LOCK_RETURNED(_dso__data_open_loc
 	return &_dso__data_open_lock;
 }
 
-static void dso__list_add(struct dso *dso) EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
+static void dso__list_add(struct dso *dso) __must_hold(&_dso__data_open_lock)
 {
 	list_add_tail(&dso__data(dso)->open_entry, &dso__data_open);
 #ifdef REFCNT_CHECKING
@@ -552,7 +552,7 @@ static void dso__list_add(struct dso *dso) EXCLUSIVE_LOCKS_REQUIRED(_dso__data_o
 	dso__data_open_cnt++;
 }
 
-static void dso__list_del(struct dso *dso) EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
+static void dso__list_del(struct dso *dso) __must_hold(&_dso__data_open_lock)
 {
 	list_del_init(&dso__data(dso)->open_entry);
 #ifdef REFCNT_CHECKING
@@ -567,7 +567,7 @@ static void dso__list_del(struct dso *dso) EXCLUSIVE_LOCKS_REQUIRED(_dso__data_o
 
 static void close_first_dso(void);
 
-static int do_open(char *name) EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
+static int do_open(char *name) __must_hold(&_dso__data_open_lock)
 {
 	do {
 		int fd = open(name, O_RDONLY|O_CLOEXEC);
@@ -670,7 +670,7 @@ void dso__put_filename(struct dso *dso __maybe_unused, char *filename, bool deco
 }
 
 static int __open_dso(struct dso *dso, struct machine *machine)
-	EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
+	__must_hold(&_dso__data_open_lock)
 {
 	int fd = -EINVAL;
 	char *name;
@@ -703,7 +703,7 @@ static void check_data_close(void);
  * list/count of open DSO objects.
  */
 static int open_dso(struct dso *dso, struct machine *machine)
-	EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
+	__must_hold(&_dso__data_open_lock)
 {
 	int fd;
 	struct nscookie nsc;
@@ -729,7 +729,7 @@ static int open_dso(struct dso *dso, struct machine *machine)
 	return fd;
 }
 
-static void close_data_fd(struct dso *dso) EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
+static void close_data_fd(struct dso *dso) __must_hold(&_dso__data_open_lock)
 {
 	if (dso__data(dso)->fd >= 0) {
 		close(dso__data(dso)->fd);
@@ -746,12 +746,12 @@ static void close_data_fd(struct dso *dso) EXCLUSIVE_LOCKS_REQUIRED(_dso__data_o
  * Close @dso's data file descriptor and updates
  * list/count of open DSO objects.
  */
-static void close_dso(struct dso *dso) EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
+static void close_dso(struct dso *dso) __must_hold(&_dso__data_open_lock)
 {
 	close_data_fd(dso);
 }
 
-static void close_first_dso(void) EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
+static void close_first_dso(void) __must_hold(&_dso__data_open_lock)
 {
 	struct dso_data *dso_data;
 	struct dso *dso;
@@ -796,7 +796,7 @@ void reset_fd_limit(void)
 	fd_limit = 0;
 }
 
-static bool may_cache_fd(void) EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
+static bool may_cache_fd(void) __must_hold(&_dso__data_open_lock)
 {
 	if (!fd_limit)
 		fd_limit = get_fd_limit();
@@ -812,7 +812,7 @@ static bool may_cache_fd(void) EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
  * for opened dso file descriptors. The limit is half
  * of the RLIMIT_NOFILE files opened.
 */
-static void check_data_close(void) EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
+static void check_data_close(void) __must_hold(&_dso__data_open_lock)
 {
 	bool cache_fd = may_cache_fd();
 
@@ -834,7 +834,7 @@ void dso__data_close(struct dso *dso)
 }
 
 static int dso__find_binary_type_locked(struct dso *dso)
-	EXCLUSIVE_LOCKS_REQUIRED(dso__lock(dso))
+	__must_hold(dso__lock(dso))
 {
 	enum dso_binary_type binary_type_data[] = {
 		DSO_BINARY_TYPE__BUILD_ID_CACHE,
@@ -926,7 +926,7 @@ static int dso__find_binary_type_locked(struct dso *dso)
 
 #define FIND_MAX_RETRY  3
 static int __dso__find_binary_type(struct dso *dso)
-	EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
+	__must_hold(&_dso__data_open_lock)
 {
 	int ret;
 	int retry = 0;
@@ -966,7 +966,7 @@ enum dso_binary_type dso__find_binary_type(struct dso *dso)
 }
 
 static void try_to_open_dso(struct dso *dso, struct machine *machine)
-	EXCLUSIVE_LOCKS_REQUIRED(_dso__data_open_lock)
+	__must_hold(&_dso__data_open_lock)
 {
 	struct dso_data *dso_data = dso__data(dso);
 
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index d5f7382d4e13..f6c60bafcde1 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -629,6 +629,7 @@ static inline void dso__set_loaded(struct dso *dso)
 }
 
 static inline struct mutex *dso__lock(struct dso *dso)
+	__returns_ctx_lock(&RC_CHK_ACCESS(dso)->lock)
 {
 	return &RC_CHK_ACCESS(dso)->lock;
 }
@@ -760,7 +761,7 @@ static inline const char *dso__symsrc_filename(const struct dso *dso)
 	return RC_CHK_ACCESS(dso)->symsrc_filename;
 }
 
-void dso__set_symsrc_filename(struct dso *dso, char *val) EXCLUSIVE_LOCKS_REQUIRED(dso__lock(dso));
+void dso__set_symsrc_filename(struct dso *dso, char *val) __must_hold(dso__lock(dso));
 
 static inline void dso__free_symsrc_filename(struct dso *dso)
 {
@@ -809,7 +810,7 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id);
 int dso__name_len(const struct dso *dso);
 
 struct dso *dso__get(struct dso *dso);
-void dso__put(struct dso *dso) LOCKS_EXCLUDED(_dso__data_open_lock);
+void dso__put(struct dso *dso) __must_not_hold(&_dso__data_open_lock);
 
 static inline void __dso__zput(struct dso **dso)
 {
@@ -919,9 +920,9 @@ void dso__set_module_info(struct dso *dso, struct kmod_path *m,
  * TODO
 */
 bool dso__data_get_fd(struct dso *dso, struct machine *machine, int *fd)
-	EXCLUSIVE_TRYLOCK_FUNCTION(true, _dso__data_open_lock);
-void dso__data_put_fd(struct dso *dso) UNLOCK_FUNCTION(_dso__data_open_lock);
-void dso__data_close(struct dso *dso) LOCKS_EXCLUDED(_dso__data_open_lock);
+	__cond_acquires(true, &_dso__data_open_lock);
+void dso__data_put_fd(struct dso *dso) __releases(&_dso__data_open_lock);
+void dso__data_close(struct dso *dso) __must_not_hold(&_dso__data_open_lock);
 
 int dso__data_file_size(struct dso *dso, struct machine *machine);
 off_t dso__data_size(struct dso *dso, struct machine *machine);
diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index e927e707abac..a2cd37bd1660 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -157,7 +157,7 @@ static struct dso *__dsos__find_by_longname_id(struct dsos *dsos,
 					       const char *name,
 					       const struct dso_id *id,
 					       bool write_locked)
-	SHARED_LOCKS_REQUIRED(dsos->lock)
+	__must_hold_shared(&dsos->lock)
 {
 	struct dsos__key key = {
 		.long_name = name,
@@ -266,7 +266,7 @@ static int dsos__find_id_cb(struct dso *dso, void *data)
 
 static struct dso *__dsos__find_id(struct dsos *dsos, const char *name, const struct dso_id *id,
 				   bool cmp_short, bool write_locked)
-	SHARED_LOCKS_REQUIRED(dsos->lock)
+	__must_hold_shared(&dsos->lock)
 {
 	struct dso *res;
 
@@ -330,7 +330,7 @@ static struct dso *__dsos__addnew_id(struct dsos *dsos, const char *name, const
 }
 
 static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
-	SHARED_LOCKS_REQUIRED(dsos->lock)
+	__must_hold_shared(&dsos->lock)
 {
 	struct dso *dso = __dsos__find_id(dsos, name, id, false, /*write_locked=*/true);
 
diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index b41171b5df77..7c0b8b15bd10 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -69,7 +69,7 @@ static struct mutex *tpebs_mtx_get(void)
 }
 
 static struct tpebs_retire_lat *tpebs_retire_lat__find(struct evsel *evsel)
-	EXCLUSIVE_LOCKS_REQUIRED(tpebs_mtx_get());
+	__must_hold(tpebs_mtx_get());
 
 static int evsel__tpebs_start_perf_record(struct evsel *evsel)
 {
@@ -244,7 +244,7 @@ static void *__sample_reader(void *arg __maybe_unused)
 	return NULL;
 }
 
-static int tpebs_send_record_cmd(const char *msg) EXCLUSIVE_LOCKS_REQUIRED(tpebs_mtx_get())
+static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 {
 	struct pollfd pollfd = { .events = POLLIN, };
 	int ret, len, retries = 0;
@@ -321,7 +321,7 @@ static int tpebs_send_record_cmd(const char *msg) EXCLUSIVE_LOCKS_REQUIRED(tpebs
 /*
  * tpebs_stop - stop the sample data read thread and the perf record process.
  */
-static int tpebs_stop(void) EXCLUSIVE_LOCKS_REQUIRED(tpebs_mtx_get())
+static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
 {
 	int ret = 0;
 
diff --git a/tools/perf/util/libbfd.c b/tools/perf/util/libbfd.c
index 58cadc93e8b5..61bd4f49afba 100644
--- a/tools/perf/util/libbfd.c
+++ b/tools/perf/util/libbfd.c
@@ -51,13 +51,13 @@ struct a2l_data {
 	asymbol **syms;
 };
 
-static bool perf_bfd_lock(void *bfd_mutex) NO_THREAD_SAFETY_ANALYSIS
+static bool perf_bfd_lock(void *bfd_mutex) __no_context_analysis
 {
 	mutex_lock(bfd_mutex);
 	return true;
 }
 
-static bool perf_bfd_unlock(void *bfd_mutex) NO_THREAD_SAFETY_ANALYSIS
+static bool perf_bfd_unlock(void *bfd_mutex) __no_context_analysis
 {
 	mutex_unlock(bfd_mutex);
 	return true;
diff --git a/tools/perf/util/mutex.c b/tools/perf/util/mutex.c
index df3b7cce3d5a..f1b99409ea91 100644
--- a/tools/perf/util/mutex.c
+++ b/tools/perf/util/mutex.c
@@ -125,14 +125,14 @@ void mutex_destroy(struct mutex *mtx)
 }
 
 void mutex_lock(struct mutex *mtx)
-	NO_THREAD_SAFETY_ANALYSIS
+	__no_context_analysis
 {
 	CHECK_ERR(mutex_take_over(mtx, pthread_mutex_lock(&mtx->lock),
 				  /*give_up=*/false));
 }
 
 void mutex_unlock(struct mutex *mtx)
-	NO_THREAD_SAFETY_ANALYSIS
+	__no_context_analysis
 {
 	CHECK_ERR(pthread_mutex_unlock(&mtx->lock));
 }
diff --git a/tools/perf/util/mutex.h b/tools/perf/util/mutex.h
index 5de1065ea2b9..fc01a038aefe 100644
--- a/tools/perf/util/mutex.h
+++ b/tools/perf/util/mutex.h
@@ -4,91 +4,13 @@
 
 #include <pthread.h>
 #include <stdbool.h>
-
-/*
- * A function-like feature checking macro that is a wrapper around
- * `__has_attribute`, which is defined by GCC 5+ and Clang and evaluates to a
- * nonzero constant integer if the attribute is supported or 0 if not.
- */
-#ifdef __has_attribute
-#define HAVE_ATTRIBUTE(x) __has_attribute(x)
-#else
-#define HAVE_ATTRIBUTE(x) 0
-#endif
-
-#if HAVE_ATTRIBUTE(guarded_by) && HAVE_ATTRIBUTE(pt_guarded_by) && \
-	HAVE_ATTRIBUTE(lockable) && HAVE_ATTRIBUTE(exclusive_lock_function) && \
-	HAVE_ATTRIBUTE(exclusive_trylock_function) && HAVE_ATTRIBUTE(exclusive_locks_required) && \
-	HAVE_ATTRIBUTE(no_thread_safety_analysis)
-
-/* Documents if a shared field or global variable needs to be protected by a mutex. */
-#define GUARDED_BY(x) __attribute__((guarded_by(x)))
-
-/*
- * Documents if the memory location pointed to by a pointer should be guarded by
- * a mutex when dereferencing the pointer.
- */
-#define PT_GUARDED_BY(x) __attribute__((pt_guarded_by(x)))
-
-/* Documents if a type is a lockable type. */
-#define LOCKABLE __attribute__((lockable))
-
-/* Documents a function that expects a lock not to be held prior to entry. */
-#define LOCKS_EXCLUDED(...) __attribute__((locks_excluded(__VA_ARGS__)))
-
-/* Documents a function that returns a lock. */
-#define LOCK_RETURNED(x) __attribute__((lock_returned(x)))
-
-/* Documents functions that acquire a lock in the body of a function, and do not release it. */
-#define EXCLUSIVE_LOCK_FUNCTION(...)  __attribute__((exclusive_lock_function(__VA_ARGS__)))
-
-/*
- * Documents functions that acquire a shared (reader) lock in the body of a
- * function, and do not release it.
- */
-#define SHARED_LOCK_FUNCTION(...)  __attribute__((shared_lock_function(__VA_ARGS__)))
-
-/*
- * Documents functions that expect a lock to be held on entry to the function,
- * and release it in the body of the function.
- */
-#define UNLOCK_FUNCTION(...) __attribute__((unlock_function(__VA_ARGS__)))
-
-/* Documents functions that try to acquire a lock, and return success or failure. */
-#define EXCLUSIVE_TRYLOCK_FUNCTION(...) \
-	__attribute__((exclusive_trylock_function(__VA_ARGS__)))
-
-/* Documents a function that expects a mutex to be held prior to entry. */
-#define EXCLUSIVE_LOCKS_REQUIRED(...) __attribute__((exclusive_locks_required(__VA_ARGS__)))
-
-/* Documents a function that expects a shared (reader) lock to be held prior to entry. */
-#define SHARED_LOCKS_REQUIRED(...) __attribute__((shared_locks_required(__VA_ARGS__)))
-
-/* Turns off thread safety checking within the body of a particular function. */
-#define NO_THREAD_SAFETY_ANALYSIS __attribute__((no_thread_safety_analysis))
-
-#else
-
-#define GUARDED_BY(x)
-#define PT_GUARDED_BY(x)
-#define LOCKABLE
-#define LOCKS_EXCLUDED(...)
-#define LOCK_RETURNED(x)
-#define EXCLUSIVE_LOCK_FUNCTION(...)
-#define SHARED_LOCK_FUNCTION(...)
-#define UNLOCK_FUNCTION(...)
-#define EXCLUSIVE_TRYLOCK_FUNCTION(...)
-#define EXCLUSIVE_LOCKS_REQUIRED(...)
-#define SHARED_LOCKS_REQUIRED(...)
-#define NO_THREAD_SAFETY_ANALYSIS
-
-#endif
+#include <linux/compiler.h>
 
 /*
  * A wrapper around the mutex implementation that allows perf to error check
  * usage, etc.
  */
-struct LOCKABLE mutex {
+context_lock_struct(mutex) {
 	pthread_mutex_t lock;
 };
 
@@ -150,10 +72,10 @@ void mutex_init_recursive(struct mutex *mtx);
 bool mutex_init_pshared_robust(struct mutex *mtx);
 void mutex_destroy(struct mutex *mtx);
 
-void mutex_lock(struct mutex *mtx) EXCLUSIVE_LOCK_FUNCTION(*mtx);
-void mutex_unlock(struct mutex *mtx) UNLOCK_FUNCTION(*mtx);
+void mutex_lock(struct mutex *mtx) __acquires(mtx);
+void mutex_unlock(struct mutex *mtx) __releases(mtx);
 /* Tries to acquire the lock and returns true on success. */
-bool mutex_trylock(struct mutex *mtx) EXCLUSIVE_TRYLOCK_FUNCTION(true, *mtx);
+bool mutex_trylock(struct mutex *mtx) __cond_acquires(true, mtx);
 
 /* Default initialize the cond struct. */
 void cond_init(struct cond *cnd);
@@ -164,7 +86,7 @@ void cond_init(struct cond *cnd);
 void cond_init_pshared(struct cond *cnd);
 void cond_destroy(struct cond *cnd);
 
-void cond_wait(struct cond *cnd, struct mutex *mtx) EXCLUSIVE_LOCKS_REQUIRED(mtx);
+void cond_wait(struct cond *cnd, struct mutex *mtx) __must_hold(mtx);
 void cond_signal(struct cond *cnd);
 void cond_broadcast(struct cond *cnd);
 
diff --git a/tools/perf/util/rwsem.c b/tools/perf/util/rwsem.c
index 9d26832398db..cc720b482333 100644
--- a/tools/perf/util/rwsem.c
+++ b/tools/perf/util/rwsem.c
@@ -27,7 +27,7 @@ int exit_rwsem(struct rw_semaphore *sem)
 }
 
 int down_read(struct rw_semaphore *sem)
-	NO_THREAD_SAFETY_ANALYSIS
+	__no_context_analysis
 {
 #if RWS_ERRORCHECK
 	mutex_lock(&sem->mtx);
@@ -38,7 +38,7 @@ int down_read(struct rw_semaphore *sem)
 }
 
 int up_read(struct rw_semaphore *sem)
-	NO_THREAD_SAFETY_ANALYSIS
+	__no_context_analysis
 {
 #if RWS_ERRORCHECK
 	mutex_unlock(&sem->mtx);
@@ -49,7 +49,7 @@ int up_read(struct rw_semaphore *sem)
 }
 
 int down_write(struct rw_semaphore *sem)
-	NO_THREAD_SAFETY_ANALYSIS
+	__no_context_analysis
 {
 #if RWS_ERRORCHECK
 	mutex_lock(&sem->mtx);
@@ -60,7 +60,7 @@ int down_write(struct rw_semaphore *sem)
 }
 
 int up_write(struct rw_semaphore *sem)
-	NO_THREAD_SAFETY_ANALYSIS
+	__no_context_analysis
 {
 #if RWS_ERRORCHECK
 	mutex_unlock(&sem->mtx);
diff --git a/tools/perf/util/rwsem.h b/tools/perf/util/rwsem.h
index b102d8143181..235bb63c92d0 100644
--- a/tools/perf/util/rwsem.h
+++ b/tools/perf/util/rwsem.h
@@ -10,7 +10,7 @@
  */
 #define RWS_ERRORCHECK 0
 
-struct LOCKABLE rw_semaphore {
+context_lock_struct(rw_semaphore) {
 #if RWS_ERRORCHECK
 	struct mutex mtx;
 #else
@@ -21,10 +21,10 @@ struct LOCKABLE rw_semaphore {
 int init_rwsem(struct rw_semaphore *sem);
 int exit_rwsem(struct rw_semaphore *sem);
 
-int down_read(struct rw_semaphore *sem) SHARED_LOCK_FUNCTION(sem);
-int up_read(struct rw_semaphore *sem) UNLOCK_FUNCTION(sem);
+int down_read(struct rw_semaphore *sem) __acquires_shared(sem);
+int up_read(struct rw_semaphore *sem) __releases_shared(sem);
 
-int down_write(struct rw_semaphore *sem) EXCLUSIVE_LOCK_FUNCTION(sem);
-int up_write(struct rw_semaphore *sem) UNLOCK_FUNCTION(sem);
+int down_write(struct rw_semaphore *sem) __acquires(sem);
+int up_write(struct rw_semaphore *sem) __releases(sem);
 
 #endif /* _PERF_RWSEM_H */
diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index 91118c301913..616d5bf87baf 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -41,7 +41,7 @@ int thread__init_maps(struct thread *thread, struct machine *machine)
 }
 
 struct thread *thread__new(pid_t pid, pid_t tid)
-	NO_THREAD_SAFETY_ANALYSIS /* Allocation/creation is inherently single threaded. */
+	__context_unsafe(/* Allocation/creation is inherently single threaded. */)
 {
 	RC_STRUCT(thread) *_thread = zalloc(sizeof(*_thread));
 	struct thread *thread;
@@ -203,7 +203,7 @@ int thread__set_namespaces(struct thread *thread, u64 timestamp,
 }
 
 static struct comm *__thread__comm(struct thread *thread)
-	SHARED_LOCKS_REQUIRED(thread__comm_lock(thread))
+	__must_hold_shared(thread__comm_lock(thread))
 {
 	if (list_empty(thread__comm_list(thread)))
 		return NULL;
@@ -250,7 +250,7 @@ struct comm *thread__exec_comm(struct thread *thread)
 
 static int ____thread__set_comm(struct thread *thread, const char *str,
 				u64 timestamp, bool exec)
-	EXCLUSIVE_LOCKS_REQUIRED(thread__comm_lock(thread))
+	__must_hold(thread__comm_lock(thread))
 {
 	struct comm *new, *curr = __thread__comm(thread);
 
@@ -308,7 +308,7 @@ int thread__set_comm_from_proc(struct thread *thread)
 }
 
 static const char *__thread__comm_str(struct thread *thread)
-	SHARED_LOCKS_REQUIRED(thread__comm_lock(thread))
+	__must_hold_shared(thread__comm_lock(thread))
 {
 	const struct comm *comm = __thread__comm(thread);
 
diff --git a/tools/perf/util/thread.h b/tools/perf/util/thread.h
index d82fce8173ae..9d0ce7742c06 100644
--- a/tools/perf/util/thread.h
+++ b/tools/perf/util/thread.h
@@ -251,7 +251,7 @@ static inline struct rw_semaphore *thread__comm_lock(struct thread *thread)
 }
 
 static inline struct list_head *thread__comm_list(struct thread *thread)
-	SHARED_LOCKS_REQUIRED(thread__comm_lock(thread))
+	__must_hold_shared(thread__comm_lock(thread))
 {
 	return &RC_CHK_ACCESS(thread)->comm_list;
 }
-- 
2.56.0.542.g3ef89b7020-goog


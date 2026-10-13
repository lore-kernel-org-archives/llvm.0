Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149C6538D8B
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916017; cv=none; b=g5dD+C6pN95MZNQdQZSqTPWuKpJkdOO/AItIzaabfdyyKQGpJ0wNU1xZgeevUcIzQHQHQRaGyGobzvCUcFcgF7VUC9PxjnoO6SKSx99uYrEmTGRmdddOkAPmQfNPN7L34TR/qRex7WUSHXVaV2mwNhy+m72u3IiT9RdboLMWRLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916017; c=relaxed/simple;
	bh=4CQuvwofgHcG83OG69LxU4ukzKN7LsPez0gi6cp7I+g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hLwkvc3bUFFGF56Wi+QoGm1anIvL4n++rkv39UQPL0omLVRY4T31M5rfFRq8K579IXW1nL8HouUSwA/HiL8tXjA8KHUN0SgoWLjITiyeBP0pWFSzXHUbnhAIYhSNYSwEmKmYuK9nIK31cZxoxz86O3fXqjCx5PHVfiSSOJ0SDFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PL7ln4HE; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PL7ln4HE"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7429412eec.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791916014; x=1792520814; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rxnd0zNui4b9FhnSzHnnD6pCFtdl3q4FWfdc0yDThig=;
        b=PL7ln4HEJi//1kKdjKlQxfP3ldd1mKq1PefpULMXSJO8lYHsIzvM9cUmHghhbvXqSW
         kCmgUoo4PPgsINYGBSqgxiMx4wdjx6fbe1vuRlYwI9mOkuSOtnGYi9ceNa0EbtgX7Uul
         7qgCkSAXeP/+R/Qd6qna38j9uoAaA87VXGqOC+S/6OWtPG2C+Yvs4lkBap3lCQ3ki+8N
         eNVThXKFhVUtpqenJGBk2bs1SzQpgiEhnDaZye9ujPdIwgOhq3u0rntaoNno7Cf2PYKI
         A1v4o87r4H3jLxkTRVaWdgCjsILx+zUHimzuvQnfrFD8Q1rRvgwv6ATlTAkqmXZpj/Ph
         Leqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916014; x=1792520814;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rxnd0zNui4b9FhnSzHnnD6pCFtdl3q4FWfdc0yDThig=;
        b=0Ac/dc0yS+FlWs65/05E24EkrvLrP7P8ANeUdFK1KjdkJ+XDC0LLsVLKGRN37DLfBb
         VS8H4xFWel9MWTGmqdfwkytocNn7AJU25l5q0oxNWPqD5hqwSKz+d3ReF6idg416P+Kp
         jfN/ZC7KUuWQwkD77I/e0e9+UoGXE8Zdpv+6AT0zIOa6mlzkukgUhFimqrHIU6IG7ROt
         OLIXW1u/T4hy/aHvzL9hmdkvPFOOH3w2KM4YCagSQwT2PiG8XvVpSIwbTtuBGCChtt8a
         KKqQmrfV+aTpglSMsHMU/+NZUnrnkKWvTQUOCKZOK8lwhaeoNFOxBXBgt9opVRnr7+/C
         BjHw==
X-Forwarded-Encrypted: i=1; AKwUvBylZ6d+DgOlDhlWqAum3X0UR0iEegwLUcH7ZjkaMp+HVT1Revhum3aQzsPXKhIy8JdK7sjM@lists.linux.dev
X-Gm-Message-State: AFq9FYJU+B5V0QGN35Y1B7vggr61QyRFrMPnoFQILhI3U3XmeikepmVo
	+R9l7tgH64RIRH9dRHCQld538iwXMBOqq5s1Wje9kwT+yKJHkSU9dIY642EMHnAGFklcjl2bVYK
	efD+/QYyZxQ==
X-Received: from dycmo10.prod.google.com ([2002:a05:693c:26ca:b0:351:7e08:a414])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:83dc:20b0:359:2433:2717
 with SMTP id 5a478bee46e88-359243328f6mr13315609eec.20.1791916013436; Tue, 13
 Oct 2026 11:26:53 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:24:57 -0700
In-Reply-To: <20261013182458.1234616-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013182458.1234616-10-irogers@google.com>
Subject: [PATCH v1 09/10] perf config, intel-tpebs, env: Add __guarded_by and
 __must_hold annotations
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add __guarded_by() and __must_hold() annotations to static parser and
config state in util/config.c, TPEBS state in util/intel-tpebs.c
(replacing tpebs_mtx_get() and its pthread_once() init with
DEFINE_MUTEX(tpebs_mtx) and fixing an unlocked read of
tpebs_reader_thread in tpebs_stop()), and bpf_progs and cgroups trees in
struct perf_env.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf-event.h   |  5 +-
 tools/perf/util/config.c      | 39 +++++++++-------
 tools/perf/util/env.c         |  1 +
 tools/perf/util/env.h         | 19 ++++----
 tools/perf/util/intel-tpebs.c | 86 +++++++++++++++--------------------
 5 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/tools/perf/util/bpf-event.h b/tools/perf/util/bpf-event.h
index da4eeb4a1a73..3f3323f98f49 100644
--- a/tools/perf/util/bpf-event.h
+++ b/tools/perf/util/bpf-event.h
@@ -6,11 +6,11 @@
 #include <linux/rbtree.h>
 #include <api/fd/array.h>
 #include <stdio.h>
+#include "env.h"
 
 struct bpf_prog_info;
 struct machine;
 union perf_event;
-struct perf_env;
 struct perf_sample;
 struct perf_session;
 struct record_opts;
@@ -42,7 +42,8 @@ int machine__process_bpf(struct machine *machine, union perf_event *event,
 int evlist__add_bpf_sb_event(struct evlist *evlist, struct perf_env *env);
 void __bpf_event__print_bpf_prog_info(struct perf_bpil *info_linear,
 				      struct perf_env *env,
-				      FILE *fp);
+				      FILE *fp)
+	__must_hold_shared(&env->bpf_progs.lock);
 void bpf_metadata_free(struct bpf_metadata *metadata);
 #else
 static inline int machine__process_bpf(struct machine *machine __maybe_unused,
diff --git a/tools/perf/util/config.c b/tools/perf/util/config.c
index 287401f159e6..bbf4940ffd02 100644
--- a/tools/perf/util/config.c
+++ b/tools/perf/util/config.c
@@ -64,15 +64,25 @@ struct perf_stat_config stat_config = {
 
 char buildid_dir[MAXPATHLEN]; /* root dir for buildid, binary cache */
 
-static FILE *config_file;
-static const char *config_file_name;
-static int config_linenr;
-static int config_file_eof;
-static struct perf_config_set *config_set;
+/* Parsing and rewriting share the static parser state. */
+static DEFINE_MUTEX(config_mutex);
+
+/* Serializes whole perf_config__set_variable() updates. */
+static DEFINE_MUTEX(config_update_mutex);
+
+/* Not config_mutex: building the set parses the config files, which takes it. */
+static DEFINE_MUTEX(config_set_mutex);
+
+static FILE *config_file __guarded_by(&config_mutex);
+static const char *config_file_name __guarded_by(&config_mutex);
+static int config_linenr __guarded_by(&config_mutex);
+static int config_file_eof __guarded_by(&config_mutex);
+static struct perf_config_set *config_set __guarded_by(&config_set_mutex);
 
 const char *config_exclusive_filename;
 
 static int get_next_char(void)
+	__must_hold(&config_mutex)
 {
 	int c;
 	FILE *f;
@@ -99,6 +109,7 @@ static int get_next_char(void)
 }
 
 static char *parse_value(void)
+	__must_hold(&config_mutex)
 {
 	static char value[1024];
 	int quote = 0, comment = 0, space = 0;
@@ -170,6 +181,7 @@ static inline int iskeychar(int c)
 }
 
 static int get_value(config_fn_t fn, void *data, char *name, unsigned int len)
+	__must_hold(&config_mutex)
 {
 	int c;
 	char *value;
@@ -201,6 +213,7 @@ static int get_value(config_fn_t fn, void *data, char *name, unsigned int len)
 }
 
 static int get_extended_base_var(char *name, int baselen, int c)
+	__must_hold(&config_mutex)
 {
 	do {
 		if (c == '\n')
@@ -237,6 +250,7 @@ static int get_extended_base_var(char *name, int baselen, int c)
 }
 
 static int get_base_var(char *name)
+	__must_hold(&config_mutex)
 {
 	int baselen = 0;
 
@@ -257,6 +271,7 @@ static int get_base_var(char *name)
 }
 
 static int perf_parse_file(config_fn_t fn, void *data)
+	__must_hold(&config_mutex)
 {
 	int comment = 0;
 	int baselen = 0;
@@ -549,12 +564,6 @@ int perf_default_config(const char *var, const char *value,
 	return 0;
 }
 
-/* Parsing and rewriting share the static parser state. */
-static DEFINE_MUTEX(config_mutex);
-
-/* Serializes whole perf_config__set_variable() updates. */
-static DEFINE_MUTEX(config_update_mutex);
-
 static int perf_config_from_file(config_fn_t fn, const char *filename, void *data)
 {
 	int ret;
@@ -737,6 +746,7 @@ static int set_value(struct perf_config_item *item, const char *value)
 
 static int collect_config(const char *var, const char *value,
 			  void *perf_config_set)
+	__must_hold(&config_mutex)
 {
 	int ret = -1;
 	char *ptr, *key;
@@ -853,11 +863,8 @@ struct perf_config_set *perf_config_set__load_file(const char *file)
 	return set;
 }
 
-/* Not config_mutex: building the set parses the config files, which takes it. */
-static DEFINE_MUTEX(config_set_mutex);
-
-/* Called with config_set_mutex held. */
 static int perf_config__init(void)
+	__must_hold(&config_set_mutex)
 {
 	if (config_set == NULL)
 		config_set = perf_config_set__new();
@@ -975,7 +982,7 @@ int perf_config__set_variable(const char *var, const char *value)
 
 	/* Static: the parser publishes it as config_file_name. */
 	{
-		static char path[PATH_MAX];
+		static char path[PATH_MAX] __guarded_by(&config_update_mutex);
 		char *user_config = mkpath(path, sizeof(path), "%s/.perfconfig", getenv("HOME"));
 
 		config_filename = config_exclusive_filename ?: user_config;
diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index 50993b0dedc5..9e8e5d1d822a 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -302,6 +302,7 @@ void perf_env__exit(struct perf_env *env)
 }
 
 void perf_env__init(struct perf_env *env)
+	__context_unsafe(/* initialization */)
 {
 	memset(env, 0, sizeof(*env));
 #ifdef HAVE_LIBBPF_SUPPORT
diff --git a/tools/perf/util/env.h b/tools/perf/util/env.h
index 23d35425efe3..6b2083e3640c 100644
--- a/tools/perf/util/env.h
+++ b/tools/perf/util/env.h
@@ -139,16 +139,16 @@ struct perf_env {
 	 */
 	struct {
 		struct rw_semaphore	lock;
-		struct rb_root		infos;
-		u32			infos_cnt;
-		struct rb_root		btfs;
-		u32			btfs_cnt;
+		struct rb_root		infos __guarded_by(&lock);
+		u32			infos_cnt __guarded_by(&lock);
+		struct rb_root		btfs __guarded_by(&lock);
+		u32			btfs_cnt __guarded_by(&lock);
 	} bpf_progs;
 #endif // HAVE_LIBBPF_SUPPORT
 	/* same reason as above (for perf-top) */
 	struct {
 		struct rw_semaphore	lock;
-		struct rb_root		tree;
+		struct rb_root		tree __guarded_by(&lock);
 	} cgroups;
 
 	/* For fast cpu to numa node lookup via perf_env__numa_node */
@@ -223,7 +223,8 @@ int perf_env__nr_cpus_avail(struct perf_env *env);
 void perf_env__init(struct perf_env *env);
 #ifdef HAVE_LIBBPF_SUPPORT
 bool __perf_env__insert_bpf_prog_info(struct perf_env *env,
-				      struct bpf_prog_info_node *info_node);
+				      struct bpf_prog_info_node *info_node)
+	__must_hold(&env->bpf_progs.lock);
 bool perf_env__insert_bpf_prog_info(struct perf_env *env,
 				    struct bpf_prog_info_node *info_node);
 struct bpf_prog_info_node *perf_env__find_bpf_prog_info(struct perf_env *env,
@@ -233,9 +234,11 @@ void perf_env__iterate_bpf_prog_info(struct perf_env *env,
 						void *data),
 				     void *data);
 bool perf_env__insert_btf(struct perf_env *env, struct btf_node *btf_node);
-bool __perf_env__insert_btf(struct perf_env *env, struct btf_node *btf_node);
+bool __perf_env__insert_btf(struct perf_env *env, struct btf_node *btf_node)
+	__must_hold(&env->bpf_progs.lock);
 struct btf_node *perf_env__find_btf(struct perf_env *env, __u32 btf_id);
-struct btf_node *__perf_env__find_btf(struct perf_env *env, __u32 btf_id);
+struct btf_node *__perf_env__find_btf(struct perf_env *env, __u32 btf_id)
+	__must_hold_shared(&env->bpf_progs.lock);
 #endif // HAVE_LIBBPF_SUPPORT
 
 int perf_env__numa_node(struct perf_env *env, struct perf_cpu cpu);
diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 7c0b8b15bd10..3547496ee041 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -32,12 +32,12 @@
 
 bool tpebs_recording;
 enum tpebs_mode tpebs_mode;
-static LIST_HEAD(tpebs_results);
-static pthread_t tpebs_reader_thread;
+static DEFINE_MUTEX(tpebs_mtx);
+static struct list_head tpebs_results __guarded_by(&tpebs_mtx) = LIST_HEAD_INIT(tpebs_results);
+static pthread_t tpebs_reader_thread __guarded_by(&tpebs_mtx);
 static struct child_process tpebs_cmd;
-static int control_fd[2], ack_fd[2];
-static struct mutex tpebs_mtx;
-static bool tpebs_stopping;
+static int control_fd[2] = { -1, -1 }, ack_fd[2] = { -1, -1 };
+static bool tpebs_stopping __guarded_by(&tpebs_mtx);
 
 struct tpebs_retire_lat {
 	struct list_head nd;
@@ -53,25 +53,11 @@ struct tpebs_retire_lat {
 	bool started;
 };
 
-static void tpebs_init(void)
-{
-	mutex_init(&tpebs_mtx);
-	control_fd[0] = control_fd[1] = -1;
-	ack_fd[0] = ack_fd[1] = -1;
-}
-
-static struct mutex *tpebs_mtx_get(void)
-{
-	static pthread_once_t tpebs_once = PTHREAD_ONCE_INIT;
-
-	pthread_once(&tpebs_once, tpebs_init);
-	return &tpebs_mtx;
-}
-
 static struct tpebs_retire_lat *tpebs_retire_lat__find(struct evsel *evsel)
-	__must_hold(tpebs_mtx_get());
+	__must_hold(&tpebs_mtx);
 
 static int evsel__tpebs_start_perf_record(struct evsel *evsel)
+	__must_hold(&tpebs_mtx)
 {
 	const char **record_argv;
 	int tpebs_event_size = 0, i = 0, ret;
@@ -194,19 +180,19 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 {
 	struct tpebs_retire_lat *t;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	if (tpebs_cmd.pid == 0) {
 		/* Record has terminated. */
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return 0;
 	}
 	t = tpebs_retire_lat__find(sample->evsel);
 	if (!t) {
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return -EINVAL;
 	}
 	if (should_ignore_sample(sample, t)) {
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return 0;
 	}
 	/*
@@ -216,7 +202,7 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 	 */
 	t->last = sample->weight3;
 	update_stats(&t->stats, sample->weight3);
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 	return 0;
 }
 
@@ -244,7 +230,7 @@ static void *__sample_reader(void *arg __maybe_unused)
 	return NULL;
 }
 
-static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
+static int tpebs_send_record_cmd(const char *msg) __must_hold(&tpebs_mtx)
 {
 	struct pollfd pollfd = { .events = POLLIN, };
 	int ret, len, retries = 0;
@@ -258,7 +244,7 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	 * Let go of the lock while sending/receiving as blocking can starve the
 	 * sample reading thread.
 	 */
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 
 	/* Send perf record command.*/
 	len = strlen(msg);
@@ -314,14 +300,14 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 		pr_err("tpebs: perf record control ack failed\n");
 out:
 	/* Re-take lock as expected by caller. */
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	return ret;
 }
 
 /*
  * tpebs_stop - stop the sample data read thread and the perf record process.
  */
-static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
+static int tpebs_stop(void) __must_hold(&tpebs_mtx)
 {
 	int ret = 0;
 
@@ -331,13 +317,15 @@ static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
 	/* Like tpebs_start, we should only run tpebs_end once. */
 	if (tpebs_cmd.pid != 0) {
 		pid_t actual_pid = tpebs_cmd.pid;
+		pthread_t reader_thread;
 
 		tpebs_stopping = true;
 		tpebs_send_record_cmd(EVLIST_CTL_CMD_STOP_TAG);
 		tpebs_cmd.pid = 0;
-		mutex_unlock(tpebs_mtx_get());
-		pthread_join(tpebs_reader_thread, NULL);
-		mutex_lock(tpebs_mtx_get());
+		reader_thread = tpebs_reader_thread;
+		mutex_unlock(&tpebs_mtx);
+		pthread_join(reader_thread, NULL);
+		mutex_lock(&tpebs_mtx);
 		if (control_fd[0] >= 0) {
 			close(control_fd[0]);
 			control_fd[0] = -1;
@@ -473,20 +461,20 @@ static int evsel__tpebs_prepare(struct evsel *evsel)
 	struct evsel *pos;
 	struct tpebs_retire_lat *tpebs_event;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	tpebs_event = tpebs_retire_lat__find(evsel);
 	if (tpebs_event) {
 		/* evsel, or an identically named one, was already prepared. */
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return 0;
 	}
 	tpebs_event = tpebs_retire_lat__new(evsel);
 	if (!tpebs_event) {
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return -ENOMEM;
 	}
 	list_add_tail(&tpebs_event->nd, &tpebs_results);
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 
 	/*
 	 * Eagerly prepare all other evsels on the list to try to ensure that by
@@ -520,9 +508,9 @@ int evsel__tpebs_open(struct evsel *evsel)
 	if (!tpebs_recording)
 		return 0;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	if (tpebs_stopping) {
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return -EBUSY;
 	}
 	/* Only start the events once. */
@@ -532,17 +520,17 @@ int evsel__tpebs_open(struct evsel *evsel)
 
 		t = tpebs_retire_lat__find(evsel);
 		valid = t && t->started;
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		/* May fail as the event wasn't started. */
 		return valid ? 0 : -EBUSY;
 	}
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 
 	ret = evsel__tpebs_prepare(evsel);
 	if (ret)
 		return ret;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	if (tpebs_stopping || tpebs_cmd.pid != 0) {
 		ret = -EBUSY;
 		goto out;
@@ -612,7 +600,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 			}
 		}
 	}
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 	return ret;
 }
 
@@ -632,7 +620,7 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
 
 	count = perf_counts(evsel->counts, cpu_map_idx, thread);
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	t = tpebs_retire_lat__find(evsel);
 	/*
 	 * If reading the first tpebs result, send a ping to the record
@@ -641,10 +629,10 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
 	 */
 	if (t && &t->nd == tpebs_results.next) {
 		ret = tpebs_send_record_cmd(EVLIST_CTL_CMD_PING_TAG);
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		if (ret)
 			return ret;
-		mutex_lock(tpebs_mtx_get());
+		mutex_lock(&tpebs_mtx);
 	}
 	if (t == NULL || t->stats.n == 0) {
 		/* No sample data, use default. */
@@ -683,7 +671,7 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
 			break;
 		}
 	}
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 
 	if (old_count) {
 		count->val = old_count->val + val;
@@ -708,7 +696,7 @@ void evsel__tpebs_close(struct evsel *evsel)
 {
 	struct tpebs_retire_lat *t;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	t = tpebs_retire_lat__find(evsel);
 	if (t) {
 		list_del_init(&t->nd);
@@ -717,5 +705,5 @@ void evsel__tpebs_close(struct evsel *evsel)
 		if (list_empty(&tpebs_results))
 			tpebs_stop();
 	}
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 }
-- 
2.56.0.385.gd3acb90ef8-goog


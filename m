Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941367;
	b=TUFUVH0C2BOoJmLQjLLcWm3QR1tchPN9NclYjazCREec1WT6G7k1lR773XXXcS26X819
	 d7Sp84ihQj6tLohjf39Ur45cyqFsnhg/2Aw9Cm0BbmSM41XxYlQYXTem6mmO9jsCAUAiE
	 quonSg7Sa3cwPN7XySuqaRtFe+Lfa2OCs/oebU1EpWhMvNfLGI92pcdZx6HyWF1/pjQYF
	 pz+FWs3lSHhejbx1DCBg2Tee0/W9l4Dt5EEqMqM+1bGVn44ha95C2IgzMdzld/4SGRLs5
	 vNbS4WOaLLAZglkDZaO32EHIDBUDlO4hh0Av0rZU/VM+ktP8NetKY+Jl8+0f5K0Hh8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=yoH3ChhcAsP2in8XGZeKmf/QvrGpaFT4QlQe+3q16gw=;
	b=TCFUMTqE0u4E1uAl1zl8m6Ce95geMWgwtMsfGOB36ZpO1NCKBYpNJUlM1Hhhx7o6yRa2
	 R/cTYyy27zkPjBdkkKdxj1K5Vcp4UjHZrFJH1AV9P13+euk5oJlUKGdQbrTcT/ZMYJoje
	 /iuffMIfNQCiDQR9iKZo+ZwCpzE7fxyN3P3PB6PFo3ZFSnZoyT/X4fPz6MlmENT1Oi3Dc
	 pnUFR3yLQ+xDWEdPheypBYpNF4oExr1uHoX50foPpHUJLxBtCZCWONYhKCColC0ik8uXM
	 nMcCJLaBSu+AsL7EhaW1axlvOT8+R96uWqH3nnVOi1LUk++Amg0NgYuM37hm/rU5sFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hrLt5CMo;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9234F606A88E
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9234F606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hrLt5CMo
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso236181eec.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941367; x=1795546167; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoH3ChhcAsP2in8XGZeKmf/QvrGpaFT4QlQe+3q16gw=;
        b=hrLt5CMoGggbxenOkpucO35gogz7FNivWzobVirntiFDi2CH4bhDeOqgT1VGwvS8rX
         nZ3d+W3nCjhgt11L56cobqbhev/iHt5bOQp0EDknFBWqS287zg6sjG4qEOWj5ARKnXxb
         LtsJPHl/Hmlwposy+grpgZB/pe3avqjygCTtzNk62SM00Zk8fTm0j4artIl7zFKOrZ7E
         qf8dP/MtNdo6ydbqNtYWn2XJGCzgsY31B12U64V1TGSh85fQ5llyZhFP2J5aaBt5Q0Qt
         2wAC207Ik/R0dFcUQGe1GevXucGIBbahjmW3u54QlUHCziCGBCMFaTyHCUkOxFhF96yA
         GWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941367; x=1795546167;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yoH3ChhcAsP2in8XGZeKmf/QvrGpaFT4QlQe+3q16gw=;
        b=IirSPg5ge4Ir2PAwzTPHsSaIegzs3Lb4BEAR8L1Mok1PJOrnM3x95rGeSUaurvRlcV
         MwqO87tP6Hb25pfs7PDEaMRVyGj8xuOx8mpbLGhFhzKErRGuiOMeMn7mX+Wu53aSiQ1D
         EF4r90K9WKA1r0BchbFgrHXZmHb3D0J3bpaM5Va1l9zpKKIybNbVVsFIC6QT9Arhg61Z
         ywVi2wdnKcURRQOsf8PVFVYGQ9yi9figGQH4TztWDni2Rw+ve+8WhNfSc/sMaNcTRc3s
         zYqSnDkqUSdA/icAHUg/9FxsXBsjmKHMIges7m1LFwkTDIGLkINESoHbYKK6aSNywdWP
         shvQ==
X-Forwarded-Encrypted: i=1; AL+hErGogR1N0kgSluDEYfGGJU7a52UQGZOTG22kggZNTY3AikRJDit/d0wP4nqswKDPBW1DD65t@lists.linux.dev
X-Gm-Message-State: APuU4Z896B5UIoyZEOi1BaebCP+hUlivqw9bGGhWKEr0xzsTiR4aS+KW
	wTwEI6W0k/7kk704usu2K3wLiDUxPTSTx6A1GOu2mrk8rYvNw8rgB22TgPMbOtezzy41yKNyFkv
	kFARjrEl37A==
X-Received: from dycaq22.prod.google.com ([2002:a05:7301:7e16:b0:36a:1148:43f8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7314:b0:35f:8c5d:5928
 with SMTP id 5a478bee46e88-38281213cbcmr342954eec.30.1794941366107; Tue, 17
 Nov 2026 10:49:26 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:32 -0800
In-Reply-To: <20261117184844.99889-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117184844.99889-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117184844.99889-12-irogers@google.com>
Subject: [PATCH v14 11/23] perf dso: Use DEFINE_MUTEX for dso__data_open_lock
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Replace _dso__data_open_lock and its pthread_once() initialization
wrapper dso__data_open_lock() with DEFINE_MUTEX(dso__data_open_lock).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c | 68 +++++++++++++++++--------------------------
 tools/perf/util/dso.h | 10 +++----
 2 files changed, 32 insertions(+), 46 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 3d0ed7b0be54..5be5d224b246 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -524,25 +524,11 @@ void dso__set_module_info(struct dso *dso, struct kmod_path *m,
 /*
  * Global list of open DSOs and the counter.
  */
-struct mutex _dso__data_open_lock;
+DEFINE_MUTEX(dso__data_open_lock);
 static LIST_HEAD(dso__data_open);
-static long dso__data_open_cnt __guarded_by(&_dso__data_open_lock);
+static long dso__data_open_cnt __guarded_by(&dso__data_open_lock);
 
-static void dso__data_open_lock_init(void)
-{
-	mutex_init(&_dso__data_open_lock);
-}
-
-static struct mutex *dso__data_open_lock(void) __returns_ctx_lock(&_dso__data_open_lock)
-{
-	static pthread_once_t data_open_lock_once = PTHREAD_ONCE_INIT;
-
-	pthread_once(&data_open_lock_once, dso__data_open_lock_init);
-
-	return &_dso__data_open_lock;
-}
-
-static void dso__list_add(struct dso *dso) __must_hold(&_dso__data_open_lock)
+static void dso__list_add(struct dso *dso) __must_hold(&dso__data_open_lock)
 {
 	list_add_tail(&dso__data(dso)->open_entry, &dso__data_open);
 	/* Assume the dso is part of dsos, holding it live while on dso__data_open. */
@@ -550,7 +536,7 @@ static void dso__list_add(struct dso *dso) __must_hold(&_dso__data_open_lock)
 	dso__data_open_cnt++;
 }
 
-static void dso__list_del(struct dso_data *dso_data) __must_hold(&_dso__data_open_lock)
+static void dso__list_del(struct dso_data *dso_data) __must_hold(&dso__data_open_lock)
 {
 	list_del_init(&dso_data->open_entry);
 	WARN_ONCE(dso__data_open_cnt <= 0,
@@ -560,7 +546,7 @@ static void dso__list_del(struct dso_data *dso_data) __must_hold(&_dso__data_ope
 
 static void close_first_dso(void);
 
-static int do_open(char *name) __must_hold(&_dso__data_open_lock)
+static int do_open(char *name) __must_hold(&dso__data_open_lock)
 {
 	do {
 		int fd = open(name, O_RDONLY|O_CLOEXEC);
@@ -663,7 +649,7 @@ void dso__put_filename(struct dso *dso __maybe_unused, char *filename, bool deco
 }
 
 static int __open_dso(struct dso *dso, struct machine *machine)
-	__must_hold(&_dso__data_open_lock)
+	__must_hold(&dso__data_open_lock)
 {
 	int fd = -EINVAL;
 	char *name;
@@ -696,7 +682,7 @@ static void check_data_close(void);
  * list/count of open DSO objects.
  */
 static int open_dso(struct dso *dso, struct machine *machine)
-	__must_hold(&_dso__data_open_lock)
+	__must_hold(&dso__data_open_lock)
 {
 	int fd;
 	struct nscookie nsc;
@@ -722,7 +708,7 @@ static int open_dso(struct dso *dso, struct machine *machine)
 	return fd;
 }
 
-static void close_data_fd(struct dso_data *dso_data) __must_hold(&_dso__data_open_lock)
+static void close_data_fd(struct dso_data *dso_data) __must_hold(&dso__data_open_lock)
 {
 	if (dso_data->fd >= 0) {
 		close(dso_data->fd);
@@ -739,12 +725,12 @@ static void close_data_fd(struct dso_data *dso_data) __must_hold(&_dso__data_ope
  * Close @dso's data file descriptor and updates
  * list/count of open DSO objects.
  */
-static void close_dso(struct dso *dso) __must_hold(&_dso__data_open_lock)
+static void close_dso(struct dso *dso) __must_hold(&dso__data_open_lock)
 {
 	close_data_fd(dso__data(dso));
 }
 
-static void close_first_dso(void) __must_hold(&_dso__data_open_lock)
+static void close_first_dso(void) __must_hold(&dso__data_open_lock)
 {
 	struct dso_data *dso_data;
 
@@ -783,7 +769,7 @@ void reset_fd_limit(void)
 	fd_limit = 0;
 }
 
-static bool may_cache_fd(void) __must_hold(&_dso__data_open_lock)
+static bool may_cache_fd(void) __must_hold(&dso__data_open_lock)
 {
 	if (!fd_limit)
 		fd_limit = get_fd_limit();
@@ -799,7 +785,7 @@ static bool may_cache_fd(void) __must_hold(&_dso__data_open_lock)
  * for opened dso file descriptors. The limit is half
  * of the RLIMIT_NOFILE files opened.
 */
-static void check_data_close(void) __must_hold(&_dso__data_open_lock)
+static void check_data_close(void) __must_hold(&dso__data_open_lock)
 {
 	bool cache_fd = may_cache_fd();
 
@@ -815,9 +801,9 @@ static void check_data_close(void) __must_hold(&_dso__data_open_lock)
  */
 void dso__data_close(struct dso *dso)
 {
-	mutex_lock(dso__data_open_lock());
+	mutex_lock(&dso__data_open_lock);
 	close_dso(dso);
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 }
 
 static int dso__find_binary_type_locked(struct dso *dso)
@@ -913,7 +899,7 @@ static int dso__find_binary_type_locked(struct dso *dso)
 
 #define FIND_MAX_RETRY  3
 static int __dso__find_binary_type(struct dso *dso)
-	__must_hold(&_dso__data_open_lock)
+	__must_hold(&dso__data_open_lock)
 {
 	int ret;
 	int retry = 0;
@@ -945,15 +931,15 @@ enum dso_binary_type dso__find_binary_type(struct dso *dso)
 {
 	int ret;
 
-	mutex_lock(dso__data_open_lock());
+	mutex_lock(&dso__data_open_lock);
 	ret = __dso__find_binary_type(dso);
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 
 	return ret;
 }
 
 static void try_to_open_dso(struct dso *dso, struct machine *machine)
-	__must_hold(&_dso__data_open_lock)
+	__must_hold(&dso__data_open_lock)
 {
 	struct dso_data *dso_data = dso__data(dso);
 
@@ -984,7 +970,7 @@ bool dso__data_get_fd(struct dso *dso, struct machine *machine, int *fd)
 	if (dso__data(dso)->status == DSO_DATA_STATUS_ERROR)
 		return false;
 
-	mutex_lock(dso__data_open_lock());
+	mutex_lock(&dso__data_open_lock);
 
 	try_to_open_dso(dso, machine);
 
@@ -992,13 +978,13 @@ bool dso__data_get_fd(struct dso *dso, struct machine *machine, int *fd)
 	if (*fd >= 0)
 		return true;
 
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 	return false;
 }
 
 void dso__data_put_fd(struct dso *dso __maybe_unused)
 {
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 }
 
 bool dso__data_status_seen(struct dso *dso, enum dso_data_status_seen by)
@@ -1169,7 +1155,7 @@ static ssize_t file_read(struct dso *dso, struct machine *machine,
 {
 	ssize_t ret;
 
-	mutex_lock(dso__data_open_lock());
+	mutex_lock(&dso__data_open_lock);
 
 	/*
 	 * dso__data(dso)->fd might be closed if other thread opened another
@@ -1185,7 +1171,7 @@ static ssize_t file_read(struct dso *dso, struct machine *machine,
 
 	ret = pread(dso__data(dso)->fd, data, DSO__DATA_CACHE_SIZE, offset);
 out:
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 	return ret;
 }
 
@@ -1292,7 +1278,7 @@ static int file_size(struct dso *dso, struct machine *machine)
 	int ret = 0;
 	struct stat st;
 
-	mutex_lock(dso__data_open_lock());
+	mutex_lock(&dso__data_open_lock);
 
 	/*
 	 * dso__data(dso)->fd might be closed if other thread opened another
@@ -1315,7 +1301,7 @@ static int file_size(struct dso *dso, struct machine *machine)
 	dso__data(dso)->file_size = st.st_size;
 
 out:
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 	return ret;
 }
 
@@ -1520,7 +1506,7 @@ uint16_t dso__e_machine_endian(struct dso *dso, struct machine *machine, uint32_
 		return EM_NONE;
 	}
 
-	mutex_lock(dso__data_open_lock());
+	mutex_lock(&dso__data_open_lock);
 
 	/*
 	 * dso__data(dso)->fd might be closed if other thread opened another
@@ -1533,7 +1519,7 @@ uint16_t dso__e_machine_endian(struct dso *dso, struct machine *machine, uint32_
 	else if (e_flags)
 		*e_flags = 0;
 
-	mutex_unlock(dso__data_open_lock());
+	mutex_unlock(&dso__data_open_lock);
 	return e_machine;
 }
 
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index a5e8d195f129..e8cd13c101a6 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -354,7 +354,7 @@ DECLARE_RC_STRUCT(dso) {
 	char		 name[];
 };
 
-extern struct mutex _dso__data_open_lock;
+extern struct mutex dso__data_open_lock;
 extern const struct dso_id dso_id_empty;
 
 int dso_id__cmp(const struct dso_id *a, const struct dso_id *b);
@@ -807,7 +807,7 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id);
 int dso__name_len(const struct dso *dso);
 
 struct dso *dso__get(struct dso *dso);
-void dso__put(struct dso *dso) __must_not_hold(&_dso__data_open_lock);
+void dso__put(struct dso *dso) __must_not_hold(&dso__data_open_lock);
 
 static inline void __dso__zput(struct dso **dso)
 {
@@ -917,9 +917,9 @@ void dso__set_module_info(struct dso *dso, struct kmod_path *m,
  * TODO
 */
 bool dso__data_get_fd(struct dso *dso, struct machine *machine, int *fd)
-	__cond_acquires(true, &_dso__data_open_lock);
-void dso__data_put_fd(struct dso *dso) __releases(&_dso__data_open_lock);
-void dso__data_close(struct dso *dso) __must_not_hold(&_dso__data_open_lock);
+	__cond_acquires(true, &dso__data_open_lock);
+void dso__data_put_fd(struct dso *dso) __releases(&dso__data_open_lock);
+void dso__data_close(struct dso *dso) __must_not_hold(&dso__data_open_lock);
 
 int dso__data_file_size(struct dso *dso, struct machine *machine);
 off_t dso__data_size(struct dso *dso, struct machine *machine);
-- 
2.56.1.703.gf848ed807c-goog


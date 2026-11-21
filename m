Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244367;
	b=zFc1okSaSbEE00BNaSgFxknzgHmF9CoARgWfgP9odDAJsZPCuACfeuRWEQNgM5/e0Hxp
	 o9d6gMIJTAdvItbZ5qU+Lh3CoR1E52GZ/BMbTLYdyujMQpTyQDVz6XYZMLU2S3qDt0xKw
	 8gWB1x8UHmMMLUQtK/uZbHpEL6/A5Qeea5B/bKkQQhEOq27wwc6HvPi771wOijptVwCGw
	 bPXHV67ztWddOcxzSlxvTVYbpiPOftvqM+G9vh6zNp/kf7+kYoD1kC7tpoprgD/z3I3ww
	 ugqMhVf3DprbgMnqbI/uc1GWJ4jEIBkkf97lXzx14JfeoxnM2sD5qmXren1Sl4HaEMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RDCUlHefqFEbjMztOptVwPQT+i36K/1j1D4kqeoLikQ=;
	b=40IWoYkg6rfwz64H216KPpftEizVimFGm5P1r8zRIarXDr8782rutB3eOw26khKX2RZ/
	 +yj4g2dGbiENcfyJ1pAXTYV/SQzZwPfUD3kpW+Mcou3DZRGsp3+tZe5ycEKosUwZBRuxU
	 m/7/OF8V6FVkf6T7vKx1/969TKjZAmSxGtBeH3stVvKot1I++Lk3v2v2i5EgyCgcqOozI
	 UZD4D6li/th9yCirhiKi+fLk61vqLuyFsMnXKpzm5tbN3GKoEHlc4YLL+BIiMrOMCN/w9
	 nB5AdzDlHpnwg6hKNdpQGNGlYDe9k1JS+F+Jw/uCmYN7gE4uZ4Ir3RoEP5t/Clt6keQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hr4t3Mq8;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57389606A330
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57389606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hr4t3Mq8
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so1604874eec.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244366; x=1795849166; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDCUlHefqFEbjMztOptVwPQT+i36K/1j1D4kqeoLikQ=;
        b=Hr4t3Mq8lXW3CINjA9C+blKkt5r9C75PB29APsWF5lhI7jQ49ZTizXPxOPmSte+Q1Y
         2rQ8YRsQupRuW9JzDFdoywRi1h+/zv0kLEgWKsnlVN2f+/IeMkJ0BhXyv2rQaPNRdFwv
         d0fU2owUYbKipX/ypmnJaiLHeyX3zHte5nANzQ6xcU84B2EDZeJrQsj1SQc9oog75gdp
         T4G0hdYJeAYzj8bkcWPPxtFx3ojswrDLOBKi7OtqBD5hwbTNCA7qkIEsRud7Y2/wgh6f
         PYDb41YQqiYFxlDXYugYMHbUWu/2zJkyX8BqWHPsx6kMyus9idrUhA1Oy9T/f0KrwZi2
         Xo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244366; x=1795849166;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDCUlHefqFEbjMztOptVwPQT+i36K/1j1D4kqeoLikQ=;
        b=rVl7VKXg6ffMgs8eKF1iWkEaZX6yl/ZJHAk3hlbRyMA9Tc/JGlvlpUmn+PcsxvIL01
         4bhTUVTLMpX6Zm4/V+/Mly++XhTLvoKhvWUsoOdS5zQnJXlz7ii2ZjNAnFyAafj/7sI4
         GBmAnftXkKbtLEazaDdE5o0LKkbbO5Casb3EBPZOHxxVc4lHltTQq1G9bsamhmXXy0ht
         sUAEyVZ5KJ3eeAZnFfwPg3Qw+L4qYEJkXep0DudEZrQud/OC6MLOuyHAch+TW59PesAx
         hToBypmvYjxzaXVD9rW5iN7KjsXDyWZixIDzriSyr78HRO7yw+zMSjzgwb5OakzY+PNv
         eAXg==
X-Forwarded-Encrypted: i=1; AL+hErHM7ju4A4FWL/zeeEcgk944dD97E1FZ4XfBOIHuKQZvhv7GLNShlAKtSnbWSF7drASF+kZa@lists.linux.dev
X-Gm-Message-State: APuU4Z9mguPDOHjlroNze6U+YsYCkV1HtOGov63VbOzZZZi30GKqAyVp
	98gRSFVwqop5P2p6RLOw2t+NT69eiwhhIzVB3Sfh7ksDb4+xc3xccJZYfQW3i3nJThfXZDSY7SJ
	tJ2jYZhFtzw==
X-Received: from dybtt7.prod.google.com ([2002:a05:7300:f407:b0:369:f864:c5e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d0a2:b0:384:df31:6a07
 with SMTP id 5a478bee46e88-3857073eeafmr5062590eec.30.1795244366178; Fri, 20
 Nov 2026 22:59:26 -0800 (PST)
Date: Fri, 20 Nov 2026 22:58:06 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-18-irogers@google.com>
Subject: [PATCH v15 17/23] perf config: Add __guarded_by and __must_hold annotations
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add __guarded_by() and __must_hold() annotations to static parser and
config state in util/config.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/config.c | 47 +++++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/tools/perf/util/config.c b/tools/perf/util/config.c
index 287401f159e6..0e6b77a0a5e7 100644
--- a/tools/perf/util/config.c
+++ b/tools/perf/util/config.c
@@ -64,15 +64,29 @@ struct perf_stat_config stat_config = {
 
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
+/*
+ * Protects the global config_set. Separate from config_mutex because
+ * initializing config_set parses the config files, which acquires
+ * config_mutex.
+ */
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
@@ -99,8 +113,9 @@ static int get_next_char(void)
 }
 
 static char *parse_value(void)
+	__must_hold(&config_mutex)
 {
-	static char value[1024];
+	static char value[1024] __guarded_by(&config_mutex);
 	int quote = 0, comment = 0, space = 0;
 	size_t len = 0;
 
@@ -170,6 +185,7 @@ static inline int iskeychar(int c)
 }
 
 static int get_value(config_fn_t fn, void *data, char *name, unsigned int len)
+	__must_hold(&config_mutex)
 {
 	int c;
 	char *value;
@@ -201,6 +217,7 @@ static int get_value(config_fn_t fn, void *data, char *name, unsigned int len)
 }
 
 static int get_extended_base_var(char *name, int baselen, int c)
+	__must_hold(&config_mutex)
 {
 	do {
 		if (c == '\n')
@@ -237,6 +254,7 @@ static int get_extended_base_var(char *name, int baselen, int c)
 }
 
 static int get_base_var(char *name)
+	__must_hold(&config_mutex)
 {
 	int baselen = 0;
 
@@ -257,10 +275,11 @@ static int get_base_var(char *name)
 }
 
 static int perf_parse_file(config_fn_t fn, void *data)
+	__must_hold(&config_mutex)
 {
 	int comment = 0;
 	int baselen = 0;
-	static char var[MAXNAME];
+	static char var[MAXNAME] __guarded_by(&config_mutex);
 
 	/* U+FEFF Byte Order Mark in UTF8 */
 	static const unsigned char *utf8_bom = (unsigned char *) "\xef\xbb\xbf";
@@ -549,12 +568,6 @@ int perf_default_config(const char *var, const char *value,
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
@@ -737,6 +750,7 @@ static int set_value(struct perf_config_item *item, const char *value)
 
 static int collect_config(const char *var, const char *value,
 			  void *perf_config_set)
+	__must_hold(&config_mutex)
 {
 	int ret = -1;
 	char *ptr, *key;
@@ -853,11 +867,8 @@ struct perf_config_set *perf_config_set__load_file(const char *file)
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
@@ -975,7 +986,7 @@ int perf_config__set_variable(const char *var, const char *value)
 
 	/* Static: the parser publishes it as config_file_name. */
 	{
-		static char path[PATH_MAX];
+		static char path[PATH_MAX] __guarded_by(&config_update_mutex);
 		char *user_config = mkpath(path, sizeof(path), "%s/.perfconfig", getenv("HOME"));
 
 		config_filename = config_exclusive_filename ?: user_config;
-- 
2.56.1.750.gf70dc682cf-goog


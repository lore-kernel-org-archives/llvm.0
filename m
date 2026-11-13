Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588156;
	b=sozJ36cvYLCOaoVfXiIKSmZxL555r+7OMwET/TyT/5AM0fUcAYuHiW/9G57tj6Z3406o
	 UZjAN2skTi+qh8d7b7xO3aoR1+QDHkBZ+wFQGrC+0VIdO/rrsmGdFb7d9kl9EngfOpcqq
	 40CxutbNa3UoT8r+HHQpKuxGCnjUXhqgbIA3Vgtrm0d58hA9c1owBteR4Sq8RLMQ0IwZP
	 Mjt4rYHC1dF6g3daaa543VIKZfZyizHyOLyBFh86XuxD23x0Uf2unJW5R9UIygI2WpODu
	 nmz/lHfWLnCbwkLRiQt35zxIcEUFdakHMOYZ2oy7Qw+iDyc10zwivbJ1Uizl576wjmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+CtJcrEtN9eDgrldMUwlTf29GauoIVdfb5xQnIMdbpo=;
	b=3PLeTY142LdXmtwTWwJ+BHOFVY8P0wmnDLUyHeNwDMEioyubymMAyDb3bHpI2j9ArkSF
	 k4eVASd3lNxEllHTG/rTWIdIW3tfjutgvh0o8q1bhjCKocTC12go+Oje9Q0+WZrima2rl
	 1KWBH/Hby79taBRNJPQTUrDqBBa0gI8kSP/548zqizlRCtmhR8alykIlPKLrTAQzp4yzl
	 FRok+7ddef+w3/rWSt6RCzgpURslulpXrII2bGeSb5GTpVt1+p4Zi1hX4BdnTJTo3nOSN
	 UmRUX+h7yQEdeTfCLoHjgwGzfQhzTuNFfHLIcEJhrZKqohjEOtFIwCg5pv41Ui2V+GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o6fvVPjz;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6E660A380B
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF6E660A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o6fvVPjz
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso5265943eec.1
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588155; x=1795192955; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CtJcrEtN9eDgrldMUwlTf29GauoIVdfb5xQnIMdbpo=;
        b=o6fvVPjzRYcdLFMQnuqNMcxnGgx3fqdVkTdhKWntwEiUm3DYF1Wk1EyphWWSOYQ+/W
         9NXzgwZ+BEG+cqVfB/xf8g2j48jo8bLZxAdg/5dAA10PZ9jTvWTEtq0PdvYyQ1cSP2zx
         L46oJbTWShvI/Zx4yq8j5PSFgzeDQzTZ7pHXOvoL3ecvqZcd8GqsQBKGtJyQA/ChkfiQ
         NbIMjRjIuo4TCqhUoeWjN7hIQGm4ng7vG8c3g51XG8NoJq3JX4Pt8gb49wwPGNDLs60D
         S3I+pJ0h+nMQIQrIYTwgswafdiW+ittmjybtNCJFlYFekfhBZHtlfYfqc/3iK9AWH5Md
         5cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588155; x=1795192955;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CtJcrEtN9eDgrldMUwlTf29GauoIVdfb5xQnIMdbpo=;
        b=qwx9ABK7/oLPqNForaMhrV9Wkp8nlrJrNV/klJpmaptVgDMWr22D6CALOX8EhHtU/v
         Hp811+oCiWXs3l2GrM/KsO5Q+bHLW5nE0d0FdHRoAFHpUdQvsrJQJ89yjJ7SAwUoecRN
         marirYGN3xL9dYHgqv9MarqEXgpdEsQoBhdmC6Lizoc2BTFYkXWx0CSFX1SYZWOo57IS
         SwuOJBRgYpMrKPht0c9gDd2to2gAAIVbxdsmuvEAG709IrS0eh7TjvnO7L/vK7Ho8L/7
         g6HiM6DnyyZt/aF92CNXf6RLGf1XtNMmHOqacT3Wu8qdGZEtZNBsR1yLtosdogKpe4b6
         cong==
X-Forwarded-Encrypted: i=1; AL+hErEEg24bSYVFWCTMzyllAnNBGwOPf88D8LFw0pHzRA1B4yzWdljyuuVvSfwgqq67EbjE46UO@lists.linux.dev
X-Gm-Message-State: APuU4Z9ACsdhVQRqRe4lsWFYrj8p50DBlkKve3Nko+TSZd3WGmg23AWv
	UR0gz7Eb+5lm+T5F1BHMdxA+eNQ2KZm16kY5gGpskNPHq8Kf2uTp4eEp1TjB5oGKmBZ6a0OrEJ2
	Ma7dC0zLvig==
X-Received: from dybou11.prod.google.com ([2002:a05:7300:e5cb:b0:369:68b5:ef])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:7a01:b0:376:5b99:a816
 with SMTP id 5a478bee46e88-3796395425cmr2784047eec.3.1794588154664; Fri, 13
 Nov 2026 08:42:34 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:48 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-18-irogers@google.com>
Subject: [PATCH v13 17/21] perf config: Add __guarded_by and __must_hold annotations
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
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
2.56.1.703.gf848ed807c-goog


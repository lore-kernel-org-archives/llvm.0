Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941379;
	b=faSTGBzaPd3Iqzz4YsxpwErmp97lXnwiS9kwdq8cpHNjfCZN6UkZSJqoLKeEzdxh/5pA
	 qrE/p5qHmNYnewD8MCfUTNUl/GUKvxyHvg0Ef+0161CD0CsZHfZVf2t3EqRlIPjwPrva9
	 5en4jEcVanAuljeJ3yKwUXRrGE6cf6n1PO2DLmBlt/9T0fr9JkRF0taThHoGCmlwLSbhw
	 pqDRmXw2dFsOm0cz037VUp1rYD0PQyEfd0cjJuX8dEYfyjQsqdURy+/VhS/tcCBv/Tr1a
	 1ZVKCDezOBJpetFHI0JQgEXHYBFqK/p9F8V0/SGrf+9d0nMCU3zBMxXa8kCBPgxM1gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+CtJcrEtN9eDgrldMUwlTf29GauoIVdfb5xQnIMdbpo=;
	b=ZamXABjNrKf/wwn+EgSV4g5Rv/lvBg0R66neWArtB9CItb9AFzowbj4fzhit4EtfkID7
	 SuodcytKgUEqH3Df78XEZe4+TaNApzaj4jJMMmXAXamsls2nHGzJbGTyrqosWg5F6sFmu
	 S5pDYfrs6+nDgfJap4LZOntCBp1U9MRdpfZWbOUCEMJOeMegvP+lQVHQILT6aD4YNngPr
	 D8z6bH2VX2IuGaWZyWVatCnaIqh/pyXu93q+Qd4iVp3DPAcbGJ/W1EqlQZI/7rj5xEqot
	 +ZggFYpiB8I5gdjWZKGGfmrjVf8CnFs5RD5HKFFL6HSDKw9QORg3gS0fRthWt9Z5w5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Buvh9wWN;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E93606A331
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E93606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Buvh9wWN
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b238436265so110532c88.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941378; x=1795546178; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CtJcrEtN9eDgrldMUwlTf29GauoIVdfb5xQnIMdbpo=;
        b=Buvh9wWN15bX8lCjLSIg3PWbF9Th5vgsCfOBp583mZ7T+GhBjRUZ0y203rfzB1ZOR/
         spTbQGjcvjJijVQASUNcwPUDB5bOT1sqxxZz6MmiN8KIrNt95RwmlH8hZfA8oVhZyJvt
         MdQXHqR2QC831mcD8gFeAe0+vppUgHcnG1UJp7wrbxXS2VHVqctngR97iftrGkfjhDd5
         RqFTGJZPztk3QlUqCJFYASOOs4VP58Ln4UdNk2rCydnDZQJMZpG7wC+BHI3lA3RFm/pu
         DObpKaLtHbbrCqmKTBgg8RJn5ynUaAsT9JnYKij9g43NvjYPQmSKgTbqQ3FrCxZzQ1DM
         hZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941378; x=1795546178;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CtJcrEtN9eDgrldMUwlTf29GauoIVdfb5xQnIMdbpo=;
        b=tuC9jYFZT6vHB/P/MXGt7gnQIKoFc8CqxhPPAqrL55wN0pqb3MjN73TCJVWpEDcCUu
         1gz9d4607ARIWR604GLnLfXIURmkuqKLCuukGsou/dmzz63+cLEMw+iBAN/lkaRCpzjd
         3gxjQbo1JpN7q/guqpy3dmxEmP2OPE5SvEk48V1mYEL9Cy/eUF6++TWdbg91pfEw2gSp
         8Ny9naxs2THRqfsoa40lxRa9EIcd9YElVDlyozDblCmHgjaKYMSdLOaQlNX29qUkVNIW
         l0nM0wQdMUEhk4YVizX9yL1KEqvtIQjZ9G5qFNVT9tLEfScT5Q0kWHAT5EOXwvid/MCY
         Xpig==
X-Forwarded-Encrypted: i=1; AL+hErHPWrj8KFD8pw7RXCAMJGe3A34xge0D9eiA6GfCzl/ZrJ4SFNFz4cg5sh9BrtpLp5bxe/O8@lists.linux.dev
X-Gm-Message-State: APuU4Z/bNVC/T2teMzSj4X9ZPhw1cTGe/3i2xxPdZiZ68nkehunG1oV8
	kpRDHQEVdUDdTWkb/WhFhcDDAEy7K3RXVCVh9A7ZHoPot8arZJGh+hON3TrpvHMRHoeKRxIRgZH
	VSIFXoSMuUQ==
X-Received: from dlbef6.prod.google.com ([2002:a05:7022:f46:b0:1b2:6c20:7e86])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:ccce:10b0:1af:16c4:d06b
 with SMTP id a92af1059eb24-1b543cb50c5mr349354c88.10.1794941377630; Tue, 17
 Nov 2026 10:49:37 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:38 -0800
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
Message-ID: <20261117184844.99889-18-irogers@google.com>
Subject: [PATCH v14 17/23] perf config: Add __guarded_by and __must_hold annotations
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
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
2.56.1.703.gf848ed807c-goog


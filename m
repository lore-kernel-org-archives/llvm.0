Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BD125A2DA
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 02:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200339; cv=none; b=fw154znlxbN5PB3YF3W9yRusnJd2u6vVeRpvQdHBFg3I+U0KrydOk+dvVxqVZwylQTeW7eVvYuMqKHivP5DsshwtsWendd+UjNliEEjCbGKrMhjrnrJ3G3X3ojOozJwxEcFoH3/qjHbuvjKNOXMMlXw7cHM02GW5SRfcEPUmWVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200339; c=relaxed/simple;
	bh=jb47W2mefivkhEZpeuyQPhjnJkRHRCJ2NscvV1apXQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+RYEI9f1VmiU4X75JvzNnGs7oir6QOUt9wakj8D43/hms/Ed9BwaBSBiShFoLS+JOd3Bj/Dc6PJTib6Y+n3Tzq5DckMm4YH8ygISj9VBzpRkk+kAFfUebs84XppSIG0mCsAy66oABUZ8Og4l4Fe5VN7f2LK7Z7Tg+u2WY37lSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct0GT8/J; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct0GT8/J"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2681660d604so51083175ad.0
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 19:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200337; x=1759805137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFRia/GHfKKxxNt0IUc2kN+EVm0fmr2Lz8hq8oGCXGU=;
        b=ct0GT8/JCBvKO1pj2SjMBcQXxpKC54PEqSVv7NFHK8HFuu1VD7z+iWI/xdO1XgCT/D
         dNRc5s44a86pIZFi7o8JFscpBQYAo0Xr/ziZognrio0BzcJA8CgGOTAeagi2D6D02Gde
         9wYSEmvc0ONhTgcNmzsZfjQwkTlxd+wM3rInU9dk701xIH7MIsUZcXBl1Fm4t3c0IVv3
         dAC25qhqm3DjCWV6eSrIa6qnvFCBqfLsjyxYcxxgDlwE4UXZ/VIEbWZFd2fZciLAYGjC
         HUeDKfs59oWsfa44FS0tcaREeVLGvhGDhYbGHnnTRngZRQucOe7kluU7giazqqQXwvAI
         d21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200337; x=1759805137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFRia/GHfKKxxNt0IUc2kN+EVm0fmr2Lz8hq8oGCXGU=;
        b=KsJ1pZgJnbgX0AKWKhsWUYHMEyIJGTTcbSnFgTe5rnM0hZ79kjuaouM8WqiQtBA4i0
         SDvRWf4MlFjL3DLoxsyV5w4SIDkiwOSGQBTbQAqrrFZgOneZpZFyEHWIMmEB2jIDzI+f
         ms7uiVLXkgE261JAaKBqdaegtpO8BVsAViivYR8w1AY1hccpu3C6XjSrNmIbgg7TkHLY
         H7ACeJJ1C+CadOvHhgY/iPTcSJztQHmgrUqRV4FGqWduti6iBOi25Ty9uyRtoWCnOhmw
         izVttXqozluyThhuh2T17JDSwYt5cQ02H6Lv4IqVjQmpKng23YdFRPCnAMoGFGWa78FD
         3QlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV7qBTjRddLtba1Nc0xrS2YedgrktBJCZyIrxV91X7sGimuFfxPjpE164d1TOCClFMoHKn@lists.linux.dev
X-Gm-Message-State: AOJu0YzHrb+ltUbPBQrxkgO1N2PRlKAtT0q3udjmVtAx6YbyYTSgKe6o
	PfRdFSEquIuGO6qFNAqEcEZFhFwYppCOdK3erdxiiLeMuGBZw89y4/uo
X-Gm-Gg: ASbGncu6FQsZ9Z8XP+8mTKYoiD0Y17pmD1o9Q4vT74bzy+EKL3yjt06i5hrVgy3GGrz
	hYmA4m/F13fmib5L90wuAtEt03WOxE+9WdUW+DKV42CQJ27LGGPrjFTq6hLF0ldohQLb5ALGlaZ
	qt9HpwS//1wAsm9JYkZdFwkHMWXHyq+ghtKH2QaW9UceUkfigz9RIGYOi97efDZ0Vc8Y5PqL4/E
	XvFBSPn03dSdCR/rHwYPU+z+FlhGnnX7J03jVk1XJdLb3z/4MqjdhkPMazloRScqXaEZdOWwbo3
	bGGmW2ni6UNtzN2f1zhEdHy/e1u9KjiLCB/GGjdnSBNXuN7GKtq5SD0yJbnrITyGNLOIXaYT2ue
	bu1MmF7ZRnec/lWt+fRL+FhXD8Aj7E2/1KBxWfSQVs2DC6RMjqdXQUVz114vBG/5Ezgt8eX4nM5
	Ku
X-Google-Smtp-Source: AGHT+IHKpBUnWq+gpU5Sy4KTGKE+VZZI2OvvUEv1k1IBPSw7fn6QhmyAtdZNGDjD1lnTAGMCtuFmNA==
X-Received: by 2002:a17:903:2442:b0:250:999f:31c6 with SMTP id d9443c01a7336-27ed4a3165amr204393375ad.32.1759200336891;
        Mon, 29 Sep 2025 19:45:36 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55bf378sm12519152a12.50.2025.09.29.19.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:45:36 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Rong Xu <xur@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Nam Cao <namcao@linutronix.de>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	"David S. Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: Jinchao Wang <wangjinchao600@gmail.com>
Subject: [PATCH v6 15/23] mm/ksw: manage probe and HWBP lifecycle via procfs
Date: Tue, 30 Sep 2025 10:43:36 +0800
Message-ID: <20250930024402.1043776-16-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930024402.1043776-1-wangjinchao600@gmail.com>
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow dynamic enabling/disabling of KStackWatch through user input of proc.
With this patch, the entire system becomes functional.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kernel.c | 60 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
index 898ebb2966fe..57628bace365 100644
--- a/mm/kstackwatch/kernel.c
+++ b/mm/kstackwatch/kernel.c
@@ -14,6 +14,43 @@ static struct ksw_config *ksw_config;
 static struct dentry *dbgfs_config;
 static struct dentry *dbgfs_dir;
 
+static bool watching_active;
+
+static int ksw_start_watching(void)
+{
+	int ret;
+
+	/*
+	 * Watch init will preallocate the HWBP,
+	 * so it must happen before stack init
+	 */
+	ret = ksw_watch_init();
+	if (ret) {
+		pr_err("ksw_watch_init ret: %d\n", ret);
+		return ret;
+	}
+
+	ret = ksw_stack_init();
+	if (ret) {
+		pr_err("ksw_stack_init ret: %d\n", ret);
+		ksw_watch_exit();
+		return ret;
+	}
+	watching_active = true;
+
+	pr_info("start watching: %s\n", ksw_config->user_input);
+	return 0;
+}
+
+static void ksw_stop_watching(void)
+{
+	ksw_stack_exit();
+	ksw_watch_exit();
+	watching_active = false;
+
+	pr_info("stop watching: %s\n", ksw_config->user_input);
+}
+
 struct param_map {
 	const char *name;       /* long name */
 	const char *short_name; /* short name (2 letters) */
@@ -117,8 +154,18 @@ static int ksw_parse_config(char *buf, struct ksw_config *config)
 static ssize_t ksw_dbgfs_read(struct file *file, char __user *buf, size_t count,
 			      loff_t *ppos)
 {
-	return simple_read_from_buffer(buf, count, ppos, ksw_config->user_input,
-		ksw_config->user_input ? strlen(ksw_config->user_input) : 0);
+	const char *out;
+	size_t len;
+
+	if (watching_active && ksw_config->user_input) {
+		out = ksw_config->user_input;
+		len = strlen(out);
+	} else {
+		out = "not watching\n";
+		len = strlen(out);
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, out, len);
 }
 
 static ssize_t ksw_dbgfs_write(struct file *file, const char __user *buffer,
@@ -133,6 +180,9 @@ static ssize_t ksw_dbgfs_write(struct file *file, const char __user *buffer,
 	if (copy_from_user(input, buffer, count))
 		return -EFAULT;
 
+	if (watching_active)
+		ksw_stop_watching();
+
 	input[count] = '\0';
 	strim(input);
 
@@ -147,6 +197,12 @@ static ssize_t ksw_dbgfs_write(struct file *file, const char __user *buffer,
 		return ret;
 	}
 
+	ret = ksw_start_watching();
+	if (ret) {
+		pr_err("Failed to start watching with %d\n", ret);
+		return ret;
+	}
+
 	return count;
 }
 
-- 
2.43.0


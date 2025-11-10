Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD80B3054F0
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792709; cv=none; b=GjNBd+F8oAG57GoM6uoHUTC/r8y6kp/AoBoi+Iyo3GZpde21eZtN4iHBYLvQNG1K8sPbEElvn//giz+viVJjqi8S5qP75Obv8AkekwbRobcwdB8Wob39Ol8YnlLBY6tpVmeNx/k7WC0995SHpCZMIeR1kkU7uf6BTkxz52NLvIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792709; c=relaxed/simple;
	bh=ARZpIKOlBzKXjre3Q9k7I/0rPX2+0FVqcnLvQ0SL+xQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTupWsCuncaDcksmMWyEcHMUdQtbpz9HDZzpyHInmnRQvt6Ee+Ow2dRuqH23Vd4J2J+RPVjrJxQPgFioMQm90FkN78GK/fKiixeQWxSZ2qYkEVWDOsxqDhySz5pSjWthVCOX6QQoAjH3Opf4riAQmXgbuf0taKA1I0l2qthndLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1wOBmPG; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1wOBmPG"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7afc154e411so1890852b3a.1
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 08:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792705; x=1763397505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OV6BMzpvIqPwW8tqyoqDeqegoFqswySAQs38qdvsWjQ=;
        b=h1wOBmPGkJ56cnfDnvXQMEQ1AKCQGF/KglPRyhAwbYnSwUzj190FqGxD9BgVPzSl03
         BNeb8Fh50HEIjuRHRHzDA5S+0GAh1A6KKPacSAKuZRt8AIRufa5H7hptjUpqAffbBtPu
         5fvz36fIuSKxXzdbAC72JzkRuYh+0HI8X7flhOa2xVJrV7kjUnQeEU3RZtHgPU2RM7lt
         YKcjOTMthvmCFhoUoctjONyeR1kChx8Fpez2YYpDCUVrX85FsjoxJVa7UMMQEDSe3g66
         3mgyK576/XqaffcbDgt9kQ4uZoJ906oMLQX3GtwiV5M2rfUJl7w7a39uXZKo+iYDPQAI
         gIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792705; x=1763397505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OV6BMzpvIqPwW8tqyoqDeqegoFqswySAQs38qdvsWjQ=;
        b=fBMgif+uqMbaKJJMhQGC6GcUEvv+wZktbwh1K/yqOaucpiBWbUJ9SzXwrdBqFoKWfc
         KN47qhHCNjKyylDdnKwXPfTL/mU9NGVWBhOIzV2P/Gu4vSHBk8I+Bpbr6sXgArSZ3XmP
         1bej2ZZrM3UU90gJFJjJ6FDYdEpFdPC2Qb7E7L4aVDAiUxT5MM+RPo1EcY3uuIOJgik2
         XfKKorUU32QZZ4SGlCezC85hoLoZJNMvpjfTfz1XuecS6FALawLkPPyOjiUuyZzds3z4
         84BuTf2D9QYEWwAL5Lwg9/aORIE7vOn5Ny151RH7AZiAHiGJNsQJt3X4AS4mahxLdJZ/
         uurQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcWkDgS7V+0hjYBk+vBlvxVaZl9x/9/T5bObFB+HsX9dQiOmAiGaJlF2XEP4dai6Ghpzs+@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5dQIPVt78XxCCcq1/M2H9s09HkMEx12WbbvFiSwrG2NSwyWg5
	1SJFJ+f8F8PMja/JnlGaEgOxwIXZLx+/mjExtMSiLuBZ7fi6soko5PmU
X-Gm-Gg: ASbGncuqAjPPtC6s5s95iGq+CL/cAbL674pbnA1AeVSldfWnO7L4/BeJA16KrTYiUv0
	yZI7DvAP/HF793e+sCQ6gpMqZsJ8bk4oTxu73UOD2n9A9fIJyiKIgWOEdF9OAmY/ZXqh0OdaoCH
	82A56folDhnujMKCFgpIGaTXyKAZUkbS+kkpOamG0MO4+GOR4QB4UnqWu1EhGrCGFDrGyjbKSbq
	Fkbt3Mq5jkZ4hYEoCbO84lS8+sG2fox3caMlMaI94k3SxkCf6wW9NCuQN5vsmSqsOYPr1ppsH30
	OF5M114comB+e9jqeohKw+gS4TXIWxk1H/vkxnmg58tEGMhHrdjIW6AEWu7/OLGx+/Jo3VQu6pJ
	UJPhxUuh/i6IFvke9JoSHvcW6NcHAATD1j1blW+0u4Jtr1GhlIOQ+NSflqWjsiEMKV7IaaiXLAQ
	6ndsqhbitFsxYlWr/BynyMOg==
X-Google-Smtp-Source: AGHT+IFPqCK5s7mZ0bMPwZdYahUYIC+qd++YwSpdh6nmmJ2pTVRZoEYmMMiGsvaFI6blh1/WMmJ4hA==
X-Received: by 2002:a05:6a00:883:b0:772:4319:e7ed with SMTP id d2e1a72fcca58-7b2277caeecmr11401444b3a.29.1762792705147;
        Mon, 10 Nov 2025 08:38:25 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccb5a31esm12324547b3a.63.2025.11.10.08.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:24 -0800 (PST)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	David Kaplan <david.kaplan@amd.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	Kees Cook <kees@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	"Liang Kan" <kan.liang@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Rong Xu <xur@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	workflows@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v8 23/27] mm/ksw: add recursive depth test
Date: Tue, 11 Nov 2025 00:36:18 +0800
Message-ID: <20251110163634.3686676-24-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110163634.3686676-1-wangjinchao600@gmail.com>
References: <20251110163634.3686676-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a test that performs stack writes in recursive calls to exercise
stack watch at a specific recursion depth.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/test.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index b3f363d9e1e8..1d196f72faba 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -17,6 +17,7 @@
 static struct dentry *test_file;
 
 #define BUFFER_SIZE 32
+#define MAX_DEPTH 6
 
 static void test_watch_fire(void)
 {
@@ -48,6 +49,21 @@ static void test_canary_overflow(void)
 	pr_info("exit of %s\n", __func__);
 }
 
+static void test_recursive_depth(int depth)
+{
+	u64 buffer[BUFFER_SIZE];
+
+	pr_info("entry of %s depth:%d\n", __func__, depth);
+
+	if (depth < MAX_DEPTH)
+		test_recursive_depth(depth + 1);
+
+	buffer[0] = depth;
+	barrier_data(buffer);
+
+	pr_info("exit of %s depth:%d\n", __func__, depth);
+}
+
 static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 				size_t count, loff_t *pos)
 {
@@ -73,6 +89,9 @@ static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 		case 1:
 			test_canary_overflow();
 			break;
+		case 2:
+			test_recursive_depth(0);
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -94,7 +113,8 @@ static ssize_t test_dbgfs_read(struct file *file, char __user *buffer,
 		"Usage:\n"
 		"echo test{i} > /sys/kernel/debug/kstackwatch/test\n"
 		" test0 - test watch fire\n"
-		" test1 - test canary overflow\n";
+		" test1 - test canary overflow\n"
+		" test2 - test recursive func\n";
 
 	return simple_read_from_buffer(buffer, count, ppos, usage,
 				       strlen(usage));
-- 
2.43.0


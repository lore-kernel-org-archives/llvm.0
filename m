Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28922EAB72
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007501; cv=none; b=sER4Y/FbC7ZQk1o24rMLFyLvmZi5gW+FM18tKZMgCLJY7rIxgB416SpsEwgXpX9XJ4EjM4xta/RD1WqGapb3g9MVHBqxSwSA0cbe0UWr0hPLcSJRdn7wRg1q9edslsNkD5KJ5Xg5oi5RO4dyjF5ff+B89LfEVoUfyUjOEDtf62g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007501; c=relaxed/simple;
	bh=4AK69KqpFrfryQfFlxiqdszD58BNzBtZp9+AZ2x2szQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cf3p81tlpZ6qOhWibckA+e5C/QJ7xNTkyjEqRQBrdmogInUMx+hvJbIOJ+lkRmr3XkQJUVUdsrC7NkjFyXsw6ljfv8gqf3ybqwQBC+p5+Clpt/IMTaUy4XHtw303+o8E5edQGo4+veCx99aspdpA4NcXXiKYiq2wOoV1BxTv+GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZ9pGOqW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZ9pGOqW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3304a57d842so744978a91.3
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 03:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007499; x=1760612299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyJZmUduTn6h/ct8/Xe3ui1NubLI+U0SzVd7OlZC6q4=;
        b=mZ9pGOqWnppYMhezdkfJlV3aQxJMMB+yG72xDIE+ojKxCOFLteZ2XsjMIy+t1Y5bH4
         ZoM7tYDjawinvYKhey1RkIi9r6yMatj/yZzSfVL8krJZaI4qILC0Rtt1jaDnKeCiLUaB
         xsXUH+Vwh7t0SIn8Z4S1i9JJ1u1yk59vmGsWY1B3lF3fVhXEKBc8B45trYdojC+RY8xc
         9Nuf9BIenFU9UDV5IwfXk+fj0e3xIxhlDTlQEx9sptoA9DQE9wArH6cTyO0HLmnG6NfT
         YHydCS1Q797+hjQ/szR2G+k1tqnymO0QC8ik5q+KVjHRb9v+L3DF5glAPnOIe9evXYea
         o2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007499; x=1760612299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyJZmUduTn6h/ct8/Xe3ui1NubLI+U0SzVd7OlZC6q4=;
        b=sFBGfMSOgT4lTaa6uBq1uwqj6nJwyetjbLcZvP+VYrXPfI1/i49/edWSS9dUNK4D76
         KMzahpDr3+o9ylXsqfTGPmerqn5T7o/dIIs/C5l/mLZM8zsUDvRr5YK+IlbxjucVEsgn
         pT5GXqxK6KPS9CXTxkexfF7iMhdrPEO0zZkarpBffQglNKW0mtwSECl/bjhzSCfAYdK3
         V76pcU0GfoBAmTSBVe+J/kuL5PN/5W7IewC2o9BOl6a659R1St682PdkjTirL+puIw7N
         EtYM9/8+mvyjkLUp4zZazTz+MELQ+ATFoFlwd09aPRBF8LgI0inmeLvS/k1Y9kUqZNsa
         Fvkw==
X-Forwarded-Encrypted: i=1; AJvYcCUeE4Swd6jJ+hL0EcI7FZQH7nlvs+BF4LX6argdNZret/N2tqNeAwPHW1Mk7A7gnbjZHc78@lists.linux.dev
X-Gm-Message-State: AOJu0Yw89r+Tn+kLN39Ft/geHmtyk+aeAVk1uIt8U1hh09d90nxxhoI+
	G9SWDj+CD3fwJg+mkVIerLKzySkOOXBGwHGtLGItpjL33OI6wsy8vPXY
X-Gm-Gg: ASbGncsxYdHTxl32lCJ4AIeTOM5JF9CSHx5wPHVPk1/lF24zDf1PGlc70J/l1xuDplw
	sFVYAdLR9FRRVw+36w8zX4ZhABWFHc2Mw4HYMLsKjjRWCn+JL+buoZNgZvduvPInRSb/vB3PB8G
	opUeqVuL27O5a8+YTte/U4V6G5KIJ48IW2sJ642qgk0QzMzLnGP3ZtSYUvyd76+oo5RMrAATC3+
	naM+f6mRxJ11qTwMMJSIABkLMhR7mdvNg2EtqWhzngbpUBy2ANVZdqRRQhu5luLzJ66JsezRa/j
	dP/dbqb2vqMXbSlsxtg7yXAuVMAGzk3qoHgxlKjDdoqH0Wb7Sf4RTonEdj5tHenP6ppJc9tOITK
	4bm010JBdJz4thHhfz+jrownHvLhEqF+OfRZYmJp4u6HWfKAFisjmRYuUsgnImTl/eSsw/ts=
X-Google-Smtp-Source: AGHT+IF7XK4PU8M1yAqeyUxzKM38g7FsehoBLZ3eJ3Xub26Q0OuA6NSoqSKwX8dJhtbar+wuz4p6HQ==
X-Received: by 2002:a17:90b:17c3:b0:335:2b86:f319 with SMTP id 98e67ed59e1d1-33b513eb68fmr9866604a91.35.1760007498698;
        Thu, 09 Oct 2025 03:58:18 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b511135a3sm6725691a91.11.2025.10.09.03.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:58:18 -0700 (PDT)
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
Subject: [PATCH v7 18/23] mm/ksw: add stack overflow test
Date: Thu,  9 Oct 2025 18:55:54 +0800
Message-ID: <20251009105650.168917-19-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009105650.168917-1-wangjinchao600@gmail.com>
References: <20251009105650.168917-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the test module with a new test case (test1) that intentionally
overflows a local u64 buffer to corrupt the stack canary.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/test.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index 80fec9cf3243..012692c97a50 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -32,6 +32,20 @@ static void test_watch_fire(void)
 	pr_info("exit of %s\n", __func__);
 }
 
+static void test_canary_overflow(void)
+{
+	u64 buffer[BUFFER_SIZE];
+
+	pr_info("entry of %s\n", __func__);
+
+	/* intentionally overflow */
+	for (int i = BUFFER_SIZE; i < BUFFER_SIZE + 10; i++)
+		buffer[i] = 0xdeadbeefdeadbeef;
+	barrier_data(buffer);
+
+	pr_info("exit of %s\n", __func__);
+}
+
 static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 				size_t count, loff_t *pos)
 {
@@ -54,6 +68,9 @@ static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 		case 0:
 			test_watch_fire();
 			break;
+		case 1:
+			test_canary_overflow();
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -74,7 +91,8 @@ static ssize_t test_dbgfs_read(struct file *file, char __user *buffer,
 		"============ usage ===============\n"
 		"Usage:\n"
 		"echo test{i} > /sys/kernel/debug/kstackwatch/test\n"
-		" test0 - test watch fire\n";
+		" test0 - test watch fire\n"
+		" test1 - test canary overflow\n";
 
 	return simple_read_from_buffer(buffer, count, ppos, usage,
 				       strlen(usage));
-- 
2.43.0


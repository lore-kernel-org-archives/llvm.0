Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F18226A1CF
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 02:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200352; cv=none; b=gDwwz/FO6HjnRh6miyMct2ZfNG2z532FMGc04P1+pquygUgtMkjTmjui2HRe8VQv9I3WCVOy6v4rQKF9WR3vCI6M7xm/BnJKPtTpwfTJdi9NOFWNAFyH2aBrGWThZ8mB28X65XpNfnBqewT9zrAAd18bIsMfeQogfNyLwT+APrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200352; c=relaxed/simple;
	bh=4AK69KqpFrfryQfFlxiqdszD58BNzBtZp9+AZ2x2szQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPlRHfL776yy+VNVWt5ARXcLdQnotHr7p7mtdV+xhXMoX1bO038I3RfXXh3pjzxVEvkqN/NyCDWJV2py2EMv1YkVth+SFnXU7O2HFq1F7tvqCWPAPJy5Z2VIqBV/w24C5P9LBh2DZZpHuu4kcoJVzSES9oQzRg33s1uPhNueSgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0GEHt86; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0GEHt86"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so1928056b3a.1
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 19:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200349; x=1759805149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyJZmUduTn6h/ct8/Xe3ui1NubLI+U0SzVd7OlZC6q4=;
        b=F0GEHt86XW0izHyiR7PS6RaYk9iqgTmmZkNJRvGY+ctqDsrbdRBKgNBM8vwX3tAp/2
         +qm5ynoy4fCZV6ShjVQjeIEsECpbYwBeMeiUHTYjFTHX+quI6IZxF+cVUv2+t+045QCC
         AmMmubhV3fqnl/YzaSb4GyMQeAtb6EV/aFcQTehWLkvlS1nDNlKaMC5RzdcM22yXY9lC
         IYegW6RQL3GWDjVKfsxJgzhtd8JPMRXkhqFY8hd0Jln01tMB1bUxk/GRpxtEUtEk36ow
         59GVNxc9DbxLnPIZ6uygkmgpT+CSoETQ0rpnLT3PRNDFfM6Kr3btDmghy0npftZKjCoI
         JQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200349; x=1759805149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyJZmUduTn6h/ct8/Xe3ui1NubLI+U0SzVd7OlZC6q4=;
        b=iPs6TbbbQg6aW2f+hkiMLS1A99j48lfyxVSTV6sVAvGdewsYy7pMK+nzX8hY2moXO7
         RPgcMlsgGy7UABQv8XFtoY9fhHhuDe0g8DfjSZdKmiNgEy0qJLTz8w6XFu5XzAZruX+8
         8WiEcQbZ7balIjG6xNoHfCvkE18g9MP7/k69zfs+cnkvptY4pbYdAtm6TbscREmfBGnX
         TxzvLKOaOUpjywk762aLK1zRc48Wq4y76dtk4BsfgnzBnUM7a+ydXj7p8guxZbvHjBB0
         ZiuUK4KvNVSWMG20zcy0gCy5M7js3OAdCVXUknu+mW+uWXKPCwU4TLWOGIMXp+Y+WjuR
         k5ww==
X-Forwarded-Encrypted: i=1; AJvYcCWAHPm+kJ/vMuYEVD2m1Gr+nT+MCxWrzwQ44qRq13hlaPkvwQhoYLRY70CaBHZ2ZR91sdJz@lists.linux.dev
X-Gm-Message-State: AOJu0YyGk+QlxMYJqfEne0APaEHiTx7fUfEBDsDXzv7xuzLdKmHMsdHi
	uouI3uUv6OxqyQxHUoRoLwHIotNg2se36aHhQdKTVRdReeZEkQxD5j2d
X-Gm-Gg: ASbGncvMrVlCdy7r3VQPL5tEtPAerNJFW8/CCYyN3iam5Wpm4Ztg5T9XHrmFg7kNF5I
	uOFquW4PNk45z8dgw9qiTfZY0nja7OuPiHb1/xpDmm1A+WjIFEZ+i1pyQLxe3Qc0+H0nAeFcm8A
	KuV+Xlp1/hUvqVOioaaH7QbxE8eZSs5tu04Gkv8jS/CuMdYAuBgaZx+kePErCh4MHicS6pH5QBi
	UZ2zfB2CcnCzTqw7+YivrNeFLJ17UdXCxqxbLvlHe5D0lK47r6l6Z4pDAaDxNxEUb0bznJ89I44
	8qVRyCi7TJJZh5Tk5PzUs8hjzhtd7WaKoD8LxxdkVMRbldOhiaZxCNKLS+iEbSOWNSEygk65AP8
	efYVCkZD5M7l/ZnT0/4XzSog/O+cgyJ4x3hVM14cdnebeurDs4YheZBUa4JctTZTi/V8UpiVFJm
	AY
X-Google-Smtp-Source: AGHT+IEG0ThZV7fyWTs1y7QMeQlbcUpJL85C4JXPKzErGd8yhJciSmW04rCMUIpToCmcRIvMPIF8Hg==
X-Received: by 2002:a17:903:2352:b0:249:44b5:d5b6 with SMTP id d9443c01a7336-27ed4a920b9mr200539425ad.40.1759200349322;
        Mon, 29 Sep 2025 19:45:49 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6886c9csm145811695ad.88.2025.09.29.19.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:45:48 -0700 (PDT)
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
Subject: [PATCH v6 18/23] mm/ksw: add stack overflow test
Date: Tue, 30 Sep 2025 10:43:39 +0800
Message-ID: <20250930024402.1043776-19-wangjinchao600@gmail.com>
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


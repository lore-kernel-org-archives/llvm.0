Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795A926CE0A
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 02:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200357; cv=none; b=uavAulkVrDTfOoayQykF2OCFGoPdv9dZpXvh36ojvoOpi2QLpo/XVhy1gCjZY94ktkM2BG274RH9ghTcvmbpnMsIpF+yhlzMDshEGKqomC1jDj69FE+HOMjQXDcMVdxiDVK+zU5OhmAKcUt3no92Dlz0WljQXKKN9AckqT0BZnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200357; c=relaxed/simple;
	bh=WUmvecag/bRJ9LbEABvkcHBuLoUzQ3sY4/EKuJYpRQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMlRu4dxHEZtqjEFWV8n1tMa6u4O1YoOpDbfc7bEJ1dPlDwWAmaeG6CPR95RhjepCAlvWvo20PZcbK2/HGbiXF7L9KgltnraklgJRWFm/0zMaaamBzcUuZwL0ihJzsrqiFU64exSUCq7vpHuBN9lAyXlsrqkLq4IoyqM3QZIgAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ar8WjPi/; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ar8WjPi/"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-780292fcf62so4128382b3a.0
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 19:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200355; x=1759805155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANupiyfNlS++I01zMHP5Qbsc6Wgfn8wZLgNnwRsiWjA=;
        b=Ar8WjPi/MTetr+ADKS01odUfBodxJSaTgVDkqgAuRsa8lKeCw4Pr9NIYUixa7037s2
         k4vy9TsdQQ685D+qHZz2XCw4eyOLAbybycg788u3HI7JerALMnCE6ZH2VK46KMMR2/PY
         2lpL/Cdvwe+SyrVZewNCd0ZYlSUmyWL2Jx+/PQhUUBgJw6C8gXSsOV6KxKFQeQHFtozj
         QmpT53riaR18CWn6k+/bMxg+tecEZABEXvdDkE/duiS4VYylea8whP01BcCxGMwf9YRy
         QRxqI7/RpbbHlDw/CC6n3YkOZWykDM4cMCLU2IR4pUZm1Zk8XmZrin4+8rea0/nSyQLU
         ZGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200355; x=1759805155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANupiyfNlS++I01zMHP5Qbsc6Wgfn8wZLgNnwRsiWjA=;
        b=m7JE/O7AM/KP6lP7SHthuSE3/WBNfttwpY5A6M3SpY84Wmqy+3QjSIJHCKxM3aJ/p9
         qQXdXyLS5LOeDCROwB4kVSeThGpfGLTPO3HojhGOPACZvdOxP0X9gV2gPqlE8cM0rjMF
         MsH2UihKOXuaP8ep0/tLPEGLwZ/IM/kUmSbhwaf1ZP7PWySNdvGs9S9pmCoC2w7jC1h2
         D8/tQUkMmUMgRT1+SGdwJeTfZuRiIG/jW6G+re+2LzmoTHQylkOEw0cniFyUDkqUsLtx
         cYNWcOooljBAYnb0g54qWj3nFrrgGXg1zGOQwwIkadxj245OOnAaTs86br8U6X6RvVTF
         V0TA==
X-Forwarded-Encrypted: i=1; AJvYcCXmAMztr3fCywxkMTtkbzSj4ISxAXxJ1t9CxTSI//RpcnnlqnMNB6pmhg9nyvTeUc6d1g70@lists.linux.dev
X-Gm-Message-State: AOJu0YzkfNEthA70BO5zMdrcOpBWzgyRkRDA7sxSAwLhRb+5fDY2qNh0
	Mu9dfuFJvtXk7dxoLSCoS+H3bIWjKffVifE0P03EJAn/te2roql6a6/WgO48GiZV
X-Gm-Gg: ASbGncsozlT5/mwJLdbOe6d/VkYPxoAyZFLKqSUYUBfQipvNT7z1wTrgqM1aX5KtkCg
	p+bq9dsHDCGEuGzakJ+XoCubTTMNER3WP8sqkW5nY6OcdAsv8wHCuIM/h4zf2tB7WhFMQcA6AcH
	qqNuEakR+KRuBbKQI7OguuxVV+1NKg56wGBBJjsX2lsI6F14CeqFpML5LZvHBKdBervT9ntUuA0
	qQeG2GxjNk124YvK7AM71VBKRNw0pNgjfZCgCMOaNDCJmbLWpafENMfTBbmeDswUE9csXDCvoQT
	KRVSR6B+0kUUl24RgXkKt9SpSXtW+Zn+H+tkY2htaJqwZ3qdaw69Nuz0wXDYqqSY7j4AMKAgrVy
	Myz382pbAG4o61wyfI7Cz3Z5SNXD9oqSkkBCNPCQtnAri2KcpsYgyr1rtV/VOWS3jf2EVMadDse
	+3
X-Google-Smtp-Source: AGHT+IFgQx8Uh36EA0aXny7DSw1dXOgHQg+bo/K2OmzhGw1sKK8D6YsVYmNHfsV+5mgUHC/7blvjEg==
X-Received: by 2002:a05:6a00:3cd4:b0:781:261b:7524 with SMTP id d2e1a72fcca58-781261b762bmr11615416b3a.14.1759200354649;
        Mon, 29 Sep 2025 19:45:54 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b2ec47sm12565336b3a.50.2025.09.29.19.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:45:54 -0700 (PDT)
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
Subject: [PATCH v6 19/23] mm/ksw: add recursive depth test
Date: Tue, 30 Sep 2025 10:43:40 +0800
Message-ID: <20250930024402.1043776-20-wangjinchao600@gmail.com>
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

Introduce a test that performs stack writes in recursive calls to exercise
stack watch at a specific recursion depth.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/test.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index 012692c97a50..203fff4bec92 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -18,6 +18,7 @@
 static struct dentry *test_file;
 
 #define BUFFER_SIZE 32
+#define MAX_DEPTH 6
 
 static void test_watch_fire(void)
 {
@@ -46,6 +47,21 @@ static void test_canary_overflow(void)
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
@@ -71,6 +87,9 @@ static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 		case 1:
 			test_canary_overflow();
 			break;
+		case 2:
+			test_recursive_depth(0);
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -92,7 +111,8 @@ static ssize_t test_dbgfs_read(struct file *file, char __user *buffer,
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


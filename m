Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576E32EB5A2
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007505; cv=none; b=alg27ne8VedOLn6xQ8TJZw4ypuCNPPPC6Qv4UQHhVofVCnA+64BY0qKue/oR9xw+drcL7ZenvGMq/XyI8+Umg+ut4v29RSgd6AD4HmE+CS65/pHt1IFrASXjJsb3Ro/bWFSSG6xTGrBiKfzi6yYexTcN+qY5u5G2ga3KtEdp6HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007505; c=relaxed/simple;
	bh=WUmvecag/bRJ9LbEABvkcHBuLoUzQ3sY4/EKuJYpRQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E0fW+M/ql6Q3iW1ckhsAMFpWKIyL/OOidoghc93CSNQrV5U/eUz6bUK4d2nCLam2DR0OduiF1TOGL0Cu8CnQ39ZZdQy7PFQlJ/A8VOebh2OS7iH3VFJL6jpDpJzBqwpWxSJX0H01hYs7qWIh+FZ1RItMUBppguG6yxuRTdxJGuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZHRD8Bd; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZHRD8Bd"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7800ff158d5so771244b3a.1
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 03:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007502; x=1760612302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANupiyfNlS++I01zMHP5Qbsc6Wgfn8wZLgNnwRsiWjA=;
        b=BZHRD8BdH9t1/BGFTYTyPNQnZhEyh7whdjbfUdXL+JYOhtFZkh+QvVVQjwFE9WB/76
         /Wlqc9dnQ21juFlf4o6A+LUEuAK4bsmp+ULiv1pX1+XHNgS5Y9WTTJJ8qkgHl3lf9a5q
         zdjnUuDcoPEXUxn5zz2zbSOLoGYbgo17nTEPtzs8cvhL3Xx1B1cuqmEZeKkd1j9j7pPm
         liFYfZ2p4/0Z9DKs3pW0ftZX015xM5HpSxNj2T4CXqtpHknvZIkjgdEQRF+jQow/+S1x
         tM8tcN8rsFgbAdaanRcsQhbo9/FmfhtxFwV6VkglXWN24jnTMhgA8DI3FYKjbkQnplQM
         1Ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007502; x=1760612302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANupiyfNlS++I01zMHP5Qbsc6Wgfn8wZLgNnwRsiWjA=;
        b=L++Z4DIbGqkHlJ7nFSB45/rQx2Snkaskmas61NHavOg9AH1e2rM0CSSi83prlCP3Ne
         vaunXAOTqWj70uEzksfYAMXZRJn/ml4bQz0zG8/O1AsBHvid0NvBOWrpzIBEhZncl4tr
         pgbyMLGVWrfLbIQremzVbEpN0lknKE+aSmx0UKinQubCHTxJEb51ljvC3KdSwFYF7DV/
         +uLCYbV3dDIKSyA/N+u88FbuEqNOc1SsuJUclsXnJIrpElYVyE31hhsVtgZtAtSk381g
         GUWziham4JHF66pz2kA2FShG6z/QABZYT8lvfdjzCpZAq5C1eCZKFSCtwlDa0Wq4oR/p
         Vpcg==
X-Forwarded-Encrypted: i=1; AJvYcCXvEKyg2Dhd8LUEjMMZfsFWpiBrPHRQPcI6eBQ8kzZJ2Qb1yuki0g/0fcCjY+oW6/ChtxEm@lists.linux.dev
X-Gm-Message-State: AOJu0YwYOmaXYIKFsNftPf6j+fDSlwPltob7+nhoES1Qsy7j8TF12Qrc
	BOFRwC/oy+zxm6FZeekmcgh+Bv7Jcc6azmn+TrtokXlu11cZ0MilBwNc
X-Gm-Gg: ASbGncsGXUO7LZnHl7yIT2ZQsQjIc8rvMz6nSGnsz/onTO4f4QYcRHQ+hjaM7anBLRG
	I5OTGwiFSTxprHnbJcVKzXJzaqYXAiReUuRMpLIF9E5D/RDHpbQTsx8jRLLM3jLHaVN1JVCoQ9z
	VQOP+nYg/AfeObjM+0PGSmWnHElFtXyp8FkVV5bVjyF2tVQeV410gy0VagaN+UpJKXbEiqk5dPw
	lH66yDspOrEBIwegnsMq/dsm1ZxzswHXSGEIEpweTy6CE6lK4tPEHhf+2ZVUcxdT7y3C00bOm73
	7cnaUQfosqsD5m8UpZj1nbzqkFqoQZECm5DieqZ4ErY3Ee1coiiVXwLSomu8IaJ1r88nF2uDxFw
	Ne/Tib2kHps4in4UMLCMUNq8msUd/Ji8JqkN/nrfm1VmPpvwlLSdw/s9Ex2Q0gssR313Olis=
X-Google-Smtp-Source: AGHT+IGL1hfkw824Dhg5abUxp0YVqhv+dnuC2o95edaELXUy1UgmRHSa3+FhXmUlSur2PmpUVijsqA==
X-Received: by 2002:a05:6a00:2d96:b0:77f:1d7a:b97f with SMTP id d2e1a72fcca58-7938782ac68mr8582957b3a.28.1760007502437;
        Thu, 09 Oct 2025 03:58:22 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e33f0cb3sm2487606b3a.78.2025.10.09.03.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:58:21 -0700 (PDT)
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
Subject: [PATCH v7 19/23] mm/ksw: add recursive depth test
Date: Thu,  9 Oct 2025 18:55:55 +0800
Message-ID: <20251009105650.168917-20-wangjinchao600@gmail.com>
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


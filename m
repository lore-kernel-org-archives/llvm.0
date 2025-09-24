Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073C0303A1E
	for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715239; cv=none; b=Z1W2O8RjTGAnBmzCoMStlgDut0ZcXufJ1TIpUCGFWwQttotY5AbczKxxN5dX1Yhu26ZnYMiR1xeUzv2OqdgB+c5m/7j6xwNKgUA7zFiFG6KkD4QDOlhVflj+p8NJA+PMCk8dsFsqc4roEn9mi9lmyIQ8jknZzmrL76jyRktGNvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715239; c=relaxed/simple;
	bh=zf1JTLa2lHlWHJGslx4oSS8c+FpP61ZIVHBr6hXJkpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSC/QiJxwF6vNP1zOmpssQd7CV+gjnAd5fUnUNOhskupocmsnAMKNmMDGG78TBjzXk40qemejZSg+JmPEKfufR3+7eyoARu8HroEXHnsV/L5RksbB7DTSZBF3X0LSfg/WXrwWiNdN/vph5kXneCuM7RQ3qlMIStvVl1pSyLXHG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtUFnaTS; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtUFnaTS"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-780f6632e64so169991b3a.2
        for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 05:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758715233; x=1759320033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UG3CF7kwzv6QR3Bvbfu+t4H41didNmIt1FZDrUojazQ=;
        b=FtUFnaTSUDxL1vIg+SUkiuUqEvVtL1wN3/2HLXLk1yvatxkILsOA/nKG7Hjfjo6nkl
         sdlMF31R2d0Au54PCm93SYj6EqaxScBfMgoCxGTmcRtVzm93BOYMeAyWuDbNKFmmDC1a
         qbUof8Wlg6orxZi2/o4WiFluTh/aONUkTuVnoZ9VTvKpOzu8htN8P+vhD+v854NVX+T4
         fsr5EMNThvXNikg27buRgq1sbDfiskhYFexsUWFpSEK0Omgm8s/0vXegpgiuYyj+Dnup
         fehxIxwHLaulKUdHHzhSzgLSoAnQXl2KTFBN8ZrW2hXz1GMn/q/IT+u2fevosnsi0orY
         sIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758715233; x=1759320033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UG3CF7kwzv6QR3Bvbfu+t4H41didNmIt1FZDrUojazQ=;
        b=ZzC00SWLAXM1htDNW3jXwcOA6JOPaulOIrkohnhDGxlWpjoihsXpp8ByYACDjTMtKp
         jubWxvh950KpUOuh9ZZUe+L6DmaL7SNmKjrKpORg6qexAZLxGL9s3ye2+ueSfre7vxmf
         Te7FrU4UV8dCt3KwvLDYlK3wiKEZ24DMxqXiqIN1MFQEZ22clK1tAAkp7FdN8MxvUNwo
         Yo0gyS0OFzoxJFdIfZz0JtDmwdFm4gxTrWftyPVNQQLY4+YY/RK5NFWD28IrfxW9Da23
         MucRJa0/CByI64w5iUt7Y3Cn8WqD7lw1JoT91qiW5WdbV5Onbk/0WQJQL81lsTKfz+rj
         Bz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUt3lJtO4XNs4KbPHoAbSXIvt7Aum+Mo6hUShGmx3P33VMcPSVIJxDrji4AAs5kvF0VKHDU@lists.linux.dev
X-Gm-Message-State: AOJu0YxCbiTXlRSyltjTvrKaIAWu4ncn9ktfpcXZFHe2KxrGKsmDM+4i
	N4AXUNNDFjbJBilUMNNvq8eNhP27b0hDdXz/zr4YFyaXspLzGIHohmu3
X-Gm-Gg: ASbGncu7MDJ5SdT1huZoGM8HNJqAPC4iXiY1V577OYOwR4Ee5IE9TXj5TtudTVZASuA
	gL74s785+DxPVBIqc7DdR9/FPEad8I5Qf4fz4i1zSwtlkpn3u5LAb86rF6Qgxzjv0HwVqcJSEDB
	wEd6cnlXTumJPxtgs341OxxLrDE2wEex606EkzPdf73x+nHFhE0J2k9zNbO+4r1GuR2JBDcmTKO
	ACSzn9tlQIKHonDYodyaaHaoHwHTBLXd1HAiOaUCbiXkbSA67wlsTbLSgEu2gaTuZUTAD+OWU4K
	6F1HBbQ7mXmMiTqI+h2+p8K4I+LIX1oBppu1OgIA20JprzpCtSDdEzwSup8d+kRtooOticgZKPq
	fFfxlBNlLZBE1WBSbtvX0dJk7m9FI6tSkmA==
X-Google-Smtp-Source: AGHT+IF6XISRPA3i1YO2WYyo3MXp7Cd4Mk+kPP9SRfGztdCTTVjypRXE5hBz8PjgkCcvzgR6cUkWDg==
X-Received: by 2002:a17:902:f609:b0:26d:e984:8157 with SMTP id d9443c01a7336-27cc13808fcmr63875775ad.8.1758715233064;
        Wed, 24 Sep 2025 05:00:33 -0700 (PDT)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802df57asm190476695ad.67.2025.09.24.05.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:00:32 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
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
Subject: [PATCH v5 19/23] mm/ksw: add recursive depth test
Date: Wed, 24 Sep 2025 19:59:25 +0800
Message-ID: <20250924115931.197077-4-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924115931.197077-1-wangjinchao600@gmail.com>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
 <20250924115931.197077-1-wangjinchao600@gmail.com>
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
 mm/kstackwatch/test.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index 740e3c11b3ef..08e3d37c4c04 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -57,6 +57,20 @@ static void test_canary_overflow(void)
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
 
 static ssize_t test_proc_write(struct file *file, const char __user *buffer,
 			       size_t count, loff_t *pos)
@@ -83,6 +97,9 @@ static ssize_t test_proc_write(struct file *file, const char __user *buffer,
 		case 1:
 			test_canary_overflow();
 			break;
+		case 2:
+			test_recursive_depth(0);
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -103,7 +120,8 @@ static ssize_t test_proc_read(struct file *file, char __user *buffer,
 				    "Usage:\n"
 				    "echo test{i} > /proc/kstackwatch_test\n"
 				    " test0 - test watch fire\n"
-				    " test1 - test canary overflow\n";
+				    " test1 - test canary overflow\n"
+				    " test2 - test recursive func\n";
 
 	return simple_read_from_buffer(buffer, count, pos, usage,
 				       strlen(usage));
-- 
2.43.0


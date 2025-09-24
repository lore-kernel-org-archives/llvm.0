Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6292FFF9D
	for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715221; cv=none; b=h+sXF/AXNAEFB6PR3K7ASaC8dLvIX6xhISlWArCNlumaAXdbM1Q62Xjq1wQz4FRZI9d+mfAlr9lOmGz62b5ieWn5vF06hje/bOVsAWSwV1Kr7x5nJvT6zfHSBBW6KtUnarZkXzgVCmGpZ47mTE1q3jfp0XMbG7iyP+K73xMmUto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715221; c=relaxed/simple;
	bh=zgbvGJBSx4YBKNkqO/qzz/La9XfnZ3vAatfFaQMoL7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFSgs5myxYovAvoFij7KUOkcBrLWFVZborx9Sf3M/VjJrJDz0CBZZ8wOOKNB5jOvPFTHknsweUz90RA0aZUgc1aQCrVXH4UFglmYcwWQDaKf3N7MNdgzjND+YkBKCc7/IIOV7rpni/+8Vkcq6spHXlCE5x9BvwOxXKCZZh9k1FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SezT9BnS; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SezT9BnS"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b555ab7fabaso2341310a12.0
        for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 05:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758715215; x=1759320015; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmaGbmiuxIsK0xKTEWJ/f7gfwC2bw8p0SOLh4b9Z4FY=;
        b=SezT9BnSFtcC8K+jetNd73VWJ4E9PGxipayuHoupiAAWMmEr4iHt3SroYvVCb2o912
         xw5qAXrQ9f1gQrd4AwHMZr8hIQTW1OV8s5wFc6GEmAiHwE5duVrQtLZyDlbuV+AQ6HKE
         G/Lz6xKijar5KI3C/XSAguIRbVGKF+m/DVla1AyX+SQZ9S8TWwcFZd6HAQFrARj8VTFG
         tgAlVZQwOPkS82ajJkx20/4zivWZOKV9WCsYqb3zukbQez8ORHGk3NNz+Flp0FX8zcc3
         F6VHn4V+V16LyXxC6/C1/ylupSN9YcY4cz4GQ2Buw936pKEVFPhpgwLOmQIdLImfvM1Q
         LyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758715215; x=1759320015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmaGbmiuxIsK0xKTEWJ/f7gfwC2bw8p0SOLh4b9Z4FY=;
        b=emsqr9Ge7JUke7mUJONi6XyP2WcPlfWFvN/TattAm+LjqxYI9whSPYZDPYcESGgBfG
         yNcDATyhY2+6TGm9G1B+sFI2TGI37/wNwqwHYqKQWqHT9myp44KCqP/MMmsnB9C4WZwT
         qSVMVHU+t3+D8QxkwklIBH5IzOWzQnbbh1jynBbwdkPuLcxpI/K1WX4+GgXdI/5QWcuY
         nk7UCtmF5d1xPm+Csys3FRVuk7RBXEHpTEOsR2U8UdbVRFQrPEcowinDgvWuXW3i5k5c
         WoP1Cx4FPolnxBkf18Su6dXMiCbpoaVb1cYjqt6ccYxssvufmpTcnsjonHTvRpRrwijc
         Cjig==
X-Forwarded-Encrypted: i=1; AJvYcCVTQuXcAmHByjuwT0cWmv83T+QerGW7R8wTvrak+XI715XjoI3nmUEB2+RreDZkuIj04XVd@lists.linux.dev
X-Gm-Message-State: AOJu0YxW4JDnFfk4bTE5su+La9A+kRe1/T3KT4skmR4B8VPm9oNTmA0v
	Duo7kD9oxibakX2yKdoWqzmaxmDQ6vR/bi9/aqFQZ4k++652whEWSZEV
X-Gm-Gg: ASbGnctkwm9Bm7G3l70Fd7GpnaaaNJZP9kXfCXHJwITMyEDzNpewGzgCaBhgKJMzeHF
	L0A+Cpp0Y9mA3RLPKscIRf9EZ09ePOLWiwR3fR1RZp8MERlhFAYCjO8yK9OM+5IEty6g7rolnoN
	WmmGRgY2LyIvZq/M4YR36LJRYeqHe04Rk54A2/KZukMU6JLFx0SpCeDgdqIzIz208STUef65PrS
	MoB+Jw/99E3LG2fYzh/KYOQTN3AvMTLssiZioTzpTJ7HsF/gtbqOOdcPgNAANz5j00KMSN0gz0a
	1w4bDYOkV3NLAY5ibP663Jo40ukZISDhpssYzgikeFpa8PCADhNr8fEOXJMDrCo617JdtRkacU6
	NqqSXvbvPcDeE/Q18GXiPzrE=
X-Google-Smtp-Source: AGHT+IG5AidgxW/pjwMRKvZXF7BqnVmuGXBXEakixJFL1V8tNMywu8qGgSCIq0aUezqYi7cmWgbNjA==
X-Received: by 2002:a17:903:2450:b0:268:f83a:835a with SMTP id d9443c01a7336-27cc9a91248mr60312585ad.60.1758715214591;
        Wed, 24 Sep 2025 05:00:14 -0700 (PDT)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802de5dbsm189402185ad.84.2025.09.24.05.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:00:13 -0700 (PDT)
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
Subject: [PATCH v5 16/23] mm/ksw: add self-debug helpers
Date: Wed, 24 Sep 2025 19:59:22 +0800
Message-ID: <20250924115931.197077-1-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924115124.194940-1-wangjinchao600@gmail.com>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide two debug helpers:

- ksw_watch_show(): print the current watch target address and length.
- ksw_watch_fire(): intentionally trigger the watchpoint immediately
  by writing to the watched address, useful for testing HWBP behavior.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kstackwatch.h |  2 ++
 mm/kstackwatch/watch.c       | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 4045890e5652..528001534047 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -52,5 +52,7 @@ void ksw_watch_exit(void);
 int ksw_watch_get(struct ksw_watchpoint **out_wp);
 int ksw_watch_on(struct ksw_watchpoint *wp, ulong watch_addr, u16 watch_len);
 int ksw_watch_off(struct ksw_watchpoint *wp);
+void ksw_watch_show(void);
+void ksw_watch_fire(void);
 
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index f32b1e46168c..9837d6873d92 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -269,3 +269,37 @@ void ksw_watch_exit(void)
 {
 	ksw_watch_free();
 }
+
+/* self debug function */
+void ksw_watch_show(void)
+{
+	struct ksw_watchpoint *wp = current->ksw_ctx.wp;
+
+	if (!wp) {
+		pr_info("nothing to show\n");
+		return;
+	}
+
+	pr_info("watch target bp_addr: 0x%llx len:%llu\n", wp->attr.bp_addr,
+		wp->attr.bp_len);
+}
+EXPORT_SYMBOL_GPL(ksw_watch_show);
+
+/* self debug function */
+void ksw_watch_fire(void)
+{
+	struct ksw_watchpoint *wp;
+	char *ptr;
+
+	wp = current->ksw_ctx.wp;
+
+	if (!wp) {
+		pr_info("nothing to fire\n");
+		return;
+	}
+
+	ptr = (char *)wp->attr.bp_addr;
+	pr_warn("watch triggered immediately\n");
+	*ptr = 0x42; // This should trigger immediately for any bp_len
+}
+EXPORT_SYMBOL_GPL(ksw_watch_fire);
-- 
2.43.0


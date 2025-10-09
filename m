Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161912EA174
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 10:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007493; cv=none; b=XLpydWpwaLAtwfRGcxylRI8CbiivqDi8RSdRkVRjIfVAiR0wU02vjBFdpG6QkQaa1HVJHXvZr5MJUIIlZeezz6Yz1ehxbEjJfzC00ExlFBilo0bxtnoziguzi0uqMH9OGrmV7/OMCcOC1ZqtBVrxvGrXP+4My6vjxI2iy2KAWy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007493; c=relaxed/simple;
	bh=zgbvGJBSx4YBKNkqO/qzz/La9XfnZ3vAatfFaQMoL7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b86clgGjZKvnyaQ6/uWEn/b3KZW/fnrnOLbAKbJ9TsC6wx0Y8nDYlHrJTzrKWbWvquvuTlfICspUQ9OeeLxsan3hBni/QbHX3G4Tm00STdrsilSaIPG5dkzzqEHY2PGo/ndWA+HFHcG3OYhd1D23E04IJgjBbcW+Q21h9GEwJys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqecCbLb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqecCbLb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-267f0fe72a1so6095015ad.2
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 03:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007491; x=1760612291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmaGbmiuxIsK0xKTEWJ/f7gfwC2bw8p0SOLh4b9Z4FY=;
        b=dqecCbLbgHZ5I2QZLzcP14KGc3BA41oOI82WDTooUE50HxdsjAuFnBYl+LSMMDAy5w
         Ok3UoVJScyk5roQpvS0HMJ414n6lSD5P13qiJpJuBaoj+6QwNnWWvBaiRshUEXyRUSgL
         Zomwf4AmsTRJkUXpsZuvoYZm7QYSBPV0EBVGqw+nDSbFRzBrhzTjAnSrELyAfiNSIGVS
         IVdGaEqi6SoA2RDd6J4ZSSY6EbmHq3b7Rjkn3Jk+YeysWIfrKJR7Cz69aoGdfbyXBVGQ
         yaWXwox4wyMiTFJndveDntW9Yj8213ctantKLXIJG2UxHlQh13AZ4m5BBDUK0U+QLHmX
         70sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007491; x=1760612291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmaGbmiuxIsK0xKTEWJ/f7gfwC2bw8p0SOLh4b9Z4FY=;
        b=qYBwj/5MNdO6gmzqtpbDKscQZC5YGGzDJr71m2HvoF29ERTWMXWVTFJbE2NxrCQbIA
         ISCblsaYViTe72VHcMuYzR3nAMTb2ypXbmfOLEv16kceq0m49uQz3DwaVDpZiiV16epM
         zOWrVxS0gkoSWkvoroDZgwoLoGGscwBAs9hESw+n+hrv2kg3XZSaf/1urFp1QVBvZXVJ
         w1Jv/8gya3dMBxFj4KDivP7fldVxFhkV4Mf1HH8L02sRCGtcUnF0YkJ6R2c77D0z6qea
         xlNpXINuOkLnU+oZL4zX5LNCRX1qgQ+XeXJpOnN3WNxE+0P4RVVz638VA4Q4l9FdHBaD
         5e3w==
X-Forwarded-Encrypted: i=1; AJvYcCVPeM0QteQkD4t4Upp9FvTCqy8CgXLizYuQWZWXJJ64d2eM+QeKQQQ57cM0Ricmn3xi3NX6@lists.linux.dev
X-Gm-Message-State: AOJu0YzayVJLZ9liO0tZRHuu0boQ45bZak4UgM++PXKf2tyhvLoReSLa
	H2SqB6heASX+CEVoriXW4zwve6JCeyuXPF/KqRVDOviDYK7hP0WVAzyM
X-Gm-Gg: ASbGnctohgMYLvrdDxO4HH+pT/okT+oxw421Z5IAAas+a51jX2BXYei61uTl2Q5CUvE
	9hTwFtPlbvCJ1eLtkawx4JbhFgZBuHMrAhikidMPdpfiUxwl9nhswZ4cBi1FpVgeWLnrcZPy1g7
	Ga4srKZzq+v9pLO1HOIL64VAlBaS++/ORWyYUpAQo0YYyIEYGS8Ojm0plbfgXXKmYTKjzE/GTVW
	kdCZ0doFnGNuZBzpR037sANKhIHSjNmCIAmCoxZ4HLi1mvcLj/mWEWnSz/53IgiheuFUiYjysRh
	w+FDQXnImLGi9WFiroDWYv7Sev2CwqPQiGR6pqgK70dwoO92CSPVZadxlKKEe9DIsoY5M3IVoh7
	EJ/yd6TbeRb+VLlF0rADioh6MZtM2ZSgQVanWPDHyyoz6foW584GfEkILyrOT
X-Google-Smtp-Source: AGHT+IE5mYvqRuQZ+u7IQ0srPI8O6QG8ywmWS1iS+UAE48zG0ZozJL4ZlmLiRWALZX5JRbD2vynFcw==
X-Received: by 2002:a17:903:2f45:b0:27e:f1d1:74e0 with SMTP id d9443c01a7336-290272b2bd5mr92577745ad.17.1760007491218;
        Thu, 09 Oct 2025 03:58:11 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f7ab4fsm20659266a12.44.2025.10.09.03.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:58:10 -0700 (PDT)
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
Subject: [PATCH v7 16/23] mm/ksw: add self-debug helpers
Date: Thu,  9 Oct 2025 18:55:52 +0800
Message-ID: <20251009105650.168917-17-wangjinchao600@gmail.com>
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


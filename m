Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A36D25C804
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 02:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200344; cv=none; b=ftFQKUBurgu9Lq+CUPO/HapPO+BbRYI+2rHzeFzoWqflhuS+fIoqaHmgnMq1mpUZ3R4YuUq4jltDkxZseudoPJN5WB0w54wbxjOmg7G9eMve8tVCokAMqThVWQywMCuwxR/hiorJQ9GuHVz29Gzqmrpmr90DejAhXiKucxYendc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200344; c=relaxed/simple;
	bh=zgbvGJBSx4YBKNkqO/qzz/La9XfnZ3vAatfFaQMoL7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFQttb76QmPi9gkI+VJHR5oXM/piKeT7jTeQOSuwS/ABwMFbyi4VKvnhNKl5mNLPqiHaYQkSWAluHqbAPJWwxcXfKqnG/A5Cx+oWjz+Cdz7AouI+EjobNWD0ZzGkXmjD1iQ/3zndhcBJlOwdmuShweJcKjj0Oru+Ltpp/RNiAPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRVSw2zL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRVSw2zL"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso2302182b3a.0
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 19:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200341; x=1759805141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmaGbmiuxIsK0xKTEWJ/f7gfwC2bw8p0SOLh4b9Z4FY=;
        b=PRVSw2zLUdm75ZWVsrEHa4MAC4mwZlDP+3Ln9IrSva5sWG5g9QP9jLzH+fALEQUHUq
         oXHCAGGCTh4uDZjuy7TTa0Lwxw8xnN4h8udv4CvkmGvDXSh7LghO/67F308Oo4Azc0RR
         vgowfJGF+L525iwuk3paFq937zg7bFCVY3kWJ1Y6VbKCvaCvvbObfjizeS9EiKWhS8ql
         u9R3qh9IQ1xoh9Xd13a8ZUK1ujSvQnsxWjcQvecEcwwn3MkP0VJaMAQBm9S+s2lnIUAx
         ilVdTKbymuYghyTky1m5BP0a7zbUxLXPEIYhmnC4Jk0fW38LAPjgGUjT1o73inuEyv+J
         ksDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200341; x=1759805141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmaGbmiuxIsK0xKTEWJ/f7gfwC2bw8p0SOLh4b9Z4FY=;
        b=oftOgBBN7QNm3H+Fq4Ss17D/fTafv3tlXW/lel92360PwzzoE8YEN/apcS5g1qeHzi
         DHnJoycHUnGJ48lNyv2K0rF8odm85goeDllHnGyNtd1k/Jn4mim0z6xOq1bZTsgsb/RQ
         rAzhcHRJhrqRphFTGlLL3fM0vvCI5nfqbljEfZyMozc4X9V6WsHFzWD+veWb5hpj5VmT
         LjgNtUV5wQIKoLeKJkic1Ob++lbfs1ZF8Fik2czHyWLbHEocNvK/6z57vNkMruPlT3Em
         u6gtpO4SXLOhA09ool1KEbd1I7mKxte4s+XYSmXzhMrPJFJfZg1Lwan/I+HEobdAsagf
         niAg==
X-Forwarded-Encrypted: i=1; AJvYcCWa8CUg2ogdyRPL/gh8gJMg8bBgWyQFU3m3kDQBBJxjNbW5dDefTgeCG3D0vJqzRxosSWwC@lists.linux.dev
X-Gm-Message-State: AOJu0YwrjQPAJjxYjsZFlzVaqaFEJh4Ew3FuolWBV7Qtp458O5Aa24cq
	fczruL9X6uIzfPCSF0L6Zu8Hxf+Zh35R5DPsoTqRIuEe4Zd9jWWco3Fo
X-Gm-Gg: ASbGncvy0DRk+529UWYAsPRlm3dCpxunQvqW5rRcNmzg0906jK8V0vzySY9MkPxOid5
	KgMhVCwolkAm81988CLh6A66pkicm3kcOblF1YyvwK60ZD50A8Bj9URH65o4grjonDgDIUQNPtP
	EBnYa4fCREjasQLIVVR9LgPeL4MYnDZSjvZ0dLqteFUXkjVO3eUVDKzp6NUFA3UdqiNctChSiYt
	6dLVznPAC/aHWcPCb86uB7lEx9NJKwKKawpXa5kdTwBR/2gQsqOjI9xpWzEblVKCKe8w6uI5yY6
	VRY8dgngZg+xa0aQMSOKea5PO1WCobxyBwryQoFDJeYm8mCHpXNH2AZWmLR1gKPjDJY4r/KaPS1
	znBynR2fYeZs/LEXQWwNnCaWs1/9TudbyDdQX7u7WL+v9suzPonO0HTjNM3LF78S44J8sxzcDrF
	ce
X-Google-Smtp-Source: AGHT+IE0ZzT2Ls3FLJQKvDsDE35NvUvpfAF/CKszp2PRAknfZulRv/lUTsOjo2MTaS5CdAlTIrrq4A==
X-Received: by 2002:a05:6a00:26ed:b0:781:2ba:ef14 with SMTP id d2e1a72fcca58-78102baf1e4mr14490364b3a.25.1759200341230;
        Mon, 29 Sep 2025 19:45:41 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b64cc6sm12378142b3a.71.2025.09.29.19.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:45:40 -0700 (PDT)
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
Subject: [PATCH v6 16/23] mm/ksw: add self-debug helpers
Date: Tue, 30 Sep 2025 10:43:37 +0800
Message-ID: <20250930024402.1043776-17-wangjinchao600@gmail.com>
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


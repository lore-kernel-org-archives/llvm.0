Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22492E7BBA
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671989; cv=none; b=PLSnPMR2g/2F2H3L9oJr0BazGjztk8CJvPT05sUXYb2oZSIX+49lkJiEMshl2i6Fj8Nklkm+NgSbfgw5Nrn9AB93x6U1/zFEoS0Fyr64EoEaEM0e/jBGvWnRp9r2R8aAt2YmREChnkOLIH7PqWRQhvMoxr8knDxP/qP/f72y/W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671989; c=relaxed/simple;
	bh=ljHubFdo4RbY9sPZZpmIGXXQZrdiNxFcVGyARbY49GM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPjeSJy4h59hrDIvXuQENh39CP/tcYTkCir49DRvhesLaeVXrR/RlFabZ1Z6Xd/g7fW2vh3r1xSbO6WHeE/yrnq4p++1E2e5Ao1dg/kdDyR62Q+Pt85lmCKeFToxhWhtN1OppfOnOepJngsKUnT4UIfJ3wYtSr4EDH+pRrqKK9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qf0vRoi6; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qf0vRoi6"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7722bcb989aso1243352b3a.1
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671987; x=1758276787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clh29CJb8P7VxnXXw4h/9gdA7sU+C9WtN5xBt8cm/X4=;
        b=Qf0vRoi6qsE7M3tCtevwtRlD94Zk2w5FzSXq3O7VczavCpOB1RnoiSGyfte67XBNyM
         2HS4wtePl/rDAIUPPt74TT6tbwZEuy3YJlEKZRpnhaC8GAnVLlTyKKQaRphZUKuUYpDU
         khSi7iG/D1F8iJD5xBMraPKu6klfolrUPQk+9ZJ37ieivdVdbS/R2uJnqpbtAavTRls7
         9OsZjdQCyQNjJQj9opOEF9eiZNEE8/dxv4aTr6EnqPI+CjcmKTCyMvPxarTHgwE7qpsj
         qfulYU5m7AMaKmE6T+GgBuFWtEgOuXAiF3rUtDLRTZEh7ZtDFZXeRkUnmOrLnD7r40ts
         HN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671987; x=1758276787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clh29CJb8P7VxnXXw4h/9gdA7sU+C9WtN5xBt8cm/X4=;
        b=NI1Ss5Q20cJTrYdQ8b5gTXrRrpHuMAl8QaxgSrJeSwlP9ECyB3DmRIxrZVvEcM1+rz
         yGNz2k7SomdbFvQ/NbMqH7AGROi3m20iNegiKHInZccjFKDmkC6PhCjwA0C9h4sD6pz1
         b7g9pU0gaKxQULPHRr9raiY5WJmTLMzT02SKfQ3sxlgs3L43QMega5hyhI7vOxDEQ7K2
         w85tVfkzZmQCt64Nr5Ep+NJtn68FSfkQc2QsQ4dNI9CfRJk2lsGdZXYJTrleYrtSTfOF
         GIA6Ba0dhCeJIHF8IqpHU1XTbhYnRxJTVI1G1UkaIsN5V16JCXrGDDMBw2/RjOfr2kUZ
         cd1w==
X-Forwarded-Encrypted: i=1; AJvYcCWe4mA8G8O/rjDbiU/pzzGzZfMAhtb1Ho5KoqViRi5iMNl7r/h71HGJItJIB4chgSGc8y/G@lists.linux.dev
X-Gm-Message-State: AOJu0YwMHZjvrAV6FqNmmppP59Pxikq4MLYCNNhIBC3osWtja1/Hwy5l
	LMwY4kxsWxOv7V7eOWZkXlNKBeLXj6yB8uxSTakcMBG1E9uKJEtNEcGp
X-Gm-Gg: ASbGnct0FqJZY04pKSfykDdChi3EvMxzj2v5dXs21Qqr1TLW1LZcSGhMaSysHGuXVtd
	6Hry77voHyQQPZCRFkzIXMwCAyLhX+EseRLgY0spK6EvUezs8aE6zzokAc9GChgT6xNqiD9Qgd/
	7haqYbrtRgjo1n9i4ds/xkSpntD6bgcUEpKQf6JdCpW5ItVLxYecFajqqyIp8AI9DcYgXgFcpA3
	UDGUFD8FkCBIIR2Mv0EM2qKyC+kR/q+w6l6SC0UXtgCYJwsBs1bk/JtP2YHuPi34dOXODfVb49O
	IxEGo5Ic4LNwUNIK04fnsgGO4847awLfFaeFqcHN+MLRSZOH2YLtzSwzhsPClkT1pYUkcuyv0a9
	A3STNtoKTnQsqP3jTgVuG7+JAX+C6aweqNx0=
X-Google-Smtp-Source: AGHT+IHaEUea7hRsSpqZl85bTv6q0KsvHQdzV/MeRfkpCvkL2MgkVHPyR0dQHBXbAqMEfqsEXUoPVA==
X-Received: by 2002:a05:6a00:982:b0:76b:d869:43fd with SMTP id d2e1a72fcca58-7761216815amr3249434b3a.18.1757671987091;
        Fri, 12 Sep 2025 03:13:07 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b6b1sm4934804b3a.20.2025.09.12.03.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:13:06 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
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
Subject: [PATCH v4 14/21] mm/ksw: add self-debug helpers
Date: Fri, 12 Sep 2025 18:11:24 +0800
Message-ID: <20250912101145.465708-15-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912101145.465708-1-wangjinchao600@gmail.com>
References: <20250912101145.465708-1-wangjinchao600@gmail.com>
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
 mm/kstackwatch/watch.c       | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 5ea2db76cdfb..9a4900df8ff8 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -47,5 +47,7 @@ int ksw_watch_init(void);
 void ksw_watch_exit(void);
 int ksw_watch_on(ulong watch_addr, u16 watch_len);
 int ksw_watch_off(ulong watch_addr, u16 watch_len);
+void ksw_watch_show(void);
+void ksw_watch_fire(void);
 
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index 795e779792da..2e9294595bf3 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -161,3 +161,21 @@ void ksw_watch_exit(void)
 	unregister_wide_hw_breakpoint(watch_events);
 	watch_events = NULL;
 }
+
+/* self debug function */
+void ksw_watch_show(void)
+{
+	pr_info("watch target bp_addr: 0x%llx len:%llu\n", watch_attr.bp_addr,
+		watch_attr.bp_len);
+}
+EXPORT_SYMBOL_GPL(ksw_watch_show);
+
+/* self debug function */
+void ksw_watch_fire(void)
+{
+	char *ptr = (char *)watch_attr.bp_addr;
+
+	pr_warn("watch triggered immediately\n");
+	*ptr = 0x42; // This should trigger immediately for any bp_len
+}
+EXPORT_SYMBOL_GPL(ksw_watch_fire);
-- 
2.43.0


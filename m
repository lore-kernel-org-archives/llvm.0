Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC50A2E0909
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 10:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007441; cv=none; b=kDoNwizP4+wK086+/V9mFMQrer6B2BbZI5xBQKNwmE/TO1eiQiqbPqfxe+fkbXLI9uZ1CLUblENsAjdpLh0nXEaM0I8ee32Fh9wUlYiqBjBDxOsWUdcVbawOfsbpozXyny/yo+iwc/QwwfVAexeX1jnrgt3OkmT9kXF1P1ClfzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007441; c=relaxed/simple;
	bh=nX8M+4wLqDNsj44hk02fNEaF/gPIR5p8f+vD+YBgTKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGs6Romd85K/B5WWhy5ub+57Nnxqmt1orvjtmSibf4kQAefxT/shjA1tDUNBs/c96Z4S1HUYVbpA7FHuTGbbqDBNoEVmiLXqBM7+r5pwVwkE1TuJDQWR70jKEjv7fXWgruMp9R0Uv+X0GCa9UvydWVYm5NYmE+TBYHgp0DlKELE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1mJX3wN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1mJX3wN"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so711445a91.2
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 03:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007439; x=1760612239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjBqC5OmraL0dv+F2ewe7IKGLAdUyg9AVVWKAy3m9Vc=;
        b=e1mJX3wNgzaYBTMfQTHCk8LDn3seYuXwV54iOknxIshfZDCQZNzRI85Dd7RyZB+FtS
         NTrNKzV/mC6Lev94lum0U0uMeF3xFI4s1xqeoMmdysV13VRStKLWLT5e77rHTNE4hIW7
         174f4ZaThIVPWJiurx0dx3aebH2LM5dQfarQBkVYrKAZkdSgfFrCiVGXPx4FM7AHLB8h
         GzP5Z6o+gNuFX6RJBs2devPpdbTGVYHzpg4MXPcPX3j1yX4QzfgtWHunYHWQ5k1G/4H5
         uv9WADsHpjJKAEl0LC0zq5TVuOnGS4JvHvnabLBL8eYQoJkLnGXl8MMC6dwePqTZPeMC
         mmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007439; x=1760612239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjBqC5OmraL0dv+F2ewe7IKGLAdUyg9AVVWKAy3m9Vc=;
        b=pXkB6+Ag/wO4bo600uNnAWRRMfhnu3+k6ls+bJ4fWDQ9cJtSTh3KZU1hGIxM02S9aq
         QUtF+P8+HOb23nl2YrqnD9wqB8Yg7L1YbH4DAaeRJ0MhTNqUzgsj5UJFRhLRYYYhs73E
         ZcO2HxRFVg5DjcGnHZmH341ULcsR3UPkQAkik1KEEDV9Wrph1Q5JGvfSQaX+wYx63YUH
         C4WiaFRIF3wFnJ9jwEWgPDthM+WqHOg7UsDRWICO982xhHT/Jo/3EfapgP1oN1C1RzMf
         VOE9rDsoj7vMVcNKLoUOKqdbvQVnd/dSoJQt6TTdMgmgT4QoFgt91WIMFF86+PveLPVZ
         +TGw==
X-Forwarded-Encrypted: i=1; AJvYcCXYRTcIRLdtwYg+yTqdoYcYzms9TJnW1YBcC50Ajn34QiZd/mxvmU7H+alIBD81IC0obyKJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxNQzmSClCoPzkZitctcJKC8keIQ7CArQu8IqEjOgm834tj7P2y
	awRdLJQMEaoTWY837Xq7EekrarO8cE0Pk7FSOiAlPGDiXtN8gonSPHYT
X-Gm-Gg: ASbGncuJyZgsYDe4nSK+Hc1yqCtxuvqTDO9weGWfJ7k3RGt0YXwBSCwMyiSLn6NKhdR
	rWB/M0IN72bUoFf8YXPk8N4sDD7SvCyvyPWFOeDJM8KTUIQ0hnwmManxpEhBtaGvXsQyLyp7pwt
	wPi/Vw66FnHk06ZaEcxBjzGqhIU80Vja6E0A2Gh3b3njiEVd8cHOuuD4Wg1f8vwGtE30o+EfTB0
	Ahe4JX8MYhBd50CUl2JhSA7lBPEaLPHsZiKUAYJkEN9aO9iri0EjStptp0E1b8p1ghsmh9N8iTG
	8JyNNTN5Ym5+2BJr59vwcbvKrxRax2cb+iCx5YzsjNCl3vqV46jIoUxNnjJ0/EHtK9Klu6BTyjn
	alcHQKa4u6rGCrGvXI8XjN9gZVt9Sm6WLC0U7IzXcwrTPhVFsBVURxtMn/k9b
X-Google-Smtp-Source: AGHT+IEogDfWqn0ZNEJ5cmEpJkuR1sQjiPvyx+m6nnseZ691SX5q+dGPfB0lT/XnvNq5vU0yxLx4cw==
X-Received: by 2002:a17:90b:1e4b:b0:330:72fb:ac13 with SMTP id 98e67ed59e1d1-33b51125511mr8955062a91.5.1760007438929;
        Thu, 09 Oct 2025 03:57:18 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b62dd50c879sm17747604a12.17.2025.10.09.03.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:57:18 -0700 (PDT)
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
Subject: [PATCH v7 03/23] HWBP: Add modify_wide_hw_breakpoint_local() API
Date: Thu,  9 Oct 2025 18:55:39 +0800
Message-ID: <20251009105650.168917-4-wangjinchao600@gmail.com>
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

From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

Add modify_wide_hw_breakpoint_local() arch-wide interface which allows
hwbp users to update watch address on-line. This is available if the
arch supports CONFIG_HAVE_REINSTALL_HW_BREAKPOINT.
Note that this allows to change the type only for compatible types,
because it does not release and reserve the hwbp slot based on type.
For instance, you can not change HW_BREAKPOINT_W to HW_BREAKPOINT_X.

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/Kconfig                  | 10 ++++++++++
 arch/x86/Kconfig              |  1 +
 include/linux/hw_breakpoint.h |  6 ++++++
 kernel/events/hw_breakpoint.c | 37 +++++++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index ebe08b9186ad..bb4e4907c95c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -456,6 +456,16 @@ config HAVE_MIXED_BREAKPOINTS_REGS
 	  Select this option if your arch implements breakpoints under the
 	  latter fashion.
 
+config HAVE_REINSTALL_HW_BREAKPOINT
+	bool
+	depends on HAVE_HW_BREAKPOINT
+	help
+	  Depending on the arch implementation of hardware breakpoints,
+	  some of them are able to update the breakpoint configuration
+	  without release and reserve the hardware breakpoint register.
+	  What configuration is able to update depends on hardware and
+	  software implementation.
+
 config HAVE_USER_RETURN_NOTIFIER
 	bool
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 9d034a987c6e..ef5b31158271 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -245,6 +245,7 @@ config X86
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GCC_PLUGINS
 	select HAVE_HW_BREAKPOINT
+	select HAVE_REINSTALL_HW_BREAKPOINT
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK	if X86_64
 	select HAVE_IRQ_TIME_ACCOUNTING
diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
index db199d653dd1..ea373f2587f8 100644
--- a/include/linux/hw_breakpoint.h
+++ b/include/linux/hw_breakpoint.h
@@ -81,6 +81,9 @@ register_wide_hw_breakpoint(struct perf_event_attr *attr,
 			    perf_overflow_handler_t triggered,
 			    void *context);
 
+extern int modify_wide_hw_breakpoint_local(struct perf_event *bp,
+					   struct perf_event_attr *attr);
+
 extern int register_perf_hw_breakpoint(struct perf_event *bp);
 extern void unregister_hw_breakpoint(struct perf_event *bp);
 extern void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events);
@@ -124,6 +127,9 @@ register_wide_hw_breakpoint(struct perf_event_attr *attr,
 			    perf_overflow_handler_t triggered,
 			    void *context)		{ return NULL; }
 static inline int
+modify_wide_hw_breakpoint_local(struct perf_event *bp,
+				struct perf_event_attr *attr) { return -ENOSYS; }
+static inline int
 register_perf_hw_breakpoint(struct perf_event *bp)	{ return -ENOSYS; }
 static inline void unregister_hw_breakpoint(struct perf_event *bp)	{ }
 static inline void
diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 8ec2cb688903..5ee1522a99c9 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -887,6 +887,43 @@ void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events)
 }
 EXPORT_SYMBOL_GPL(unregister_wide_hw_breakpoint);
 
+/**
+ * modify_wide_hw_breakpoint_local - update breakpoint config for local CPU
+ * @bp: the hwbp perf event for this CPU
+ * @attr: the new attribute for @bp
+ *
+ * This does not release and reserve the slot of a HWBP; it just reuses the
+ * current slot on local CPU. So the users must update the other CPUs by
+ * themselves.
+ * Also, since this does not release/reserve the slot, this can not change the
+ * type to incompatible type of the HWBP.
+ * Return err if attr is invalid or the CPU fails to update debug register
+ * for new @attr.
+ */
+#ifdef CONFIG_HAVE_REINSTALL_HW_BREAKPOINT
+int modify_wide_hw_breakpoint_local(struct perf_event *bp,
+				    struct perf_event_attr *attr)
+{
+	int ret;
+
+	if (find_slot_idx(bp->attr.bp_type) != find_slot_idx(attr->bp_type))
+		return -EINVAL;
+
+	ret = hw_breakpoint_arch_parse(bp, attr, counter_arch_bp(bp));
+	if (ret)
+		return ret;
+
+	return arch_reinstall_hw_breakpoint(bp);
+}
+#else
+int modify_wide_hw_breakpoint_local(struct perf_event *bp,
+				    struct perf_event_attr *attr)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+EXPORT_SYMBOL_GPL(modify_wide_hw_breakpoint_local);
+
 /**
  * hw_breakpoint_is_used - check if breakpoints are currently used
  *
-- 
2.43.0


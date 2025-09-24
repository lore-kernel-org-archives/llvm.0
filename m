Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5553009FD
	for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714711; cv=none; b=F0D8La8WL8W7xjR9q2fGGXWMuamTfd2Mu6nd3VoRlJdq/ce2hJPW+ZKogyBq2vYUv8XahqH2e7UF1gQqfJM6QZ0i7f6/9ra2oC0+FOaANMbamGoh5aoCB5STzbHoN20M/ZPRjc8o+o4YUQDD5aYabneCCeUBbsnpjlceVzoRlug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714711; c=relaxed/simple;
	bh=JuRa9sqqB7Pb4oITEW69e6hBS72ry7/vRFUMRsXtE7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A1p76fKVACsV+SeYNQLmxYCWnKHQzY6b+aQQRpQ9Mnhfa37EPKQj3oHvQrS16CT3NzLHVlopdb5dtvQUZ2sEdI4JdqhfMcR3pfjlosvqGRe4nwM94ml1PB2YJx+INLS8Y9J7qAhRBdNJwPc2A9+rCVpQgTlyARMWKA1JpFQQkAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLTrCa0O; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLTrCa0O"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-780f6632e64so165523b3a.2
        for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 04:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758714705; x=1759319505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9dguoBkY6LX1N0DOj75LxFoPgkZue82QF3pLTyVov0=;
        b=aLTrCa0Og+qu4euV1v4dQHG81B0CghEbAxVldFRv9ocH99vXd75ERl+ilJbd2+pRQI
         TT7u6BBmzYbkMkWDKMLkerx9EQAS80vJFPKk1TL2pZwWN/mG0JDf0sBjGytu8c/YqT4m
         MhAHCwrYBh7t+pwYOgS6A0Qsg0feZOwCa8vxSyAxSJmZuQVytkkjlfJp+N8htvw0QWAq
         P5NXTCEYy1by/+x11h2zhpbdJeCYocxgFcF8eAzWkub6+B4poOXAmruzux3nbZvMjyqC
         DR/zvScW8y1PDC8QBtFVQRTlaaAOazYJo8GYeD2dmTvAswgPFB7XxJHKMuObRYSZOFzN
         Fm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714705; x=1759319505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9dguoBkY6LX1N0DOj75LxFoPgkZue82QF3pLTyVov0=;
        b=TtIQXjbT90clw52ve97JOSUli4uOUkcnsNIBpZ4+yfuqluf8987EwIiQHohupTIbhC
         jfLShgkuEuXbn0tIojxFwXf79TaW7dFq5EnT0Aq72KnzVxyVqS73W8xBZhzVLJr04n0w
         yigVNLLfmk8Ub4vSLYJpOkHKJ7WGgwHJZYAeDlHfIhmxtMSFTrr3gKv83u9Wsfhs0XjI
         +RXvTO3OyyN9xntFczu/57HST3r0m9DKvkqNs85Iuk77vhB8WWZhVNGP+GclqOklLmtL
         bjUJuTqsqdgWo48129xG4AB3Z+P9UY92EcRsW41xzxAS+HjsWiXzLikdp2doLoC41MVM
         CzJg==
X-Forwarded-Encrypted: i=1; AJvYcCUNmHxXR1axh1FbVrHEMncjBMqkKt6zuX1vfHu1V1cBnfmYbbdLptgurppsOxobNga2wevi@lists.linux.dev
X-Gm-Message-State: AOJu0YyajOE9CAo0uiS1zCy+2c4prmCvEraaQkgyN2KZSNwZFS9Fk6UL
	PVRTSeHucImHyDl+mW61D2SfHm1w5PsxYl+/wc2FjpmvSAYYWmZauGkL
X-Gm-Gg: ASbGnctljZd3tYdLTDZKYg2Qo9cIC3uAffYXbHIc0QjebtqcJmJGbHmXLwEybMlD4Y7
	SAuU3jS2Z6sLZ0qJqEcax8FP5SRS8Rg5wVRSBJOHdBh18K+4u/uh1DJq+zqbkaIoR3qatRArz5x
	tceSEn7YHqQlVeXiCLJ5QKuHMsjdPjTfbAE5buZyoM1RPmZFDZgq7DNBpGfGXriKA/l+jaRg1OF
	VpneQtSiRrhKP2FER8vsmQNs0+NOx4Lw19dyUyZt8ctfXMg9d+xAYl/j4CggCWDNXzVu3tqjybD
	kb4n6FJx6GF1ZE1hD6CeRc8rv58/KDqhw3S8Q/UMyC+DXn+rjPGH2UrqZ0ljhTFc+X5KyVWsJNH
	1BIdO02ZlJdFx0yi3cIIVR8Q7yQ==
X-Google-Smtp-Source: AGHT+IEasneXpiW3mfzS6InuZbVOqKXOEJYnqzt5bTMRV5lm54Ib2pRaVdJ4xzF5Ie29cXcRAIIxXQ==
X-Received: by 2002:a05:6a00:228b:b0:77f:50df:df31 with SMTP id d2e1a72fcca58-77f53b0ed0cmr6348588b3a.20.1758714705264;
        Wed, 24 Sep 2025 04:51:45 -0700 (PDT)
Received: from localhost ([23.142.224.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc2490dcsm18664494b3a.36.2025.09.24.04.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:51:44 -0700 (PDT)
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
Subject: [PATCH v5 03/23] HWBP: Add modify_wide_hw_breakpoint_local() API
Date: Wed, 24 Sep 2025 19:50:46 +0800
Message-ID: <20250924115124.194940-4-wangjinchao600@gmail.com>
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
index d1b4ffd6e085..e4787fc814df 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -418,6 +418,16 @@ config HAVE_MIXED_BREAKPOINTS_REGS
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
index 52c8910ba2ef..4ea313ef3e82 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -247,6 +247,7 @@ config X86
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


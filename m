Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8FC306B04
	for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714750; cv=none; b=HovHW1o1MBxnt6KILZu0DZ6kbw2OS+P2aIg3ZKNPIUZB0yXlko82F2F/+fQfKhL0VV+Bup/YgBPxOpR4GF1LP7a9U6sQrOm5g16DbKBNu8lUML5ambqJIZCDZahHn7stxOfoGoW5n6EI4oenHa1jA9slCunfQO2R9/k+14QRQlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714750; c=relaxed/simple;
	bh=Sl2YI7Td/C9YkkJpnWkOlkyn4hvpDBvdNr6f7stAoSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gVA5/0nalCpmI/aNCFQQwbhX8NR9eoCfdAxuYxteagBymezZmnYOUWuqes0WK2R01yc2bxMyi2NwK4Lx0goFDcKhZVvnYai5VQMKdHsQvyqu3cN8fw705UCTtotBtV3L5EOVEF49WF3LgnQhetpve15LKFkNLgtuqvadRcn3d/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFPb21Ns; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFPb21Ns"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77f68fae1a8so968232b3a.1
        for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758714743; x=1759319543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX4DcHmKN6k6jLli4BcDyPNAsEAGb3ORwL+dRbW7euA=;
        b=TFPb21NsDV06KPb0FrMAEDJa+LInP7z76H5GtIy6g7MYB3BArVr7s/B91W22ZSzOrU
         iBrPftRLzt+C4hGApXXSuWFkWStrccCZW5SqTZaERJrLIH3U+8YgDfHeOB8z4rC59Yan
         PQO9pZuQmEERvl9jGUX5R30ejEJ1qnXom5Y1jvJy7H6EHcHeI4li+BnY6KxKhPHRQFhR
         kyEMQDlOpfphTfCivKLlBmt3CTvpEOb3LgeD0pGR6wWKotrX3B70Xn7QSaeYsB+anblJ
         JsJK8a5ZdKbq30QhdvosD8oIxdfovrEC8pdYtv2vpvdbuhDou0BXf9RgCzhuWjx9BsTF
         jkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714743; x=1759319543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sX4DcHmKN6k6jLli4BcDyPNAsEAGb3ORwL+dRbW7euA=;
        b=v8NGkzuffIJMF5/lCFS4JpNHyGjd44yp/BuU49XDvqOsz/+A+WrXoeM0uRudKunWaN
         CXluNFkHrMEirXcd5fH2jJn9NaAaozBx/fMPZk2AVpDYgxGGmB5GUGEr07kHACP6NiGt
         9z9zc2vJkAGjOAcFXL4L4iYzccUeZiJbPqZR96oqGiw7l68iA+tD1TWz7ZYiFbFio2iO
         rVZCTGqKBmFawdNszbqdrGfPHAnxXLVK5Vk9v0JKNJwpi9KnJkumG8Z1R/4KhEtLxP0r
         e3t8DgOdEAYpxUTk2yHxhXHRdNJnMv8nIrNHd7KdI3CL/8BvauSKXLupC9cxveZ4roke
         HxAA==
X-Forwarded-Encrypted: i=1; AJvYcCWcmshztM07IDwI+w90zNn8msXQZ5ij6sw9fe70ZQsOG7V/Ey1BwJG14Ny4OY31h9abs2zA@lists.linux.dev
X-Gm-Message-State: AOJu0YzFpgE/1SAekCbn/+tLoHoDze+xqPICfK0nst/m3LGbuLS+KZ+K
	YmL4BChCAc85sbBctjUzoZ7SDEgFyCBhf0sQRLJs66uN3DiQusT47Hfr
X-Gm-Gg: ASbGncuSddKU17tYyhbEvymuSyJgu0aI/XQSoIwpIdxBBzBSAtYpg86phvzmDxgfbS0
	7vXt/fuzk12wz5Dr3n4JE/ZtwkgtbR7AZUpDl4aFy4f4IqbbY/8vqvo/ssFOcrqcitK/3fpS0rR
	MG7IWuPsnM/rFYQubV6Ge9DD5yt0iil2EHLifxVI2iczNwy4aW/d3iZihjk0BA8Bh2HXQiJfdHJ
	NTQjcHMTbEVi3UsRgIzibNrEgJ/o4cILwE/loI+TE2paRMcwjfh+E6EKTI5xFD7ORoEHsIBHY1f
	6Gl812fUbIzmt2eTaymQmp0ofyvxDMjYOKqL0+Y67WCiV7GU4lZt9rjm3DPD6bHw4Ro/2QJ0dCF
	YOh8pOJttXAPY2fWEbaobPQNStw==
X-Google-Smtp-Source: AGHT+IHM4OGfhR5oYYdpAC3Dd6EW1w7h66PDSvRIMWNc5YTjulef4dYL+e/NY4vhVJcodihdgSSIbA==
X-Received: by 2002:a05:6a20:e292:b0:247:65a0:822 with SMTP id adf61e73a8af0-2cff1c61c0amr8760157637.40.1758714742579;
        Wed, 24 Sep 2025 04:52:22 -0700 (PDT)
Received: from localhost ([23.142.224.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551518480asm14947563a12.28.2025.09.24.04.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:52:21 -0700 (PDT)
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
Subject: [PATCH v5 13/23] mm/ksw: add per-task ctx tracking
Date: Wed, 24 Sep 2025 19:50:56 +0800
Message-ID: <20250924115124.194940-14-wangjinchao600@gmail.com>
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

Each task tracks its depth, stack pointer, and generation. A watchpoint is
enabled only when the configured depth is reached, and disabled on function
exit.

The context is reset when probes are disabled, generation changes, or exit
depth becomes inconsistent.

Duplicate arming on the same frame is skipped.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/stack.c | 67 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
index 9f59f41d954c..e596ef97222d 100644
--- a/mm/kstackwatch/stack.c
+++ b/mm/kstackwatch/stack.c
@@ -12,6 +12,53 @@
 static struct kprobe entry_probe;
 static struct fprobe exit_probe;
 
+static bool probe_enable;
+static u16 probe_generation;
+
+static void ksw_reset_ctx(void)
+{
+	struct ksw_ctx *ctx = &current->ksw_ctx;
+
+	if (ctx->wp)
+		ksw_watch_off(ctx->wp);
+
+	ctx->wp = NULL;
+	ctx->sp = 0;
+	ctx->depth = 0;
+	ctx->generation = READ_ONCE(probe_generation);
+}
+
+static bool ksw_stack_check_ctx(bool entry)
+{
+	struct ksw_ctx *ctx = &current->ksw_ctx;
+	u16 cur_enable = READ_ONCE(probe_enable);
+	u16 cur_generation = READ_ONCE(probe_generation);
+	u16 cur_depth, target_depth = ksw_get_config()->depth;
+
+	if (!cur_enable) {
+		ksw_reset_ctx();
+		return false;
+	}
+
+	if (ctx->generation != cur_generation)
+		ksw_reset_ctx();
+
+	if (!entry && !ctx->depth) {
+		ksw_reset_ctx();
+		return false;
+	}
+
+	if (entry)
+		cur_depth = ctx->depth++;
+	else
+		cur_depth = --ctx->depth;
+
+	if (cur_depth == target_depth)
+		return true;
+	else
+		return false;
+}
+
 static int ksw_stack_prepare_watch(struct pt_regs *regs,
 				   const struct ksw_config *config,
 				   ulong *watch_addr, u16 *watch_len)
@@ -26,10 +73,22 @@ static void ksw_stack_entry_handler(struct kprobe *p, struct pt_regs *regs,
 				    unsigned long flags)
 {
 	struct ksw_ctx *ctx = &current->ksw_ctx;
+	ulong stack_pointer;
 	ulong watch_addr;
 	u16 watch_len;
 	int ret;
 
+	stack_pointer = kernel_stack_pointer(regs);
+
+	/*
+	 * triggered more than once, may be in a loop
+	 */
+	if (ctx->wp && ctx->sp == stack_pointer)
+		return;
+
+	if (!ksw_stack_check_ctx(true))
+		return;
+
 	ret = ksw_watch_get(&ctx->wp);
 	if (ret)
 		return;
@@ -50,6 +109,7 @@ static void ksw_stack_entry_handler(struct kprobe *p, struct pt_regs *regs,
 		return;
 	}
 
+	ctx->sp = stack_pointer;
 }
 
 static void ksw_stack_exit_handler(struct fprobe *fp, unsigned long ip,
@@ -58,6 +118,8 @@ static void ksw_stack_exit_handler(struct fprobe *fp, unsigned long ip,
 {
 	struct ksw_ctx *ctx = &current->ksw_ctx;
 
+	if (!ksw_stack_check_ctx(false))
+		return;
 
 	if (ctx->wp) {
 		ksw_watch_off(ctx->wp);
@@ -92,11 +154,16 @@ int ksw_stack_init(void)
 		return ret;
 	}
 
+	WRITE_ONCE(probe_generation, READ_ONCE(probe_generation) + 1);
+	WRITE_ONCE(probe_enable, true);
+
 	return 0;
 }
 
 void ksw_stack_exit(void)
 {
+	WRITE_ONCE(probe_enable, false);
+	WRITE_ONCE(probe_generation, READ_ONCE(probe_generation) + 1);
 	unregister_fprobe(&exit_probe);
 	unregister_kprobe(&entry_probe);
 }
-- 
2.43.0


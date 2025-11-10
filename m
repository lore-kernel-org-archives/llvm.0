Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AF83164C8
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 16:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792658; cv=none; b=ZbrJ/Z4dR4ZE4liRPRj4euo7FEWaE7AJamng5kBQpSLTrncd68TElwbxJ6nzxBt0incQIZmEyz1wro33C9qaOiWDfoXoQBnrj0DxbELUVwWFJbEr4fxc/T5U3N9/vc8uIHmqDS5en6LJshmFBSk8FYMPVjECITOCWEIiLcXm6WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792658; c=relaxed/simple;
	bh=gl+G5Qso+k3I+qIwzV1n+u7DG36AFw0uDF3MMxGh5rI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkQ8e28REp0P43I8atfPyVmfnJrWpegC/oWCDFeL8JuD8k/vHipaaB3lafxIHa8U1Kn6hjBPgmNU31u3qvO0wxvD+RONWCMDjpKa27ZBYheJcMMLp5u0X+JGQk05ZtE+fxq6EhR+pqqE2ouZV/TSWNrkUw91BDlVep4NWizNTCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJtSu4i0; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJtSu4i0"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7af6a6f20easo2583826b3a.0
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 08:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792655; x=1763397455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+iVGEpI5Tg4S20J7P4CCPxNAttk2LGvwxP9Ue3oAtA=;
        b=VJtSu4i0mHz+Mi3BMIlCzEQiZvu9zDyYkdpbpLmYxARYPozOBBg+TMeJJnKH7Mhj4J
         2OQRwFXzKv7YY/i0ve8S8/o21v3P6LebPBdiFyCOjNS3cQUUCMghoJ1tZzqfLlKSWBEx
         0HjlOuzYuTiWUsC6F5QCwea/aWWsscM7bAPMhtamgyWrqsvCA9y3zR+I8OgaeXEI/DlJ
         DjmNZgNZ1dBn2CEm465NXiRLsgc7ZJUY56XLm7qXhsmkZolxMQOOJbEErYB91gbOFORU
         xB7AyOHY+kKlSyprZlvTW0ErJE/9M9CAttAvTFOVF7PXFiftqv8gzt+vmUd1vJNylPne
         Ozjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792655; x=1763397455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j+iVGEpI5Tg4S20J7P4CCPxNAttk2LGvwxP9Ue3oAtA=;
        b=NwA67n45DCikIsrLAbOc4aiUCQGDhY9QuaHDC3H/gX5JCA+MbFIW96Itobe3cWjKu7
         VoMXCKJJKueFkWWdZiJQT0GdY9v1zMamnLTrU6559o0218i7lqa3tQ4IL6x7stQRT+7r
         Qtav9W/uOdt2Y5gCUA373D1OSdmQRwB9rAy1TJrk7pZancapNijCj16jNN4bC5fSPp2V
         62vVW1wHDn+8Alfa5U2vyumlhYUBvACRSsndfuMGE53A+yWucM+6gX6kV0wcZ0r02vwO
         QqcR9NMyfEAvjJ1BhZAI6nrUplbiSt6c31NKeBPiX1igXmcvw9g98E7fOrjtwd7iIK95
         f9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy5mFitvynSxFXiMSGPy7Ge8x1eEEl99r7ISOidrJXg+Um+S1l41E2LbojtWUNJXy2nf04@lists.linux.dev
X-Gm-Message-State: AOJu0Yy82tGxgpHYQZuBOMC6n9hITcXtxeY0DSxc7p5faeLvajcfdD78
	PTf8t71Jmr+uzM3L6XZZ0Wye2FFuVAO7INy07WuoqPCdumsFol0qLK9z
X-Gm-Gg: ASbGncuyx8FSNQYu5RBK6LObgiBA3E4UT17H6tUpdvfElnCj05mWKZ0Etu+NVPHFNp8
	rJ2wiJQjnR63zdDfX8Y7pJo0fefBq+rBDbnk9dEoZsk90NCSAsHegUG4O7p9m3hZHdhhVku5NHD
	Huen9h/sWDt2yJAk+IN0bEcESNwOPWmnAI8H004z9FqDz+VE7fGL115acIA1N/iwAz9haLos6bR
	K54EDssX86hKwUdCvbCilLNgbU4vdZ3F5hsFenQdYccoextAURGI2mZezUxWLTZTxePhlr7/sWW
	/x3ViRpnpNSNjRY519R5tGo16higOAQupfYaGhyLhk61sINGiB1irJmGmchAFLZzuzsL3Ekb6q1
	eNwloI9qcNxGSsqyP18joSSY6Mrqm8HVdIOJdYrxe8gD5APWvqRoSQk+Eh5Aq3wOpPEk1w90u1a
	83jU6ANYBhM2M=
X-Google-Smtp-Source: AGHT+IGtiWcQfJK4Ygp04b6O0toULhQ9ivsVDr7hyiasnMUnwDIgBXPDlxiRxSR9lhapVrMC+QPG1w==
X-Received: by 2002:a05:6a20:72a0:b0:342:378e:44af with SMTP id adf61e73a8af0-353a39633e5mr12501946637.41.1762792654931;
        Mon, 10 Nov 2025 08:37:34 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccc59de7sm12250750b3a.65.2025.11.10.08.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:37:34 -0800 (PST)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	David Kaplan <david.kaplan@amd.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	Kees Cook <kees@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	"Liang Kan" <kan.liang@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Rong Xu <xur@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	workflows@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v8 12/27] mm/ksw: add entry kprobe and exit fprobe management
Date: Tue, 11 Nov 2025 00:36:07 +0800
Message-ID: <20251110163634.3686676-13-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110163634.3686676-1-wangjinchao600@gmail.com>
References: <20251110163634.3686676-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide ksw_stack_init() and ksw_stack_exit() to manage entry and exit
probes for the target function from ksw_get_config().

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 include/linux/kstackwatch.h |   4 ++
 mm/kstackwatch/stack.c      | 100 ++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/include/linux/kstackwatch.h b/include/linux/kstackwatch.h
index d7ea89c8c6af..afedd9823de9 100644
--- a/include/linux/kstackwatch.h
+++ b/include/linux/kstackwatch.h
@@ -41,6 +41,10 @@ struct ksw_config {
 // singleton, only modified in kernel.c
 const struct ksw_config *ksw_get_config(void);
 
+/* stack management */
+int ksw_stack_init(void);
+void ksw_stack_exit(void);
+
 /* watch management */
 struct ksw_watchpoint {
 	struct perf_event *__percpu *event;
diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
index cec594032515..3aa02f8370af 100644
--- a/mm/kstackwatch/stack.c
+++ b/mm/kstackwatch/stack.c
@@ -1 +1,101 @@
 // SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/atomic.h>
+#include <linux/fprobe.h>
+#include <linux/kprobes.h>
+#include <linux/kstackwatch.h>
+#include <linux/kstackwatch_types.h>
+#include <linux/printk.h>
+
+static struct kprobe entry_probe;
+static struct fprobe exit_probe;
+
+static int ksw_stack_prepare_watch(struct pt_regs *regs,
+				   const struct ksw_config *config,
+				   ulong *watch_addr, u16 *watch_len)
+{
+	/* implement logic will be added in following patches */
+	*watch_addr = 0;
+	*watch_len = 0;
+	return 0;
+}
+
+static void ksw_stack_entry_handler(struct kprobe *p, struct pt_regs *regs,
+				    unsigned long flags)
+{
+	struct ksw_ctx *ctx = &current->ksw_ctx;
+	ulong watch_addr;
+	u16 watch_len;
+	int ret;
+
+	ret = ksw_watch_get(&ctx->wp);
+	if (ret)
+		return;
+
+	ret = ksw_stack_prepare_watch(regs, ksw_get_config(), &watch_addr,
+				      &watch_len);
+	if (ret) {
+		ksw_watch_off(ctx->wp);
+		ctx->wp = NULL;
+		pr_err("failed to prepare watch target: %d\n", ret);
+		return;
+	}
+
+	ret = ksw_watch_on(ctx->wp, watch_addr, watch_len);
+	if (ret) {
+		pr_err("failed to watch on depth:%d addr:0x%lx len:%u %d\n",
+		       ksw_get_config()->depth, watch_addr, watch_len, ret);
+		return;
+	}
+
+}
+
+static void ksw_stack_exit_handler(struct fprobe *fp, unsigned long ip,
+				   unsigned long ret_ip,
+				   struct ftrace_regs *regs, void *data)
+{
+	struct ksw_ctx *ctx = &current->ksw_ctx;
+
+
+	if (ctx->wp) {
+		ksw_watch_off(ctx->wp);
+		ctx->wp = NULL;
+		ctx->sp = 0;
+	}
+}
+
+int ksw_stack_init(void)
+{
+	int ret;
+	char *symbuf = NULL;
+
+	memset(&entry_probe, 0, sizeof(entry_probe));
+	entry_probe.symbol_name = ksw_get_config()->func_name;
+	entry_probe.offset = ksw_get_config()->func_offset;
+	entry_probe.post_handler = ksw_stack_entry_handler;
+	ret = register_kprobe(&entry_probe);
+	if (ret) {
+		pr_err("failed to register kprobe ret %d\n", ret);
+		return ret;
+	}
+
+	memset(&exit_probe, 0, sizeof(exit_probe));
+	exit_probe.exit_handler = ksw_stack_exit_handler;
+	symbuf = (char *)ksw_get_config()->func_name;
+
+	ret = register_fprobe_syms(&exit_probe, (const char **)&symbuf, 1);
+	if (ret < 0) {
+		pr_err("failed to register fprobe ret %d\n", ret);
+		unregister_kprobe(&entry_probe);
+		return ret;
+	}
+
+	return 0;
+}
+
+void ksw_stack_exit(void)
+{
+	unregister_fprobe(&exit_probe);
+	unregister_kprobe(&entry_probe);
+}
-- 
2.43.0


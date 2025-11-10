Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156962848A2
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 16:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792689; cv=none; b=NtvvFy0nCYaXlY+pB9jkjYXnf7hgVKseb2RM/4/4RkuaDyboeHZusCQYlsr7BZsNoAypgiamZuEI3pAWAccv3K7XiVHOz+4UXdqjqYPmo1d4HNmLzFsJeNbDgE4D7jtdixZi2YFWklwmEHZ2wKoQ4v/JjEQm0b7O72TiG2DEzLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792689; c=relaxed/simple;
	bh=1lAxfch01axZkI2fEWCFxH87S1am8PsNEQTHP7qVP20=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/IBZxuMqQZ2a6695IMpf6xxAG84KrR+yBZTwB9jhAkFquF7wd9EcdAPTya93aDafu9HEbs/ron3/bJKomch0oBqi7hshCC3BBO9Z5pIfFTe2CafCW5Xo1VXW+fHo+RvHgYY56F+zKZ3ITm5yabNUihJ9W85fNp3zCaYPup3m2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSPpAK67; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSPpAK67"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2953e415b27so28605415ad.2
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 08:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792686; x=1763397486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbxG26SeCS0bD0vh784LPkUdC/dr0BSaPzCrIbaXc1o=;
        b=WSPpAK67p5F06xdxqJMN65AFnaXrjAQoayRZQrrIIP0J4nKt9/5AGa0/zVooKGZLdx
         Ecwohuitwd97FtWbndyWggIV2i0MARYxdt7iul3uCLI3dHIbqphLs3EdW/Zn1rK8e009
         Nv9nZRJCt5oDExW6JM8+HYnBCnx5T+LpDYAyhUtEt8uYfZa6t8Rko7voInTKbNd6oiDG
         dg4FunripSHEWARQ14FIcP0Ynj6WpPpbV7+6xorTdtXjOHCGFTQ92UJ9h3sPw6eFeg73
         UXepL75xwhbp99ZVVMY5HJIdwJ6PITlmoZ+nJ420WKGAXXId/fumyccLVrfxc86ZntHz
         cHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792686; x=1763397486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BbxG26SeCS0bD0vh784LPkUdC/dr0BSaPzCrIbaXc1o=;
        b=Qiv3cEBxSe0+2TEmCq5k83r7Zi52XqLId/UWzmKdr1IvP5F7xic+zz7EnktOmAaBI2
         vM35F939wbenzTjIdJyrotrbdquBrnW1I05hQ3rD+THrODcmyJuIs2fE74SL7MSCMhhi
         zLZxZUoenBTWzyJUWgHplayxV1tgEBc/f7HfZuJx60Fs+nDw2B1q5CuB1jtYLUMHb2kf
         HZLI+xF4sZQBMk2JvH6DCAbHhZne7qBOwv3zO1BZyjaXjTNX6GOq0HhR1mOxFhnpN5kv
         x0Qw5GV90IL/fsTdH+MVcI2g21fOWBtjDXcexgTpyl+CoR3fdQ9pj1tCrkhZRVpKV7Bc
         jwBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJSDsFGrPdJiCcFh3us1y6H3ZleM47Ol4RBk7JLI/aPWZ0Vmu7WnB+EXh29U6BxxwsedcT@lists.linux.dev
X-Gm-Message-State: AOJu0YxI4hTT9PV9x/gPLCBKWTXC4sJyV7XljjSpdwxrmvEVMy45Ffsx
	qcyHcDb+jCaSe6MyQ3G0QlJqf1uUoKSzoHEbLWxegskBolIiEbLH6FsG
X-Gm-Gg: ASbGncv63Ttxt2sBTyQUCtP9r7Pxat6qB8xr1whCs+vUGbTjNNdCeUATKL1MucHkoms
	/Yt0uIc7pjQqVsWQboNFZ+OlgJYSR7jWZnfBvYayYe1Pphtgwhh/Ct4YLie5u5d1yG9KdL/RoX9
	nnF0WpXodIu9Q4GmpsO31s9fRqePC7pfffEJUykxWlngve3fCiT3FlWUsydKMmxIBJ1oQ0n7t5A
	Ct6tDLHwQkhnDbThZ4ZPyR6q9lTVRLdXXMtJ0cAbBjR1J8qI7Xzn/BNGzg7TPkE9btxhrfiZ+5w
	fLhTJZLb5Qxf3ussKFVV9UMtd+Lh654W/S0YeFvXjXRU9cBxE+butg46r70p19YbvLr9iFJU4kU
	jQ/Em5Qt4HxbauhdF5mMtmyxy9O7s+kmKFLdpFlvf4QmvT5zh4/7MZrIzvrNg1BwEEM6FJdMeNM
	eDwaASr8tQjKg=
X-Google-Smtp-Source: AGHT+IFGVJoow1/cESxoE1b0elhSpiXpfiC9HmcofENWA1KFmQBzVRQaX5Wyx8+4PBNdomOGrCwPww==
X-Received: by 2002:a17:902:ce10:b0:295:596f:8507 with SMTP id d9443c01a7336-297e4bfd91dmr122302855ad.0.1762792686313;
        Mon, 10 Nov 2025 08:38:06 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c7445dsm150531925ad.62.2025.11.10.08.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:05 -0800 (PST)
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
Subject: [PATCH v8 19/27] arm64/hwbp/ksw: integrate KStackWatch handler support
Date: Tue, 11 Nov 2025 00:36:14 +0800
Message-ID: <20251110163634.3686676-20-wangjinchao600@gmail.com>
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

Add support for identifying KStackWatch watchpoints in the ARM64
hardware breakpoint handler. When a watchpoint belongs to KStackWatch,
the handler bypasses single-step re-arming to allow proper recovery.

Introduce is_ksw_watch_handler() to detect KStackWatch-managed
breakpoints and use it in watchpoint_report() under
CONFIG_KSTACKWATCH.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 arch/arm64/kernel/hw_breakpoint.c | 7 +++++++
 include/linux/kstackwatch.h       | 2 ++
 mm/kstackwatch/watch.c            | 8 ++++++++
 3 files changed, 17 insertions(+)

diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index bd7d23d7893d..7abcd988c5c2 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -14,6 +14,9 @@
 #include <linux/errno.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/kprobes.h>
+#ifdef CONFIG_KSTACKWATCH
+#include <linux/kstackwatch.h>
+#endif
 #include <linux/perf_event.h>
 #include <linux/ptrace.h>
 #include <linux/smp.h>
@@ -738,6 +741,10 @@ static int watchpoint_report(struct perf_event *wp, unsigned long addr,
 			     struct pt_regs *regs)
 {
 	int step = is_default_overflow_handler(wp);
+#ifdef CONFIG_KSTACKWATCH
+	if (is_ksw_watch_handler(wp))
+		step = 1;
+#endif
 	struct arch_hw_breakpoint *info = counter_arch_bp(wp);
 
 	info->trigger = addr;
diff --git a/include/linux/kstackwatch.h b/include/linux/kstackwatch.h
index afedd9823de9..ce3882acc5dc 100644
--- a/include/linux/kstackwatch.h
+++ b/include/linux/kstackwatch.h
@@ -53,6 +53,8 @@ struct ksw_watchpoint {
 	struct llist_node node; // for atomic watch_on and off
 	struct list_head list; // for cpu online and offline
 };
+
+bool is_ksw_watch_handler(struct perf_event *event);
 int ksw_watch_init(void);
 void ksw_watch_exit(void);
 int ksw_watch_get(struct ksw_watchpoint **out_wp);
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index 99184f63d7e3..c2aa912bf4c4 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -64,6 +64,14 @@ static void ksw_watch_handler(struct perf_event *bp,
 		panic("Stack corruption detected");
 }
 
+bool is_ksw_watch_handler(struct perf_event *event)
+{
+	perf_overflow_handler_t overflow_handler = event->overflow_handler;
+
+	if (unlikely(overflow_handler == ksw_watch_handler))
+		return true;
+	return false;
+}
 static void ksw_watch_on_local_cpu(void *info)
 {
 	struct ksw_watchpoint *wp = info;
-- 
2.43.0


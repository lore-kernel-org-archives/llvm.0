Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A92E1F13
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671978; cv=none; b=jB+8CNZfBihXrtL8gaOhiQYJ7TW+k6uV+RAH8uQi6BtroJV2V20mYlX//0GaeMGvWnGb8tf8n13uQkOLPgUBM+kl0rsZPXIaOkRuh84jpvd+0V/KTkrmmAZ1oZEaIHl7FKPX32+RYSeDSb+G8jScMtAYSfhdGePQX/VTmrJl/zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671978; c=relaxed/simple;
	bh=6mefF6IMMzyvYBUHPb6m4n0UB5fHQfdxvPTrHUmunyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxcI47Y/yFwl1VcvwFjfjJR8Nok1fOCkMoBVkaQLSOpJLAH6cKucFMKkfRq0ZbuV95uds+A8S6app5kfBMxrDpAzF7Lm320ru3hQM4hNs7it3G7sjYdkteXBLIHfaJEJJ8T/X9lu3qclXKNHZ9c3aIVQtGmfzcDue5cWxLij5+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaaHlKN4; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaaHlKN4"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24cb39fbd90so15148375ad.3
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671976; x=1758276776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwBrRJrnxCqu1u7UrV9e609up8TstQr3mGzjgxeQ/fA=;
        b=AaaHlKN4QZGnmlVvMlEel8wC7f4zJQ/NLb6IPlDNvUj4a974Q8KNERi5ao/WCRIFLx
         r94KviE3ROwd7zoJhbvysvu3bNAunNwA9wVenTCGo0KmSMzU7rs2t0n+1p2Pi7zSpvPs
         bFi1ZJ53ZsHZzTY97BpYQ6dFEBCHFY+gOaFkEcbvsrPGFbwo5LvTZvfmgklu3Usoumf0
         nx4uNyEJlkC2jxUk0GqirtE6HwzUkIdHC4zPwHDL8X5oz4IYWNSeePeQP1qq0D4WKvbW
         eZb2ina2V+aPAgSfYmbAy+1dadJwgSCnRfzZjKSZqpBvWkdvvIzeqbIE6a67t7V9dtev
         wB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671976; x=1758276776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwBrRJrnxCqu1u7UrV9e609up8TstQr3mGzjgxeQ/fA=;
        b=mqiyfLiFiWuhHmoHGLu3+a7mzrQzJ1x0moxror0FN3ZiTJKfCGmVZq2BnS+0LVaJ5T
         +sZjzIyHC/on3kNYNpYGGF7/kfFO2ypQHEYZ8ZLnFABdEO6r9y9OX7gGL7w1ibNexrpD
         MZ5u5HPhjEQiJbwUvgFnyoT6u5g0nP1UHgFcl1y0eaNzOV3n37bzemqS/9tRHH1HGkFT
         2MFVV11lIGTU4spqERPLWy2nyuK66DDj5oclAIRDh0KddP0DEE5OwSeKrh4QnaqZk10i
         iPsN+1Px/T72X/DDoQ05LtjUG+YmI6PvumZFsnl09EOK+L9E/jq1KhamGfXxyLPk7Vgl
         36fA==
X-Forwarded-Encrypted: i=1; AJvYcCV3yBqQjFqnNfQNTb+dZSznvpe0NCO1wJriNMhIpBYwiC0fHgKzX2JVh/ZDGeVsOxWWAJed@lists.linux.dev
X-Gm-Message-State: AOJu0YzChbSkLG723YCCFZbcYO1pwgwYIEY+bOeQo4PP6G0FGnPUj6Fn
	CYp7UVLO7MZcjdZnc1sYTTbGCyilXB9xsVKUGg8ZRzU1485if0f2CbnW
X-Gm-Gg: ASbGncspGCsRzQVJnjJeRSjLnHwSHae+7/1wRkzKyHAemHJanFRiQAyjOSZ3DFd3ApY
	Qm1t/Lq2KU2ArbNjZL69DnFEYNZnnahiqZ7dgGxPr3EfuBx7kSPwrusLGebT6vt/bTCZ3n4hmK0
	U65rDGmifxuW7K1LinZRF0fAJjo2bYuIBrPVP4VvRqat1lx7YH3/NT2iTPujbyL7uuarGn5XU/W
	45Ss9DoUvWkz4Z44BHSl/ZuDVUS4qxulof9SWq4WwCXuxabe3uYU0B+9iuMzJM2/AFMQXEZ9XAP
	oelygwvdd05FXVdWfa4SGupdwbSgTuKHs3mpJUu2MfpBKNhXQWRJzQQxsk9BVoIpzKl8BMvh8mk
	Z8U4jdCUxyxp5ih8aMj+V5SXdSegNd6m4eTXoUVA=
X-Google-Smtp-Source: AGHT+IHmhDxbrAgWt/ZFf2b2ARujdiSrTzk9h/pJ/Apo0LVYSifl646MIHmgwZB8g3f29HVWj78WGw==
X-Received: by 2002:a17:903:2f0d:b0:248:79d4:93bb with SMTP id d9443c01a7336-25d26e449b9mr26345655ad.31.1757671976359;
        Fri, 12 Sep 2025 03:12:56 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6af7sm44843015ad.5.2025.09.12.03.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:12:55 -0700 (PDT)
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
Subject: [PATCH v4 12/21] mm/ksw: resolve stack watch addr and len
Date: Fri, 12 Sep 2025 18:11:22 +0800
Message-ID: <20250912101145.465708-13-wangjinchao600@gmail.com>
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

Add helpers to find the stack canary or a local variable addr and len
for the probed function based on ksw_get_config(). For canary search,
limits search to a fixed number of steps to avoid scanning the entire
stack. Validates that the computed address and length are within the
kernel stack.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/stack.c | 88 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 4 deletions(-)

diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
index ac52a9f81486..65a97309e028 100644
--- a/mm/kstackwatch/stack.c
+++ b/mm/kstackwatch/stack.c
@@ -9,18 +9,98 @@
 
 #include "kstackwatch.h"
 
+#define INVALID_PID -1
+#define MAX_CANARY_SEARCH_STEPS 128
 static struct kprobe entry_probe;
 static struct fprobe exit_probe;
-#define INVALID_PID -1
 static atomic_t ksw_stack_pid = ATOMIC_INIT(INVALID_PID);
 
+static unsigned long ksw_find_stack_canary_addr(struct pt_regs *regs)
+{
+	unsigned long *stack_ptr, *stack_end, *stack_base;
+	unsigned long expected_canary;
+	unsigned int i;
+
+	stack_ptr = (unsigned long *)kernel_stack_pointer(regs);
+
+	stack_base = (unsigned long *)(current->stack);
+
+	// TODO: limit it to the current frame
+	stack_end = (unsigned long *)((char *)current->stack + THREAD_SIZE);
+
+	expected_canary = current->stack_canary;
+
+	if (stack_ptr < stack_base || stack_ptr >= stack_end) {
+		pr_err("Stack pointer 0x%lx out of bounds [0x%lx, 0x%lx)\n",
+		       (unsigned long)stack_ptr, (unsigned long)stack_base,
+		       (unsigned long)stack_end);
+		return 0;
+	}
+
+	for (i = 0; i < MAX_CANARY_SEARCH_STEPS; i++) {
+		if (&stack_ptr[i] >= stack_end)
+			break;
+
+		if (stack_ptr[i] == expected_canary) {
+			pr_debug("canary found i:%d 0x%lx\n", i,
+				 (unsigned long)&stack_ptr[i]);
+			return (unsigned long)&stack_ptr[i];
+		}
+	}
+
+	pr_debug("canary not found in first %d steps\n",
+		 MAX_CANARY_SEARCH_STEPS);
+	return 0;
+}
+
+static int ksw_stack_validate_addr(unsigned long addr, size_t size)
+{
+	unsigned long stack_start, stack_end;
+
+	if (!addr || !size)
+		return -EINVAL;
+
+	stack_start = (unsigned long)current->stack;
+	stack_end = stack_start + THREAD_SIZE;
+
+	if (addr < stack_start || (addr + size) > stack_end)
+		return -ERANGE;
+
+	return 0;
+}
+
 static int ksw_stack_prepare_watch(struct pt_regs *regs,
 				   const struct ksw_config *config,
 				   ulong *watch_addr, u16 *watch_len)
 {
-	/* implement logic will be added in following patches */
-	*watch_addr = 0;
-	*watch_len = 0;
+	ulong addr;
+	u16 len;
+
+	/* Resolve addresses for all active watches */
+	switch (ksw_get_config()->type) {
+	case WATCH_CANARY:
+		addr = ksw_find_stack_canary_addr(regs);
+		len = sizeof(unsigned long);
+		break;
+
+	case WATCH_LOCAL_VAR:
+		addr = kernel_stack_pointer(regs) +
+		       ksw_get_config()->local_var_offset;
+		len = ksw_get_config()->local_var_len;
+		break;
+
+	default:
+		pr_err("Unknown watch type %d\n", ksw_get_config()->type);
+		return -EINVAL;
+	}
+
+	if (ksw_stack_validate_addr(addr, len)) {
+		pr_err("invalid stack addr:0x%lx len :%u\n", addr, len);
+		return -EINVAL;
+	}
+
+	*watch_addr = addr;
+	*watch_len = len;
 	return 0;
 }
 
-- 
2.43.0


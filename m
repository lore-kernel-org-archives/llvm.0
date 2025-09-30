Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1A5258EFC
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 02:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200335; cv=none; b=sf/sUl8VbWgcH1eO8t//50AlHgRB4XISNCgSRrbcaIABbysWqsDZPXj85qt0r4bYQUV4l5gYVrBtvw/gUIdhmLDkWvYZYjtagaUXb+43bGR/puAIJ6pTSn79v+Z/55+cObhy8DDGFfKL6XqsdjwzjTqVIClh5yZYsDhNpmNmNUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200335; c=relaxed/simple;
	bh=ye1IFedT6QyfAsl7NnFp/ScKqi80nwnk9udpC+1GQaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQJenJ2PTRI+gB34GGnXziYZc69Lg875XlOC/VdmGKba4OY+b6pyrzyxb91sDF4VckjnY+4cf47ZnwsO4HBM18T9kYsrt6nROPHJxqgoEpl9zd+OcpxdtgjsgF0rsytxAeQZyAbu0qbs2Oj4K/a+EkIU6eCxqL2ibDnwuEOD5sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HD8uHnaW; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HD8uHnaW"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7811a5ec5b6so2801118b3a.1
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 19:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200333; x=1759805133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RtyZdLa/V9peD4vyIt7vF3g+yVd+tHG9wNYuCcZNH8=;
        b=HD8uHnaW9sCMTDdvCy+AQ/zZpqe2wag8hhjn2PYhMq9OGk7IVFTMkHtLHOlD1ORKnU
         LeUIYnx33feyFxf8Ce4VBMUonWP6PUHiN4OKYTenyWtY5TrjRSvLMg/gvjMFw04V+MnC
         2tMloh9erbx1qaSmzTK8DKgDJHueaosEg5UqFG1BvqcG3YA+AAGNjTOUwKJdgZJZUKFK
         OWz15bsjvPVTMmqnNwqL2sg653GZy7MvJeNljFP+UE1hzGcj83dUIkWM7YGVkXW89iOf
         1MYQRBk+/ujl+pRVZE+EgvuchUVaO2GxnLcGRIOjGt+Eo+vSE+kHmuUrKbhxuYS0iJBp
         O7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200333; x=1759805133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RtyZdLa/V9peD4vyIt7vF3g+yVd+tHG9wNYuCcZNH8=;
        b=GM9sWGzOPbghzI2H8jzSeKU/tmbSqCFLKNH3sCdTfHuElsvZ4058YoEe5o3pgEZyxe
         eQb8Hy277a18oK27G3YaTYFXjiieZOBqO8TDft/IRDuKAAIYJfAcQPooWGNv+g/qmFvf
         n0t+Mr25dPEkSin6MfjrwwyLcnxMjo5/THVfR4lKuH0ZzkQS22ORRdH3i1wnjYIuPPg6
         HQ1EEjdaueoPoxlah85x/uzXz8WLw6M90SK25uf7BTuSU7AzKlQZ+DKKCzolT2Q1eNrd
         vvcxBb3SCYweTjwl5AaZfJqp/JRMcnMeMRPo+GYhV1PHVnwM3lrYDXqlQjLtzPwKv+fa
         6IFA==
X-Forwarded-Encrypted: i=1; AJvYcCU3HWv/txIJOIZGiJ3Y2TuVnx17F72GYs8xHnmfLY6a+7hOzf/NVGPOjI9PuoYaiFnoPNGU@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6Lc2kSA/dbu4NQ6JcBW23tK3xy3CYrRpnhW/uOe7pzqdA7gqf
	1EQSdu+oqFuXWq6cwqUw8c1tRJVU5BwyXdWfEDMQpurEgAbhWIBC0IwM
X-Gm-Gg: ASbGncvJBqvn5nVf5pfEUY9dafFFXsh7D6E578zRkHQ2qvJxKQQZ5/Hqp8xHEdoNd9F
	yPaexk0Fi9nG0Py4JSQm2U4ZPu2Hs3PAabwaa7y9Bb9ofCBk/JhDZpquA/ZCen05MNzS5IBTurz
	PupWnAInpVlhb2J1COYDnkcMlVNKCHUpiWkOGBiAJJr3tEh+/LbSxEk2jk1GitzdBNy8pjQT6Az
	AwfUum0TESCqUaFr2NxGulCfO51c8HjQuzTZwNdcNqg/1QfD/6Lo1uQBZUeULbA49G1fi+XzMoN
	wg/cTACTIusjcAk86J8Ke50jvEYDXSBdkIa4dEhI+gwGo7tIXGLVgQFYg+Dsp4jVfpXU7bSc7Mr
	bKtoElOkPq8cAMfyWPv/h0/gizwLYy74GBaCmmuKRcw/ln9++dklxopg5EBp6d52ktKTMUQsnir
	Fq
X-Google-Smtp-Source: AGHT+IEsif2bxHXvYWWChBgM/szcD1tJlw9HGin9oZWPM2Y8lHrYniUGiEidosj0MGkcbXMNhwhy+Q==
X-Received: by 2002:a05:6a20:9c8c:b0:248:ef8:66df with SMTP id adf61e73a8af0-317732b6b3cmr3072325637.30.1759200333340;
        Mon, 29 Sep 2025 19:45:33 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53bb255sm12683002a12.5.2025.09.29.19.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:45:32 -0700 (PDT)
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
Subject: [PATCH v6 14/23] mm/ksw: resolve stack watch addr and len
Date: Tue, 30 Sep 2025 10:43:35 +0800
Message-ID: <20250930024402.1043776-15-wangjinchao600@gmail.com>
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

Add helpers to find the stack canary or a local variable addr and len
for the probed function based on ksw_get_config(). For canary search,
limits search to a fixed number of steps to avoid scanning the entire
stack. Validates that the computed address and length are within the
kernel stack.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/stack.c | 77 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 3 deletions(-)

diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
index e596ef97222d..3c4cb6d5b58a 100644
--- a/mm/kstackwatch/stack.c
+++ b/mm/kstackwatch/stack.c
@@ -9,6 +9,7 @@
 
 #include "kstackwatch.h"
 
+#define MAX_CANARY_SEARCH_STEPS 128
 static struct kprobe entry_probe;
 static struct fprobe exit_probe;
 
@@ -59,13 +60,83 @@ static bool ksw_stack_check_ctx(bool entry)
 		return false;
 }
 
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
+	// default is to watch the canary
+	if (!ksw_get_config()->watch_len) {
+		addr = ksw_find_stack_canary_addr(regs);
+		len = sizeof(ulong);
+	} else {
+		addr = kernel_stack_pointer(regs) + ksw_get_config()->sp_offset;
+		len = ksw_get_config()->watch_len;
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


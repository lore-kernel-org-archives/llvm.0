Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B1E2F0695
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672000; cv=none; b=safcvVzhN7WRf9k3Xsaj8aAalYTlcV7f9rxIQdIZO0v6nUwjsUo0azsDxFP7T8nk93aBOpGbYoJCEAWcjvuzVz7zgetOtmGwu91cj59rIsq2+we0NtAlGjZVX1q9L04AoPV3O3RQRNPdRe/v0EUFZYyKs+E90vAMOdjPBR5iyeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672000; c=relaxed/simple;
	bh=0pYLSOeA0PAf1TeSGJQVGULqR9LKSdf8J0mO6JXy6uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZ+kCJt2INmE1YclI3x0YwTRsg4L10aLYy7tYRXjqtxsSe6PXmXAu/grIwM8PGtx8nffrZKT4yCwrCD2NwVW0vQLHgO6wCbxJW+U2ppYuRiGPj1SHqEh31jvKSZcuIMhK3HlvTSh4Z88rK8oVyCM36mrszntffxG2OwDv363voo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpPgahHp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpPgahHp"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77264a94031so1348913b3a.2
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671998; x=1758276798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6BBsZfnmfgl1Jgn+pU00vd6g5c1DTmTteWqGp/Sk64=;
        b=VpPgahHp+OuzL6PbPd8Jjj3SaRwrCfnkVFgtI5EcRoc7NnoUtM9Db4ZrV6yGO4bsbp
         DxORdrJ/0yvPyFnoaYhGivQ1fg6HfuuZXAUkg+7edRHJR/Sz4kpuhKXh2uNd6tWO89zy
         5RFaOejbffs7D4obF5shIK8g9LxuEOf/w9qnnJwe3kXek93MpTh0qhKhShqW2TiYUrjY
         gyAhXh+m58CuhjVRBON9TSXCYlnDJgmR/MZ2LL6jNHznxNYC4/dk15+Cfq0gOnPipD2R
         4KJoQNsf0Av4P20nUN9DvRaJ6BTLVJ0omPdBu1iNbb+qr74UguPBqVu6aSv3Xxkd0a1J
         TgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671998; x=1758276798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6BBsZfnmfgl1Jgn+pU00vd6g5c1DTmTteWqGp/Sk64=;
        b=G9aU4DLrFsfvGEz75G7B3BUX7b3ZR4XK6sO7HmO/f4RPAo+pYEkL61Ld/d+SHYrD66
         tp8e0cgDaPYF6zix84yHWpH/n7TENRUlXjnlZxvBioyb30Z6NZBDStjq4hHi2/wTsqcN
         GrxYH+Gcy4pAbfVk0hgAOM5GR24s69t+DdNwS8kD/baGfmVg0yzHFx0SjnERSa89NNAh
         e+xhL9X/Z/zcIA+MD/Rt9FKddpr41QG9oLNqqWIqWdPW233/2oqCKFTGYRBg9wGPDfcH
         kBp4DIXTgfmfrDwuZyJog0nBk4w714TxlB606RjCn/y8QgFo0R7GHOAnkpUIMvtO8mj2
         BmMg==
X-Forwarded-Encrypted: i=1; AJvYcCWld1FT/KUv41vYltXQ+wX/LBSugd48PfYdq/EeESpzBLfCbcpwRJvFC7+CNYP5T/xeK4oB@lists.linux.dev
X-Gm-Message-State: AOJu0YwarHdRRl1KjcN7jnx6IUKgYKln1X0n8PVHalKAOtkAK2wxKUPZ
	w2sVXfnQRsWBnAGiv9l/mQXxG3leX85YyOcwmm5WCBa+woejVftCrBCK
X-Gm-Gg: ASbGnctKh+HuezgXop7EwsmLL4/oWt+hnuDh5Vd/9XekTxzyEKRRTx8nfRVT/5bWELY
	RSJ5KiSyBXjI4TJMafn6z3B0Qh2HZTfFT5hd7ED5hIlpotVW39zunZNlvELV0tNVmFVCwyhv1hi
	lSJRG2xcZdFYMsJJ1CNbRTmBaMeYlareSXsqQAFh1Warj4T4bhyBG7fL0RryHs5L2BYcPuq098r
	0YZZpOU1EZW42hLctauUPFiBDhEn0wdYZ2BnAXsyFSP41VxXBKW1X4AkhIvDABGDp0PyunBtTyE
	PpcPmN81+j8+RJMSt3ux4p3LGkPcTqi6Y6p1ohuT5ar+h6L4jOmTfRONuvk5s2NQWCkg0Nu2n/g
	gUksFuImb5hgKdlR+5YOYW5GCXXFAR7QxskQF+PBa7bnBIg==
X-Google-Smtp-Source: AGHT+IFP0Z697TA4h3v44yo8u1mt3XK26j9kYKC9Oe9buFWhspRDiIMhNWMUBIxM8GwcPJ0/MCOUpw==
X-Received: by 2002:a05:6a21:33a6:b0:246:3a6:3e41 with SMTP id adf61e73a8af0-2602a5937a8mr3020791637.6.1757671998049;
        Fri, 12 Sep 2025 03:13:18 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd98b43a7sm5206301a91.13.2025.09.12.03.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:13:17 -0700 (PDT)
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
Subject: [PATCH v4 16/21] mm/ksw: add stack overflow test
Date: Fri, 12 Sep 2025 18:11:26 +0800
Message-ID: <20250912101145.465708-17-wangjinchao600@gmail.com>
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

Extend the test module with a new test case (test1) that intentionally
overflows a local u64 buffer to corrupt the stack canary. This helps
validate detection of stack corruption under overflow conditions.

The proc interface is updated to document the new test:

 - test1: stack canary overflow test

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/test.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index 76dbfb042067..ab1a3f92b5e8 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -40,6 +40,27 @@ static void canary_test_write(void)
 	pr_info("canary write test completed\n");
 }
 
+/*
+ * Test Case 1: Stack Overflow (Canary Test)
+ * This function uses a u64 buffer 64-bit write
+ * to corrupt the stack canary with a single operation
+ */
+static void canary_test_overflow(void)
+{
+	u64 buffer[BUFFER_SIZE];
+
+	pr_info("starting %s\n", __func__);
+	pr_info("buffer 0x%lx\n", (unsigned long)buffer);
+
+	/* intentionally overflow the u64 buffer. */
+	((u64 *)buffer + BUFFER_SIZE)[0] = 0xdeadbeefdeadbeef;
+
+	/* make sure the compiler do not drop assign action */
+	barrier_data(buffer);
+
+	pr_info("canary overflow test completed\n");
+}
+
 static ssize_t test_proc_write(struct file *file, const char __user *buffer,
 			       size_t count, loff_t *pos)
 {
@@ -63,6 +84,10 @@ static ssize_t test_proc_write(struct file *file, const char __user *buffer,
 			pr_info("triggering canary write test\n");
 			canary_test_write();
 			break;
+		case 1:
+			pr_info("triggering canary overflow test\n");
+			canary_test_overflow();
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -82,7 +107,8 @@ static ssize_t test_proc_read(struct file *file, char __user *buffer,
 		"KStackWatch Simplified Test Module\n"
 		"==================================\n"
 		"Usage:\n"
-		"  echo 'test0' > /proc/kstackwatch_test  - Canary write test\n";
+		"  echo 'test0' > /proc/kstackwatch_test  - Canary write test\n"
+		"  echo 'test1' > /proc/kstackwatch_test  - Canary overflow test\n";
 
 	return simple_read_from_buffer(buffer, count, pos, usage,
 				       strlen(usage));
-- 
2.43.0


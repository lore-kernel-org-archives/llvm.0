Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799C52EC554
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671986; cv=none; b=eigW6DOsR0ez8pXsWHWqQ7+cqgIxnpQufskYuMyEMAqCWVPzGyXoQxlMvu92j5/SaAIFa+FWOe8/rKDP/T/TM3Te8fCayzLIjYexz7A2GW15Oi/aTjtuxCyBxUw18L1eBFWb+4YL5OzKrwV6z+g6kP0Dr3fZpowMl268P1TA1ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671986; c=relaxed/simple;
	bh=jd25GVZ1dwCG1KSIktqN4mRE3G30pXiK/2KO15zxh2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EM7gB3hU5haGKk9ksQvLIpbmMmPquqzLpIzxRqppB3ncPGRNdiTtZnqWnoE9ayhurgfQABEXYcfeBWbATxf3vh7BLBTNkVrMK54cYiW70+Dl3kqV1hoGG9hdw3A9Y1WQA7P4YRl6ZQAYIZVQ04Stt/YrJMv7OToOLFInBl0JOIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=busBG6m9; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="busBG6m9"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b4cb3367d87so1131631a12.3
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671982; x=1758276782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Mx/ZUXbIMqKSHkTbty4rSJVQCBlfpfdQjz++MJLD94=;
        b=busBG6m9D/rBsHB+OxkDZrsOWAVarOcwEJiNA7hJueU9Y/44EQpbqZfeA+zh2HSgg3
         3rwE/gHyGOBAcbM8Xdchg5HxnG/JwBj0OXF9E8Q5/AeVtQiWYNpV6AIWvXBG2qAOgfkg
         yrsRwoC7044EzanVdQJdfLa1+cCqEDc40PKs0+xdxJLayM1YCpOJrTAXYBU03dY0INuO
         i2jUtgJZhDDapumQg1JNfaVCwDusuu499KS22jYo4AzYaOp6Z/XOXA9nSENSZkg6vn4G
         OOr9uxUPos/FNMdgsLzIXBPFZR1+OXKzR8LQ1nooDiEL2g8YdkIkcKMX3/UnxqG7Wdtb
         mJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671983; x=1758276783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Mx/ZUXbIMqKSHkTbty4rSJVQCBlfpfdQjz++MJLD94=;
        b=sWelha1AnYPPFZKDwBOtrsLPpy7iwQ5XG4Hlk6LAIMgtCMQp8OOKX7BlG6HZjPaihJ
         OWlKhZvRHsWBs6Pmsb6FPphpmbupeHbf+BlXiiZxm8lC2ukqUeYj4899iHmWcl4DXNqR
         UyfCfwaU4Hh9oSypetdGTNtuDh92TcQ+zH4P9Gr+oH1XgmyZAC8523oyRLiMUqWI7Id5
         jje/wWBnKwpSDR7xzl6mxIZV3mRbgEjnEx6OrE370umVud/u23VxB9iAMSmZ2/rMMLjS
         b6h9bt7R65+jlCPJEyy0HJ/EGinF8ZJosfA+rPM2pP9tuuaA/yUkFiM77Z71reDbY5QW
         lR5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXN21YKE7jvbMC0+5zTJFSxIof3BN8lelirBhqYUUnD//nZ/fGTxycZbdEkK2/4PIZT8rIg@lists.linux.dev
X-Gm-Message-State: AOJu0YwxSEjr3VrM6F/3zilEoHwX1Ayj0zpaT02kpByxeDVVcjniDSUk
	N17e2WQcsLyMExf2idWlX6fJ9zMdEEly4DXY28ORayC/LdjCSuClt0fE
X-Gm-Gg: ASbGncsytJNi8Q7/C17eJWTtECWgjgPH84cmzXKmCcz6bN8nmtoloUaF2AMxLUZupLj
	ZZooX3ZI+3YLXAygJaYQh9KCt2xny/szFWgjwOmJkgK2Poy0Fvm/UOow3yp/hJJP9tRID7zXqNl
	j4SPESvyWMlUwZk/BhDM1yUIoAHzm59klIp7m4k1IpB9M3X86TRgILkSUnXvtI+eW0e4J12HOT/
	ZyKQJIvknqntKrJETvt5bZBK2pCDRZmL4jciiMHyxIq1jE/MAm4SlyIHeK3w+ssVhR0TIB45AIf
	IHM9d0KjPPmBTo4dVLA/TlhT/5J8X1bnqA/VaeLkowugxEaD3dn4a1iOporuYOZrD6xZ243M/2S
	Wu83XjTjeT+IbrdJs1WaXZvZNNDO8kwrXRf4o8jLBGM1WHEz0Mg==
X-Google-Smtp-Source: AGHT+IE+4u/LnZqfy4mSwj4sJkJVx6sl0nYi/VrPz9wqHW9cd8FRDoTWUsuOoKihHmm7ZzWEk3p2jA==
X-Received: by 2002:a17:902:cecf:b0:251:493c:43e9 with SMTP id d9443c01a7336-25d243e79cdmr29426295ad.3.1757671982485;
        Fri, 12 Sep 2025 03:13:02 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37295f9dsm44540355ad.55.2025.09.12.03.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:13:01 -0700 (PDT)
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
Subject: [PATCH v4 13/21] mm/ksw: manage probe and HWBP lifecycle via procfs
Date: Fri, 12 Sep 2025 18:11:23 +0800
Message-ID: <20250912101145.465708-14-wangjinchao600@gmail.com>
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

Allow dynamic enabling/disabling of kstackwatch through user input of proc.
With this patch, the entire system becomes functional.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kernel.c | 55 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
index 8e1dca45003e..9ef969f28e29 100644
--- a/mm/kstackwatch/kernel.c
+++ b/mm/kstackwatch/kernel.c
@@ -17,6 +17,43 @@ MODULE_LICENSE("GPL");
 static struct ksw_config *ksw_config;
 static atomic_t config_file_busy = ATOMIC_INIT(0);
 
+static bool watching_active;
+
+static int ksw_start_watching(void)
+{
+	int ret;
+
+	/*
+	 * Watch init will preallocate the HWBP,
+	 * so it must happen before stack init
+	 */
+	ret = ksw_watch_init();
+	if (ret) {
+		pr_err("ksw_watch_init ret: %d\n", ret);
+		return ret;
+	}
+
+	ret = ksw_stack_init();
+	if (ret) {
+		pr_err("ksw_stack_init ret: %d\n", ret);
+		ksw_watch_exit();
+		return ret;
+	}
+	watching_active = true;
+
+	pr_info("start watching: %s\n", ksw_config->config_str);
+	return 0;
+}
+
+static void ksw_stop_watching(void)
+{
+	ksw_stack_exit();
+	ksw_watch_exit();
+	watching_active = false;
+
+	pr_info("stop watching: %s\n", ksw_config->config_str);
+}
+
 /*
  * Format of the configuration string:
  *    function+ip_offset[+depth] [local_var_offset:local_var_len]
@@ -109,6 +146,9 @@ static ssize_t kstackwatch_proc_write(struct file *file,
 	if (copy_from_user(input, buffer, count))
 		return -EFAULT;
 
+	if (watching_active)
+		ksw_stop_watching();
+
 	input[count] = '\0';
 	strim(input);
 
@@ -123,12 +163,22 @@ static ssize_t kstackwatch_proc_write(struct file *file,
 		return ret;
 	}
 
+	ret = ksw_start_watching();
+	if (ret) {
+		pr_err("Failed to start watching with %d\n", ret);
+		return ret;
+	}
+
 	return count;
 }
 
 static int kstackwatch_proc_show(struct seq_file *m, void *v)
 {
-	seq_printf(m, "%s\n", ksw_config->config_str);
+	if (watching_active)
+		seq_printf(m, "%s\n", ksw_config->config_str);
+	else
+		seq_puts(m, "not watching\n");
+
 	return 0;
 }
 
@@ -176,6 +226,9 @@ static int __init kstackwatch_init(void)
 
 static void __exit kstackwatch_exit(void)
 {
+	if (watching_active)
+		ksw_stop_watching();
+
 	remove_proc_entry("kstackwatch", NULL);
 	kfree(ksw_config);
 
-- 
2.43.0


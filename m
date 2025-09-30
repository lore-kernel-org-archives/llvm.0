Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062AF266560
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 02:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200348; cv=none; b=A+jzmsGVa+n8IX+AEUNxp3en0em9/9NGxmEfZZaFCPkBXfPYGRynqQa7MXqnwqntHaR9J2NGTb8O33gUckIrymblGPQKfgp/y4m+ga/l/+t/5gwiZ10lrhKdtKXxA28tJdrbJNNEwtactBa1+ovND5cLI0rHoGqsnu5ptrMT1Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200348; c=relaxed/simple;
	bh=fq2Ne6eA5Hj+u/oZogdwy0lpJa+hkt/8IQwPQXp6BxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqXXE9rGSoNAWit7jHFOvYNVP5M0WAMXQkWWQhJ+5L4ZbWlWNX03rhUd1t2L7mStj7PjMRtP5+dIzuBKd5zpCjqHHY040JCb6/KYZU18KpJ151a9PvH799IkAkQNLr5BxkBn/xF0+FrbZ2dgbVISURSb8AsSbDRGNKLJHKugWcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxCej7xf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxCej7xf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-279e2554b5fso44821985ad.1
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 19:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200345; x=1759805145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Zjn9o91E8eMF6fANpWy8yJadTo2vfyIghwnTsVomDQ=;
        b=BxCej7xfPcDkrcQlc4V0DglyMdLa0263tFPEuJSFHJzgX9HIkBnfhd8Dqq7X8WIBEv
         jTtEJnVBQfSLvCBnV1kx4d0FljKdMdkT0bhf8++yldHbwU6muxpp51xJlPjElmobOSCL
         NktZIoE2JT6v4QljEGJk1WpVuMRQ8BUkyTQiVtnSShmBYCSigYlHaZuJJ9IxhEFG3UEQ
         9KavJxcmEzCL2eQt1VTYOwPqlTCa941sYi5RNCpAxarwzTpqyJC8rZBHNQUyg/njp36I
         5qJ48/lWDJxTb9MmCeP43FQic8YnVD5DslBZaFaEbCAipPO0KTaHwEEp43TZX+Jiixom
         RSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200345; x=1759805145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Zjn9o91E8eMF6fANpWy8yJadTo2vfyIghwnTsVomDQ=;
        b=XumGlA2oIniJUsfGFR4lJv1eJ5COlU2NeoLLdHDDCRJz5UFL4/2EMNyakVcVoS83iF
         Keq8O7geZlmzIAU2h36gDZ9LqXarCBK+6Jlf/jj+8bvFDxyLwUE07FoIOfcUtsIBbf/f
         Nr7LXCJV+3HQs8bIxgOmLgkqeMLX7l5SSIhVLsXk3z/vAmWuoKnC2d/y6Ljg2HHfBToD
         kBvaaFVxeMEKdWgk/B/gHYCtWmLT3CuivuYoVhTb6ODgg4Vcl2qGaZBPHK36lb+gfu63
         6V0LhlUdYMYutxl3n4Ss7ZtRz01Wi7DpGam+l5W5UxUCrn9AZ5RH45z/rM1hHhlsOvuD
         Zy0w==
X-Forwarded-Encrypted: i=1; AJvYcCVaxrxh95JgC+HfaSJd+O/r26J7ZGv+RHGiYdCfIWHgv7DmJpuIMz3Xc8tHoDP9Yu2A00cZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxlfkdH7I1QYcMVhkpfb2HxjQrZjPSegcGUFwHVXL5rgVoIjEla
	sLnCtS5Dzy9Q8egsu3a8KVtQ0Wk3SW8uQS76TCWK8t4WVze0TLaxNY3M
X-Gm-Gg: ASbGncsiM40475jDcCsJBnKdYtdRHWpYaxEp6BKNN1xr8z8I5zsgVM8vRtsoxdhFCKo
	xFjo1Rc2y0piQ/QReQ5wsgfK1f6joiGD+vGDQ6w8fajlvP17qABwHVSNOWmxkIE1X6ZEAetrgbw
	vYbXFGZVYMUNG7TIqTw3VhYTLwsK4sD8urisDJQYDZhJHrc/UTE791WMrkkm0IQO0HrqKYbIf60
	h1TyVm9btZ7JULRFTKeAM5JA2Aycoh7u5lUiB92qEcdPRfIqmE8FnpE8EHucTRWaXjGVfx8zUUG
	/dmcG7PwQMp76Fee2Nv2ca1bvYk7dNWCHw5WqhOyutc+S7BHqhlxEdmeUg/yL3ul8rkknHh2Hrr
	G9JvJmYJu8jwHfjFLi6U0Rv6VCxSuZAxcjtRztD892bA8AtrHEFm3KQWuR4VBl+afN9likpkrrR
	Hj
X-Google-Smtp-Source: AGHT+IG/V+l4d2YJ6ds5JXx6iWxJNgpfbKQaTWJecBpgg+jS+5oh1BhPKfXY/R3RErss9TGYBDL6Iw==
X-Received: by 2002:a17:903:2f4e:b0:25d:510:622c with SMTP id d9443c01a7336-28d1718d306mr31185225ad.28.1759200345170;
        Mon, 29 Sep 2025 19:45:45 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27eea801b49sm118165465ad.23.2025.09.29.19.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:45:44 -0700 (PDT)
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
Subject: [PATCH v6 17/23] mm/ksw: add test module
Date: Tue, 30 Sep 2025 10:43:38 +0800
Message-ID: <20250930024402.1043776-18-wangjinchao600@gmail.com>
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

Add a standalone test module for KStackWatch to validate functionality
in controlled scenarios.

The module exposes a simple interface via debugfs
(/sys/kernel/debug/kstackwatch/test), allowing specific test cases to
be triggered with commands such as:

  echo test0 > /sys/kernel/debug/kstackwatch/test

To ensure predictable behavior during testing, the module is built with
optimizations disabled.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/Kconfig.debug             |  10 +++
 mm/kstackwatch/Makefile      |   6 ++
 mm/kstackwatch/kernel.c      |   5 ++
 mm/kstackwatch/kstackwatch.h |   2 +
 mm/kstackwatch/test.c        | 121 +++++++++++++++++++++++++++++++++++
 5 files changed, 144 insertions(+)
 create mode 100644 mm/kstackwatch/test.c

diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 24f4c4254f01..224bd561dcbb 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -317,3 +317,13 @@ config KSTACK_WATCH
 	  A lightweight real-time debugging tool to detect stack corruption.
 
 	  If unsure, say N.
+
+config KSTACK_WATCH_TEST
+	tristate "KStackWatch Test Module"
+	depends on KSTACK_WATCH
+	help
+	  This module provides controlled stack corruption scenarios to verify
+	  the functionality of KStackWatch. It is useful for development and
+	  validation of KStackWatch mechanism.
+
+	  If unsure, say N.
diff --git a/mm/kstackwatch/Makefile b/mm/kstackwatch/Makefile
index 84a46cb9a766..d007b8dcd1c6 100644
--- a/mm/kstackwatch/Makefile
+++ b/mm/kstackwatch/Makefile
@@ -1,2 +1,8 @@
 obj-$(CONFIG_KSTACK_WATCH)	+= kstackwatch.o
 kstackwatch-y := kernel.o stack.o watch.o
+
+obj-$(CONFIG_KSTACK_WATCH_TEST)	+= kstackwatch_test.o
+kstackwatch_test-y := test.o
+CFLAGS_test.o := -fno-inline \
+		-fno-optimize-sibling-calls \
+		-fno-pic -fno-pie -O0 -Og
diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
index 57628bace365..12b2f5ceb5d4 100644
--- a/mm/kstackwatch/kernel.c
+++ b/mm/kstackwatch/kernel.c
@@ -233,6 +233,11 @@ const struct ksw_config *ksw_get_config(void)
 	return ksw_config;
 }
 
+struct dentry *ksw_get_dbgdir(void)
+{
+	return dbgfs_dir;
+}
+
 static int __init kstackwatch_init(void)
 {
 	int ret = 0;
diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 528001534047..b7361d5d071d 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -34,6 +34,8 @@ struct ksw_config {
 
 // singleton, only modified in kernel.c
 const struct ksw_config *ksw_get_config(void);
+struct dentry *ksw_get_dbgdir(void);
+
 
 /* stack management */
 int ksw_stack_init(void);
diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
new file mode 100644
index 000000000000..80fec9cf3243
--- /dev/null
+++ b/mm/kstackwatch/test.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/kthread.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/prandom.h>
+#include <linux/printk.h>
+#include <linux/random.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
+
+#include "kstackwatch.h"
+
+static struct dentry *test_file;
+
+#define BUFFER_SIZE 32
+
+static void test_watch_fire(void)
+{
+	u64 buffer[BUFFER_SIZE] = { 0 };
+
+	pr_info("entry of %s\n", __func__);
+	ksw_watch_show();
+	ksw_watch_fire();
+	pr_info("buf[0]:%lld\n", buffer[0]);
+
+	barrier_data(buffer);
+	pr_info("exit of %s\n", __func__);
+}
+
+static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
+				size_t count, loff_t *pos)
+{
+	char cmd[256];
+	int test_num;
+
+	if (count >= sizeof(cmd))
+		return -EINVAL;
+
+	if (copy_from_user(cmd, buffer, count))
+		return -EFAULT;
+
+	cmd[count] = '\0';
+	strim(cmd);
+
+	pr_info("received command: %s\n", cmd);
+
+	if (sscanf(cmd, "test%d", &test_num) == 1) {
+		switch (test_num) {
+		case 0:
+			test_watch_fire();
+			break;
+		default:
+			pr_err("Unknown test number %d\n", test_num);
+			return -EINVAL;
+		}
+	} else {
+		pr_err("invalid command format. Use 'testN'.\n");
+		return -EINVAL;
+	}
+
+	return count;
+}
+
+static ssize_t test_dbgfs_read(struct file *file, char __user *buffer,
+			       size_t count, loff_t *ppos)
+{
+	static const char usage[] =
+		"KStackWatch Simplified Test Module\n"
+		"============ usage ===============\n"
+		"Usage:\n"
+		"echo test{i} > /sys/kernel/debug/kstackwatch/test\n"
+		" test0 - test watch fire\n";
+
+	return simple_read_from_buffer(buffer, count, ppos, usage,
+				       strlen(usage));
+}
+
+static const struct file_operations test_dbgfs_fops = {
+	.owner = THIS_MODULE,
+	.read = test_dbgfs_read,
+	.write = test_dbgfs_write,
+	.llseek = noop_llseek,
+};
+
+static int __init kstackwatch_test_init(void)
+{
+	struct dentry *ksw_dir = ksw_get_dbgdir();
+
+	if (!ksw_dir) {
+		pr_err("kstackwatch must be loaded first\n");
+		return -ENODEV;
+	}
+
+	test_file = debugfs_create_file("test", 0600, ksw_dir, NULL,
+					&test_dbgfs_fops);
+	if (!test_file) {
+		pr_err("Failed to create debugfs test file\n");
+		return -ENOMEM;
+	}
+
+	pr_info("module loaded\n");
+	return 0;
+}
+
+static void __exit kstackwatch_test_exit(void)
+{
+	debugfs_remove(test_file);
+	pr_info("module unloaded\n");
+}
+
+module_init(kstackwatch_test_init);
+module_exit(kstackwatch_test_exit);
+
+MODULE_AUTHOR("Jinchao Wang");
+MODULE_DESCRIPTION("KStackWatch Test Module");
+MODULE_LICENSE("GPL");
-- 
2.43.0


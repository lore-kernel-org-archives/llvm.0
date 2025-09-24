Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB993301028
	for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715225; cv=none; b=Z6dvYOqVLMZ6O1EhH3KdquOnvtPqOQAtRNv3BCNvBxPhHVgFw5SdizXhbo8z34INsurXg8J3pj1RvtSvxKnk6hk5bhpGW9Vrd+hcfTZLvbMP1Zj6NJBwgzZbQLKx22lOx1NVjNx5RvSZT1uTpHZlSBPI0Sg2jIBGTrgYzK4eJpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715225; c=relaxed/simple;
	bh=eQOJ1NdpQxIiNbCHg8T5EsVl18gH29QLGTs5mtZDgmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FwVkl7lhoLVCvgegI4PEMgQLlf3aobnK35IC+jaz4/7nc0fetCQjNkbM/MuSA2IOAtiULSKpbxTQPLLODjUlApt9PiLOHWeZL0j0OaFeTaXGzKEp1OtopEZlpgXOTohL0dPnISqvIQjRaTqxCdjX5zRCrv63BpG10xutzCUDpJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCaHsnTG; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCaHsnTG"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77f41086c11so2868998b3a.0
        for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 05:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758715222; x=1759320022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h46VjKRHdkcMiEZAqaWzAvZEGNArMuVfKDzvSU/d6uw=;
        b=kCaHsnTG9pbk9TQMS8KUZ4LG51LCSfjLFldR4KnHMqnEJskB0Uk70MGurefbJ7rcLZ
         Gs0/5R7zQ1BJYMUkzgsPXByUtNbwIS6gc9jrr0/Wa/14D9kNkQa2SK+lMlocNaN6Xv/W
         ItcjrAHqfyDq6H9uXwOSxDu9ybp6dJNTnVStb2zBtx02tnQZGfgdKayv+JjhpzmAb/kT
         zXojGij4A/i471HDpdWxR/UsnctSXZzGQIQATrPWATveXHhRTSnkFDOaAq93KgtYrGf0
         Es+TttTjkmNRxIlrG/L4qRax+qOndFPVspY4FSNtN/fnYBmrV3GbF66v6/fzqVZOo/AP
         s0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758715222; x=1759320022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h46VjKRHdkcMiEZAqaWzAvZEGNArMuVfKDzvSU/d6uw=;
        b=cWy6kjraffJhTfzmT8SXt6DVsH8RDgpLG8u2Zfdv38zS/BpHdjKRzEfcE/t3qbflf2
         rHg4cXZP1FZqEuUkZ61dLiQZbSQhgxhCiLCi71+RU2kSIZHysw3IqJTCzuJQUZl5Jty+
         WgeCXlQlKjrk59O/FuuX+LLRFGjHjHja0/zvBVpL581fijTUOvEhCUti9xPcvcE74JYp
         cS9Q6jYUIGJ0nJlvyO5Mp8TjFKMF5riDrhsd+omZFKF2Ur2vPe9AQ2qpbBB75/FKci0q
         Bj40X2W87lEq+KWHeO5mo9OzfUzofdALAmJwBh+yeyZVxPznBEqOMNOA/9U5LuctMd7W
         xH+w==
X-Forwarded-Encrypted: i=1; AJvYcCWdn+8vjQicY3knaGjghq5eWpp48DaMb1EShOc2DD98+mAvwAm/T2u727wMCmWzj4vQ3Az3@lists.linux.dev
X-Gm-Message-State: AOJu0YzxkLMsB71S/zWDD7zgG/SYRwFXdzxvcGVBhXIfnx3YofbD0ydX
	OFq7HehVhEvekWenPwZK/WHA+fsYpjXqVThAgm3tNA9jQRcNjCowyT/d
X-Gm-Gg: ASbGnctky4yG02glYLqjMq9fHL/cAIhkX6iLAvkXy0f06wMXgRWlc51A0qwTLX2xsq7
	GRGSVofQd1uHpkey1bWdqJYP5F10TY8Fc5bfvkIpDAZGPkp7bIlzwwuFG7pZ66zui9csf5Izt2u
	RvZpExPlMyGJC8tIRau3umD4HIL5aAESZv/ivxjrm5mzyGmGpFze0TuMJiEbO3TntmwDDQrJPtc
	3lS+WUhLriakJViu2f2CrdvXSp8lEhV4Q+xXfNCiWOokIL+WH9xkd1TPTTuvPICfzOrSSLVXddw
	Zk8Ljj1ta7FPUu9xwX0JjRVarjFZekqbBx7+2Qx67TYbBFABHCsGagEoWhiZpb++xgwcnk3PhEL
	mMATmli9NPX8kqKSaxnRThJY=
X-Google-Smtp-Source: AGHT+IE6fNdjuLZN8PpezUYZCjv0+nCNqLy4/cUMk8Ck5LuFvTMHEe5sGc7ej/DiBYiLC24FQ7Snbw==
X-Received: by 2002:a05:6a20:12ca:b0:24e:c235:d7ea with SMTP id adf61e73a8af0-2cffdb6b8a3mr8370045637.47.1758715221706;
        Wed, 24 Sep 2025 05:00:21 -0700 (PDT)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f335995cbsm9451657b3a.63.2025.09.24.05.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:00:21 -0700 (PDT)
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
Subject: [PATCH v5 17/23] mm/ksw: add test module
Date: Wed, 24 Sep 2025 19:59:23 +0800
Message-ID: <20250924115931.197077-2-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924115931.197077-1-wangjinchao600@gmail.com>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
 <20250924115931.197077-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a separate test module to validate functionality in controlled
scenarios.

The module provides a proc interface (/proc/kstackwatch_test) that allows
triggering specific test cases via simple commands:

  echo test0 > /proc/kstackwatch_test

Test module is built with optimizations disabled to ensure predictable
behavior.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/Kconfig.debug        |  10 ++++
 mm/kstackwatch/Makefile |   6 ++
 mm/kstackwatch/test.c   | 122 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 mm/kstackwatch/test.c

diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 89be351c0be5..291dd8a78b98 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -317,3 +317,13 @@ config KSTACK_WATCH
 	  A lightweight real-time debugging tool to detect stack corrupting.
 
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
diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
new file mode 100644
index 000000000000..1ed98931cc51
--- /dev/null
+++ b/mm/kstackwatch/test.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/delay.h>
+#include <linux/kthread.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/prandom.h>
+#include <linux/printk.h>
+#include <linux/proc_fs.h>
+#include <linux/random.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
+
+#include "kstackwatch.h"
+
+static struct proc_dir_entry *test_proc;
+
+#define BUFFER_SIZE 16
+#define MAX_DEPTH 6
+
+struct work_node {
+	ulong *ptr;
+	struct completion done;
+	struct list_head list;
+};
+
+static DECLARE_COMPLETION(work_res);
+static DEFINE_MUTEX(work_mutex);
+static LIST_HEAD(work_list);
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
+
+static ssize_t test_proc_write(struct file *file, const char __user *buffer,
+			       size_t count, loff_t *pos)
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
+static ssize_t test_proc_read(struct file *file, char __user *buffer,
+			      size_t count, loff_t *pos)
+{
+	static const char usage[] = "KStackWatch Simplified Test Module\n"
+				    "============ usage ==============\n"
+				    "Usage:\n"
+				    "echo test{i} > /proc/kstackwatch_test\n"
+				    " test0 - test watch fire\n";
+
+	return simple_read_from_buffer(buffer, count, pos, usage,
+				       strlen(usage));
+}
+
+static const struct proc_ops test_proc_ops = {
+	.proc_read = test_proc_read,
+	.proc_write = test_proc_write,
+};
+
+static int __init kstackwatch_test_init(void)
+{
+	test_proc = proc_create("kstackwatch_test", 0600, NULL, &test_proc_ops);
+	if (!test_proc) {
+		pr_err("Failed to create proc entry\n");
+		return -ENOMEM;
+	}
+	pr_info("module loaded\n");
+	return 0;
+}
+
+static void __exit kstackwatch_test_exit(void)
+{
+	if (test_proc)
+		remove_proc_entry("kstackwatch_test", NULL);
+	pr_info("module unloaded\n");
+}
+
+module_init(kstackwatch_test_init);
+module_exit(kstackwatch_test_exit);
+
+MODULE_AUTHOR("Jinchao Wang");
+MODULE_DESCRIPTION("Simple KStackWatch Test Module");
+MODULE_LICENSE("GPL");
-- 
2.43.0


Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8A72E040D
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 10:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671940; cv=none; b=twu9Cwmb9W/atGBXQUg4/qMWiCssN38ZqJyfaicdRVAOHdWAKwFaTYVTj+OtWJuQaH+lcmbF/tuu0u43RakPHq697SAL6ni+sQjvpuUulstGZ3Yau959da9Vr/Z0xmfXuggaMXXWDEHJ8YJJOJ2s0I2MMFnVccNQqv144y7i/hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671940; c=relaxed/simple;
	bh=khEOYcdk4y5BMxDzooYo/fDYw+JbjlL9xknm74JC/ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n5k0AzNiOHUMoKsAqkhr3hWzX+f1lJXzfiXAmDDlhzJGrhmsdhMZoWwVbRWS0T/fLBsDpRvHUmwEP3D4jD8zJ8JMOrich53tiPs2u8Mpo3CtwLhgGWZRSmUH9flWpuzV8MRxCFD0jrX/bj4wPO1Cyoaa++AaPycJmlMazMIiW98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBGObscE; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBGObscE"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b54b301d621so225287a12.0
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 03:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671938; x=1758276738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPBHXhel7rMyKaWRDIHRGBdLv/zGRcLPaVcgqECt6eI=;
        b=UBGObscEbKwuODsO8NpHBlyvv5rueyMnvzJEovUwxRaJdVXcVoF0+FRxDt5ypU6c0c
         VGPHDdsr0CJZDkc7fmQ7Q6y8mDGAVFLY2kJLUcu3zLKsDMlxBEQnt6ibB/1FoWw+MGv3
         Kq3Rk60b7F3haMl6a3SLUDG2OXRaUmQEhp3cWW03mYy7iXE0neghyWI84kS0RUgErPEx
         yW91y1v31tF69yCx+6rPAC6EnVsn691te2+8mF+NzbdZJeqXSk4tAcbMsTdRax8Z+mu1
         zcf164YKMulV9kC4TzD5/bGgMZfX0DWJOdIap7jrJQ6uib+G4cO1zxBiQD6YLp5gVjcH
         2s8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671938; x=1758276738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPBHXhel7rMyKaWRDIHRGBdLv/zGRcLPaVcgqECt6eI=;
        b=KVUhqfM221zduabHOqvkrbbqohK45ZTTFXGHs1Czi4Gr84ZKVhU+eUZEFQgExU35KK
         l0BYOzjEG+JO7GVRK3vHzm83sNDTwYcOXTxx/gTh67xpym07BgVmj82pWpaL3mIHSp4g
         f4imcFpI4/kXqLIV11Hin2Ta6cbOdPPpNRCeIiHl2W5KuS80X0fUyQEnoCdJeG09WT7u
         SnshuXUbN+vE+8NWaJlxahRtZF/R402JuP098MDB9IEJNseRDKQC+w1UkwCKw8elN+JU
         nD7x7d7ALzrcn60UnyFxzABa5SsVkZ+hZrcliEKLIK/MVxKC+QWuoU/iQbm6ottdQzDy
         p3QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZKjtpyrr+YiKgUpUrs/0FQZFJJemdoigLcQqjytOPLXRdFP3aB7vLnlMeiOJ/lHwI1vK5@lists.linux.dev
X-Gm-Message-State: AOJu0YyAKn6g2AZkXqcOGb2TFIxmg4OEqwoTbqqUoVYv7uDs39I5rE2W
	1yU40qR3NOFf/4S7UVSIXto0g57+Co4onxAKELbektpHeHpItRsIPqMo
X-Gm-Gg: ASbGncu9x4JFsaBOL1+YyXQEFH0AAM8cEWwNdsoqM3SBKskh198Ds3Ntx3tUzNWTsGu
	kLAOK9Cou04NhJnNgUzI8ZtNRAjrq3GH/XEM4Yui+pEv8mw2QLdQD7u9a+0zonEyUmysfpBujY7
	Z86ifh8TsCHY4yiAL1Y/kbPQNUpOHZejumxuG35q5J/DfFCGNHyvRd5wFnd8CY1OrTNUnCXhakx
	mWOVrFeUuvcoo6uIQkHqrOgTMX9ynkY6EiKOpcVaUkDj4MyRhR6O6/JGe2Vcf9A1dyuqQtTv7aC
	VrD92Yy0NqhB9by13zXGmLeYw1+gXWjAAl+bVAJRO4pLi0/y/TDqkOXLo900X4z1joAEWgUVEoS
	mctJQyRHGBZOX2l7RG7qymwHK9F6+UpZE15Q23ME=
X-Google-Smtp-Source: AGHT+IF0a8WwW7rBxRhd3Sx4BYYreRthYgFLu+D24YzR2HNtnMsrUN51Z/p+oaiQ/+b9L1Xt/Owfnw==
X-Received: by 2002:a17:902:f68b:b0:24e:7af7:111a with SMTP id d9443c01a7336-25d281077cdmr34352375ad.49.1757671937679;
        Fri, 12 Sep 2025 03:12:17 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b0219f9sm44620085ad.123.2025.09.12.03.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:12:17 -0700 (PDT)
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
Subject: [PATCH v4 04/21] mm/ksw: add build system support
Date: Fri, 12 Sep 2025 18:11:14 +0800
Message-ID: <20250912101145.465708-5-wangjinchao600@gmail.com>
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

Add Kconfig and Makefile infrastructure.

The implementation is located under mm/kstackwatch/.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/Kconfig.debug             | 11 +++++++++++
 mm/Makefile                  |  1 +
 mm/kstackwatch/Makefile      |  2 ++
 mm/kstackwatch/kernel.c      | 22 ++++++++++++++++++++++
 mm/kstackwatch/kstackwatch.h |  5 +++++
 mm/kstackwatch/stack.c       |  1 +
 mm/kstackwatch/watch.c       |  1 +
 7 files changed, 43 insertions(+)
 create mode 100644 mm/kstackwatch/Makefile
 create mode 100644 mm/kstackwatch/kernel.c
 create mode 100644 mm/kstackwatch/kstackwatch.h
 create mode 100644 mm/kstackwatch/stack.c
 create mode 100644 mm/kstackwatch/watch.c

diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 32b65073d0cc..fdfc6e6d0dec 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -309,3 +309,14 @@ config PER_VMA_LOCK_STATS
 	  overhead in the page fault path.
 
 	  If in doubt, say N.
+
+config KSTACK_WATCH
+	tristate "Kernel Stack Watch"
+	depends on HAVE_HW_BREAKPOINT && KPROBES && FPROBE
+	select HAVE_REINSTALL_HW_BREAKPOINT
+	help
+	  A lightweight real-time debugging tool to detect stack corruption.
+	  It can watch either the canary or local variable and tracks
+	  the recursive depth of the monitored function.
+
+	  If unsure, say N.
diff --git a/mm/Makefile b/mm/Makefile
index ef54aa615d9d..665c9f2bf987 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_PAGE_POISONING) += page_poison.o
 obj-$(CONFIG_KASAN)	+= kasan/
 obj-$(CONFIG_KFENCE) += kfence/
 obj-$(CONFIG_KMSAN)	+= kmsan/
+obj-$(CONFIG_KSTACK_WATCH)	+= kstackwatch/
 obj-$(CONFIG_FAILSLAB) += failslab.o
 obj-$(CONFIG_FAIL_PAGE_ALLOC) += fail_page_alloc.o
 obj-$(CONFIG_MEMTEST)		+= memtest.o
diff --git a/mm/kstackwatch/Makefile b/mm/kstackwatch/Makefile
new file mode 100644
index 000000000000..84a46cb9a766
--- /dev/null
+++ b/mm/kstackwatch/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_KSTACK_WATCH)	+= kstackwatch.o
+kstackwatch-y := kernel.o stack.o watch.o
diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
new file mode 100644
index 000000000000..40aa7e9ff513
--- /dev/null
+++ b/mm/kstackwatch/kernel.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+
+MODULE_AUTHOR("Jinchao Wang");
+MODULE_DESCRIPTION("Kernel Stack Watch");
+MODULE_LICENSE("GPL");
+
+static int __init kstackwatch_init(void)
+{
+	pr_info("module loaded\n");
+	return 0;
+}
+
+static void __exit kstackwatch_exit(void)
+{
+	pr_info("module unloaded\n");
+}
+
+module_init(kstackwatch_init);
+module_exit(kstackwatch_exit);
diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
new file mode 100644
index 000000000000..0273ef478a26
--- /dev/null
+++ b/mm/kstackwatch/kstackwatch.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _KSTACKWATCH_H
+#define _KSTACKWATCH_H
+
+#endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
new file mode 100644
index 000000000000..cec594032515
--- /dev/null
+++ b/mm/kstackwatch/stack.c
@@ -0,0 +1 @@
+// SPDX-License-Identifier: GPL-2.0
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
new file mode 100644
index 000000000000..cec594032515
--- /dev/null
+++ b/mm/kstackwatch/watch.c
@@ -0,0 +1 @@
+// SPDX-License-Identifier: GPL-2.0
-- 
2.43.0


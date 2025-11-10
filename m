Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90897309DC0
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 16:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792631; cv=none; b=g4fEaKgNMVJ3V5iPA1XhUiymMzKYbJyFyh90zXXiBkfVYfTyV/JgYd3HaEIzp/iP5emo98DdhU9sgww4shM5ueU80Z54+MMyAWj9lK6OacfNK0Fb74HlWbXicm4YD6UCXtkrV/rxHh52bwhU/yMfQdIpqG+nr5SrtjT/YQfXVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792631; c=relaxed/simple;
	bh=Ima2e4/C5WqdeZyYCnDIwbDgz9ZYOLESM4kickHutQ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PW8p0pyz/tATG7iDSOi+jTmZHkGTRLJ3Ilwxd/mpAmP6rjmdDs428E+bJ1GS24nHhHdiEFNxFB2PW6x/2rr3PmLZ6jbJjo90T4khorvqanHwVlprL/Drtk/weCRKwKIY7Iu4LMGVRNa2S91f2SJQm35Kbv3gi7Abn50lNiCyMHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lxwb6Cuw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lxwb6Cuw"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-295247a814bso41649915ad.0
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 08:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792629; x=1763397429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDpE0CvbPiS95CD/e7bDhFl1FHfdcNhWeVLe6GjR39g=;
        b=Lxwb6CuwSzrOj6hVwv4LT+aUILaV6ymWxhwLSUP1fp81evsWEPTL/iustg0l58P65I
         8cYW+3ChzQ+wKEGQaYHyAxU5dQNhqvt1qLEUr2+65Kksm5e/5NDpD16RYMfZfYH72LEz
         48Sx2iKjbwVkTXAEQ7YWm3BHIwCPxGdcDbTTPlpRsnG2AAI0K0ciepM+TUugmSzcpDO5
         TjQ/1p1+ilpnpZf5mFKeFqL2UwJ6LkB3ydqbeWCSIGi3B9qD6OjxM7z8/r97IDMyJRug
         bQ9KDQPSpdLMR9+a8AJxYUT1/DSCdHu+V3PmFVn2DUN3oAT79YukomCrW9ixh0LL0kRu
         81Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792629; x=1763397429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RDpE0CvbPiS95CD/e7bDhFl1FHfdcNhWeVLe6GjR39g=;
        b=emnsuvUYL/gM/5FmbLjJfizLHt6oXWoSUMRjuOd9z2286LAZZWJ/g23ALO5wr9P4w9
         4Bu1qXignxxrBFp3crSJPHlaDIRviIzEPm06SQAFlofA7Fq+eC9FC8LuO9H/z5WUorKm
         gbqjOEHXRX5U2hlUgpx18sFepa7rPZgoUHY8/5ITpSVFznw9TuD6GfdsAOarnzi1WeXe
         9N1kAJVR7H0KX79uoIQne1yNqVkLSn7CPg2CchZlou/EtM5yDFXBxebAYspHlJwqLW1e
         BwwRFeyrkvGOzBSXkoGN6o5K9kpzYU4iPnuI1wZERkoLnXiIfBU3H+a7KGGCytaAGDKH
         0mIA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Rhx/bkbUz1qIQJy89Aj6oA5sXwQu09IEoDJoq8U8oacHy7o9vMZVaJw80Lw+T8zAC6lK@lists.linux.dev
X-Gm-Message-State: AOJu0YzJRVIdAVr5UlwTdv4ZG+z/Ml4dvw/j4zjqJyo2zNK+CK6NguG3
	USSfXYTomaa+ImbDF6yR6lgnUWoAzNB2VS6vHWd+Zd36wh+1c5BSMnyJ
X-Gm-Gg: ASbGncsxGntqVkOkRuafq3qKMjPFT4WTQly65NZ609NQ8Q7AS8j/OhbFk3JNYyPYSpI
	6JVy4efAPZNVX2YwwPVvvRSH6yoysbdfMwOhPHXfV0uqEvbY5vsChK6oDDHW634saZzZwGgDJ/L
	PKaldV3SGCgnxojlFhdQpRXFQoClH8LB7qjhyyewFY26vHO+E5gDd4BjwBs68QUq5Q6XpthBDTk
	0mUVyAIatniLMSQHXEVbZzFQyS35o6bQ+9655rVmMSyB14DsrtPXMLdp0QLShWZmLgJmDDWaQmo
	phm9JFQYGeGbDfapYMYQb84r8F9D1mLr9wiFjQEmnD/d6waVDdgg54DoXRAekYFBuDjzk66XxzR
	cIbwYwzBaX5L6heyUTR7HAdj5Zz0yZM+DK8j3U94O8xK7ByeZptFUjMZ3o5RKoiADilZukJVXU3
	v6jxnVWiW2tojG44qJm9NRzg==
X-Google-Smtp-Source: AGHT+IHLWcFC7W3aH7MtEyBpRAAfyoGWF1TXnIybIjXPJD9gYvIPg0ozGaDjCXeoqvDbHEVRJoG18g==
X-Received: by 2002:a17:902:d481:b0:295:9b73:b15c with SMTP id d9443c01a7336-297e56f9c21mr125602655ad.42.1762792628683;
        Mon, 10 Nov 2025 08:37:08 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5ce87sm150073335ad.29.2025.11.10.08.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:37:08 -0800 (PST)
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
Subject: [PATCH v8 06/27] mm/ksw: add singleton debugfs interface
Date: Tue, 11 Nov 2025 00:36:01 +0800
Message-ID: <20251110163634.3686676-7-wangjinchao600@gmail.com>
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

Provide the debugfs config file to read or update the configuration.
Only a single process can open this file at a time, enforced using atomic
config_file_busy, to prevent concurrent access.

ksw_get_config() exposes the configuration pointer as const.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 include/linux/kstackwatch.h |   3 ++
 mm/kstackwatch/kernel.c     | 103 ++++++++++++++++++++++++++++++++++--
 2 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/include/linux/kstackwatch.h b/include/linux/kstackwatch.h
index dd00c4c8922e..ada5ac64190c 100644
--- a/include/linux/kstackwatch.h
+++ b/include/linux/kstackwatch.h
@@ -35,4 +35,7 @@ struct ksw_config {
 	char *user_input;
 };
 
+// singleton, only modified in kernel.c
+const struct ksw_config *ksw_get_config(void);
+
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
index 50104e78cf3d..87fef139f494 100644
--- a/mm/kstackwatch/kernel.c
+++ b/mm/kstackwatch/kernel.c
@@ -1,13 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/debugfs.h>
 #include <linux/kstackwatch.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/string.h>
+#include <linux/uaccess.h>
 
+static atomic_t dbgfs_config_busy = ATOMIC_INIT(0);
 static struct ksw_config *ksw_config;
+static struct dentry *dbgfs_config;
+static struct dentry *dbgfs_dir;
 
 struct param_map {
 	const char *name;       /* long name */
@@ -76,7 +81,7 @@ static int ksw_parse_param(struct ksw_config *config, const char *key,
  * - sp_offset  |so (u16) : offset from stack pointer at func_offset
  * - watch_len  |wl (u16) : watch length (1,2,4,8)
  */
-static int __maybe_unused ksw_parse_config(char *buf, struct ksw_config *config)
+static int ksw_parse_config(char *buf, struct ksw_config *config)
 {
 	char *part, *key, *val;
 	int ret;
@@ -111,18 +116,110 @@ static int __maybe_unused ksw_parse_config(char *buf, struct ksw_config *config)
 	return 0;
 }
 
+static ssize_t ksw_dbgfs_read(struct file *file, char __user *buf, size_t count,
+			      loff_t *ppos)
+{
+	return simple_read_from_buffer(buf, count, ppos, ksw_config->user_input,
+		ksw_config->user_input ? strlen(ksw_config->user_input) : 0);
+}
+
+static ssize_t ksw_dbgfs_write(struct file *file, const char __user *buffer,
+			       size_t count, loff_t *ppos)
+{
+	char input[MAX_CONFIG_STR_LEN];
+	int ret;
+
+	if (count == 0 || count >= sizeof(input))
+		return -EINVAL;
+
+	if (copy_from_user(input, buffer, count))
+		return -EFAULT;
+
+	input[count] = '\0';
+	strim(input);
+
+	if (!strlen(input)) {
+		pr_info("config cleared\n");
+		return count;
+	}
+
+	ret = ksw_parse_config(input, ksw_config);
+	if (ret) {
+		pr_err("Failed to parse config %d\n", ret);
+		return ret;
+	}
+
+	return count;
+}
+
+static int ksw_dbgfs_open(struct inode *inode, struct file *file)
+{
+	if (atomic_cmpxchg(&dbgfs_config_busy, 0, 1))
+		return -EBUSY;
+	return 0;
+}
+
+static int ksw_dbgfs_release(struct inode *inode, struct file *file)
+{
+	atomic_set(&dbgfs_config_busy, 0);
+	return 0;
+}
+
+static const struct file_operations kstackwatch_fops = {
+	.owner = THIS_MODULE,
+	.open = ksw_dbgfs_open,
+	.read = ksw_dbgfs_read,
+	.write = ksw_dbgfs_write,
+	.release = ksw_dbgfs_release,
+	.llseek = default_llseek,
+};
+
+const struct ksw_config *ksw_get_config(void)
+{
+	return ksw_config;
+}
+
 static int __init kstackwatch_init(void)
 {
+	int ret = 0;
+
 	ksw_config = kzalloc(sizeof(*ksw_config), GFP_KERNEL);
-	if (!ksw_config)
-		return -ENOMEM;
+	if (!ksw_config) {
+		ret = -ENOMEM;
+		goto err_alloc;
+	}
+
+	dbgfs_dir = debugfs_create_dir("kstackwatch", NULL);
+	if (!dbgfs_dir) {
+		ret = -ENOMEM;
+		goto err_dir;
+	}
+
+	dbgfs_config = debugfs_create_file("config", 0600, dbgfs_dir, NULL,
+				       &kstackwatch_fops);
+	if (!dbgfs_config) {
+		ret = -ENOMEM;
+		goto err_file;
+	}
 
 	pr_info("module loaded\n");
 	return 0;
+
+err_file:
+	debugfs_remove_recursive(dbgfs_dir);
+	dbgfs_dir = NULL;
+err_dir:
+	kfree(ksw_config);
+	ksw_config = NULL;
+err_alloc:
+	return ret;
 }
 
 static void __exit kstackwatch_exit(void)
 {
+	debugfs_remove_recursive(dbgfs_dir);
+	kfree(ksw_config->func_name);
+	kfree(ksw_config->user_input);
 	kfree(ksw_config);
 
 	pr_info("module unloaded\n");
-- 
2.43.0


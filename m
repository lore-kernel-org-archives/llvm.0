Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32223302CAA
	for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 11:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714722; cv=none; b=g7VMgRb5QiObbY2avUvpYXtB16ToSE64AXLIe0tgQx/HADRRO0rUwax77nk58/T6nIDUQ3RMqTn52AwBnIsIBJVd/cFm2JkuJ9SImo2H8Jot+OJnzIKfX9SvJGRckXlqdsPd3yCOIVkZ0kMk5i0VIjWVlm836xel3yH+S1RXrwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714722; c=relaxed/simple;
	bh=6SekrJfJo1dIUGCCsK37DffrryW992IXbdw6n87bUwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/xi/f+PjM5S4zo2oBvErQq/HlBDE48p1sqKoimZCd2jWf9Pr322Zx8DBYNUE351J6RDKE09msE0+rFeMM2AbShquAkPFpBIrG+TKwQjX95ypgIWt1QkeUhAhlG66hC0Wavd7EfdbqlyOCKC/cakFYVnWj/Do9izr9Kz44jQ9C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2T7B4gV; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2T7B4gV"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b54a588ad96so768773a12.1
        for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 04:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758714716; x=1759319516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chAO9GOTMxCV8ZHg6BsIF9VuSBV9TkSRS16Il152ztM=;
        b=E2T7B4gVwhtfhFzLUKJjlZLsGfn9rJVkK92w67xGFGkNBCt2EuPnpX318SKfCPfcst
         Z8txrOukec2aSiGuxxMgoUOUFLud0tGRK16dXXVPBuCTRmyp4XOqbFvmG2rqA2ldgOhS
         8ALBluyoktzlf816uKMS8WT1/QLbYrmr80PstlCiF0yLBoFgFpZD1A5w1Ed4ns3Ojxt7
         z18Z1+qFTgB9Z8QDUuLHK9JslbYaCvBCuUKV+8tSH2IFWPbqXt1RSsj2PVYnJBagtFvT
         UXJT/RGmQgHFSmN/Kftf5P4zArfjg+XuJYGiwjOfTG6myXSFWByJM4zmK0iOPKHG/VYA
         sYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714716; x=1759319516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chAO9GOTMxCV8ZHg6BsIF9VuSBV9TkSRS16Il152ztM=;
        b=rSRYnxqnpRz6PDHQiJ1Ygn8qC+UhEsNjvvYRvPtB0fY9L4MUsqI27DPd7YovaFrNDO
         dVcVxdaeTyebYUgJzlnQLpdYmia9DI6zsJfR7LrnJ1CQ2abllYSSglAcqYm4lCBNvm+X
         vURfJXnd8VdpDcmXnS/pGX+jSWapQm8zgkUwrm0hAk0BWUxjKkLWQr2L9nL1LJvtHEVn
         px1koBqQhbebL2UG9SOmOc9jY6TnHbQxhrTJrRqibPbDaiPG3uafKPXHvCYmqa9aZof7
         Vgg1svMldHg1bZP/zPkpsKS3X7MoCbJGbKVd3F8fVckcntoy0XdYF0q0u8Gx1Ovn/pI8
         VVDA==
X-Forwarded-Encrypted: i=1; AJvYcCUjVkCQ8OyFApvYCrefIJ6O8VieDhYZxeRWnvnqdIzMA1vWNV+SOzr+C3rNgfKUeq4BQ3d2@lists.linux.dev
X-Gm-Message-State: AOJu0YyG55EDxskdilvR7B1KlHyxDiLPIMQKiz1BVIuMllcFrxi5fVO2
	20/0OHo5UObP5IMwaq6pX0ZsM3RqUKmL66Q5nnYCwX5OuaM5ZR86iPDN
X-Gm-Gg: ASbGncvHqbAgQnZAznzfBkYscBDMfU20/tEiaVQVaXXBxmSxYxbpi6nYTSGk1Lr/RMP
	BmypmLQgaAb7t9y6ISw6va3W0ySrmMFiY/grCOhTbQyWvbg8rlCRAwmL21Ce4j+PGPDRbgMuv9z
	y7IAQ0FYIzJto2yt8bqq0Qua2QyiSazlQ720XJGBGPHg2ynAc7ehFRnSA/ExP7GfMdfRFGUL32D
	+rsdy9nmH+f8YvYFLwkfgGzI0xGavNDk4Ve105zALgKmwaFAGC+BPusyGFaboA73HWPjhMykEax
	3VtyPnVhIOMHsu9H/AY2FGXWNZC/ou6U0vWnXOL6eYUkeO+zAH/GgjUvS0Rhzn996eGjyVNha8i
	i8A+iU4cz2uWA7IEgx8bpI/ehjA==
X-Google-Smtp-Source: AGHT+IFFFBAirf0qABtQMOGn8HizILgeTQ+bDMYj/NiaLIThYCj5lgAdNhjPQRMYiuEyFN0bl+W06w==
X-Received: by 2002:a17:903:19ef:b0:27d:6cb6:f7c2 with SMTP id d9443c01a7336-27ec11ff7d5mr23462095ad.17.1758714716359;
        Wed, 24 Sep 2025 04:51:56 -0700 (PDT)
Received: from localhost ([23.142.224.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980179981sm188216855ad.54.2025.09.24.04.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:51:55 -0700 (PDT)
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
Subject: [PATCH v5 06/23] mm/ksw: add singleton /proc/kstackwatch interface
Date: Wed, 24 Sep 2025 19:50:49 +0800
Message-ID: <20250924115124.194940-7-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924115124.194940-1-wangjinchao600@gmail.com>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide the /proc/kstackwatch file to read or update the configuration.
Only a single process can open this file at a time, enforced using atomic
config_file_busy, to prevent concurrent access.

ksw_get_config() exposes the configuration pointer as const.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kernel.c      | 77 +++++++++++++++++++++++++++++++++++-
 mm/kstackwatch/kstackwatch.h |  3 ++
 2 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
index 3b7009033dd4..4a06ddadd9c7 100644
--- a/mm/kstackwatch/kernel.c
+++ b/mm/kstackwatch/kernel.c
@@ -3,11 +3,15 @@
 
 #include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
 #include <linux/string.h>
+#include <linux/uaccess.h>
 
 #include "kstackwatch.h"
 
 static struct ksw_config *ksw_config;
+static atomic_t config_file_busy = ATOMIC_INIT(0);
 
 struct param_map {
 	const char *name;       /* long name */
@@ -74,7 +78,7 @@ static int ksw_parse_param(struct ksw_config *config, const char *key,
  * - sp_offset  |so (u16) : offset from stack pointer at func_offset
  * - watch_len  |wl (u16) : watch length (1,2,4,8)
  */
-static int __maybe_unused ksw_parse_config(char *buf, struct ksw_config *config)
+static int ksw_parse_config(char *buf, struct ksw_config *config)
 {
 	char *part, *key, *val;
 	int ret;
@@ -109,18 +113,89 @@ static int __maybe_unused ksw_parse_config(char *buf, struct ksw_config *config)
 	return 0;
 }
 
+static ssize_t kstackwatch_proc_write(struct file *file,
+				      const char __user *buffer, size_t count,
+				      loff_t *pos)
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
+static int kstackwatch_proc_show(struct seq_file *m, void *v)
+{
+	seq_printf(m, "%s\n", ksw_config->user_input);
+	return 0;
+}
+
+static int kstackwatch_proc_open(struct inode *inode, struct file *file)
+{
+	if (atomic_cmpxchg(&config_file_busy, 0, 1))
+		return -EBUSY;
+
+	return single_open(file, kstackwatch_proc_show, NULL);
+}
+
+static int kstackwatch_proc_release(struct inode *inode, struct file *file)
+{
+	atomic_set(&config_file_busy, 0);
+	return single_release(inode, file);
+}
+
+static const struct proc_ops kstackwatch_proc_ops = {
+	.proc_open = kstackwatch_proc_open,
+	.proc_read = seq_read,
+	.proc_write = kstackwatch_proc_write,
+	.proc_lseek = seq_lseek,
+	.proc_release = kstackwatch_proc_release,
+};
+
+const struct ksw_config *ksw_get_config(void)
+{
+	return ksw_config;
+}
 static int __init kstackwatch_init(void)
 {
 	ksw_config = kzalloc(sizeof(*ksw_config), GFP_KERNEL);
 	if (!ksw_config)
 		return -ENOMEM;
 
+	if (!proc_create("kstackwatch", 0600, NULL, &kstackwatch_proc_ops)) {
+		pr_err("create proc kstackwatch fail");
+		kfree(ksw_config);
+		return -ENOMEM;
+	}
+
 	pr_info("module loaded\n");
 	return 0;
 }
 
 static void __exit kstackwatch_exit(void)
 {
+	remove_proc_entry("kstackwatch", NULL);
+	kfree(ksw_config->func_name);
+	kfree(ksw_config->user_input);
 	kfree(ksw_config);
 
 	pr_info("module unloaded\n");
diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index a7bad207f863..983125d5cf18 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -29,4 +29,7 @@ struct ksw_config {
 	char *user_input;
 };
 
+// singleton, only modified in kernel.c
+const struct ksw_config *ksw_get_config(void);
+
 #endif /* _KSTACKWATCH_H */
-- 
2.43.0


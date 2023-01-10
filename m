Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB985B422
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 22:21:05 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-4ce566db73eso73157977b3.11
        for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 14:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4sg2Aa5uCHWcDC8jm9J4EAv2OJFGtXnNHMXMT9mO4Gw=;
        b=AW29Ki0ipdxS14sshMxXhqz4FZFcNVmZ3WvoBGdx8Bla7+yjxNrYSNmR1ihsyWRsrf
         X60XFLMewiYm9IGefUm4eEzu+c8CeyIivN4qFu4JpwnYwB3jA2QMO7bOOM3Ko7g1jq8K
         C5RnWXn1KhH66oHffsmy/GqlYcVahiBR3eqjUSNwhLqIpkauqFmAyRmy+3bD+cnZC0dZ
         KFqMPnIG2GLgHMH6PYQiwuTfPPwsF8vA5I0JxA/flSZfhMIfeqXMaRE2xMVljQClk+CN
         NAwV6KvZTl/6ClD/vaGcAe7VaWC8QwAk0u7Hs7wmIUwxTE33GdGdAYSdTQfnpepXNN/1
         khRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sg2Aa5uCHWcDC8jm9J4EAv2OJFGtXnNHMXMT9mO4Gw=;
        b=e8Ch7Tt5W/AUB5m9nfW3S3mplEhcGYQVtylqp/ogOPiwb2XIB1Vf2tLC3hnhzM+uUe
         QtRAuhYtrcQiv4JQJfNk+WXx+vkRww0/y0Mj3jWA/wTVzyLPhDcfPk2ZS7seQ2inks68
         7SCIhzLnf3J+kD89Y9mEbPVmefFlq2M0QjHVjCcJNxDZKMZkup1WoX7kq5DC1dMKmATi
         6Dd+6MKwEKNfj8F0ZwXidUF/Oa38CcIBotT9hP16lrc7Z42CY33c1sVlxk3pwG95u+kK
         tE2pO5w5lHJll/QFd8uFyVHH1YLvRM1ozhOG6uDYFMmhyw6yczMvEYPrrCJrEOW/Jrg4
         cNjw==
X-Gm-Message-State: AFqh2koVy2uDh5ne85cdBsaHIaKUV+kAwmAsN7cN3fi0ZPnvb26OTtBH
	b/RbOpyQwct2ZBTYuem/sjezcvMJTE7U
X-Google-Smtp-Source: AMrXdXul//OabQOCLWyx1Luc6Hl+ueTmgO396xd2lzHTTOh6r4Z7uBXUeTt67VSekVDq2442YXd8T9SPuWGF
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:cebf:c37e:8184:56])
 (user=irogers job=sendgmr) by 2002:a25:449:0:b0:7b6:f8d5:82f4 with SMTP id
 70-20020a250449000000b007b6f8d582f4mr2181307ybe.646.1673389264926; Tue, 10
 Jan 2023 14:21:04 -0800 (PST)
Date: Tue, 10 Jan 2023 14:20:01 -0800
In-Reply-To: <20230110222003.1591436-1-irogers@google.com>
Message-Id: <20230110222003.1591436-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230110222003.1591436-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Subject: [PATCH v1 5/7] tools lib api: Tweak strbuf allocation size computation
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Christy Lee <christylee@fb.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>, Leo Yan <leo.yan@linaro.org>, 
	Yang Jihong <yangjihong1@huawei.com>, Qi Liu <liuqi115@huawei.com>, 
	James Clark <james.clark@arm.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Sean Christopherson <seanjc@google.com>, Zhengjun Xing <zhengjun.xing@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Xin Gao <gaoxin@cdjrlc.com>, 
	Zechuan Chen <chenzechuan1@huawei.com>, Jason Wang <wangborong@cdjrlc.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Stephane Eranian <eranian@google.com>, 
	German Gomez <german.gomez@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

alloc_nr gives an estimate of the actual memory behind an allocation
but isn't accurate. Use malloc_usable_size to accurately set the
strbuf alloc, which potentially avoids realloc calls.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/api/strbuf.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/lib/api/strbuf.c b/tools/lib/api/strbuf.c
index eafa2c01f46a..a3d7f96d8b9f 100644
--- a/tools/lib/api/strbuf.c
+++ b/tools/lib/api/strbuf.c
@@ -4,6 +4,7 @@
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/zalloc.h>
+#include <malloc.h>
 #include <errno.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -42,7 +43,6 @@ char *strbuf_detach(struct strbuf *sb, size_t *sz)
 	return res;
 }
 
-#define alloc_nr(x) (((x)+16)*3/2)
 int strbuf_grow(struct strbuf *sb, size_t extra)
 {
 	char *buf;
@@ -54,9 +54,6 @@ int strbuf_grow(struct strbuf *sb, size_t extra)
 	if (nr <= sb->len)
 		return -E2BIG;
 
-	if (alloc_nr(sb->alloc) > nr)
-		nr = alloc_nr(sb->alloc);
-
 	/*
 	 * Note that sb->buf == strbuf_slopbuf if sb->alloc == 0, and it is
 	 * a static variable. Thus we have to avoid passing it to realloc.
@@ -66,10 +63,9 @@ int strbuf_grow(struct strbuf *sb, size_t extra)
 		return -ENOMEM;
 
 	sb->buf = buf;
-	sb->alloc = nr;
+	sb->alloc = malloc_usable_size(buf);
 	return 0;
 }
-#undef alloc_nr
 
 int strbuf_addch(struct strbuf *sb, int c)
 {
-- 
2.39.0.314.g84b9a713c41-goog


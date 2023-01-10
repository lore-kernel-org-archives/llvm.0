Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EE9B422
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 22:20:57 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-482d3bf0266so141720587b3.3
        for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 14:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b4cDFSVYG43croOnEV27nNQKcdSJ0iRzIK+gxT25DWQ=;
        b=oWwqPFHv+dZCSeNo+f2delVO4bkS5CysJ1Fb9cTlI9zPxRA7uKaiJ7fzrQAE/gTePN
         yQdJfBq26Z53aSri1L4flICMFvFNUevMxBBdhNvHv8Ijb0Oku7b8R3i1GIZwAS7jcJ22
         jMmWxbFtkBzDL/R9uaLOc+rwZEKLhEkSnycWiK+bJoz5ZUvP8k/r3gzwpyc58iJZ/qIR
         uFv/RK4kFlujjtJHI9F8csecrHrl/8oIz/UTVfp75WDyghQbB2noKVROCgEIL9/hytzp
         05/J55rtJDAGcO6Q4BwMKuBUc0CZ06wbMj2tK5aFbb8NTedwer0JBGvwhthbuu/kH2CO
         qRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4cDFSVYG43croOnEV27nNQKcdSJ0iRzIK+gxT25DWQ=;
        b=V3caQYlEc/734xMvz51u2v35mgC7ZRr+67QxakM4YutlWlFEGddT6cd1pdznrIajqm
         vIIeu7G4T9XHpab0FECag+2wCF4X+UFOvzrXf24EouCI1shnP3xv92LuxRLsrQSaYyN3
         S6qpqKYPeXp/0m/FO9NCfk00eVfKAC41jr1xVF8Oa1T752zvcaLCCilL8BjExtuKEtP9
         BHt9FUXuG5KYlGSPslAlJ991cyI1goUybx/7hblZXsSlN3mOGTHPDeqF6fI4jS0ISI6+
         6O7ugArwN9lgocE5REvcJA4wlXwldyU7SLFcgjs1rDN+5GFJ5Px8cfdI+RZrtr/kZPvJ
         RO0g==
X-Gm-Message-State: AFqh2koD+L2bQEZNhyzba8YBvx3EcBzwyf2jo27iHA+n9BfTqE3Krakh
	CnluouCxNJ88JiFSeuqEJTL7knMzLdVu
X-Google-Smtp-Source: AMrXdXvI95ryIYv3mYiLaEW52Mjy6G2g6DQ8MwrTjJmJYfZaK+uEyVB7Y9YgTbG/z/1GFMv0iQnxIls+z2Xi
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:cebf:c37e:8184:56])
 (user=irogers job=sendgmr) by 2002:a25:9a02:0:b0:7ba:f028:b325 with SMTP id
 x2-20020a259a02000000b007baf028b325mr1547877ybn.452.1673389256480; Tue, 10
 Jan 2023 14:20:56 -0800 (PST)
Date: Tue, 10 Jan 2023 14:20:00 -0800
In-Reply-To: <20230110222003.1591436-1-irogers@google.com>
Message-Id: <20230110222003.1591436-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230110222003.1591436-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Subject: [PATCH v1 4/7] tools lib api: Minor strbuf_read improvements
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

If a read is smaller than the remaining space, don't grow the buffer
as it is likely we've reached the end of the file.  Make the grow
amounts a single page rather than just over 2 once the null terminator
is included.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/api/strbuf.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tools/lib/api/strbuf.c b/tools/lib/api/strbuf.c
index 4639b2d02e62..eafa2c01f46a 100644
--- a/tools/lib/api/strbuf.c
+++ b/tools/lib/api/strbuf.c
@@ -143,25 +143,28 @@ ssize_t strbuf_read(struct strbuf *sb, int fd, ssize_t hint)
 	size_t oldalloc = sb->alloc;
 	int ret;
 
-	ret = strbuf_grow(sb, hint ? hint : 8192);
+	ret = strbuf_grow(sb, hint ? hint : 4095);
 	if (ret)
 		return ret;
 
 	for (;;) {
-		ssize_t cnt;
+		ssize_t read_size;
+		size_t sb_remaining = sb->alloc - sb->len - 1;
 
-		cnt = read(fd, sb->buf + sb->len, sb->alloc - sb->len - 1);
-		if (cnt < 0) {
+		read_size = read(fd, sb->buf + sb->len, sb_remaining);
+		if (read_size < 0) {
 			if (oldalloc == 0)
 				strbuf_release(sb);
 			else
 				strbuf_setlen(sb, oldlen);
-			return cnt;
+			return read_size;
 		}
-		if (!cnt)
+		if (read_size == 0)
 			break;
-		sb->len += cnt;
-		ret = strbuf_grow(sb, 8192);
+		sb->len += read_size;
+		if ((size_t)read_size < sb_remaining)
+			continue;
+		ret = strbuf_grow(sb, 4095);
 		if (ret)
 			return ret;
 	}
-- 
2.39.0.314.g84b9a713c41-goog


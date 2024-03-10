Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381FA1C6AD
	for <llvm@lists.linux.dev>; Sun, 10 Mar 2024 02:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710036348; cv=none; b=BXgqpwW3ULAI5R9nZrocJuxekHfM1hr2hwdyjVqnwCfF4Nyv/dGYZ8QZAzpf0tyyeICoX9cy54wlpPeixH9Eh0djN9tFxT9CMFHrOMGnDA3rur1A0OwohI26zuR7r0QATfqL7vmpaWXvzjEoutTNChX7ngis2VVRnH5bSO4nVps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710036348; c=relaxed/simple;
	bh=6Ap0HyfNfUIjggJWxJHCU3eDXgcXlw9rod9BkywTOBU=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=jmg4SAqbLrox/rYJK4dktMM5geA3dVcvsicQSewt0wj7a/5ctTKXnBQK3mv3o+cGddxuy/4twdyFL+jgEIJR5kyBt34SWGfIzF7hM+/RiefiaP0aqjJyC0LywkO21ynKD6so8KoPcQn+0NBFRDGnCUih72xlyAiu7/yL7+iwpPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BEwUfTjS; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BEwUfTjS"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-608e4171382so45598967b3.3
        for <llvm@lists.linux.dev>; Sat, 09 Mar 2024 18:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710036344; x=1710641144; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWN/JVLNlztmw39JaEsdXVzONxn2KraPuSeDAn+uvDI=;
        b=BEwUfTjSzwgnK7T1/Zq7dRWs17M9fvQuh9c7A9DM7u9uN+58G6y41D0FpDpqoMtExW
         IWgowSRg7BtXVQXrWSagjvCKdo1NVLVJpze53/ouU1u68i82ZSTAqg+4Op7fvBlMITHo
         oKC7GZX4uBtYyJ1NImpYmzEv+2GmzL8FT9P1/3TG3tC7/ejVqiumeola0E/1MVUh/5Q5
         PP5Tfk0WHsxyNnv5xrnJDcj4YxlVxhRYGGUwpfWCi/Gzh3EhEgiU/VP89pNTCUIVG8r4
         hX+FDEG1KkbB74JYWo4dCXBKwI7Gjcgwm1qA7pIjH6Af7dMcJyNViybO8/uPLXev8sP3
         An/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710036344; x=1710641144;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LWN/JVLNlztmw39JaEsdXVzONxn2KraPuSeDAn+uvDI=;
        b=XvkW9DnK7kZyPOcoFt1NPV16B3WJgjmwglxMbAnOmp0YLIWj1C7xgo1QswTkbzSjG6
         hXvTk+qMzKR3hDxuQ5pCktOJqHoI7EraCCJ7JPB2dxxMuvxBO0c9ACnq9SCDZ89dA3xC
         EnG1fuY1EQyV61csmw6qPv1rQuBWz0G+9LL8j2VDpA4vWH1F6JK4N3WI9NPrtSMCE4nq
         IZGEB/qi2dqHR/7w7si7PQOlCn6ANmB6qG+UwJ+lMbWdNu4O19y+fcwdA/BVWNGkhLqc
         DkfjiL7f7UGmKET3gGxjHF8qZUJ+PzefJaAyA33xC5SHqngdCDGwMjHB4tAB6OtAapU+
         T4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCV1ktW+6kOuWCwRxH3qydqgWp/YMpyLtsvVWTivobRkrcU6yCMnvAQeiQH1Bk0TxbjncZ2TiF1zIvTUdqpQvhucwHvajw==
X-Gm-Message-State: AOJu0Yx9a4Xg/HdEgr9RbmNAWf2dV2qcnKpLTXfXf/n6Zu91nwKghKO8
	2CvHNhOCNh2Jxk5pR7OE6QXXHpq7Ys7m7x6RP5CvBbGFGyDhGx9dmi80UQnh4kjow94TGydV0p8
	BgsPRbQ==
X-Google-Smtp-Source: AGHT+IGdHS2QsdL4lo4wwM/5ksoTAkI5r0dtMhbFMCM7lkSFe3H0TlXafv3xzq/LQr021fLnWjD7VJ9M/wIG
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a63d:1b65:e810:3ad3])
 (user=irogers job=sendgmr) by 2002:a81:a04e:0:b0:5e6:1e40:e2e3 with SMTP id
 x75-20020a81a04e000000b005e61e40e2e3mr729292ywg.5.1710036344368; Sat, 09 Mar
 2024 18:05:44 -0800 (PST)
Date: Sat,  9 Mar 2024 18:05:00 -0800
In-Reply-To: <20240310020509.647319-1-irogers@google.com>
Message-Id: <20240310020509.647319-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240310020509.647319-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Subject: [PATCH v1 05/13] perf expr: Tidy up header guard
From: Ian Rogers <irogers@google.com>
To: Arnd Bergmann <arnd@arndb.de>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <keescook@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Liam Howlett <liam.howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
	David Laight <David.Laight@ACULAB.COM>, "Michael S. Tsirkin" <mst@redhat.com>, Shunsuke Mie <mie@igel.co.jp>, 
	Yafang Shao <laoar.shao@gmail.com>, Kui-Feng Lee <kuifeng@meta.com>, 
	James Clark <james.clark@arm.com>, Nick Forrington <nick.forrington@arm.com>, 
	Leo Yan <leo.yan@linux.dev>, German Gomez <german.gomez@arm.com>, Rob Herring <robh@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Sean Christopherson <seanjc@google.com>, 
	Anup Patel <anup@brainfault.org>, Fuad Tabba <tabba@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Peter Xu <peterx@redhat.com>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Make the header guard reflect the name of the file and add a comment
to the terminating endif.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/expr.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
index d4166b3eb654..cd53ee7989fd 100644
--- a/tools/perf/util/expr.h
+++ b/tools/perf/util/expr.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef PARSE_CTX_H
-#define PARSE_CTX_H 1
+#ifndef __PERF_EXPR_H
+#define __PERF_EXPR_H 1
 
 #include <stdbool.h>
 
@@ -59,4 +59,4 @@ double expr__get_literal(const char *literal, const struct expr_scanner_ctx *ctx
 double expr__has_event(const struct expr_parse_ctx *ctx, bool compute_ids, const char *id);
 double expr__strcmp_cpuid_str(const struct expr_parse_ctx *ctx, bool compute_ids, const char *id);
 
-#endif
+#endif /* __PERF_EXPR_H */
-- 
2.44.0.278.ge034bb2e1d-goog


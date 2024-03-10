Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E40BC150
	for <llvm@lists.linux.dev>; Sun, 10 Mar 2024 02:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710036342; cv=none; b=iwEgbXMh21iQ8RD48v2rlSv0QvVUpsx8vm4w0pScVI6jKFcx1l1rRxOjgm6Dyy7iDGfQJHx7rcwbfRlXCBeLUAu4NjjE3LreTy/yN1U5Ks9ZqkXOOhLQEQ0Uy2C8Bdz6vbUXzPHHI8gWZszLyEK9UiibeV+pZe4ZOr8TlzuhSfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710036342; c=relaxed/simple;
	bh=RGHR+QiLceocR0H7Go2J+IFsQikYIqGpUdA5u3bRq6I=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=ewEwTIGjWawV8bpfINtTvhJpi6JS3Lf7aMl/xTbsWBmQJGa774zYY+c3Gxy5WYeIEWOk8nzoL+K+bOO9vWpeVoOhZ4u1cLBBiSpPv5XrecSCmQ0ueyv/9pzseYcU6L95U2F5nxF8SFWxZ46PW5Y/pfJCAe+7H+Lgi2UGSRn8dic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qKR/5PgV; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qKR/5PgV"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60a20c33f06so4760807b3.2
        for <llvm@lists.linux.dev>; Sat, 09 Mar 2024 18:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710036339; x=1710641139; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lEogdjVExxayJMRv1u0mjZw+1C1F2zoHt9ebGCOCyUE=;
        b=qKR/5PgVfae5s6C/HC5zp0kanv3Ul6HGIE9Aadat8gwlQhHVanNXSBq7v2VogHl3Ij
         VtUATYKJhm0xTQ+wYbNippbpgVgHMJDaduDiaqD6WD6RoeAx34HSG+wuvqjcN7aJtpow
         +/3EWwHotzOv/uApKCiQ/ws6DhIZLZ5iU+C2ewk5A5w+kYnr2JwvAkS5Hd6yVBDgFilH
         nxqZTtDVdyeh63ZWPMvR53bdvg3QZwH87qTDHuYUv0EI4IrpOxF4OBrN04gX+ZY8p/tK
         v6MEa8SrXAwFsdU4oV9x67YEIrSSehhDwr7te4KRVc+pkZmRjYCIuEh8CuCnMS8+oUc3
         cDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710036339; x=1710641139;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lEogdjVExxayJMRv1u0mjZw+1C1F2zoHt9ebGCOCyUE=;
        b=ZGSz4m2aleUbvuGixBTnhoVrwDZ5Jl55UzzDVcgC1j/a2ljGGRH//J6mQCXV+sc3vw
         LwYCPOLc/YO3FBd8yS0FvgEXU1UfBKckWqO7gnJ+4YcQ19FMv+2dv6BD75L3gIZ6aHjE
         kuA65km8dhrDyrH2tiQYBS0RJscv12AbZ67RMacTBEWL8/8ABD620OF5jPI3wy0rWoWo
         +ahywh475i6fq85YDkf2jF0PTj8xZ3oReqjP/fuhCoBxITQruUoXFbHYb8bk5npWQEab
         pZ5ozClC+GAS/Iq/WlpvGYcD7da1/iHa+46zQx0pXZQrcnKnRf0KnuSfHsTpnUQBKpFK
         9YOg==
X-Forwarded-Encrypted: i=1; AJvYcCX76ytCyN4gBlL0UdUDi88pIg3UdryYezzmGkpFPwb9nkxhlmIRzJWmsmdDpaI7zJ02m2IjW4odzxKbNE1/HUWGfZvNsA==
X-Gm-Message-State: AOJu0YzgsjvGUWOnaB4y7CRshco7o9xs8ZUBY2XiqQb8J8o4zzrL+hLp
	rajn5BGT7DQo0KrBU+s/G5snx23yIOZeLx0QIm+FPECfeZT5OpwKOxSD83QNJnJ900ykNO7Iv7s
	S+/oe3g==
X-Google-Smtp-Source: AGHT+IEyM3cHgr9ZVgnZoKCZ0SYCN/4S3200GAqNBDyFBPz9iTsTIsAdJdgR5M7Dk98A1ko/gir8jVGY1z12
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a63d:1b65:e810:3ad3])
 (user=irogers job=sendgmr) by 2002:a0d:e84c:0:b0:609:d325:5826 with SMTP id
 r73-20020a0de84c000000b00609d3255826mr678752ywe.7.1710036339213; Sat, 09 Mar
 2024 18:05:39 -0800 (PST)
Date: Sat,  9 Mar 2024 18:04:58 -0800
In-Reply-To: <20240310020509.647319-1-irogers@google.com>
Message-Id: <20240310020509.647319-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240310020509.647319-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Subject: [PATCH v1 03/13] libperf xyarray: Use correct stddef.h include
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

sys/types.h may not define both NULL and size_t used in this
file. Change the dependency to the correct stddef.h one.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/perf/include/internal/xyarray.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/perf/include/internal/xyarray.h b/tools/lib/perf/include/internal/xyarray.h
index f10af3da7b21..947804fb8c85 100644
--- a/tools/lib/perf/include/internal/xyarray.h
+++ b/tools/lib/perf/include/internal/xyarray.h
@@ -3,7 +3,7 @@
 #define __LIBPERF_INTERNAL_XYARRAY_H
 
 #include <linux/compiler.h>
-#include <sys/types.h>
+#include <stddef.h>
 
 struct xyarray {
 	size_t row_size;
-- 
2.44.0.278.ge034bb2e1d-goog


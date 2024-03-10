Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F932D638
	for <llvm@lists.linux.dev>; Sun, 10 Mar 2024 02:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710036359; cv=none; b=h89ZiSbqIvUXCz0VE5HFN2PKAAHbyMlqOGe2kJL9PnV915qLliiwQqH+SCl3y10o1AOC3Z55z9NXylbhJRjjzP9uLpIVkuMFTmn/SmRPDywgl5KH9BwI9sOlNYeUKkiJn9BAmQFA6D0pVOjPkXzbJ+ttupBJ4Hcz/8H+ZMb279c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710036359; c=relaxed/simple;
	bh=ZWL6CpbSDkoHT9bHTSvzN2HvMNxtU4EmDh1g2wTW1tQ=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=o0MBg5+JCornX/0G1bJsrC3TR1HFZpkLrHd5VC7h520sPJdNNOpjhLwGWqBPGHw1QR1VhQJOS5QbDsYlJT1qDR1JuNaZizJ4qWff0KbGxatkoExj4yV0efaab3+WtiyopIVDRFG0/5e7KdQWuX8FK35woH09c0z24Z7+emaMnmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d4QtrPA2; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d4QtrPA2"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcc0bcf9256so2745801276.3
        for <llvm@lists.linux.dev>; Sat, 09 Mar 2024 18:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710036357; x=1710641157; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcbTXn+GZg98Vv/BPAp4vRUPCLHW4NXMPZPsnrVHKvg=;
        b=d4QtrPA2+rCH3qDgGOdZlCCy6oy1H0a3Pw9u8K4fPwrw7sSbqEQtDwEO4nLRutm/4R
         MIrJWWTg6ihIboWvDSztryNMnT1D+pKi55v368KQUQS6puLQBiax4avjV1ZpEBFaPq3H
         WJVIR+HDisfWkFkcjtcJHdiwnikNbyQuLSIxEAx7SN54zIGrbpKZtuNjax3b9MIXehlB
         bxj3P70C6RDCKrcyiegppwMHqK3LXIQPvmXAuftRjDIuQ9mrDj3FEHB6256o9BNI1YVu
         M06qzHoYnTHFyRwKKn0dQM5BiZfVkDj8R1t+d0LgqzRKi5gkMsIsXfN9BRXI3jRgaTs0
         vKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710036357; x=1710641157;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YcbTXn+GZg98Vv/BPAp4vRUPCLHW4NXMPZPsnrVHKvg=;
        b=DeC7atJK+63JP1YTmKOvHamcSZvKTvKRKzzp1knILF7kHdoGmAzSTpThMkJ516JsUG
         UYdFosKAF5MY3HZifIgmLay1joXn2uaUMP1RaNV5d8ho2F2VkodzzgVrE+sbqNWb5GYU
         4u/8xHyg9JeeV3bo9ZojciSmSCKZ/hwTetge80TO4NG12vzMFZzLagmDJvkBfASaNu1M
         YpLwQ83Mzpjm8wp8RfDD4snoxV46W/VY8Sfv/dXMTuwSj/VuXtDpogpm+C/0kJMIVPcd
         lBaawjMy13nZ8/jjN2YOBOI79AecYAq/rDFCNs7H/dcajHoZ+XF6Ln/ROqCAdqFCPu8w
         20jw==
X-Forwarded-Encrypted: i=1; AJvYcCXowp0g58knfsV22CJqlCKtzc0R23VJSb+Sl1aFsABhxXIX+gQlMh0FhEwf05L4NN6SEMHhdVYHOkLnMz3OtxXZRx4pVQ==
X-Gm-Message-State: AOJu0YxGD3STt9Ch9hFh6x29ABQHE20xATL+/LBlZGyjfuCubCRbpDd5
	XXXAfS99mf0mvio0tOmuuHSvD2PJz5o/hWqa+WeTc6PnMrXdMTKDUjsNX9yRIGnDZcwm97CqWkt
	xcGVWfw==
X-Google-Smtp-Source: AGHT+IFh+Pg/vPJRzp3HY0EtlqFR8c7TCYxcMdD2zR5o/IcNrp2JWb8OldTiph3/7rY2TpwrRD4D5cJe7AWq
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a63d:1b65:e810:3ad3])
 (user=irogers job=sendgmr) by 2002:a05:6902:b06:b0:dc6:b982:cfa2 with SMTP id
 ch6-20020a0569020b0600b00dc6b982cfa2mr183760ybb.8.1710036356770; Sat, 09 Mar
 2024 18:05:56 -0800 (PST)
Date: Sat,  9 Mar 2024 18:05:05 -0800
In-Reply-To: <20240310020509.647319-1-irogers@google.com>
Message-Id: <20240310020509.647319-11-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240310020509.647319-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Subject: [PATCH v1 10/13] asm-generic: Avoid transitive dependency for unaligned.h
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

unaligned.h uses types from linux/types.h such as u64, but doesn't
directly import linux/types.h. This can cause breakages when the
declarations of the types is reliant on a transitive dependency and
the dependencies change. Add the missing header file to avoid this.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/asm-generic/unaligned.h       | 2 ++
 tools/include/asm-generic/unaligned.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/asm-generic/unaligned.h b/include/asm-generic/unaligned.h
index a84c64e5f11e..0cbe118e25db 100644
--- a/include/asm-generic/unaligned.h
+++ b/include/asm-generic/unaligned.h
@@ -2,6 +2,8 @@
 #ifndef __ASM_GENERIC_UNALIGNED_H
 #define __ASM_GENERIC_UNALIGNED_H
 
+#include <linux/types.h>
+
 /*
  * This is the most generic implementation of unaligned accesses
  * and should work almost anywhere.
diff --git a/tools/include/asm-generic/unaligned.h b/tools/include/asm-generic/unaligned.h
index cdd2fd078027..768cafe6702e 100644
--- a/tools/include/asm-generic/unaligned.h
+++ b/tools/include/asm-generic/unaligned.h
@@ -2,6 +2,8 @@
 #ifndef __ASM_GENERIC_UNALIGNED_H
 #define __ASM_GENERIC_UNALIGNED_H
 
+#include <linux/types.h>
+
 /*
  * This is the most generic implementation of unaligned accesses
  * and should work almost anywhere.
-- 
2.44.0.278.ge034bb2e1d-goog


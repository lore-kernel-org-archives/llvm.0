Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82B31DDC23
	for <llvm@lists.linux.dev>; Fri,  6 Jun 2025 05:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749187437; cv=none; b=XdxvOD5LQqeMryEE0ZY4VDJVFynV/FF2CP4L0GGAc3qHw+LGsQ1XlP6Fxyv/T1xnYD3Pj0kgCSHhHFvFYtnUmIAsSdFJMrtEa+khqFB/ykOGdCTNEMDafHpAT+9/1nz71aIGhQ3/cpD1BpZWNvpMMhVShm7BH+os4lfzcQKphaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749187437; c=relaxed/simple;
	bh=0LcugX7pIJqi20ylrFfW2GJHIIOk7YhX5V657AkjHuo=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=DFu4xzyGbpOQ7GAMOZhBiIWgp/qffEcex0xE6k1BnPCS2XIdQmfrPpuLg8KWcK9Wo5dgQrAs5nSnI10mdyKVjS4V/x7yxApyWsLKRdYsuY85DyBU0CoSB0RKtr/amoXv6woK4ottqISyLFDosL6+flLCccLhJ4GlA3H8CnKsYNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uCTbpRlT; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uCTbpRlT"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-70e4269deb2so20512557b3.3
        for <llvm@lists.linux.dev>; Thu, 05 Jun 2025 22:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749187434; x=1749792234; darn=lists.linux.dev;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xPdemEaGJWvzsN6Iuk80gCcUSIvsiiSoKmwg/dFuW0k=;
        b=uCTbpRlTXSpuUVzrb8dtPOAzz/s/FSITiEuUIVjRRED1zsKlbjeO3gxKeQt7Q0VSQe
         2w08IW1RJyOs3L9+UVbPoJ32BehRv6qM56E2sAxjKJcPIWrZqL5j4ReGqHfciUbsTIKv
         /9V3ZiDpBOQjdIhr+E1IBx37DtsKelm02vjjpkyAoZsds43eLBcDYH5+G2Czd6Uqd2+g
         2+gM39LE/VW+ChLpArtn+481tmhwl1RhzkczNDQA9CO9qQk35i+UB79Vvm2FzULcM0xH
         DXLr1Vx7aMGTeHd7WYG0iHr88Ug2hMZwEKN1YpGe+qOfrQFrdgPPMSbFk0QfTAwEu7Mj
         B9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749187434; x=1749792234;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPdemEaGJWvzsN6Iuk80gCcUSIvsiiSoKmwg/dFuW0k=;
        b=jMOq5t7WDZXYJZhMfYkvrtuNMhM2TH+vSd6uOI9qU9kUHxuU20yRNqmHdDEd5+1KXC
         c65ec0PrMiaGHJshninhtyulBU6p2FIehzcRRif9KZz8hwjY7tPpfejLU4OnPDblen9a
         v4ClF8Vs9zB6KhdAiwPPf3JonuGQMyJ2x3OsJFGfrhfy7/Rkszg1V0K5kq5awpliqwmR
         d5ntclRUq7Ui8Cak3Gt5nD8Ln0tGsr21g8KYyE6E1bPZnzfj3cZZgE6KsIh+z9rQjXS3
         0mtenuHDQsZX/iFyWKHGeBwiA/xrxOL7TCMw5mbZjLU/eGyg26fPGh9tfEvQ3KXlhu1A
         K8EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXH2O40vUTUPKyRiToXMZDjFwnFrP76SYC6RePlOkFCkVZrwt6XCLnNFOXn+OMZ/mTdwee@lists.linux.dev
X-Gm-Message-State: AOJu0Yz13sutvEWsyCpbbIrWl4kAP/MhhgjF0mgDajesds2bcmfLG4Jh
	VMpTU+9kTbDnDNSsC8Yrta6FFrpGD9TRd5So9aVGsJQKssE+9+GGb7tN8GGQtfLSdH0Ge2ar8G4
	lpuOlcRV3DSNKtw==
X-Google-Smtp-Source: AGHT+IGM/2zgkKAi8l8Bv5Y3g3HKlCcWzySlnqdZP8vCaBlczO4XnsaCrkzqSdd8WqbJpXkzwLkHLILC/I6frg==
X-Received: from suleiman1.tok.corp.google.com ([2401:fa00:8f:203:b09c:3d84:6735:a65])
 (user=suleiman job=sendgmr) by 2002:a05:690c:8e0d:b0:70e:458:874a with SMTP
 id 00721157ae682-710f7533fb3mr8927b3.0.1749187433661; Thu, 05 Jun 2025
 22:23:53 -0700 (PDT)
Date: Fri,  6 Jun 2025 14:23:01 +0900
Message-Id: <20250606052301.810338-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Subject: [PATCH] tools/resolve_btfids: Fix build when cross compiling kernel
 with clang.
From: Suleiman Souhlal <suleiman@google.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ian Rogers <irogers@google.com>, 
	ssouhlal@freebsd.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Suleiman Souhlal <suleiman@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When cross compiling the kernel with clang, we need to override
CLANG_CROSS_FLAGS when preparing the step libraries for
resolve_btfids.

Prior to commit d1d096312176 ("tools: fix annoying "mkdir -p ..." logs
when building tools in parallel"), MAKEFLAGS would have been set to a
value that wouldn't set a value for CLANG_CROSS_FLAGS, hiding the
fact that we weren't properly overriding it.

Cc: stable@vger.kernel.org
Fixes: 56a2df7615fa ("tools/resolve_btfids: Compile resolve_btfids as host program")
Signed-of-by: Suleiman Souhlal <suleiman@google.com>
---
 tools/bpf/resolve_btfids/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bpf/resolve_btfids/Makefile b/tools/bpf/resolve_btfids/Makefile
index afbddea3a39c..ce1b556dfa90 100644
--- a/tools/bpf/resolve_btfids/Makefile
+++ b/tools/bpf/resolve_btfids/Makefile
@@ -17,7 +17,7 @@ endif
 
 # Overrides for the prepare step libraries.
 HOST_OVERRIDES := AR="$(HOSTAR)" CC="$(HOSTCC)" LD="$(HOSTLD)" ARCH="$(HOSTARCH)" \
-		  CROSS_COMPILE="" EXTRA_CFLAGS="$(HOSTCFLAGS)"
+		  CROSS_COMPILE="" CLANG_CROSS_FLAGS="" EXTRA_CFLAGS="$(HOSTCFLAGS)"
 
 RM      ?= rm
 HOSTCC  ?= gcc
-- 
2.50.0.rc0.642.g800a2b2222-goog


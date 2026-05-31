Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C1E1891A9
	for <llvm@lists.linux.dev>; Sun, 31 May 2026 01:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780189679; cv=none; b=fusoYPaGQ5U1G510Qt5TRHKcWMfI6wzFVKiPLIb6iHY3IONHKdIoWHQ0W0FwYQ5XhcRXmNidiIeSFCnqBZTfGdqTvkG+Ot0MW9glEYU6+c7l1bX2ZRunx4TsE2XnJOvTxCzX0QRIg9nbyAAT0wGSwfIMKIsaCc3brPF0FOKOskQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780189679; c=relaxed/simple;
	bh=l/IOAmzqAWxn3px4qTqpAPWLw3OXzvVmnFcKE59vi9U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Wrn8OO5vxgnVW3WFUmKyEGXxlyqfqtTBDxHdRMHYjpAEsXaL4RtFMo0Qnok12xUvrKtzZp85vJJpeSttfmyu4e/iL86Nebzk3pacfme+XGQyOTc7B3V2hwQHuOw/d+JZWcVkDnoxQVfXdZqTqgMEaagipGZqNabJvMFUnZUMd4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NBzxz68T; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NBzxz68T"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-304ee7d1368so1686391eec.0
        for <llvm@lists.linux.dev>; Sat, 30 May 2026 18:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780189675; x=1780794475; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7kr1agsQxN7R+ckqIUhhb0WeLzMOoxPB09KTg0cF36Y=;
        b=NBzxz68TICKIDxWPQEPw4FozlPD5PskEI+1R2YtwtXoEJ4QM/Gyy7RObbURZQvTFoP
         qSkpU/qAORj8CebvwvYC7vbO/M7w82GMw4O2UfNI8UlBn+xDZmV+VR4qyAtoAF5umJTh
         670ESwo2pEKruo2/Z8ZpfZ60E2nVjN6/KiD+HmOEi+Dw/rzNxLG5nko97BhxPTIorGC2
         utDWCGlO3G1lzkjQdR5jZCSUEo2ztH0N4UgwB46uPzzMsoHUeVXl/s1Ktay/347ofs+K
         HrfbdpwmjLFcrJkkVk67AKlEKAP7EdZf5/zA/ZSLycVn3CvOLz6wumF3Sgu4ltlFB99x
         lsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780189675; x=1780794475;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7kr1agsQxN7R+ckqIUhhb0WeLzMOoxPB09KTg0cF36Y=;
        b=AwSrjeRP43/pW6CZxgYFROnsQqUGqSJJyZtU30viG8sqdXaP8V4u3CBVD1LFBM9pWC
         osb0hKnR524g2PTfzt/HKW5oH733LL8AtN/3XtgsSTS/OwwMS2qH9tW/1NUjsWAKxFqj
         j6e2d7FkeMTZ8J/rGWgo4+XBcbREmdWWhmze/TFeb0LIVcBNopYrsLNkoRqit6XMj5Is
         qfSL73v0HAPJXzpjTAzEXOIgWaFgRBusIOldadTOXxWggGg391PwHRbJVReuhc3w2ZzN
         0FogMvQrfNPod2Ukp/VIiJNg5mT+yzffo7L8Xt9z0Jvs3so3Oc8ZrbFE3g6fcXsvh0m/
         t2Rw==
X-Forwarded-Encrypted: i=1; AFNElJ/GEljsUMGjLjPIbomo6k+bBp0eEJkTTsOjfuxLusS4KQH59AANTnOhzTyVLxJf1hcTm6Rr@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbkt4BRjB/HA7ZecSb3Q+LcwaVNax+M9xmxF2Y6kEF3Ys1g7jz
	qZzzNU/ySvaFy0MN6ChsgNYqCFOwR4Tav1+7KzmDIV6Q01CuPstYCFUsoMuA30EJ9UwVohAtVWA
	OwQkHD1oKYg==
X-Received: from dybmi48.prod.google.com ([2002:a05:7301:fb0:b0:304:d272:2198])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:578e:b0:2e2:4979:eb5
 with SMTP id 5a478bee46e88-304fa4d7a78mr2732026eec.10.1780189674615; Sat, 30
 May 2026 18:07:54 -0700 (PDT)
Date: Sat, 30 May 2026 18:07:50 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260531010750.525160-1-irogers@google.com>
Subject: [PATCH v1] bpftool build: Restrict feature tests during bootstrap compilation
From: Ian Rogers <irogers@google.com>
To: Quentin Monnet <qmo@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	James Clark <james.clark@linaro.org>
Content-Type: text/plain; charset="UTF-8"

When the perf build executes 'make -C ../bpf/bpftool bootstrap', bpftool's
Makefile unconditionally evaluated feature checks for llvm, libcap, libbfd,
and disassembler libraries because the bootstrap target was not exempted.

Since the bootstrap bpftool strictly compiles minimal AST parsing and C
code generation logic without linking LLVM or disassembler libraries, these
feature check sub-makes are completely redundant.

Exempt the bootstrap target from non-essential feature tests to eliminate
unneeded sub-make fork overhead during Kbuild startup.

Tested-by: James Clark <james.clark@linaro.org>
Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
This patch originally appeared in the now merged perf patch series:
https://lore.kernel.org/linux-perf-users/20260514163409.927816-1-irogers@google.com/
---
 tools/bpf/bpftool/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
index 0febf60e1b64..8f50bc163bb2 100644
--- a/tools/bpf/bpftool/Makefile
+++ b/tools/bpf/bpftool/Makefile
@@ -106,6 +106,10 @@ ifneq ($(SKIP_CRYPTO),1)
   CRYPTO_LIBS := -lcrypto
 endif
 
+ifeq ($(MAKECMDGOALS),bootstrap)
+FEATURE_TESTS := libelf-zstd
+FEATURE_DISPLAY :=
+else
 FEATURE_TESTS := clang-bpf-co-re
 FEATURE_TESTS += llvm
 FEATURE_TESTS += libcap
@@ -122,6 +126,7 @@ FEATURE_DISPLAY += libcap
 FEATURE_DISPLAY += libbfd
 FEATURE_DISPLAY += libbfd-liberty
 FEATURE_DISPLAY += libbfd-liberty-z
+endif
 
 check_feat := 1
 NON_CHECK_FEAT_TARGETS := clean uninstall doc doc-clean doc-install doc-uninstall
-- 
2.54.0.823.g6e5bcc1fc9-goog


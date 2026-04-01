Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2886478E27
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 16:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060140; cv=none; b=bfhQp9nNBqZb9xVev77YQE6tgro9izB5B6rkRB9DHJHZ6+LN/utz10xKP3c4bJBr7YSqCbFZOlS2xMHemViBFKMYEjKnJp9XQuyoni3DuMC1gqBNrmFgRFI07Jm1wVQDwc1W7MBWxaXRrbbJOHUr1kafAZT/B0fdIwK1ebo7b9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060140; c=relaxed/simple;
	bh=b7nfNBNqrJ18hpBVF8kDcZraYDe06fSNKUQ5ann5t60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnElDwCU+TuDV+awPrBlMfPJ0EAlRD16YwdScGBIRmKOXQuQjdPqRn8EOjCw0zm9c6ovkxSjc9+lRNnewftaQuRT2fMzv7QcXyacMGy713ematNek6jVDOPQ5r4UwhsOaGfumdbnB4Llj+2OPnXE2Xnd9VAhI3MzELkb1uOSDnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Wb3zq9/I; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Wb3zq9/I"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486507134e4so80063445e9.0
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060137; x=1775664937; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43fw3GZqDOKnOXUmd4UFVcfR/ZtOCVdeWF0aKs+p6eI=;
        b=Wb3zq9/IztIIXcRJtAaC59r1qxWDAIMXeAgT3lif3vP+ucEG+IdO+KD4LsONbsjTvt
         xIe/5FuxATE9ayHwa7EXtLT7t/6yjEs/DmK/RA09i4pDGgOode5tBb3Skjv6PaMyAL+X
         B3Lp5Fl8rprbTJRmm6pZDfwZqhFZpG6a1gC02yGR5Fy5XUA7toLKHE3K2gihDvPS1Xac
         Ixgw2l+2Xos8Jy0vNZmPb/acPobD82C4k0oQwen6C42Y/RFDEKzAq4RHwVM1r8VlwMf7
         udGvUAZOIRqklT3gVGDfTN+U7nMaBTh+aF9ze7rpQ+0VyT+G0EIYH0RuS5RN8xGDUboo
         PpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060137; x=1775664937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=43fw3GZqDOKnOXUmd4UFVcfR/ZtOCVdeWF0aKs+p6eI=;
        b=q9BtFxtufDcEgtjY6LmTqcaCGefO+tCtvijnI5s36Q4JALNj5H+B9aanYHBSMMCoY5
         vX8JK7wxruBPEqzKEweYQnCciXAMh+iMwqJa7xYWF5tmiz4dbQPtvrz2q+FcdZniEb0v
         0m/ACylZBEXKYRAro1M77D+FB5hgAd7EqG/fy8l+pDfMf0KvC14a5J0Mx3/oiHqUx3Hy
         z3263W33saNOWvCCekhaJpuRzFCAPNYlzLRAVhVeiXzxJWixN1KzHSd59Q41bcLTvU9o
         xNQc1odpJLbgEcEJivd0cDBmcb8RkedLSWcBlmZNNbRKB5OMcNcxcOjJ0TYx7f8qZuXt
         3cXg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ7OjYJKr2zrcI98t6BRAGfpdTSU//Rsj9aSdtCPhJzZU1h5Ka5cy/CySCbz5aLO2ndjfr@lists.linux.dev
X-Gm-Message-State: AOJu0YymLMFKy7d15qq8s9rHJls5V91wu/uXYVWlBQLHmQrg6r02yG/t
	J0O9MdCTv8lxswHvtVx63SuPfPw8iUJTw4AM3kweit3VAFF9JYIg10VlJBpzOmMVRJs=
X-Gm-Gg: ATEYQzy/XBZzJ04/+3Khrb6eX+9qCslA3t7ETDr6x4jhfbe5XRIBNk0rXlpKzkLFByR
	5whHZ/WHsOvjkC5ZjObrd5aJVkWHzmpYTCamHzYDZyHXqbgNRIUYCn0wJDiZum9Z8nzGziTv5No
	ZntK3Zc0xVq08h/PYYyqgzJIMCc0esoNkhGzNU+sPMgxGG8bzt6+GAcIINwECJhLBcvjQYZKHEZ
	mVVQXlhyZl/7B/ISRJU1cqcwNzzndbN3q8K6xKTPxg5QZmEUcyQlyqZSH6zSveBbYZ7KWuUNCnG
	bqH36Z+aTJ4ULKoCpDvFgASvyRas/281APtYRQRDpRLt4Cw28bgnOIsZCHmEHUOsPOiQliiVWJA
	yw3NzkZziovkEyZ9Zw2KzGDZ91K/KkRYNJu/byx7LON14uPIxakzKSGUZBGJX1SBSMmgaJ+G6x8
	GMLqmgVUeQhJxZ0a1PxKA=
X-Received: by 2002:a05:600c:c04a:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-488835b2f54mr51986225e9.20.1775060137100;
        Wed, 01 Apr 2026 09:15:37 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bae1117sm24428e0c.7.2026.04.01.09.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:35 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:08 -0300
Subject: [PATCH 01/10] selftests/bpf: Fall back to distro build directory
 for test_kmods
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-1-3ae42c0af76f@suse.com>
References: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
In-Reply-To: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1367;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=b7nfNBNqrJ18hpBVF8kDcZraYDe06fSNKUQ5ann5t60=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP1x9/R4Np8q6Hmj5+a7NPsgZG1tjGdEaP0IIitotMPUkrM1doOEZwf9ghhp0N/RnJj1MBl3Yiu
 4mK0CQ5TIXAc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When building against a distribution kernel there is no in-tree build
directory. Detect this by checking for .config in the source tree root and
fall back to /lib/modules/$(uname -r)/build, which is the standard location
for distribution kernel module build directories.

An explicit O= value still takes highest precedence.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_kmods/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
index 63c4d3f6a12f..8babf9b98684 100644
--- a/tools/testing/selftests/bpf/test_kmods/Makefile
+++ b/tools/testing/selftests/bpf/test_kmods/Makefile
@@ -1,5 +1,9 @@
 TEST_KMOD_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
-KDIR ?= $(abspath $(TEST_KMOD_DIR)/../../../../..)
+SRCTREE_KDIR := $(abspath $(TEST_KMOD_DIR)/../../../../..)
+# Prefer an explicit O= build output directory if specified. Otherwise use the
+# in-tree kernel build when it has been configured, and fall back to the
+# running kernel's module build directory for distribution kernel builds.
+KDIR ?= $(if $(O),$(O),$(if $(wildcard $(SRCTREE_KDIR)/.config),$(SRCTREE_KDIR),/lib/modules/$(shell uname -r)/build))
 
 ifeq ($(V),1)
 Q =

-- 
2.53.0


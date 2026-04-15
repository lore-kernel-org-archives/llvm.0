Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1702438C430
	for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 20:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286776; cv=none; b=guI+hbaW7j7V3ZAea4+QcNxngxcRYPv41LGDC+PBeoHNtalQPzASp8QvDQfaY8QgFvkpLD4377p7tUgYSxfP3YhKh1qbaqW6utSIiOGa6m0gr/fFJDBBOFWZFnn+pV7E9TLZKS9aSk23Rmd3bsLqxA9zDnmuIiWt2OS65jIMGiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286776; c=relaxed/simple;
	bh=r4Eeeqlnty5JWhyFFs4PmBr0ldtcOWrItly6lcvC8Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EV5DVBfbkhfo08tcPC9yWUGbqAupuZryV6I9NEEb1Q660tgF2WyogRSOZmGueD5Hf4PZ2GnjCYRLI/RBbieHOLbwi345P/+Kfr2S25uGdt1mOTOjzv2jYwC1xefy+mMj0aO8iPJzwE9xbrLT4EmOmAW/PyLW2K49yF78m/QCa3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KHO+Dfn1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KHO+Dfn1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4888375f735so72231415e9.3
        for <llvm@lists.linux.dev>; Wed, 15 Apr 2026 13:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286773; x=1776891573; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg2etNAfQKZBd7rcNCY3p33XRFv6QLBK/6YkWrjaoRM=;
        b=KHO+Dfn1DNJz5F4JDoJgz9JjGC+koUohHJlRfdQqw4UgIP/kulAj9IGpRtucR5oLKR
         ncW16I74lSeb1XYi+8fkTyNCVIAtQIE58JxYvG5nDiqT2mVZpsiASjIyoU/MfHWJ+xT3
         WAWtbW0GTGmfCR9LwoXYIk19bH/ghwon3hg8nNplpMc+avy9TyBtnHusDYdW7Qd4cGON
         il5ERZ+X8JMUoeP3COrcutf0wMJT1CXnZQy+o1ERYa/OSN09NVIc2tzLae2el/cmzzkN
         Fu5jk+fjoWo+ogvcDy2QMSwH97ZdKtldTeVM+sDg0SDpPvTOKQ78YsPz7obJkxeaQHA5
         aNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286773; x=1776891573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sg2etNAfQKZBd7rcNCY3p33XRFv6QLBK/6YkWrjaoRM=;
        b=iXr//OGDydDY4kcYu52YAbSN9x58oN3YrHxG7bp9aVOyFP+gwInmHV2ALwrd+uRs7t
         GrdKKY3H7PfAGN0dYb6zgTJwoVZre8ZjcM81N8cNt6Vjuex+mfhsmxxrWskLKhfDTCL2
         sxEyfr7BR2xAGKq9ThK8kfZlYOzw05+T0BWJmJtMkJEDauObDnbkaMPO9NwcBBpjnGhL
         lDoFByP7kOCv4mGm0yaejdXnE+AvLYbayC4rgHeY5ILO1GwVZSmhBoyFOKXeyoJrhxE/
         e56exIrgRpyoGVr1nyFZlY5ZBK3KMncZkTxuTmj8Igi95QLPUAnA17W1nUpJqy4KFQuM
         Fxtg==
X-Forwarded-Encrypted: i=1; AFNElJ87MsQglvVm4AEUkYCoUua2XGy/IlMaXm1j0xGWj+lJPg8ClNVTVoIyfjHCM/Qi8ALxHGDL@lists.linux.dev
X-Gm-Message-State: AOJu0YzDJVRJwJqlbdqQZEpMt3s0kdNEZ240r34OR31KGhel/nPrc5np
	O1xKIzeDCpGTv4ES/cOaB+MlkY9Le4MY322Ons1vTQyuGgqg0nqbMiN8j6D3+Gr6mgA=
X-Gm-Gg: AeBDies1MWv/R3WGflj8/fDS9EBI8ROjuCHOZKBii40Okkfg1E7BkmDqEJE9sn21ub4
	hqLkZyPeELCIfI6/HFPeXrhML41r3RZDvZGACdfH7JtK2UlLVlslLRAbUIwPiybNalWEOWrQlkH
	7jEC6f8puj9Gx/zuQAkZ566aL5sr11PAduDKB1Lk+UWtpBAnU/l0WSp+nY7F/ogETORDA+3a05G
	18wl5vdMOASAjVZC3O3zE3PAlqD1tlhd02PERojtkR2C/+1TiS3LxWggQ3yb+OMmtUCuiYx6gXM
	5NbIlbMTDNdTZyMC9+96hNmwYtaIVGeCekx39vHTXzNXHzb1xNZbz86KntCfXlOUw3TMvtblqWB
	WQ2/70lCAaPR8r5vPaiLUbM3mqT1pp/ggoE0qiD8Vm0lgQI4vHZt2PxJ8O5Ed2pVz9rAfwlf7By
	tZcjdO7bc3U2s=
X-Received: by 2002:a05:600c:4e48:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-488d6858368mr328090195e9.20.1776286773498;
        Wed, 15 Apr 2026 13:59:33 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c606925sm5430460eec.12.2026.04.15.13.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:59:32 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:19 -0300
Subject: [PATCH bpf-next v5 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-1-03d0a52a898a@suse.com>
References: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
In-Reply-To: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
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
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286764; l=1377;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=r4Eeeqlnty5JWhyFFs4PmBr0ldtcOWrItly6lcvC8Ts=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFYAv4WgAhzm3x9f07EKaYC1RXISsv6qSmiucrI5tHvTzF/Rk1cy8FTrC/AbeumqsIE8ElCxr0k
 76aamKQT2lgM=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Add BPF_STRICT_BUILD (default 1) to control whether BPF compilation
failures are fatal. When set to 0, failures are tolerated and skipped
objects are reported, as implemented by subsequent patches in this
series. When set to 1 (the default), the build fails on any error,
preserving the existing behavior for CI and direct builds.

Users can opt in to permissive mode on the command line:

  make -C tools/testing/selftests \
       TARGETS=bpf SKIP_TARGETS= BPF_STRICT_BUILD=0

Suggested-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 78e60040811e..c8ba8ccc2c6d 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -44,6 +44,12 @@ SKIP_LLVM	?=
 SKIP_LIBBFD	?=
 SKIP_CRYPTO	?=
 
+# When BPF_STRICT_BUILD is 1, any BPF object, skeleton, test object, or
+# benchmark compilation failure is fatal. Set to 0 to tolerate failures
+# and continue building the remaining tests.
+BPF_STRICT_BUILD ?= 1
+PERMISSIVE := $(filter 0,$(BPF_STRICT_BUILD))
+
 ifeq ($(srctree),)
 srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))

-- 
2.53.0


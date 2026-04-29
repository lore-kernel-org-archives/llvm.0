Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DBA352921
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473248; cv=none; b=K5Px3BuyAA0Kfw2sPnYzXwziCvEaN3TvduYi0HAk6Mb83wCRu3ULfNSB8ykG4olVJV9rBqAMen6tgHzeBlRhs/v/Ytx0lKBTvOFn1DHq2isBTf4PhDhdxuGEE3v203N/UbxYYjf6nIe8VV18mTRRsaSKbYAnmDSUP20ULFGsV0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473248; c=relaxed/simple;
	bh=/jGlD16wwf+LKViAk9+60yGEYsvt20pYf1s5W49VBcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IMr9yxmvICCYyVceuruAupxpdMLGu+Z5mqjHPb58iTI0PfO7nsXxc0iKLSv61tvnPzEvgBdYyjySCjBM7Sy9sJkG+Ba2/rMIOPA2jotLwEBFEJDHJ4Ka2V6awdeG5CFXsscseiuscGdCSa6n4gEN3Bpx+1USmta4l1MgteMeyuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PBZQtX6V; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PBZQtX6V"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso65967585e9.3
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473244; x=1778078044; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+aXTQmh1BdIEplotgCd37rKzWea3sfpPCHgEBxHTL4=;
        b=PBZQtX6VoYlHdWRMS518GwBrX8fE56aqBY3GFmqF9DbybwoEYQQFEfbdgL/IdKhmcD
         XSmRq70zuUWEXyhciQ2yonHvdoqP35sg9haL+qgwr1+g7oqCXy5gQmwYGjh38pPvoi3J
         qi+TDy/sLSQoTyJfGNZ9th3S3eIDYxR+Y58fZSNzE+U521cU6TghHkZ4AtQSyQmfPsIN
         /877cRVtZQ2c2nzjxV19fHdGdh/+2a6Q1aBSa4NJBsHJmmMXs0L5tdvOIw0uGE0GKzHp
         Y5v9IunFtpBcXEUO+vlf/gXuZVyIu24XOSgIqD25sCP+oRGYptI6903oTb0MUC/EswqY
         CGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473244; x=1778078044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+aXTQmh1BdIEplotgCd37rKzWea3sfpPCHgEBxHTL4=;
        b=kYaZzMnvHHKG2PicBAtRF/vgWSGpdBud73ClGHPrV2uYz1z51g0g6JWLQzj6hNl82V
         pleLhsl4gsGsfSNEYcVsf4a68BezWTajYb5RDTp679sNNNuykWtEGWZYx3aQKU28pm3m
         R4NFUPU1/euhm/sa9Zz+VcHqGYV6/I2Wcz4Bg2FcrcPyFtEwFFtuILB5jgNtw6C1VDpe
         XCZ6W10cbG/Zq864CaYFPJ8DIeTenIaBTEAmWbVUVjbw77YJICtDY+BeBK7fskQLDRj3
         UOLkGPNnhVAWGmaKEunheg7e3diIO6wTgfgAP6JVF4X3AMSuz8PEmCfkoKNsLx3hFMqH
         DMVg==
X-Forwarded-Encrypted: i=1; AFNElJ+vx+ApECwStj2Otuux9XcU141h5hXsLW6jp+HHWn3jumc54C+/PrI/5bdl9NPFKO/wiQw9@lists.linux.dev
X-Gm-Message-State: AOJu0YxBKADcb4ZdJBiUbs2DAe8fO322qw8u8Uv+67HLa7AJVSrX8uMU
	+xJcLkIKpldr53EmBHn8NmmNlKNRuWyU7MMgfkO0ORbItcQRWJvRql+DEHmc1QuSArM=
X-Gm-Gg: AeBDiesNYRzfLhKQW0Jr+hOFKJo+I7EwhW19cWO+anz39ljz9Y05k9V+dFlIEtaOX25
	HFg3UF0POonktcA2K8hR3L32w0Itgbzez/FVtq8xNaFpU0AXVJY4IigmgUBMGhN2KizYHg3s6vu
	uohljm9YWAS1F2lh+x6sFhyVjbUaML9WkQ2lZyis6Kde5FLHIEipHtrgag6DKLqiBNGGGh0zZkz
	+etTaolTF+rpUnb61Ear2eLqZb9q9ATwoyz3kJzz4/cXqCeRiQMoBdO5g9wEjjH7sWfH9MdidS9
	RErcQFIRzh8esLtd50AAkwZZ6SPH1tRjrG6/tm68v6UC6rPIhZcWCiuQDLCnpWMfsgP49cYVO65
	j6liAAzJyjZoYbOAYNBE6PgLlHS75rU3l9A15SgKwmtcB8njsjD69A49CO5hgDZp4Z2OzXmNB8i
	DY6+4rpwe5Jl5MyskKhrL166tI
X-Received: by 2002:a05:600c:4e47:b0:48a:5574:3a5d with SMTP id 5b1f17b1804b1-48a7b51afc3mr73608905e9.7.1777473244392;
        Wed, 29 Apr 2026 07:34:04 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6dfa5b4sm1169873e0c.16.2026.04.29.07.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:34:03 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 29 Apr 2026 11:33:43 -0300
Subject: [PATCH bpf-next v9 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-selftests-bpf_misconfig-v9-1-c311f06b4791@suse.com>
References: <20260429-selftests-bpf_misconfig-v9-0-c311f06b4791@suse.com>
In-Reply-To: <20260429-selftests-bpf_misconfig-v9-0-c311f06b4791@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777473237; l=1573;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=/jGlD16wwf+LKViAk9+60yGEYsvt20pYf1s5W49VBcc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEGDVsC8EGeTXG071G4XgQef138ami7i7vTJ1mqjJaT6WCeOJy5D2FjPUcqICYhbPBNduoybfNX
 mgv+KrqPWOA4=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Distro kernels often lack BTF types or kernel features required by some BPF
selftests, causing the build to abort on the first failure and preventing
the remaining tests from running.

Add BPF_STRICT_BUILD (default 1) to control build failure tolerance. When
set to 0, the PERMISSIVE make variable is assigned a non-empty value that
subsequent Makefile rules use to make individual build steps non-fatal.
When set to 1 (the default), the build fails on any error, preserving the
existing behavior for CI and direct builds.

Users can opt in to permissive mode on the command line:

  make -C tools/testing/selftests \
       TARGETS=bpf SKIP_TARGETS= BPF_STRICT_BUILD=0

Suggested-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 97ee61f2ade5..6094fe99b5f6 100644
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
2.54.0


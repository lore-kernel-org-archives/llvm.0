Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02797390234
	for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 23:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419924; cv=none; b=KsA2MfBtVbt8B6EBtqjcFpXiDWo7oRypbgdc7wqS5pAmVHfAnC9uRvoUevY8RNdb9/mejVX3AmZMSMzvqaR+kNtcc5x1qyQ8LLBvvVV7T6nXEAP9p/fssyMtCeRZ6eMzYcxBsV1E0rOoYklk/rOqHhSEsmyuoKL5xsA+tgo2WhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419924; c=relaxed/simple;
	bh=/jGlD16wwf+LKViAk9+60yGEYsvt20pYf1s5W49VBcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3Jp4qwQyBbJ9ipCfa0uiO5K4CCg9Lxy92srOq3ys8KnBnnhF7144YThNl0kBSLPFP12ueOLVfc2jigXTotABtdlaB0iUS6Mwzh+W959VnJC7ROaEfmV8zxO7tIkexSdij15bm/Bs4uRtidmSMFu+JIliKE6E0cevGbyuSqfdI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dGoOWKyM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dGoOWKyM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso133221405e9.1
        for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 16:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419921; x=1778024721; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+aXTQmh1BdIEplotgCd37rKzWea3sfpPCHgEBxHTL4=;
        b=dGoOWKyMUX5Ssu7eQa2bs/0vPSy2DBzL56uJAFQz8pfSGMD2Nq9IO1m0WI3zIXGlfZ
         Or2iIIN0St9r+1VFqBEmS7znBenIhVVDiHgrajqmYafq97+q3aZahdtcvF3x2gv1IQ/H
         1MhqM2QsuWa2zAbcpjJnB3craQcie8IcXHISNsTvr8ppVyOm3QTdpyVky7Z5psnoURh2
         zs02Y6tXOTlX5lx9gt8v8b2RdqmWI16xefrza8yjWnzQA3hAZAvYRwhYCjq36OVuCeTp
         SJ9EkA7Jdsh7g4pWgJzuwaocyqzNh8u3keMzS4ySTypwXxg4jfBmthvFCy3P0IYlNFp8
         NfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419921; x=1778024721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+aXTQmh1BdIEplotgCd37rKzWea3sfpPCHgEBxHTL4=;
        b=S2YNFGkEJbrAG3gIN3wJbQK1vq4R3BBvB/tRvVDUVBp7+KR7gU0MQFJPrcxcvOPRz0
         AG6hby5giriF3JUHiYL0c9lpHodSznHGBzUlVSGqizazo6M9ldWnabhg5nXaucPULo2h
         1y61Gxe0r0WCQA/kcnXOj1IBdgLrblT0r16OJVZCfbyZnq1kxLTBstbzrLV+hPo4o8lN
         8HiH5LXsUjRviqk5nUF9u7JSIc8qqjga/mpPbc7BIjTYJ+jTWTUPlw5caJlRvQG7zWew
         roEWGXlSBASPy9x1lPE+lhQ2/qKU7a7GYkdUqxmismqrEbtlJDJPHtMa3jfOpNEY1t2k
         uuSw==
X-Forwarded-Encrypted: i=1; AFNElJ+UuJACKlWEKRrMKDeROhP9W53AX0/9x2c7oLhXGFiGTJGMB9oJR+x0jM0woWgola9Yh+f2@lists.linux.dev
X-Gm-Message-State: AOJu0YwAMi06/4zARMVMYwQKsGHO3X7gbufFiityFaU/HzZkJGnR+2xt
	Agsnv8jt7eTPjHD8if1z97jhGf6yPDvzmEoSdzXT6GHAWv8DZxplY+XfiJ91BrNdZKc=
X-Gm-Gg: AeBDievGsWYRTK8C7jFqSdu7Wm/5GEr3sSE7xrxFpOOFGgvGFfmr7U8rUbnVA94gjcd
	vZ0CnptebpBA4qGEePzA4rb8Q1gLgNdkSDUmqesiT7K+ryRUtAVahHnM+nUvMkGpxwudz6ABhOc
	wllPoqrclHR3dpaKTvFd/8IflPvSTV321yj/Pes885+RMgdCVdRrJ20dquAPLb65mdnvibQjdbR
	BUxJ+gwYNITDrl7khRFymn6/9YsxisyvTCMR+KmWzRcmQBhBSBUmqLwqKtgwd9Aya03S8Ebsviw
	gsHrt2H5CKx2dPmIFG8RVAAgM7wOBRsKJnm67JlWlNSaGEGB1H+lllIGY1OXqkV4ezQfYEtb7cZ
	ErYlhO7+9P3/Xm6ZYR5fp7DVbtV8Mh+3w/6jS5hO3csfz7A4mSC4wwwnimY8qUYnviMVBB/y7sh
	+hUHDdVoS2YNIGfqEPcXQn8QVe
X-Received: by 2002:a05:600c:3411:b0:489:1ff5:edda with SMTP id 5b1f17b1804b1-48a7b83efe0mr13303665e9.6.1777419921476;
        Tue, 28 Apr 2026 16:45:21 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6b7d1f5sm223312e0c.3.2026.04.28.16.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:45:20 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:02 -0300
Subject: [PATCH bpf-next v8 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-1-bf02cf97dbcb@suse.com>
References: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
In-Reply-To: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=1573;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=/jGlD16wwf+LKViAk9+60yGEYsvt20pYf1s5W49VBcc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOUqofUorymPrniGUFcpYDh+n1AzuQbx8/XteyEdSb9PLdBuMBvuuQOl1gRUMnkqlmHx/7pLMyS
 mend0pXhQvwE=
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


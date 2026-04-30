Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ED14657F2
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564938; cv=none; b=VtLCRLdZzQionSc+heBXRj68Shw51sy25+hvtduISJ/cNVvM2iMlU50dZZD4vPexr8LHis96U4+WfcChmaW30PT/ApoeSombdgD4KZcFvMv8UfGcU5iIGmxhtwvtCyBXR6Lgf3/Pd6Wlt28zMsGacMacbRErx2Bl2l2jT/gz5js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564938; c=relaxed/simple;
	bh=/jGlD16wwf+LKViAk9+60yGEYsvt20pYf1s5W49VBcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ry+DxitXxN2ZLTtbD0qlO+DhXNndZSkA3fxF5+ZE5jwEC3pz8YNK36fNVfDUYYQoMeZYZzOsFgjv45OtAHW/XxussfLxj5v6rar00CxBCv81JIJ9rWHSxqMv5xXPtAHUMUQrZQ5cXvXCbyXH9I0qHMUMYXD6T8vl8fB1UzkvlD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WSQX0NEc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WSQX0NEc"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso1284647e87.1
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 09:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777564935; x=1778169735; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+aXTQmh1BdIEplotgCd37rKzWea3sfpPCHgEBxHTL4=;
        b=WSQX0NEcN6KPrYh//lOjNjl6SIBW7uIG85opjH7XZrRmiv2TMfkcK/gKDy4ngKUUpX
         BSv7UKqzTT6AqKrbs+g6naix52ZbfxDQ+ic0QkUrQEQF3RbQUQvT8p77xse4UGqnD9V/
         /SuYyy9BjG2sposf5x/EynIgre6LRURLB3L9HwJuTFRAwK6uBW1nEozW4wRwxj0oQLjo
         8t0wyUTwkV1t3eGC8h9kfYjnrScEY+CikOUvd23LfZhSrXd31kp2EG2vJ2Dl7Op2aOfc
         YooVD1ODYPI5REZ1ySi4sEPZuTxlvKi89AqgfZbR9oR/xakvfL7Rwz+zwuMBjDOVvE+U
         meGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564935; x=1778169735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+aXTQmh1BdIEplotgCd37rKzWea3sfpPCHgEBxHTL4=;
        b=av0Cb5PckmChV2F5yCZ/R1Ka6l97K8ZBUX4WFMi6p3KCDLj80R7CSCaOa9v+EJN1C7
         SosO2dRZgNIgJruz9pMw2lhZQf326Yhi7ItSMI41WqsmAz3Gt6PXlrj+9+b0XuZ3A0jJ
         EnL9VTdl5kup33i9OG/qEkWZdKV7+pPC6iAbOKTqYnUpmXumdQ1pnvcVMPZ4P9XyfwOd
         ZeOd4PKn0efWZOUEKf1yS5QZYflRztN039ly+lfJkxlnjvWKF9YfmRUTN0uBetIDRRYf
         OWHFIAz6lXVt6oA3JEAAHjCHjFYHJooZmwI3rk0VeHCyje3XQUTbV4WIagGLiVpWSj4d
         kqZA==
X-Forwarded-Encrypted: i=1; AFNElJ9xkBG9WKNEyela6y598sZY+SRekPbIme5hRrzB+MbPiDizGBUHZrqjgQonpm3gZAhH1n7t@lists.linux.dev
X-Gm-Message-State: AOJu0YzdtIIlLyueu6FYbiLjLp1BruBNRKr73MxVraAzm7NHGgJNZ/M3
	gmtf1a14dSzxW6LYER7d3Rpw2GoSmwMOs0S8PxMKGERKCrddF2FjXTZvCHfG1oSu2FY=
X-Gm-Gg: AeBDiesstpiMoFNbqsqJF9U6jehQkRd/q7aJ7N5Q1LYnJ55UYVSvGo3eOLud65DUVh+
	ACYFa9Lm9/r2wwCNrJBFaPcM7ZvtkJz8ZfVu8TYqkaV9tu7rhErB+g7IeiHv/yXDHSb1CIR3UPH
	rkOk+BHQRupsixvCkNBFPjxd01hqna/GLx8ZrfuUTWyWdvhcL7Ypo5EpuGhp/pISHcoczmtCH1A
	YXKw3kngB+m/gp/Z7y3oejcqgZb2paXr/N05UQc/ijkcN4Om6ND/AUWSpIdR3/2xrCFPBQcY9tj
	XKMxs/WZQVR3LmkeLiKiVIw/plH0bUgMJSEbit4UlGLDEZamPkR9Gu8QGOdR1HbzhuDQVfxhdHN
	8E8UV1MURXpri3B113hCsloNpYRfoI4RvZlSkka7XRJwK2s0jWrx1LAIlF535npUoUq9h0x4QGR
	hmI+x6KYZfq5O3R8hovw9IoBN1
X-Received: by 2002:a05:6512:10d6:b0:5a3:eb4b:37a7 with SMTP id 2adb3069b0e04-5a8522ab50fmr1319526e87.6.1777564934664;
        Thu, 30 Apr 2026 09:02:14 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd551512bdsm10152657b3.47.2026.04.30.09.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:02:13 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 13:02:02 -0300
Subject: [PATCH bpf-next v11 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v11-1-e11f7a8c4fdc@suse.com>
References: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777564926; l=1573;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=/jGlD16wwf+LKViAk9+60yGEYsvt20pYf1s5W49VBcc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJUVh+79E1cnGOyYiZVVw/mextbzRhPani9Cm+ckZYGaMiLsJdxWMvImXEI3Gf7pAz2LU6gJTqa
 sWme+Rx4bBwA=
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


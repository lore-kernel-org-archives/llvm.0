Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B22A3A5E8C
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 19:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367866; cv=none; b=R+4vcYNJBxlgS/MsFfAC22Ffb6hXv9f099YDw2+gy43fYK04r29kAQKnMZKYWu4QSW44AStJzRJkQtEuxCARIGi/2IQHZghVljp734E/V0NeNEufii7Qlyjq0k/Dl6lX4NTw1qF2QtIyaDpBxXqwR+WcsnNBz4mpc6Qc6tDRCn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367866; c=relaxed/simple;
	bh=r4Eeeqlnty5JWhyFFs4PmBr0ldtcOWrItly6lcvC8Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0DPIcffUS2enEE40wmFK68hvvft6ucEIC1XxKHucWuGOTL5uB4sjKd45z/GjaTCcnzvMlVfrDW/3miTZGv6ydi/VKzKBsATgCTixP1wVAIxVmpW8s+iTAVs0Hyp1E/rwtPG0XZtzJA6jVIG4adspGlBX3w26+X5CHHVWyJGrRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UCGF6RJw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UCGF6RJw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ad135063so80933325e9.0
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367861; x=1776972661; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg2etNAfQKZBd7rcNCY3p33XRFv6QLBK/6YkWrjaoRM=;
        b=UCGF6RJwgfSXiRbi/YgnInc5cTWtkX1jcThlFuqwnoi1WarzqAEWkIMTDB+OeerJKh
         S8JDRRo1aeBmoDiB/z5ddfXhF6PapK8i9qEJrGPG7ZtF50JyoohrF0FpJbXrAu3A+vPX
         pbFlWUZBXND58u4paitXP7NCzXU+S9wsT3XWQQaWcCteeVYst8L8RYRna5WiEyR+uy54
         0BINYopz04ue03s6/wkQaR3YYEmIrpUPq+yXJ0qwoAV3IbhJf5Eadf6xc1fqeen9Ssy7
         AgN1JcP2yj1MdQuBbtOBHdHYcBXdjdBCgpBSzjTtZr6b179qEqCrgURjcdsa05pXO2rF
         7VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367861; x=1776972661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sg2etNAfQKZBd7rcNCY3p33XRFv6QLBK/6YkWrjaoRM=;
        b=La7pxldYhAw+mxj/CMQq1KT3X3/BQkGKgQ2855BnDCNu2UsW18GC6nHxzP20aGVtvv
         30WIZ7//ZjZjPul2uLVNnvdj23hwbpaTn7AkkgWiPJ9n8M15YM3VP/SK/ewlK4WNLr2E
         a5F+WhswAxzVYy+RcfjYrz8640Nu/xF96isSfZEL9p4Mu4FcNcvA7ZDiHXSl+K0kv5p6
         2un1WyrFGLIVcWg1MQqp/Zye+9M5Nz/xghvFZFomThDKREUMh64zbtZQs7rz7chvmWUp
         PGTI9WXbrm+67dlYQJNPDyM3iHa7GYfAbDM/YrDRx2REONQS4D22mbUWfk9urNSvZBSz
         YmnQ==
X-Forwarded-Encrypted: i=1; AFNElJ9k6ugrLNqtWKBp2yDgD7GB3L1NHRhx1IHmmaCnArVdHnFkn15NZdXBa7gT4njtjzAWEEe9@lists.linux.dev
X-Gm-Message-State: AOJu0YxJC07CEz19qLod4ASGYySgzawL1H7vL4sU63/EIiJEHxudN4Oc
	7mNCFWqB9AEV92EBoIxnplezM4hSJJAJQilM7g/JCz4ny6Wb9npMxt1iKLiT9uJsEcE=
X-Gm-Gg: AeBDieubWGzE9aEeNxHEw6WEKagbOHoGXyWynP50f8znchHQ/x0yeUDfmqiqaLaHStV
	0WX6aHfcVZgj73pk1ffi5Ut6tLrBAYd5cMikj4NmMJHeMPXu+yTx554lVQ2DuY/Is9A0nDNzPL0
	xJDCLDxe+RHiWIkV7mKVB/TfNiIsO1J0NiWLRC480GNGKrrKSTJotisMC7qVaHppo6/0bsb6A6u
	5W/bx/MUeaILUILZiYRo8+GeSGtKmeuc53Mog5890S2hnNcCN7c9DJDeeL1dOvIvWdUS45V3Lun
	6Iiw5/Ke2ruAMjQs8HzypWmVZvyzc8mdwBEXm37pl37kTJ6gIxtUbhOMgLLcA/0FuxezaihoXns
	v+d+v7g74tn4ovAvfS8A406QJ6JzxqDnlZtS2/Tj4ymOFzH4oggAraOXQaoYVkiu70FpctrzT5I
	2HioWzJgMIxaZDg8I6+++oNSc=
X-Received: by 2002:a05:600c:3b20:b0:488:ab37:b442 with SMTP id 5b1f17b1804b1-488fb293c76mr2913935e9.28.1776367861036;
        Thu, 16 Apr 2026 12:31:01 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c10a688sm11563728eec.4.2026.04.16.12.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:00 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:30:50 -0300
Subject: [PATCH bpf-next v7 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-1-a078e18012e4@suse.com>
References: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=1377;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=r4Eeeqlnty5JWhyFFs4PmBr0ldtcOWrItly6lcvC8Ts=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAPbtf49MZRZIT6BCmzoEC5ue1MD2cdyhiDdjZkr/s/rJ+QXHkqIxIuI51vftri0M2v9UeZfIXV
 wVe2C4ANA2wU=
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


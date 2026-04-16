Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A70B3B6C16
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342099; cv=none; b=lJFzSaHlwgMaSU4c1CF9Agext2yl2cX8U6v96Q0oncCp49PQyPdNzGlHqxj0fCdTrznA47i6Hb/DNIW63xpbYwwlvXobfslFYf2K4Jy9/43Oots2GVvkjZKnVzad3WbeW1B6XSWj6UDOHVUv5/eCxubrY8FBxLW8k0siNUOREDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342099; c=relaxed/simple;
	bh=r4Eeeqlnty5JWhyFFs4PmBr0ldtcOWrItly6lcvC8Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jKkwFHAfxMsB/BvUK5+/dlM2Dxs4I7HN4h0ObH/FF5no6BBNYVa+Zpz/a0ZNIix9wLijktVvUTQGZiylM+ovg8/2xSxUsgFrKKrnqFkJwheXtC6dKwgUMUMG7z9RWn9DYcmfxsfqhjdzldy466GzKOdZb3Ugh7u9QfwGJclrh7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MxerZzS2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MxerZzS2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so54799705e9.2
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342096; x=1776946896; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg2etNAfQKZBd7rcNCY3p33XRFv6QLBK/6YkWrjaoRM=;
        b=MxerZzS2Litm4jc6JvCX4WO3Q2UnLbNLZzKTbqPKGx/asaDUbZYn5Wg+zmvF0NUIZV
         pnoq6ejgiSuKmDE91Jq0Ba3Bjo1ziRZtoYyVZjMUQfpnlXt40Y01FzU9HWyfPic4E+rD
         ugzIyO7sMVjegytVqpmbg9hc51IcJU5xZS0nrOB6GZ4UWC6RNeJtv/pGz5PlAmpfJglu
         EyJHaVs9mq4ddAeRJyICmBqlQ1IN9HcUJVAyadtLWn7wTQo4JJMzWXRyEle2B6bRC3Dv
         AZcovJpipFFJxl5DY4e0UEXYwLGR1ZuFAASUk3yQjKBJaMKZu540g/7fE8mu225PCYdv
         yUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342096; x=1776946896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sg2etNAfQKZBd7rcNCY3p33XRFv6QLBK/6YkWrjaoRM=;
        b=KUlxsfleWbV7kzQE7nTO77xE3dCru5HH+7dDKxGm50G9gT7bZ9pIyE0GSw7XWe2iAq
         cP1Imj7RE2YlxwyBpxOWmsKUEp+by8K2C4ZzxAgvaHdatrL7kIv1z8LzbqfI8moxKCZW
         5Q/h+PvNxXMGYd3dkReVsu/9vpLS2bVi8dafHSuudrcgfHsUbeQanhV2VShEjuV9+k71
         yi3JyP/ms/j12NxcEsVxxX5dTE/OQJUW3cyvv/Rq9PSVIOa7ruNGsXFQW8zEQHwjVv35
         GOrqoeziX+53WqGimv/fFDPVrzYZwo8NWgrjOtNxhd2QY8Yh5jMEx0tdVu0zL1QhrHIl
         p3dw==
X-Forwarded-Encrypted: i=1; AFNElJ9gCtbLba+KklaWaGluRI5bzEgKy3qv9Cr6jTQ6ALykD3IKj3zUEfMC7HesmylyVobyygYT@lists.linux.dev
X-Gm-Message-State: AOJu0YyFaIIOtw8E9ZFIk/ZH2gCGEDrROmQBuWaOLVylNqkDVigrjqgT
	5jTs0L+KQ59De9Xk/+vEjqJkqTnG/0NhiXj5US72+7qt7AHXJB7Ym+9Mzb+fRHIOb4A=
X-Gm-Gg: AeBDieswYm1tf5A5UNJiK/OVD2YuRQ6hx5EWSq3ugwVL+UifhINkajkbZi+v4R4n5VE
	5SqyAWNKSEd3qEXImokNzFhmHnTa6lSU2Q/7B7viIa8gpMl1cbLKWigyvdFVM3+0pUnjwsxVQOu
	2XQ8hDh5fQmzn4H3LEcDDRAXrekUP1FDQDk5NDXTQ6+/QNgx9Ef0dGuTK5nqzN32624e0NL3H74
	bHBvv4vmagfzV7RyxXCEqNZUoD7Bb1qHkFSGwmgmDHvEo5cuDlpeB54sxKDXjA4Qzpf24koDxaW
	dRAwhLqrW3q51ebYaN6Eedp6OSMGY66SVi+bY9SuNIILza3aDduYYyWQQZHmB8tipXBrkeCEttp
	bpDqle6lzmkvzjTnaWJwOnQcGxuSYTswzMMi0fwSaysd2dlNGYoeTEtpz+/17zfTXY9LQp6/eiT
	Auhzr2hUcdLZw=
X-Received: by 2002:a05:600c:350c:b0:488:9661:2570 with SMTP id 5b1f17b1804b1-488d67ce8c2mr352427795e9.8.1776342096400;
        Thu, 16 Apr 2026 05:21:36 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f569f4bsm6849514eec.21.2026.04.16.05.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:21:35 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:18 -0300
Subject: [PATCH bpf-next v6 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-1-7efeab504af1@suse.com>
References: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=1377;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=r4Eeeqlnty5JWhyFFs4PmBr0ldtcOWrItly6lcvC8Ts=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMp7IYcl3451BzQO8aHK4F4373QgzlaelKKslfNxqJXSlPxFdg8eg4NfZcpJgAhyK95KEuAxrkG
 9g5UX8B023Qc=
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


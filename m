Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CE33CCA15
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228387; cv=none; b=sOVAqtye+PPwYOvFQrjGkbLJNhCsgb4aAwkNzfbQD8gWGZ3YpE5rCQSpgZ1jcjRHttc8VByEmUQjA7zlf2t8ZzRtKOHDPKOF6uEuQGi5uhmYk4gYz7pWln2pW05cfiEy49WhRmFoJqx13CvxLlFFwgB+G0Lb+pM0TKsujICklZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228387; c=relaxed/simple;
	bh=VgaZGJgNoIf6wfVc9SmL/U8SxxfQLWizje2Jxoqjl4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ihnf2n/aHa6rf/9yPS4TdkZbJJoaFF8uy94oYgHfyR9M6PWf/Mg34LwRBbW2jvQimnorwsfokQsZme5LuyQkEZ+WaAy4iMDP3zMyCZ3qpCp/dwuo3ue5f/5mzdWlQjCh4IKLF4Aw+Cmj0PhGN/t4tEb2eYgBTFGinaNcf+5KxhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=V0PEczWx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="V0PEczWx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486507134e4so28536985e9.0
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228384; x=1775833184; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5ke/PdA8QzVJR7Spl86h1CIBtkkSiz3t60hf2vQo38=;
        b=V0PEczWxee4b2bdfNgd8UzPNhoDqBvnDLBf+mF+FDFDAJJGRD3TGL7NO4tyafnidwD
         /4QjcMm2gWIsGXyS+uzAjW0rNsnejn/hESbXcxA5uhsV8hV8Zb2IE8XJrvZ9Y9MGyz0P
         mhun7Zy9h5lFzsjXHXBNq8ohcOT4dT2+XsBPUkumGtdtzYMN2lM1xNAoaWXNPSddaxXw
         4TdFEd7l67Adm9EcoXmAklsSUxAXq1pZPokGPixnlWvsjnXhXYl8I9h4rx8uzgy5Ke0E
         ql9nXCnc+K+nbXHNspq0RBck5/SPUgTQZHby265QjL36wu+HVctNWZtFvQZbCmNKRpji
         HrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228384; x=1775833184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o5ke/PdA8QzVJR7Spl86h1CIBtkkSiz3t60hf2vQo38=;
        b=HX8wPgdsFtOOSwLLspbEDhRZ+eEOVs0AURZ5YwZ2dEXNng89U6TPoQKeqrqCdMtsBZ
         m8qCaiGTiRMinlDyols/qAVXfIR2fu3fxSHFcdaW8Qj/WfgYA/Y92gCLeC+2kYzW81h8
         U/XATTjt7f7COi54l/QsaGqtM1wIJEtKbhEzCEATU99keWDHvbztdBzj7wx6LG2aRxam
         ecbaPGzsDStHTrtzI6OveImPFtbxIzdA4rSl6tCXCpsRsksabkJ7ogKZPB5qz/vu99Q7
         gIjxX8g72A8Trxb7jf34JY4At/qK/Zaz+rAOqTYbEYtX07rQ/Cr7HIDiI9zXYxC/gpGr
         nJoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWklBwDkX30BUBfdvGH2dwkWao/SLd619823+TItbM2KEVxmxOt0ipvZ4+EyGs1shJ142Li@lists.linux.dev
X-Gm-Message-State: AOJu0YzmF9XY2XAI0jrWWuaueR2Zcnk+BvKv8CR6mSxGOEeX35rQHI1Z
	X0LeXSvm585GVO3n6jSsrTtdhGrga1mWqTDjlf1vSQY99anYThqqyHVpXBi15NGpNSAaQkDGuQz
	kx4/e0bg=
X-Gm-Gg: ATEYQzxa+gnj1rTg2L3VvX/8jcaRkNO3T/8V9FHoaQn2PS5SkEVoOF6QazyhXO42AWf
	X7/k4RAtekyhvHEZ4iM5+PW2qYuNCu/liF+0+Vc/BTEHxQaPE1tfL1ZuhZF9n7tZ5A4AhFKHi69
	zcOvwCz53U6S96s68xoU6sMAr9WQdwdEo7v6azeCSsO62chQngKIymCud6GIS5Y3aiNAlH7f2Ua
	ppBd+NSKyM8ALV/TOYFH7AETrq62uNleDfyrliAQyK0Tbc+3FZLc9LmTwwZJhp8JfgkTkWKV9ZM
	Xw2n+OvWcI8PwN+DfRzApr3g2uwp+0hbXpOD7nHTgvrQrtOOMb5aIZbI43g7KNdE+5W507xM4GR
	AHZhfnTBsS5yKf8UeGBBw3r4XOxUQw4X56BLpyWi9eVCSUtfNlUWPExq4A2TWrdnkAv8UC7h++a
	U9E5IoxNJ6
X-Received: by 2002:a05:600c:4688:b0:485:379b:57bb with SMTP id 5b1f17b1804b1-488997154femr50823345e9.3.1775228384139;
        Fri, 03 Apr 2026 07:59:44 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9bc41sm6878642e0c.11.2026.04.03.07.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:43 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:59:03 -0300
Subject: [PATCH v2 10/10] selftests/bpf: Tolerate missing files during
 install
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-10-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1301;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=VgaZGJgNoIf6wfVc9SmL/U8SxxfQLWizje2Jxoqjl4s=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMrZ54BOOJqDcZdAFl3NiwWeFS+siYvHChakdRJTLU+EGvle5lkem4T3+OqPl66zcPPffeR+n5j
 kC40uYAgbyw8=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

With partial builds, some TEST_GEN_FILES entries can be absent at install
time. rsync treats missing source arguments as fatal and aborts kselftest
installation.

Override INSTALL_SINGLE_RULE in selftests/bpf to use --ignore-missing-args,
while keeping the existing bpf-specific INSTALL_RULE extension logic.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 6c4f85459486..d90e0dd9d0e3 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -953,6 +953,13 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
 # Delete partially updated (corrupted) files on error
 .DELETE_ON_ERROR:
 
+# Some generated files might be absent when only a subset of BPF objects
+# could be built. Tell rsync to ignore missing source arguments.
+override define INSTALL_SINGLE_RULE
+	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH))
+	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links --ignore-missing-args $(INSTALL_LIST) $(INSTALL_PATH)/)
+endef
+
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)

-- 
2.53.0


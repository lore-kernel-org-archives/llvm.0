Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9F421A0C
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 12:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553643; cv=none; b=jbZQi+aZ1roaBhCI2bhmAS+ZaEkrplFq4+gw6F0MsE5/x4R9WIqhXTP5SN1UNvPljwulNNKKG/Vv12yb6D2ISns1mtAjO54JMau+Mh3Yxmces1Ivr00K1f9qFxCi2jDnFKbz4C43wZTqt9ODrlA9jV64LKycfb5EyWXEAhkXSrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553643; c=relaxed/simple;
	bh=/WLI+3txZprQ79s0dGyS6fODzXDjv4ern4WIbfN0S30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLqtiFKS/KTBYM71MzTF6jFcQxf7cvuePr5GkrWVZPnHaN6gQJiIsBwr186Vdq4GGzFT1oSl+tiLVght7ifeU7OiD/ZGuUY3cxS9zuGOq3Jtej3IqJD7JoEqNLZMjnu1Y9O6mAimBX131hfE/ZYcOJ6boBxjqrgBMr3QlxUTLZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DK73whVL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DK73whVL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso8386415e9.2
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 05:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777553639; x=1778158439; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ae2sGx+ag5Tw9HevwoQKAokRxB+3kxP91mZ1Vz184bA=;
        b=DK73whVLyDXvnHhR3NUv/RQ89BpyIKErUsllWsJ8HJUyazLjouS1OtmAIyB6yxjih6
         gsSKS48LRhhxJ8THpO037JR+uhV67kaXy1abpoQITD7U0rvyCh2efW4X/r7mBdnMOl//
         tQo5TYS/+q6LxzxTiAyNHsEl/Cu8DmhXhe+D7GjCokx8u30++S0WWxN/sW5cshzKiE2w
         4pTyf955zzWw0UKffI7eV+8+ukNLLkm3qUQ3AB0GnI5fer1DGly+7rlNysZ42spF2XzF
         KmvwfSoqEMGox6/WpvAEjjIjWg0IXnYuOWCUpu8dRMNjyAOH2MYrFChYj/VvdhmwgT6A
         F4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553639; x=1778158439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ae2sGx+ag5Tw9HevwoQKAokRxB+3kxP91mZ1Vz184bA=;
        b=HJDSYK3RGuDk5CSvRyqXNqYfXjSaKu+m+mEXiNpizZ/kGVbU689Un7Cml9qiLnMra+
         QYkrNEvglKFzlTOhqv3DCNYQg94s3v6sn2UfGGNW1ASCbFSKvNAdwpGKalPdt40nmvlB
         vSAFX6g/lzHZcHjzjl0g7qAXF5PuZG4HUELgJoI5O1J1GDiqJUfDp8bqL4z5ypuYf6ue
         tfjIqSYTBfNqqLNujqWvEEaM6EsinjGVEXP0R+BfGeWPCcLwUOygK1aszihwc4nFCrsd
         6lYEFTrf6fj9qfojT/iQMZ6ifAR9nkgzIvzwGpLWgldTZSmlgsomsngMeG0uKv5WPJnY
         H+Cw==
X-Forwarded-Encrypted: i=1; AFNElJ/0v0UOE4EwsnSzSkY6VOCB8oB0LTLvVx3u3MSJHJqoCxjilguAArF6nEt3QN4RPN2XM0ac@lists.linux.dev
X-Gm-Message-State: AOJu0YzczT7yJk7OnhcTw+Tre4Yuah14LGR2TcRuKFUz+DdMt9U6ThOv
	P76NLIxDJiyV4zLTuPFz3GI+tG0sc+18WZ6mTCbKjEYHiIhqRIu54R8kxWMaNy2TeGc24bocDUO
	6KA/vGTc=
X-Gm-Gg: AeBDies4XJ2iYe7Hu2ecEfYNCTJSMHh/ekx6Ea7NyWVd0fCzMj322Q1kN9qzTgI5L/X
	cEL0oZh+26WVSkQckvKkfSRUde/xx7i0ub+5g0RyZ1qyPfHRvYAdzriu+K6YNLvKX8cJtJnc08i
	sPvSzUFnO1gQT6XCKpxNnQRLtGnFXEent8G0Yd2EpTcBkTolGmpYnAA5w4ytCwk1h+guG4FezbW
	CKR3elyiMaWcjW/hvjmnyVmhdCLX0ztMTIsInRGWE3BFLgAgkqmj6d+X7ltkkxkT9CoH9ygGXCJ
	tQTuY106SUqwho9FINW4AoN6u+hIv1nk4cAhW8mdxzJvy543TgHEittt9rlEBucxuXC4VMJ6reQ
	k7oGT4v1eDfZVMpUyKKdgTMo7ne7K7mINYPc7cLYhCJKECRwYByl0UEmTrv2EKggsS5HoZ5Q0As
	6KO70rxD5tMBJt5N1b/MXpqGdU
X-Received: by 2002:a05:600c:4fc8:b0:489:1ba8:5be9 with SMTP id 5b1f17b1804b1-48a84457a98mr47364015e9.29.1777553638716;
        Thu, 30 Apr 2026 05:53:58 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1bf6d391sm8900499eec.6.2026.04.30.05.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:57 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 09:53:23 -0300
Subject: [PATCH bpf-next v10 11/11] selftests/bpf: Tolerate missing files
 during install
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v10-11-cd302a31af16@suse.com>
References: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777553600; l=2156;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=/WLI+3txZprQ79s0dGyS6fODzXDjv4ern4WIbfN0S30=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCAb6pv/obNOHZMhZ1ZDm+Ivl91Hb7zdkDOLdjsjGtiOVKWzQESTHQTB2DY0VepKMCmCpT9ihEv
 YIMmXBDTR5gQ=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

With partial builds, some TEST_GEN_FILES entries can be absent at install
time. rsync treats missing source arguments as fatal and aborts kselftest
installation.

Override INSTALL_SINGLE_RULE in selftests/bpf to use --ignore-missing-args,
while keeping the existing bpf-specific INSTALL_RULE extension logic. Also
add --ignore-missing-args to the TEST_INST_SUBDIRS rsync loop so that
subdirectories with no .bpf.o files (e.g. when a test runner flavor was
skipped) do not abort installation.

Note that the INSTALL_SINGLE_RULE override applies globally to all file
categories including static source files (TEST_PROGS, TEST_FILES). These
are version-controlled and should always be present, so the practical risk
is negligible.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 0559742137e3..459008486b89 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -1023,12 +1023,23 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
 # Delete partially updated (corrupted) files on error
 .DELETE_ON_ERROR:
 
+# When permissive, tell rsync to ignore missing source arguments so that
+# partial builds do not abort installation.
+ifneq ($(PERMISSIVE),)
+override define INSTALL_SINGLE_RULE
+	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH))
+	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links --ignore-missing-args $(INSTALL_LIST) $(INSTALL_PATH)/)
+endef
+endif
+
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)
-	@for DIR in $(TEST_INST_SUBDIRS); do		  \
-		mkdir -p $(INSTALL_PATH)/$$DIR;   \
-		rsync -a $(OUTPUT)/$$DIR/*.bpf.o $(INSTALL_PATH)/$$DIR;\
+	@for DIR in $(TEST_INST_SUBDIRS); do				  \
+		mkdir -p $(INSTALL_PATH)/$$DIR;				  \
+		rsync -a $(if $(PERMISSIVE),--ignore-missing-args)	  \
+			$(OUTPUT)/$$DIR/*.bpf.o				  \
+			$(INSTALL_PATH)/$$DIR;				  \
 	done
 endef
 

-- 
2.54.0


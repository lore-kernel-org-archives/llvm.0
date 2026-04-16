Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2EA3E95A8
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 19:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367905; cv=none; b=GWTJY/l7i//7giiyzFONqEUD2KDapDpwXoCu5bulpmHkE+sqCihEEEuBoKmgjcGMFZnYup7iNHsU4WCqBDR4ylg1wnFJBhdP4dcE1V1N7WSA2RpK1x8oVEPztE59/aAJL+GCO3RqC/yz8oq+WAWXslA3q/3pcMCdEMwXJpPpiHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367905; c=relaxed/simple;
	bh=u9LZEwi66b10OuzjwpSk5FjZx5A9K59bxx/PeiS2pIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CczyGLX6fWFY5ytysl7P3B2QQxmmFtyLqrJvdOzeX/6cQIDYgg+T3q5V2+puqaROm7EN7aagRElkj1DSw2gAgjMij2M+AX58YUFv55B8K4mknmMoynt3tnuUEM2vFN3Yq/ragmYI5FfC60RKv1u8e2SH3Y9c1zE+ece1e2FIlVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=efthynka; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="efthynka"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso101253605e9.1
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367900; x=1776972700; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJ3r37ogqR7olkqp+SapeMaeTv/V70MwihEzAcWCwTQ=;
        b=efthynkaE/9ClaPNtshChIxSZfnnEh3dtW5306KZxlgi7K+xN/GPHzi6kxlEo7zM2o
         ZZ9fhpJe5HxJTxyLAc5NqKWX44EzlcJqo6gxXM9KiU7fC4v8Fuuhz5AMl2uaa65wbLcf
         N8bAcpI/KzwMPNDqeeU6qiP6z2xb01O37bqmUCZMWuzAkrAfZ01oc8dtJj+rPjBHkqmT
         1HsVIhLqvORj31G6kdINqjVKI98JT+OSM6q/0uXllBRFttfkvrFf18LUWy8vkCb4Z7JE
         BI5wSyLFsWe/lGc3IMZY/fVyYAEDCyR5KwJoqyusDU/NWraor2wMzqJkXus49uKyxD4e
         cC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367900; x=1776972700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IJ3r37ogqR7olkqp+SapeMaeTv/V70MwihEzAcWCwTQ=;
        b=o9K4KywiwGt8Qdej6uTvt9PdwQ7YZP6+wOSFgOQ7MWbKiDw4g/4ZL9scEx1fr4s6yk
         HGFChz+iQJf7qvP6WR5n2pU07+sAuUrazt+Bc8sHWvAApe6INHohbkLeeOXto/siGBz+
         cDOkTzeXETRtoAdqJewjMlFDTIiMZ1iB35zEce6j3NQG9ipxdEZ6/HAZZl0paGqQaHt1
         am+OsOQw5WEohv5VZrJ44AXPeFB2HHCZYZOEebQ6XjcJgg6VmpL7LW+Lki3FYl4FJIGg
         c6qPP/gSoZV760VB2Ce/N3umqCYcYMn8ntjJHQmjDXuHhI7H1Gw70z1EViMgaT2f/ETB
         gqNg==
X-Forwarded-Encrypted: i=1; AFNElJ8mjuy9XCwrUuUW/zH6RmOByUlx7PUFxJUzt+zETmyBS6GjT/zzhyj12HUBDCHcZFiTyGub@lists.linux.dev
X-Gm-Message-State: AOJu0YzNgN0PpjOrupXO/jDNb57r3iFWiEXX5o0UMWR1UCtFlxuNlYH5
	Lx1vjw0DvV8sI1qbjJjAYRJwnxXEKF51siU/mSUD0JoFoDcowaE6nJUrHQl6lRGfJVo=
X-Gm-Gg: AeBDievZ85qxfPzpI+cFUKziXH/wQjYJBcBRLGF1ph37y4KacevocVYCGO3tWdQwf8T
	dYxkJ+8uql9kSlfmBZcfLVk3UJ1dT6n/KWc3bQaDrILS58mKUBDY6EeLV4oJWhi9HzO6uNQn8oJ
	x2v4xhzKPFaZW+nPHRPxLrP3OwQuR1NiGvVf5kkEYjWnZduX/13r574fXos1K+EL/7hzKs9SSjD
	npNJBlDJtUYHKGu1SOq+seOjIsEifTRiiEcrCwPB4Y9i582yZF054mdvDjIcvHPjeW5aYLCxMJJ
	Svdck8wZZeFTY9nISojVHK1pOJzJWs9vl8x2h8LcBMNeSEs2z7W36vDCeQBFOqZTBdHX4H/pNfl
	uyABEfL6FrctMDTjFYBBxiDrGf1XoO2+XaCH17kjze7UlvhHG6KONGhyVZAwKLONhk10p51Lsfs
	rtjFiOLUOjnDIMwEDSQ0zJkUNQT6HjYf3Atg==
X-Received: by 2002:a05:600d:1b:b0:488:9439:881a with SMTP id 5b1f17b1804b1-488fb26ea7cmr2836085e9.2.1776367900154;
        Thu, 16 Apr 2026 12:31:40 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8443csm8751812eec.14.2026.04.16.12.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:39 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:31:00 -0300
Subject: [PATCH bpf-next v7 11/11] selftests/bpf: Tolerate missing files
 during install
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-11-a078e18012e4@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=2151;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=u9LZEwi66b10OuzjwpSk5FjZx5A9K59bxx/PeiS2pIU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLClSdovgIOUa0JYPVPuFKo/leHFyBzCBLmZIgS2HtfJjjwxK/CInHHcGA7RUpCwe1HMzRr7f5D
 ND8qhfhM0qwA=
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
index 88a03366f6aa..53c3808c0c88 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -974,11 +974,22 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
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
2.53.0


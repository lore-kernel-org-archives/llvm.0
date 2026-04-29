Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD01137AA72
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 14:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473286; cv=none; b=puyagOOHGGZ971Ht9f5k2bm/ZEShCB8MWFUs0mftWxori8h9RLeXr/mHOQkrpib+kOaV7HyzNcrD3nrN0aFCSGDo6e5+rqLdX13Pp/chnYO0RSMbQEGTll7aD8nDCfwOfzQ3HKc93KhlkJp1LDKcJrvzxO9kt3Q5XnqGvRcjl3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473286; c=relaxed/simple;
	bh=QlnphXbIZwkpSF4vwnCRoGf/LwYmdqzZuMpKhZCGNVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+f2ljLmqXxDEmQEXorFKYmB3LqGYRdl73eQs0A2mUCdSkMD2cxATNEFJzyY2AZ80uzMqZlLfh3bTOoqKmKbpfqQxD8SCQSFNL3LNdHFy5zvGjSBsKKYWS1WJJg/VFK5Zyxh3lQOw7JKJshlkPK3FKU09vlfEs1wh6OfwKjc6Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ACpH7+4u; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ACpH7+4u"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso9723415e9.1
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 07:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473282; x=1778078082; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pA8Vhc9DANl97GkJYN+mTuDBA8W99vr/NFCFT5xJ6I=;
        b=ACpH7+4uDWWbyZ1cvzRFMfL+ZgixHwVuQwArwKRT57cKdbz5/aT5TKD4e76quz/TqC
         scp2+HnoKy+1mvMTt9tSUH4IeEyMqsDPm9flgslVs3NxR1pa2Y2A0TgTJWOLHinjDQ9+
         1fUv0msRcfIA3wR2huRvHnzZWdQYJ5jmn3j6gYLCQikbtGdznnEqBVeIZSiVldHuQcER
         uSsequNGsOHRFYXBuxSUmjDJgup1lhtoV2zqQ/DyK/cFNMbEX0QDg1U1vNZb3r+0Gbzy
         xcF2Qq7NItmUHDqxIZKeT6DbYND5t7jHGqLDw8B8z2KgJdcWmbayMXmU2Sa2X79yVOZQ
         oLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473282; x=1778078082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3pA8Vhc9DANl97GkJYN+mTuDBA8W99vr/NFCFT5xJ6I=;
        b=NPJIFWEkObpSXnTvUBgqa8uNHjkSYk98J7fZIFH6OC/48ilmZrhYk5QPYBESopZ0gg
         6eID+66EyPF87z5asVzK4QlCN4+GfPUGtbvqev0BRNpmdhFB/WyaiBBPzznjlBx/0R3X
         NUgr4ODstlwJEv+16oWCCfkA4pU6o4U06o9calWEtxVnPKdMmAbpg2CdZ96wngHwSC+A
         9Ybtee6OiXe1Qkn+70jvZE8KCa+JAY2Fi44hymKWsvqad/a5BGtkKL0c9oJf2D0avaaN
         2a1EB3PLA8m0cdYznHjkemVfyjABImL6EE32K//3Riy9+K+CgHPWdtTUtJ2DpDpCmHZv
         WMOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jTMqL3ilMEs8K5AzCt3VMzFDD7xeF47q47+RCJgeIRXQ2Fw1a8sPkBSX4Rooa7uY/eWN/@lists.linux.dev
X-Gm-Message-State: AOJu0YwPKJfms9fGrA08qh/NkmDe1FmF2fJ0eo5Ax+Pc331L3Ae96qaF
	k7M+FtjUaUt9BUILMIrpKsceBQsq7kiMlV61SaKZjMbBbCLgkex6h2gyxOR1LG9MvzQ=
X-Gm-Gg: AeBDiesZUuNyi5GnKxVhzegiKDLbjI8gymfeLC4PuAeUFN9x9vJqiM6mV3YUSih7cCE
	5W4AiygyMUzGpsAHoIMG/NU/V9g3MR1t+P27dkoCQAXWgUjoDA+zBXMuQU9KnFoZE7l22z1Z4XV
	nhui8Z7wx2sQBzv9Y/Bx1OvoJQm+unt3/lsI8gj6yN4Bd8TFRcWpadpqdotpb8RXl+JVMbONpzf
	pQfHnh19ysEHm4W3x2Q93iED9oP55DYMZeQH/IUvsVCVicMwrSl26FNbGrYmbTbPuMdUm8Mw3Tk
	+hBmvZ1P344J1ooyKYfT6uDegbjA0l2ltr508b8J0ARLvvNlUarSjffbHYn7uZDfq2Id6pvi8BY
	2T/mQkgnEq5oUlHepYqzq1GFh2lyxdaK3+k8rI0AAdNXEpFMD0KlYgxJAv8DPkRuwohjMbPeLLX
	rzmoLxnzmlOePcr+ok/6DQhaFlIDXf+jvTcE8=
X-Received: by 2002:a05:600c:29a:b0:486:fcc7:6811 with SMTP id 5b1f17b1804b1-48a7c81f998mr32567305e9.10.1777473282131;
        Wed, 29 Apr 2026 07:34:42 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62982135e26sm1155487137.3.2026.04.29.07.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:34:41 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 29 Apr 2026 11:33:53 -0300
Subject: [PATCH bpf-next v9 11/11] selftests/bpf: Tolerate missing files
 during install
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-selftests-bpf_misconfig-v9-11-c311f06b4791@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777473237; l=2156;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=QlnphXbIZwkpSF4vwnCRoGf/LwYmdqzZuMpKhZCGNVo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLX4yiW64I6RKHzS/sib+IHUvxGgX3Dyy9/zjZ0Sn3ohSM5MHnNmurZMfXtcOsbXtk6ntUEtcGs
 inByZDTwzLwg=
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
index db4ff951fc88..2822f09c37eb 100644
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


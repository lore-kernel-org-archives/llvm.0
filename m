Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C897F2D12F3
	for <llvm@lists.linux.dev>; Tue, 23 Dec 2025 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509251; cv=none; b=qzRW64YgfNrsLmV+D0MkOJLLMU5NmhnhF6tvth2BTKnvxMOcGX+ZkS2uCVcRlUKFQ3CqMZ3IDHs1j0TcbJL2PvGfJrT6RpE4F/SYXf1Xf/ho2hpX7vOnJGpgfNekwidqLkJHr9HzJKuxF+7auRX8IZmt70InxzjOJ5SAlpSFsjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509251; c=relaxed/simple;
	bh=U71eWv+lZlEigAhVYCviXUXxQA3e+e5qTV+RSri9qqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PRl1EsIfB48aPoqe2rardDQzVmqscoBGWAlywBwKRBh5tpkeoUTdeGfB0d4uaLTjwNRct8zx3+osu75VRIH2lhjswurPFiWSfQ9stgAUH4vD3NnTTkUojJzRfkEMOyGaUq/zZ9PhP8nazbwacIL2+5pzEaYddzGCgKYnR0KEVEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NAUUrZSP; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NAUUrZSP"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso3163500f8f.3
        for <llvm@lists.linux.dev>; Tue, 23 Dec 2025 09:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766509248; x=1767114048; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBD5hyInNJ1zU+FPwr6XKENm1lWydxvpThAe0QY6n2o=;
        b=NAUUrZSPknBL+25X9lTux7gXmKRdQGz/6Yl2iOk39TerGIHig2JRR2JJy23Tob4NhH
         qNwc8Xl/1eyTGaS9BxoFLu/C28RMS2WXQs0LW9r23+6IlaF7Y/wrB/YzeVNABPw2FjN+
         oSB1n7ke6brJdpandwCz7BJYy92OpapaJmI4AYVW8O9amAWRuE6ZL0YILWfYOBNxiFmx
         SCXUgCHIT9Qyp7HhSA8FQ8QqoGoJ66tDhaxK8+HeDghLXBDaG+tDksvj0y/0bYqjW2I2
         YBEm8EX21LIburD+NmuX1Z9wQs5Rp+98sJ0gFD/LPCmOMT76n5A2Mopw2QgAXB3gbEdN
         ITnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509248; x=1767114048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MBD5hyInNJ1zU+FPwr6XKENm1lWydxvpThAe0QY6n2o=;
        b=R+N7EADba87cWVBbjr9BX5asL1+0fF1bxFIt2+/hks6uNrboCOSNgP2Wq5FbmAj3vi
         Tt/QRwRni+zlvavXi1ZsDxq/5n2xOO48QAlMp9gu69Ov4cNRBNOFkuJZD36jxvmQw0OM
         BXjRShPtPhhJKsAM23WJ50vXrNQ6Eqbir4zrcBQJ+JSXg8s0rfHlq5Bh1YPpHQMN1rEk
         muo6tPs9gIcKvgLPDwJ6wOvHlMOXkCEGxq742d4aKcVmf5itxD1rctSd3RSzSGLmdpyG
         pmvENsEkrj+COMcGmsy8Rv5K1bxB3mlTOAqOBYnupAEKJ08m5SX+0C+pfaCV49wLvsi4
         vOKg==
X-Forwarded-Encrypted: i=1; AJvYcCVlZBZf79xZW+B7gycep8EidZUD3JuslqfrgILKY0Qut8+vTU1da9AIpPhuZm9k3WMoKCGg@lists.linux.dev
X-Gm-Message-State: AOJu0YxxC6dtuzfceZyNAIYs8XhHJztIuLyva1VQ4gYQqIF6n9D2t3qF
	Onfw4X6d0oACJaAmDlrV7WmVQJMtIKPVJZ2cVhewjAJgUHmhHeuVlSKQP16xMy9WJag=
X-Gm-Gg: AY/fxX7urn4WPwraovk5t57YNaFRt0kXgpNnyhoG4MBI9ZYkIEdlreosg8amcUKYW3b
	MdOoep1bZdkAzuPJRqI/YtLZe4BrFnomP1IjUnhOTiVnB2xjVr5eVA1Zjt8f39xoRrJmLdw4t7v
	DTTB1O0GbEPOqEYJMqAy1nEiVD1vuFX4RNWcfNKX/CVAb5nFfc07B5CJBcfjbwfwMkXHYy03qwd
	lhHaVePziQED8iLSeI7hgUfPVPRkr6VWkQiyWFnQeAX4w9sFvPsZrSabodpx3zSbGwIutcMX/ir
	XLusy5QgK2PXaWtf0yf8E3o4064eB+k9TOkLsJOp66sk5Mj7C0FliJNLRj2kiaa3WVbctPs7xSl
	b+OReUpf2SUKaK9ehmtybuh4SQHhKxINXkI2RiZyFtLbchfQF5OtEWyhEFwMBuI/Ut4O14K6OKY
	bTWovKbQbhmz1nKRed4iHF
X-Google-Smtp-Source: AGHT+IHdxuaNfoOArrhJfQGMxJD7NTPYAUwkN7KhO+ZEUCIEmGuIhQs3mIG7HIDmUEghx29uGdFspA==
X-Received: by 2002:a5d:5442:0:b0:432:7068:18a with SMTP id ffacd0b85a97d-43270680252mr939319f8f.20.1766509247919;
        Tue, 23 Dec 2025 09:00:47 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm28895137f8f.7.2025.12.23.09.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:00:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 23 Dec 2025 17:00:24 +0000
Subject: [PATCH 1/5] perf build: Remove
 FEATURE_CHECK_LDFLAGS-disassembler-{four-args,init-styled} setting
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-james-libbfd-feat-check-v1-1-0e901ba32ed9@linaro.org>
References: <20251223-james-libbfd-feat-check-v1-0-0e901ba32ed9@linaro.org>
In-Reply-To: <20251223-james-libbfd-feat-check-v1-0-0e901ba32ed9@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Leo Yan <leo.yan@arm.com>, 
 Justin Stitt <justinstitt@google.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Alexei Starovoitov <ast@kernel.org>, Andres Freund <andres@anarazel.de>, 
 Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Nick Terrell <terrelln@fb.com>, 
 Song Liu <song@kernel.org>, bpf@vger.kernel.org, llvm@lists.linux.dev, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 James Clark <james.clark@linaro.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Quentin Monnet <qmo@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>
X-Mailer: b4 0.14.0

From: Roberto Sassu <roberto.sassu@huawei.com>

As the building mechanism is now able to retry detection with different
combinations of linking flags, setting
FEATURE_CHECK_LDFLAGS-disassembler-four-args and
FEATURE_CHECK_LDFLAGS-disassembler-init-styled is not necessary anymore,
so remove it.

Committer notes:

Use the same technique to find the set of bfd-related libraries to link as in:

  3308ffc5016e6136 ("tools, build: Retry detection of bfd-related features")

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Andres Freund <andres@anarazel.de>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: KP Singh <kpsingh@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nick Terrell <terrelln@fb.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Quentin Monnet <quentin@isovalent.com>
Cc: Song Liu <song@kernel.org>
Cc: Stanislav Fomichev <sdf@google.com>
Cc: bpf@vger.kernel.org
Cc: llvm@lists.linux.dev
Link: https://lore.kernel.org/r/20220719170555.2576993-3-roberto.sassu@huawei.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
[Cherry pick to fix accidental removal in commit ad5f604e186a]
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Makefile.config | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index bd9f4804d56b..ea6636a09a95 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -379,8 +379,8 @@ ifneq ($(TCMALLOC),)
 endif
 
 ifeq ($(FEATURES_DUMP),)
-# We will display at the end of this Makefile.config, using $(call feature_display_entries)
-# As we may retry some feature detection here, see the disassembler-four-args case, for instance
+# We will display at the end of this Makefile.config, using $(call feature_display_entries),
+# as we may retry some feature detection here.
   FEATURE_DISPLAY_DEFERRED := 1
 include $(srctree)/tools/build/Makefile.feature
 else
@@ -927,8 +927,6 @@ ifdef BUILD_NONDISTRO
 
   ifeq ($(feature-libbfd), 1)
     EXTLIBS += -lbfd -lopcodes
-    FEATURE_CHECK_LDFLAGS-disassembler-four-args = -lbfd -lopcodes -ldl
-    FEATURE_CHECK_LDFLAGS-disassembler-init-styled = -lbfd -lopcodes -ldl
   else
     # we are on a system that requires -liberty and (maybe) -lz
     # to link against -lbfd; test each case individually here
@@ -940,13 +938,9 @@ ifdef BUILD_NONDISTRO
 
     ifeq ($(feature-libbfd-liberty), 1)
       EXTLIBS += -lbfd -lopcodes -liberty
-      FEATURE_CHECK_LDFLAGS-disassembler-four-args += -liberty -ldl
-      FEATURE_CHECK_LDFLAGS-disassembler-init-styled += -liberty -ldl
     else
       ifeq ($(feature-libbfd-liberty-z), 1)
         EXTLIBS += -lbfd -lopcodes -liberty -lz
-        FEATURE_CHECK_LDFLAGS-disassembler-four-args += -liberty -lz -ldl
-        FEATURE_CHECK_LDFLAGS-disassembler-init-styled += -liberty -lz -ldl
       endif
     endif
     $(call feature_check,disassembler-four-args)
@@ -1324,6 +1318,6 @@ endif
 
 # re-generate FEATURE-DUMP as we may have called feature_check, found out
 # extra libraries to add to LDFLAGS of some other test and then redo those
-# tests, see the block about libbfd, disassembler-four-args, for instance.
+# tests.
 $(shell rm -f $(FEATURE_DUMP_FILENAME))
 $(foreach feat,$(FEATURE_TESTS),$(shell echo "$(call feature_assign,$(feat))" >> $(FEATURE_DUMP_FILENAME)))

-- 
2.34.1


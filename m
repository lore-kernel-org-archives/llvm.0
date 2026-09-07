Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B7844CF52
	for <llvm@lists.linux.dev>; Mon,  7 Sep 2026 10:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777485; cv=none; b=Oa3VIzU/eD7KV6ifDYrGHUTGZEEyukF0zylDC+MY9/x7DYoVMAutjJPbywHyaNGlU2wEyNWZRr6wYi5WtfVj7UM3OvKyG8edIOfW2a38bOp3mTMTzXkbwwI5fafSWysrnLCAU+Wu4ctNaYURRXPRtwibRfJcG5+wU86O0nxmEj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777485; c=relaxed/simple;
	bh=QmR/Yx3GrmMipQLhapvopexweDGgNDUHESy75coOzxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dNn5rzAD6c44V2NqOuX/19ebcfdFRFz+I+IJnwUv0pPJewHiB5Hzww8v+9+TKZ6C8f9PsBBltwtxzxnJhVh75Esftnd6K9Mu7cByn8wOxpIdDQwytKFJMMSs6GUxUAIqbV/zyXWc2c4F2VTkwAofttWQBpuH295AKkuI5Nj6sy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyVA28XL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyVA28XL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so40871815e9.1
        for <llvm@lists.linux.dev>; Mon, 07 Sep 2026 03:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777481; x=1789382281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f3dNc7Al5lEDIZNoArJSIQ8XFdfYUdjRGc8JYGTevN8=;
        b=SyVA28XLJOlfWL4rNbV6clJXWRpqeXOAXzxCevdadubBuaSZLACCkyAo/Go9+LHDTO
         KcUJPR6Q2HG53BAlxeCUt2Z0qiAKLlx2+u4BQvZ/LX/lm+bRK2grdi4hu8N035sOKZyv
         j1W78ii2hWO5RfSgg1HNDRwTZ6tV3nxhye97MNa+PKZWcPimGdj82uUhTeBGjVqtMMf4
         RVLPK84cRDiA5cISIE2g+QorKnoawW4nXt/sVFgbSNRHt3zTa/I1Ot0SMsvQ/noGkSF6
         7mnwRgOiBWqBQYpgW3oeVcXk02SlBQ3ajqiweLvsFvwPRPv1JI611Mr5lupAwo3yS1X8
         RYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777481; x=1789382281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f3dNc7Al5lEDIZNoArJSIQ8XFdfYUdjRGc8JYGTevN8=;
        b=ElTQ/VLWGG/SiCnjEnk4WmXOXCc57WvxQpdk7Ae+Dbt4ZfIf8eeUfgn7IUF2XDZtzf
         A2QV+fEwQhXeFJVn5QeEq3dKepLAvUNFfm8wEDboN/qNxIfjC6S11H/6580aEF15/gxC
         KjZtuhwRidaA8Dy7SF4/af0ocqZtRMBbBVZrpJR4xbAAfxIgPcLfkZcf53Vs16Yf88cd
         Z3umn8yzsp/9sagPq3Twg7IEEvNhqvf1YD8JO8nRvjlIakXgoXL18s/yD/xaX4sSm+bD
         1M5kAOjaijtEc6p3i9k7UG4Fa36mt7adW9YUlIKN/Zdx2/ywok9MioIN0zXn4eXmjsF3
         iB/A==
X-Forwarded-Encrypted: i=1; AKwUvBzxia5DJOHwmmSoHS4cu+MpUlU64K42mU2LqKrMuxjPA0PZUXSq/IRuXMnbCCPVxikaI+gX@lists.linux.dev
X-Gm-Message-State: AFuF++nJxX2exJlP2xfwrNS2nmIcCx9dU+5FGuaD7AiRpxLP2/nVWhhW
	h36pgePPdNG8bsufRTpsu6mtlpskI65aC9DCIQpYtPBKgSKu4VU1vk+R
X-Gm-Gg: AYBFou2MBILKqknTBQ78JNFCnEI5RlM8nDuQykVLBSs/e1+3PQq6QnjnJt5h8RkGm2V
	xOhV1BZPWJrZy1dXJOAIXGwxg3e0swqH6KbvSchUZjPMS3IWVcpxT9TEhw9XLT6HVmCy66fSOeh
	G9qet8woDPW9HQgjpMNip+crx87vN4UwSVUpx3k0PM/fehx4/ENih8+36UpDLoMBHibYmtLTv1z
	r/a40pCzUZlFT5728vIDs4pIxDTUHVmtcmAB44eiaALqWuxPxFsWmMErPCUVX1FFiYFPrUXEHqv
	UPX3zsLilj0eLikS5IEES0VdoHjKtPmVupAs1TazYt/DwOnnKKZ0yI2mGLatt70tYEtt+9N3HHF
	6socYYUywmfz+sMdXPgIrnbB2zd2Yjqswx/3ymfsvwNKvpadg/w/kETKUoo2+YgPSBw0VM4zm98
	WuS9Un+85d7u3+d4Pf1xu10h9VnVzawmGrGQBqNhydP4Vxf0izErtKXHPHxl0wOWoAlizD5OMaw
	eI2kvGVS2h6EQWgsWewWU84eCWKPTXLinvzRwMrtxUvZZpK29f/oz4r/2X5sA==
X-Received: by 2002:a05:600d:8481:20b0:49c:fde6:8b39 with SMTP id 5b1f17b1804b1-49cfde68bacmr131347985e9.29.1788777481081;
        Mon, 07 Sep 2026 03:38:01 -0700 (PDT)
Received: from localhost.localdomain ([95.3.12.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm311944285e9.3.2026.09.07.03.37.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 03:38:00 -0700 (PDT)
From: Erkan Erdem <hexvalid@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Erkan Erdem <hexvalid@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	llvm@lists.linux.dev
Subject: [PATCH v2] docs: kconfig: fix shell function syntax in caveats
Date: Mon,  7 Sep 2026 13:37:37 +0300
Message-ID: <20260907103739.23212-1-hexvalid@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kconfig separates a function name from its arguments with a comma, but
the caveats section uses Make-style whitespace in its shell calls.
These expressions expand as undefined variables rather than invoking
the shell function, so the supposedly working CC_HAS_ENDIAN_FLAG
example fails to parse.

Add the missing commas to the shell calls in this section. Keep the
Make examples unchanged.

Fixes: 316d55d55f49 ("Documentation: kconfig: document a new Kconfig macro language")
Assisted-by: LLM
Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
---

Changes in v2, addressing Julian Braha's review:
- Remove whitespace after the comma in the three remaining shell calls.

v1: https://lore.kernel.org/all/20260905124045.42713-1-hexvalid@gmail.com/

The issue, patch and changelog were prepared with an AI coding assistant.
The assistant also prepared the v2 revision and ran the checks below.

Validation:
- Re-ran the documented working CC_HAS_ENDIAN_FLAG example using the
  Kconfig conf tool built with Clang on macOS. With a test helper returning
  y for either endian flag, the original example fails to parse; v2
  executes both probes and sets CC_HAS_ENDIAN_FLAG=y for both endiannesses.
- Rebuilt the changed page alone with Sphinx, treating warnings as errors.
- The complete kernel documentation set and kernel were not built.

 Documentation/kbuild/kconfig-macro-language.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/kbuild/kconfig-macro-language.rst b/Documentation/kbuild/kconfig-macro-language.rst
index 6163467f6..c427bece3 100644
--- a/Documentation/kbuild/kconfig-macro-language.rst
+++ b/Documentation/kbuild/kconfig-macro-language.rst
@@ -225,7 +225,7 @@ not work::
             $(MY_TYPE) "foo"
             default y
 
-Obviously from the design, $(shell command) is expanded in the textual
+Obviously from the design, $(shell,command) is expanded in the textual
 substitution phase. You cannot pass symbols to the 'shell' function.
 
 The following does not work as expected::
@@ -236,12 +236,12 @@ The following does not work as expected::
             default "-mlittle-endian" if CPU_LITTLE_ENDIAN
 
     config CC_HAS_ENDIAN_FLAG
-            def_bool $(shell $(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)
+            def_bool $(shell,$(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)
 
 Instead, you can do like follows so that any function call is statically
 expanded::
 
     config CC_HAS_ENDIAN_FLAG
             bool
-            default $(shell $(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
-            default $(shell $(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN
+            default $(shell,$(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
+            default $(shell,$(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
-- 
2.50.1 (Apple Git-155)


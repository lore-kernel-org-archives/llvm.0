Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A7341A506
	for <llvm@lists.linux.dev>; Mon,  3 Aug 2026 17:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776928; cv=none; b=W92dU2TM4CpyonKzqpyUzGEeSzKGG/whFEbq+SKgifT3YDi0UZSWQgKy4fe2Sexj6vRpUrnZ8qV1s+e/2kdM2maV43mttUgq9oygqyReOrWjSfN04qiJtXwn9Kh0xyDNaRImxLiYllMIxUjrXKhgZEVp9cjqZy5y7S9iDxJNIhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776928; c=relaxed/simple;
	bh=Qrbmd/gCZNU62r1uQY3MotPz1q+A9zHKQVoWcbXVOqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0pwWNnkCMQ8xTpGMxTSh5P6aRN1odg+4yQ6HW4ULM1C0AscxnJucEYWtbjOhkupWLZTHyvaK3snNS9nTsiE5fhFUuSOH9f3QZHbKOlSCZYN2JfxKv+R2P5D3C5zjSeoENK8Lf0XLiA0c51TjK+N77hfqvuBbGy8zOINh0sIjOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzZCl6+d; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzZCl6+d"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81fc442789cso51932277b3.3
        for <llvm@lists.linux.dev>; Mon, 03 Aug 2026 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785776926; x=1786381726; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJzW7hnofVRsOBFScVAMkX7aHP57H8tmiAZvV6aeuF0=;
        b=IzZCl6+dm4bZKD9IpvnEPjCU78kDsnnqz46wAeDorwEmnuUlxH/jyeyh2K6k7LrwQw
         b/eKw3OS2G50k3RQREdMOtVpA4NeVE5b4+Yux7PHzJszGiI19n/Dp2L2iSL9aXnptcq0
         XD7Zl5n5L2bvwulSBpKJk1FJvkmKWMjGys0nsyAxJn7D6FCD318P1NQTF+qtUfF8ZZfE
         9v1/aWTHrCcdzB9k61Rtu+3CQXBWfrtntA+h73tLp2wV/+52VBxR55HPJ3l/L6+lBq2T
         j8BsjybTWHCtHMZRqVqxnFjwWwI9GXdrGu8oAYLnWR7P+Ce1d2g7iN2Ccw3nHNxtFex0
         8gXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785776926; x=1786381726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJzW7hnofVRsOBFScVAMkX7aHP57H8tmiAZvV6aeuF0=;
        b=SanDmkRfy3hJubJjN4hDpZH/oumE5I3Z9CKENRWsjSTwLyhHtJjrFUJ3sfjkncL//G
         xZGcHCZAcv72WIUdSt1BgpEboyodhrQqd22/hDci2mSfQF6+lIyCuIsq0fUKSHv1kZJO
         ppET1lBMMK/5cCd+xgZrrJzycFQssRGp35deBCUlbvoXanAio9v9HXiZLnzU4gYFAxkO
         Tb99Qo2AyuMuN0LsTpKDS+536OcVo1JBFD+fnQC9u5fHM6WxCjYcJDFB/z1VuV3hS3sc
         huT9p9lQn0Kt2OFYFpWP4pNkNduH9FzundT/ktK0VWh3xbYA0htNZdW6MACxSFtgIAs0
         VQYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGDtDgN3ihBLnqiR/Yzr9ZvoTDaHCbb+/dUQCShpkh+RKF3NvYo12lHVHOKMiIgpSHv/GW@lists.linux.dev
X-Gm-Message-State: AOJu0Yya1pqqxSiQMBjGLOxaHnX/IZgMayRGmVtU4EQOSRBOVYTgr7UO
	QQr58aymR3E3824OpofHfuNzSymuGCTDs3slgCz3oY5Lrxz/04hNRXRQ83WVZOuq4Xc=
X-Gm-Gg: AR+sD10pxiqQkLqZ40lXUjfj6GwQxL7xUyJ+AvsZv1zVjsFo77aDM5HifnK3kGiZvGL
	qrNVUOaSaeakNT+fYhl4Y3EADGAa1jQXKXqWr++qkZl5+VJYhRaoApDjNt6hHFzcx0mN7rPCzXS
	OEct8mJvYP0LSn+8zyEqlfqJLHCY0CRU7t8TiBlIEm2vIYqzRokwoAkPACbl5OSvYMaMyCEBxcp
	ylqI2yyaaVkwOSQohjgIHEHwo82FinhLzGbLieabIl+1h6tcrq5Py90lTUMlD5YTz/WItaUIEIn
	boRcRYCxRzl2qWE9Q6YeysVAFn9Hzf9G9PGhpsBd08+2xsq1H+VL91uxyrlUBA+7AzXzI378WOu
	z/CRW3rD/kxl7mdL+GemOK6PZYoLt2yqh63BzQT0gNk/wJEAoRGTKYw2L3v5SSa1mDS7Wr4nzEm
	DBHwRS9HYQgRfYP+CPzq7PPqdxrhrBlkRFsJouNYINmnXg6MUKbKYjHZF+GqSw
X-Received: by 2002:a05:690c:6081:b0:81f:2403:9e70 with SMTP id 00721157ae682-81fd4b4af48mr139827077b3.19.1785776925809;
        Mon, 03 Aug 2026 10:08:45 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2cae7sm58991847b3.2.2026.08.03.10.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:08:44 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 03 Aug 2026 13:08:41 -0400
Subject: [PATCH 1/2] alpha: enable building with clang
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-alpha-clang-v1-1-1c4ba5ba7a64@gmail.com>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
In-Reply-To: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Qrbmd/gCZNU62r1uQY3MotPz1q+A9zHKQVoWcbXVOqI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIKTkuu6PPRZIy51x96/X9GXXfd2znlU/aZKLQkChXzc
 B9zzFrY8ZGFQYyLYaaYIkvcekWWWW07lvqclv4FM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RvEQOT0Gjczi4tLUIt20giKHvPySxJLM/LxivfyC1LyC9AK9tMy0koyM/KLiVKARenmpJaa
 ujm5GhgYmlo4WZk4WjqYmzs5Ohk5ujo7Ork5GluYmBs6WjiauluYMXJwCMNfYr2Jk+C8svOPN2t
 7wRraza+7dM7J6Wb2/wvS0r3jnnVU7QiIa1zMyzNsQlhUdOkU04/SaLevnVV10vuDx/+uGPy77d
 3kbdfFs5wIA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register the clang target triple for alpha, and pass -Wa,-mev6 only when
building with gcc.  That flag exists to stop gas emulating instructions
the assembler thinks the target lacks; it is a gas-only option, and
clang's integrated assembler does not emulate instructions in the first
place, so nothing is needed there.

With this, LLVM=1 (and LLVM_IAS=1) builds work.  Note that the alpha
backend is not in upstream LLVM yet; it lives in

  https://github.com/alphalinux-org/llvm-project

and is a work in progress.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Makefile    | 8 +++++++-
 scripts/Makefile.clang | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 35445ff2e489..54283705911f 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -27,10 +27,16 @@ cpuflags-$(CONFIG_ALPHA_GENERIC)	:= -mcpu=ev56 -mtune=ev6
 cflags-y				+= $(cpuflags-y)
 
 
+KBUILD_CFLAGS += $(cflags-y)
+
 # For TSUNAMI, we must have the assembler not emulate our instructions.
 # The same is true for IRONGATE, POLARIS, PYXIS.
 # BWX is most important, but we don't really want any emulation ever.
-KBUILD_CFLAGS += $(cflags-y) -Wa,-mev6
+# Only gas emulates instructions the target does not implement, and only gas
+# understands -mev6; clang's integrated assembler never emulates.
+ifdef CONFIG_CC_IS_GCC
+KBUILD_CFLAGS += -Wa,-mev6
+endif
 
 libs-y				+= arch/alpha/lib/
 
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index b67636b28c35..2434cf90ad7e 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -1,6 +1,7 @@
 # Individual arch/{arch}/Makefiles should use -EL/-EB to set intended
 # endianness and -m32/-m64 to set word size based on Kconfigs instead of
 # relying on the target triple.
+CLANG_TARGET_FLAGS_alpha	:= alpha-linux-gnu
 CLANG_TARGET_FLAGS_arm		:= arm-linux-gnueabi
 CLANG_TARGET_FLAGS_arm64	:= aarch64-linux-gnu
 CLANG_TARGET_FLAGS_hexagon	:= hexagon-linux-musl

-- 
2.54.0


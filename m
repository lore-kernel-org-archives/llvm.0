Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49990C149
	for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 20:09:32 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b74310566cso76048951fa.2
        for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 13:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689624570; x=1692216570;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fsEmnlMQPV7Fd5Yb95V67Si+MXxbwtnWXXY+l8DoZjo=;
        b=oU8+D8GDnhaYzrA3Gni30BP/qU8SrINxACQ2xyNa2rCPhDarYG6/fs0siRXa7Yt3PV
         iCyVbNVcrozP4u8EFEcAg+09B0olC7CHYG934H1hwyjUeRNrLwkmp8/OuY9FNy9NAbp1
         FMXEZN+i9gLzShxOnTsCe6kVn/umg1f018FckZswUEtS0O4nw4aQPCktqgRHzLAA744W
         LwcfjeglrvrD3vm1OrdNttY3W+mTlyGYYRzBYxG+PQjZKjOUr6Cc3OZT4Vd0Bb3/8dCz
         NGhT0KCo3KGAJWzvKf1CNnZ+EX50bR+FUUrklTjSDd2c1tYa3Dw+CRg1MOM7UtbKaylZ
         rFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689624570; x=1692216570;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsEmnlMQPV7Fd5Yb95V67Si+MXxbwtnWXXY+l8DoZjo=;
        b=ZQ0PY7DAY47s++AEh0luVo9dXNX4jSRWVk2pigTCRAPqKdQDF/Ugmo4HFA9Wt/dkW5
         6+clY9gP95CHRb8q3PgiVjaxRq4mF1xkxXBpAeH3GDnV2EmsEJdcOdj9VUri09+Y++2c
         AKMteUIbXGTs46i0pJSQ/YSLmOSngxORKZaYTB4St/AJIqXKWEyb5BaeGTCUBgo3qmqb
         IB25d3aURv9hbNn80Hb0dkabSLpAGCEQXGU1kc7XPJTGdugPZzeS/Zik33Jvdd8L/c00
         yVnLMC6sybmKhqmhg64gmtO8rN6nWE9O/8PasDWNKbj3mEPN6b4CK2wCZTtCEUW0ZTYx
         OUVg==
X-Gm-Message-State: ABy/qLaGsbne4NfmP/zW1F4Oqyvojf/2u3om7AWhNtCXsFDzuf2whMl5
	s62SQsyZrudbIv8PMWwPCIA=
X-Google-Smtp-Source: APBJJlG4Iajle0ADfReJ6a6LzBxYlP+ylGGcYu7WnAvf/t4pEnz9ZPb9/BH2HQh4Y1B+3pu7dT3axw==
X-Received: by 2002:a2e:3815:0:b0:2b5:1b80:264b with SMTP id f21-20020a2e3815000000b002b51b80264bmr9195833lja.12.1689624569720;
        Mon, 17 Jul 2023 13:09:29 -0700 (PDT)
Received: from [127.0.1.1] (i130160.upc-i.chello.nl. [62.195.130.160])
        by smtp.googlemail.com with ESMTPSA id k13-20020a17090627cd00b00997bd42d210sm84505ejc.205.2023.07.17.13.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 13:09:29 -0700 (PDT)
From: Jakob Koschel <jkl820.git@gmail.com>
Date: Mon, 17 Jul 2023 22:09:27 +0200
Subject: [PATCH] arch: enable HAS_LTO_CLANG with KASAN and KCOV
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-enable-kasan-lto1-v1-1-471e706a5c4e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPaftWQC/x2N0QqDMAwAf0XyvIDttIX9ythDWrMZ5upIRAbiv
 1v3eBzHbWCswga3ZgPlVUzmUsFdGsgjlRejDJXBt/7aRheRC6WJ8U1GBadldhj6EPsux+A7B7V
 LZIxJqeTxLD9kC+spvspP+f1n98e+H8rPhil8AAAA
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Jakob Koschel <jkl820.git@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689624569; l=1432;
 i=jkl820.git@gmail.com; s=20230112; h=from:subject:message-id;
 bh=YFPsm2kVtfSehCpbATGIVArV8bDH64E2Vvok0+5hopA=;
 b=f2qpVn5s2uyo2Brz2l2WY4ke7LkrHMJbyfhfiM/vAB+BSOVaVwuPJ0E5UsQdQLmCVh1SYToKlh2c
 KC/RmFLDBl0SrGQFOjU8UpzkDGc9D1JNpy4hRr+hcAPu7GBADIRq
X-Developer-Key: i=jkl820.git@gmail.com; a=ed25519;
 pk=rcRpP90oZXet9udPj+2yOibfz31aYv8tpf0+ZYOQhyA=

Both KASAN and KCOV had issues with LTO_CLANG if DEBUG_INFO is enabled.
With LTO inlinable function calls are required to have debug info if
they are inlined into a function that has debug info.

Starting with LLVM 17 this will be fixed ([1],[2]) and enabling LTO with
KASAN/KCOV and DEBUG_INFO doesn't cause linker errors anymore.

Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
Link: https://github.com/llvm/llvm-project/commit/913f7e93dac67ecff47bade862ba42f27cb68ca9
Link: https://github.com/llvm/llvm-project/commit/4a8b1249306ff11f229320abdeadf0c215a00400
---
 arch/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index aff2746c8af2..61263ff92271 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -745,7 +745,8 @@ config HAS_LTO_CLANG
 	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
 	depends on ARCH_SUPPORTS_LTO_CLANG
 	depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT
-	depends on !KASAN || KASAN_HW_TAGS
+	depends on (!KASAN || KASAN_HW_TAGS || CLANG_VERSION >= 170000) || !DEBUG_INFO
+	depends on (!KCOV || CLANG_VERSION >= 170000) || !DEBUG_INFO
 	depends on !GCOV_KERNEL
 	help
 	  The compiler and Kconfig options support building with Clang's

---
base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
change-id: 20230717-enable-kasan-lto1-656754c76241

Best regards,
-- 
Jakob Koschel <jkl820.git@gmail.com>


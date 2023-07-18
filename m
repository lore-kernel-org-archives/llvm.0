Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AA71772E
	for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 22:29:53 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-51e29ede885so8849149a12.3
        for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689719392; x=1692311392;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8VIhdcMpL3OFo2a4tlXJdj92DrXjZBW6xzKr5orA7Nw=;
        b=jw0dVdjMax3BvwEwSbtcyxlHSq7ibIqrGOYAz10EKUBvJg2NIWpMZ8FzMjnDioKQtA
         K3adS4O3FNzhc7q74C1Ylfj4c3EAHN5lkJpI88uROj8EyuLj51rviB6wrcSQs/lS1SVa
         BI2liP5S6A3r5ZTnQKcxb2hGFnJsDMf8Qeqka8T+c6xWokXdZ/CEiyaEqrcb4VyiXmPy
         Hr8gc0cfqH2OBg14qDBNVJ1M4Rvrm2+0cB+OKJI2HIZjliSlQaUMfZdeh2mxojAadRu2
         SOpzZH2/4jCSOG/aeX1eG/jAdY8EQ9nqsS8qsUmXQV9I3XmlYIsF/DgPYBqVaGwNV+Ao
         ADpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689719392; x=1692311392;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VIhdcMpL3OFo2a4tlXJdj92DrXjZBW6xzKr5orA7Nw=;
        b=erV0n1E2ZpjH2AULyr3yWawgBOLLckr7KKPJ667qthYarVFe692R9ui2n+MIWybJH7
         tYc1xpIZzIl/h+M3VlrMrQ7EpPFVcrmhovuLkfepfzDXcI8Ohzx5Kd3ZykVFXBTiCmIf
         HDklDK7L+ezbeJfK3EHo+vZeiBcB9yzOrJLXzmGg/gWGODvGAL0cvtYSINYe7wTNFVyz
         uzTFVaHlTncjU1S83m++IcJ/KntnSiLs+qDCCquaTL80iNqYhBWEgFEwC9VNXvjULTsE
         m9d4G9KqVe/AOfzoHgFnwnWNw2Tmxry1t4CyPe7ZVYOPRgYY1vA36MCK0ZMlO3HAO+UE
         RezQ==
X-Gm-Message-State: ABy/qLZ0Vx0bUlomTuV0OxDs2FRHofymXoK7r90RCfkPRYdTxYxZfT6U
	dgcZ/cRuy/TdRxARPwFUs8o=
X-Google-Smtp-Source: APBJJlEWSgvrZAXxa7UB21BD8PlvxNa6Apa8NnlR500y3VVHGXmSmsK2ydkxanRynvQhpW0NAg+dMQ==
X-Received: by 2002:aa7:da8b:0:b0:51e:1656:bb24 with SMTP id q11-20020aa7da8b000000b0051e1656bb24mr745846eds.26.1689719391936;
        Tue, 18 Jul 2023 15:29:51 -0700 (PDT)
Received: from [127.0.1.1] (i130160.upc-i.chello.nl. [62.195.130.160])
        by smtp.googlemail.com with ESMTPSA id u18-20020aa7d992000000b0051e0cb4692esm1780052eds.17.2023.07.18.15.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 15:29:51 -0700 (PDT)
From: Jakob Koschel <jkl820.git@gmail.com>
Date: Wed, 19 Jul 2023 00:29:12 +0200
Subject: [PATCH v3] arch: enable HAS_LTO_CLANG with KASAN and KCOV
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-enable-kasan-lto1-v3-1-650e1efc19d1@gmail.com>
X-B4-Tracking: v=1; b=H4sIADcSt2QC/4WNzQ7CIBAGX8VwFlMoP8aT72E8LHTbElsw0BBN0
 3cXevKkx9nNN7OShNFhIpfDSiJml1zwBdrjgdgR/IDUdYUJb3jbaKYpejAT0gck8HRaAqNKKi2
 F1YoLRsrOQEJqIng71uUMacFYH8+IvXvtsdu98OjSEuJ7b2dWr78ymVFGhWaoGwXSCrwOM7jpZ
 MNMqi3zvwZeDJ3Qpmdn3kurvg3btn0Af1R3Cw0BAAA=
To: Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Jakob Koschel <jkl820.git@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689719391; l=1907;
 i=jkl820.git@gmail.com; s=20230112; h=from:subject:message-id;
 bh=I+sb36igQn+GpB0emVVoNUcTZ3UMX+hG00en86PNo7o=;
 b=fJm2OMmevpnG6ytoTYSNd/n9qkyTEvMegdlh3D8x3hje5iBEYR9yBubywlQEVQioqUbi7GpfVjMd
 4QqoGy4CDAHWXa2GO8Z4w0Ljne1MId00NsnBBiQEBkM5NLpx+Wwe
X-Developer-Key: i=jkl820.git@gmail.com; a=ed25519;
 pk=rcRpP90oZXet9udPj+2yOibfz31aYv8tpf0+ZYOQhyA=

Both KASAN and KCOV had issues with LTO_CLANG if DEBUG_INFO is enabled.
With LTO inlinable function calls are required to have debug info if
they are inlined into a function that has debug info.

Starting with LLVM 17 this will be fixed ([1],[2]) and enabling LTO with
KASAN/KCOV and DEBUG_INFO doesn't cause linker errors anymore.

Link: https://github.com/llvm/llvm-project/commit/913f7e93dac67ecff47bade862ba42f27cb68ca9
Link: https://github.com/llvm/llvm-project/commit/4a8b1249306ff11f229320abdeadf0c215a00400
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
---
Changes in v3:
- Fixed the comment linking to the Github issue
- Link to v2: https://lore.kernel.org/r/20230717-enable-kasan-lto1-v2-1-d47bf182f5c6@gmail.com

Changes in v2:
- Added correct To:/Cc:
- Added comment about required LLVM 17 version dependency
- Link to v1: https://lore.kernel.org/r/20230717-enable-kasan-lto1-v1-1-471e706a5c4e@gmail.com
---
 arch/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index aff2746c8af2..847b52495656 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -745,7 +745,9 @@ config HAS_LTO_CLANG
 	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
 	depends on ARCH_SUPPORTS_LTO_CLANG
 	depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT
-	depends on !KASAN || KASAN_HW_TAGS
+	# https://github.com/ClangBuiltLinux/linux/issues/1721
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


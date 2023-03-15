Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC757460
	for <llvm@lists.linux.dev>; Wed, 15 Mar 2023 21:41:04 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id g5-20020a25a485000000b009419f64f6afso21754190ybi.2
        for <llvm@lists.linux.dev>; Wed, 15 Mar 2023 14:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678916463;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1hKyjwDWdKCL/Wlt0NC0zQ5DwmLIV6PvEhmjPxkamzQ=;
        b=BH5D3WNh7FOlMGAbu+ySIPi6YQWbT8oBK8zLsmSP+rmu2DvuG62Tt/ke6kp7CvNL3h
         g3WnnTr+B3hZ2NINTxArsVA7JSxhgaT/vpZMUXuj75omDHfbFWFyrji+5V7PCQPXcpuC
         0qfiPDxk5jlXZZ/iO9yKfO0NJDF64FMJizMOjxtbLUALrhAn8uXYgz5tcTrbi4TPRqSv
         uU91XO7NvW6haisG0X8N4w/9gEBa3B6f1/33R8wJjBiXIqZmmks+MvAmImX5+BZdXER6
         65AtnwzpS2itPU+8XjxH8JSrV+O13vmff0c/rCWlIGVxTKo497WokjudpL23BYEe/6Rl
         mFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678916463;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1hKyjwDWdKCL/Wlt0NC0zQ5DwmLIV6PvEhmjPxkamzQ=;
        b=pwmFJfB1KpC56L/TX0mLznUzywbwEtG0uunbzCWeVjPBVVa4sn3xEwlSSv1P0vho/z
         aald2B6/PUsXSA/wHSanRz2VXZOfmuX1lZiAxc9+ILC+ckK43opkYMF6ROT6lQlx0ypr
         ljGlRWKHEO2jvOjnjvf6B7Hd0yV0YQ9vZZn32HcbT7uWIniLLeG9p4aWo+4GV7d6lrr9
         ij1/00k94sznpoLOtp7mlW9hhXcxCbKk09Cj7Fj6gvs/ayP2LlW5zuvTKy0QFox9FNjC
         M282jCO2NTwJk6Rs7dbvYrbMvPAAiLUMeXFsQH7P9JiWl+IVj8DhPm4xzNF7L79uDOVy
         Y04w==
X-Gm-Message-State: AO0yUKXvB0t/evrO8kW5WBPui+rAQNPeSQF8E7munxoiJsK+Q5OdkO44
	e14oYL+7ATte+C51IJzT8nxQVPMfyH2NhYIpgSk=
X-Google-Smtp-Source: AK7set8PN3SZYYp+m1YrU/xTSFknmYctxBmpJQQ0LLgLQnvrFLo3VQHMCStJM9TDPSuv2GR8CbJUBRZa2ybaT3QivbU=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:a5cc:f0f5:1fc6:713])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6902:d2:b0:a8f:a6cc:9657 with
 SMTP id i18-20020a05690200d200b00a8fa6cc9657mr21963805ybs.7.1678916463697;
 Wed, 15 Mar 2023 14:41:03 -0700 (PDT)
Date: Wed, 15 Mar 2023 14:40:59 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230315214059.395939-1-ndesaulniers@google.com>
Subject: [PATCH] Makefile: use -gdwarf-{4|5} for assembler for DEBUG_INFO_DWARF{4|5}
From: Nick Desaulniers <ndesaulniers@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sashal@kernel.org, stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

This is _not_ an upstream commit and just for 5.15.y only. It is based
on upstream
commit 32ef9e5054ec ("Makefile.debug: re-enable debug info for .S files").

When the user has chosen not to use their compiler's implicit default
DWARF version (which changes over time) via selecting
- CONFIG_DEBUG_INFO_DWARF4 or
- CONFIG_DEBUG_INFO_DWARF5
we need to tell the compiler this for Asm sources as well as C sources.
(We use the compiler to drive assembler jobs in kbuild, since most asm
needs to be preprocessed first).  Otherwise, we will get object files
built from Asm sources with the compiler's implicit default DWARF
version.

For example, selecting CONFIG_DEBUG_INFO_DWARF4 would produce a DWARFv5
vmlinux, since it was a mix of DWARFv4 object files from C sources and
DWARFv5 object files from Asm sources when using Clang as the assembler
(ex. `make LLVM=1`).

Fixes: 0ee2f0567a56 ("Makefile.debug: re-enable debug info for .S files")
Reported-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index a7b664680ea3..88b2b13bf35b 100644
--- a/Makefile
+++ b/Makefile
@@ -888,6 +888,7 @@ ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
 DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
+KBUILD_AFLAGS	+= -gdwarf-$(dwarf-version-y)
 endif
 
 ifdef CONFIG_DEBUG_INFO_REDUCED
-- 
2.40.0.rc1.284.g88254d51c5-goog


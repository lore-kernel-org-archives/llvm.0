Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9AE29CA
	for <llvm@lists.linux.dev>; Tue,  5 Oct 2021 12:37:06 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id pi19-20020a17090b1e5300b0019fdd3557d3so2339429pjb.5
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 05:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lVPH4TZHAxvSTCltWyDXdeo1ZxDBlOyPU18BgDEONOg=;
        b=udMMTi/ssJDcJsFoHtRX8AG0xQfsjCJQ0ENBji1xTFvR5lMruvSPrsX2ngejyocisw
         JxeWqaK0nCvpsbIYa/ypNM40WsczDbsNGvwgTZyprgpjqpJGwscXbkQFSkErpxAEti9o
         Ee8RSrt4D8PS3vcFhRx6y8dLBpPPrkmQzNyaCR/+OY7iBCzoeVboKN2FiNUJpy03NIA4
         Y39693spgVic67In4EPGb6tdQB9gfSRgpefa/UF/3Ydxd/oRrYMkcndDOSoSCTqnnNBf
         7NqMBzMjfd68E99WPaMETOtw2IiXbG3/CyRPobuTijAHqRu8WSnC38QjP6ZtIdP8n48B
         0fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lVPH4TZHAxvSTCltWyDXdeo1ZxDBlOyPU18BgDEONOg=;
        b=cIy8eaoJhLd0uzzGu1DgksUg5rZXbBSRN6SmANsv2eWrCrDnzNu1vt2jXLh1Mpk2/I
         Ai+HqkmkOljmlywfYMd8y6JeoALBjRAPjZ+sYz7mY5KZ3TlPxX7bcuUuYHlzFmwqVmNt
         unVsHEPXp2sPpuUpHxxtgC42Y7Cc1dllBFsghdRqn4lO7/1JxLz1Znkh0yTmkuWryMn0
         ML6QRsXKa/fuY/ZrG0r5O5XgQQik+ZH+o9Ls+Xn0FAVRGYAe04iLIKuQqShSUOqYP3KS
         DdeHa4v934mLCOGccxWMP19YL87uuHgon1DK1jjzR/M3rXnhhgf047XcH/M/Sup3eiv8
         3ELw==
X-Gm-Message-State: AOAM530KU2D+7lfUv0kVw9h+zszIhy+SHOyR9zuggYxODRU5BnLlP4k9
	c4Q+FbtAUooxaCh08sxpLQYhqQ==
X-Google-Smtp-Source: ABdhPJwaElTGd3gRHuAw77hTTZtY+xP98SrG7ozv3yojilY71WaGsAS1I9GSJJwRAWWgIH1iWurHrA==
X-Received: by 2002:a17:90b:4b85:: with SMTP id lr5mr3580224pjb.66.1633437425769;
        Tue, 05 Oct 2021 05:37:05 -0700 (PDT)
Received: from localhost.localdomain ([223.178.212.101])
        by smtp.gmail.com with ESMTPSA id p13sm2038736pjb.44.2021.10.05.05.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 05:37:05 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-kernel@lists.infradead.org
Cc: rostedt@goodmis.org,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	samitolvanen@google.com,
	ben.dai@unisoc.com,
	mark.rutland@arm.com,
	nathan@kernel.org,
	keescook@chromium.org,
	ndesaulniers@google.com,
	daniel.thompson@linaro.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2] arm64: ftrace: use function_nocfi for _mcount as well
Date: Tue,  5 Oct 2021 18:06:45 +0530
Message-Id: <20211005123645.2766258-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 800618f955a9 ("arm64: ftrace: use function_nocfi for ftrace_call")
only fixed address of ftrace_call but address of _mcount needs to be
fixed as well. Use function_nocfi() to get the actual address of _mcount
function as with CONFIG_CFI_CLANG, the compiler replaces function pointers
with jump table addresses which breaks dynamic ftrace as the address of
_mcount is replaced with the address of _mcount.cfi_jt.

This problem won't apply where the toolchain implements
-fpatchable-function-entry as we'll use that in preference to regular -pg,
i.e. this won't show up with recent versions of clang.

Fixes: 9186ad8e66bab6a1 ("arm64: allow CONFIG_CFI_CLANG to be selected")
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---

Changes in v2:
- Added fixes tag.
- Extended commit description.
- Picked up Mark's ack.

 arch/arm64/include/asm/ftrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index 91fa4baa1a93..347b0cc68f07 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -15,7 +15,7 @@
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 #define ARCH_SUPPORTS_FTRACE_OPS 1
 #else
-#define MCOUNT_ADDR		((unsigned long)_mcount)
+#define MCOUNT_ADDR		((unsigned long)function_nocfi(_mcount))
 #endif
 
 /* The BL at the callsite's adjusted rec->ip */
-- 
2.17.1


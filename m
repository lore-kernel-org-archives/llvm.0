Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF62C85
	for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 12:51:39 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id f21so2501375plb.3
        for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfUZzwiLi5+SzReakJZopKh7Hr/7mT1olQHJVB0Sy/c=;
        b=XWik9ZjFOk/4LLMhsIRzlkjZAquZ5m7H8NaN5TMttt2vSZ3pq5pP3OZSf38j4YwHdI
         gjCeW9qYzgChbzQJD9+vA0aSFs6YXFrhxrd3rqnlmxR1GizzkXt+sM6zVBqjusLxYRlr
         oFCzJgZAGDR9YcUHlYmAWE+g+tAvAYJLMaPtkzylAJKuHQx0t9Nuf4vsRqWEWd36cLnk
         XPHOioohb1gNaWDDI5dDzjmVakYn8I6bGgwP5i3OdDKygO0wd1y5RikGTYGx9HuCBdMB
         EBIUYsbYxRCw9vpRoOvuU0Q8E7rX/J7r0WSXj9YUU4GRvKs5uaKHa3k30jMKryt0a4iH
         0BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfUZzwiLi5+SzReakJZopKh7Hr/7mT1olQHJVB0Sy/c=;
        b=QxmDRPaumVCfBOvbJQk63Y6q7AlUQNwVzCgCvPNA+STDRoTY4wCNn7cmLCEKh3SbLP
         jlx9kxVk+cxmXOl4hMuwF+aU/kpt4p1dPxUjAaa9I2vu6JW19bRVZzkjHGf8foOXlZs/
         SjZf4GxNjPqSY5ibByBm/gxa02MscItK7S0nTqj4JIGglRN1FFzqgKMqWSFNx8xbgN6i
         m3yU2YDWdgb3ovozaGe7pbihq5MC/6LUCxPsJaokmys5bFcYGZNu1ZStTTNj9Wf+FpfQ
         jk9MV0vjkg70tRZrT77ud0hEyHDn2MdEU9xLT8Q/IFWrHSI9gJ1E2lKdquOQpsSuNxGs
         vz3w==
X-Gm-Message-State: AOAM531wAHe2zvHKCanRMaCJ41L+4436gke0pVout5z93lXrjoTLs+rm
	0r+DoN9d3J0sSwc1ASmyPV0oqw==
X-Google-Smtp-Source: ABdhPJxFZ3ep63oEgxhyrB2JHoxuFpBAlBufBPTktok4aRDzrFgs5FckkIkLnYlFxBevJSyHzNRdhw==
X-Received: by 2002:a17:90a:b78d:: with SMTP id m13mr30587060pjr.17.1633956699007;
        Mon, 11 Oct 2021 05:51:39 -0700 (PDT)
Received: from localhost.localdomain ([223.178.212.208])
        by smtp.gmail.com with ESMTPSA id y18sm7734194pff.184.2021.10.11.05.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 05:51:38 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: will@kernel.org,
	catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	rostedt@goodmis.org,
	mingo@redhat.com,
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
Subject: [PATCH v3] arm64: ftrace: use function_nocfi for _mcount as well
Date: Mon, 11 Oct 2021 18:20:59 +0530
Message-Id: <20211011125059.3378646-1-sumit.garg@linaro.org>
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

With mainline, this won't be a problem since by default
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y with Clang >= 10 as it supports
-fpatchable-function-entry and CFI requires Clang 12 but for consistency
we should add function_nocfi() for _mcount as well.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
---

Changes in v3:
- Droped fixes tag as it isn't critical.
- Modified commit description in order to make this change for consistency.
- Picked up Sami's review tag.

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


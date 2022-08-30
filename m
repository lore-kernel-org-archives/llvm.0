Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB6D612E
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 23:32:06 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-33e1114437fso190875197b3.19
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 16:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=Y90TqhxNMQ3gAHq7V3hOpDRusm/1brSg9ZJSv3Zo0sc=;
        b=Blk28reIZWBLJmUJEULQ6cuj0seeXr4Ly6Sjc4PdA9VqIS72GbhwKOIthbX7BP3K3N
         tl4uHkaui0bFxUYD4FxnerwhmSOCRt/3a5W1nVSjTlFE5S9qQOnfSjeD+biC1n8T6oWx
         CbxEnNYofTItTkZMU/h5o8yWHwX6NcU2n8rdEECLrsQyc3xbtJG9RGHbiTbkD697AH8p
         0p/VCT7qeOFCYjRLbLS2or7mI2M+S72Ny0hSJDqI1Jl/Ry3Vw2Yi8g5rHuOMRQOIZqJZ
         nOcvTxSxdnqYA5nfuy9wwQ1/vdS+DuiGOCwB1maldh3NXrXpJxv/SHt8HLHfTqiMuZE9
         kaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=Y90TqhxNMQ3gAHq7V3hOpDRusm/1brSg9ZJSv3Zo0sc=;
        b=b4muC2CpAPU7GNHV0rw93nFuhEF78FW7U3ZGWrATZ2QjZ+0M2AiSokHvCr/JBy4xbF
         r18t9PDAJZoR24Df1/R1j3XfPlHaiLO1F7gxopw+Z6FSVCBy5/tBEQDXdYWAivM3DNHd
         nPuLTukzFWSjDEGTx5p0PL2oHVVhOcCFBHmk7LqXhXS6/el6jaBx/8SRQqindmA5zVKE
         Pdet7rl/x6UsE1ngaw/hvOVJ71upPkZaHTole6ITrUTGxGGVaDrysERgxVBJfXo2u5Px
         MIjDZ+OKjpfNRKN7fmKZOlzRy6Q4X6DNSiuYczCFE1SUgIn2ilgmvqz6p5BmJgggtQI2
         zKxA==
X-Gm-Message-State: ACgBeo02rE92s0SmEVtrVsyJlTQmgW1Mb5rFUz3kQNn5bkXOdo4u3jpq
	Zk9cnmGAwVB+oT+S7B/GbWVz4NVEZVQEDbIp8HM=
X-Google-Smtp-Source: AA6agR5tejixecrSXUwJgJfZQ1DGEkGMKK6rEqZH62aOV2J11oU/lyLTxrPa7Zxga3qsoA54O8Tc5Rriwx7flr+ROlg=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:54d9:7143:6a7d:91d])
 (user=samitolvanen job=sendgmr) by 2002:a0d:ea90:0:b0:33d:faad:db54 with SMTP
 id t138-20020a0dea90000000b0033dfaaddb54mr15764471ywe.116.1661902325870; Tue,
 30 Aug 2022 16:32:05 -0700 (PDT)
Date: Tue, 30 Aug 2022 16:31:20 -0700
In-Reply-To: <20220830233129.30610-1-samitolvanen@google.com>
Message-Id: <20220830233129.30610-13-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220830233129.30610-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; i=samitolvanen@google.com;
 h=from:subject; bh=gYeKGrEmE8r8WUfed/9NfQZCcqJiKdZ5mJNzlRspFgQ=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjDp3NYIHeCmDy6N75o9wbFM1SaM7q6xMhl1ek5nmf
 tKwFtwSJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYw6dzQAKCRBMtfaEi7xW7mfMDA
 CCrJQjwANsScQKI2BY9zkAwahvmB7CoktFhlZo5wdeIVcUhYVU37TOPEGsDCHGkMEcnh3utamgs/Y/
 T6ipy6/m+pUxo/fJ2ZNU2wTtK7Gjm1EirsF7INven2B4n24G9e/aUw/L/0mAyY0pTXMAZXUuWM5XTI
 EDoGM/Jc8rxyuDuxxSvM1eX9ScZu2/qTH3Pre8WBN80Qwoq2pdOGgSlZYiGpe+OrKSjWFrO8rXwKIG
 fnEAva4AWwQlzR0bfLWO+yuUpVyA8T1YoPNa1ZWYIMmSvyi4ntpMkBcCloJvnE8hUo6vmXmhYad4+v
 S9SWJgQX5wn8D1h6+3oniyHgD9AZe19ip2/ywyg/UiOGm086JGI0e/uTS21tWyJNyrUP6Tx//6lmV8
 enTLqz1/8araIWIF9mbmw+PUv21yPZ7DZQf0/LGoaJSmORa06SCfBeADR7lea9HyT4TCOWkdvGiGi/
 N53Qy4QGRFuv2zZNiAmohrX8NP0ScQePKcN06eX01dGBs=
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 12/21] init: Drop __nocfi from __init
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

It's no longer necessary to disable CFI checking for all __init
functions. Drop the __nocfi attribute from __init.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 include/linux/init.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/init.h b/include/linux/init.h
index baf0b29a7010..88f2964097f5 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -47,7 +47,7 @@
 
 /* These are for everybody (although not all archs will actually
    discard it in modules) */
-#define __init		__section(".init.text") __cold  __latent_entropy __noinitretpoline __nocfi
+#define __init		__section(".init.text") __cold  __latent_entropy __noinitretpoline
 #define __initdata	__section(".init.data")
 #define __initconst	__section(".init.rodata")
 #define __exitdata	__section(".exit.data")
-- 
2.37.2.672.g94769d06f0-goog


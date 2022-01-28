Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8512C9E
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 11:45:52 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id g6-20020adfbc86000000b001a2d62be244so2123721wrh.23
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 03:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=mcBQonq9lXEu3o2avKFSmCAtNtSrD58c9xOTmXyxJbc=;
        b=dDfyhR5AB5IaYgYz2a3FGiI3JkG/6DalYBQNMRvN5op752cNmJaQSQhf3Zp9TA8dYf
         8ENznJKNqNtkw5JTeQ9pd6lTvBtloL+2SdqqVvjF/L+2WaJIAoDbRvCGyzfFaLjTg+Fa
         wl60c7D4H+fhnOCz5FESU9Q5dYy58toSvpTELD8bS2HsIg00u16fE5ugJRDLj00aTQY9
         NxYAp24NP3ja9fv2pMNRI09ibcBZSaC7Ihd14wmLgKnhFiMz30PQfwbfs+kFTAZ8/9f1
         pH/dPx4kF2UDNZJmqkS/P3MMD2cYKYgl54O5nbRYNzkT7q987/QBfoMHcP1/YlF9V3Y0
         PyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=mcBQonq9lXEu3o2avKFSmCAtNtSrD58c9xOTmXyxJbc=;
        b=DnC3IJq4JvWS3oJO8KSrhHveDu4uICiHN0q/WSxIwteNglzLPMJmvDpe4p9odYfWZ2
         HnkssxzP+zTp62IDCxI9iKS+Ia4SysBnzmPoR11z2hPhe86I5RLeBXqs3WrLnip5BhUd
         zn4GovxhkOnxfGJP40BJ5a1kd1DzBFQWWQE8wb4tJiyLCPm2XS2p5o38CCwKcmhrBEYn
         +wW0HhE3ErNqXatMSBYH6GQYVSWYW03dvNYx3AFaQhlJL0agiBXLgvoUiFeM21xd3cM3
         eUMNxOiLANh3Vl4ktM8wPcVdJZaoGwGVaKBRupJBoO/cF+e1x+s05BKA04zH8XeRXXzs
         0Gzg==
X-Gm-Message-State: AOAM533dDUivJWzToh+9118qsWLxWZZKvRG1QAAxvrJUmFLPAeqy1MVd
	BWZrnI5TdnZmwV17E0S2LbznkOLs3Q==
X-Google-Smtp-Source: ABdhPJyBdSh2F7YYmJQ8OWV4SC2aAaFbjqZBKGMpUccusqIhFERKP9cbCKgvNVPUONTLxKkc7pT49fLIrQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f088:5245:7f91:d730])
 (user=elver job=sendgmr) by 2002:a1c:f413:: with SMTP id z19mr15683197wma.144.1643370350900;
 Fri, 28 Jan 2022 03:45:50 -0800 (PST)
Date: Fri, 28 Jan 2022 12:44:45 +0100
Message-Id: <20220128114446.740575-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH 1/2] stack: Introduce CONFIG_RANDOMIZE_KSTACK_OFFSET
From: Marco Elver <elver@google.com>
To: elver@google.com, Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Alexander Potapenko <glider@google.com>, llvm@lists.linux.dev, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The randomize_kstack_offset feature is unconditionally compiled in when
the architecture supports it.

To add constraints on compiler versions, we require a dedicated Kconfig
variable. Therefore, introduce RANDOMIZE_KSTACK_OFFSET.

Furthermore, this option is now also configurable by EXPERT kernels:
while the feature is supposed to have zero performance overhead when
disabled, due to its use of static branches, there are few cases where
giving a distribution the option to disable the feature entirely makes
sense. For example, in very resource constrained environments, which
would never enable the feature to begin with, in which case the
additional kernel code size increase would be redundant.

Signed-off-by: Marco Elver <elver@google.com>
---
 arch/Kconfig                     | 23 ++++++++++++++++++-----
 include/linux/randomize_kstack.h |  5 +++++
 init/main.c                      |  2 +-
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 678a80713b21..2cde48d9b77c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1159,16 +1159,29 @@ config HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
 	  to the compiler, so it will attempt to add canary checks regardless
 	  of the static branch state.
 
-config RANDOMIZE_KSTACK_OFFSET_DEFAULT
-	bool "Randomize kernel stack offset on syscall entry"
+config RANDOMIZE_KSTACK_OFFSET
+	bool "Support for randomizing kernel stack offset on syscall entry" if EXPERT
+	default y
 	depends on HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
 	help
 	  The kernel stack offset can be randomized (after pt_regs) by
 	  roughly 5 bits of entropy, frustrating memory corruption
 	  attacks that depend on stack address determinism or
-	  cross-syscall address exposures. This feature is controlled
-	  by kernel boot param "randomize_kstack_offset=on/off", and this
-	  config chooses the default boot state.
+	  cross-syscall address exposures.
+
+	  The feature is controlled via the "randomize_kstack_offset=on/off"
+	  kernel boot param, and if turned off has zero overhead due to its use
+	  of static branches (see JUMP_LABEL).
+
+	  If unsure, say Y.
+
+config RANDOMIZE_KSTACK_OFFSET_DEFAULT
+	bool "Default state of kernel stack offset randomization"
+	depends on RANDOMIZE_KSTACK_OFFSET
+	help
+	  Kernel stack offset randomization is controlled by kernel boot param
+	  "randomize_kstack_offset=on/off", and this config chooses the default
+	  boot state.
 
 config ARCH_OPTIONAL_KERNEL_RWX
 	def_bool n
diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
index bebc911161b6..91f1b990a3c3 100644
--- a/include/linux/randomize_kstack.h
+++ b/include/linux/randomize_kstack.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_RANDOMIZE_KSTACK_H
 #define _LINUX_RANDOMIZE_KSTACK_H
 
+#ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
 #include <linux/kernel.h>
 #include <linux/jump_label.h>
 #include <linux/percpu-defs.h>
@@ -50,5 +51,9 @@ void *__builtin_alloca(size_t size);
 		raw_cpu_write(kstack_offset, offset);			\
 	}								\
 } while (0)
+#else /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
+#define add_random_kstack_offset()		do { } while (0)
+#define choose_random_kstack_offset(rand)	do { } while (0)
+#endif /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
 
 #endif
diff --git a/init/main.c b/init/main.c
index 65fa2e41a9c0..560f45c27ffe 100644
--- a/init/main.c
+++ b/init/main.c
@@ -853,7 +853,7 @@ static void __init mm_init(void)
 	pti_init();
 }
 
-#ifdef CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
+#ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
 DEFINE_STATIC_KEY_MAYBE_RO(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
 			   randomize_kstack_offset);
 DEFINE_PER_CPU(u32, kstack_offset);
-- 
2.35.0.rc0.227.g00780c9af4-goog


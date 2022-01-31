Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B812C9E
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 09:07:43 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id z1-20020adfbbc1000000b001df54394cebso3715625wrg.20
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 01:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=PGLVIgpx7K8YPtd39QgkpU42R1uwUVJe3VkPkvQuvOo=;
        b=YlfBbeCg9MP9aWSNeAsDkv+aT9+uOzfFIOsWSG2YJUVqfbnwYsz5e2XF4/DRfg5+aj
         NyDx3X+NZYcHJ6nJeSJK3DzerGlQw4eMknMKueGgrfd1BpHx2RtwTFHJL7MeOzKgmP2n
         QOOUTF3U+KhQhCy8+6UK55z5b904y1g8GunBT9MSxXyaJyUrpf0hgZ47NmbvNFYvozDZ
         S0O3KZHKdsdNAMM1uBL6XCy4EkUlWuUMlSHX5Tk/YaTDwKScW7+itcpnf1JMYM1UK/Xx
         EER5yR6XgGvT8/nnhuWtj2ScsY+843EKbFk+kriDrbD7zbmg8sdUMHkD+VEQy1In42vB
         gAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=PGLVIgpx7K8YPtd39QgkpU42R1uwUVJe3VkPkvQuvOo=;
        b=GXTwu11dNP54DKrEJjsdcXtkkAPLptDyf6PCYVf84GC3yHesHdsfETFro0leDHijvx
         xQSznDSgzH14bObr5jvcFG38z+GOSRyX4Qh2bw5Z2tF29HLRNmjWSk5FvBrD2+PADzsC
         ZzaskZzpTPQWAodmj+quSiRB2FX9rHjeR2WvupNbNeokAYLyb2IBvEiFPHcXCvNV3oT1
         rdzXNsGdR6rj6TV0VDpTgGvrpid2cqulvHPr91t1PQytGI2jQzo2wrg61r/E9mNV5YWz
         27sns5+HWfs5rDEbuUClF5K/FNHLe/JNmW0oQivHGdB72a4pOrIYEoQoiqhjI7pjEx0p
         J9JQ==
X-Gm-Message-State: AOAM5315xYKsprPju4JXpAPcTEY4y08Zd6D81mNDuLwFyj7OdeAudL5v
	QKBjHBvW/yDBIjupUo0EGf8BcEJutA==
X-Google-Smtp-Source: ABdhPJyI5AvPihK6ZnPDWgmdkvKFOrVo/w859xAmb33XpJy9pkRwfhNZiFIW76PqstZoFJYqbtSTmsxxSA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:9caa:cc34:599f:ecd4])
 (user=elver job=sendgmr) by 2002:a5d:4c88:: with SMTP id z8mr16383561wrs.209.1643620061954;
 Mon, 31 Jan 2022 01:07:41 -0800 (PST)
Date: Mon, 31 Jan 2022 10:05:20 +0100
Message-Id: <20220131090521.1947110-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH v2 1/2] stack: Introduce CONFIG_RANDOMIZE_KSTACK_OFFSET
From: Marco Elver <elver@google.com>
To: elver@google.com, Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Elena Reshetova <elena.reshetova@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Alexander Potapenko <glider@google.com>, llvm@lists.linux.dev, 
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
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
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
2.35.0.rc2.247.g8bbb082509-goog


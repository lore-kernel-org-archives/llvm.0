Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382761632ED
	for <llvm@lists.linux.dev>; Sat, 26 Oct 2024 05:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729919668; cv=none; b=svMNGQ9IW4BkUoQNSDJeZyxTuyVsFrkIZOlaM0f7n0m8J2OdZAWyCb97JB7ua8/cV/8h4rR04SVydGLYl2casr2WYfU8Oaf3umUz1VYGlgVP70g7Ws6U2dMrF9D56WGqWoSFGOAhV9FB69cWi7C1OoZx+jXGowGKB5REIZdVpY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729919668; c=relaxed/simple;
	bh=NLLY5VApu1/3ZEIf01tgeRphmT7Uug94LuXMgvVVpNo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ThAqOe8KODRmS7JgN673H65baWkFGBdhvCZrRrM2yYr2hvv/n8/CZ7BpRLv5eeK7qCEI8voKfTuWGIF74dWbnCJ9uSFGG2795ujJVqBGXDgHGns2txrxQfcFRC/s4rhZmrunB6/pm0Xqa7t5R3UcT45d6jhuSRxrg7j7MqcNacs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F5ZdKD4G; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F5ZdKD4G"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e370139342so48866167b3.3
        for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 22:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729919665; x=1730524465; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NsmO41bchPNgq+4yaZYutwfxnbmoF8h5v0vIdGoDSHg=;
        b=F5ZdKD4GADt7QB5Lvwp9x/5NVs2nZh24m/mgRVFLFLqVITE74Nx2rb6+Z9isw1o1a2
         k0iaKjzVa+R57AVpBQVrLGzbSuGWd0VQDPsiR5jHZ0th7POt037lt5ata54vzj/GvP7A
         gz+8LDT0tlEuIERHZMQKeeYKLKz+jmFE4NL2P71ulzw58aZ8GrnXqgJb4Xu82P4tHD+R
         z46ABR9w2eJHj/WKPoNzQfTAXiER3Yk/OzTFXSkk/b9THfFy2piA8rJsfkjh4fzhK4D8
         bgg+Z7FY0MgGN01gtorG3FBA2V1SWaS0I28sw4pU0dI4BhqwFaC3399nvQ52QUaAMU/n
         Q5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729919665; x=1730524465;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsmO41bchPNgq+4yaZYutwfxnbmoF8h5v0vIdGoDSHg=;
        b=xTcKJzCKXbhXaOu51OZJxogI+h6K4YOa0XAsCnKT+UB3EGhFvE//M//wAwLPeTkqs8
         pMlp2gJn/Txzantn3+bZSKP3aMyz0MlKQRPAtSfq7aoDm75fUffNBlJhOn3+uzai1RJk
         +5VDaEuGK1f+jfAYQnPKMq/g5GJJVAToD6gwvIYvBIbw1f1DtcgScan6T/7SZxnKc+gU
         4y1N+Zny5c/kcS2bnHQx45TnQpc6SwUEA3e6dVWg2c1pxfI31kWwt1zJ8nDljb0dx7QN
         KcvEk9rljQDlDNr4COGFjrfzQhod6nas8hsLE3xyiDFLRyXO+JM2p9dMtADPmMeIgh5V
         JsuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo/fagn6EVCPzHts0jTp3QSLmVUHxstPR131nC9EOySumwBWCNRIAf9961T4md/4Gpsrgg@lists.linux.dev
X-Gm-Message-State: AOJu0YxE9OCTyL8yR6Tvh8vf7vtcgrV+4XLB2nIsXbp2Y70zjtAZyHhQ
	WzdK7S8HBdxyEeA73c/A3eje4ZaCvkull5GKlD6X0QXDA1255HW5Hy9CH/9iecFTTQ==
X-Google-Smtp-Source: AGHT+IFaNug4zYT82V2JkP1oB1hTfsHJ07DjU4iLK9egYH6wsEyiKtTxNH4cedxNJIt2W6rfdo72DsE=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:6789:b0:6e3:6597:222f with SMTP id
 00721157ae682-6e9d8ae01cbmr630047b3.6.1729919665241; Fri, 25 Oct 2024
 22:14:25 -0700 (PDT)
Date: Fri, 25 Oct 2024 22:14:08 -0700
In-Reply-To: <20241026051410.2819338-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241026051410.2819338-7-xur@google.com>
Subject: [PATCH v6 6/7] AutoFDO: Enable machine function split optimization
 for AutoFDO
From: Rong Xu <xur@google.com>
To: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Enable the machine function split optimization for AutoFDO in Clang.

Machine function split (MFS) is a pass in the Clang compiler that
splits a function into hot and cold parts. The linker groups all
cold blocks across functions together. This decreases hot code
fragmentation and improves iCache and iTLB utilization.

MFS requires a profile so this is enabled only for the AutoFDO builds.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
Tested-by: Yonghong Song <yonghong.song@linux.dev>
Tested-by: Yabin Cui <yabinc@google.com>
Change-Id: Iece9b36d37162c0cf66b8efba7e81d04b4768254
---
 include/asm-generic/vmlinux.lds.h | 7 ++++++-
 scripts/Makefile.autofdo          | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index bd64fdedabd2f..8a0bb3946cf05 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -556,6 +556,11 @@ defined(CONFIG_AUTOFDO_CLANG)
 		__cpuidle_text_end = .;					\
 		__noinstr_text_end = .;
 
+#define TEXT_SPLIT							\
+		__split_text_start = .;					\
+		*(.text.split .text.split.[0-9a-zA-Z_]*)		\
+		__split_text_end = .;
+
 #define TEXT_UNLIKELY							\
 		__unlikely_text_start = .;				\
 		*(.text.unlikely .text.unlikely.*)			\
@@ -582,6 +587,7 @@ defined(CONFIG_AUTOFDO_CLANG)
 		ALIGN_FUNCTION();					\
 		*(.text.asan.* .text.tsan.*)				\
 		*(.text.unknown .text.unknown.*)			\
+		TEXT_SPLIT						\
 		TEXT_UNLIKELY						\
 		. = ALIGN(PAGE_SIZE);					\
 		TEXT_HOT						\
@@ -589,7 +595,6 @@ defined(CONFIG_AUTOFDO_CLANG)
 		NOINSTR_TEXT						\
 		*(.ref.text)
 
-
 /* sched.text is aling to function alignment to secure we have same
  * address even at second ld pass when generating System.map */
 #define SCHED_TEXT							\
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 6155d6fc4ca7f..1caf2457e585c 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -10,6 +10,7 @@ endif
 
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
+  CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
@@ -17,6 +18,7 @@ ifdef CONFIG_LTO_CLANG_THIN
     KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
   endif
   KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
+  KBUILD_LDFLAGS += -plugin-opt=-split-machine-functions
 endif
 
 export CFLAGS_AUTOFDO_CLANG
-- 
2.47.0.163.g1226f6d8fa-goog


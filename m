Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5A563F
	for <llvm@lists.linux.dev>; Sat, 17 Dec 2022 04:44:53 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id h2-20020a170902f54200b0018e56572a4eso2980305plf.9
        for <llvm@lists.linux.dev>; Fri, 16 Dec 2022 20:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jwt0kX7GS9Jckw+q61cDxTvmoFnclM/QaQDYT1WYliI=;
        b=RQ2MUmTtopYEBs/CsWjtSAyRTvbAwWSpFqzIOEJodjsQaoaickkjjJcJM86W1PRm4+
         L00WYFsnPLw6RPqkS5rZvaE70xfTxfyUMv79omPJp5QGU1h3uXSb9yo+1im3ScqkawMg
         0B/OSMYKVttHgeP6PUEHZ/S/2Jj599bUE4n3VDzeHY6bvfvlw0RfzPSQoVlRq1hzGggA
         17Q3yPTaMCL+y8dA9cjPe9lauNt+Cbb2UIEfwfJxjJ1rkiA/H6bAYxnVN2t3EqHd9pgc
         /PwIwuBDmPZlDtujda8rUptA0z951PK+Z8zZA/JQkFcBA3vT92ThAInyxKet9KPswEsB
         RkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jwt0kX7GS9Jckw+q61cDxTvmoFnclM/QaQDYT1WYliI=;
        b=JATHh5MODtuLldb6lz+w7r3R35yCYFVu2gJpKYcis5Tack+HKaHQajz2K/yA55cUGN
         B5Q2dDUjVYkVt2eIidai73wiQg5DHPyG5nyGM4Rt24kMPL6iZylXyNKI1yyb84PYBb+E
         VLFFjlPcfaW6BB3yilHYm5YZFKhRXRJscoScTdRUyPNP0JWPF6amHks1/BFAkfD6yDS/
         dUoWreAWtb20V9a+1inJuF6wADEVJupj5yrS0N/hIBX2E0Zgk+kHMLqZUN1c8e/+lgy0
         RWlOgOK3WRmuoMY0zhn10cPwESa/Vn7t/dfsZp/KQM6i3Vfk84FD/9+tI0RoQ5dCwcCx
         O33A==
X-Gm-Message-State: ANoB5pmit+VFa8AUkSrVlNHvTMuvtsS9WujRIIy2Y0C4nXNU6vBMsiN5
	YZZ6zwfAbgF8pRfx+tPMdgixjqk691lLZg==
X-Google-Smtp-Source: AA0mqf6pD4dEjuFSn7wKhwS/R03VrxJSzS2ylnHvSFKZV2uccGUmlvQ5iNHEZZiveaurf+cNA4fNNoa/mp3DaQ==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:aa7:85cb:0:b0:575:871f:2e7a with SMTP id
 z11-20020aa785cb000000b00575871f2e7amr4562595pfn.35.1671252293098; Fri, 16
 Dec 2022 20:44:53 -0800 (PST)
Date: Sat, 17 Dec 2022 12:44:35 +0800
In-Reply-To: <20221217044436.4138642-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221217044436.4138642-1-davidgow@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221217044436.4138642-3-davidgow@google.com>
Subject: [PATCH 2/3] rust: arch/um: Disable FP/SIMD instruction to match x86
From: David Gow <davidgow@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: David Gow <davidgow@google.com>, rust-for-linux@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	kunit-dev@googlegroups.com, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Daniel Latypov <dlatypov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"

The kernel disables all SSE and similar FP/SIMD instructions on
x86-based architectures (partly because we shouldn't be using floats in
the kernel, and partly to avoid the need for stack alignment, see:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383 )

UML does not do the same thing, which isn't in itself a problem, but
does add to the list of differences between UML and "normal" x86 builds.

In addition, there was a crash bug with LLVM < 15 / rustc < 1.65 when
building with SSE, so disabling it fixes rust builds with earlier
compiler versions, see:
https://github.com/Rust-for-Linux/linux/pull/881

Signed-off-by: David Gow <davidgow@google.com>
---
 arch/x86/Makefile.um | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/Makefile.um b/arch/x86/Makefile.um
index b3c1ae084180..d2e95d1d4db7 100644
--- a/arch/x86/Makefile.um
+++ b/arch/x86/Makefile.um
@@ -1,6 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 core-y += arch/x86/crypto/
 
+#
+# Disable SSE and other FP/SIMD instructions to match normal x86
+#
+KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
+KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
+
 ifeq ($(CONFIG_X86_32),y)
 START := 0x8048000
 
-- 
2.39.0.314.g84b9a713c41-goog


Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449D163B
	for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 04:16:18 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 204-20020a2514d5000000b00a3637aea9e1so7266880ybu.17
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 21:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679112977;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=39Fefym6R4RrQjQOXnUkj5Wbs7EvPing/MjHK7t/Lyw=;
        b=lSAzuBmFZ+h8hiSzVh0biFlm455SUKogAcvaf1DponXDVrVupq8TYodfl/wuKq3+lG
         StIer+QGQznxUabXcz2df43r3hGbTAZmZFmuhtEuptxU9lRGI2GQfhVMjBHn7E6oe9rY
         EIEg8HGk++eNcDMhd150EGX8kmfrSXpRDtZ1Jmj+5TpUC1UhlNjrE5Qm5qB076rcW5nX
         b0mnyKdlSuPrmiRCFOmpwbvvLCp+sq/Z0vpQkfDRC0evcIRZsN6hp5UqmpznRXafyYp7
         1YcVKN2gtFUK/BfZcoLNkgVX91sNHKGVoiuKcaydIFpibjnyQfWUE+qS+w6SRTh1CNuN
         gAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679112977;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39Fefym6R4RrQjQOXnUkj5Wbs7EvPing/MjHK7t/Lyw=;
        b=q+2Q73etl1zT5vC0lEgAXDZgXPOgSKok7Miul4IMZI8S992O80+XhnLlrBMbsYEfxk
         Vzwvbo5CImP85JAuW3aVFKH7rwtf9g+c58NFXFSrUhU0aHUOCZD4kO/A1UGGi2zJ+MuD
         ts1uBBwnqgzVhskHHdgTXpVLcZnm90s5OIzHtoSUivVR2yC/WlQjQiL6V+kLODEQYdwG
         WLs5cd0+jPZXFvQS7+g1TG1S3pMyYiIfOjy16yEiNdEUKuGcnWP20DNoUo6tD35earXD
         5QkdxdZnqqpbbvrwn7F83Was6DV8qMm7BVP7a0AWHehddYpE9z4NzpnC82x0j8zHwSdy
         ouIw==
X-Gm-Message-State: AO0yUKWofbr1lZBaw2KtzgSoKLPv71TCHxngpSn4y55sPcUI5CzL0W1e
	+B9afkSgWBD/dIewHu9OPQ3fMKyeFHbkvQ==
X-Google-Smtp-Source: AK7set8R2hY7ySptFbksr8tOnpVYxuTWiaaKxkqJCvC0czQRuIKj/2zJ7wSxtFdQ8Yte+Avdjdb73Hxrct/0kw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a81:af4d:0:b0:544:b7ff:b0df with SMTP id
 x13-20020a81af4d000000b00544b7ffb0dfmr3997390ywj.2.1679112977179; Fri, 17 Mar
 2023 21:16:17 -0700 (PDT)
Date: Sat, 18 Mar 2023 12:15:54 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230318041555.4192172-1-davidgow@google.com>
Subject: [PATCH] arch:um: Only disable SSE on clang to work around old GCC bugs
From: David Gow <davidgow@google.com>
To: Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Roberto Sassu <roberto.sassu@huaweicloud.com>, SeongJae Park <sj@kernel.org>
Cc: David Gow <davidgow@google.com>, linux-um@lists.infradead.org, x86@kernel.org, 
	llvm@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

As part of the Rust support for UML, we disable SSE (and similar flags)
to match the normal x86 builds. This both makes sense (we ideally want a
similar configuration to x86), and works around a crash bug with SSE
generation under Rust with LLVM.

However, this breaks compiling stdlib.h under gcc < 11, as the x86_64
ABI requires floating-point return values be stored in an SSE register.
gcc 11 fixes this by only doing register allocation when a function is
actually used, and since we never use atof(), it shouldn't be a problem:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99652

Nevertheless, only disable SSE on clang setups, as that's a simple way
of working around everyone's bugs.

Fixes: 884981867947 ("rust: arch/um: Disable FP/SIMD instruction to match x86")
Reported-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
Link: https://lore.kernel.org/linux-um/6df2ecef9011d85654a82acd607fdcbc93ad593c.camel@huaweicloud.com/
Tested-by: Roberto Sassu <roberto.sassu@huaweicloud.com>
Tested-by: SeongJae Park <sj@kernel.org>
Signed-off-by: David Gow <davidgow@google.com>
---
 arch/x86/Makefile.um | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/Makefile.um b/arch/x86/Makefile.um
index b70559b821df..2106a2bd152b 100644
--- a/arch/x86/Makefile.um
+++ b/arch/x86/Makefile.um
@@ -3,9 +3,14 @@ core-y += arch/x86/crypto/
 
 #
 # Disable SSE and other FP/SIMD instructions to match normal x86
+# This is required to work around issues in older LLVM versions, but breaks
+# GCC versions < 11. See:
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99652
 #
+ifeq ($(CONFIG_CC_IS_CLANG),y)
 KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
 KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
+endif
 
 ifeq ($(CONFIG_X86_32),y)
 START := 0x8048000
-- 
2.40.0.rc1.284.g88254d51c5-goog


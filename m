Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81B07A
	for <llvm@lists.linux.dev>; Mon,  8 Aug 2022 19:23:35 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id j185-20020a638bc2000000b0041ce3742cb8so3357448pge.16
        for <llvm@lists.linux.dev>; Mon, 08 Aug 2022 12:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=GneeJVrYoG9YO7ZVBQ9roargUyo6x8eaPqj/O9PmIjg=;
        b=PIX0Xvjp/psqCIpXyZsRobhPhs2TzYQFsuZPXBNMMWA8BM92Cy/2q7ct1X88kr8KGH
         7LIjxxbb/p+4B57iyfmG3/1g2STyUV8l0cA6ebYrUMd1j6WJRqX2JMQD1XDpkkahk3qG
         JLCAlmInzAt+Fs+Ei4agNnLT5ofyAUcrkKFQqn6cYS2hwelTRK5T52d0S0FsgGzpNPRK
         kDWiZtcfulr+3H+X+KB2s7DBw0OZalFFLFGPbqMLqDLJgYHTys8ojtieKNAQdp43JmDP
         ytwJ8+Pxm6pQzmDG9NYnQExVRIv/+2xdBwD3430MbtNNV9Fk+Ho2MGTYTgvnbryZF0un
         Furg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=GneeJVrYoG9YO7ZVBQ9roargUyo6x8eaPqj/O9PmIjg=;
        b=awqOe6R9Jw4XFA1Dm9asgngtqy2vDhNaX6pmE7wSSSdeLM8oksYEOKp44JHGCOsE2U
         KRx+Zc+fFJ+EOJEPl6NEqNIpGFqkbLDZZtkW2Fy3wqyRZaiD5H8Xch64uFEfHSKHVsc7
         lNBNcEqFZ+YHmGacXE0NjrtGRy81F+3m+WhmHcQSlUuUbiHAcPs068rH3zqF/qAB9zg1
         7uBy0GmlbqqCu19nV3Mp43tOlaT1/BgjBQ1ndJTSS0/kcLZANi1g3srMeMSTVGBqoQ3b
         FJjSa27+mhzEdPfcAU4YrHQbgkHmKFHEuslrR5zcpdXekoKUFQQxpA9FxkBbXD+iATPU
         hTiw==
X-Gm-Message-State: ACgBeo2Rtf/u28Mi30K2tRIhVXXvPYcYz7EzRW6X3BD+n3bwA9Re4Oya
	yeLDBTIo+XrVOwnACnQVFC7/r3TSLqsRfRCVink=
X-Google-Smtp-Source: AA6agR4dxq9DJfSTVilC1n/kp/hoTsSutuEiPmCPg8tP3fAN7B392n7C1mVY9NCskkWBahvtEWgLfkd8kE90hGAxxi4=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:88f6:faa7:16e5:a8d5])
 (user=ndesaulniers job=sendgmr) by 2002:a17:90b:384e:b0:1f5:6330:8294 with
 SMTP id nl14-20020a17090b384e00b001f563308294mr24331796pjb.35.1659986615163;
 Mon, 08 Aug 2022 12:23:35 -0700 (PDT)
Date: Mon,  8 Aug 2022 12:23:05 -0700
Message-Id: <20220808192321.3490995-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1659986577; l=4052;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=S/N2aGgnwD6VqRx44sfulwh57Bc3dypr+izb3FyWnRA=;
 b=DZ081uVs3rB4foY4W8D7Zp7TalB8H+rUw3W1lvSVan42TCmLsWwfqDyPcdMFj6FGtFnehgoiDoQj
 EZFMwm3TDQsyViNCnY19yVp93g588Rf/YSlPlp1hF4CED/F/NB4x
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
Subject: [PATCH] x86: assemble with -Wa,--noexecstack to avoid BFD 2.39 warning
From: Nick Desaulniers <ndesaulniers@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Nick Clifton <nickc@redhat.com>, Fangrui Song <maskray@google.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jens Axboe <axboe@kernel.dk>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Nicolas Schier <n.schier@avm.de>, 
	Brijesh Singh <brijesh.singh@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Users of GNU ld (BFD) from binutils 2.39+ will observe multiple instance
of a new warning when linking kernels in the form:

  ld: warning: arch/x86/realmode/rm/bioscall.o: missing .note.GNU-stack
  section implies executable stack
  ld: NOTE: This behaviour is deprecated and will be removed in a future
  version of the linker

The object files producing these all happen to be out of line assembler
sources (*.S files).

Generally, we would like to avoid the stack being executable. Because
there could be a need for the stack to be executable, assembler sources
have to opt-in to this security feature via explicit creation of the
.note.GNU-stack feature (which compilers create by default) or command
line flag --noexecstack.

Boot tested defconfig and i386_defconfig in QEMU. If any assembler
sources do require executable stack, they can be built with
-Wa,--execstack, though the linker warning would have to be disabled. We
might need to extend this more generally to the top level Makefile for
all architectures, but I'm not equipped to test the result of such a
change.

LLVM's LLD linker defaults to -z noexecstack, so this flag isn't
strictly necessary when linking with LLD, only BFD, but it doesn't hurt
to be explicit here for all linkers IMO.

Link: https://lore.kernel.org/linux-block/3af4127a-f453-4cf7-f133-a181cce06f73@kernel.dk/
Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
Link: https://github.com/llvm/llvm-project/issues/57009
Reported-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/x86/Makefile                 | 2 ++
 arch/x86/boot/Makefile            | 2 +-
 arch/x86/boot/compressed/Makefile | 2 +-
 arch/x86/realmode/rm/Makefile     | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 7854685c5f25..571546775725 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -159,6 +159,8 @@ else
         KBUILD_CFLAGS += -mcmodel=kernel
 endif
 
+KBUILD_AFLAGS	+= -Wa,--noexecstack
+
 #
 # If the function graph tracer is used with mcount instead of fentry,
 # '-maccumulate-outgoing-args' is needed to prevent a GCC bug
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index b5aecb524a8a..d7f2130f2277 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -67,7 +67,7 @@ targets += cpustr.h
 # ---------------------------------------------------------------------------
 
 KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
-KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
+KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__ -Wa,--noexecstack
 KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
 GCOV_PROFILE := n
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 19e1905dcbf6..1587a21a132d 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -57,7 +57,7 @@ KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
 # that the compiler finds it even with out-of-tree builds (make O=/some/path).
 CFLAGS_sev.o += -I$(objtree)/arch/x86/lib/
 
-KBUILD_AFLAGS  := $(KBUILD_CFLAGS) -D__ASSEMBLY__
+KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__ -Wa,--noexecstack
 GCOV_PROFILE := n
 UBSAN_SANITIZE :=n
 
diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefile
index 83f1b6a56449..5f2fdafaa034 100644
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@ -73,7 +73,7 @@ $(obj)/realmode.relocs: $(obj)/realmode.elf FORCE
 
 KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP -D_WAKEUP \
 		   -I$(srctree)/arch/x86/boot
-KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
+KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__ -Wa,--noexecstack
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
 GCOV_PROFILE := n
 UBSAN_SANITIZE := n
-- 
2.37.1.559.g78731f0fdb-goog


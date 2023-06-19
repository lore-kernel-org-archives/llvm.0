Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D145395
	for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 07:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41DEC433C9;
	Mon, 19 Jun 2023 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687161101;
	bh=G/JkkKeFUJZmB1lOjaX6rQe2FU7tfyO/4yS0qU4LH9w=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=f9aNJ4gN5jtuzsbgtWQqSFH7VKgDJA9uQlNR/A8uOexjxl2tn3lFClgVCo+38x+g8
	 je3dseDRru59DBepeyCt0Z+4GK3+CESW66uOieVVjYxW/vPn8ltvWIKMeTwmbUYahk
	 a762qSdj4cXlHsecBLjG2IO14yCzus+fK7aSs8WU=
Subject: Patch "MIPS: Prefer cc-option for additions to cflags" has been added to the 6.1-stable tree
To: anders.roxell@linaro.org,gregkh@linuxfoundation.org,lkft@linaro.org,llvm@lists.linux.dev,masahiroy@kernel.org,naresh.kamboju@linaro.org,nathan@kernel.org,ndesaulniers@google.com,philmd@linaro.org,sashal@kernel.org,tsbogend@alpha.franken.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 19 Jun 2023 09:51:30 +0200
In-Reply-To: <20230612-6-1-asssembler-target-llvm-17-v1-3-75605d553401@kernel.org>
Message-ID: <2023061930-exceeding-hardness-e4cf@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    MIPS: Prefer cc-option for additions to cflags

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-prefer-cc-option-for-additions-to-cflags.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org Wed Jun 14 20:04:43 2023
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 14 Jun 2023 11:04:37 -0700
Subject: MIPS: Prefer cc-option for additions to cflags
To: gregkh@linuxfoundation.org, sashal@kernel.org, ndesaulniers@google.com
Cc: naresh.kamboju@linaro.org, stable@vger.kernel.org, llvm@lists.linux.dev, "Nathan Chancellor" <nathan@kernel.org>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, "Philippe Mathieu-Daudé" <philmd@linaro.org>, "Linux Kernel Functional Testing" <lkft@linaro.org>, "Anders Roxell" <anders.roxell@linaro.org>, "Masahiro Yamada" <masahiroy@kernel.org>
Message-ID: <20230612-6-1-asssembler-target-llvm-17-v1-3-75605d553401@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

commit 337ff6bb8960fdc128cabd264aaea3d42ca27a32 upstream.

A future change will switch as-option to use KBUILD_AFLAGS instead of
KBUILD_CFLAGS to allow clang to drop -Qunused-arguments, which may cause
issues if the flag being tested requires a flag previously added to
KBUILD_CFLAGS but not KBUILD_AFLAGS. Use cc-option for cflags additions
so that the flags are tested properly.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Philippe Mathieu-DaudÃ© <philmd@linaro.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/mips/Makefile             |    2 +-
 arch/mips/loongson2ef/Platform |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -152,7 +152,7 @@ cflags-y += -fno-stack-check
 #
 # Avoid this by explicitly disabling that assembler behaviour.
 #
-cflags-y += $(call as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
+cflags-y += $(call cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
 
 #
 # CPU-dependent compiler/assembler options for optimization.
--- a/arch/mips/loongson2ef/Platform
+++ b/arch/mips/loongson2ef/Platform
@@ -25,7 +25,7 @@ cflags-$(CONFIG_CPU_LOONGSON2F) += -marc
 # binutils does not merge support for the flag then we can revisit & remove
 # this later - for now it ensures vendor toolchains don't cause problems.
 #
-cflags-$(CONFIG_CPU_LOONGSON2EF)	+= $(call as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
+cflags-$(CONFIG_CPU_LOONGSON2EF)	+= $(call cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
 
 # Enable the workarounds for Loongson2f
 ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-6.1/riscv-purgatory-remove-pgo-flags.patch
queue-6.1/powerpc-purgatory-remove-pgo-flags.patch
queue-6.1/mips-move-wa-msoft-float-check-from-as-option-to-cc-option.patch
queue-6.1/kexec-support-purgatories-with-.text.hot-sections.patch
queue-6.1/mips-prefer-cc-option-for-additions-to-cflags.patch
queue-6.1/x86-purgatory-remove-pgo-flags.patch
queue-6.1/x86-boot-compressed-prefer-cc-option-for-cflags-additions.patch
queue-6.1/kbuild-update-assembler-calls-to-use-proper-flags-and-language-target.patch

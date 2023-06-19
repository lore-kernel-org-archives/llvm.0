Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0835395
	for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 07:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4CDC433CA;
	Mon, 19 Jun 2023 07:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687161108;
	bh=07LwwkP+NNXtay8tIMz8QNwZopUbd2A/gSwYi8NHw9Y=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=HQ9H30PqzCF5jQboa6kKVV9iDwS3XanC9KgmVNKxiFaG44sAGaC3Eiwr3pNMGrcYb
	 uzOEUK9IjSObdhFbjNf9fQP9Eda0Ry0CoX8aJNcb846WXHLvAlBrnzdjWhmYfIVWLG
	 sTVMjsGjglegu6WAr7T7vyOBNRKatrJHF8CwId18=
Subject: Patch "MIPS: Move '-Wa,-msoft-float' check from as-option to cc-option" has been added to the 6.1-stable tree
To: gregkh@linuxfoundation.org,llvm@lists.linux.dev,naresh.kamboju@linaro.org,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org,tsbogend@alpha.franken.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 19 Jun 2023 09:51:30 +0200
In-Reply-To: <20230612-6-1-asssembler-target-llvm-17-v1-2-75605d553401@kernel.org>
Message-ID: <2023061930-lumpiness-perpetual-8837@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    MIPS: Move '-Wa,-msoft-float' check from as-option to cc-option

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-move-wa-msoft-float-check-from-as-option-to-cc-option.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org Wed Jun 14 20:04:42 2023
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 14 Jun 2023 11:04:36 -0700
Subject: MIPS: Move '-Wa,-msoft-float' check from as-option to cc-option
To: gregkh@linuxfoundation.org, sashal@kernel.org, ndesaulniers@google.com
Cc: naresh.kamboju@linaro.org, stable@vger.kernel.org, llvm@lists.linux.dev,  Nathan Chancellor <nathan@kernel.org>, tsbogend@alpha.franken.de,  linux-mips@vger.kernel.org
Message-ID: <20230612-6-1-asssembler-target-llvm-17-v1-2-75605d553401@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

This patch is for linux-6.1.y and earlier, it has no direct mainline
equivalent.

In order to backport commit d5c8d6e0fa61 ("kbuild: Update assembler
calls to use proper flags and language target") to resolve a separate
issue regarding PowerPC, the problem noticed and fixed by
commit 80a20d2f8288 ("MIPS: Always use -Wa,-msoft-float and eliminate
GAS_HAS_SET_HARDFLOAT") needs to be addressed. Unfortunately, 6.1 and
earlier do not contain commit e4412739472b ("Documentation: raise
minimum supported version of binutils to 2.25"), so it cannot be assumed
that all supported versions of GNU as have support for -msoft-float.

In order to switch from KBUILD_CFLAGS to KBUILD_AFLAGS in as-option
without consequence, move the '-Wa,-msoft-float' check to cc-option,
including '$(cflags-y)' directly to avoid the issue mentioned in
commit 80a20d2f8288 ("MIPS: Always use -Wa,-msoft-float and eliminate
GAS_HAS_SET_HARDFLOAT").

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Cc: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/mips/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -109,7 +109,7 @@ endif
 # (specifically newer than 2.24.51.20140728) we then also need to explicitly
 # set ".set hardfloat" in all files which manipulate floating point registers.
 #
-ifneq ($(call as-option,-Wa$(comma)-msoft-float,),)
+ifneq ($(call cc-option,$(cflags-y) -Wa$(comma)-msoft-float,),)
 	cflags-y		+= -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float
 endif
 


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-6.1/riscv-purgatory-remove-pgo-flags.patch
queue-6.1/powerpc-purgatory-remove-pgo-flags.patch
queue-6.1/mips-move-wa-msoft-float-check-from-as-option-to-cc-option.patch
queue-6.1/kexec-support-purgatories-with-.text.hot-sections.patch
queue-6.1/mips-prefer-cc-option-for-additions-to-cflags.patch
queue-6.1/x86-purgatory-remove-pgo-flags.patch
queue-6.1/x86-boot-compressed-prefer-cc-option-for-cflags-additions.patch
queue-6.1/kbuild-update-assembler-calls-to-use-proper-flags-and-language-target.patch

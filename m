Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87D15395
	for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 07:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30FAC433C0;
	Mon, 19 Jun 2023 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687161093;
	bh=bfjbi7WY8rtyCYnWTzNJD1W+4bq4tgJgPFglxwOf8LU=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=AnFcMrudjRux89rDToObYq3JnNID1HtZuHs0tjRDO6BYu2asSE5962ar9KvQBJRbp
	 zrphxz2MNfLCqba3zhUgMgBQyCSDN5o5nklqiGMEluHQV1Yhl1T2VHYcRmuXYl7zyu
	 ZG5IpWQKyMeEWdUNwTvKxT9wt4lTmghlFO0NG/xM=
Subject: Patch "kbuild: Update assembler calls to use proper flags and language target" has been added to the 6.1-stable tree
To: anders.roxell@linaro.org,gregkh@linuxfoundation.org,lkft@linaro.org,llvm@lists.linux.dev,masahiroy@kernel.org,naresh.kamboju@linaro.org,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 19 Jun 2023 09:51:29 +0200
In-Reply-To: <20230612-6-1-asssembler-target-llvm-17-v1-4-75605d553401@kernel.org>
Message-ID: <2023061929-treadmill-absently-54ef@gregkh>
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

    kbuild: Update assembler calls to use proper flags and language target

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kbuild-update-assembler-calls-to-use-proper-flags-and-language-target.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org Wed Jun 14 20:04:43 2023
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 14 Jun 2023 11:04:38 -0700
Subject: kbuild: Update assembler calls to use proper flags and language target
To: gregkh@linuxfoundation.org, sashal@kernel.org, ndesaulniers@google.com
Cc: naresh.kamboju@linaro.org, stable@vger.kernel.org, llvm@lists.linux.dev,  Masahiro Yamada <masahiroy@kernel.org>,  Nathan Chancellor <nathan@kernel.org>,  Linux Kernel Functional Testing <lkft@linaro.org>,  Anders Roxell <anders.roxell@linaro.org>
Message-ID: <20230612-6-1-asssembler-target-llvm-17-v1-4-75605d553401@kernel.org>

From: Nick Desaulniers <ndesaulniers@google.com>

commit d5c8d6e0fa61401a729e9eb6a9c7077b2d3aebb0 upstream.

as-instr uses KBUILD_AFLAGS, but as-option uses KBUILD_CFLAGS. This can
cause as-option to fail unexpectedly when CONFIG_WERROR is set, because
clang will emit -Werror,-Wunused-command-line-argument for various -m
and -f flags in KBUILD_CFLAGS for assembler sources.

Callers of as-option and as-instr should be adding flags to
KBUILD_AFLAGS / aflags-y, not KBUILD_CFLAGS / cflags-y. Use
KBUILD_AFLAGS in all macros to clear up the initial problem.

Unfortunately, -Wunused-command-line-argument can still be triggered
with clang by the presence of warning flags or macro definitions because
'-x assembler' is used, instead of '-x assembler-with-cpp', which will
consume these flags. Switch to '-x assembler-with-cpp' in places where
'-x assembler' is used, as the compiler is always used as the driver for
out of line assembler sources in the kernel.

Finally, add -Werror to these macros so that they behave consistently
whether or not CONFIG_WERROR is set.

[nathan: Reworded and expanded on problems in commit message
         Use '-x assembler-with-cpp' in a couple more places]

Link: https://github.com/ClangBuiltLinux/linux/issues/1699
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 scripts/Kconfig.include   |    2 +-
 scripts/Makefile.compiler |    8 ++++----
 scripts/as-version.sh     |    2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -33,7 +33,7 @@ ld-option = $(success,$(LD) -v $(1))
 
 # $(as-instr,<instr>)
 # Return y if the assembler supports <instr>, n otherwise
-as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
+as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler-with-cpp -o /dev/null -)
 
 # check if $(CC) and $(LD) exist
 $(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -29,16 +29,16 @@ try-run = $(shell set -e;		\
 	fi)
 
 # as-option
-# Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
+# Usage: aflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
 
 as-option = $(call try-run,\
-	$(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) -Werror $(KBUILD_AFLAGS) $(1) -c -x assembler-with-cpp /dev/null -o "$$TMP",$(1),$(2))
 
 # as-instr
-# Usage: cflags-y += $(call as-instr,instr,option1,option2)
+# Usage: aflags-y += $(call as-instr,instr,option1,option2)
 
 as-instr = $(call try-run,\
-	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
+	printf "%b\n" "$(1)" | $(CC) -Werror $(KBUILD_AFLAGS) -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
 
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
--- a/scripts/as-version.sh
+++ b/scripts/as-version.sh
@@ -45,7 +45,7 @@ orig_args="$@"
 # Get the first line of the --version output.
 IFS='
 '
-set -- $(LC_ALL=C "$@" -Wa,--version -c -x assembler /dev/null -o /dev/null 2>/dev/null)
+set -- $(LC_ALL=C "$@" -Wa,--version -c -x assembler-with-cpp /dev/null -o /dev/null 2>/dev/null)
 
 # Split the line on spaces.
 IFS=' '


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-6.1/riscv-purgatory-remove-pgo-flags.patch
queue-6.1/powerpc-purgatory-remove-pgo-flags.patch
queue-6.1/mips-move-wa-msoft-float-check-from-as-option-to-cc-option.patch
queue-6.1/kexec-support-purgatories-with-.text.hot-sections.patch
queue-6.1/mips-prefer-cc-option-for-additions-to-cflags.patch
queue-6.1/x86-purgatory-remove-pgo-flags.patch
queue-6.1/x86-boot-compressed-prefer-cc-option-for-cflags-additions.patch
queue-6.1/kbuild-update-assembler-calls-to-use-proper-flags-and-language-target.patch

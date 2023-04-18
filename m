Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E13F1FA0
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 10:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74E3C433EF;
	Tue, 18 Apr 2023 10:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681813029;
	bh=L5EDiz9W72KkBfBE51KXOgAzVup+zjEAY+RGWtSrw3E=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=MpzcdUK7IBkcQoTZFQahaBJysrsFn+F8UPFCZMyhKDaseYGTtesrX6Z2FA4Y+xtwX
	 /ZUs/ivsdot0Y7SmaNL9mb6cRIHY6fHPYEKb+xbXAl3UYSkJlHgPASme5kPfEIloEf
	 iNDP1VkkLuGGXLR448iXM8gkeV+0Qu3vTp/tqZqo=
Subject: Patch "kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS" has been added to the 5.10-stable tree
To: conor@kernel.org,gregkh@linuxfoundation.org,llvm@lists.linux.dev,masahiroy@kernel.org,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 18 Apr 2023 12:16:57 +0200
In-Reply-To: <20230328-riscv-zifencei-zicsr-5-10-v1-3-bccb3e16dc46@kernel.org>
Message-ID: <2023041857-importer-conjuror-93aa@gregkh>
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

    kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kbuild-check-config_as_is_llvm-instead-of-llvm_ias.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable-owner@vger.kernel.org Wed Mar 29 02:08:43 2023
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Mar 2023 17:08:31 -0700
Subject: kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: conor@kernel.org, stable@vger.kernel.org, llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>
Message-ID: <20230328-riscv-zifencei-zicsr-5-10-v1-3-bccb3e16dc46@kernel.org>

From: Masahiro Yamada <masahiroy@kernel.org>

commit 52cc02b910284d6bddba46cce402044ab775f314 upstream.

LLVM_IAS is the user interface to set the -(no-)integrated-as flag,
and it should be used only for that purpose.

LLVM_IAS is checked in some places to determine the assembler type,
but it is not precise.

For example,

 $ make CC=gcc LLVM_IAS=1

... will use the GNU assembler (i.e. binutils) since LLVM_IAS=1 is
effective only when $(CC) is clang.

Of course, 'CC=gcc LLVM_IAS=1' is an odd combination, but the build
system can be more robust against such insane input.

Commit ba64beb17493a ("kbuild: check the minimum assembler version in
Kconfig") introduced CONFIG_AS_IS_GNU/LLVM, which is more precise
because Kconfig checks the version string from the assembler in use.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
[nathan: Backport to 5.10]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Makefile            |    2 +-
 arch/riscv/Makefile |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- a/Makefile
+++ b/Makefile
@@ -851,7 +851,7 @@ else
 DEBUG_CFLAGS	+= -g
 endif
 
-ifeq ($(LLVM_IAS),1)
+ifdef CONFIG_AS_IS_LLVM
 KBUILD_AFLAGS	+= -g
 else
 KBUILD_AFLAGS	+= -Wa,-gdwarf-2
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -40,7 +40,7 @@ ifeq ($(CONFIG_LD_IS_LLD),y)
 ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
 	KBUILD_CFLAGS += -mno-relax
 	KBUILD_AFLAGS += -mno-relax
-ifneq ($(LLVM_IAS),1)
+ifndef CONFIG_AS_IS_LLVM
 	KBUILD_CFLAGS += -Wa,-mno-relax
 	KBUILD_AFLAGS += -Wa,-mno-relax
 endif


Patches currently in stable-queue which might be from stable-owner@vger.kernel.org are

queue-5.10/kbuild-check-the-minimum-assembler-version-in-kconfig.patch
queue-5.10/cgroup-cpuset-make-cpuset_fork-handle-clone_into_cgroup-properly.patch
queue-5.10/kbuild-check-config_as_is_llvm-instead-of-llvm_ias.patch
queue-5.10/riscv-handle-zicsr-zifencei-issues-between-clang-and-binutils.patch
queue-5.10/kbuild-switch-to-f-variants-of-integrated-assembler-flag.patch
queue-5.10/cgroup-cpuset-add-cpuset_can_fork-and-cpuset_cancel_fork-methods.patch
queue-5.10/cgroup-cpuset-change-references-of-cpuset_mutex-to-cpuset_rwsem.patch
queue-5.10/cgroup-cpuset-skip-spread-flags-update-on-v2.patch

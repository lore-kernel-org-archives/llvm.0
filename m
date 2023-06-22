Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C95A101EE
	for <llvm@lists.linux.dev>; Thu, 22 Jun 2023 08:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC56C433C0;
	Thu, 22 Jun 2023 08:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687421303;
	bh=yFq9Zyr6bfzKa8zhqccBba3/9IvWR8bp0YdV2XNmgvo=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=zkPIBCJaqlv0ttgXKfzaTcGZPsNUdUcwvubcFmV8eQzsvbl+hyPJxF8pUB6yITACb
	 xQst4kN9hyyamesm3RnDqZP5Uj/n7LTWRxwQacBC6/pgxPtn1IukkPZ0HwaSW7jNzY
	 Jx+h9Ukhybgd3wA66jemstEG51NsfDVBkyP9h7Q4=
Subject: Patch "riscv: Link with '-z norelro'" has been added to the 6.3-stable tree
To: 202306192231.DJmWr6BX-lkp@intel.com,conor@kernel.org,gregkh@linuxfoundation.org,linux-riscv@lists.infradead.org,lkp@intel.com,llvm@lists.linux.dev,nathan@kernel.org,ndesaulniers@google.com,palmer@dabbelt.com,palmer@rivosinc.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 22 Jun 2023 10:08:21 +0200
In-Reply-To: <20230620-6-3-fix-got-relro-error-lld-v1-1-f3e71ec912d1@kernel.org>
Message-ID: <2023062221-moving-eastward-9967@gregkh>
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

    riscv: Link with '-z norelro'

to the 6.3-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     riscv-link-with-z-norelro.patch
and it can be found in the queue-6.3 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Thu Jun 22 09:37:45 2023
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 20 Jun 2023 17:44:50 +0000
Subject: riscv: Link with '-z norelro'
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: palmer@dabbelt.com, conor@kernel.org, ndesaulniers@google.com, nathan@kernel.org, linux-riscv@lists.infradead.org, stable@vger.kernel.org, llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Message-ID: <20230620-6-3-fix-got-relro-error-lld-v1-1-f3e71ec912d1@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

This patch fixes a stable only patch, so it has no direct upstream
equivalent.

After a stable only patch to explicitly handle the '.got' section to
handle an orphan section warning from the linker, certain configurations
error when linking with ld.lld, which enables relro by default:

  ld.lld: error: section: .got is not contiguous with other relro sections

This has come up with other architectures before, such as arm and arm64
in commit 0cda9bc15dfc ("ARM: 9038/1: Link with '-z norelro'") and
commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
CONFIG_RELOCATABLE"). Additionally, '-z norelro' is used unconditionally
for RISC-V upstream after commit 26e7aacb83df ("riscv: Allow to
downgrade paging mode from the command line"), which alluded to this
issue for the same reason. Bring 6.3 in line with mainline and link with
'-z norelro', which resolves the above link failure.

Fixes: e6d1562dd4e9 ("riscv: vmlinux.lds.S: Explicitly handle '.got' section")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306192231.DJmWr6BX-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/riscv/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -7,7 +7,7 @@
 #
 
 OBJCOPYFLAGS    := -O binary
-LDFLAGS_vmlinux :=
+LDFLAGS_vmlinux := -z norelro
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux := --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-6.3/riscv-link-with-z-norelro.patch

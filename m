Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEAA38B
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 03:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EC7C43396;
	Thu, 12 Jan 2023 03:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673492739;
	bh=uAHgiJSCHpIUV5vt/SRkX0KHkpA5UbELEGGq1ql5Qak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rVLVuVeTlHKtoWOmjZ+358Jzlf1tfQeNy3bGkJhjSwHJwEzQaTmi6iPfn2zhd8yku
	 SiiOIO+WX200NtX3TyIeXFL/bdCbJzy/kMaON0d45nND6Eqp+Jiry2COytuXnikcEO
	 1YXC9A33GD+XdvMFxhw2H176oSqMa7Y4yO6mfVp9eo8b3gIFV2HufvV11EJSkWtEMp
	 POPdtD3fo5IsDGCgj6X6JYilQwEtNnKWRWLsWPs0OhFvA0nhwDVZMwNHdEt5Kxl/4L
	 kdN7a2veO8GsJo9UOm4Vpd9nBa2DGLbmW/6cxfxIH/ottwRHZUzZcCYMNQo7izHb+P
	 Ik7a2Ii3YN+6w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 11 Jan 2023 20:05:03 -0700
Subject: [PATCH v2 06/14] powerpc/vdso: Remove unused '-s' flag from
 ASFLAGS
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v2-6-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To: masahiroy@kernel.org
Cc: ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, 
 Segher Boessenkool <segher@kernel.crashing.org>, mpe@ellerman.id.au, 
 npiggin@gmail.com, christophe.leroy@csgroup.eu, 
 linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=nathan@kernel.org;
 h=from:subject:message-id; bh=uAHgiJSCHpIUV5vt/SRkX0KHkpA5UbELEGGq1ql5Qak=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K37Luf5TSJn1zGJGs5WDEWtGnPySzwmOwleXi5y7GMc1
 LUaxo5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEyEgYuRYdKPQG4+2+5fz2Y7PqucK2
 V3YumbB5PKOXc9ursgvuacygxGhiPeFmF7Jdj7jnBc+ZpmGWXzfAWTQrbrjFs11zznMDEe4wYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
warns:

  clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]

The compiler's '-s' flag is a linking option (it is passed along to the
linker directly), which means it does nothing when the linker is not
invoked by the compiler. The kernel builds all .o files with '-c', which
stops the compilation pipeline before linking, so '-s' can be safely
dropped from ASFLAGS.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
---
Cc: mpe@ellerman.id.au
Cc: npiggin@gmail.com
Cc: christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org

As I mentioned before, it is possible that we should add '-s' to
ldflags-y in the following patch but I assume someone would have noticed
by now if that was a problem.
---
 arch/powerpc/kernel/vdso/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 6a977b0d8ffc..45c0cc5d34b6 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -51,10 +51,10 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
 ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
 
 CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
-AS32FLAGS := -D__VDSO32__ -s
+AS32FLAGS := -D__VDSO32__
 
 CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
-AS64FLAGS := -D__VDSO64__ -s
+AS64FLAGS := -D__VDSO64__
 
 targets += vdso32.lds
 CPPFLAGS_vdso32.lds += -P -C -Upowerpc

-- 
2.39.0


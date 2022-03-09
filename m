Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B23248C1
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 17:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CF7C340E8;
	Wed,  9 Mar 2022 17:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646848243;
	bh=VdG6uAa2J6he+KPew0C79IKsNwlXvnDZ0mqMytTw22k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6p7FnS9EiEt35jbFmuRlV/KsI2WlZJfdnduKDl5rRGIi72y5qqm1RHnB9IhWO4q1
	 u61rUciMyfmWa70zNlqiYSByBrj0X3CJ0Bz4leRC4o4rShBqO8UMqA/toF+DE4CJ2s
	 QeS3uXcUJyDsShcZL68sy4cKOVptiTFkbFvKYFZOiKhtAX8AG2/rR7ccw8OqqEj9L9
	 P0Ign7+5UuFaLBtsT5aewmRIxg7Fh5YIG7ptcbo7deukNRja0DtZWChf4XnbAC6tbc
	 R1uo5zP2da2re8WjAolSzR9LZPasuosCVDmys9npSR6Ba9FYaHcFtEdbe4AaEIoeBx
	 9Tu9RpbXODGMA==
Date: Wed, 9 Mar 2022 10:50:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kernel-team@android.com,
	James Morse <james.morse@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, llvm@lists.linux.dev
Subject: Re: [PATCH] arm64: Paper over ARM_SMCCC_ARCH_WORKAROUND_3 Clang issue
Message-ID: <Yijo7Nmt3AiP1uLH@dev-arch.thelio-3990X>
References: <20220309155716.3988480-1-maz@kernel.org>
 <YijftpaApSJWuZ3m@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YijftpaApSJWuZ3m@dev-arch.thelio-3990X>

On Wed, Mar 09, 2022 at 10:11:18AM -0700, Nathan Chancellor wrote:
> On Wed, Mar 09, 2022 at 03:57:16PM +0000, Marc Zyngier wrote:
> > Compiling the arm64 kernel with the BHB workarounds and Clang+LTO
> > results in a bunch of:
> > 
> > <instantiation>:4:2: error: invalid fixup for movz/movk instruction
> >  mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
> > 
> > when compiling arch/arm64/kernel/entry.S, and makes no sense at all.
> > 
> > As it turns out, moving a single include line around makes the
> > problem disappear. Why, you'd ask? Well, I don't have the faintest
> > idea, and I'm running out of patience. So make of that what you want.
> > 
> > Cc: James Morse <james.morse@arm.com>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  include/linux/arm-smccc.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> > index 220c8c60e021..0a341dd9ff61 100644
> > --- a/include/linux/arm-smccc.h
> > +++ b/include/linux/arm-smccc.h
> > @@ -5,7 +5,6 @@
> >  #ifndef __LINUX_ARM_SMCCC_H
> >  #define __LINUX_ARM_SMCCC_H
> >  
> > -#include <linux/init.h>
> >  #include <uapi/linux/const.h>
> >  
> >  /*
> > @@ -193,6 +192,7 @@
> >  
> >  #ifndef __ASSEMBLY__
> >  
> > +#include <linux/init.h>
> >  #include <linux/linkage.h>
> >  #include <linux/types.h>
> >  
> > -- 
> > 2.34.1
> 
> I am still looking at this but I wanted to post a preliminary finding.
> It seems the source of the error is that ARM_SMCCC_ARCH_WORKAROUND_3 is
> not getting expanded by the preprocessor. If you preprocess
> arch/arm64/kernel/entry.S without LTO then with LTO, it reveals the
> attached diff, which shows just "#ARM_SMCCC_ARCH_WORKAROUND_3", rather
> than "# (((1) << 31) | ((0) << 30) | (((0) & 0x3F) << 24) | ((0x3fff) & 0xFFFF))".

CONFIG_LTO=y causes the following include chain:

include/linux/arm-smccc.h
include/linux/init.h
include/linux/compiler.h
arch/arm64/include/asm/rwonce.h
arch/arm64/include/asm/alternative-macros.h
arch/arm64/include/asm/assembler.h

assembler.h has the use of ARM_SMCCC_ARCH_WORKAROUND_3 but the init.h
include in arm-smccc.h happens before the definition, so it does not get
expanded. This completely hacky patch proves that, as the error goes
away with it:

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 220c8c60e021..6cf6bcf00647 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -5,7 +5,6 @@
 #ifndef __LINUX_ARM_SMCCC_H
 #define __LINUX_ARM_SMCCC_H
 
-#include <linux/init.h>
 #include <uapi/linux/const.h>
 
 /*
@@ -97,6 +96,8 @@
 			   ARM_SMCCC_SMC_32,				\
 			   0, 0x3fff)
 
+#include <linux/init.h>
+
 #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
 			   ARM_SMCCC_SMC_32,				\

This diff seems like a somewhat proper solution, as __READ_ONCE() cannot
be used in assembly, but I am open to other suggestions.

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 1bce62fa908a..56f7b1d4d54b 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -5,7 +5,7 @@
 #ifndef __ASM_RWONCE_H
 #define __ASM_RWONCE_H
 
-#ifdef CONFIG_LTO
+#if defined(CONFIG_LTO) && !defined(__ASSEMBLY__)
 
 #include <linux/compiler_types.h>
 #include <asm/alternative-macros.h>
@@ -66,7 +66,7 @@
 })
 
 #endif	/* !BUILD_VDSO */
-#endif	/* CONFIG_LTO */
+#endif	/* CONFIG_LTO && !__ASSEMBLY__ */
 
 #include <asm-generic/rwonce.h>
 

Cheers,
Nathan

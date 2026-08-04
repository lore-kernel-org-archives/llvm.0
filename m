Received: from linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569B748CD55
	for <llvm@lists.linux.dev>; Tue,  4 Aug 2026 20:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875972; cv=none; b=g3mZD5FtzzQkKetRNcLEXP0Ofgno9nx74R93IMdYcQ9CNJbhYMoe0fcLjtv85oI1OJUv2YMMP6u1CxOUJ2Tfob8CQwY1IfjZWwJcd4/+EyhqlnY6/qCxWHMUN1Kt6tdajtBHN5rO7imjazh+5vSTrjGoBLnPd6NS//sb6GkEvY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875972; c=relaxed/simple;
	bh=+iXtdqVBDKfKGI9ndmWNaa/mQFFDZVYCB6wBmPvwBhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6D4MRjTz5yJeKgvnDQxokk7cg4YPBFCL/OSy8GYGqMb7tRg0tz7Bu6gVR1wR/kbQw4ISJvmFBmA4dc9pmOnmaqoiGwMj49dOTSz2JuLGwCWn+mIJxC06OL6yeWLZXqKcCF/oKfKQmdw0kIHGROGcM8XF+BIeQt1U9qNClshVnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 5E9B870A0AA0; Tue, 04 Aug 2026 22:39:27 +0200 (CEST)
Date: Tue, 4 Aug 2026 22:39:27 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org,
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com,
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org,
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
	acourbot@nvidia.com, work@onurozkan.dev, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com, fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com, gregkh@linuxfoundation.org,
	prafulrai522@gmail.com, nsc@kernel.org, japo@linux.ibm.com,
	lina+kernel@asahilina.net, j@jannau.net, airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: Re: [PATCH V17 0/7] Rust Support for powerpc
Message-ID: <anJN_3eAlTqxqfnI@desktop>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
 <178574013457.29744.6211258618175255546.b4-ty@linux.ibm.com>
 <anG67Q6Y59kDqh-c@desktop>
 <20260804202217.GA1109939@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260804202217.GA1109939@ax162>
Jabber-ID: linkmauve@linkmauve.fr

Hi,

On Tue, Aug 04, 2026 at 01:22:17PM -0700, Nathan Chancellor wrote:
> On Tue, Aug 04, 2026 at 12:11:57PM +0200, Link Mauve wrote:
> > Hi,
> > 
[…]
> > 
> > I just tested those again in linux-next, with the Wii support series on
> > top, but now the kernel fails to build due to ARCH_WARN_ASM and
> > ARCH_WARN_REACHABLE not being defined on PowerPC:
> 
> I also see the following warnings (in addition to that error):
> 
>   warning: unknown and unstable feature specified for `-Ctarget-feature`: `mma`
>     |
>     = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
>     = help: consider filing a feature request
> 
>   warning: unstable feature specified for `-Ctarget-feature`: `vsx`
>     |
>     = note: this feature is not stably supported; its behavior can change in the future
> 
>   warning: unknown and unstable feature specified for `-Ctarget-feature`: `hard-float`
>     |
>     = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
>     = help: consider filing a feature request
> 
>   warning: unstable feature specified for `-Ctarget-feature`: `altivec`
>     |
>     = note: this feature is not stably supported; its behavior can change in the future

Those four are explicitly disabled in arch/powerpc/Makefile, but only
for CONFIG_PPC64, not for CONFIG_PPC…  Maybe they should, I’ve only
tested 32-bit on the Wii which has no altivec or vsx, but has hard
floats, and I’m not sure about mma.

Could you test this patch on your platform?  I’ll submit it properly if
it does fix those four warnings:
```
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 9385db478c59..8fba9310acfa 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -63,10 +63,10 @@ endif

 ifdef CONFIG_PPC64
 KBUILD_RUSTFLAGS       += --target=powerpc64le-unknown-linux-gnu
-KBUILD_RUSTFLAGS       += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
 else
 KBUILD_RUSTFLAGS       += --target=powerpc-unknown-linux-gnu
 endif
+KBUILD_RUSTFLAGS       += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec

 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS        += -mlittle-endian
```

> 
>   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
>   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
>   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
>   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]
>   warning: 4 warnings emitted

I have no idea about those.

> 
> when building this series in next-20260804 with rustc 1.97.1. I am not
> sure where the clang diagnostic warnings come from. I assume the target
> feature warnings are expected but it would be good to get those
> addressed sooner rather than later. I see '-hard-float' has an issue
> open
> 
>   https://github.com/rust-lang/rust/issues/117347

In the kernel we want to disallow all floats, unless there is a very
specific and cibled usecase.  This issue is about enabling them.

And no, warnings are never expected, you just tested on a platform
neither of us tested until now. :)

> 
> but I don't think I see issues open for the other ones.
> 
> -- 
> Cheers,
> Nathan

-- 
Link Mauve

Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F14945C6FC
	for <llvm@lists.linux.dev>; Wed,  5 Aug 2026 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932472; cv=none; b=shKzpX0mpOp8qaq/7lrsMGVX64u53ytTR7d/a+0r/HejKfmFMlypshHGgWYGkmtY4QYowRSCTsNPSIdCfLPwri+fx1hkEGEiyrcZaDjfdREZq/SDusUqJny7H9h1ijuQrJP0twDuCwA/BzRLfwkVXXLJ8eUVynyYiEm3LWDxXuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932472; c=relaxed/simple;
	bh=64jyOe4cnR+vlqhbxgQIhL99hTMhk/S6jEliuWyNuEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTqHkeM0bmBua3SeBUgiP1xc6nXGbJBG31lNmrdrdRRLAlI0CJ3pmfjy1ln9Bbk+PxJuGUMNVQ/ewTGIbwOEVMJPCqmnSouZjeWImOub7P4GO+Pdnbu+eu1keQz8hvJA9faMdZtnfIiuYPuUaFZR5BVBe/jMWi9tYYcfyVm7I38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guPgg2yJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guPgg2yJ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso8851955ad.1
        for <llvm@lists.linux.dev>; Wed, 05 Aug 2026 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785932470; x=1786537270; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f8fKXiu457ws+zyyN3JFRc3wwhL6ADOAY1a3PJv8Y14=;
        b=guPgg2yJA3dSSwjrzRQgrZ5kkVZj6v6Xl+9QOhtD9cXYxu+n8PVByPC5Tm9dW2kfy+
         Lr/+B+ujQlsQ/2Ixw1JJ2YjSHLWutUSfsungFswsN2ioL/oY6AUM6YtnWpkimjjOEGoo
         /vrD9wzhsHpe+cJgm44cuhtr7nuv8Q6zXh2J+GbAeJbHgeQuz93yyjc0sdGJCneGxLDh
         rmM6V8WjUPLR8a0Fbf2bk38TWFVjlr8OthWOUAby1oWwEx9KTSYOfzM04Dbq83+79Jmi
         46en9Gn4YNFmIAWDe+GqLWwPt3bV9Smgb2o+IGxxwRkhfFB957qgLV13yLg47UJW8ZDU
         jp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932470; x=1786537270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8fKXiu457ws+zyyN3JFRc3wwhL6ADOAY1a3PJv8Y14=;
        b=Q4nganzpB+13fDw8+mj9uEBX9JQCcGS8NmiLEPd7u/tNLhMM8pApXyFafGCQApzLf0
         hWkgloCyEPQCPrUZNLLZOGX4gm+7dT9hySWwPfCj4C2/YmsGnsDRIW1FZxmsxc+pdb3Q
         kkzxvYxXlp9l9uC1L7ePYW2JHYmEgwlnkImc3Y3PYeEKsM6cm/9L/J5ju2jy/Ex6JZCE
         P3BqJVVufZ9lSq3bxqYk+MguotFshbchy1jVWgnAllXk2gsEbCvB6bdgHmLhxzTIv++a
         Lcd5IQJjl7+LbRx+qLyWN56JjWotV7EQyXOl9pIy/fg0iAhdRkcplhVUq1eNc0uVoacF
         9hUg==
X-Forwarded-Encrypted: i=1; AHgh+RrXddZCn77rSGg6UcghXSYRW2hVHVupWe1I1IdXdNVy/kOUYlA9aNPlMSyIptzt9/bYAUer@lists.linux.dev
X-Gm-Message-State: AOJu0YxFRyc4QO5RhQD8a7720lhkN2OoV3a+NJyFaY9soWWKuF0yTC8p
	2RuHy0RrkPe3ekOzGpB1C+SwZ+hkTSHqBVjOCapuJAHx0uBCbqtrLouB
X-Gm-Gg: AR+sD10q3ShtuCQcpKXEmbk6uAXcEobZRWnJ0ji+EzCoc6Aqv8FXhNoheTqxh2rYtV+
	frcUTLrB3iT52o2zx7f1q7cUVvsKEBJ3H9q+T7APKs4wZJHgjl8Gu50ylyce+V4MDsnzCEryRgW
	hpcg2i1ZQo+oAxBc6+sMTe2vuwUem3Qmj1RW0pag0DvD5cbMOlvvWzPVhZUvYVB7mGCBBeSKVeX
	RdUQ3v+G4o22svEDy7Ji1VX1u6YsgZemmkTQQF4owbgAnyPPSZDi/SAlrvC1bT5fa0kSGMMMps7
	a9wcLlx3hgJuSD/tI3wQA2sznH+cRYREwVTZDcU88hoshVccwa4obD7CAN4Jw4MlVMmeDIz5qwe
	q9xL/S1SHeNpYOzxPCnx45ILvxUHJvjLIsFIEex7pwvDEiMyGo/j/BcTQEo9yFcwIwPa1Vh2YV5
	3ufCuRteUIe+v5//zq5PRlsLnGK3eMRxIrVa2sQ4mO9b2fbluqeXrJgHvR9oMkruJeib8m9pfAo
	YO8cUVY8vigVdvem1al/So74AJUYNPDhQUQ
X-Received: by 2002:a17:903:2312:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d0ca7fa497mr66481405ad.9.1785932470282;
        Wed, 05 Aug 2026 05:21:10 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.161.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4bda53sm15577065ad.63.2026.08.05.05.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:21:09 -0700 (PDT)
Date: Wed, 5 Aug 2026 17:50:54 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, fujita.tomonori@gmail.com, 
	joelagnelf@nvidia.com, gregkh@linuxfoundation.org, prafulrai522@gmail.com, 
	nsc@kernel.org, japo@linux.ibm.com, lina+kernel@asahilina.net, j@jannau.net, 
	airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V17 0/7] Rust Support for powerpc
Message-ID: <anMqe3eVCZVxgoPj@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
 <178574013457.29744.6211258618175255546.b4-ty@linux.ibm.com>
 <anG67Q6Y59kDqh-c@desktop>
 <20260804202217.GA1109939@ax162>
 <anMnoT0KLd5PRGmX@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anMnoT0KLd5PRGmX@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>

On Wed, Aug 05, 2026 at 05:40:42PM +0530, Mukesh Kumar Chaurasiya wrote:
> On Tue, Aug 04, 2026 at 01:22:17PM -0700, Nathan Chancellor wrote:
> > On Tue, Aug 04, 2026 at 12:11:57PM +0200, Link Mauve wrote:
> > > Hi,
> > > 
> > > On Mon, Aug 03, 2026 at 12:27:13PM +0530, Madhavan Srinivasan wrote:
> > > > On Wed, 08 Jul 2026 13:54:47 +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > > > > Enable experimental rust support for ppc64le and ppc32be. The patch for
> > > > > ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
> > > > > merged over it. ppc32 needs some toolchain fixes mentioned in the patch
> > > > > `rust: Add PowerPC support` and the discussion for that is done here[1].
> > > > > 
> > > > > This has been tested on
> > > > > - powernv9 hardware
> > > > > - pseries P11 hardware
> > > > > - pseries(9, 10) qemu
> > > > > - powernv(9, 10) qemu
> > > > > - rustdoc on x86 and powerpc64le
> > > > > - rusttest on x86 and powerpc64le
> > > > > 
> > > > > [...]
> > > > 
> > > > Applied to powerpc/next.
> > > > 
> > > > [1/7] rust: Fix "multiple candidates for rmeta dependency core" error
> > > >       https://git.kernel.org/powerpc/c/00cdfd072c709c608606461d7d44d4613119bfa9
> > > > [2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
> > > >       https://git.kernel.org/powerpc/c/be809b60cbb61aab96179f44ac3670242ae72996
> > > > [3/7] powerpc/jump_label: adjust inline asm to be consistent
> > > >       https://git.kernel.org/powerpc/c/13244c0a40139fe66c4c5c5655f4d732a6002957
> > > > [4/7] rust/powerpc: Set min rustc version for powerpc
> > > >       https://git.kernel.org/powerpc/c/e299147cdc8e19c6421a6b7863dc82a35b09d967
> > > > [5/7] rust: Make __udivdi3() and __umoddi3() panic
> > > >       https://git.kernel.org/powerpc/c/c93c194e4ee71a734986fd99a8b1ec9fbb7a9b8b
> > > > [6/7] rust: Add PowerPC support
> > > >       https://git.kernel.org/powerpc/c/73b741adb264967093ef4eb59905618a7e0d0de0
> > > > [7/7] powerpc: Enable Rust for ppc64le
> > > >       https://git.kernel.org/powerpc/c/bc87cbdb952e9223616b839d64bdb4723aa2ed1d
> > > > 
> > > > cheers
> > > > 
> > > 
> > > I just tested those again in linux-next, with the Wii support series on
> > > top, but now the kernel fails to build due to ARCH_WARN_ASM and
> > > ARCH_WARN_REACHABLE not being defined on PowerPC:
> > 
> > I also see the following warnings (in addition to that error):
> > 
> >   warning: unknown and unstable feature specified for `-Ctarget-feature`: `mma`
> >     |
> >     = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
> >     = help: consider filing a feature request
> > 
> >   warning: unstable feature specified for `-Ctarget-feature`: `vsx`
> >     |
> >     = note: this feature is not stably supported; its behavior can change in the future
> > 
> >   warning: unknown and unstable feature specified for `-Ctarget-feature`: `hard-float`
> >     |
> >     = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
> >     = help: consider filing a feature request
> > 
> >   warning: unstable feature specified for `-Ctarget-feature`: `altivec`
> >     |
> >     = note: this feature is not stably supported; its behavior can change in the future
> > 
> Hey Nathan,
> 
> For these i'll raise issues.
Here's bug on rustc for the same.
https://github.com/rust-lang/rust/issues/160561

Regards,
Mukesh
> >   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
> >   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
> >   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
> >   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]
> >   warning: 4 warnings emitted
> > 
> For these warnings below diff should fix it. I'll send out a patch soon.
> 
> diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
> index 06d7d1a2e8da..acec2d2fede7 100644
> --- a/rust/uapi/uapi_helper.h
> +++ b/rust/uapi/uapi_helper.h
> @@ -6,7 +6,7 @@
>   * Sorted alphabetically.
>   */
>  
> -#include <uapi/asm-generic/ioctl.h>
> +#include <uapi/linux/ioctl.h>
>  #include <uapi/drm/drm.h>
>  #include <uapi/drm/nova_drm.h>
>  #include <uapi/drm/panthor_drm.h>
> 
> Regards,
> Mukesh
> 
> > when building this series in next-20260804 with rustc 1.97.1. I am not
> > sure where the clang diagnostic warnings come from. I assume the target
> > feature warnings are expected but it would be good to get those
> > addressed sooner rather than later. I see '-hard-float' has an issue
> > open
> > 
> >   https://github.com/rust-lang/rust/issues/117347
> > 
> > but I don't think I see issues open for the other ones.
> > 
> > -- 
> > Cheers,
> > Nathan

Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3D945DF4D
	for <llvm@lists.linux.dev>; Wed,  5 Aug 2026 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931862; cv=none; b=kJie3rc46we/AViRoeVO7Q/3FUCfoFU2AX3RZjsSxUEGazL+d8+Ba+AOusa+N+TxStGVmXf1SC+zHq4a84bJAjowljRlEV34M0AZ7cc9t2fJYbNsEvLX3M0eZWC5bgAIpo/A3Ta9eczz7l9XcTGbWzCd5IkGYTnoX/lb0T64tJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931862; c=relaxed/simple;
	bh=1DvPFIBcglZ29iTh7E853g0aII/3nijXTwQgng43R38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzfJh/Znf2ds+Jzs2zcSp0hv/Yb1CQqSvaVt2e9TLcmgwMz+XTneiklo4vrVzkn1w5+Z7BKh8HqdKV0KHVc0S919mme7ou2wcaSnw4B/tNzXkzk28MgWLtpCy5NGE5oVI2p861jQlHZXA/uAM3M8CxrXs37WanMsfwuSicXwMHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONfaAKIW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONfaAKIW"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8486672f03cso1088001b3a.0
        for <llvm@lists.linux.dev>; Wed, 05 Aug 2026 05:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785931859; x=1786536659; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RZ+Qj6t2nj2/2rI2iQ3ztizRdb4KUFylPQ/pRqcseoU=;
        b=ONfaAKIWQ4a7qU7Md2ikPeEyNxZ0GGLdpA2QMr/lrvfCI2ZkB0gWx/HOPwgHzNgl8n
         dU7MwrY2T9S16FNsy28ubGX0h9qvUvia88gmm7bC+FZQL5BVTGhqSBwHQFS2SUqghZbW
         kAcT3t0zxMZn8uDZ1h4hqPny5kf0G+vZhiZsip96DlXOTXC8xTS+IlSL1BnLPJ4e2xcV
         z6Wz7BUpAH+9yw6NjhYkkhxu34YTLg4f51Z+Mb9TsbDZIlFX8CKlpZ4qzB/UcNgQRPTe
         HMzP55y5gYB0bE/AyEbKYz7ztGScIgIZXpNZ/t9GatOwd54eFdC4Uug8wr9jWWMtRZ9T
         lopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785931859; x=1786536659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZ+Qj6t2nj2/2rI2iQ3ztizRdb4KUFylPQ/pRqcseoU=;
        b=V3o+ryRk4QLm3whpSgD7rGh67UZQLGy110jiI41Hyz9UNrRLg/qRHshX2jkY4GRz29
         KR76y7VILxcQoKSGtcyriwTNGLXByhxlYQ/17N+INxSInE6sOVpz1ERyCuSX1Y1cPogL
         pyQNumCktNWdcGGyR+IOh5ArgV0O+IyWI+OBUi86jA83EzBkpduiDvPB2IJAvYL9qtfB
         cv2D4EfUT5u8aZGbbnD1B23dQoeb8wAX+rLcC5of0+OVzXMwOHiiYVnXcT5tKXU/Xrz6
         9Q/tO6Vg9Mt1HhWq1CBflmGFWo197ReRmUek3fDjMN4jOBVj7trbozqmECBxDzcPbTfb
         8z7g==
X-Forwarded-Encrypted: i=1; AHgh+Rr0DOGQQ/vE8GYdAquTE6wZRolzw9OR4S0mk6b/UcffHr+qMmIJw/bdI8+zWyb5/llX0I+a@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2IBu4QUS3gN1yc0eiQKQ59moy1imHT1PVWiAm6xUKKSWbWRm8
	lweqEqWhZsiC3vMafjb+GqZRQjSNFDVqnIBb+xHxLe2oh1JTVXrkmuip
X-Gm-Gg: AR+sD10qcDIuPEb3jA4/fbr8XeFiE8g89PIvdnkwPNRe6N1OjWCtPoHGHwuu/xnZolw
	dCrbmtiqnS5aE1EVfWyc14nuGCkI2rmRUcBf0V8fuDjdMVdyBqnsyy1Iwh5d2Xp3xGSDP5FGOWo
	h8QMui4lnmeLt5pVuL7D5m/jV6R878RmsxnR9k6jv2kSdKDGA7aqdWeKZIpBiCmoEAUqWJjxear
	Ben58i6q2+dZ4cATyiIoy7Y8bBSbgeDaFKaGLXzlSLfUQsE2VdzKNQePZdbyIWn0mRkXmJuuD54
	dmpOZEiw2u5kuk8XKAGg/Bn8KioSxHwSu3PFf0HsXOO4As66QF1KGTiVA733iiJASds9pZPqrz0
	1p+PJoi/ujKpYcLhqZA2J1lSUN8att9lmRytVVoUXeukMGm709tmERhI6qPyH9MnCQz7N+4JVBS
	Gz9kdREs3+QWgegMCW80OiDnw4yACk76ZFOE65OQPHCRUbfgSpy8r9f28Nm+gqa3iuH+bCUy7NB
	7rPbgWIOboYR9ddM4tSCVzQmZe24Cj+zFKQ
X-Received: by 2002:a05:6a00:c93:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-84f2de6ab12mr6280866b3a.0.1785931858748;
        Wed, 05 Aug 2026 05:10:58 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.161.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e52f84esm732908b3a.57.2026.08.05.05.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:10:58 -0700 (PDT)
Date: Wed, 5 Aug 2026 17:40:42 +0530
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
Message-ID: <anMnoT0KLd5PRGmX@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804202217.GA1109939@ax162>

On Tue, Aug 04, 2026 at 01:22:17PM -0700, Nathan Chancellor wrote:
> On Tue, Aug 04, 2026 at 12:11:57PM +0200, Link Mauve wrote:
> > Hi,
> > 
> > On Mon, Aug 03, 2026 at 12:27:13PM +0530, Madhavan Srinivasan wrote:
> > > On Wed, 08 Jul 2026 13:54:47 +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > > > Enable experimental rust support for ppc64le and ppc32be. The patch for
> > > > ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
> > > > merged over it. ppc32 needs some toolchain fixes mentioned in the patch
> > > > `rust: Add PowerPC support` and the discussion for that is done here[1].
> > > > 
> > > > This has been tested on
> > > > - powernv9 hardware
> > > > - pseries P11 hardware
> > > > - pseries(9, 10) qemu
> > > > - powernv(9, 10) qemu
> > > > - rustdoc on x86 and powerpc64le
> > > > - rusttest on x86 and powerpc64le
> > > > 
> > > > [...]
> > > 
> > > Applied to powerpc/next.
> > > 
> > > [1/7] rust: Fix "multiple candidates for rmeta dependency core" error
> > >       https://git.kernel.org/powerpc/c/00cdfd072c709c608606461d7d44d4613119bfa9
> > > [2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
> > >       https://git.kernel.org/powerpc/c/be809b60cbb61aab96179f44ac3670242ae72996
> > > [3/7] powerpc/jump_label: adjust inline asm to be consistent
> > >       https://git.kernel.org/powerpc/c/13244c0a40139fe66c4c5c5655f4d732a6002957
> > > [4/7] rust/powerpc: Set min rustc version for powerpc
> > >       https://git.kernel.org/powerpc/c/e299147cdc8e19c6421a6b7863dc82a35b09d967
> > > [5/7] rust: Make __udivdi3() and __umoddi3() panic
> > >       https://git.kernel.org/powerpc/c/c93c194e4ee71a734986fd99a8b1ec9fbb7a9b8b
> > > [6/7] rust: Add PowerPC support
> > >       https://git.kernel.org/powerpc/c/73b741adb264967093ef4eb59905618a7e0d0de0
> > > [7/7] powerpc: Enable Rust for ppc64le
> > >       https://git.kernel.org/powerpc/c/bc87cbdb952e9223616b839d64bdb4723aa2ed1d
> > > 
> > > cheers
> > > 
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
> 
Hey Nathan,

For these i'll raise issues.
>   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
>   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
>   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
>   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]
>   warning: 4 warnings emitted
> 
For these warnings below diff should fix it. I'll send out a patch soon.

diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 06d7d1a2e8da..acec2d2fede7 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -6,7 +6,7 @@
  * Sorted alphabetically.
  */
 
-#include <uapi/asm-generic/ioctl.h>
+#include <uapi/linux/ioctl.h>
 #include <uapi/drm/drm.h>
 #include <uapi/drm/nova_drm.h>
 #include <uapi/drm/panthor_drm.h>

Regards,
Mukesh

> when building this series in next-20260804 with rustc 1.97.1. I am not
> sure where the clang diagnostic warnings come from. I assume the target
> feature warnings are expected but it would be good to get those
> addressed sooner rather than later. I see '-hard-float' has an issue
> open
> 
>   https://github.com/rust-lang/rust/issues/117347
> 
> but I don't think I see issues open for the other ones.
> 
> -- 
> Cheers,
> Nathan

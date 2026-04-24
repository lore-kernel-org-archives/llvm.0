Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B142B3290A1
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 08:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019666; cv=none; b=IBab2uAJLsDjpvHcAOIapfkijj/pUzz6gGMHkGMr9PZ27nwvKphTjn/eDgkcY4fEDweV5rVL9Ax8Un7BhPQB4LCOSqOFXWvMOej5JHP7x+bRxN7LgUYqKQD+BsBFCh29XdrXJ5KMoaMwMsuIUTiEDGgsde+gXtJ789PdlACT0ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019666; c=relaxed/simple;
	bh=Mfhq/vAXtT555zh15dRrAo1ZaBJeR2OSCmV2iuRarqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeEs9WBz7vKiVQJYi9rx3MsiVJ/52izkd6UsEm+ZeKFLf0CEL/hLV1qkXe5YS3EyPcpwfmIFLjTlnEtJAAJ1es4eU5KV8zdcjN9FZO3uSiJeRFAH25l2w8XFJdV+Ggr7weYqJUcsST4X2pAtvjT69Bl38oWavTOGdgwq0I4D1RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q18bUjW9; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q18bUjW9"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso4733326b3a.1
        for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 01:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777019664; x=1777624464; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/LSr35TcIMW6wVIpT4GYu71Od3lJHQ6iIOnrBrPvpf8=;
        b=q18bUjW9zcw0YAIRzFTy0gXmhRFOm7OmVL0zBB79OkAdyvbPi9k22VMD91KimdNqAh
         lyM/DcsNo3Qu9FhUkFYieJ9nG3uEJi012MsCtPXH3t6VOWC8L15ljezL4hUmcQtt6zCD
         S/H64JNzznTHr72+J1hMlzecjz72sP06oeRRLl4pt651X9O2K0xcJbh5SoDSpBn/+3ho
         oiyvdpMUT8X6lcyBVKjS/Sj4GGBXvSZrwirTwsl1s9hCN0tPvakPvd6SBIgqBYf2fSKy
         MqAawOYi7GsZ3zPIrqkp7VW/F9pSoV6UZp8+EMx8efUujPWtkF/PJiOtO3ZaMj08spRP
         KRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019664; x=1777624464;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/LSr35TcIMW6wVIpT4GYu71Od3lJHQ6iIOnrBrPvpf8=;
        b=NRHew5DCJXqQZBypDN4cHhaXx7rU0+BlOblOdlUzb8yI+nlpbnendp97+iZwmwzRjZ
         YwHKCwsOAfPFGjhaijJNpDbI76/EJtvqWKjOMsBAYw0bxJ3utGo4Ca+XZIP5gnXnj8GJ
         cd7oCOFFZUdPa4kiktKi/goGab3bW8OQIaVLHFb3cRwReBusH+YXiDiEOLYGEHojvf38
         sOr13mSeKXlx8XnBM21oJkLZ75i6QWhTgT+bvCcob5+CDlMUMk99lXAtIUwYNJiP79zB
         GbKV3PJcAfAgl5qaIPEiljo0CJo/n5hVUf9rhdtI7s4FyO2BBuOlrNI5hDvZOFNpqnjB
         p8yg==
X-Forwarded-Encrypted: i=1; AFNElJ8tTBFvZf045sQWeOpElNfEV9HMnTQiKz93ZOBntIdyJRqA8SK4bfDl+M5TrrKP0G13DqqI@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6pWm47unB4D+V/Bl1ZWNYHfPd9lcCZHuQAHbRLBfeQzzHh/Y9
	DrnjB3t+lf2PK0SRxYk+OWFs/cXBnmsQwQ4RmfR444UU2Ry+uashz+2C
X-Gm-Gg: AeBDieu2My1FeHqGsm9jaM7m8/0yUz9CEZOb7cmFBgXpTQyI3GRgXWMUro2vm4thMYv
	Myzw3x3KOGyYEfTYgEn3RcDDOauWXFs/qvgik4PL+Lmyw5dQ5UOLgCOVjmve4RfNBhraDS1r9oc
	7tDyN14bEmJeCu1YlWNdQ+x+QtOqf1gVmKThPFZ6URnP95gZy6wIbovl3Xu7bP7ffY2RQ/kljRd
	T+v8VSzx6oyjZ53ehE+3Jh0VzYwU+xzRlpLicbQzin1Gmt80uQ80fj7+R8e52++lMSVJwzW+0Od
	0f/thz6iZArgSMmqM4U8WVZ7tTHtq5JnI2DczoIwu1gA+rebTz/iYdyRdFrmXjM0jFVcMj0e96D
	lOS0MXQG2SddSpr9Lx7S+FUQmdl8eJScpR+qL6c0JA0XucoU8l2TriLM9/+9dz0wwlDbX/hl62A
	CNuHvOeLBSynFBAnnEaD1IX6IKdK6lUrdl5K9DUl2U8RxI4fEm8fcqO7tiw4gtDhnhbonK9GzQN
	zbKCw==
X-Received: by 2002:a05:6a00:3e09:b0:82f:456c:29f1 with SMTP id d2e1a72fcca58-82f8b385c38mr26954369b3a.12.1777019663822;
        Fri, 24 Apr 2026 01:34:23 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe92desm22485595b3a.44.2026.04.24.01.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:34:23 -0700 (PDT)
Date: Fri, 24 Apr 2026 14:04:10 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, sumit.semwal@linaro.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, 
	simona.vetter@ffwll.ch, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V13 2/7] dma-resv: Fix undefined symbol when
 CONFIG_DMA_SHARED_BUFFER is disabled
Message-ID: <aesqe2NKWhkT4kc2@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-3-mkchauras@gmail.com>
 <b4dcb464-7784-47e2-a973-6d731ab9ccf8@amd.com>
 <aeskOeb9uBiPptEJ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <a2241936-579f-4fa6-a9ec-49325d44413f@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2241936-579f-4fa6-a9ec-49325d44413f@amd.com>

On Fri, Apr 24, 2026 at 10:25:25AM +0200, Christian König wrote:
> On 4/24/26 10:06, Mukesh Kumar Chaurasiya wrote:
> > [Sie erhalten nicht häufig E-Mails von mkchauras@gmail.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > On Fri, Apr 24, 2026 at 09:56:16AM +0200, Christian König wrote:
> >> On 4/24/26 07:47, Mukesh Kumar Chaurasiya (IBM) wrote:
> >>> When building with LLVM=1 for architectures like powerpc where
> >>> CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:
> >>>
> >>>   ld.lld: error: undefined symbol: dma_resv_reset_max_fences
> >>>   >>> referenced by helpers.c
> >>>   >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)
> >>>
> >>> The issue occurs because:
> >>> 1. CONFIG_DEBUG_MUTEXES=y is enabled
> >>> 2. CONFIG_DMA_SHARED_BUFFER is not enabled
> >>> 3. dma_resv_reset_max_fences() is declared in the header when
> >>>    CONFIG_DEBUG_MUTEXES is set
> >>> 4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
> >>>    which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
> >>> 5. Rust helpers call dma_resv_unlock() which calls
> >>>    dma_resv_reset_max_fences(), causing an undefined symbol
> >>>
> >>> Fix this by making the function declaration conditional on both
> >>> CONFIG_DEBUG_MUTEXES and CONFIG_DMA_SHARED_BUFFER. When either is
> >>> disabled, use a static inline stub instead.
> >>
> >> Well we are clearly missing something here, but of hand that doesn't looks like the right fix.
> >>
> >> When CONFIG_DMA_SHARED_BUFFER isn't enabled then the whole dma-resv.h header can't be used at all.
> >>
> >> So you also can't call dma_resv_unlock() from the Rust helpers. Which means that we need to make the Rust helpers somehow depend on CONFIG_DMA_SHARED_BUFFER.
> >>
> >> Alternative would be to provide dummies for the functions in dma-resv.h when CONFIG_DMA_SHARED_BUFFER isn't set, but that looks a bit like it just hides the issue.
> >>
> >> Regards,
> >> Christian.
> >>
> > What about something like this:
> > 
> > diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
> > index 71914d8241e2..53c119f1b144 100644
> > --- a/rust/helpers/dma-resv.c
> > +++ b/rust/helpers/dma-resv.c
> > @@ -2,6 +2,7 @@
> > 
> >  #include <linux/dma-resv.h>
> > 
> > +#ifdef CONFIG_DMA_SHARED_BUFFER
> >  __rust_helper
> >  int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
> >  {
> > @@ -12,3 +13,4 @@ __rust_helper void rust_helper_dma_resv_unlock(struct dma_resv *obj)
> >  {
> >         dma_resv_unlock(obj);
> >  }
> > +#endif
> > 
> > This seems to fix the issue and makes sense, whoever wants to use the
> > dma shared buffer will anyway enable the config
> 
> Yeah that directions makes sense.
> 
> I would maybe go a step further and don't even compile rust/helpers/dma-resv.c when CONFIG_DMA_SHARED_BUFFER isn't set.
> 
This makes sense.
> But if that is not possible for some reason then this solution is perfectly fine with me as well.
> 
> The general goal is to make the error messages when you haven't set CONFIG_DMA_SHARED_BUFFER and still try to use the DMA-buf functions easy to understand and not something cryptic.
> 
> Thanks,
> Christian.
>

What about this one?

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 625921e27dfb..09ee5cac600d 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -57,7 +57,9 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#ifdef CONFIG_DMA_SHARED_BUFFER
 #include "dma-resv.c"
+#endif
 #include "drm.c"
 #include "err.c"
 #include "irq.c"

Regards,
Mukesh

> > 
> > Regards,
> > Mukesh
> >>>
> >>> Fixes: 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
> >>> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> >>> ---
> >>>  include/linux/dma-resv.h | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> >>> index c5ab6fd9ebe8..23c8db0b5214 100644
> >>> --- a/include/linux/dma-resv.h
> >>> +++ b/include/linux/dma-resv.h
> >>> @@ -311,7 +311,7 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
> >>>  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
> >>>  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
> >>>
> >>> -#ifdef CONFIG_DEBUG_MUTEXES
> >>> +#if IS_ENABLED(CONFIG_DEBUG_MUTEXES) && IS_ENABLED(CONFIG_DMA_SHARED_BUFFER)
> >>>  void dma_resv_reset_max_fences(struct dma_resv *obj);
> >>>  #else
> >>>  static inline void dma_resv_reset_max_fences(struct dma_resv *obj) {}
> >>> --
> >>> 2.53.0
> >>>
> >>
> 

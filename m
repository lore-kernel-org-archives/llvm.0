Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87B31DDBB
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017997; cv=none; b=DjlXPO6MdWfPj8fIPuO7Cf/dvexULJZbB5ZlKuHIZUaggVuAtg/fnmYn+Asyy8s075n/zC2a5ntQ1FbqEKviotB+hrzU9YCyOKHFmnp6WpRpG1rSK9XFVYMZIOCzI3ntnuPPbAYORfVG2MCI4+wNv2DyrfkMlj7z5pG1qfDBFPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017997; c=relaxed/simple;
	bh=pjNgn7D5+4A3j37DfrD6Q1pdbqZ6bsh85OABrwuUgno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ppq+VxVP+hPNWYLaycycu9LUd7xiDaYAh2JpXJ6jj6KpaHAkLVab7Fe0JQNzitaOrKEaWJr8LWqMmccAoafkxiOhlQz7GUymoi1/uw+E3RdFALzLnChhKnes5ivXjQLOS51o1U60nEE99pBkVLupaqj7OyvJD/5tqT/dMIfVH5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJno3gmD; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJno3gmD"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35e563b0ee7so3653255a91.1
        for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777017994; x=1777622794; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/RCpdNlcyc5wjzZkBzWIIC1nFpk179iwlYkDekoHWOw=;
        b=HJno3gmDqRxaRA7ll56k+03Tf2pNbEAMj9gCOlss6zQDk3h+3nfrC8ilGqnyjVm48x
         ZyzaUknX24I3AfRrnHKJXwdv4d6Ir9mJSyAQFrlwvGGbqFkk7V4zxhkd+B9aRZJJeWbk
         hg+bOOtIL5Zacj6C4cctyNfgwyGb6YmIkvYjpg4ZlqcYDOBp06VRBtYzaH4b09+WBBIH
         jEzZijqfCPNB29ggiUNRDQCRBLVQiVpdcqwcppf50JT8CpoESlQQSmebvn2a4eJZz2pg
         NuRM8dOyVCzvZui3mqidVO99G6Sksdfg92pX+RKUaJwMEc1rHx9FuE5CCfSZXZ6bau4K
         K4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017994; x=1777622794;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RCpdNlcyc5wjzZkBzWIIC1nFpk179iwlYkDekoHWOw=;
        b=GoqPFAlo5bzRHXW65Swzzgq/J1XAWBrbApHlkUdVFGPa//gLlNCoIx8oVtZenb+FWy
         jXvlBU3QjutGPwKeixb3b9zPZssUKZkHnfQhcw+0tXsE4PH+sI6WoF3c1AZzzSK19WLX
         Ip8HaU/EBuCO+P8pOrQD7S8bSyfhorlJgPn2aYtgB/HyMTbqugnDQ3VVZrEND70k992e
         mNw4vSaXe3794muymRN55hm3uUjXR2p1Nc2i6aXxy2evvoOyDalmPRyP7ixB8EVKVmRX
         w9f7AokeGflvBIslrqtVk8iiC58TAShLvYADW5ZHjB7/awxb7VjoHSxVJ6L4aN6xTA8F
         R/Ig==
X-Forwarded-Encrypted: i=1; AFNElJ8PEKs/QWHqByguR8lyV52V6UGvBj/WAlvjCLpJSLZ2GxA4lv533ucBOZKOYfCdwCvXtk0O@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7rUCW1yLYC1rrhdqSuGrRha0+FllZbx4kQ1taT6wOHgnphxat
	YfndHkOVV0JVlWhWFTPRbEjXN+nFunec5I++cPCK/WdLouai1OmqAaJ9
X-Gm-Gg: AeBDievPDxjefE0m56vZ0t9GSjJMrUkEhVQiJLDIw3GjXfNObHo3aiXBHX968afmEX8
	7FeFqJmR/zuNSRdCm4+NuIoV9U+MouKyVf8XV4VNPqhWRir3twMJKHg5DBXMsqFWMDrv/sv5ca4
	vsu3KtlwE/tBZ4kEGPL97xJAq60VGl6iVGPrhkghFps4GD1xsuFvqGVk32c72dZeKgq0JPVxlis
	sJR441W8Ag3cuijVdOdaMxvKtxCZZHk6lDGHYEH3eJJywfwF9OUm2s6MLZtaD/1IE1pKtbFfo3N
	fiXCi1/Da2aW3B8BcbHdvyFXawpHYMaNzUdZ7MS97XMT+uo365wp46bV/7tXnhRwJdjtGZJutzB
	oVX8ugswDVihSYMO9s5HbU2tRoWnC+GGAovMdI4p9l3fFUBrrHWtXqAlUMLG+f6pbxB+IuY/cDL
	kchxp68gGyUmPu8t9HgTH+uBNVF7Phwj3sbz7g7QxhPK1blDdQgyKQFlThQ1wvQcaz6j5CTas31
	hmByw==
X-Received: by 2002:a17:90b:3ec5:b0:35f:b4c1:91ea with SMTP id 98e67ed59e1d1-361402ee818mr23969038a91.13.1777017993532;
        Fri, 24 Apr 2026 01:06:33 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361419739dfsm23565688a91.13.2026.04.24.01.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:06:32 -0700 (PDT)
Date: Fri, 24 Apr 2026 13:36:18 +0530
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
Message-ID: <aeskOeb9uBiPptEJ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-3-mkchauras@gmail.com>
 <b4dcb464-7784-47e2-a973-6d731ab9ccf8@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4dcb464-7784-47e2-a973-6d731ab9ccf8@amd.com>

On Fri, Apr 24, 2026 at 09:56:16AM +0200, Christian König wrote:
> On 4/24/26 07:47, Mukesh Kumar Chaurasiya (IBM) wrote:
> > When building with LLVM=1 for architectures like powerpc where
> > CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:
> > 
> >   ld.lld: error: undefined symbol: dma_resv_reset_max_fences
> >   >>> referenced by helpers.c
> >   >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)
> > 
> > The issue occurs because:
> > 1. CONFIG_DEBUG_MUTEXES=y is enabled
> > 2. CONFIG_DMA_SHARED_BUFFER is not enabled
> > 3. dma_resv_reset_max_fences() is declared in the header when
> >    CONFIG_DEBUG_MUTEXES is set
> > 4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
> >    which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
> > 5. Rust helpers call dma_resv_unlock() which calls
> >    dma_resv_reset_max_fences(), causing an undefined symbol
> > 
> > Fix this by making the function declaration conditional on both
> > CONFIG_DEBUG_MUTEXES and CONFIG_DMA_SHARED_BUFFER. When either is
> > disabled, use a static inline stub instead.
> 
> Well we are clearly missing something here, but of hand that doesn't looks like the right fix.
> 
> When CONFIG_DMA_SHARED_BUFFER isn't enabled then the whole dma-resv.h header can't be used at all.
> 
> So you also can't call dma_resv_unlock() from the Rust helpers. Which means that we need to make the Rust helpers somehow depend on CONFIG_DMA_SHARED_BUFFER.
> 
> Alternative would be to provide dummies for the functions in dma-resv.h when CONFIG_DMA_SHARED_BUFFER isn't set, but that looks a bit like it just hides the issue.
> 
> Regards,
> Christian.
> 
What about something like this:

diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
index 71914d8241e2..53c119f1b144 100644
--- a/rust/helpers/dma-resv.c
+++ b/rust/helpers/dma-resv.c
@@ -2,6 +2,7 @@
 
 #include <linux/dma-resv.h>
 
+#ifdef CONFIG_DMA_SHARED_BUFFER
 __rust_helper
 int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
 {
@@ -12,3 +13,4 @@ __rust_helper void rust_helper_dma_resv_unlock(struct dma_resv *obj)
 {
        dma_resv_unlock(obj);
 }
+#endif

This seems to fix the issue and makes sense, whoever wants to use the
dma shared buffer will anyway enable the config

Regards,
Mukesh
> > 
> > Fixes: 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  include/linux/dma-resv.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > index c5ab6fd9ebe8..23c8db0b5214 100644
> > --- a/include/linux/dma-resv.h
> > +++ b/include/linux/dma-resv.h
> > @@ -311,7 +311,7 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
> >  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
> >  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
> > 
> > -#ifdef CONFIG_DEBUG_MUTEXES
> > +#if IS_ENABLED(CONFIG_DEBUG_MUTEXES) && IS_ENABLED(CONFIG_DMA_SHARED_BUFFER)
> >  void dma_resv_reset_max_fences(struct dma_resv *obj);
> >  #else
> >  static inline void dma_resv_reset_max_fences(struct dma_resv *obj) {}
> > --
> > 2.53.0
> > 
> 

Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6944414DE0
	for <llvm@lists.linux.dev>; Sun,  4 Oct 2026 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791102843; cv=none; b=Jl0anl2e8L9SpXu6JspHYrdWqDQdz1+mo+LAV6MRbASICf6gRXlRWTl5IUa9oi9vcp0g7SXcfnW2gHTmDjNTUh/zBxNd+qvbydKifGfhgjokjNWZ0so3zm/G16YeawmWZYPDsWRYxmeID1FskSwECknXk5JX/7qADiEqvBH8qPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791102843; c=relaxed/simple;
	bh=1sBv2SI3wnHyVQDHUJVigmIehBQG6EXZHnsM+TL5srs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NWh6tNneDyHbudRjKwkdpJsfOpPTjQHtS3F5d0lLnP+Go9Q237ct3k1s2uQTVVhDKk91neWAc+pssNjrFezcxoM8gkxYvyu4lvBUiTinD+s48vSYJnnitsVphsZapPNkhTtAFSCCW9BY373WahZlQ3ZOL1Eu4KL51TvvvObleNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dA6h5sRv; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dA6h5sRv"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so478574f8f.0
        for <llvm@lists.linux.dev>; Sun, 04 Oct 2026 01:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791102840; x=1791707640; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0HFDC0D77tUqEmXehAlYyAx2E0DK1wOzX1zKg1ym3bo=;
        b=dA6h5sRvr2bKIm4Oq9r6x+6JcuYycHxqIYuX72KORFn2RrohtKde0gHt6LiOSKE/fh
         lzVGe4Mj/Bui5n1hgjWLNo/EvRNRbA+ZYzATzdio/vMOOdWk6tfIpsgECddIAjDuLf3W
         As+zyhmC2JDGrUx+6AmpNAt45qT7Hmm4DY7d4Wm55bZ/N4Ogh0dVLFruEPtBbCGCAdBH
         fNoRM+MZCtBgnSu+ZsjG5BvPJv6jls8Jz3PsmZT9Rcjx4KuI9HdfVkdtiq3YTLwsUHIJ
         jpg5bbafTv1wd8PCyIDC+q8p47Fzvran6Py0rbmvwRgB5AalDhJEDc3HeRZJujgIuRv4
         vxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791102840; x=1791707640;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HFDC0D77tUqEmXehAlYyAx2E0DK1wOzX1zKg1ym3bo=;
        b=kqOfUvZaaNHIPOujRfOcBx5a/qE2CZnhuGf7DlB8pUzga6me95gwoPjfG7wLa93aME
         F85s3caDprQ3sB3VwO+XPA9rEuRGNOLn/WJeCh/qDmXj9OeCk+PWmCPlG0KUvCPlUZua
         OqvXNH6IAdBY8pN3jmJXuysXuFsWG6Ni4vsH2F4Oge8nSyq+bDpNbCp9V0+yYmOeym/B
         yNpGE5dhzICzvKkMw6+2eTC4b9XBjq9E2PxMUffGSPJKvF60KNjFrwvTouqZFA+KLBlP
         CVb17iOsOMqczyhQfcBu/bQAdvsYr5w4UDBXw1F2OOYuGnH+zBNzB8J921Hl5+hUsf71
         xXFw==
X-Forwarded-Encrypted: i=1; AKwUvBxUJ+bPJIB1DyF3H4L+UJOpj+rX91ZyHq+euZdxOKbfLWVGujk41/XYNpVfPtFLAreX+2vo@lists.linux.dev
X-Gm-Message-State: AFq9FYKku0KaoNyu88JY8sMP18oPc8Fofs/w0kktBpvw4Z4xZR0QADd0
	cprzfosg0OB4OkXTg4OSkwrs4adFOSTAZc6hGfNmq+oaR7JEteqguoHm
X-Gm-Gg: AYBFou2gCk6qwO66jtoZD553D4nQUkt5ItdloNXA2GiljSAvG2TLtxZEcIDVqhkKnp5
	DPsOItdCVBqdUT24wB+K+swPfYAeN5NxUF8nQ5skmxwCCJ5wLGGl6z4s9pMGQGFWVPhgSrZ4Aah
	vSAWaupkvKLIjrm3EZhxOM1+3rhulbcxD9+WamcCZJtPW4YQTiCYKluwPnMdU6trMreSDBrHlVh
	op4tiuYHn3S6SIYQQw3s9zVFKoYWMviQfwhwbHyNeGEi1Z710GuLWFgJew1ZXxIu3gTepbBnk/X
	q1FuGgqYp01V05dlfUvUq13wEuFce4uCpkLThS2hz19D/gblCBCFvHkLJEUPTJ/fx7pC/Uc/GRJ
	PORK/QwaQeMpYchpmfhbPrDl3qj3KfEcQ+/gx9UrMo0PLsxnUPdWG0aHhOffqZaVRn5UAnZz6CR
	44ADsB54LsmKM7VdXxPCOK3nto5bdTYayD29hG4Ve3R+MFZzVlxTLxGX17w4YkYLJhORWS2aDf0
	I1hrQX2Sc9pnBTiciAG/PyQCEPhrQ2eaZHE8duNgyEz7g==
X-Received: by 2002:a5d:5d0f:0:b0:488:83f7:633a with SMTP id ffacd0b85a97d-48b12736b49mr11750202f8f.28.1791102839800;
        Sun, 04 Oct 2026 01:33:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f04f8sm17350793f8f.9.2026.10.04.01.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 01:33:59 -0700 (PDT)
Date: Sun, 4 Oct 2026 09:33:57 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Russell
 King <linux@armlinux.org.uk>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>, Jens
 Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, Nick
 Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu
 <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, Phillip Lougher <phillip@squashfs.org.uk>,
 Sungguk <sungguk.na@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 1/9] lib/lz4: import upstream LZ4 sources verbatim
Message-ID: <20261004093357.33a124b4@pumpkin>
In-Reply-To: <fac0f401-bbd3-444b-a755-53cc393673de@samsung.com>
References: <20260925-lz4-vendor-upstream-v1-0-1c7ffbe21c4b@samsung.com>
	<CGME20260925113452eucas1p170bfdb34dfbf670a14a6f8f0c2f5094a@eucas1p1.samsung.com>
	<20260925-lz4-vendor-upstream-v1-1-1c7ffbe21c4b@samsung.com>
	<arn3TC7BgjTXWmdG@google.com>
	<fac0f401-bbd3-444b-a755-53cc393673de@samsung.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 4 Oct 2026 01:50:39 +0200
Michal Wilczynski <m.wilczynski@samsung.com> wrote:

> On 9/28/26 07:19, Sergey Senozhatsky wrote:
> > On (26/09/25 13:27), Michal Wilczynski wrote:
> > [..]  
> >> +int LZ4_compress_fast_extState(void* state, const char* source, char* dest, int inputSize, int maxOutputSize, int acceleration)
> >> +{
> >> +    LZ4_stream_t_internal* const ctx = & LZ4_initStream(state, sizeof(LZ4_stream_t)) -> internal_donotuse;
> >> +    assert(ctx != NULL);  
> > 
> > Probably in some other places as well:
> > 
> > LZ4_initStream() can return NULL, but the code immediately derefs
> > the pointer.  The assert() check seems to be misplaced, unless I'm
> > missing something.
> > 
> > I suppose those need to be decoupled.  First LZ4_initStream() call and
> > NULL check, then stream->internal_donotuse.  
> 
> Good catch, this assert() is a noop in the kernel (as any build without
> LZ4_DEBUG), so a NULL, undersized or misaligned wrkmem oopses in
> LZ4_compress_fast(), and LZ4_compress_destSize() and LZ4_resetStreamHC()
> carry on with an uninitialised state.

The assert() is also just a waste of code.
Debugging the NULL pointer dereference is just as easy.

David 
 
> 
> No in-tree caller hits it (all use kmalloc/vmalloc), and I listed the
> alignment requirement as a behaviour change in the cover letter. Still,
> the vendored files need to stay verbatim.
> 
> So in v2 our own entry points can check alignment with a WARN_ON_ONCE()
> and bail out early. It might be something that we can fix upstream as
> well.
> 
> 
> >   
> 
> Best regards,


Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C371F5847
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775560673; cv=pass; b=VY1RhyOz2pT92B8HHo+E4u68hTU+HtMxInrW8I1RJAwOkvh/5KQ3xkEXCr8i1vT+x28npn3fueD8XumG+uocpVzcVsDwQKynQ8n65VPJ8N+HsozHUhHqEFSunBwvdGuMh+p5sVQnsWQr6HtAJ2/eVkvaFBGraEXFLk4uZcbHvAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775560673; c=relaxed/simple;
	bh=ZqkWlF3HcKw9IeQbnlO7Z8vKgfQ7zuIoMkMXPESU5qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIj8A9uJXtYzQ4tick587U6Sl4g6qc9ABWHv2IqHp0i+Ha3taWxAcQtFXjx3jkqzzRjjVvAt7HWx5UH7jadHbSvWqXJxA1iDoR5nMc3qH+iHlfuZg/KyKACkUy4N/rVk/V7sTgurwZxIdl+jXArkOfKEW9EBdEUuWuo6F5VeTUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n/gBJX82; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n/gBJX82"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12776bebe9fso193531c88.1
        for <llvm@lists.linux.dev>; Tue, 07 Apr 2026 04:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775560671; cv=none;
        d=google.com; s=arc-20240605;
        b=KLKyKRAGs3eJBlS94u05eZDJYtaXlth1Sf0bwbdQ9l3XqJm8Tn58sBtVNUp3zo0856
         xOscw8Zfd9i50IVQiCjviUUiRk0sS2jKDurl7BGVjHo5mnKqguNEy5920B9O1fQrkCse
         8p5hBpHQV2y65QTq6sr0hINoCbIgikavE887pxLbEVG8rzEOszA8JtELMdA9iy3jsr9B
         6NEAcDALpO/LJRpFzqv2SNOrhb+cIth6XplmyBvMYS7/gR6PXQBZkmWvA7nEBszCYS2x
         vPAveTofBPB0gqong8DXTxYS4Oz2Upf1CoQGlW7WvgVcHgnw2xAI5Eiw+LZzpTFKUcf5
         EVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Ot/6cmUyAYlu4w3F36LFgW3QWHoYVPnUsR/JCweN/I=;
        fh=b8knZDJSGrsmVcjxSIBNuIsC7sHZ361z9BGmtc/rY4k=;
        b=E5gQpakM+YNijlJfMBdJRWUrVDIpA66UB6piRNtOfn+2jlUHHXT+pihnnEZm8w61ka
         TYx+NTZyE+TALwj1jFp7zsSqbCJpdJ2gGWetPtINh9mXAjaLuBN6ZWNkJu+I1Cthf6/a
         7KkaaA3ZEwIN6hJlOm5ncHs0uRJHrp3qID0mbaxVoKuDAPhZ51ZgTPOX7GOGSMwUu7P6
         gytLcS1QnHnNH6VKGECdBW+AVs39bGryR1eQ4sUaY9aGQ1hvuI/1qJiafK5/h4TL+7/P
         pPi/J7Qxrt5BGivU1nErV9fvl+zf1oFNhf+DOzzG2e5RyFfCc2JHF7gw/l39/P+8JtoL
         RYIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775560671; x=1776165471; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ot/6cmUyAYlu4w3F36LFgW3QWHoYVPnUsR/JCweN/I=;
        b=n/gBJX82yGya0xk+SsqjEe9cWvOB/Kqvy/OYKuhtK9Y9E9t5/W6lhfPJ1++B6zTIqC
         gTE92upioMrLapAnAU3+NyDqP36/64XhhUWBR8SNPX7n/fcJq24ek4CLZjXvGTfbndmj
         7BzxAv7HsgID8q/Eyj4ok/hb6HIOryOLYfz6C5elGCGYK4E3bZ+En/yUM/Tucbw4Np3z
         BjVBMgdU8fniHZqO3HbDHoe87NwIjo7bXoD/GoF8abdT30WH2qLGUvCrwVjYRgr++Eeh
         paNFBYxvEa5JiFseuoBsGFjECMEs22WjPZMcGBCuDaIWg3344/ZMEJR87pFbmgtQLIqL
         5hhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775560671; x=1776165471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ot/6cmUyAYlu4w3F36LFgW3QWHoYVPnUsR/JCweN/I=;
        b=TsTQMtrORwc2PnkELKCGKCzm1oyqNFepOfE6Zg1qJOYKutFXiVPlVf4zcbWfjv8292
         1OYlXdLfkTuiSVDqCGgyVq4ZzNFtpxR+D/IC32gwgQMKq/8JaNyznoi13jmRts2UqJoe
         W+zNYOdfA1jR595OcKPQORbvM+vbn5r4kwcIpcnmCB9Mwn93fMoTeGbS+6PxHRCPmtLC
         STXa4/ix2uEvb5SImOvYLcwgOFLjXYNjHNryMuNnBnj/SPVoZVlL/RRCfMyGQ98slfiH
         SGVW22AwmNktxdY6COEChpuqEhZcHJf/Z432RbVborhkv4TlILeCSGicllUXNcbbspwg
         M34A==
X-Forwarded-Encrypted: i=1; AJvYcCU7bo+s+LlzdLXetq/mpD5iI1Gu0T+saFGw5Z2XycxFGgNQW6dlhAHyLXLK0Fu9dUJCP1bV@lists.linux.dev
X-Gm-Message-State: AOJu0YyyFNb7BoOtwtwM5f9nKE1NOaR7yAro4OQUHBch4RV+bgbo09yj
	14CBmbQ3/6dZ+GwMw9a8C+EHek2OxzSQ/hiv29mJcxCzITYcjsbFOrXS2jkjotPg8Uo/i+E8Ur4
	MLja4xPOwmzjS5J45WVxreldZVzzBl0AlfphudQXY
X-Gm-Gg: AeBDiet3S9bTDwlbd1QtuYzwLCoFLV3jh/t37YbTLWYvOB1Zt0T/Lxf4GTe98KtsJ7H
	H5APAxi4oxSpiohTnA4/226aB7xr3QJMv6Pc/T9UcDAGmvZKue4X7ARdZWy8+APXVU6pWI4yNNU
	41Rtn2dDmwCd3LKvIQBWpxRCTSA0sJy0afdewiThfF7LDfE1qwgpJiItMh21Jz9oY4XkGtKDijr
	rtY6IKpTT2M6/jDbcKiwtE/svRqbLysvKZEcGM9kYlr7S9C5E/GnyFzhXEW2451sEc7hg095+oZ
	+Hlh6rnw8clxmGIr6dIE6niooDzrOLsL9dxzwRg=
X-Received: by 2002:a05:701b:270e:b0:12b:fc21:874d with SMTP id
 a92af1059eb24-12bfc218ac5mr4490405c88.19.1775560670230; Tue, 07 Apr 2026
 04:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331111240.153913-1-elver@google.com> <ac9d5O5XehnXRc5A@hyeyoo>
 <d0fe363c-2e8f-44a4-9b64-3fa3ba9a5773@kernel.org> <adM2XVZf1DekahlY@hyeyoo>
In-Reply-To: <adM2XVZf1DekahlY@hyeyoo>
From: Marco Elver <elver@google.com>
Date: Tue, 7 Apr 2026 13:17:14 +0200
X-Gm-Features: AQROBzAgGN0NN5VZKje-TIGicheiDUli6J3RmxbH29tvqb2R9oxdlLQMmt6dDl8
Message-ID: <CANpmjNMeaWWuDMAj_n38U9XRqgZQz30ca82Vy10Bg=NoDfZ5ng@mail.gmail.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, 
	Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Apr 2026 at 06:28, 'Harry Yoo (Oracle)' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
> On Fri, Apr 03, 2026 at 08:29:22PM +0200, Vlastimil Babka (SUSE) wrote:
> > On 4/3/26 08:27, Harry Yoo (Oracle) wrote:
> > >> diff --git a/include/linux/slab.h b/include/linux/slab.h
> > >> index 15a60b501b95..c0bf00ee6025 100644
> > >> --- a/include/linux/slab.h
> > >> +++ b/include/linux/slab.h
> > >> @@ -864,10 +877,10 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
> > >>   * with the exception of kunit tests
> > >>   */
> > >>
> > >> -void *__kmalloc_noprof(size_t size, gfp_t flags)
> > >> +void *__kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
> > >>                            __assume_kmalloc_alignment __alloc_size(1);
> > >>
> > >> -void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
> > >> +void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node, kmalloc_token_t token)
> > >>                            __assume_kmalloc_alignment __alloc_size(1);
> > >
> > > So the @token parameter is unused when CONFIG_PARTITION_KMALLOC_CACHES is
> > > disabled but still increases the kernel size by a few kilobytes...
> > > but yeah I'm not sure if we can get avoid it without hurting readability.
> > >
> > > Just saying. (does anybody care?)
> >
> > Well we did care enough with CONFIG_SLAB_BUCKETS to hide the unused param
> > using DECL_BUCKET_PARAMS(),
>
> Hmm yeah.
>
> I wasn't sure if we could do this without hurting readability,
> but perhaps we could...
>
> > so maybe extend that idea?
> > I think it's not just kernel size, but increased register pressure etc.

I'll take a closer look at generated code. In some cases the compiler
ought to omit zero-sized arguments, so I want to be sure we're not
prematurely optimizing and the size increase is not some other effect.

> Something like this should work? (diff on top of this patch)

Thanks, I'll consider it.

Re your other comments:

> Assuming not all people building the kernel are security experts...
> (including myself) could you please add some insights/guidance on how to
> decide between RANDOM_KMALLOC_CACHES and TYPED_KMALLOC_CACHES?

You can find different arguments for either, and in the original RFC
that was part of the discussion. However, my biased view is that
type-based partitioning in general is the stronger security boundary.
Because it creates a deterministic separation; specifically isolating
pointer-containing objects from pointerless ones: it effectively kills
certain classes of exploit techniques that probabilistic defenses
(like randomization) only delay, especially in environments where
attackers can retry or use side-channels.

The current pointer/non-pointer scheme is relatively intuitive with
well-understood properties, and a good start. However, an open
research question is if better alloc-token ID schemes exist: one that
is tailored to kernel data structures that would meaningfully increase
exploitation difficulty further without increasing the number of
partitions. Since an improved scheme could simply be activated with a
compiler flag, having the baseline infrastructure available and
maintained is the first step.

> Now somewhat out-of-scope (or at least pre-existing) review comments
> from Sashiko that I think are still worth mentioning...

Indeed, these are pre-existing issues with RANDOM_KMALLOC_CACHES.
Worth follow-up patches, but this patch here wants to just get the
TYPED_KMALLOC_CACHES infrastructure in place so we can build on top of
it.

Thanks,
-- Marco

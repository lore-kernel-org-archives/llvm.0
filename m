Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6B017B43F
	for <llvm@lists.linux.dev>; Sat, 22 Nov 2025 21:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763845307; cv=none; b=S8cDh33mfrqeECPaSQKU5HqLIyi5GQa7uDfPToVaIlAOh4acntl5qAvZq2B5KJB1NHg6yCHFMr6tDds50hyPFS66a/vevdZNohSESFRn+2ieHTDiHwpQb65AfnQC0dua9cWbd+0Yl0/ZK1oleDbtaH9t3h6ZVabUcA6tty8zc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763845307; c=relaxed/simple;
	bh=ib193E5ulCM5VsBOwNwbaiGEUjWWX9ZaUyLWHVcJxYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPv2QlKV+49QCQpnaxh/FAGiAvPgMVyAvwBi4hx+tD51an0P6HOWxbEEY+ZnJFr0SErDsU/NZcbNlMQDzJuthIUMdr/lN2asB9UFvYL4tONuZcIrfRPMs8XbmYFlGwO/qsCCqgkswgGvuf+Ovg1plkkDlAF5CLX1raV2udur+uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=P5lRcDDV; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P5lRcDDV"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so4890106a12.0
        for <llvm@lists.linux.dev>; Sat, 22 Nov 2025 13:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763845303; x=1764450103; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jQGcvOhJEN1J1/uUViuAgWsDBHc/YH/i6gYOyi8rm/I=;
        b=P5lRcDDVijJL9RAw5Bc/AAURd1ozJDbv6wBOi/fkb3SvsBiuJPhh4dJp8wRv2595Rr
         TojZL3H0Yqa9NINE6r6xsneNv0NKLQ1GjSdXxlhsBxPUKdMQwWApP6d0OrQC2TrdgT8L
         ocgIfQvG/+qhmwBI0CUEvzqVcbaBWNpQKoCgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763845303; x=1764450103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQGcvOhJEN1J1/uUViuAgWsDBHc/YH/i6gYOyi8rm/I=;
        b=oq2yh+ElZOs7LOZRseHr+Ect3ykvh9j3bnzE2i3xD7kMtau6Uy+HyrgL5tzF7OqFAC
         ykXKym18eZ7ye8ai1n5GPyQc7KpdHbC1HuLYjn0B1HTwndPRLzY/mcTXNex4busPoWSm
         2SedUZ+pwdxZH3kIrmiDC6DnEwF6VDSab2xKFJ+bxmbk1cZhNqclam5VOgK/3aNbbOkf
         z6TGAAc/4UlZYt30iZPF4Fa9vBK0Z6xWpSdvjXghZY45TeadA0FSAasmZn7ozHJ4OOh3
         HJ2GlVx1FsXoOccv5kRGh8GFU4X9r30MzvZ968uOyg6AmjBYlAIh2dnE//XvViJSonIu
         C1BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYMWfWAVBKTXJvV42Er7ySPSdDVZN/m/JfcN5/JF57bl4X0qekNtf1yvwqHcJaddAJYC4B@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu1N2UtYQ3zA+IIxL/uWJddkl608WgidgtUR8O139+nnmUsHhk
	z1aIdUE1tc3Llg97dJHp/rmP19Vv2t5QzWHm7nhlmQ9gNKfg9bC07K8FL14Iu043MFMhi8cENtf
	Qq/G45kBD2w==
X-Gm-Gg: ASbGncuBu4dUeQGsLfOLEbYNEAN+TFwrJZeZzOzJ0w1jD4iX/WMlwTb3Er1zzgoSmu1
	bUkU1FbJg27gNmiT+/KyX/qQG2hs/krAgLeeRiKHnLaOHI+Y7qJKcvQ2ttap3Wjm8VqBsFEHtFY
	KPQuMT+Cb5iltFTZ6PcRKrpWYhvPVTuFbK3aivXfvgqVNp3XFRoaYaRDxcTbvr86KeJcqsswhrX
	ffyiMy9ZSu3f7RI8MJEr1Z3ezLEi6k71xXY59FqStV8ZGJTDbLvJEh2OLM8nLXZqGZdaIKJyLoF
	l0zVARkSRRHBIWDliLJ12jk7ailN8sKWun6h8tS027Z132FpOEIi4v3t6l+0UIEX1LLjLprKgCr
	qUOTkeiramQp61cAzvapVjoewr99g4zs5Yj9AMhr0fhjiZgZwdRM1vjMNP/1KyNaWPL9Y6RU+fB
	4CaWp6jDee9VCXGs81glJclQ8egjsbsHttmgfZbVCLfEwL9axOtSW1ok8pkvVArgtvprczKJw=
X-Google-Smtp-Source: AGHT+IHvC/mrcJAiZ4lF/LxDFFLzfrcL/deP6x4rI0nK08RvIY+CmTCwiCxNR7qGtz96wPfk66cvXA==
X-Received: by 2002:a05:6402:1475:b0:641:3960:511 with SMTP id 4fb4d7f45d1cf-6455433c4dfmr5340565a12.7.1763845303428;
        Sat, 22 Nov 2025 13:01:43 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363ac98asm7661115a12.5.2025.11.22.13.01.41
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 13:01:42 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3720e58eso2406158f8f.3
        for <llvm@lists.linux.dev>; Sat, 22 Nov 2025 13:01:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjeizC+Kifoh40J8daAEf+QOruHJsRWGw+ink291mYnWKwN1jlAITOdgIvlqGa/3Vrem4J@lists.linux.dev
X-Received: by 2002:a17:907:6e8d:b0:b70:7cd8:9098 with SMTP id
 a640c23a62f3a-b76719d4d02mr618930666b.61.1763844895821; Sat, 22 Nov 2025
 12:54:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251122014258.do.018-kees@kernel.org> <20251122014304.3417954-2-kees@kernel.org>
 <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
In-Reply-To: <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Nov 2025 12:54:39 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjxj---dy5haOvNXjg_Xz-mDQciGL7OnJnpJpjYD9Moog@mail.gmail.com>
X-Gm-Features: AWmQ_bnv84PkVSmG-NV-hwB1C2eg-gsEJfo3JVaH66sxShWKO-Vcyq708ZlrB18
Message-ID: <CAHk-=wjxj---dy5haOvNXjg_Xz-mDQciGL7OnJnpJpjYD9Moog@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] slab: Introduce kmalloc_obj() and family
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Marco Elver <elver@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org, 
	Randy Dunlap <rdunlap@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>, Yafang Shao <laoar.shao@gmail.com>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Btw, I realize that we don't have a good way to do the alignment with
the current kmalloc() interface (we do for some of the vmalloc
interfaces).

So for now, it should just have some static build-time warning if the
type of the object we allocate has a bigger alignment than the
guaranteed slab allocation alignment (ARCH_KMALLOC_MINALIGN or
whatever).

And I really think the first version should do the minimal thing that
actually matters, and strive to deal with the simple cases. The main
things that matter are

 - the return type should be a proper pointer type (so that you get
warnings for mis-uses, but also so that you can use automatic typing)

 - making the 'sizeof()' match the type

so honestly, I think 99% of the gain would come from something fairly
simple like

    #define kmalloc_verify(type) \
        BUILD_BUG_ON_ZERO(__alignof__(type) > ARCH_KMALLOC_MINALIGN)

    #define kmalloc_size(type) \
        (sizeof(type) + kmalloc_verify(type))

    #define allocator(name, type, size, ...) \
        (typeof(type) *)name(size, __VA_ARGS__)

    #define kmalloc_obj(type, gfp) \
        allocator(kmalloc, type, kmalloc_size(type), gfp)
    #define kzalloc_obj(type, gfp) \
        allocator(kzalloc, type, kmalloc_size(type), gfp)
    #define kzalloc_struct(type, member, count, gfp) \
        allocator(kzalloc, type, struct_size_t(typeof(type), member,
count), gfp)

The above macros are entirely untested. But they are simple enough
that even if they are buggy and I miscounted the parentheses or used
the wrong name somewhere, I think the idea is clear. No?

(And I made that "allocator()" macro use __VA_ARGS__ because
kzalloc_node() and friends would want that, but I think it's starting
to hit diminishing returns at that point)

Hmm?

               Linus

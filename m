Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0801F1DF75B
	for <llvm@lists.linux.dev>; Tue, 25 Nov 2025 22:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110851; cv=none; b=ZnXsrB/OF7HfzwWZxd+ymy3alubxdVv6YKgVrI6crr3wgRx7RlW5gicqU7PEM48xY9EZ1r7dq+NVAv+eQtmtqBOu6Gyr761MFeZ+dZIG14b2EryKjdsFhlUw3SKSzZh1zlrvxUp/Z3Xqgp33bxEVVKpYF44NVIrk0LXuEAO6Mi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110851; c=relaxed/simple;
	bh=jsL4T2UPDPxhD8xl6D8pYITWdOgOn16n1Vvm+6LuL64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i8xYgHmDTS0E/3vjo2ZHIYh5nRHL8h6OGGGXZi+bka1jrlFbJ5NllVCKcvGMA9C3R01fnyMhlmXMxHjoTxeewivCFxRExaVVeUQq+7Rqh81F7w0U98IZcYIzl2rIFcn09+GLIByttAQL5PkQYFjPfeGQqYHxALeER9LONkwuInE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cwjYPwXm; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cwjYPwXm"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37a2dced861so2664241fa.1
        for <llvm@lists.linux.dev>; Tue, 25 Nov 2025 14:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764110847; x=1764715647; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PICSSTOVtSfieJ36Y7geN1Ip3ZesP7jblQQJyY8Iec8=;
        b=cwjYPwXm9eRubhIPOoIQ5wIQEbcl/SQZUntFp4mPajc9vzs4/pZES7WNLpBjtc9sy/
         TNYiejtSj/S3oTtcfmSVXrfgRSmuYTKYwFJ0QWpPaLPDI/UjLM43E3iuHWkJaf2ac68f
         iQKgPbBo3g2t9lyTJkQb6wb8ry4YcUnnD9Vew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110847; x=1764715647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PICSSTOVtSfieJ36Y7geN1Ip3ZesP7jblQQJyY8Iec8=;
        b=htzqr3PYpkLBRZu/mqVvLP1V/oReUPmBceKCrOYHe0ZE/4UGchPNN3VYinxILNMH4w
         rF9WaACmFfB5Rrx2HlosUkMkvikpQ4s0TqQ035A9/Q4GrEnS53YWxt4Y67p9XX6su3yt
         sJskuV+b0YzD/9QhFDSPcQzRWXdegPrtx+zHSacZvKiNs/3MH/yasEFwO/fR+rHnm1Fm
         u8NbBEJqkghrXc2uXw3UGY//geg/xJ383xRMSpKQqk/HZMaYuwLk6Fj96SWToJNUpsgo
         /EZ4Rth56OzlHL6+BeBp1wg8bZijGpZu3mN1vosjgGrnXpGxyVt9/7nV2N22iNlmMLk2
         UgJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTw31metBk0/fYfEFj2RPhqAV/QvXlBSIxT2yQ7ruwsNa/nFVVkAc9zhvsxwVDejgjagD4@lists.linux.dev
X-Gm-Message-State: AOJu0YzMUEQ5SPeiETb1xJMXWpXp+jr2OiEQnrggkmFYJ6PtaG43YRim
	yLQ4P9x7k0C6JvbpLebbiXsLEn3Ed9gtZMchNAxQvlOW034TMRWbXmVihlTE/yNCvhmmO/RX64y
	cNxmtaoE=
X-Gm-Gg: ASbGncu5LXimQpMLvcJCJfuP/ydQP6J89FMeAeLle8PG95I1ba+PH0hl9HIA0m+n57V
	RgaqQtzMaTboVL2lWlTztbBolod56XHV9ljQHa7I0ZMd9sDtqxeJvb2po+3u5Fv16P0diqgeULP
	JVffhbtYSR+XiU0veDyYC1rUJcKHmccoT++WBU1Tcd8EFrfL08M3h6Nkp7dCQCKLl+2qpUBpDsh
	RKeqNEzV2lyci3x/bbRetBRyo/lv1CNKrfHQuF+iwcgkPurA2aHCa9vkrfPhkt3bSlStOtXdPQx
	gBl7NZTJpTy3XvzGLpMK6jTq4vbwhOykN4GtyCxwgMXvFPqnN9LSMDnD0rm2ctlT6CJN4lP80lb
	1nCOjdp6cc8eC7wW83C4/8rLq/CUquji0IYQUVS/NwjFsCIwCiCXOYbwEO6edzZoCud4TkEu96P
	WVSqLIY5cIJrCzdkluB3lQAfkQxWJ3qTDa8uWKoS/3Ejc2UcoINk3Vn2toVkiuNheN
X-Google-Smtp-Source: AGHT+IECv3p2DiINyARJ+prCaOuvKnVLO8DUeI98pJW2SpqX61LOdYNGDYhTnZC3QQZTFvckoiR/hg==
X-Received: by 2002:a05:651c:1507:b0:37b:986a:fc1 with SMTP id 38308e7fff4ca-37cc83963f0mr60060821fa.22.1764110845937;
        Tue, 25 Nov 2025 14:47:25 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75705sm5492252e87.15.2025.11.25.14.47.24
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 14:47:24 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37a2dced861so2663831fa.1
        for <llvm@lists.linux.dev>; Tue, 25 Nov 2025 14:47:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYkIwyA12Bdxt9eVBB+g6CEmVZRboi7LewvJk08uiprmYA0/n30jTnSFU5IgGDn4SBoPza@lists.linux.dev
X-Received: by 2002:a17:906:d553:b0:b04:48b5:6ea5 with SMTP id
 a640c23a62f3a-b766ef1d27emr2056801766b.17.1764110497696; Tue, 25 Nov 2025
 14:41:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251122014258.do.018-kees@kernel.org> <20251122014304.3417954-2-kees@kernel.org>
 <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
 <CAHk-=wjxj---dy5haOvNXjg_Xz-mDQciGL7OnJnpJpjYD9Moog@mail.gmail.com> <b7804333-6030-4bfd-8e0b-4479f87060ce@suse.cz>
In-Reply-To: <b7804333-6030-4bfd-8e0b-4479f87060ce@suse.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Nov 2025 14:41:21 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi6nqPAveRPjrH_=ombtpz00G--RH9_MyC38PzsDHcb0A@mail.gmail.com>
X-Gm-Features: AWmQ_bnHmATmDGg6MkJpXYuB1__YO7XbeBdtXEi7jxM1H4BelwLZXehOF1vhEBg
Message-ID: <CAHk-=wi6nqPAveRPjrH_=ombtpz00G--RH9_MyC38PzsDHcb0A@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] slab: Introduce kmalloc_obj() and family
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Kees Cook <kees@kernel.org>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
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

On Tue, 25 Nov 2025 at 10:56, Vlastimil Babka <vbabka@suse.cz> wrote:
>
> >     #define kmalloc_verify(type) \
> >         BUILD_BUG_ON_ZERO(__alignof__(type) > ARCH_KMALLOC_MINALIGN)
>
> So AFAIU this would be too pessimistic. I'm not sure if the alignment rules
> can be sensibly encoded in build time checks. Perhaps yes, in a similar way
> that we have compile-time size bucket selection via __kmalloc_index().

So I wouldn't worry about it over-much: it's actually pretty unusual
that we have any odd alignment rules for anything that we would
allocate with kmalloc.

And I don't think a 'kmalloc_obj()' case needs to necessarily *handle*
such unusual cases, I just want this to be *detected*.

IOW, what I worry about would be people who use the simple object
allocator mistakenly on auto-pilot.

So if it errors out about "you're trying to use the simple model for
an object that requires non-simple alignment", that is perfectly fine.
Those cases can - and do - use more specialized allocators.

Yes, yes, in a perfect world we'd just handle that case automatically,
but it really is fairly rare, so forcing people to then use some more
involved interface for those cases is maybe not optimal, but it's
perfectly ok.

              Linus

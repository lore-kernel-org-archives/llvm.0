Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84891FAC34
	for <llvm@lists.linux.dev>; Sat, 22 Nov 2025 19:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763841570; cv=none; b=LDDWLNQ+1ppiIPHivmxHjCvk0iiTvGjAatBYq+clzOMaM3vFay11hz3wYsUkVJCHnF5lclAFtUZXnLPcYgaVQsVb//UAbgHR1oRb4r9aJ7FKAvfmqpvoqIa7qyjqLMyZ0j7kwWWVNUijsABeTX3Pub9RcdpkClr7u/4jNmvSzlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763841570; c=relaxed/simple;
	bh=Kj+BG0xdKGqNhRUvh68tbMkfYejpZnIN0MW2Q/oBVMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdOcajiJZs2Af7ILmanRabNXlJGItykci5A5t7duNOKA/GLM+jq5gO1csfSeGze+rAgZVyBw33z6qtd6DgeJJS8flobzVBM1NDJNGIvKeMUZoRWfpzctAkqzv8DFOsb4A5dk9uoZUCLdG/sPnWfyQwgfQ7T/baLEtoSggRWslL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gjKHzCUx; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gjKHzCUx"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so4210480a12.3
        for <llvm@lists.linux.dev>; Sat, 22 Nov 2025 11:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763841566; x=1764446366; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V8N0HudTgWpU/ayUVIeNFnWWwreLw332W8BlQTA6nQs=;
        b=gjKHzCUxUkL8oQYmWSFuDrSb79L8L/dMSzM7UlmHT0s8OwyGa4PDJ0QQyAzGViEueX
         sv1stpSYusseAh7X/e8IVLGK1T0uKXsjsH1TW0ObFQcxFOeU2JHJqTziOLOOgLpeyyDG
         yp/ks8pkt+8/LZLI5XIoIb3UrhkYu6JirYaFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763841566; x=1764446366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8N0HudTgWpU/ayUVIeNFnWWwreLw332W8BlQTA6nQs=;
        b=gpd/kMN0JANjgNGlro19mNEm45Qxc3SKB5WUxSlPhWYwSp77YCw7aclf/x0rEZ6b28
         S610EN0L53DdfdGitkP61EWdhIcB19sV/jY8GSJnDG4Kpl4MUC6bEe96eIdu9J5ruqQ/
         MNxc4B1n2E3EN2oVCah7NeGXJOdsjyJVb6eTQyylPk+enIIN7tONDdiCHxrs2BFPjadL
         /vBTW3jUZAfjKEk6v/e87O8+BvNpCTuw1Zw7dwZA3Bo1Sgm0rHdgz0AJku/UXv/aLXBb
         i2/tBx3Fwpc+VlOB3uDksF9fOaVSi9eAnkq6Mr70kXmqHU3RjSemis8CU8dbWYD/SMb8
         ayGw==
X-Forwarded-Encrypted: i=1; AJvYcCWUz8WDfq5LH9e+JgY6bkQbmf/5C8wq3DqAVmGfzjszQt5F7MSszekHw8gXUFNjz2RA3Z9v@lists.linux.dev
X-Gm-Message-State: AOJu0YxRPln+XTK5prcUReNG1SNYtbPR54EGxIHZ8wJZ/ozw74/LWnlx
	C9HtkKIR6Fmc1n1uWhIYehjduMzBF2W8Bk6fDjlHgiKInirjzscIgHZWg7gAhkMYCDW0jFuuBZi
	zGDu3v1hHRQ==
X-Gm-Gg: ASbGncsno6qThTTSbHQmbdWG/ZDezDMBktCT6vio0xhMaL3UxelX1PUSSO5zzS9nQKg
	L23j+3anJU6LrAOitSi5rf2Jv6PT/fdMaOB40YYV3C+bHV2dL1KEqwDAfUEAAUwUltuHaJZVoc4
	7UEc5v56sVKH9Ie+cDDRniaDCQq//GBb6fDesXS3oUuDne1AkryJ9FjaIb1K945wCi9ojGjnes0
	X9spnXDx8s2BxxCz3vs/Us6elpgpXHZ81AjYsgdOGr3YnVAKVqhooo2s1wVn4e2oZ4Rc7+8ceUO
	NTBb3FVtvChsExbfdQiiRtAApGjNEqlsD1lDJ7uNwscSjSm+gBYXh9sRaRX4iQnncKFxkzRaAKF
	TZmzhEfl8eGd/54BZlnn2IIf6KbalB0sb6Cu8tnAkc1Hlt8svQ9TsNKogXlLAYtQpeQJF1JjFB1
	mHMUtoikK+ouSByy2u+yxuaak9GsKdhBRnDS0QO/yM2V/PNtAn+dDVxCGQjEub9qYDibtTPzA=
X-Google-Smtp-Source: AGHT+IGELL6et6z0fhHwZiRAxNeluSYPgRVfkD1zc646KsOGrBFwsno7xXDgMybyrzRdNqFcoQQIQQ==
X-Received: by 2002:a17:906:c156:b0:b73:52c7:fac7 with SMTP id a640c23a62f3a-b76719d0a4emr677717366b.57.1763841565804;
        Sat, 22 Nov 2025 11:59:25 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdd5ebsm808472966b.14.2025.11.22.11.59.25
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 11:59:25 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b2dc17965so2949090f8f.3
        for <llvm@lists.linux.dev>; Sat, 22 Nov 2025 11:59:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdPbf5jCBaIj4x2hw5jlbzTbZYWxvW2QFYjtcCvd6BEsEiqg+2cp0zeBqEy2xu/3X/X3YT@lists.linux.dev
X-Received: by 2002:a17:906:dc89:b0:b72:a899:168d with SMTP id
 a640c23a62f3a-b767159ef70mr722565666b.13.1763841229122; Sat, 22 Nov 2025
 11:53:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251122014258.do.018-kees@kernel.org> <20251122014304.3417954-2-kees@kernel.org>
In-Reply-To: <20251122014304.3417954-2-kees@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Nov 2025 11:53:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
X-Gm-Features: AWmQ_bmh5uuI5AnMmiOZjFdonQtxoafj9Bhk7ARyKlTTPm6tMsrXbFYBvPbdku8
Message-ID: <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
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

Honestly, I hate this.

In particular, I intensely dislike that horrendous 'SIZE' parameter to
those helper macros, and this just needs to die.

The argument for that horror is also just silly:

On Fri, 21 Nov 2025 at 17:43, Kees Cook <kees@kernel.org> wrote:
>
> These each return the newly allocated pointer to the type (which may be
> NULL on failure). For cases where the total size of the allocation is
> needed, the kmalloc_obj_sz(), kmalloc_objs_sz(), and kmalloc_flex_sz()
> family of macros can be used. For example:
>
>         size = struct_size(ptr, flex_member, count);
>         ptr = kmalloc(size, gfp);
>
> becomes:
>
>         ptr = kmalloc_flex_sz(*ptr, flex_member, count, gfp, &size);

That thing is ACTIVELY WORSE than the code it replaces.

One of them makes sense and is legible toi a normal human.

The other does not.

The alleged advantage is apparently that you can do it on one line,
but when that one line is just horrible garbage, that is not an
advantyage at all.

And the impact of that crazy SIZE on the macro expansions makes the
whole thing entirely illegible.

I will not merge anything this broken.

The whole "limit to pre-defined size" argument is also just crazy,
because now the SIZE parameter suddenly gets a second meaning. EVEN
WORSE.

Finally, I think the parts of this that aren't wrong are too limited,
and do not go far enough.

Because once you give that "alloc_obj()" an actual type, it should
take the alignment of the type into account too.

I also think this part:

+       typeof(VAR) *__obj_ptr = NULL;                                  \
+       if (!WARN_ON_ONCE(!__can_set_flex_counter(__obj_ptr->FAM, __count)) && \

absolutely needs to die.  You just set __obj_ptr to NULL, and then you
use __obj_ptr->FAM. Now, it so happens that __can_set_flex_counter()
only cares about the *type*, but dammit, this kind of code sequence is
simply not acceptable, and it needs to make that *explicit* by using
sane syntax like perhaps just spelling that out, using VAR, not that
NULL value.

IOW. making it use something like "typeof(VAR.FAM)" might work. Not
that crazy garbage.

I never want to see this kind of horrendous patch again. Everything
about it just screamed "disgusting".

                        Linus

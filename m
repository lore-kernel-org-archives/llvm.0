Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFDF1EA65
	for <llvm@lists.linux.dev>; Tue, 25 Nov 2025 01:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764034343; cv=none; b=kLx3RBNs5kevmK7QUQfFfdZf9aaO+0M5cVk8/3Tvnp5l+Vl1uK+myKlkkwMJ+MXpemEtEdns8+g/N9YQUDN3CBcszpKWG3QqPsWw3TaeYF7pc6UBAY0TY/IuMhhJyfBDXwSrTmrVBP+wE4LFo9f1OsTxLl8xna+4F2cY52SRTDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764034343; c=relaxed/simple;
	bh=YqWh9GzlQ+M85xmWJJAhz65Uv8DVVpNHfkEVeveBRMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4PKBFyQV/GInhRy5ZGUK25DbXPJkBlvN/Df1kXx+QORaeiad5VcM9tinDj9QUFil5n3npcFe+HskQJdevistczW182QkOjJNYgO86lD5sxZ91yNzZMBpxlpc22DoaX9ssnLuHXyCDJcblL7j9fSG+ShMbiV146uv66L96iN8pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=J6fqUukM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="J6fqUukM"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b73b24f1784so372583266b.0
        for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 17:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764034339; x=1764639139; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tqKMRjrSvi+tqRWkNIWke9++rsIS8F7SgGKQGWYYtJA=;
        b=J6fqUukMfVYl87POcz0n4p0N8zgU5d5Rks0z57z/bV4JqZj29z07Uom2lO42QJTSXc
         FcKPMHYMSaSD6oa1Mo8GCNZPb2WslShNIX2rIedBnQhJvBP5ca7etV4ItqxMLuDiQezG
         FmF+wQUtGeMoC/Gpl+nwOQdgEZno52qAzkNW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764034339; x=1764639139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqKMRjrSvi+tqRWkNIWke9++rsIS8F7SgGKQGWYYtJA=;
        b=onpHLA4f1A593eqF6PAH7meDq7FQIcM9edOgF3Bon1kdSSSGH3ZfPUe2/wHDIxpOTy
         VQB0rxhVAIgqgzkzVB2d/Z32+kV43xYU6+aqmEytfEs0Q5JVW47y52TgIPfneee/yw4Q
         mlJqhixBa27sacc1EHrBlPUaYXklgSy4Z63urr5Bqa8+W7/ZEIR+/LnwrZvoM+mAjFCA
         K50rGlhsWF2bonP5dhYoOR/eqe3iRwMNfGX4Oyd59drxPZ8f0CkfVU3NhcuyxJKcY8aL
         E/a0UGi0uhFrrFrXIUx/Xw+EtZ3zd/en1HmS+2GJQ1t23AZha/bmV0uZSlqqFJbJokHw
         kpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSqgVsj2eO6iaqzPKGH7rVneCRu/ggb9/WOOa6o9rvjDBLhAIW5mzqmmKo1UDQvmfPVrUO@lists.linux.dev
X-Gm-Message-State: AOJu0YwAi3ZXiYmBx8aX7573ZzXXVqCEYfzyuPmyqy0ydt3Xprb7aqXT
	RWfrSgQVx3+eXyna60EFDB5VDVOKcPdEFiTVTJS9SDn6ov619JInT6PUVkK7YOYlP2Caj8t8A5A
	bPfmDWV4=
X-Gm-Gg: ASbGnct6IOZUNReaXq+Nx2kv8KM1+/XD9sjsr7EfjIeiWT5HdR5L5KJR02pTy6jaW2T
	Bdj4usnkLBxDsy84i5ZzT1cOzcRDTfdIQRZGi70FhchSEB9ej5pMBTy4sVLgy4Rnj0jRM2S14ko
	GuCizzi/NzZ3avdCwjCtYQsZ8G3jGHH1aH4f9TUlmNzMVrltlTsKLd1mdRQrz3idTlLjnhx+ykD
	fRzyy3+hn8j6LS8bPC9i4fRfyugpQ7QOMkShAsp1obDnRUbEezUmWa/Um9cCltRnzeHNmAD+tKm
	q84PWUsRw5kRcg51OMmVhx6TGRNfAOd90+uKxVANiQH5W6q296BPvcsXDak9CNfpHwdyRDmPOIE
	+1GP40hX96kNC3vMdC/Ovv3HaheJWLlXXiIWXMnl/gImYxNaFVlnNeSCZUiY1V5T8DbJfw6Pi9a
	8j7IlBBRV6gr/EbgFWAtCzl9wmqACZErV0BwXNj3x/H/QEoNWLiTkqZLo6yGaLGIZJV+SFzpY=
X-Google-Smtp-Source: AGHT+IGBdh9Pvr3PABWammf7Biq94pWMg5yEFDr+pqgMurNQbQNlngcqitgW6T9IuU2O+cK2D1NZ8Q==
X-Received: by 2002:a17:907:1b14:b0:b76:3472:52df with SMTP id a640c23a62f3a-b766edb87fcmr1468951266b.10.1764034339237;
        Mon, 24 Nov 2025 17:32:19 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655038011sm1445248566b.62.2025.11.24.17.32.18
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 17:32:18 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso1558309a12.0
        for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 17:32:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6ejDJ+I/YdUpI6x+V7Y8uWWMIDXAM35n3OkzFZKK18mv6Xr/ndAVn4zIL/TUblCV3PBox@lists.linux.dev
X-Received: by 2002:a17:906:f20b:b0:b76:b791:b58f with SMTP id
 a640c23a62f3a-b76b791b623mr277396466b.0.1764033941841; Mon, 24 Nov 2025
 17:25:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251122014258.do.018-kees@kernel.org> <20251122014304.3417954-2-kees@kernel.org>
 <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
 <202511241119.C547DEF80@keescook> <CAHk-=wikqnc16e7yUTJuqnc5f4rL+y_-JpRzCLRu9WPnt3nmiQ@mail.gmail.com>
 <202511241612.6CF90E9@keescook>
In-Reply-To: <202511241612.6CF90E9@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 24 Nov 2025 17:25:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh7jG7vUqY2JjkJmjxOYzXR+iUARN6W908pCVfmyprSvg@mail.gmail.com>
X-Gm-Features: AWmQ_bmW9etMzrFCL9DwpEr0x6CUkdioyCuxtdBlodJu1UMrkK3czrKtVUGlZJ8
Message-ID: <CAHk-=wh7jG7vUqY2JjkJmjxOYzXR+iUARN6W908pCVfmyprSvg@mail.gmail.com>
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

On Mon, 24 Nov 2025 at 16:29, Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Nov 24, 2025 at 01:35:12PM -0800, Linus Torvalds wrote:
> > Those macros are illegible. And 99% of all users DO NOT WANT ANY OF
> > THAT COMPLEXITY.
>
> Okay, I think you're saying "I don't want the common helpers to include
> the infrastructure for supporting the ..._sz() variants"?

I don't want the macros to expand the code more than necessary,
because that just makes everything worse (including very much my build
times - which have gotten worse over the years, but historically my
build environment got faster at an even higher rate - that is no
longer true).

I also want the macros to be somewhat understandable.

Yes, we have some macros that are works of art because they are *so*
obscure and are fundamentally hard to understand because they play
games with really really subtle language semantics.

And then I enjoy them and appreciate the insanity of them. I still
think our __is_constexpr() macro is truly a wonder, but we do have 40
lines of comment (!) for that one strange macro.

But this was not *that* kind of hard-to-understand macro. This was
just overly complicated.

> Fair enough. Looking at the treewide change I prepared[1], it's less
> than 1% of those mechanical replacements:

Yeah, I did some numbers on my simple version, and just the three
simple ones were the majority of cases by far.

I also believe that when we're doing more complicated size
calculations (ie the whole "struct_size()" patterns), then the
advantage of merging them with the allocation itself is questionable,
simply because it takes two different pieces and makes them one
*compilcated* piece.

Doing

        size = struct_size(ptr, flex_member, count);
        ptr = kmalloc(size, gfp);

is basically two fairly straightforward things and easy to understand.
You can *scan* that code, and each piece is simple enough that it
makes intuitive sense.

No, 'struct_size()' isn't exactly a very intuitive thing, but written
that way it's also not very surprising or complicated to parse at a
glance.

In contrast,

        ptr = kmalloc_flex_sz(*ptr, flex_member, count, gfp, &size);

does *not* make intuitive sense, I believe. Now you have five
different arguments, and it's actually somewhat hard to parse, and
there are odd semantics.

In contrast, the simple versions that take

        ptr = kmalloc(sizeof(*ptr), gfp);

and turn it into

        ptr = kmalloc_obj(*ptr, gfp);

actually become *simpler* to read and understand.

Yes, there are some other advantages to the combined version (ie that
whole thing where 'kmalloc_obj()' now returns a proper _type_ - type
safety is always good, and avoiding void pointers is a real thing),
but I do think that the major advantage is "simpler to read".

Because in the end, simple code that does what you intuitively expect
it to do, is good code, and hopefully less buggy.

             Linus

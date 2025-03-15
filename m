Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907351F8901
	for <llvm@lists.linux.dev>; Sat, 15 Mar 2025 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742063853; cv=none; b=Ie13xQdgvHqPRifEHfh17i2YjNf5epOwXtY/4iBlUrxmsLb6LMytTcxpBHDJWfc+wlioEtfq6tX7GZ3BSAnPQq11yfWNbm3CZnT1+wbMTWni/LAm9ZmwCjvTN81ZY9olldGVCzfrxZGtPjs3vfYcU44KV7oxZxiGPP2gRDChPC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742063853; c=relaxed/simple;
	bh=XV+UOWy1S9PWbjopZNL+DwSwF3sDIJJk6cvH5cVz+Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U4ZFaXKrz5vyL1oO2K00/Z2B5ao3hYSgkyL+oTdWLa4NUyN85Sz6jtVNMWh6+MB0wWixGvdg54cme1dKrdjMIESgr9OetNhihL8KGy8WqkL6I1PIVcwmW1BPWco8PA06WkT+V+9k9miExI4lqQ1PUx38CFM+hNlTeWkYiJY17Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LoApHmTW; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LoApHmTW"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so5458481a12.1
        for <llvm@lists.linux.dev>; Sat, 15 Mar 2025 11:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1742063849; x=1742668649; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fUg4fCMuPkYhbF/nCEDejVAU0bc8GhrExOsFutZjexE=;
        b=LoApHmTW4n6vn2Ej+02CRy/R4kPbvnoIPA5Qsu+bVADd+jqwIy9cIdy2BGbb6uk9F7
         H7+p+9WSQh8gSJ6PSsYqz2+5cb+jalSi21QFuRxbTUtdCHrZ39SPIbmmN6d65onsaiWY
         iL4BfjkGSuOeFCAlzPrH4j/1dKPS1vtI5yfXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742063849; x=1742668649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUg4fCMuPkYhbF/nCEDejVAU0bc8GhrExOsFutZjexE=;
        b=fJ8G2im9zZOU3zBg6bcHjZsRWLgb1fJVidxeI7JgAOfq96A9idYYPXlUDeA7idfE06
         59ntl0mmqg/ctbgLKQzITkGHdZ4oHvlTgQTaFM0wwO2qgl1T1wxSKi7teYXrZNERtbgR
         XLpjrQ5//MzTWpuo1HkgD2TKw9Sdv01pafqDf+DK0saMYbkHynjDhJ/0K1B1Nq+sEM4P
         a/37voI3DBOAF4INpvi9UeBDjfiPoh0JGBgd7uYMcmPp9Aj6dC6Fixk5ntNsOmsU+2aO
         OOfCXdGUYj1M1qXiyeJkd3wtHvb07hYqzLB8ft1jHmr+lk0AUIC6+O8XyvwcBZu8lBkG
         s7MA==
X-Forwarded-Encrypted: i=1; AJvYcCUGLnMgUWfsh8lSTvcjq1+U0F/MDBFo8MaTqZcqWU+MM/5w+RWXJL0cLSy5YKr1BGGstzdK@lists.linux.dev
X-Gm-Message-State: AOJu0YxwYo2bnfKMSEoUxqV/XY7uh1EAgK41a9jZth8ElSiJ0EEqBfDX
	29PF2VQH9O3BPmUCerqwLsW4U+HUH8IQTYbRwvlAPcHw4vWBh9eHPINpSvUIzavxSCSERtJLNpa
	WA6k=
X-Gm-Gg: ASbGncsXEdQlxzjJhqLpnlnXOVCBMyEVuYSlhTPeF4u0WUb56CpBqOKZGn+L3tvvOcd
	BzP9WoIlYLIFuxEiG++iQeTlQNSdoXTH9QsR2OJ1AnQFl6aHcyC0uJseKA9PoMQY1ghpkIPR39k
	4voLJPaNJDWvUfoB7xkmp5n9sYvURJGnMmoJAtPusE+z0wHZsk+6gvbrMgPI1r+IgfaxIDfh1hh
	1vmLCxgjP3ft2Lmti6ZgWldkSNmhB2eDy0JiSDW4CrzIGcfW0zmQ6ZcYksv5/tmpConS66FmNjf
	aK7FCMaaLWXXvkyiqZPnzvJ3EKA3QnS6k61hTH9BmjrCyh12x8cYytoUbxBBkGOkwzlqO6nGqs0
	Wi4T6G1oMdDFhkORsT8M=
X-Google-Smtp-Source: AGHT+IFwD9Fe/Xv3qu7J8Oo2yE6013Oz6lHlGFA4JJI1xfcO4GRYsR4nn+FPiTJFLw/gZ2Gpyw5tTA==
X-Received: by 2002:a05:6402:2551:b0:5e7:b015:c636 with SMTP id 4fb4d7f45d1cf-5e89f24f212mr7791335a12.6.1742063849547;
        Sat, 15 Mar 2025 11:37:29 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816974900sm3541718a12.25.2025.03.15.11.37.28
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 11:37:28 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac25313ea37so634475366b.1
        for <llvm@lists.linux.dev>; Sat, 15 Mar 2025 11:37:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGoFsQ5yt0nn/P974dHBgozCHPX/Bsm36QLd20wrhxaGQmPoMdFHjAhy7OnYx+Hcxm6/Za@lists.linux.dev
X-Received: by 2002:a17:907:6e8d:b0:ac3:47ad:41e8 with SMTP id
 a640c23a62f3a-ac347ad42e1mr292577866b.1.1742063497897; Sat, 15 Mar 2025
 11:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250315025852.it.568-kees@kernel.org> <20250315031550.473587-2-kees@kernel.org>
In-Reply-To: <20250315031550.473587-2-kees@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 15 Mar 2025 08:31:21 -1000
X-Gmail-Original-Message-ID: <CAHk-=wiFjwOk9knz8i-zAqE=Kc73+3TgkMuj-C_mNB1U=k2W7A@mail.gmail.com>
X-Gm-Features: AQ5f1JqnUqw5FSbsGnxD4hWFlYlctW64jtsJobEgwKJ2Lw8II8J0HunpM362-9I
Message-ID: <CAHk-=wiFjwOk9knz8i-zAqE=Kc73+3TgkMuj-C_mNB1U=k2W7A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] slab: Introduce kmalloc_obj() and family
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Marco Elver <elver@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>, Yafang Shao <laoar.shao@gmail.com>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Mar 2025 at 17:15, Kees Cook <kees@kernel.org> wrote:
>
> Introduce type-aware kmalloc-family helpers to replace the common
> idioms for single, array, and flexible object allocations:
>
>         kmalloc_obj(ptr, gfp);
> [ ... ]

Honestly, I absolutely hate this.

Don't do this. It's a huge mistake.

Yes, it's a really easy and convenient interface to use.

And it's a ABSOLUTELY HORRENDOUSLY BAD interface to actually then *maintain*.

Why? Because it's simply visually and syntactically entirely wrong.
It's much much too easy to miss that there's an assignment there,
because the assignment is hidden inside that macro that visually looks
like a function call.

So when you scan the code, the data flow becomes very hard to see.

So no. A hard NAK on this. It's wrong, it's bad, and it's crap.

Maintaining code is AT LEAST as important as writing it, and arguably
much more so. And making code and data flow visually clear is
important, and this is actively detrimental to that.

So I understand why you want to do this, but no, this is absolutely
not the way to do it.

It needs at a minimum some way to make it very very visually clear
that this is an assignment to 'ptr', and honestly, I do not see how to
do that cleanly.

Alternatively, this might be acceptable if the syntax makes mistakes
much harder to do. So for example, if it wasn't just an assignment,
but also declared the 'ptr' variable, maybe it would become much safer
simply because it would make the compiler warn about mis-uses.

Using visual cues (something that makes it look like it's not a
regular function call) might also help. The traditional C way is
obviously to use ALL_CAPS() names, which is how we visually show "this
is a macro that doesn't necessarily work like the normal stuff". Some
variation of that might help the fundamental issue with your
horrendous thing.

But something very serious needs to be done before this is acceptable.
Because no, the advantage of writing

        kmalloc_obj(ptr, gfp);

instead of

        ptr = kmalloc(sizeof(*ptr), gfp);

is absolutely NOT worth the horrendous disadvantages of that
disgusting and wrong syntax. You saved a handful of characters, and
made the code faster to write, at the cost of making the result be
much worse.

My suggestion would be to look at some bigger pattern, maybe including
that declaration. To take a real example matching that kind of
pattern, we have

        struct mod_unload_taint *mod_taint;
        ...
        mod_taint = kmalloc(sizeof(*mod_taint), GFP_KERNEL);

and maybe those *two* lines could be combined into something saner like

        ALLOC(mod_taint, struct mod_unload_taint, GFP_KERNEL);

which would stand out visually (which is admittedly very different
from being "pretty" ;), and would also save you some typing because it
also gets rid of the declaration.

We allow declarations in the middle of code these days because we
needed it for the guarding macros, so this would be a new kind of
interface that dos that.

And no, I'm not married to that disgusting "ALLOC()" thing. I'm
throwing it out not as TheSOlution(tm), but as a "this interface
absolutely needs clarity and must stand out syntactically both to
humans and the compiler".

          Linus

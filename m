Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED6199939
	for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 13:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738243994; cv=none; b=CNNW6KqPVEwC5AE1pL5U601tz0QnHqPGN6wvog5uVtPp3755AYOTWKxXJig6jO0Kz/QZwR/Cl0toA9+gadDWD/XPgO/h3vHzY39HWT9T5OwbZsFMkZt2uv0YBM0bhPmD6y26v6BEahWwmxmSASGqbdtz0WfBR1PqmrGfEAElWEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738243994; c=relaxed/simple;
	bh=EluioHgTrDfBtlMLrqNjhpzUXx5fQlBJiL9K5UDjawM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fIsYILw4Oe7iMMIAUIJ92K85UHP7wYdqhcm1oq3W4KVhFfB2hJqhE3Q+3XZVEf0EZi7QW1h8kRlpnstby7BFbqZAxlXD1hLfEdeb+zddAHKpaH6gF0PrltA+JWlaRQZeI0D2yLgnLRL0XM/o6qffuZtXbdUvlEwJO7JxzrKPVwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21670dce0a7so15693605ad.1
        for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 05:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243992; x=1738848792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcnCdea0Cg2xhZ905GiM0LEi2fn/A0TJy6vLZwAFU5g=;
        b=Zrbc0WnifL3j8ZcWp+aO3U8zN3seCvpC9IodwwUapu+STazmI5/cOohXZ/e5fi3Opo
         df/rMS5QUALC7yt9t9+JIeyBIHsZRY7mwwb9RLfN1wfXlrh4rnG9bm6LwkIKaeU47RzA
         cVqoO+qbG+HBA/+DTRFbp2CbefZxte/mcm3KZ03PCD9diP2e2+wE3/c+6oxivTqvv3Kj
         6RZ12NZE73kWifwoVdhIMJ0AUqYsUZWm5ngYsZdleIO3AYrd3TSK1q8ZAw9EvJ5mSMoE
         x+Gn9T0bq2T5TO2EXqoFkEcplZ11FZUMtfUlTlTdoXIfDBIGd8wClA9+fJ97Qrv25mQH
         DQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo1BV8YsAbjMNF1++NjnrvSUEVONHZXIz51cqM0fXx1ZLXDnMwJ9Blm6VAYv4vYb+u7Ao2@lists.linux.dev
X-Gm-Message-State: AOJu0YywkXa08cqUU0FqsDd8WGnXDbSQ5MgQGetmkvi8D0cmkbZiEe+n
	sW2IZxD7CNp3EDTIV6NN8exDlodZLJvUBUgFYQjK2eCadBlMNrnpZ4OhBA5t
X-Gm-Gg: ASbGncuNYSwtiKLM3sPuw3vUj2galyGeMNloc8kINweheBwPslXi9GoCoCzoI41z/Wn
	jG3soobRJUMlp52v0U5SSE8cZ+nd6wtUuklkdNV0yP5McV05gfCVRVeXCOFyZEDALNk0+otljyi
	3Dw+yVt+Sa7bXUCwAD48X3dyjYDF19WsmuinzcoKcTedlso0hdFe1hdpieW7k9d4qGInJjvCxAP
	R2waap5CjeSifl0nyIhUJGhwSxGJilKMH41guXH03yOcNKhmplF4P7IBFuqvCROArrbrA6XzrR4
	n1icfd0UL4NlNTgvfl86xR+1UQplO+JOEA1S71XNUQQVOD9CsqmIiQ==
X-Google-Smtp-Source: AGHT+IF9nQ3mFhYMyCpYrC3PnXX95Yc055Z/A02aGajSx+RC05BYK5SZBH/gHLP8ghtX41cv81BQcw==
X-Received: by 2002:a17:902:f687:b0:215:b9a7:526d with SMTP id d9443c01a7336-21dd7dcb29emr117079755ad.32.1738243991554;
        Thu, 30 Jan 2025 05:33:11 -0800 (PST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3324b65sm13341955ad.252.2025.01.30.05.33.10
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 05:33:11 -0800 (PST)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f441904a42so1260232a91.1
        for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 05:33:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgi2Td1JcGnFH9UUKfu8botPz9qRQVIFwpn2Q4ZzMq2FLyIB4H5fgDEvfT37YzYo/gcbnx@lists.linux.dev
X-Received: by 2002:a05:6102:2ad3:b0:4af:bb06:62d with SMTP id
 ada2fe7eead31-4b9a4f499c9mr6186530137.11.1738243569336; Thu, 30 Jan 2025
 05:26:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com> <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
In-Reply-To: <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 14:25:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
X-Gm-Features: AWEUYZn0su9wB3Rua7xZlN_jsLurJgHhePP-DQxZFLycHjingwrtS3E5xZdT-fo
Message-ID: <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi Liam,

On Thu, 30 Jan 2025 at 13:52, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org> [250130 03:21]:
> > On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> > > I've never used the kunit testing of xarray and have used the userspace
> > > testing instead, so I can't speak to the obscure invocation as both
> > > commands seem insanely long and obscure to me.
> >
> > The long and obscure command line is a red herring: a simple
> > "modprobe test_xarray" is all it takes...
>
> That command worked before too...

Exactly, great!

> > > You should look at the userspace testing (that this broke) as it has
> > > been really useful in certain scenarios.
> >
> > BTW, how do I even build tools/testing/radix-tree?
> > "make tools/help" doesn't show the radix-tree test.
> > "make tools/all" doesn't seem to try to build it.
> > Same for "make kselftest-all".
>
> make

Where?

> Or look at the make file and stop guessing.  Considering how difficult

There is no Makefile referencing tools/testing/radix-tree or the
radix-tree subdir. That's why I asked...

Oh, I am supposed to run make in tools/testing/radix-tree/?
What a surprise!

Which is a pain when building in a separate output directory, as you
cannot just do "make -C tools/testing/radix-tree" there, but have to
type the full "make -C tools/testing/radix-tree O=..." (and optionally
ARCH=... and CROSS_COMPILE=...; oh wait, these are ignored :-( in the
source directory instead...

If these tests are not integrated into the normal build system (see
also [1]), I am not so surprised the auto-builders don't build them,
and breakages are introduced...

> it is to get m68k to build, you should probably know how to read a
> makefile.

Like all other kernel cross-compilation? Usually you don't even have
to know where your cross-compiler is living:

    make ARCH=m68k

> > When trying the above, and ignoring failures due to missing packages
> > on my host:
> >   - there are several weird build errors,
> >   - this doesn't play well with O=,
> >   - lots of scary warnings when building for 32-bit,
> >   - ...
> >
> > At least the kunit tests build (and run[1] ;-) most of the time...
>
> Do they?  How about you break something in xarray and then try to boot
> the kunit, or try to boot to load that module.

If you break the kernel beyond the point of booting, you can indeed
not run any test modules...

Which does _not_ mean the userspace tests are not useful, and that I
approve breaking the userspace tests...

[1] https://lore.kernel.org/all/CAK7LNASdA+5_pdTjr1dY-cKGSDq804Huc_CX_8-Gg+ypFCmajQ@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

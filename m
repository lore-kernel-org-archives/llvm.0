Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A033D4409
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 17:30:22 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id m81so700955oia.1
        for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 10:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+N5oyJcUF3g1nnHU8kFVJBXuR6Tvqo+haLUBkWOmg1k=;
        b=cbYNEyjgOIPQtU2o5K7hMM8JO4382oIKH0Sk7l/bQecXKjHVzblInrltQc1kaeTuL3
         nUlEg/vcaK+KRt+6Xh/j9ty9gXqxBfDu+ftIF6MhLUv5lsOGNYU9kwinFlAC6AgadvAx
         N9+AWcNagwT31KeH1mluHfkjjceYjzf3hdiB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+N5oyJcUF3g1nnHU8kFVJBXuR6Tvqo+haLUBkWOmg1k=;
        b=3u21Ti1lEZFfWVC4zWRVwNF3xEDvcHrxBPsqtOP/77TWx+jFesRI1MHgOcHdtWm94m
         QAq8p5Ixw2J4gkSAW8UQbB4QtIpS4QLvTyOcWGZ/WDmwS6YHZIrftETMH0cfJXzT6B/H
         G607qnhZh5E03wZ/qS8pspzdMo7UTfyyESxqULwb0rwFc8BEsF6CbPwlJWusBfvCxlSa
         EEdSDoXyFbGOYa9yoIApNyshJVBqDo3AqN58MzPtoqmvUlAGykbJU/pz3aBhtTZ8FlaN
         +6rZs3F8XndlqZuXtNQH19rLYmeL7ayUDqKkVmzY7kkzk770qO43EhZzcq/DcOb6iwfX
         24Jg==
X-Gm-Message-State: ACrzQf2iAzFXpKmiPVSVzJNl1XUeMaSnTH/VOYr5AnKIWMxvALFO3RWh
	d7WDZ8kziCTDnKPt32qXudy9VhMelJ/ZAA==
X-Google-Smtp-Source: AMsMyM75Bm5uk2Wsg7/K1E8hGUpekVnTW5A1H84ASl/xbWyGHGkfAnQCuwBroSFQF0bmHEj3KtPjoA==
X-Received: by 2002:a05:6808:1246:b0:34d:8c6d:b189 with SMTP id o6-20020a056808124600b0034d8c6db189mr4412626oiv.208.1663954221067;
        Fri, 23 Sep 2022 10:30:21 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id r21-20020a05687032d500b0010e20d0b2e3sm5078356oac.44.2022.09.23.10.30.15
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 10:30:15 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id r22-20020a9d7516000000b00659ef017e34so437514otk.13
        for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 10:30:15 -0700 (PDT)
X-Received: by 2002:a9d:3623:0:b0:655:dae2:6852 with SMTP id
 w32-20020a9d3623000000b00655dae26852mr4667060otb.176.1663954214778; Fri, 23
 Sep 2022 10:30:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220923170218.1188423-1-ndesaulniers@google.com>
In-Reply-To: <20220923170218.1188423-1-ndesaulniers@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Sep 2022 10:29:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiAwEA5KekL4+t+v6qAdKLSOQvBkGbumvk+Rxhaay8aFg@mail.gmail.com>
Message-ID: <CAHk-=wiAwEA5KekL4+t+v6qAdKLSOQvBkGbumvk+Rxhaay8aFg@mail.gmail.com>
Subject: Re: [PATCH] x86, mem: move memmove to out of line assembler
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Andy Lutomirski <luto@kernel.org>, Ma Ling <ling.ma@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 23, 2022 at 10:02 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> memmove is quite large and probably shouldn't be inlined due to size
> alone. A noinline function attribute would be the simplest fix, but
> there's a few things that stand out with the current definition:

I don't think your patch is wrong, and it's not that different from
what the x86-64 code did long ago back in 2011 in commit 9599ec0471de
("x86-64, mem: Convert memmove() to assembly file and fix return value
bug")

But I wonder if we might be better off getting rid of that horrid
memmove thing entirely. The original thing seems to be from 2010,
where commit 3b4b682becdf ("x86, mem: Optimize memmove for small size
and unaligned cases") did this thing for both 32-bit and 64-bit code.

And it's really not likely used all that much - memcpy is the *much*
more important function, and that's the one that has actually been
updated for modern CPU's instead of looking like it's some copy from
glibc or whatever.

To make things even stranger, on the x86-64 side, we actually have
*two* copies of 'memmove()' - it looks like memcpy_orig() is already a
memmove, in that it does that

        cmp  %dil, %sil
        jl .Lcopy_backward

thing that seems to mean that it already handles the overlapping case.

Anyway, that 32-bit memmove() implemented (badly) as inline asm does
need to go. As you point out, it seems to get the clobbers wrong too,
so it's actively buggy and just happens to work because there's
nothing else in that function, and it clobbers %bx that is supposed to
be callee-saved, but *presumably* the compile has to allocate %bx one
of the other registers, so it will save and restore %bx anyway.

So that current memmove() seems to be truly horrendously buggy, but in
a "it happens to work" way. Your patch seems an improvement, but I get
the feeling that it could be improved a lot more...

              Linus

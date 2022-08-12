Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AE9366
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 03:59:13 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id a89so25306283edf.5
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 20:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=m2PTBoviL3/5uL6JA131170RJDTmrntmGOuM96iL0Ao=;
        b=b2poAxZ5mC1hm1VPbhFpQrlF1LE+DM7pawb+5/uxebwAmInJkEV1zNsI2GPDNYQwyB
         OErpDRiP9c7AtVj8C6k1CI3Jd5tECk0KBs9namj8HDXcUssI1FpC6tVa0+rf/gnl7CIJ
         I8B3T5D3Tt4LuD5T1ttN7RQG9Cb6jHvaYP9jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=m2PTBoviL3/5uL6JA131170RJDTmrntmGOuM96iL0Ao=;
        b=jV4FMLoB4dkgaV4Xp1m+EjE9pCjnGBxEmBFL6KsyuZeTJU8wcIefKNI7mOPbEDcFkO
         Vhtc3OwQdp1ywd/ROjDHt8G+guitSJlZ+V4yV7qhoEHVBkXYw61aGw++cDQHQ4OGnXhf
         ahArNpHMvR28s4XC2Y/Kd6WoEqx+mFqGv4NGQzIhWU/Pw/FH/ghq+epcaSD2MsyP4U6e
         V9GNXj4x3Tdd8edMz4vuHPGNPnobb29RbMnfJw6cZoaX5U0rEuVPU0qfgbyg0zfrkATq
         JW33BbXakSNhW37FJPNcmuZLf51/+AS/N2YoixDmy0f8J5Z1TYrJIkipITmr6Z12VdLw
         n2Ow==
X-Gm-Message-State: ACgBeo2LRdsS2fPR2xDQmQgsC8hTP/BFDabFtFSbwGqIfc0DCHXVg87m
	oMMa+BgF8G4NjaFNwBMRaU5OearMVkTiNJBO
X-Google-Smtp-Source: AA6agR52Cys9+102TJ9mJYr20AYftaHtA4v28mklNSxIgkQ9IWni6D0+Xf6Gmu0HsO68vv+Na+/Erw==
X-Received: by 2002:a05:6402:348f:b0:43d:e568:97bd with SMTP id v15-20020a056402348f00b0043de56897bdmr1816556edc.279.1660276751376;
        Thu, 11 Aug 2022 20:59:11 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id v10-20020a170906292a00b0073065767404sm343694ejd.34.2022.08.11.20.59.10
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 20:59:10 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id d24-20020a1c7318000000b003a5c1bf4f27so1578600wmb.4
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 20:59:10 -0700 (PDT)
X-Received: by 2002:a1c:2582:0:b0:3a5:1453:ca55 with SMTP id
 l124-20020a1c2582000000b003a51453ca55mr7207646wml.68.1660276750262; Thu, 11
 Aug 2022 20:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220811152446.281723-1-idryomov@gmail.com> <CAHk-=wifgq59uru6xDB=nY-1p6aQ-1YB8nVhW7T-N2ctK3m1gw@mail.gmail.com>
 <CAOi1vP9BSi-65of-8D0BA1_DC0eVD_TQcWkhrGJwaXw_skhHFQ@mail.gmail.com>
 <5d0b0367a5e28ec5b1f3b995c7792ff9a5cbcbd4.camel@kernel.org>
 <YvVzHQ5DVaPAvw26@ZenIV> <72a93a2c8910c3615bba7c093c66c18b1a6a2696.camel@kernel.org>
 <YvV2zfT0XbgwHGe/@ZenIV> <CAHk-=wgYnAPiGsh7H4BS_E1aMM46PdSGg8YqFhi2SpGw+Ac_PQ@mail.gmail.com>
 <YvV86p5DjBLjjXHo@ZenIV> <CAHk-=wjCa=Xf=pA2Z844WnwEeYgy9OPoB2kWphvg7PVn3ohScw@mail.gmail.com>
 <CAHk-=wjLLw0xjL+TZs5DUGL8hOpmLMa4B92aDVFxw4HZthLraw@mail.gmail.com>
In-Reply-To: <CAHk-=wjLLw0xjL+TZs5DUGL8hOpmLMa4B92aDVFxw4HZthLraw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 11 Aug 2022 20:58:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjyOB66pofW0mfzDN7SO8zS1EMRZuR-_2aHeO+7kuSrAg@mail.gmail.com>
Message-ID: <CAHk-=wjyOB66pofW0mfzDN7SO8zS1EMRZuR-_2aHeO+7kuSrAg@mail.gmail.com>
Subject: Re: [GIT PULL] Ceph updates for 5.20-rc1
To: Al Viro <viro@zeniv.linux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 11, 2022 at 3:43 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Oh, sadly, clang does much worse here.
>
> Gcc ends up being able to not have a stack frame at all for
> __d_lookup_rcu() once that DCACHE_OP_COMPARE case has been moved out.
> The gcc code really looks very nice.
>
> Clang, not so much, and it still has spills and reloads.

I ended up looking at the clang code generation more than I probably
should have, because I found it so odd.

Our code is literally written to not need that many values, and it
should be easy to keep everything in registers.

It turns out that clang is trying much too hard to be clever in
dentry_string_cmp(). The code is literally written so that we keep the
count of remaining characters in 'tcount', and then at the end we can
generate a 'mask' from that to ignore the parts of the pathname that
are beyond the size.

So it creates the mask by just doing

        mask = bytemask_from_count(tcount);

and the bytemask_from_count() is a very straightforward "take the byte
mask, multiply by 8 to get the bitmask, and then you can use that to
shift bits around and you get the byte mask:

   #define bytemask_from_count(cnt)       (~(~0ul << (cnt)*8))

But clang seems to decide that this "multiply by 8" all is a very
costly operation, and seems to have figured out that since we always
do everyting one word at a time, so 'tcount' is always updated in
sizeof(long), and that means that at the end 'tcount' is guaranteed to
be the original 'tcount & 7' (on a 64-bit machine).

End result: the above mask can be pre-computed before entering the loop at all.

Which is absolutely true, but adds to register pressure, and means
that you pre-compute that mask whether you actually need to or not.

But hey, even that is fine, because you can actually move the mask
outside *both* of the loops (both the hash chain *and* the inner
"check each pathname" loop, because the initial value of 'tcount' is
very much a fixed value per function call.

The computation is pretty cheap, the bigger expense is that now you
have one more thing you need to keep track of.

But on its own, that would probably still be ok, because hey, we have
extra registers. But it does make the liveness of that extra value be
quite large.

But the extra registers are then used by the fact that we have that

                b = load_unaligned_zeropad(ct);

which *ALSO* has that incredibly expensive "multiply by 8" operation,
except now it's a different value that needs to be multiplied by 8,
namely the offset within an aligned long-word, which we use to fix up
any unaligned faults that take exceptions.

And since clang seems to - once again - think that multiplying by 8 is
INCREDIBLY EXPENSIVE, what it does is say "hey, I see all the places
where that base pointer is updated, and I can have my own internal
variable that tracks that value, except I do "update-by-8" there.

So now clang has created _another_ special internal variable that it
updates inside the inner loop, which tracks the bit offset of the
*aligned* part of the 'ct' variable, so that in the *extremely*
unlikely (read: never actually happens) situation where that
load_unaligned_zeropad takes an exception, it has the shift value
pre-computed.

And now clang runs out of registers, and honestly, it took me a
*loong* time to understand what the generated code was even trying to
do, because this was all so incredibly pointless and the code looked
so very very odd.

Anyway, it's amusing mostly because both of those "optimizations" that
clang did actually required some very clever compiler work.

It's just that they were both doing extra work in order to avoid an
operation that was _less_ work in the first place.

I suspect that there's some core clang optimization that goes
"addition is much cheaper than multiplication, and if we have an index
variable that is multiplied by a value, we can keep a shadow variable
of that index that is 'pre-multiplied', and thus avoid the
multiplication entirely".

It's absolute genius.

It just happens to generate really quite bad code, because multiplying
by 8 outside the loop is _so_ much cheaper than what clang ends up
generating.

On the whole, I think that any value that needs one or two ALU
operations to be calculated should *not* be seen as some prime example
of something that needs to be pre-computed in order to move it outside
the loop. The extra register pressure will make it a loss.

But admittedly we also have no way to tell clang that that exception
basically never happens, so maybe it thinks it is really important.

I'm adding clang people to the list, in case anybody wants to look at
it. The patch that started my path down this insanity is at

   https://lore.kernel.org/all/CAHk-=wjCa=Xf=pA2Z844WnwEeYgy9OPoB2kWphvg7PVn3ohScw@mail.gmail.com/

in case somebody gets an itch to look at a case where clang generates
some very odd code.

That said, this code has been streamlined so much that even clang
can't *really* make the end result slow. Just not as good as what gcc
does, because clang tries a bit too hard and bites off a bit more than
it can chew.

               Linus

Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F35378833
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 19:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776798830; cv=pass; b=boW8os9E+E027maSvqdYfAtnI+Ijt0Z5i7KdM9SC3dO0iXfyXtzYYGoIVlxBRADs7voKAuOCrp7bVsmmQFbv3IWtIPvJaAx6BJDHBZIZ9j1g0fjfjr7NbxVK45j5vTKQyYK7Uftq4nQntKXoVtjbv3V54E7Xxo6nHnXPIx8+Y8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776798830; c=relaxed/simple;
	bh=X4Wq2yf0iLQmaCYexwPzuD8C38X8+peC49jk0V+3V8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aV7fOeya+ziXqEGfAxE0sit7x+h55TNFIAf/0mNJWpB+RebDMevOA3kJhajERsqwtdJp30HjwhvWCqoLWJf9cvn1eOmZduNLFudWyXWZ89/UL8IP5VKBRPyWv2ISWOUqc9fLhGS0kdyIvzGBksgQIxvo3hO6J5nV33QMeEM92hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JcPhVX0/; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JcPhVX0/"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c45281a06so6206046c88.1
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 12:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776798828; cv=none;
        d=google.com; s=arc-20240605;
        b=kxMrg6tMegUKLp2tTijHoPn6qWupYIGHU7qNiIDVZzSEAlIqqtHJiWkQxEkWgl1j8W
         koIAT7QCm7qFs0ASmF41Iew/Xj5BbEuaMuuAHY7Rk9RC6oY7aR3fRVwVog5SH/Bgjhv5
         jJ8SyiM9U8GvRaYI3+QJK7g9F5yt9Ogo5E5hm061t3MI6TYkWelvEAB/EAAq1l5feQ1D
         HV8z60jEyy59CF7Gs6bY41uOSa2T4RFk2DkLFGZ7slwezxEo4kSKtqOEnLa5K5KjOlYo
         4+U1wB9qanvTxhGYpjezpRjY2DqPLeOl6sH1K1rFI3D+2gEVe7d5ueRIuGwGZ4yNAzY9
         XrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J+nBi8NMCSPfGIscPWxKFWQOBdlvlCfORQNm2QzRooQ=;
        fh=cYc3X7IxUzsvfTHZxZyvOWUvAoNtakf5nfIkGC2/+Bg=;
        b=XaVoXcgkbfTgEf67X+9ZgkKBr9xvrxVIfGg3TMwuDCtjvKjXm8kmpH29YHGb0FtKi+
         1g+QhwKhr2RNVxdmPj5GTnQzng9damslEbpMVAPfYewZ9UUd/o+cMz8RNV0/O9FkRpya
         EOWqKtJJ93UpBqiDlBuKNDjLjreIjpipCfnIqvJ3XEY9/NKYuDi/AMswXgMx059a+Ayt
         SRL0lTjfgS1n010Ci2YFXe3Z9TsPHpy2HXoOis2B2Q+77e1h5rbNGIzgfGeD9yeqNU7A
         iNn7B9LmkxmDWhz3TIB0T9ik3BWIU5k81mYcaWClkq/D8G4EAYW3Scxuuc2B93IjfT3X
         953g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776798828; x=1777403628; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J+nBi8NMCSPfGIscPWxKFWQOBdlvlCfORQNm2QzRooQ=;
        b=JcPhVX0/j/PGWDLtaZl4dV26ZPFP7BUiCzXZLi9sfask7R88gu+p+7Hlb/XqBgzvmh
         2dIU+oQ4L+xwrv8ar5rt+UvvONa7W2HSlYXozA+Y5dMeLDpJKo05feNxzemZMVXfNBYw
         opifeESfxQmzlDj/uPQhkiNG4uJk6BWF5Thtepl9/inH5s6ThvXrScRM5LCh0bLnzAdf
         cf0BlsMeigjkBVPejAxLU3Zw1LPlScNldd8faaxpH3l/S+vby3ClegGAYsY5l4OkvJC3
         SQnsdRIviqMFvG9CjZ8pDLbrMzt6qHTV90JTiBd9K/6tIxCtOpDcfSrBacQcUNTdnUUp
         4FpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776798828; x=1777403628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+nBi8NMCSPfGIscPWxKFWQOBdlvlCfORQNm2QzRooQ=;
        b=rvhvBy5imUk634pwSb95DG1/MUlUPnZlpyjQf+48jOTqAD/1cZHh42imVDPMwZZb48
         U5/oPtowdYgWDaAovwSMdaaEYOcZStOIfG++s7BdtfA4jIOr7qIIbjaBynjxgYc/SRZc
         Ve4AF3Hvo5BZeQDw/Q9UX8Lm/KrTU9aAxmb1clqQQqGnN5YbX7Is3KblUwyVpxt1uKex
         pTSY78i7CMV1so6sGak/qgGeWKFgbsIzVM9i0uJUimuIFzL127nPDxyytpe3P2Bcwucm
         Gu4zI7EuoC95xD3/S+x4uvrDevFttK4FkQP0SsGNYfkH2OhBysyO5j8naAlH0TdLItNf
         40pA==
X-Forwarded-Encrypted: i=1; AFNElJ/EJgkbzmKQbuNR3XYU8w0vh42dOqFn7FMLQ0xl8Gy38y51VDb3DMDFCxZ19XUl6wi1rFny@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/ijBgoY16KE9vb2ydc8xqdikrvR7AOCQVcYGhIahznIjI40kT
	qI6pDqRE4yWtqBIvvV1Re+k221ZUopuMzAzpNH0U2/16QAMJvFji94h2FX0BxDncMZS6EaqjErL
	aBIrgxmKsHxQHC3FYrrTtaOpdYCFWxkURLGGjEND1
X-Gm-Gg: AeBDieuayEBsPvdeil/qY+sKANMVJY9pt5mHI00f6/t9qHUkL9J5mK9qMql6Jwcyqbx
	AzDXvkkgTU2tsPP6duz6+KbDUY3zCgabgp4a67COsFO+aknRseRvWGaM7xwhcyCjTpj/ixkQcMI
	YpfUWT0C5QF2ZNDQG+jggwxAWQbxiChMBYE+nyYOLbEKBraX6g3iEE41zY1NgDeN7863gqkkUTe
	9uTRptttLgyYL9EIQF/Q7EqmUOi8Z7ZRSCuzQaaF3O+BjsXBOoBLcXjZRMaGITiddQgztN+UC6n
	2hu0zkZ/hAd0t1cerXgdcBuuvPMLFNwg817oUfIxcCg3/NT0c/Mm6alYH0rHQw+AVaKpQD8=
X-Received: by 2002:a05:7022:4199:b0:12c:2cf8:2f30 with SMTP id
 a92af1059eb24-12c73f83616mr10488523c88.15.1776798827054; Tue, 21 Apr 2026
 12:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415143735.2974230-1-elver@google.com> <202604210954.84C57E5E0@keescook>
In-Reply-To: <202604210954.84C57E5E0@keescook>
From: Marco Elver <elver@google.com>
Date: Tue, 21 Apr 2026 21:13:10 +0200
X-Gm-Features: AQROBzBMsDbE7_dyhVt5xWTROldThQNRDRm_VJxxVveH1z3BL1b5nLG0UUHDDRE
Message-ID: <CANpmjNO8CcR56LXAQf4GQhGcbU4MQkRCa7gVvwuAfvVrzEUhQg@mail.gmail.com>
Subject: Re: [PATCH v2] slab: support for compiler-assisted type-based slab
 cache partitioning
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>, GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Apr 2026 at 19:22, 'Kees Cook' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Wed, Apr 15, 2026 at 04:37:05PM +0200, Marco Elver wrote:
> > The builtin __builtin_infer_alloc_token(<malloc-args>, ...) instructs
> > the compiler to infer an allocation type from arguments commonly passed
> > to memory-allocating functions and returns a type-derived token ID. The
> > implementation passes kmalloc-args to the builtin: the compiler performs
> > best-effort type inference, and then recognizes common patterns such as
> > `kmalloc(sizeof(T), ...)`, `kmalloc(sizeof(T) * n, ...)`, but also
> > `(T *)kmalloc(...)`. Where the compiler fails to infer a type the
> > fallback token (default: 0) is chosen.
> >
> > Note: kmalloc_obj(..) APIs fix the pattern how size and result type are
> > expressed, and therefore ensures there's not much drift in which
> > patterns the compiler needs to recognize. Specifically, kmalloc_obj()
> > and friends expand to `(TYPE *)KMALLOC(__obj_size, GFP)`, which the
> > compiler recognizes via the cast to TYPE*.
>
> Great! I'm glad this gets deterministically handled for the kmalloc_obj*
> cases.
>
> > Additionally, when I compile my kernel with -Rpass=alloc-token, which
> > provides diagnostics where (after dead-code elimination) type inference
> > failed, I see 186 allocation sites where the compiler failed to identify
> > a type (down from 966 when I sent the RFC [4]). Some initial review
> > confirms these are mostly variable sized buffers, but also include
> > structs with trailing flexible length arrays.
>
> For the call-site-partitioning series[1] I sent before, I had
> per-site caches for fixed-sized allocations and size bucket caches for
> variably-sized allocations. I'd like to see something similar for this
> series. Specifically, I replaced "kmalloc_slab" with "choose_slab" that
> did O(1) to find the dedicated cache/bucket for the allocation[2].
>
> In this case, we now have a build-time-constant value that it should be
> possible to use to look up a _single_ dedicated cache/bucket for the
> given unique type: there is no need to do hashing.

That should be a separate series; I know what you're getting at, but
it's a significant rework and a different design with different
properties. This simpler patch is likely ready for the next merge
window (once I send v3), and in light of recent developments, I'd like
this to land sooner than later.

> > [...]
> > -config RANDOM_KMALLOC_CACHES
> > -     default n
> > +config PARTITION_KMALLOC_CACHES
> >       depends on !SLUB_TINY
> > -     bool "Randomize slab caches for normal kmalloc"
> > +     bool "Partitioned slab caches for normal kmalloc"
> >       help
> > -       A hardening feature that creates multiple copies of slab caches for
> > -       normal kmalloc allocation and makes kmalloc randomly pick one based
> > -       on code address, which makes the attackers more difficult to spray
> > -       vulnerable memory objects on the heap for the purpose of exploiting
> > -       memory vulnerabilities.
> > +       A hardening feature that creates multiple isolated copies of slab
> > +       caches for normal kmalloc allocations. This makes it more difficult
> > +       to exploit memory-safety vulnerabilities by attacking vulnerable
> > +       co-located memory objects. Several modes are provided.
> >
> >         Currently the number of copies is set to 16, a reasonably large value
>
> The "16" buckets seems to hold for TYPED_KMALLOC_CACHES too? My goal
> with the earlier type-partitioning was to get _total_ isolation, not
> simply bucketed: 1 cache (or sizes-bucket) for each type. The "16"
> limitation from RANDOM_KMALLOC_CACHES was kind of arbitrary due to the
> hashing.

The token ID is also a hash, although it can be configured to be
unbounded to effectively give unique hash per type. As-is, limiting to
16 keeps it comparable to the RANDOM mode, albeit IMHO with better
isolation properties with the same overheads. As-is, performance
properties of RANDOM and TYPED are comparable, and the friction to
switch between them is minimal.

Unlike a completely new design, which will have comletely different
performance and memory usage properties - and wouldn't be comparable.

> >         that effectively diverges the memory objects allocated for different
> >         subsystems or modules into different caches, at the expense of a
> > -       limited degree of memory and CPU overhead that relates to hardware and
> > -       system workload.
> > +       limited degree of memory and CPU overhead that relates to hardware
> > +       and system workload.
> > +
> > +choice
> > +     prompt "Partitioned slab cache mode"
> > +     depends on PARTITION_KMALLOC_CACHES
> > +     default RANDOM_KMALLOC_CACHES
>
> I think this should be adjusted a bit:
>
> config CC_HAS_ALLOC_TOKEN
>         def_bool $(cc-option,-falloc-token-max=123)
>
> ...
> choice
>         prompt "Partitioned slab cache mode"
>         depends on PARTITION_KMALLOC_CACHES
>         default TYPED_KMALLOC_CACHES if CC_HAS_ALLOC_TOKEN
>         default RANDOM_KMALLOC_CACHES

Sure.

> And actually, perhaps a global rename of the options so the selection
> naming is at the end of the CONFIG phrase, and bundle the on/off into
> the choice:
>
>
> choice
>         prompt "Partitioned slab cache mode"
>         depends on PARTITION_KMALLOC_CACHES
>         default KMALLOC_PARTITION_TYPED if !SLUB_TINY && CC_HAS_ALLOC_TOKEN
>         default KMALLOC_PARTITION_RANDOM if !SLUB_TINY
>         default KMALLOC_PARTITION_NONE
>
> config KMALLOC_PARTITION_NONE
> ...
> config KMALLOC_PARTITION_RANDOM
>         depends on !SLUB_TINY
> ...
> config KMALLOC_PARTITION_TYPED
>         depends on !SLUB_TINY && CC_HAS_ALLOC_TOKEN

There was a comment somewhere else that even introducing
PARTITION_KMALLOC_CACHES might confuse users of RANDOM_KMALLOC_CACHES.
I think completely getting rid of and renaming RANDOM_KMALLOC_CACHES
has marginal benefit, and will cause friction for existing users (even
moreso than already). I see little benefit here, and would prefer not
to break user configs more than needed: configs that already set
RANDOM_KMALLOC_CACHES, upon rebuild will be prompted to enable
PARTITION_KMALLOC_CACHES; if user says Y, then their previous
selection (RANDOM) would already be picked and they don't have to
rediscover that it exists under a new name.

I can make this change, but only if you're sure the benefit outweighs
the downsides here.

Thanks,
-- Marco

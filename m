Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EBC1109
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 09:00:53 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id w2so379837qtv.9
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 02:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ir+IzupNAXvXvPBkZ1yh/qacu5xVXDJ2KC3L3ZMV+D4=;
        b=T1RmZXRk/wprRIfh5L3vkCXQfCOtF0V/Ciq1PvClEdV0L7Pd4kj6SyNw7bh3Je45CU
         38Pik0FzFzjUVVC+C58UEf7eRN165qNUjyaU//qxzcFWC877GbLq0gsS3VukdY/bk6c7
         tHFKtuxQsgoV2TTnsAgienOPfwhMpaDnb77hlVJOzvR19GsPDmWjkd2WY6IcsiKJ66iO
         IPV8y6+rbElMl4A6Qf55hY74sn4+dwG+n2kJnfQPd7+U5QMjPoGt/kNzwxoFwHS6BsBg
         2agaRz8rZtgkl/MYXvhv7nd8gcgzY60ssP84WlpzJXfbr85CQwqOBcyufklZnxrmuBiz
         Nvag==
X-Gm-Message-State: ACrzQf0QEir0QkL2lzdlovycYkEQI/JahB2AxXkYrIXZtNQCY5+HJ2Pf
	++EuNoR5OIIgmEIgCdjAvmowzfPNX/nvYQ==
X-Google-Smtp-Source: AMsMyM5wnGnQpv5ii4gn8+FtcJJi0w/CvXksKJa+sIfMrqO0Pr26q9cyGtkC202MeFQPIafXPibPgg==
X-Received: by 2002:a05:622a:1743:b0:35b:a8d6:ff6e with SMTP id l3-20020a05622a174300b0035ba8d6ff6emr1438611qtk.269.1664442052449;
        Thu, 29 Sep 2022 02:00:52 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id s6-20020ae9de06000000b006cf36d46902sm5326206qkf.66.2022.09.29.02.00.52
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 02:00:52 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id e145so738471yba.11
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 02:00:52 -0700 (PDT)
X-Received: by 2002:a5b:104:0:b0:6b0:429:3fe9 with SMTP id 4-20020a5b0104000000b006b004293fe9mr2016091ybx.543.1664442041163;
 Thu, 29 Sep 2022 02:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-2-keescook@chromium.org> <CAMuHMdXK+UN1YVZm9DenuXAM8hZRUZJwp=SXsueP7sWiVU3a9A@mail.gmail.com>
 <202209281011.66DD717D@keescook> <874jwqfuh6.fsf@mpe.ellerman.id.au>
In-Reply-To: <874jwqfuh6.fsf@mpe.ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Sep 2022 11:00:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOvs4adSV7G6ucZ8dcr+RxfZOOK=jXeO2tEAaXkv80Xg@mail.gmail.com>
Message-ID: <CAMuHMdVOvs4adSV7G6ucZ8dcr+RxfZOOK=jXeO2tEAaXkv80Xg@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] slab: Remove __malloc attribute from realloc functions
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Kees Cook <keescook@chromium.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	Marco Elver <elver@google.com>, linux-mm@kvack.org, 
	"Ruhl, Michael J" <michael.j.ruhl@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Alex Elder <elder@kernel.org>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jesse Brandeburg <jesse.brandeburg@intel.com>, Daniel Micay <danielmicay@gmail.com>, 
	Yonghong Song <yhs@fb.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, dev@openvswitch.org, x86@kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, Sep 29, 2022 at 10:36 AM Michael Ellerman <mpe@ellerman.id.au> wrot=
e:
> Kees Cook <keescook@chromium.org> writes:
> > On Wed, Sep 28, 2022 at 09:26:15AM +0200, Geert Uytterhoeven wrote:
> >> On Fri, Sep 23, 2022 at 10:35 PM Kees Cook <keescook@chromium.org> wro=
te:
> >> > The __malloc attribute should not be applied to "realloc" functions,=
 as
> >> > the returned pointer may alias the storage of the prior pointer. Ins=
tead
> >> > of splitting __malloc from __alloc_size, which would be a huge amoun=
t of
> >> > churn, just create __realloc_size for the few cases where it is need=
ed.
> >> >
> >> > Additionally removes the conditional test for __alloc_size__, which =
is
> >> > always defined now.
> >> >
> >> > Cc: Christoph Lameter <cl@linux.com>
> >> > Cc: Pekka Enberg <penberg@kernel.org>
> >> > Cc: David Rientjes <rientjes@google.com>
> >> > Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> >> > Cc: Andrew Morton <akpm@linux-foundation.org>
> >> > Cc: Vlastimil Babka <vbabka@suse.cz>
> >> > Cc: Roman Gushchin <roman.gushchin@linux.dev>
> >> > Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> >> > Cc: Marco Elver <elver@google.com>
> >> > Cc: linux-mm@kvack.org
> >> > Signed-off-by: Kees Cook <keescook@chromium.org>
> >>
> >> Thanks for your patch, which is now commit 63caa04ec60583b1 ("slab:
> >> Remove __malloc attribute from realloc functions") in next-20220927.
> >>
> >> Noreply@ellerman.id.au reported all gcc8-based builds to fail
> >> (e.g. [1], more at [2]):
> >>
> >>     In file included from <command-line>:
> >>     ./include/linux/percpu.h: In function =E2=80=98__alloc_reserved_pe=
rcpu=E2=80=99:
> >>     ././include/linux/compiler_types.h:279:30: error: expected
> >> declaration specifiers before =E2=80=98__alloc_size__=E2=80=99
> >>      #define __alloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__) __=
malloc
> >>                                   ^~~~~~~~~~~~~~
> >>     ./include/linux/percpu.h:120:74: note: in expansion of macro =E2=
=80=98__alloc_size=E2=80=99
> >>     [...]
> >>
> >> It's building fine with e.g. gcc-9 (which is my usual m68k cross-compi=
ler).
> >> Reverting this commit on next-20220927 fixes the issue.
> >>
> >> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/14803908/
> >> [2] http://kisskb.ellerman.id.au/kisskb/head/1bd8b75fe6adeaa89d02968bd=
d811ffe708cf839/
> >
> > Eek! Thanks for letting me know. I'm confused about this --
> > __alloc_size__ wasn't optional in compiler_attributes.h -- but obviousl=
y
> > I broke something! I'll go figure this out.
>
> This fixes it for me.

Kees submitted a similar patch 20 minutes before:
https://lore.kernel.org/all/20220929081642.1932200-1-keescook@chromium.org

> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -275,8 +275,13 @@ struct ftrace_likely_data {
>   * be performing a _reallocation_, as that may alias the existing pointe=
r.
>   * For these, use __realloc_size().
>   */
> -#define __alloc_size(x, ...)   __alloc_size__(x, ## __VA_ARGS__) __mallo=
c
> -#define __realloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__)
> +#ifdef __alloc_size__
> +# define __alloc_size(x, ...)  __alloc_size__(x, ## __VA_ARGS__) __mallo=
c
> +# define __realloc_size(x, ...)        __alloc_size__(x, ## __VA_ARGS__)
> +#else
> +# define __alloc_size(x, ...)  __malloc
> +# define __realloc_size(x, ...)
> +#endif
>
>  #ifndef asm_volatile_goto
>  #define asm_volatile_goto(x...) asm goto(x)


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

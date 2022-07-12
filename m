Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B714681
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 23:30:05 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-10c0119dd16so12197585fac.6
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 16:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WnTghxFtBu2OXOEU87B3AgUgfQXj7MipiT7mcrRjJ8U=;
        b=DaJ0AyL3CWqo/8jTMhu/RWfBG6hJQkhTIo2KeGqcu3GnOKDtCw6zA22bOdYEy/kvrT
         +pAU5YhfttQRQi81VkujUUkLc5/iS2h0eFaaZYjBzMTylS/At8cRjCLNaeFF+buaIGiS
         AH3c9q6JYKKP56heR0KOorgcWT2V0c6PqzUNpN9YYJEyzy/3hMb0Rh0yHKVztS6+yp5J
         h6ULPO5vfHyaOl9ipSbnQXZ3CyT8V/Rls04FfU9I5ySB5qc9SVM+7D/SrNe+CzGeJWJ0
         h7nfZ1cCaqLy75bR6A6EVqCMYOlAmx8ASiJpowDVWt/DNqRodzQyTilz/txfabQA3Vnh
         zdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WnTghxFtBu2OXOEU87B3AgUgfQXj7MipiT7mcrRjJ8U=;
        b=PTSJpbXli2y1L+WWQ5+9NDmeXhUs3SHDS4vOGDoAI+RmGJtDUHqO/aCFBebNTTVJ1O
         nMcLtPZimR7Jr92AYLaoyqjLGYdAwPlMoMwwd5rV7sXJNeLffCPdxPelb5u7d+Yocshr
         lmtYmVpjHlumIIsJlJ1Ki/GpkkphZpgA1/WTTTK0F2gAxaDAW8zvAJcDuz7bQUg7/b5Q
         Q23AY4HkDKQMyivjFPAz+GCORiRN1UkkpE1KoViLSf2DcjG6BWPto1wjSz0lmGbwH4O8
         5sTEVvTakfwjUihnn8dDjVvgzdAX2Iml7IPFNHwCdlq1G++dQ18AuQWWqg2w9ppKJh3T
         MMeg==
X-Gm-Message-State: AJIora/iuvvAs5bMYeajPiyh1RaA3Njr1E/xNuKzFH2je4DF0ECuWa4p
	L1SR5i7K3YSeJXvMwWojF8XN1sy4atbICErDCBU=
X-Google-Smtp-Source: AGRyM1ueMc+11lpynByTZX4WV3tgjQkbuZWMss8T/lZWNsLRUfJlb9mnAT0iEe2B39RWalsVyTTD7PA2ApxDrtn3tSM=
X-Received: by 2002:a05:6870:d0ce:b0:f3:3856:f552 with SMTP id
 k14-20020a056870d0ce00b000f33856f552mr343201oaa.99.1657668604358; Tue, 12 Jul
 2022 16:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706172814.169274-1-james.hilliard1@gmail.com>
 <a0bddf0b-e8c4-46ce-b7c6-a22809af1677@fb.com> <CADvTj4ovwExtM-bWUpJELy-OqsT=J9stmqbAXto8ds2n+G8mfw@mail.gmail.com>
 <CAEf4BzYwRyXG1zE5BK1ZXmxLh+ZPU0=yQhNhpqr0JmfNA30tdQ@mail.gmail.com> <a443a6f9-fd6f-d283-ce00-68d72b40539d@isovalent.com>
In-Reply-To: <a443a6f9-fd6f-d283-ce00-68d72b40539d@isovalent.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 12 Jul 2022 17:29:53 -0600
Message-ID: <CADvTj4qrKkyGBzxVk-Ddtv5fAs8wUD7L-cwZtqNE=7CMF+O0Eg@mail.gmail.com>
Subject: Re: [PATCH v2] bpf/scripts: Generate GCC compatible helpers
To: Quentin Monnet <quentin@isovalent.com>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 12, 2022 at 3:48 AM Quentin Monnet <quentin@isovalent.com> wrote:
>
> On 12/07/2022 05:40, Andrii Nakryiko wrote:
> > CC Quentin as well
> >
> > On Mon, Jul 11, 2022 at 5:11 PM James Hilliard
> > <james.hilliard1@gmail.com> wrote:
> >>
> >> On Mon, Jul 11, 2022 at 5:36 PM Yonghong Song <yhs@fb.com> wrote:
> >>>
> >>>
> >>>
> >>> On 7/6/22 10:28 AM, James Hilliard wrote:
> >>>> The current bpf_helper_defs.h helpers are llvm specific and don't work
> >>>> correctly with gcc.
> >>>>
> >>>> GCC appears to required kernel helper funcs to have the following
> >>>> attribute set: __attribute__((kernel_helper(NUM)))
> >>>>
> >>>> Generate gcc compatible headers based on the format in bpf-helpers.h.
> >>>>
> >>>> This adds conditional blocks for GCC while leaving clang codepaths
> >>>> unchanged, for example:
> >>>>       #if __GNUC__ && !__clang__
> >>>>       void *bpf_map_lookup_elem(void *map, const void *key) __attribute__((kernel_helper(1)));
> >>>>       #else
> >>>>       static void *(*bpf_map_lookup_elem)(void *map, const void *key) = (void *) 1;
> >>>>       #endif
> >>>
> >>> It does look like that gcc kernel_helper attribute is better than
> >>> '(void *) 1' style. The original clang uses '(void *) 1' style is
> >>> just for simplicity.
> >>
> >> Isn't the original style going to be needed for backwards compatibility with
> >> older clang versions for a while?
> >
> > I'm curious, is there any added benefit to having this special
> > kernel_helper attribute vs what we did in Clang for a long time? Did
> > GCC do it just to be different and require workarounds like this or
> > there was some technical benefit to this?
> >
> > This duplication of definitions with #if for each one looks really
> > awful, IMO. I'd rather have a macro invocation like below (or
> > something along those lines) for each helper:
> >
> > BPF_HELPER_DEF(2, void *, bpf_map_update_elem, void *map, const void
> > *key, const void *value, __u64 flags);
> >
> > And then define BPF_HELPER_DEF() once based on whether it's Clang or GCC.
>
> Hi, for what it's worth I agree with Andrii, I would rather avoid the
> #if/else/endif and dual definition for each helper in the header, using
> a macro should keep it more readable indeed. The existing one
> (BPF_HELPER(return_type, name, args, id)) can likely be adapted.

Yeah, seems a bit cleaner, think I got it working:
https://lore.kernel.org/bpf/20220712232556.248863-1-james.hilliard1@gmail.com/

>
> Also I note that contrarily to clang's helpers, you don't declare GCC's
> as "static" (although I'm not sure of the effect of declaring them
> static in this case).
>
> Thanks,
> Quentin

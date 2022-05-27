Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF46F7C
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 06:05:24 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-3043b3f7d8fso27020417b3.8
        for <llvm@lists.linux.dev>; Thu, 26 May 2022 23:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7VHvjIfJq9D6lO+TpoQm0tnmjw/+FCIiWflb4wfyiis=;
        b=EVbTirZ2vrqAYHDnzMm5B3W6FGQZB1r/4vu2KijGst4r3mubDFHwxWtM6tTw7axbKa
         pCC6F47ItDOVU+AV2wu+0Xh0MFWukiuBHOWIruQlWYrLgzOM6jlwjeZEahtHvqroDOBE
         iC3LBxdlfM3Z6hJlIYTk2w5Yew2OVmF04h7Bv8fTr14bMln3jTd6S+l8vKUFp3U9IQ+s
         p8wbaSPJh0yxnSl60+RK/7J5MAr5xBxAWR2DhxO9X7PTN6KZHrdc1bnvJtuv84Ykb6ZX
         LNw/HUH0BJkZcIslZobcOkt3zEXU7np+FsjWIXfhyMEoB+zJDYGaKtNfcRduJMQpKBbP
         f3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7VHvjIfJq9D6lO+TpoQm0tnmjw/+FCIiWflb4wfyiis=;
        b=0r6dqmeZRhfeRaCIpms/7IVVO75gxwwpl5LTqImPuIKzYZdHtLyUQu8bOMNFM3d934
         LOB6xjbUqEUme6tb3DG3OoBzdwge1RuUkTH5foLUXwMIsuBFNxYqQ6Dg0sYsetmqG33D
         816sYkH3SBSLAiuKcqVHOqladI1dkRIFeoQ8Nkv4O6ErTFlU7wE9/NvT8DLodX0KWHg/
         IXyQ8PBlZxK2dOWZ5NZYVsEqM1th+acarpH1854Mbpw6YV+BwqhbaSFgiGhpi7LQipTT
         iz680m3L4aer/yGaE6ks/OUqbKED/xNBVaY5RMuq8WeeD/X2oj10lXQZ/0ByqQQR/+uy
         dEuw==
X-Gm-Message-State: AOAM532G/UrWPNJ+xiKVajS7jmqMBLeLE0LBJakkpsxRJz6I3teZvq3X
	zCjQElEwtEJ+BkSjUbp5iAsUF/d9XlJzGa6mHULQCA==
X-Google-Smtp-Source: ABdhPJzmqggwtA1y7Yx/fkUPb0VYhyt53XkbFW/YOv8U7jTTlx8hbfIWMLZOyIomdvlvIKNRQAdurZiLN3oGIAvuprM=
X-Received: by 2002:a81:7c45:0:b0:300:2f8c:7cf2 with SMTP id
 x66-20020a817c45000000b003002f8c7cf2mr15465005ywc.255.1653631523553; Thu, 26
 May 2022 23:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOBGo4zjkcX=ZQm1uYRDe9EjYqsTCyZY-Gf1C4XqMNYGFCcF+Q@mail.gmail.com>
 <CAP-5=fUobnt9anqeTaUt_EJVuMOpsxGR-Sa_e7qX=ZxqPDr+sA@mail.gmail.com>
 <20220526041650.esbcujaihdv5jqxm@google.com> <CAP-5=fVbCNg=wGbN3dK1yP_cu_eL3h-sPDZ1hC2BgVM8nmHZ_w@mail.gmail.com>
 <Yo+RDn9om2Eiwjym@kernel.org>
In-Reply-To: <Yo+RDn9om2Eiwjym@kernel.org>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Thu, 26 May 2022 23:05:12 -0700
Message-ID: <CAFP8O3JreR7XD-OygwP6+wwrJoxEfAnZm9+U8Ti68fmAHKaKvg@mail.gmail.com>
Subject: Re: Call graph dwarf unwinding fails with lld
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Travis Downs <travis.downs@gmail.com>, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, May 26, 2022 at 7:39 AM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Wed, May 25, 2022 at 09:25:39PM -0700, Ian Rogers escreveu:
> > On Wed, May 25, 2022 at 9:16 PM Fangrui Song <maskray@google.com> wrote:
> > >
> > > On 2022-05-25, Ian Rogers wrote:
> > > >On Tue, May 24, 2022 at 1:50 PM Travis Downs <travis.downs@gmail.com> wrote:
> > > >>
> > > >> I have been tracking down an issue locally where `perf record
> > > >> --call-graph=dwarf` stopped working in the sense that unwinding always
> > > >> failed.
> > > >>
> > > >> Turns out it was related to `lld` - binaries linked with `lld` don't
> > > >> seem to unwind correctly with `--call-graph=dwarf`. I've confirmed
> > > >> that the `.eh_frame` sections are there, but I guess they are
> > > >> different after using this linker.
> > > >>
> > > >> Has anyone run into this?
> > > >
> > > >I was unaware but thanks for filing the bug!
> > > >
> > > >> There's an open LLVM issue at https://github.com/llvm/llvm-project/issues/53156
> > > >>
> > > >> ... but no activity since it was filed, though it is not clear if the
> > > >> problem is really with lld or the unwinders.
> > > >>
> > > >> In a related question: perf supports more than one DWARF unwinding
> > > >> implementation, depending on what libraries are available at build
> > > >> time, right? Is there a way to select which unwinder is used at
> > > >> runtime?
> > > >
> > > >I don't think so. There are two build options NO_LIBUNWIND=1 and
> > > >NO_LIBDW_DWARF_UNWIND=1. I played around with the example from the
> > > >bug, confirmed no difference with the eh_frames and hand verified
> > > >them, I also added -fno-omit-frame-pointer -O0 and -static. I've not
> > > >got a good handle on the issue but my suspicion is that the
> > > >eh_frame_hdr is broken - it is at least something that lld generates.
> > > >If I change the eh_frame_hdr finding to some findable but unexpected
> > > >offset like eh_frame here:
> > > >https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/tree/tools/perf/util/unwind-libunwind-local.c?h=perf/core#n286
> > > >and then test with a working linker the unwinding is broken similarly
> > > >to with lld. I was looking for a useful tool (objdump, llvm-objdump,
> > > >readelf, dwarfdump) to look at the eh_frame_hdr but I didn't see one.
> > > >Perhaps someone has a suggestion or maybe pahole can do it. Hopefully
> > > >this gives a lead for you to dig into for the bug.
> > > >
> > > >Thanks,
> > > >Ian
> > >
> > > I am very familiar with lld and have read some nongnu libunwind code, so I guess I
> > > may be an appropriate one debugging the issue, but I am puzzled about how to build tools/perf:
> > >
> > > /tmp/out/custom1 has needed llvm-project tools, built from origin/main
> > > ninja -C /tmp/out/custom1 clang lld llvm-{nm,size,strings,objcopy,objdump,readelf,ar,strip}
> > >
> > > ```
> > > % git checkout master  # torvalds/linux
> > > % PATH=/tmp/out/custom1/bin:$PATH make O=/tmp/linux/x86_64 ARCH=x86_64 -j60 defconfig all
> > > % PATH=/tmp/out/custom1/bin:$PATH make O=/tmp/linux/x86_64 ARCH=x86_64 -j60 -C tools/perf
>
> I never tried build both Linux and perf on the same O= directory, can
> you please building perf on a separate directory to see if this changes
> anything?
>
> Also you don't need to build Linux proper to test these problems, right?
>
> - Arnaldo

Thank you! Using an O= without the kernel build fixes my build problem...
Then I managed to craft a patch:)
https://lore.kernel.org/linux-perf-users/20220527055217.452307-1-maskray@google.com/
("perf: Fix segbase for ld.lld linked objects")

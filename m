Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BBD81B
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 13:42:48 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3176b6ed923so100567077b3.11
        for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 06:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r7TljQ8Mdn4r6RABJelslZ4EHBzaOo9RlpeKDKg8jx8=;
        b=KZVf4NtkgcLKXMqWcLh5QhWBabQ417/TYnSgA4Ti8kuyqfTiA+SMW4F9lAc3UYjvR7
         hDUxzcdQEqYFh3QcTA5EpAysKRQHU4b9j8OFIzEvZ2RAFRi0LbwX9f4D8SryyxtKKnbj
         yOeTS2P+YbypcqYIHO7qgONxK7hniPyFRwdveXLLFIHNsN4vpvZGz8MCK7LFKEjwq3Fy
         RRN3DRhT6fpsVXJf5pgZLtY4TZ09GeqqSK38y2dZbAfPEQecJnfsuhhniSoDOg7aLbaG
         aHPfK9WkEaifLdA0LlnZApriEjlrQ/6dh6g+1tzGWA3G4i0p74JEwxpuS4Wy9sRVLp5B
         O9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r7TljQ8Mdn4r6RABJelslZ4EHBzaOo9RlpeKDKg8jx8=;
        b=gMf/YSixl21GSeIhlQE3p1DM0FnEKj5K0cQUg8MmBatf3k0rF/cEVkJ7MYHC+C/21l
         IvudDRa3Gixsw9JNuC5gkszY+LvQ2d8FhHpmJp9bJG0KCaAyZ6BJT3TsncfLbrsoTNwg
         LAnVetRShHf3nVSFhrt+ErQGzu/M5qAjMvFLSwokqbwZV1lA6ePKQRslMpDa6KjSIe4H
         sxrSGm7bHv6fTsZA2DfXZYT8w1wfCmTWl2GnwMG3BVdWVUUGyseUkQF47HyAh+8RB/9R
         1ZkalTIeolPXZ8JdNtebM1bU8m9ncxD6Z7w/lzBzo6bfzz9yVeWjzz5cpYYvSxB9xhfZ
         0LyQ==
X-Gm-Message-State: AJIora/vYzpYNxnj50G0MwaI41nbPTZU1WdMS49qNNJ/vgK2H+RaKzoF
	lXYhCwFIaA5wV2w07rJ50vuMb+AocNtAuDozAWGrOg==
X-Google-Smtp-Source: AGRyM1v7ohe5mL+dJuvCG3rVH5Sm2VREEGGvveaxvIWzIcisglj9YdY6lo91FpCqix9TEApus5GQ1CnjyppqVCWv9jk=
X-Received: by 2002:a05:690c:108:b0:2e5:b91a:195b with SMTP id
 bd8-20020a05690c010800b002e5b91a195bmr28101627ywb.44.1655732567499; Mon, 20
 Jun 2022 06:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdnb-MV+Fw2oeZ5qiGQH9FPOjgYTDtVrYc1=ynY7=NReDQ@mail.gmail.com>
 <87fsm7rbec.fsf@oracle.com> <CAGvU0H=sjwsWEmq1R7LKHiPjB3aBkzQ_qJqXDxhT_rFJShgVFg@mail.gmail.com>
 <2651230.KlZ2vcFHjT@sali>
In-Reply-To: <2651230.KlZ2vcFHjT@sali>
From: =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>
Date: Mon, 20 Jun 2022 14:42:31 +0100
Message-ID: <CAJFNNnoWDS547q-MDye4L_2WkT9odxAvhD2JQkALH7Erm2YJtQ@mail.gmail.com>
Subject: Re: Kernel ABI Monitoring and toolchain support
To: "Guillermo E. Martinez" <guillermo.e.martinez@oracle.com>
Cc: Giuliano Procida <gprocida@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Dodji Seketeli <dodji@seketeli.org>, elena.zannoni@oracle.com, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi!

That is a very late response, sorry about that.

In the Android MC we will have a talk about the latest news monitoring
Android Kernel ABIs already, but I definitely see value in a more
generic session in the Kernel+Toolchain MC. Is that schedule already
finalized or is there still a slot available and interest from your
side?

In particular, I would be interested in discussing ways to standardize
ABI and type information in a way that it can be embedded into
binaries in a less ambiguous way. In other words, what can we do to
not rely entirely on intermediate formats like CTF or DWARF to make
sense of an ABI? Maybe CTF is already a good starting point, yet some
additions are needed (e.g. other language features like for C++)?

Cheers,
Matthias


On Sat, May 7, 2022 at 3:15 AM Guillermo E. Martinez
<guillermo.e.martinez@oracle.com> wrote:
>
> Hello guys,
>
> On our side we are working on:
>
>   * Gives the support  to extract the ABI for Linux kernel image
>   and Linux  kernel modules using the CFT backed in with
>   libabigail tools.
>   * Add support to compare packages with CTF debug format by using
>   abipkgdiff and other related libabigail tools.
>
>    * https://sourceware.org/pipermail/libabigail/2022q2/004340.html
>    * https://sourceware.org/pipermail/libabigail/2022q2/004345.html
>
> If you think that it could be a point to talk as part of your MC,  I can for sure
> provides more details about it.
>
> Thanks for your comments,
> Guillermo
>
> On Wednesday, April 20, 2022 12:34:59 PM CDT Giuliano Procida wrote:
> > Sorry for the late reply, I've been on leave and Mattias is still on leave.
> >
> > That sounds quite interesting.
> >
> > Matthias and I could certainly talk about what we've been busy with and
> > what are the main pain points for Android (not just the kernel).
> >
> > On what more would we like from the toolchain... it falls into at least two
> > buckets:
> >
> > 1. make the possible easier - stricter conformance to DWARF standards, full
> > DWARF 5 support, getting things like ARM64 ABI extensions (e.g., for
> > HWASAN) into things like elfutils at the same time as the compile-link
> > toolchain, more consistency between Clang and GCC debug info for the same
> > sources, the same for Clang and Clang with full LTO
> > 2. make the impossible possible - extending ABI monitoring coverage beyond
> > just architecture, symbols and types / dealing with header constants,
> > macros and more
> >
> > Giuliano.
> >
> >
> > On Wed, 20 Apr 2022 at 17:02, Jose E. Marchesi <jose.marchesi@oracle.com>
> > wrote:
> >
> > >
> > > [Adding Dodji Seketeli, libabigail maintainer,
> > >  and Guillermo Martinez, who works in the CTF support for libabigail
> > >  including kernel support.]
> > >
> > > > Hi Matthias and Giuliano,
> > > > Jose and I are currently in the planning process to put together a
> > > > Kernel+Toolchain microconference track at Linux Plumbers Conference
> > > > this year (Sept 12-14) in Dublin, Ireland.
> > > >
> > > > Would you all be interested in a leading session on Kernel ABI
> > > > Monitoring and perhaps what toolchain vendors can do to help, as part
> > > > of our MC (which itself is currently still in planning phase).
> > >
> >
>
>
>
>

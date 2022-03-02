Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36E333CA
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 22:54:48 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id d23so5299700lfv.13
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 14:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npju3rHc3mRSfcSts2+QJjEKDIhH7Izt6iSeFW3/QF8=;
        b=EGUemDJqLPj5B1hkkSx83siUMy1VVgYpLmLW+ISOhNuoXtHKsSw2hUGh04Nr1SSJBa
         r1zlSLuTwOVX4majvP3P2eRAehp5T6N3EhkQMRRzPZTVKm7dG9AMpyQkHmmlptVAkH1M
         9qJqcvZhIGwX2krc9gtYqqgwwQlmQpMuIj2tBVKllvQa6ewTZR3bIzSlOMcvz81A9HgK
         U6a1Rlq0X8a/j+BcebndmqCX94BKI7/Pk6tA767h9fKeB1KajrFXzeZtGEtmtGtKzQ82
         MRbBDpAmm2KjoZQU/U/PLkzR0auLS/dAQCdKPVFuvLwFIJNhxluwc4Nr3f7cAO8VDXZ4
         jz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npju3rHc3mRSfcSts2+QJjEKDIhH7Izt6iSeFW3/QF8=;
        b=TCNIhKQYTQD+AYh9tzk7IsXwT8vr4ALvvLZRr8YCoBUdseaGJNsVgbs46GDxTXgCnw
         vgyEQRbXD+vL92OZu+g1UedAVR8HKV6GHgXrWbBPBxC5cBtL0B2yy+IXuDpAk7/ijk86
         wQXc9hZWH5QO2vbTGrmA1QcUHmQc2l3oa26QBlKprULkx9swkLswY09Wn0ffOec9gAaf
         Xq5LyNGi2v7UUtflgeKBp8mKgNH3SbaNQF91L3p2IJZ/Lblylo8kcq9uqzNVE1OFg/lz
         1RkPFntGxLRDAkSb7MfDTSZViAAcYYybwJ9fRpUoDxZptRIdAIeiskmE4fl3eLWAIuwW
         TUTg==
X-Gm-Message-State: AOAM5337Rj4mYLusZg3AhxgAPUei6RynW18a1xpF1rvrPnHcIj0B34NC
	Ly+gvjYp84icmlpRpV1HSqpJz2wIPHDDT77//VPEkg==
X-Google-Smtp-Source: ABdhPJwNGg4cChj44h6sHunDdkaG9C78703PQ9UZNkp6xZHGYO9BRG6dBg6H3kef6ltm6p6P5d5rhHI0dHWUyV3MtyU=
X-Received: by 2002:ac2:46ef:0:b0:443:3c30:a372 with SMTP id
 q15-20020ac246ef000000b004433c30a372mr19890713lfo.626.1646261686698; Wed, 02
 Mar 2022 14:54:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-3-arnd@kernel.org>
 <CA+icZUWCTuVeohWvePhxYY3WC9xAYSy9nP1xQQf=tFH_mWDCNQ@mail.gmail.com>
In-Reply-To: <CA+icZUWCTuVeohWvePhxYY3WC9xAYSy9nP1xQQf=tFH_mWDCNQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Mar 2022 14:54:35 -0800
Message-ID: <CAKwvOdn04aoWO_384k5HQodwA1-DCFwU50iRXQXh_BQk5pyz7w@mail.gmail.com>
Subject: Re: [PATCH 3/3] Kbuild: use -std=gnu11 for KBUILD_USERCFLAGS
To: sedat.dilek@gmail.com
Cc: Arnd Bergmann <arnd@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Jani Nikula <jani.nikula@intel.com>, David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 2, 2022 at 2:14 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Mar 2, 2022 at 10:47 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > As we change the C language standard for the kernel from gnu89 to
> > gnu11, it makes sense to also update the version for user space
> > compilation.
> >
>
> Overdue.
>
> Can you point me to a lore link where I can easily fetch the full 3/3
> v3 patchset?

Hey Sedat!

$ b4 am https://lore.kernel.org/lkml/20220301145233.3689119-1-arnd@kernel.org/
-o - | git am -3

https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation

>
> I would like to give this a try on x86-64 with my latest kernel-config
> (based on the latest kernel-config v5.17-rc5 from Debian/unstable).
>
> What Linux source base do I need?
> Is Linux v5.17-rc6 good enough (patchset applicable) for testing?

I suspect so.
-- 
Thanks,
~Nick Desaulniers

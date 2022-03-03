Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2B9621
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 06:26:42 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id y5so3233466ill.13
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 22:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=6cIMVIL+CCfpPGGYjFcu/o0ZTv3OrIkZlvD7/pJ5jLE=;
        b=qAPglD6WY9eqhPAwpMIjhiwYNT2dKn4CN38Zc82q2s1SK/f3Natf+VLErUyGTKjrWy
         CRbOAq9HpURnNbnXCMUOr+t9a1Mn870/X6I7oaKHv1pzPlIbjauqddiERKoJBul3r10s
         nCWQcGOmXStt50Ncw7yT0WSq1l1J//LuF6ExO0Rn6TUTaWT+RAhlPh71W9bEKT6SNXvG
         H0szLTUbOPDyzykmzzajMj9cC+kp9+YVW/thD+dHHr6TDs9PFlk+GIUrSrwKCVqRkwMM
         v8xPgMzjlEaISe+pvI16QKOSkVWMsrLAT0LzSwCDMWsXnMANbDx24bQ13bVNQLl/O3pI
         +Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=6cIMVIL+CCfpPGGYjFcu/o0ZTv3OrIkZlvD7/pJ5jLE=;
        b=wCe08tIrhpavSgDlcxRY7BG931h7gNtYMHEEeJnsUK3HWNAO0buR/BFSADgdkyodsJ
         s75JZdZWH2R1yws9g2EQHmBhWyEgsjCFEW4Se01GroRY6r2Vq7OeoIetF6jEJJ5l4uOb
         I58COpueLVRW8futKu5nwruxy2jya6OqjlMJwONByNN4IrBniT5sfJPL6ebz18mANuwm
         U5lshDoZHwuPGlzO5B6Momwm2zPyZVOUtRowggBDymJE6p4mb9OdoegjIfTpGM4dKPxd
         6seMNSfNp6tpyoaWoRcf4nCpeESUA2yZRR0zwon+7q6+z/VbhccrKwIpMLLTdoYoqAuu
         emBQ==
X-Gm-Message-State: AOAM533jWg7pe4ZO+6l1n5Ke98GesfYxA4vR45//LC6dP744VG3DHKSU
	Dax9QJNEVRqDZsG5AtDUnx+Kw1xLJ7LDWlfPlg0=
X-Google-Smtp-Source: ABdhPJxN4sEwUhUly0CT6JZ3A4I17A47qSawqzxX8rRhMHb82FN8jNix1RE7+RJJ1Gk2Z/4ey0Hz4TWtsMIElevu9YY=
X-Received: by 2002:a05:6e02:1ba5:b0:2c2:b1a8:efcf with SMTP id
 n5-20020a056e021ba500b002c2b1a8efcfmr26236724ili.20.1646288801478; Wed, 02
 Mar 2022 22:26:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-3-arnd@kernel.org>
 <CA+icZUWCTuVeohWvePhxYY3WC9xAYSy9nP1xQQf=tFH_mWDCNQ@mail.gmail.com> <CAKwvOdn04aoWO_384k5HQodwA1-DCFwU50iRXQXh_BQk5pyz7w@mail.gmail.com>
In-Reply-To: <CAKwvOdn04aoWO_384k5HQodwA1-DCFwU50iRXQXh_BQk5pyz7w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 3 Mar 2022 07:26:05 +0100
Message-ID: <CA+icZUWD_O1WTKNDTj7f+EUxx5Pf=zC53mfOBNgtj1JQwjZVAQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] Kbuild: use -std=gnu11 for KBUILD_USERCFLAGS
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Jani Nikula <jani.nikula@intel.com>, David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 2, 2022 at 11:54 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Mar 2, 2022 at 2:14 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Wed, Mar 2, 2022 at 10:47 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > As we change the C language standard for the kernel from gnu89 to
> > > gnu11, it makes sense to also update the version for user space
> > > compilation.
> > >
> >
> > Overdue.
> >
> > Can you point me to a lore link where I can easily fetch the full 3/3
> > v3 patchset?
>
> Hey Sedat!
>
> $ b4 am https://lore.kernel.org/lkml/20220301145233.3689119-1-arnd@kernel=
.org/
> -o - | git am -3
>

Hey Nick!

This only applies 1/3.

$ b4 --version
0.8.0

$ b4 am https://lore.kernel.org/lkml/20220301145233.3689119-1-arnd@kernel.o=
rg/
-o - | git am -3
Analyzing 14 messages in the thread
Will use the latest revision: v3
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
 =E2=9C=93 [PATCH v3 1/3] Kbuild: move to -std=3Dgnu11
   =E2=9C=93 Signed: DKIM/kernel.org
   + Reviewed-by: Nathan Chancellor <nathan@kernel.org> (=E2=9C=93 DKIM/ker=
nel.org)
 ERROR: missing [2/3]!
 ERROR: missing [3/3]!
 ---
 NOTE: install patatt for end-to-end signature verification
---
Total patches: 1
---
WARNING: Thread incomplete!
Link: https://lore.kernel.org/r/20220301145233.3689119-1-arnd@kernel.org
Base: not specified
Wende an: Kbuild: move to -std=3Dgnu11

- Sedat -

> https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestati=
on
>
> >
> > I would like to give this a try on x86-64 with my latest kernel-config
> > (based on the latest kernel-config v5.17-rc5 from Debian/unstable).
> >
> > What Linux source base do I need?
> > Is Linux v5.17-rc6 good enough (patchset applicable) for testing?
>
> I suspect so.
> --
> Thanks,
> ~Nick Desaulniers

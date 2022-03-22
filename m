Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF4DEC8
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 17:02:36 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id b5so6213182ljf.13
        for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 10:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eIBwyCFA8yu0ZwbObg31b7AuYcniAsjV38ZCEKNbmEs=;
        b=eLZjTCnmz/MJskMW0Kx+WYB3YbOumPc4a5X5vE0tih1aCTVrAd15AW4a/LR/YaaAnj
         DmZKFF4T2mmVHwy1yi6h3xezVUEJxEB8h7TCOGIf/WXVynxd8dyZbf2xG51ZbuNE8uCY
         PsGMa75RvSN/Dk+hf2DCnaUb5U/LGy4iLRcjpauITH+wqbfRcvDR3Bcxi6ypKq7Ji16E
         V3mNIFubUOJq3hX5giXxQVCDJuJB9b1AAFbtVYjcP58tL6nG5NAtSg60NCFOPwMxpov4
         SEaRKk7aGFiKjpGi4E3+3futcITEJIpJ7XMhTwvw9hlabBqrZyO7c79WwRa7g1Af+Pkf
         rJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eIBwyCFA8yu0ZwbObg31b7AuYcniAsjV38ZCEKNbmEs=;
        b=Ui/hBhPWmVJ25NZpHX68kz41oN0WI7pQJKoMBN/7mmDmHQmw0Hyr8Rfgdt4xVyCVk3
         7ECxNjW9Y+SkaRVAa6SnxAOzqz34BEGJh86QWPrU1EfWpRvO4x37vllQMpiwi8f0SdrW
         E12sL+hcGm0jfv5QMrOWJP/4sRGOVlpoA1uhqKwjsE/pl21w8Urt77eAngp5oGJdJvqQ
         Lt3dUXsuGUA9zCOK+C/VtZHrjUtZYtqWKqyrxYi3TdNk+EzCpY8UZyQXw+NMMpy6WuhZ
         KbBSWXLk5nduo8GGyWHyq2mx5TptKgWXIG/1En60e4L3PE8hJuRG1AymDWIwvzXVvMqw
         dPgA==
X-Gm-Message-State: AOAM533gORKXunJs/u0i3/adOx4UDCQpm78y7dFmDEEj75pecfQSrfBG
	GYnZt9KqZoud1uR3fSUa3sVQb4QBaUzbXrDqez/YeQ==
X-Google-Smtp-Source: ABdhPJz56XKTAMhxLOEhU4dMPRaQZpKutqbXKi+guc67m6Jv0gTpaFk3QWQR3g81THfjHOADVBK+pIn/W0HiBnTV7xM=
X-Received: by 2002:a05:651c:1791:b0:243:94bd:d94c with SMTP id
 bn17-20020a05651c179100b0024394bdd94cmr19231645ljb.468.1647968554603; Tue, 22
 Mar 2022 10:02:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316183833.1563139-1-arnd@kernel.org> <3b9cedd6-a084-5d87-2fdd-0da10146827b@arm.com>
 <CAKwvOdnut8db1Z1FdZkkSXCvmggrzfKv9Y9GO3uz4ND=K5sB3g@mail.gmail.com>
In-Reply-To: <CAKwvOdnut8db1Z1FdZkkSXCvmggrzfKv9Y9GO3uz4ND=K5sB3g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 22 Mar 2022 10:02:23 -0700
Message-ID: <CAKwvOdkyGumBcCWwNo+yBFZ_A9OOFgVCOecOgpcfEunNRqy_+w@mail.gmail.com>
Subject: Re: [PATCH] arm64: fix clang warning about TRAMP_VALIAS
To: Robin Murphy <robin.murphy@arm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, James Morse <james.morse@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 12:52 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Mar 18, 2022 at 12:11 PM Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 2022-03-16 18:38, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > The newly introduced TRAMP_VALIAS definition causes a build warning
> > > with clang-14:
> > >
> > > arch/arm64/include/asm/vectors.h:66:31: error: arithmetic on a null pointer treated as a cast from integer to pointer is a GNU extension [-Werror,-Wnull-pointer-arithmetic]
> >
> > Tangentially, all the other GNU extensions we depend on throughout Linux
> > are also GNU extensions. Do we know what's special about this one?
>
> My first thought is that -Wnull-pointer-arithmetic should be in the
> -Wgnu flag group, such that -Wno-gnu (as set by Kbuild) implies
> -Wno-null-pointer-arithmetic.
>
> One issue seems to be that -Wnull-pointer-arithmetic seems to control
> at least 2 different checks in clang.
>
> https://godbolt.org/z/hdYYejj3d
>
> So it's likely these two checks should have 2 distinct flags, such
> that the warning we're observing can be grouped under -Wgnu.
>
> Filed: https://github.com/llvm/llvm-project/issues/54444

Fix should be landing shortly:
https://reviews.llvm.org/D122224

-- 
Thanks,
~Nick Desaulniers

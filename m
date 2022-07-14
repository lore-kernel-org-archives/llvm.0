Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281C6600D
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 18:52:05 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id c15so3256663ljr.0
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 11:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=49yEzsvmawtcLnUgC2yQBZE5eXJRfHTmZ4ZvW7x4v9c=;
        b=hrGmrdgdTvFHno5/QTxcHC3PCTGFb4gMP0U3KyLiK9V2rGqR/D85NhUJ3AZjXLs1px
         rhLgTtPhGrvFuxgJ/VgsBqaKSFfGKYm86IOtWYefA+6glY1VXTK/qhDap+UY22HHfkNJ
         vZ8IsiZVaNaPX6Bbq5+Onmw3sjeRLKhphF2ZSOZHpBFaOUOVbz/xHQumxKLL7L6/aIUF
         tuzj3oGVfUiAqbuY3tRsL/pn23F+Noxex/K0jaFxhwYCEKn+7ZWIqaUaJ3hbigFN3a/J
         rBaYTIDRpFkX4InPJ1RYICmFjai5MTVDl99l64L3k3G0E/nLBcbEzOH6EDOQ+IEVixmq
         E6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=49yEzsvmawtcLnUgC2yQBZE5eXJRfHTmZ4ZvW7x4v9c=;
        b=4ag/hnd+hALFWJJODBAkLtWzeurQsj8CaQcAwbKG4+SE7P3onP94qigapnNjvAa+Pz
         qN0c26b8E3xrsVwl8x8VeiL//LrXBhggCxMSf4iZPflF0S70DddfFcsau+B0Akg59ayL
         Zcef9iYZjjsAXqubtW0gb2rcNprhrbc0oX3qB4iJqnA00cdPu808CTag0k4nP2ONzcaU
         4o5C0i0zVqFmpF4eP4DQUaY9Z+TDaOeTMoomIpfP4u7el2hRshOAIv/z92dyXhpKdfnJ
         ZlhEzSGI1xxTrQIAQJ1I6An30UqaKo0wK6oMPZ78W0fcKzG2RsbET0koLr2KM3udPdfe
         DLKQ==
X-Gm-Message-State: AJIora/DugAD1SkL7Xa/nLfqxpLABACr1XPTfDT1EEL5MXaZ2k0vMvEz
	IA0F/zNE6NlpW1UVv0mhJLe8wXGDbQ8R2eBzPE5BSg==
X-Google-Smtp-Source: AGRyM1v5WFvUhT4uy7cRgZ3s0XpRydE/lwxo9oq/CznFK8qS3NKe4Z/vQPPAvwjdNxDpqCwbMDMfWzcGpf04XwFb+u0=
X-Received: by 2002:a2e:a5cb:0:b0:25d:7a70:2891 with SMTP id
 n11-20020a2ea5cb000000b0025d7a702891mr5388267ljp.295.1657824723053; Thu, 14
 Jul 2022 11:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714185514.7d1a2ac9@canb.auug.org.au> <Ys/42uMzQy+CFTGI@debian>
 <YtA+127QgRifnRBZ@dev-arch.thelio-3990X> <CADVatmOTNA8uVqDEx6kp=+_O=wEhV2jbS9-frct-c4ZqBxcspg@mail.gmail.com>
In-Reply-To: <CADVatmOTNA8uVqDEx6kp=+_O=wEhV2jbS9-frct-c4ZqBxcspg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Jul 2022 11:51:51 -0700
Message-ID: <CAKwvOdmS2SugAzRSmQzWAmRgz642KEgTtOw5O3TvZwFSHU-fPQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 14
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"

(Moving Stephen, linux-next, and lkml to bcc)

On Thu, Jul 14, 2022 at 9:22 AM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi Nathan,
>
> On Thu, Jul 14, 2022 at 5:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Sudip,
> >
> >
> > In the future, consider CC'ing our mailing list (llvm@lists.linux.dev)
> > for any clang related issues so that we can get them taken care of ASAP,
> > we have a MAINTAINERS entry for a reason :) thank you for testing with
> > clang; the more people that use it, hopefully the easier it will be to
> > get things unbroken.
>
> Sure. I run arm, arm64, powerpc and x86_64 allmodconfigs with clang
> (along with gcc) every night for mainline, started with linux-next
> from today. Trying to setup the mips build also, I will mail llvm list
> asking for help with the mips build.
> Currently I only monitor the clang output from x86_64 as thats the one
> which builds. If you want I can send the other reports also.

Hi Sudip!
Right on, nice to hear from you.  Consider filing bugs in our issue tracker
https://github.com/ClangBuiltLinux/linux/issues (consider taking a
peak to see which are already known issues and commenting on those
rather than filing new ones, time permitting), and joining our meeting
(next one in two weeks) see https://clangbuiltlinux.github.io/ for
calendar invite and meeting link.

> I have added Lukas if you both think
> it will be good to collaborate.

Ah, yeah, Lukas is an old friend. Hi Lukas!
-- 
Thanks,
~Nick Desaulniers

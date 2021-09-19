Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D2C3FC6
	for <llvm@lists.linux.dev>; Sun, 19 Sep 2021 22:45:08 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id y28so58377763lfb.0
        for <llvm@lists.linux.dev>; Sun, 19 Sep 2021 15:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hdZeP2xX0S2UdP1hcknPJBktnrJVqMJYYM7DRzCb5y4=;
        b=gm8yU0GuFzvPX4PVSuYIwfVUnYMeX5j4bo9iUSfow/cjvg1txrH9AK90QgRfPVDbsB
         30SMQL3352w12g4R6OllVZbd2DFL8eKLsAIug2/QIn2xBsM+ZuVrFvVNrenFP3qTeLfX
         SgQ2vOtq/DCw3RNS4/IJhwjh5T+Dt0cnfBPss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hdZeP2xX0S2UdP1hcknPJBktnrJVqMJYYM7DRzCb5y4=;
        b=q7jigzN4kPJhPbCiT6PCyW27s1Kfd0tUiUSGJlOhaUq3DQhNegHhoJZjzDgVY60K6U
         na75v8LCcEn2OTbWb1pzHsJ+an7TGwMWOuq402t60lJqRcB6D1xW+w+c7CX6tmsW8dlF
         kDlSoHXqdJBrQkElItvUZ64qD1y+4qq45nxnwNRxw3+SsosbvaksozDw5ceSvYgPU4/J
         iGaRC3ly8S2qpK2vvmFWag3HHNCqwG9G6muo0bmvb69Hggsxzn3RLv+lmOjad8g7lyng
         qsFMWUjVg/ZaNrXES/simzGMNyfGHqzdYVL1+6ujqMtlHwtv1HuXCIM/0zSUoVYS+Ib1
         a7Dw==
X-Gm-Message-State: AOAM533S8otUrJ8/CVxBbqELRc81KeIKKaIVfX/Zrxn8zFjLEg6MnUe2
	NYMWEvjtwm8zCn+QN6m0lIW0sgph2+P78dky
X-Google-Smtp-Source: ABdhPJyye08718tRhJhZXbjBkCtyi1utaZuZT/uWEpbwmpDszEAs4NH/UYKvGgzei0zcENfPfEdu9A==
X-Received: by 2002:a05:651c:3dd:: with SMTP id f29mr20002976ljp.69.1632091505924;
        Sun, 19 Sep 2021 15:45:05 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id h17sm692761lfg.258.2021.09.19.15.45.05
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Sep 2021 15:45:05 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id b20so568340lfv.3
        for <llvm@lists.linux.dev>; Sun, 19 Sep 2021 15:45:05 -0700 (PDT)
X-Received: by 2002:a2e:3309:: with SMTP id d9mr7791775ljc.249.1632091504930;
 Sun, 19 Sep 2021 15:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wjRrh98pZoQ+AzfWmsTZacWxTJKXZ9eKU2X_0+jM=O8nw@mail.gmail.com>
 <YUdti08rLzfDZy8S@ls3530> <CAHk-=wgKc5TY-LiAjog5VKNUQ84CSZyPu+FQekMHDar=kdSW=Q@mail.gmail.com>
 <YUeriU9EIJ5hiFjL@archlinux-ax161> <CAHk-=wgNfaf03Dw78q1qLLZs6G=iJjfo5ZTcnyXgSk3w1tp0yg@mail.gmail.com>
In-Reply-To: <CAHk-=wgNfaf03Dw78q1qLLZs6G=iJjfo5ZTcnyXgSk3w1tp0yg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 19 Sep 2021 15:44:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wirqeqb59bbFjCQ9L9BiVOQFqD=JbUEG+hU2bF4BDWqVg@mail.gmail.com>
Message-ID: <CAHk-=wirqeqb59bbFjCQ9L9BiVOQFqD=JbUEG+hU2bF4BDWqVg@mail.gmail.com>
Subject: Re: Odd pci_iounmap() declaration rules..
To: Nathan Chancellor <nathan@kernel.org>
Cc: Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>, 
	Ulrich Teichert <krypton@ulrich-teichert.org>, linux-arch <linux-arch@vger.kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 19, 2021 at 3:27 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>   --- a/include/asm-generic/io.h
>   +++ b/include/asm-generic/io.h
>   @@ -1047,7 +1047,7 @@ extern void ioport_unmap(void __iomem *p);
>   -#ifndef CONFIG_GENERIC_IOMAP
>   +#ifndef CONFIG_GENERIC_PCI_IOMAP
>
> let me go test, I do have an arm64 build environment for this all, but
> for that commit I had only done parisc, alpha and x86-64.

Hah. That conditional makes a lot more sense that way, but doing that
sensible thing exposes more oddities.

In particular, both arm and arm64 do

        select GENERIC_PCI_IOMAP

so they get the bog-standard pci_iomap() from lib/pci_iomap.c. All
good and sensible.

But is there a pci_iounmap() in lib/pci_iomap.c? No. The default
pci_iounmap() is in lib/iomap.c, which arm and arm64 do *not* use,
because they don't have GENERIC_IOMAP.

So those architectures depended on the header file copy, and with that
sane oneliner, the compile part of the build works fine, but then it
ends with

    undefined reference to `pci_iounmap'

because that didn't work out at all.

The fix seems to be to just move that odd code from the header file to
lib/pci_iomap.c, and that should make it all JustWork(tm).

That would at least make some of this make more sense. But this is all
a maze of random odd architecture things, so I'll have to look some
more at it.

            Linus

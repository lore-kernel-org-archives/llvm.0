Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C823FC2
	for <llvm@lists.linux.dev>; Mon, 20 Sep 2021 00:44:23 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id b15so41823184lfe.7
        for <llvm@lists.linux.dev>; Sun, 19 Sep 2021 17:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NZDLR9sdBnUFT4vrbA3jHn9fpeKh00IssMCqR/6wARc=;
        b=dShrzOELo+GoOEvGxj8VwqLJKX6iIREPkKDiKbgJHb9gqTnml7ifo87NOoJav4N9H/
         bF1ONsUNbBtaf9MGV+loX2EtITMx6oeh75OVLjAH1WPsQAHh7Qm7qVLl1FId4wQO0E2w
         psRW9Y+X7cI0APG3A9H5AcyA/5M63Di56eSpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NZDLR9sdBnUFT4vrbA3jHn9fpeKh00IssMCqR/6wARc=;
        b=T/C4Z43I+BZ5Ak11BgAjVA/344VqdKPQbTjgUueV7Bg10KsAtlcycCJ0d/lPvLmGbA
         QI6DTOww7FOHPsPfZbX+DBWPZLh0jkbdRYhoXV4mYG8Kx2w0tX1cP/ulAS2od65E6J8K
         GhRNxNCPpa/QlB8T3D6hwFUBT+UGEgKsLuSgl17XglBMafeGm0bUUIlcO71FWmot5Vbh
         sJeqIgo3WzoIJuPez08CgBumbWi4/umiXhbqitdIt3KUT79l54bSegc9vIh6auoKgaJc
         gyQ2s626csCn6f/J+baBYgWTG0mU9L8rQkIJCXpggrh6QnUOOznevE/vDA9pGCQ4Shlq
         f5mA==
X-Gm-Message-State: AOAM5305BqI1PZsvhEgIuwmZdd8Uk1PJw445kKInrs2F/S4HKAdfiLQD
	ciirQ/rJxGvu49bdRCfuXZFeQkNZgPwwYM17
X-Google-Smtp-Source: ABdhPJwVXVrHeYoQxGra5V4lwcgkdY0aEX8e3B/OZdtWLPUwDnJm4K8vAH2mCSfhoQ22dO7PmbENYg==
X-Received: by 2002:a2e:6e06:: with SMTP id j6mr20394852ljc.382.1632098661017;
        Sun, 19 Sep 2021 17:44:21 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id n20sm1125413lfu.91.2021.09.19.17.44.19
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Sep 2021 17:44:19 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id m3so57961621lfu.2
        for <llvm@lists.linux.dev>; Sun, 19 Sep 2021 17:44:19 -0700 (PDT)
X-Received: by 2002:a2e:a7d0:: with SMTP id x16mr20190666ljp.494.1632098659363;
 Sun, 19 Sep 2021 17:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wjRrh98pZoQ+AzfWmsTZacWxTJKXZ9eKU2X_0+jM=O8nw@mail.gmail.com>
 <YUdti08rLzfDZy8S@ls3530> <CAHk-=wgKc5TY-LiAjog5VKNUQ84CSZyPu+FQekMHDar=kdSW=Q@mail.gmail.com>
 <YUeriU9EIJ5hiFjL@archlinux-ax161> <CAHk-=wgNfaf03Dw78q1qLLZs6G=iJjfo5ZTcnyXgSk3w1tp0yg@mail.gmail.com>
 <CAHk-=wirqeqb59bbFjCQ9L9BiVOQFqD=JbUEG+hU2bF4BDWqVg@mail.gmail.com>
In-Reply-To: <CAHk-=wirqeqb59bbFjCQ9L9BiVOQFqD=JbUEG+hU2bF4BDWqVg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 19 Sep 2021 17:44:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgzc8EUcH=V7P0GoxVYw4bQ7URJvQVZ7_5pODQmrSkAnw@mail.gmail.com>
Message-ID: <CAHk-=wgzc8EUcH=V7P0GoxVYw4bQ7URJvQVZ7_5pODQmrSkAnw@mail.gmail.com>
Subject: Re: Odd pci_iounmap() declaration rules..
To: Nathan Chancellor <nathan@kernel.org>
Cc: Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>, 
	Ulrich Teichert <krypton@ulrich-teichert.org>, linux-arch <linux-arch@vger.kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 19, 2021 at 3:44 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The fix seems to be to just move that odd code from the header file to
> lib/pci_iomap.c, and that should make it all JustWork(tm).

I'm not 100% happy about the end result, and in particular I think
that the new generic pci_iounmap() function for the
ARCH_WANTS_GENERIC_PCI_IOUNMAP case should do the "iounmap(p)" thing
even if ARCH_HAS_GENERIC_IOPORT_MAP wasn't true, but I tried to keep
the old rules, even if they seemed broken.

arm and arm64 build for me, as did sparc64 and alpha. At least in the
configs I tested.

And the code _does_ make a bit more sense than it used to. It still
has crazy corners, but moving the pci_iounmap() code out of the header
file should make it easier to fix up in the future.

          Linus

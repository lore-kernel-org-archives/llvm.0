Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAEB72
	for <llvm@lists.linux.dev>; Mon, 20 Sep 2021 15:31:54 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id p22-20020a4a8156000000b002a8c9ea1858so2037579oog.11
        for <llvm@lists.linux.dev>; Mon, 20 Sep 2021 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CB4E7Uec90Q5gOJuJi7VZbKdpw+MEcmL5hq6X916kSQ=;
        b=aVQlPVwPJlTIAY6iEKClX7TDHAAT3Hp0xQz2TiDpFBOfaWKv7PSPI6gUjStNJUNvy7
         E2SCWa43A7V5y0QWWKlUONhFqAkqeRyieYoWJ2d0zHroyZ9/1XtAhTfU5DuIQOa3kUHJ
         pI/NT7ssWsYXFNWcIFv4YXrCBxpebiO6DRcCOC6teomcua3878IXYJVjW8MffDrOvAFw
         Rb/Ht/BmRSdHwLiHjixBRKWc/Xm1Hk311PVbNyExhBR8ws2K+lZGGUWpU8B+hD8gHE8h
         8bVR6DAlICB7Q2JPM+j3d7DfD+Wu5xX2oTFqVthY6R15xUoZJJXzcsawHc8FDsy9LmiU
         gCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=CB4E7Uec90Q5gOJuJi7VZbKdpw+MEcmL5hq6X916kSQ=;
        b=BZMQVhmRQDJJEIkwTwn8ct2c5Kf2EivDCA0KOgxkEhbOH+S5v3VJrTpwysr7kRCdlv
         KffnXodhnzuDhU3ElfZERouDg7JZaGgMbuY8SuOT7wA/olNl6uhWo8V1MzzPjSr6mQp/
         l+w5o6HXuWrmuLLtVRwHmdjIaS8K3go80DPf1V7U8Hn1j8YZCDYS1zhExu0LbKGMfdlx
         c6Y3cnGkW7nPnb1j5DDivy/I826CQxqWnnlbTzff1E98vyj2qNYi/eAQLwNgjE5nHH66
         FWK8SkgwSsb6sBlDXDBdH2jq7STaA37Xszzk4uu05ykL/b0FAZx38NwS7IqP3VAB4bRA
         ReYA==
X-Gm-Message-State: AOAM532zIt4FHPE5rHldLq5VmJiaYorqnVfUDfu7kLG5LYIrbrVH1MNu
	S1r43chj126zUxs5LLWDgfY=
X-Google-Smtp-Source: ABdhPJwb4iLiO89JepBAqEHZA7/uZCTf2HObn7/9c+IN7ak+Ni2RjwtT0em2lEe73Qgrxfnd9ab/Hw==
X-Received: by 2002:a4a:d5d2:: with SMTP id a18mr20075424oot.43.1632151913904;
        Mon, 20 Sep 2021 08:31:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i19sm3669270ooe.44.2021.09.20.08.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 08:31:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Sep 2021 08:31:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
	Ulrich Teichert <krypton@ulrich-teichert.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	llvm@lists.linux.dev
Subject: Re: Odd pci_iounmap() declaration rules..
Message-ID: <20210920153151.GA3739191@roeck-us.net>
References: <CAHk-=wjRrh98pZoQ+AzfWmsTZacWxTJKXZ9eKU2X_0+jM=O8nw@mail.gmail.com>
 <YUdti08rLzfDZy8S@ls3530>
 <CAHk-=wgKc5TY-LiAjog5VKNUQ84CSZyPu+FQekMHDar=kdSW=Q@mail.gmail.com>
 <YUeriU9EIJ5hiFjL@archlinux-ax161>
 <CAHk-=wgNfaf03Dw78q1qLLZs6G=iJjfo5ZTcnyXgSk3w1tp0yg@mail.gmail.com>
 <CAHk-=wirqeqb59bbFjCQ9L9BiVOQFqD=JbUEG+hU2bF4BDWqVg@mail.gmail.com>
 <CAHk-=wgzc8EUcH=V7P0GoxVYw4bQ7URJvQVZ7_5pODQmrSkAnw@mail.gmail.com>
 <YUia9zfbiertRRNR@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUia9zfbiertRRNR@archlinux-ax161>

On Mon, Sep 20, 2021 at 07:30:15AM -0700, Nathan Chancellor wrote:
> On Sun, Sep 19, 2021 at 05:44:03PM -0700, Linus Torvalds wrote:
> > On Sun, Sep 19, 2021 at 3:44 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > The fix seems to be to just move that odd code from the header file to
> > > lib/pci_iomap.c, and that should make it all JustWork(tm).
> > 
> > I'm not 100% happy about the end result, and in particular I think
> > that the new generic pci_iounmap() function for the
> > ARCH_WANTS_GENERIC_PCI_IOUNMAP case should do the "iounmap(p)" thing
> > even if ARCH_HAS_GENERIC_IOPORT_MAP wasn't true, but I tried to keep
> > the old rules, even if they seemed broken.
> > 
> > arm and arm64 build for me, as did sparc64 and alpha. At least in the
> > configs I tested.
> > 
> > And the code _does_ make a bit more sense than it used to. It still
> > has crazy corners, but moving the pci_iounmap() code out of the header
> > file should make it easier to fix up in the future.
> 
> Thanks, I can confirm that all of my build tests pass without any
> issues now.
> 
I still see build failures for sparc64:allnoconfig and sparc64:tinyconfig.

Guenter

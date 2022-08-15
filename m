Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A2C10EA
	for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 03:43:28 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id tl27so11590103ejc.1
        for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 20:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=8GGB/49mCW+ASejosbIfzxpTGaMVR2I7jGs9zaiNEuA=;
        b=NzuKLoOEIbmS2zWZ6FLQc9Z0EReusgl0yz0sb1p0uTvAtt0HMvEgCWcsUvAgYVt+Ll
         Gcskv3uZLFw6E+Jf86vRQIq8cjy9hVjAf51w7UEf69hytsRgwj8vCSSMvPGClnkKmEsy
         LyElPxKcSnmJSaZ1SbJF3Xrh6G+qeSTZgw2SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=8GGB/49mCW+ASejosbIfzxpTGaMVR2I7jGs9zaiNEuA=;
        b=4RgdbtSdOaGprVUkT5lwPZMFrNfizRJv6uyDVAUYJHuV8HDivwUGukZ5qxXXODRx8Q
         6maRcXzc0X+BSZBwD7nia8HDI4aOuDKAOJ2+qEoDRFzD1hP644ApkGjI4BuFht9KH6SR
         JmCs7NDaqZzb+hRuIy4Wz8/XSw4Why/N0ivAD4mXUH072/lDp4VnBoHuvSpILuiWmJvg
         ukHA9Iz6bGYHf6g+/uBzqMhZFDHUqVFU1yIkTjIp74WJ+NImsbD6NatMWW2GkJ/aIedV
         F+Z6u0otsidUWe6Hw4vIWYyYiIMSs35BQrVp6YMlCso6gQrPJ51cup5YseWpx9pVNQez
         ueGA==
X-Gm-Message-State: ACgBeo3NvbKlwhd7Ga0c2iHSr4Ct4WDzizJhtwtZsmQwLt8Se7j9WfND
	Y/GrfMQR5EC8zOHNHrmK8c6ttIcdqvlhDzly
X-Google-Smtp-Source: AA6agR4ij5/zfLwGkgax/0BX/Vd9K5a+lMqo8Ev8zpUVsFb+RPzFC0h7QnNq91k9wSTllqTjjZnvYg==
X-Received: by 2002:a17:906:6a10:b0:730:e9bd:1110 with SMTP id qw16-20020a1709066a1000b00730e9bd1110mr9166258ejc.88.1660535006999;
        Sun, 14 Aug 2022 20:43:26 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id f7-20020a056402068700b0043ce97fe4f7sm5890054edy.44.2022.08.14.20.43.25
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Aug 2022 20:43:25 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id s11-20020a1cf20b000000b003a52a0945e8so3372996wmc.1
        for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 20:43:25 -0700 (PDT)
X-Received: by 2002:a05:600c:657:b0:3a5:e4e6:ee24 with SMTP id
 p23-20020a05600c065700b003a5e4e6ee24mr3981246wmm.68.1660535005014; Sun, 14
 Aug 2022 20:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wh1xHi-WeytuAK1-iSsR0wi=6e4-WgFq6ZPt8Z1mvqoNA@mail.gmail.com>
 <20220814225415.n546anzvud6sumux@box.shutemov.name> <CAHk-=wiOqbuzy7xzsLrN8LXKGGUUMH109wcKOXx_PV9PkHa=Zw@mail.gmail.com>
In-Reply-To: <CAHk-=wiOqbuzy7xzsLrN8LXKGGUUMH109wcKOXx_PV9PkHa=Zw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 14 Aug 2022 20:43:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whSGBmH7zKvD-=qJLkWPSGZo1cM7GyLH=8cuide7+ri_Q@mail.gmail.com>
Message-ID: <CAHk-=whSGBmH7zKvD-=qJLkWPSGZo1cM7GyLH=8cuide7+ri_Q@mail.gmail.com>
Subject: Re: Simplify load_unaligned_zeropad() (was Re: [GIT PULL] Ceph
 updates for 5.20-rc1)
To: "Kirill A. Shutemov" <kirill@shutemov.name>, Mike Rapoport <rppt@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 14, 2022 at 3:59 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> If TDX has problems with it, then TDX needs to be fixed. And it's
> simple enough - just make sure you have a guard page between any
> kernel RAM mapping and whatever odd crazy page.

.. thinking about this more, I thought we had already done that in the
memory initialization code - ie make sure that we always leave a gap
between any page we mark and any IO memory after it.

But it's possible that I'm confused with the IO window allocation
code, which does the reverse (ie actively try to avoid starting
allocations close to the end-of-RAM because there is often
undocumented stolen memory there)

I'd much rather lose one page from the page allocator at the end of a
RAM region than lose the ability to do string word operations.

Of course, it's also entirely possible that even if my memory about us
already trying to do that is right (which it might not be), we might
also have lost that whole thing over time, since we've had a lot of
updates to the bootmem/memblock setup.

Bringing in Mike Rapoport in case he can point to the code (or lack there-of).

Mike?

               Linus

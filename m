Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB6C625
	for <llvm@lists.linux.dev>; Mon,  3 Jul 2023 03:20:43 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b7f223994fso31687145ad.3
        for <llvm@lists.linux.dev>; Sun, 02 Jul 2023 20:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688354443; x=1690946443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yBONHC/7jTbYyAxcCcqnQXJVugXf5DsUfZ9d7BfbZ4o=;
        b=Y7EAPvfp/8oRSUv6xld+uqKeQv1pjO9MFfvbUb3RCncHKhxPyPO02miWVd7revhBZ3
         lHxT6f6XGPKunL8sPKTh1Y2M2oaU4JOa2rtNy3/tk9deVmleI0yrY7c0wOOneMHF9EtV
         nrrRMldpULEc4xyyhbkSIndS07vXY09DYzby8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688354443; x=1690946443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBONHC/7jTbYyAxcCcqnQXJVugXf5DsUfZ9d7BfbZ4o=;
        b=b1VossdHe4FaOkbCyAr1h5fI/O6AqUqCSI4W1ruVXGlOWXFwlUQyzNTFzwZ2dnhoZL
         iVUnMKOIuhIPktuuWHMY8FhnwueleZZl12g5QWtkv8XuvIb2HPyJPb+sZ5KiiBChbJdU
         4VZlNQzqwoI0CB5HHHobQ/BBpD4MzpdvUs3L9TodrtiZJurin8KHuj96so5VjeinmQEF
         yaUWQlJN4f7zzf1+psB6gq9ybmDijKEZxHeeneltOtm1uU/TDx8B1GE+J+ahdDR0J86B
         u8DnCg8XOce5aNShGOK1he+ztKsP0i+CGYW8HKykvWpsa8V/hk62hhz9dlXodpBFsp45
         2qVg==
X-Gm-Message-State: ABy/qLasJHJFS0GLmsUrCjkP38c8/IvsxECDn0aKyhKJC5mxdr+Ao3bt
	NC+h/RzEVEUtsp9b2vdRrZ0p6Q==
X-Google-Smtp-Source: APBJJlF0LobRjNNE5KdmghKtTcThjdbQiS5tHFBiTjbNCBx8TAPBEq79Oo2P8VuNH4Y8wZm3ccmVYQ==
X-Received: by 2002:a17:903:2594:b0:1b8:6900:a368 with SMTP id jb20-20020a170903259400b001b86900a368mr9572619plb.66.1688354443087;
        Sun, 02 Jul 2023 20:20:43 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x1-20020a1709027c0100b001b05e96d859sm5307699pll.135.2023.07.02.20.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 20:20:42 -0700 (PDT)
Date: Sun, 2 Jul 2023 20:20:41 -0700
From: Kees Cook <keescook@chromium.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux LLVM <llvm@lists.linux.dev>, linux-kbuild@vger.kernel.org,
	Linux Regressions <regressions@list.linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [CRASH][BISECTED] 6.4.1 crash in boot
Message-ID: <202307022018.B26F5795@keescook>
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr>
 <ZKIoBVzrjZ+Ybxy9@debian.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKIoBVzrjZ+Ybxy9@debian.me>

On Mon, Jul 03, 2023 at 08:44:37AM +0700, Bagas Sanjaya wrote:
> On Sun, Jul 02, 2023 at 06:36:12PM +0200, Mirsad Goran Todorovac wrote:
> > Hi,
> > 
> > After new git pull the kernel in Torvalds tree with default debug config
> > failed to boot with error that occurs prior to mounting filesystems, so there
> > is no log safe for the screenshot(s) here:
> > 
> > [1] https://domac.alu.unizg.hr/~mtodorov/linux/crashes/2023-07-02/
> > 
> > Bisect shows the first bad commit is 2d47c6956ab3 (v6.4-rc2-1-g2d47c6956ab3):
> > 
> > # good: [98be618ad03010b1173fc3c35f6cbb4447ee2b07] Merge tag 'Smack-for-6.5' of https://github.com/cschaufler/smack-next
> > git bisect good 98be618ad03010b1173fc3c35f6cbb4447ee2b07
> > # bad: [f4a0659f823e5a828ea2f45b4849ea8e2dd2984c] drm/i2c: tda998x: Replace all non-returning strlcpy with strscpy
> > git bisect bad f4a0659f823e5a828ea2f45b4849ea8e2dd2984c
> > .
> > .
> > .
> > # bad: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
> > git bisect bad 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c
> > # first bad commit: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
> > 
> > The architecture is Ubuntu 22.04 with lshw and config give in the attachment.
> 
> Can you show early kernel log (something like dmesg)?
> 
> Anyway, I'm adding it to regzbot:
> 
> #regzbot ^introduced: 2d47c6956ab3c8
> #regzbot title: Linux kernel fails to boot due to UBSAN_BOUNDS tightening

I'm confused. Commit 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c isn't in the v6.4
tree... it's only in Linus's ToT.

Also, the config you included does not show CONFIG_UBSAN_BOUNDS_STRICT
as even being available, much less present. Something seems very wrong
with this report...

-Kees

-- 
Kees Cook

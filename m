Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E33C3FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 16:20:29 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id lb1-20020a17090b4a4100b001993f863df2so403382pjb.5
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=msy8N0GkHxRCMazso14Qqx2R9J2qwwNe7Lt82w0ANmc=;
        b=lley3eyu4spj7H4dEjr8NFNnBCNc+3EQCeu7XpvXwZNYBUuMF9r6zukjuh0erOk5+p
         31b4wC9bktr36kzNJ703H3MHTxvicyKhx1vHJGpb+YPjpCNUYvy8v72wP/EWSbH5M7P3
         s1yFU2eyFFbdLldtfoq44XSHCY4Mcc62Y2Jds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=msy8N0GkHxRCMazso14Qqx2R9J2qwwNe7Lt82w0ANmc=;
        b=rvnMQdNfubcgLRAB+kNH6oySaea6/cGdWbUuwDF2IAwZAxzLm8begK7KAwEdym7xrL
         dzTA9W2tST7vdw1jyv9x5O1xW2/wa3yqK2cuB3VYiccIqy/UEW3aBjbT7mOgJ4G1QfXl
         6NvIOEDCe3QjfabBIS3vvg5oIbwlJ9GAyHeJpMBt0TTYDmhbMa4sVcDnCMR/Km1AIf+4
         DpQ5qnxIzqzBuawGQfHjF6oAOfRIEh1p1Ay4Nt+RYRC+ysOPlIm4jQG6aCh7Cf57VV6v
         2GIZhI4Narqi+c4C3l+IoQKAz0SjUymXEJOY/jATmBlxcT9l7WSWh13Evoguoeebi+wx
         FfOw==
X-Gm-Message-State: AOAM5335IEAvpdBWJwGR7BHKXTOhj+hfKAwe/T4BYzLFVGLsq5nTgfHn
	uzPzs7kqTPLJQzDKNhM+umBTlg==
X-Google-Smtp-Source: ABdhPJwxOxyWISCASsXbrCfmHdtTek9uPx66pVPtOC93QcT9xh0VdJFDn4ZsY7AL4N51Vp4uFDni9Q==
X-Received: by 2002:a17:902:ab16:b0:13a:356c:6a03 with SMTP id ik22-20020a170902ab1600b0013a356c6a03mr11041877plb.38.1631550028483;
        Mon, 13 Sep 2021 09:20:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t14sm8492195pga.62.2021.09.13.09.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 09:20:27 -0700 (PDT)
Date: Mon, 13 Sep 2021 09:20:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] raise minimum GCC version to 5.1
Message-ID: <202109130918.D359A43@keescook>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210913094947.GB12225@amd>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913094947.GB12225@amd>

On Mon, Sep 13, 2021 at 11:49:48AM +0200, Pavel Machek wrote:
> Hi!
> 
> > commit fad7cd3310db ("nbd: add the check to prevent overflow in
> > __nbd_ioctl()")
> > 
> > raised an issue from the fallback helpers added in
> > 
> > commit f0907827a8a9 ("compiler.h: enable builtin overflow checkers and add fallback code")
> > 
> > Specifically, the helpers for checking whether the results of a
> > multiplication overflowed (__unsigned_mul_overflow,
> > __signed_add_overflow) use the division operator when
> > !COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW. This is problematic for 64b
> > operands on 32b hosts.
> 
> Please don't. gcc 4.9.2 is still in use here.
> 
> Plus, someone will want to prevent overflow in -stable, too, and you
> can't really raise gcc version there.

These changes won't go to prior stable kernels.

-- 
Kees Cook

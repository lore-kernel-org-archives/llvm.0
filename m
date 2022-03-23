Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F2E1B72
	for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 15:46:32 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id j13so1887857plj.8
        for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 08:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xOiL2IfLtHJ36vMwZliYDCRzc17oZt5tTjd6We2oUPs=;
        b=UIlACU9xyViEAEMb+LWZazjfQIQZ72L+YA+fuprsQuufl1YO3dJiXs476a2EBPOJ5D
         uz+/vTdIoDtABCazC2o0C61DxSoRE008KpwIMn/TKiyTdmk45/Ra0zCJea1whDpnFmzn
         6LcHNBGX/iRmNGrrn4J0IY2dZ4yu7DWgYQuEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xOiL2IfLtHJ36vMwZliYDCRzc17oZt5tTjd6We2oUPs=;
        b=NOp8iF9VNOEHT7op88YiJEVO2crPgvLPaHT6tGSWzROYVuHZlKjklaShSS7qmBUojf
         SXk4mq9tQFjqIRdvROPDCIyF71ENSiMfF5UMN82YTxr0An2rVtpsxAYO6+mbmRjn5n0l
         vUEuC8Z1fdFd2bN22t4d3cj5o0CjwPkba8dV+pxvgZLyDpfrUoIf/HGCohmjxgtV3XHq
         3jOujkigaenROaFiWVphowAI6FP7riMYyLeMQ8F3fqn4OK5n18VFczvkfuP4NHnp4690
         Q974yjcI81X5D6NHV//y+Yj2IizCDpfz1JkrkPMwM7P5Fy5j6Ud/q3e0yOjiySNdgVt2
         WlNA==
X-Gm-Message-State: AOAM532cqdJU9p0ddEe2/mJgYFd1xytul9yI0s452521tq5KnQRVWDLt
	V6BTnLtqU9i1NHVwnBeJC9AyWQ==
X-Google-Smtp-Source: ABdhPJz6Yvd8lbd/EYC+2ebO6g3u2YPP5AuLumW3lXbXAAvyq1KLB+vZcAM1bmRaOs9bbWRolPIKdA==
X-Received: by 2002:a17:902:e9d4:b0:153:bd06:859c with SMTP id 20-20020a170902e9d400b00153bd06859cmr702714plk.8.1648050392261;
        Wed, 23 Mar 2022 08:46:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v24-20020a634818000000b0036407db4728sm210630pga.26.2022.03.23.08.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 08:46:32 -0700 (PDT)
Date: Wed, 23 Mar 2022 08:46:31 -0700
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	KUnit Development <kunit-dev@googlegroups.com>,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH] lib: stackinit: Convert to KUnit
Message-ID: <202203230844.0B6C73765@keescook>
References: <20220224055145.1853657-1-keescook@chromium.org>
 <CAMuHMdX_g1tbiUL9PUQdqaegrEzCNN3GtbSvSBFYAL4TzvstFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX_g1tbiUL9PUQdqaegrEzCNN3GtbSvSBFYAL4TzvstFg@mail.gmail.com>

On Tue, Mar 22, 2022 at 03:30:22PM +0100, Geert Uytterhoeven wrote:
> Hi Kees,
> 
> On Thu, Feb 24, 2022 at 9:12 AM Kees Cook <keescook@chromium.org> wrote:
> > Convert to running under Kunit (and retain being able to run stand-alone
> > too). Building under Clang (or GCC 12) with CONFIG_INIT_STACK_ALL_ZERO=y,
> > this now passes as expected:
> >
> > $ ./tools/testing/kunit/kunit.py config --make_option LLVM=1
> > $ ./tools/testing/kunit/kunit.py run overflow --make_option LLVM=1 \
> >         --kconfig_add CONFIG_INIT_STACK_ALL_ZERO=y
> > ...
> 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Thanks for your patch, which is now commit 02788ebcf521fe78 ("lib:
> stackinit: Convert to KUnit") upstream.
> 
> Out of curiosity, I gave this a try on m68k, and it still seems to
> fail the same way of before[1]:
> [...]
> [1] https://lore.kernel.org/r/CAMuHMdW6N40+0gGQ+LSrN64Mo4A0-ELAm0pR3gWQ0mNanyBuUQ@mail.gmail.com

Ah yes! Thanks for the reminder. I will take a look at this. Clearly, it's
an issue with memory layout assumptions that don't match on m68k, etc.

-- 
Kees Cook

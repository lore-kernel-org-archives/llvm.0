Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1DD188
	for <llvm@lists.linux.dev>; Thu, 22 Jun 2023 03:11:19 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-54f71fa7e41so3703020a12.3
        for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 20:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687403478; x=1689995478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VAqfKy9L7gl2qfZmHwhpMjSx7czuoKau/UFIXqH952U=;
        b=Ux9IDPHbFSScf+uqQMasT6bNz9Ff2jg/GwkYrg0QL2Hg6USun6agaDett+qxyqxyat
         pMIF6usSBX6lKywrdZJZdb/n/R+LVUewkhGsf35GPCsRXGSvg7X/XlPbGvdUUHLNQPE3
         Bb8sMkFiWTcFd/SfMYOAGAkbmRMJBt97skYLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687403478; x=1689995478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAqfKy9L7gl2qfZmHwhpMjSx7czuoKau/UFIXqH952U=;
        b=Gd2vTR0Yr0hMshmqHUgLVFtHLInr/JSfFCEov3n3iaV7WCnZptbs/vB57bR+pmiY93
         GQyE1Z3JQ587OlnQFyGw4pJ6gRctwh3OUTWRHGJirFN+xMZtbk40nGyM6PpMq75dCALg
         PUxjehEiZgKoGiJBSjfKpy3mwCiJygrJusCK9AAQQNwdwWj6BSulHCFz2so2oMcIa0rl
         yEKaeUISTMKmuPb/KhadbvGLTi9xt/LCAm1X8FOw+vTToz+7mBGbz8jx5v1pbMFhKH3f
         iPFBnO7qEjTfWMa3QJsYRA1Sfp/4K9T47iAqOSUho1wdVXe/ynvV0FOKWo1IqdcMUNRd
         NHZA==
X-Gm-Message-State: AC+VfDza9pOomkcZcHMjJeroK8KvP8xLfilQGN8bfajyBEdnBzCwQGlp
	VqCApV0IHfcRiswN5vSnFnU+ZQ==
X-Google-Smtp-Source: ACHHUZ4vMlPLBOvhTnJarXHJcpoo4MCFhQd8JrGzTMgDccm3BRjpYcAhpJYvO9CJvJ4TSIFEuQmTgw==
X-Received: by 2002:a17:90a:974c:b0:25e:c420:6a71 with SMTP id i12-20020a17090a974c00b0025ec4206a71mr12453181pjw.32.1687403478670;
        Wed, 21 Jun 2023 20:11:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902d51100b001aaef9d0102sm4161321plg.197.2023.06.21.20.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 20:11:17 -0700 (PDT)
Date: Wed, 21 Jun 2023 20:11:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Marco Elver <elver@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] ubsan: Tighten UBSAN_BOUNDS on GCC
Message-ID: <202306212011.435B7C8ED@keescook>
References: <20230405022356.gonna.338-kees@kernel.org>
 <07dea91f-9b93-4227-9fec-728a9e7a0d55@roeck-us.net>
 <202306211051.1D4038323@keescook>
 <5fbe4977-c56d-2d97-bea3-28148807b5d9@roeck-us.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fbe4977-c56d-2d97-bea3-28148807b5d9@roeck-us.net>

On Wed, Jun 21, 2023 at 05:50:53PM -0700, Guenter Roeck wrote:
> On 6/21/23 10:52, Kees Cook wrote:
> > On Wed, Jun 21, 2023 at 09:42:01AM -0700, Guenter Roeck wrote:
> > > Hi,
> > > 
> > > On Tue, Apr 04, 2023 at 07:23:59PM -0700, Kees Cook wrote:
> > > > The use of -fsanitize=bounds on GCC will ignore some trailing arrays,
> > > > leaving a gap in coverage. Switch to using -fsanitize=bounds-strict to
> > > > match Clang's stricter behavior.
> > > > 
> > > > Cc: Marco Elver <elver@google.com>
> > > > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > > > Cc: Nathan Chancellor <nathan@kernel.org>
> > > > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > > > Cc: Nicolas Schier <nicolas@fjasle.eu>
> > > > Cc: Tom Rix <trix@redhat.com>
> > > > Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> > > > Cc: Miroslav Benes <mbenes@suse.cz>
> > > > Cc: linux-kbuild@vger.kernel.org
> > > > Cc: llvm@lists.linux.dev
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > > ---
> > > 
> > > This patch, presumably as side effect, enables CONFIG_ARCH_STM32
> > > for arm64:allmodconfig. As consequence, CONFIG_STM32_RPROC is enabled
> > > as well. This in turn results in the following build error.
> > > 
> > > Building arm64:allmodconfig ... failed
> > > --------------
> > > Error log:
> > > In file included from include/linux/printk.h:564,
> > >                   from include/asm-generic/bug.h:22,
> > >                   from arch/arm64/include/asm/bug.h:26,
> > >                   from include/linux/bug.h:5,
> > >                   from include/linux/fortify-string.h:5,
> > >                   from include/linux/string.h:254,
> > >                   from include/linux/dma-mapping.h:7,
> > >                   from drivers/remoteproc/stm32_rproc.c:9:
> > > drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_mem_alloc':
> > > drivers/remoteproc/stm32_rproc.c:122:22: error: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'size_t'
> > > 
> > > I did not try to understand what is going on, but reverting this
> > > patch fixes the problem.
> > 
> > Well that is really weird! I will investigate... this patch should be
> > pretty self-contained...
> > 
> Meh, it is. Sorry for the noise. My bisect script was wrong.

Oh, okay; whew! I was really scratching my head. :)

-- 
Kees Cook

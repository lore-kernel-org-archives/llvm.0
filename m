Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C8623CC
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 18:09:52 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id n15so16894476plh.2
        for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 11:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LnfhahHm3PDL9lPgihcYM1ixyCrpxkRE4I19AMm+GpI=;
        b=JVFkFjRzXHvl4p6lzecOm3qCuwJkQk5Aq/4Fikfk7weWrbtXCItQc1wAZya5H6IJDG
         QNI3GLzgvk3q2YYFCgId9Id3a/AMxyHSRXjdwlpHsKqaZesf5hk2QTOeNe8E421h+niV
         56QoMW3xTldNTC6XDzfuHu9lXtWAK74IHih4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LnfhahHm3PDL9lPgihcYM1ixyCrpxkRE4I19AMm+GpI=;
        b=MOoidDPqDJF1peg8oHtwvuK5bMXMUdyzbjg0F2jVjWjfG28Tz33Jw+vwWbJTqbIr6b
         rBGminVacItFtquAwcfFt4FWm+6fGPSqRWl7FMgCKx3LlTJ76TasUNlk6AiaLv2VLDav
         /dx4HZLXe4SzW1D6srnbEUMp4xY+5emlqSISAM7RiX2jEU9wAzstxR4FPl3uc3RkMoVi
         X76afDI4cwUl0KXbtJ2CzDoX0wN8SamTvUWHX1Wx/XcpMgEVplqH4GDEX7x5uzXyJKGW
         cvf0a870RktlO10JJc0tr4vb5M22/UP2c3YVncxLMcacC/KFDxtJ+mlJST7wlcl/+roJ
         cSUQ==
X-Gm-Message-State: AOAM531bHmY5OdX/chys945YTEq5kEeBwjGCcl9VdDUl8kWn/JHNEl7/
	S9ajIHswhcad+U8VPUtvmcfixw==
X-Google-Smtp-Source: ABdhPJxrv8JWlmC583Lem9EnnxkdYf2cpc2Vr67JCGAwKnCX6HsrocM0D0dZOBLboyTP/eYhDYcA9Q==
X-Received: by 2002:a17:90a:17ab:b0:1bf:9519:fe86 with SMTP id q40-20020a17090a17ab00b001bf9519fe86mr6027447pja.25.1647367792246;
        Tue, 15 Mar 2022 11:09:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 16-20020a17090a19d000b001c1c6b25cb2sm3736609pjj.26.2022.03.15.11.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 11:09:51 -0700 (PDT)
Date: Tue, 15 Mar 2022 11:09:51 -0700
From: Kees Cook <keescook@chromium.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Yanteng Si <siyanteng01@gmail.com>, linux-mips@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: Only use current_stack_pointer on GCC
Message-ID: <202203151109.F59911C4CB@keescook>
References: <20220309220939.392227-1-keescook@chromium.org>
 <20220314145215.GD13438@alpha.franken.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314145215.GD13438@alpha.franken.de>

On Mon, Mar 14, 2022 at 03:52:15PM +0100, Thomas Bogendoerfer wrote:
> On Wed, Mar 09, 2022 at 02:09:39PM -0800, Kees Cook wrote:
> > Unfortunately, Clang did not have support for "sp" as a global register
> > definition, and was crashing after the addition of current_stack_pointer.
> > This has been fixed in Clang 15, but earlier Clang versions need to
> > avoid this code, so add a versioned test and revert back to the
> > open-coded asm instances. Fixes Clang build error:
> > 
> > fatal error: error in backend: Invalid register name global variable
> > 
> > Fixes: 200ed341b864 ("mips: Implement "current_stack_pointer"")
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Link: https://lore.kernel.org/lkml/YikTQRql+il3HbrK@dev-arch.thelio-3990X
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Yanteng Si <siyanteng01@gmail.com>
> > Cc: linux-mips@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> > v1: https://lore.kernel.org/lkml/20220309204537.390428-1-keescook@chromium.org
> > v2: - adjust Clang version (Nathan)
> > ---
> >  arch/mips/Kconfig                   | 2 +-
> >  arch/mips/include/asm/thread_info.h | 2 ++
> >  arch/mips/kernel/irq.c              | 3 ++-
> >  arch/mips/lib/uncached.c            | 4 +++-
> >  4 files changed, 8 insertions(+), 3 deletions(-)
> 
> applied to mips-next with the Clang version in the decscription fixed.

Excellent; thanks very much!

-Kees

-- 
Kees Cook

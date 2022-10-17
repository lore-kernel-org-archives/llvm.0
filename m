Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C99B33FB
	for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 16:18:43 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id q19so16787759edd.10
        for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 09:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EvKXXBfjBxozfV6WFzYGdtAGU5x1cXP77F9OEOiHjRA=;
        b=hF2zG+QODFU7vhHtcL27fRDayxvbsN8P6jQWLQnMg+jXt4yc3MymyuXu/gGux8kTI1
         0Zrhj4OCrvC5HA1Gaq4zgv3DgVeyC/S34yGYcYwTmo8ouI/Ail+VUQRwFI2mV2DZoZUv
         H31iS/2OgtsBzHK76ThDDMx8h/4R68ZyRWspWPIM2swVIa6g0ufgzXGJQW8v7T/y1bZj
         a6xjYRGYmtQndob/ZtBcIQHfjrZNScOcPt3bhi+HYh/OCqvt384HKOr1X8WSaCt5qwxv
         2W7+mnYglhCAcBlzDfqgTybNZa61lWisHM7zcf+PDYKhaa0Ga8bQAkwlgbcgMb8Wm8K+
         wc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvKXXBfjBxozfV6WFzYGdtAGU5x1cXP77F9OEOiHjRA=;
        b=Uz3snfhu5xckj8zaFnejZNscMJGFbkILW9wta+rIp38YBsx5ABAJl03rtddWemuBiE
         z9JEY/0TP3b+88jYes9n6Ug/QqP64Exl+y5EAfLBpqOuACFfTpTMTDt0aPyi8wuLf7s9
         GepWWH/QDXXcqoEn77cieSbVfKvBAFqx/nv3/qD513MW1RpJDq2obOHnk+/zm7Nx5+hW
         PunG8MAaBjliVP47BWeoMv5t1t3Qa1bZqmZd1gDahveZsfIJ/hWdsgEN5dK/de9vJ/dZ
         +B5dO9Z254C/WxGahPt9nJJvD6mQBQV01rP4MGRfeNab/EGk6dgxDW/p1eRd5IYwfQ8U
         iCyg==
X-Gm-Message-State: ACrzQf3HzZxyUEmLW/4gI1/E0oWWmrZOO5yH4kbD1KkdVfJVDhqS2MIJ
	MuaUebknWaqkxaqVQvHDjuHmlQ==
X-Google-Smtp-Source: AMsMyM6ARby/6+Um7l8K2gj3ebnctRHo0Xc/NKdIW4tMZZYU4QtVwZMcJLLaa41J8jCUicQYTvhBHg==
X-Received: by 2002:a05:6402:42d0:b0:457:d16e:283d with SMTP id i16-20020a05640242d000b00457d16e283dmr11053428edc.395.1666023521673;
        Mon, 17 Oct 2022 09:18:41 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id et11-20020a056402378b00b0045c47b2a800sm7483488edb.67.2022.10.17.09.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 09:18:41 -0700 (PDT)
Date: Mon, 17 Oct 2022 18:18:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] (attempt to) Fix RISC-V toolchain extension support
 detection
Message-ID: <20221017161840.7o5tpsjox7klyvvs@kamzik>
References: <20221006173520.1785507-1-conor@kernel.org>
 <20221017155103.4dt5uzmnlbtibqcn@kamzik>
 <Y0185O1zjyfv7WjN@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0185O1zjyfv7WjN@spud>

On Mon, Oct 17, 2022 at 05:03:48PM +0100, Conor Dooley wrote:
> On Mon, Oct 17, 2022 at 05:51:03PM +0200, Andrew Jones wrote:
> > On Thu, Oct 06, 2022 at 06:35:19PM +0100, Conor Dooley wrote:
> > 
> > However, we could also drop the compiler and linker checking if we
> > converted our use of cbo.* to the insn-def.h framework (I think Heiko once
> > mentioned looking at doing that, but I'm not sure.) I'm looking at adding
> > Zicboz support right now and for starters I've duplicated and modified
> > these checks. But, I think I'll look into defining the instruction type
> > needed for cbo.* and using insn-def instead.
> 
> What is the ETA of your zicboz support? Do you think these patches
> should be applied to v6.1 & backported before being replaced by insn-def
> when your zicboz support arrives? Or just wait for your zicboz series?

I hope to have something posted by the end of this week, so if all things
go well, it could land in 6.1. I think it's reasonable to merge your
patches anyway, though, as they fix the current code and we don't know
what rabbit holes I may fall in with my series yet.

Thanks,
drew

> 
> Trying to decide what status I should set for this in patchwork.
> 
> Thanks,
> Conor.
> 

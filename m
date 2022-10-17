Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F96F28F7
	for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 15:51:06 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id b12so16688162edd.6
        for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBmPZBk5dJIk9+JXoplzt5ARwx47oHaU28k3ADgsDIk=;
        b=Fq+h0CI3Y+K6BCz/QF2YliAkuE/anP1CfaiPSoQbygz4mBqBWNGWcprD+LBSliNVXa
         Alxeb4nR1Ps8ggwnnf20JrLvp5M5qEkI0bdaCJ00S6T0f4kZkVdsWwykVg6LK1hxjw2t
         FNUdYt2vTR+5hn7I2AJNyOn7B+U2bPlP8mPRrUUDSB702+Nb/JLJ6ERQXKi2O24CzPIC
         8xxjjUN3um+O+1kj7lkeOWg8aq6rNctWi9Mebm5eipZ0hlXOVVX9/g14luRb4jfCIGmj
         5OWt1pccYPSCQxTf+XGptDLfk15P2DfhkKQYtmmdfu5ij8CrnPYGaoj0mVXcT4p+QAFt
         mDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBmPZBk5dJIk9+JXoplzt5ARwx47oHaU28k3ADgsDIk=;
        b=CZLUzOZtn0q89h6WZYlDwNXdTrGtP1RSuuKN29j1qYvq+1DysFF1RRqVxHXwJs93j4
         kcFfZQ5tpPQosg6PLREFN0dM6oTwrIs3p6n5m6f2+jSxGFtOQGpCwqGogG0Qc82TA7B4
         f19axZKCMByXI+MmCEuOwNb1vDPR9269qRqIVspopfBZqv3iwGGbT6OoFvauBtdZh2u4
         w608llSW4oTFNQdBPfviDlWKL4cUQrck3Bx+Pzfx7w2f2xL+3jDIAjjxD2YArPbFTlao
         LC4TyGG4wpyLKv5+p3mkNpt6M6U4j8PRxw0Mg5NEWUT6xuuk9UpnkfHd3o6mJpGp74tK
         qrbQ==
X-Gm-Message-State: ACrzQf293VlqMTdBntWkhO12Q5Xz9DcUc23AxSxIupB0ePAZbgkRN0yg
	Os0qfPvfqQvQ/MdGEl0d+kX20w==
X-Google-Smtp-Source: AMsMyM6hlf2tGA0s/Jrbgp21kZrQbJQsjTf9l7shXpqgUTI31fdS5nFiXIRGJyVgsf9z3sB7ZVVkFg==
X-Received: by 2002:a05:6402:557:b0:458:7488:8958 with SMTP id i23-20020a056402055700b0045874888958mr10722940edx.242.1666021865316;
        Mon, 17 Oct 2022 08:51:05 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906219100b0078dce9984afsm6296346eju.220.2022.10.17.08.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 08:51:04 -0700 (PDT)
Date: Mon, 17 Oct 2022 17:51:03 +0200
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
Message-ID: <20221017155103.4dt5uzmnlbtibqcn@kamzik>
References: <20221006173520.1785507-1-conor@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006173520.1785507-1-conor@kernel.org>

On Thu, Oct 06, 2022 at 06:35:19PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey,
> This came up due to a report from Kevin @ kernel-ci, who had been
> running a mixed configuration of GNU binutils and clang. Their compiler
> was relatively recent & supports Zicbom but binutils @ 2.35.2 did not.
> 
> Our current checks for extension support only cover the compiler, but it
> appears to me that we need to check both the compiler & linker support
> in case of "pot-luck" configurations that mix different versions of
> LD,AS,CC etc.
> 
> Linker support does not seem possible to actually check, since the ISA
> string is emitted into the object files - so I put in version checks for
> that. The checks have gotten a bit ugly since 32 & 64 bit support need
> to be checked independently but ahh well.
> 
> As I was going, I fell into the trap of there being duplicated checks
> for CC support in both the Makefile and Kconfig, so as part of renaming
> the Kconfig symbol to TOOLCHAIN_HAS_FOO, I dropped the extra checks in
> the Makefile. This has the added advantage of the TOOLCHAIN_HAS_FOO
> symbol for Zihintpause appearing in .config.
> 
> I pushed out a version of this that specificly checked for assember
> support for LKP to test & it looked /okay/ - but I did some more testing
> today and realised that this is redudant & have since dropped the as
> check.
> 
> I tested locally with a fair few different combinations, to try and
> cover each of AS, LD, CC missing support for the extension.
> 
> The one that I am left wondering about is Zicsr/Zifencei. Our Makefile
> has:
> 
> > # Newer binutils versions default to ISA spec version 20191213 which moves some
> > # instructions from the I extension to the Zicsr and Zifencei extensions.
> > toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
> > riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
> 
> I'd like to also move that one to Kconfig rather than the Makefile so
> that, again, it shows up in .config etc. But as Zicsr/Zifencei do not
> appear to be emitted into the object files it's not a fix and can be a
> follow-on patch if my approach here is not entirely off-the-wall.
> 
> I am not 100% on the LD/LLD versions that I picked, I went off of a
> `git branch -a --contains` of the first commits I found that with
> mention of the extension. Please scream if I got it wrong, I'm not
> overly familar with where to find this sort of info for the toolchains.
> 
> Thanks,
> Conor.
> 
> Conor Dooley (2):
>   riscv: fix detection of toolchain Zicbom support
>   riscv: fix detection of toolchain Zihintpause support
> 
>  arch/riscv/Kconfig                      | 17 +++++++++++++----
>  arch/riscv/Makefile                     |  6 ++----
>  arch/riscv/include/asm/vdso/processor.h |  2 +-
>  3 files changed, 16 insertions(+), 9 deletions(-)
> 
> -- 
> 2.37.3
>

This looks good to me, so

For the series

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

However, we could also drop the compiler and linker checking if we
converted our use of cbo.* to the insn-def.h framework (I think Heiko once
mentioned looking at doing that, but I'm not sure.) I'm looking at adding
Zicboz support right now and for starters I've duplicated and modified
these checks. But, I think I'll look into defining the instruction type
needed for cbo.* and using insn-def instead.

Thanks,
drew

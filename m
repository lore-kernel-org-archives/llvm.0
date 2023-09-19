Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDB7341A2
	for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 21:18:42 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-690d8c05784so257808b3a.2
        for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 14:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695158322; x=1695763122; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUuiZDmU5EMTeO4CdiXdV5Ryvju9HaBb50QeYalbm10=;
        b=WqmmIHwNOrYmNcZ0oH++zql60svyfFugZGoITbrtXlyY1cZw5D62TDllk/H/NHYiBn
         NgeFhmvDE1YsSHlALuBKnj9Jrnnvn+pfWC7AZXIDoblOjGpcuDyX0u86zapaZHQ48wbb
         HmWwcWuScWD3bRMzH7s2LQHYqa5Mkc8ktYZuKJmKAkQpDDhyR0Nb5fkM3UrRETjlATQ8
         3M90SQmfQKk9DOo+8/yReqejjfKVk5Ibn8DHRtf6eLbruLGFfVl0g6H5QfGsGCeErNg+
         WY/m6kKmc62Ej29d/KHLRqyH76/O9TcA505nNxIv6Fw7sPishvXkNY0jaorDbLqRasFt
         IUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695158322; x=1695763122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUuiZDmU5EMTeO4CdiXdV5Ryvju9HaBb50QeYalbm10=;
        b=AcVphNVFRnnrbFT+Ld4NjKBN4NTq3y6j1ZOd8RpAhkYAu9JunmRLIkUcAzmiRDddg5
         9ivR+iOHO0ySjAwIv8iUAMYs7dMjAhuVTw7JnXKX/1zhxIUPU+2CZ7ZA3H0wGWeN72pP
         116yz8q2CY6JdkxAwfaJ5E7TvWtJJtCnV9JTc+ZfE2zhzbdZUlv8JCksmB6ixFEZZbZN
         Iy7PHC+fiiABj26bS+hniaeKHtHER59VFX4g6t1CUwXvFDJLaX4JEIufX+ZXqOJMclfR
         AWeZF6NC1EDoye04xnvPEgo7GzAawJKwL3ZOHkczEFUOSbniU9RHpnoakOBdO4B31FgX
         ZWBw==
X-Gm-Message-State: AOJu0YzH6LJCx7kOLCRIpdgtAQCKpawYmvEJAiQQKFz6C2LoemYFC2Vv
	0A8r5z3yg1wawvQwZ0ZpWFZGJQ==
X-Google-Smtp-Source: AGHT+IH6dUDZ77/DJvfNaKnqCuhMLQbO7XX7jFgJOsx/GKqMs+XRvae/XJkRkp1vo0dCwYMw5veKww==
X-Received: by 2002:a05:6a00:4783:b0:690:cd33:a582 with SMTP id dh3-20020a056a00478300b00690cd33a582mr641768pfb.7.1695158321630;
        Tue, 19 Sep 2023 14:18:41 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:118e:eaf2:1433:f9fe])
        by smtp.gmail.com with ESMTPSA id v3-20020a62a503000000b00682bec0b680sm9002891pfm.89.2023.09.19.14.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 14:18:40 -0700 (PDT)
Date: Tue, 19 Sep 2023 14:18:36 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-um <linux-um@lists.infradead.org>,
	Mike Rapoport <rppt@kernel.org>, llvm@lists.linux.dev
Subject: Re: linux-next: Tree for Sep 19 (UML)
Message-ID: <ZQoQLJnGFxjA8p5E@google.com>
References: <20230919163728.78432283@canb.auug.org.au>
 <04b8a6de-2b20-4488-b20f-c8a8f6001fd2@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04b8a6de-2b20-4488-b20f-c8a8f6001fd2@infradead.org>

On Tue, Sep 19, 2023 at 08:42:07AM -0700, Randy Dunlap wrote:
> 
> 
> On 9/18/23 23:37, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20230918:
> > 
> > New tree: kvm-ppc
> > 
> > The mm tree gained a boot warning for which I reverted 5 commits.
> > 
> > Non-merge commits (relative to Linus' tree): 5750
> >  3717 files changed, 446028 insertions(+), 107378 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> > 
> 
> on i386 or x86_64:
> 
> ../arch/x86/um/../kernel/module.c: In function 'execmem_arch_params':
> ../arch/x86/um/../kernel/module.c:54:50: error: implicit declaration of function 'kaslr_enabled'; did you mean 'kasan_enabled'? [-Werror=implicit-function-declaration]
>    54 |         if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_enabled())
>       |                                                  ^~~~~~~~~~~~~
>       |                                                  kasan_enabled
> 
> 
> 
> git blames this on:
> 
> commit 12633d679796
> Author: Stephen Rothwell <sfr@canb.auug.org.au>
> Date:   Tue Sep 19 15:14:03 2023 +1000
> 
>     Revert "arch: make execmem setup available regardless of CONFIG_MODULES"
>     
>     This reverts commit 3300c3af20090ff5e03e5c4bf2ef2cfaa03d4e9b.

Thanks for the report, FWIW, our CI is hitting this, too.

Was 12633d679796 a pure revert, or was it manually modified?

Oh 3300c3 was patch 10/13; maybe a clean revert is not possible without
other reverts in addition?
https://lore.kernel.org/lkml/20230918072955.2507221-11-rppt@kernel.org/

Seems like there's more info in this thread:
https://lore.kernel.org/lkml/20230919152031.GF3303@kernel.org/

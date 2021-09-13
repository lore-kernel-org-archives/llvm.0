Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4EF3FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 16:23:47 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id v19so4043572pjh.2
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2/RkgLMSeLMdfX+PInPfTpRLPSRgorj3I7Mh0Kf9swA=;
        b=JmPq/ZgLDL/FyAXQlzN3Pxt/6RHQBe1O37S+nQ61rkmBypwaNCBZrelrqFzD38G68y
         ayLL6KmmBeXGuHjWhRWlBTWLjOa1UNjPI0bNb+dmgGb0u2BkXyd5S68cDztZayVOnRQr
         NZSmhj83kn4QL3EQNMIVRoRdS0yiL5duqY1Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2/RkgLMSeLMdfX+PInPfTpRLPSRgorj3I7Mh0Kf9swA=;
        b=pLnN1sF1KBSsNiHJ+mDFpTYTcyH7JisX3wpJhYfzNSTL9FpDnLo7HzPPP3P4F39Cbu
         La8XQTqf7M+WtgLfB8ZYIE6flhqf5wzI2hr/g1FysYeMl2YnmL+dsjcxuQ31hUjb4hQ+
         9/TzTK2x5Xc3V1ohRSEwFEYIe+oJu4T1A4kSBV4k9St9F6J+FPyKbs5Ns2j/2cjGiEVd
         sPBVD8QvJF/TUVSXQyTjUfB1pfFscNjexsJFYj8IAZ20QLb9nGO1TkdY84TkyJAL7K7P
         Ff2u1UFyz/6mWLEGaqRb8DvDFi8+DQUPjRHjdH3KABvoQzL496I3Cz6TH0yGs5fUNsL5
         sVJw==
X-Gm-Message-State: AOAM5315c59D8jsKjTaB/sjgtzXYS30jAbQWENrHh2CuOV2bPuLv4aH5
	7JOyewySdRFNL7/bD4TRYAGU5g==
X-Google-Smtp-Source: ABdhPJw2iVAwBpkklvDVrdBl1O3eT09j5TQwikncidkQDt4RPNA+MefgACjymKzY8c/7zuWh9A9MQA==
X-Received: by 2002:a17:90b:f08:: with SMTP id br8mr301973pjb.119.1631550227353;
        Mon, 13 Sep 2021 09:23:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d3sm7597340pjc.49.2021.09.13.09.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 09:23:46 -0700 (PDT)
Date: Mon, 13 Sep 2021 09:23:45 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 05/10] riscv: remove Kconfig check for GCC version for
 ARCH_RV64I
Message-ID: <202109130923.E294BFD5C@keescook>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-6-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-6-ndesaulniers@google.com>

On Fri, Sep 10, 2021 at 04:40:42PM -0700, Nick Desaulniers wrote:
> The minimum supported version of GCC is now 5.1. The check wasn't
> correct as written anyways since GCC_VERSION is 0 when CC=clang.
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Yeah, good catch for Clang too.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

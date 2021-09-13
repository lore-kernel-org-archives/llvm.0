Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01343FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 16:23:04 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id 5so6176243plo.5
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 09:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IC7oL0JUrM22EcE083uTd4WakOlCzqk1n4A+MT+gbuo=;
        b=Dv28Qr4sJFjDOYLDU48B2m3YRxMAK1cTI/0ryWkdMK0ku6pEe9KH3Dg/aF6mc/tip8
         mH+HjdU/39tuqvVEEjMG3Q4wOmJcesWCIjud5DvYaLj8ZEs9WFYjoQH3hvTtSIbpgiZR
         5vx8g1BU83l8wLRn3fFDPlKjPnPJVFM4PiaYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IC7oL0JUrM22EcE083uTd4WakOlCzqk1n4A+MT+gbuo=;
        b=ifPNhw/3KOjjMhXFuMXkut+KwsrSzGhDhf3MQz5mEHe0fulBdJ2IGCuVkIqb8IpMCK
         ogcoWvD+LFAsZXepuKCBVjqhC2mBG93mmrrJaBha/e/3hDieckGBSM2kaN88itd7/8Dv
         hd3/lKu5+UUN0cytgRKbic6q4WNruUM03jTulSWhOL9r3JYsodUrtlnDM3cjvbx/S8dP
         h0bY0sSEerPseZpMafOrQWJfouSQDeMlaq+FtvN+W8t0UNvpTMiy9tbvsXoU34Mp8tht
         pAL7A6DedVuSGS5CnRdHJ3/0Hhzqm2Bb09XnXl9ph0KkYTNn34qfCllVd9epOPKYPg7E
         N7Sw==
X-Gm-Message-State: AOAM531pEa18qiPIpUuipCP7bcPSc9Sr81cA/YGV4abvolqKRnQnurQj
	jOPARSFtpzodEkH0pVANqTB0og==
X-Google-Smtp-Source: ABdhPJxAhMJ+xb2U0bX9o4J3JRfI19rLe3U8+GpBilj7bgw0EAxYDgRGJFBv3Oy/j8amGsIoxN7Ubw==
X-Received: by 2002:a17:903:22ce:b0:13b:9a00:f090 with SMTP id y14-20020a17090322ce00b0013b9a00f090mr3806029plg.11.1631550184622;
        Mon, 13 Sep 2021 09:23:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 131sm7830033pfw.72.2021.09.13.09.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 09:23:04 -0700 (PDT)
Date: Mon, 13 Sep 2021 09:23:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] Kconfig.debug: drop GCC 5+ version check for DWARF5
Message-ID: <202109130923.8BB83C791@keescook>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-5-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-5-ndesaulniers@google.com>

On Fri, Sep 10, 2021 at 04:40:41PM -0700, Nick Desaulniers wrote:
> Now that the minimum supported version of GCC is 5.1, we no longer need
> this Kconfig version check for CONFIG_DEBUG_INFO_DWARF5.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

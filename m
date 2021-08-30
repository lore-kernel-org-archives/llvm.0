Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BDA3FC3
	for <llvm@lists.linux.dev>; Mon, 30 Aug 2021 20:16:43 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id t1so14550788pgv.3
        for <llvm@lists.linux.dev>; Mon, 30 Aug 2021 13:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4Gjmh2khQtTIto6ydtTcLMQuTQMVcLm+SAujgODL3VA=;
        b=UaZfjuIcymN1ROobWl/Af4JyhzjOTdxqDjeIoICTu9HvZvDDpP3iKwj1jJM8+5i4D4
         7AG+wW1u6sruUD0zVcbMr9SHPUqfNCcS/YRiSO9irljKBdLgfyhrRTLU/QNPFA44gp7j
         Xzyyw8BkHLJjSxN5nLG3KlasYTbMU/DV/8aKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4Gjmh2khQtTIto6ydtTcLMQuTQMVcLm+SAujgODL3VA=;
        b=S2MH7VAV2IGSaCvdAJ9kCcyATLyfVgfm9qTd21mmrju33yvIi2TrZTvAKJvCzpCvtu
         c4Vnjp2/oYY5wlxi2QUbTjOIW5TZxQpfaZJAvfz7ByAiD/S4FLZpG0i0gOHqOC+UDcKx
         ElZ4IcrbUCyDgnx7rmIhBAoA6exFuWsMXQYo+H2jnXUK6QVEJozS0b5b2kXmqBn6JLFT
         1EHeR9qLgd8N3jPxwpDLkzYrkz9bfNqwBgQy+kcC+EfiBKOscyvi7OySKGueOpY69SX3
         yDIo3bon9/gKj9z5Y1z05Fsg3mgUXlyj7IqcKx9dN/kz3eBJt75P+3090Z0IChfRjsFi
         vRoQ==
X-Gm-Message-State: AOAM5313l3RogjmcIxURKFpp87BCffLz6u68WgXk+QTm0IGZxceW5fZ+
	7r/M55zVWTFJyASoKxRdVBfpNA==
X-Google-Smtp-Source: ABdhPJyfyfv0j5SsIb7SF7ruWGzc0JgMsZg+XrtwWeRgwZ1dqSmBiT4CuujRduBedSkB7IpGBLg0uw==
X-Received: by 2002:a62:dd83:0:b029:2e8:e511:c32f with SMTP id w125-20020a62dd830000b02902e8e511c32fmr24825041pff.49.1630354602955;
        Mon, 30 Aug 2021 13:16:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c123sm15588127pfc.50.2021.08.30.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 13:16:42 -0700 (PDT)
Date: Mon, 30 Aug 2021 13:16:41 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Keith Packard <keithp@keithp.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 0/5] Enable -Warray-bounds and -Wzero-length-bounds
Message-ID: <202108301314.22B3CB015C@keescook>
References: <20210827163015.3141722-1-keescook@chromium.org>
 <YS0nJtNDCwfbaubZ@Ryzen-9-3900X.localdomain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS0nJtNDCwfbaubZ@Ryzen-9-3900X.localdomain>

On Mon, Aug 30, 2021 at 11:44:54AM -0700, Nathan Chancellor wrote:
> arch/powerpc/kernel/signal_32.c:780:2: error: array index 3 is past the end of the array (which contains 1 element) [-Werror,-Warray-bounds]
>         unsafe_put_sigset_t(&frame->uc.uc_sigmask, oldset, failed);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Or is this a Clang DCE failure?

#define unsafe_put_compat_sigset(compat, set, label) do {               \
        compat_sigset_t __user *__c = compat;                           \
        const sigset_t *__s = set;                                      \
                                                                        \
        switch (_NSIG_WORDS) {                                          \
        case 4:                                                         \
                unsafe_put_user(__s->sig[3] >> 32, &__c->sig[7], label);        \
                unsafe_put_user(__s->sig[3], &__c->sig[6], label);      \
                fallthrough;                                            \
        case 3:                                                         \
                unsafe_put_user(__s->sig[2] >> 32, &__c->sig[5], label);        \
                unsafe_put_user(__s->sig[2], &__c->sig[4], label);      \
                fallthrough;                                            \
        case 2:                                                         \
                unsafe_put_user(__s->sig[1] >> 32, &__c->sig[3], label);        \
                unsafe_put_user(__s->sig[1], &__c->sig[2], label);      \
                fallthrough;                                            \
        case 1:                                                         \
                unsafe_put_user(__s->sig[0] >> 32, &__c->sig[1], label);        \
                unsafe_put_user(__s->sig[0], &__c->sig[0], label);      \
        }                                                               \
} while (0)

if "set" has only 1 element, then _NSIG_WORDS must be 1. The warnings
are coming from cases 4 and 3. (But why not 2, which would also access
beyond the end?)

-- 
Kees Cook

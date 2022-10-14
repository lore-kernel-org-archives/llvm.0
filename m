Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B63440C
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 20:17:00 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 129so5256325pgc.5
        for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 13:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d9uRIcoHHJz9/gFQgE1VQpj6K6kcy16s5GCXSPDSWz4=;
        b=HNA6dMTAcvloY9M5J90Db+W0xpQ45C2srAwJ1pL0+gxkF1JbTwXp/LqhGKlbAlzdTY
         60H49gCz+iDQL2gbl+RNuwngV0a+jL6REBC6XYZA9uj4YugIfa1EAIRrq7LuLMxKIPr5
         EADYMgZJgxiiTr+YVX9jbyIxvTOmyEhGq2Qw5NYLz0wi+4xjrukjgsVPfRK+wPIb/Rzr
         eD2FjSLtdx1xgHjxXU9QPMAzO99i1tydmNWzZ0XJ1GE49+EIE2xqDx6IhwxYRCQ5BMpS
         ikxj7fU7hZE59fz0AeWVV6mSRtSYH7O29VZbQMhyyfEqMbbnISu5W8IP5CgSj5OnMCR4
         W6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9uRIcoHHJz9/gFQgE1VQpj6K6kcy16s5GCXSPDSWz4=;
        b=vJ1rcTifcJELyT9Rud4Qkx2tefoTD5GvnSgBiaVdgaCjmdP8vYFcgnbEX5aGy4IXMJ
         MSNkJhUMUYRZNrcjeJtK0GZWvi6lRCfg3qz78t2l/hf5ZkLL6EZyLTKqcTy/EURXozzK
         /rpqRvPvsZJIYW3Wll1JSaab7II0qiJizJrWjAL2gzPrvXi6u34NoeClZ8CKcdw+MK2p
         fdsb8ys2if0rI5Na+VEV97I2p/WEP5woL15P6SvN2iHdoRzxJQWwL/CcLkAWJBPHZ7gN
         baVNTK5lPzPv/rloEm1T/L9j10z1JqEySrx2vpFrrFIVDdK2vgd711XHah251p8PuNWj
         FxSA==
X-Gm-Message-State: ACrzQf2KWnCyKF4JF7qudQr6DKHBgYEVTSfcPs4m5AqjpVJovyW806R3
	RLusvyACvHoHyoSgc7AIRNfG6mteBXTqHZBDZIW78g==
X-Google-Smtp-Source: AMsMyM5xfbATi73WYV8RZgnDzrGNO9OZRqJyobu360Isyix61vSg0sq7gKJftcLC4q5SflGLTTLITg/mr1v7HdPS/ic=
X-Received: by 2002:a62:1a97:0:b0:562:5587:12d6 with SMTP id
 a145-20020a621a97000000b00562558712d6mr6952880pfa.37.1665778619944; Fri, 14
 Oct 2022 13:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221014201354.3190007-1-ndesaulniers@google.com>
In-Reply-To: <20221014201354.3190007-1-ndesaulniers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 14 Oct 2022 13:16:47 -0700
Message-ID: <CAKwvOdmio0+hq0wmoxySrGQW8fii860OYiLV-eebcPMkqKNoJw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] pass -march= only to compiler
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 14, 2022 at 1:14 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> When both -march= and -Wa,-march= are specified for assembler or
> assembler-with-cpp sources, GCC and Clang will prefer the -Wa,-march=
> value but Clang will warn that -march= is unused.
>
> warning: argument unused during compilation: '-march=armv6k'
> [-Wunused-command-line-argument]
>
> This is the top group of warnings we observe when using clang to
> assemble the kernel via `ARCH=arm make LLVM=1`.
>
> Arnd sent a v2 of my previous patch
> https://lore.kernel.org/linux-arm-kernel/20210928154143.2106903-14-arnd@kernel.org/
> I added yet a few more instances I found since then. Nathan pointed out
> a new one too that I've fixed since v3.
>
> Fixing this will allow us to enable
> -Werror=unused-command-line-argument for clang builds.
>
> v3 had an issue wrt. __thumb2__
> https://lore.kernel.org/llvm/CAKwvOdmkd2PxvMUZA=A-72eATGDZkqDj--Bv1W+Xt_K_LWdROA@mail.gmail.com/
> I've incorporated idea from Nathan and Ard on that.

I probably should have made a note: the base of this series is a
little funny.  It's based on today's linux-next (20221014) but with
0a7606a9832ab375a38425a659bda13712ca89ae reverted.  It sounds like
0a7606a9832ab375a38425a659bda13712ca89ae might be dropped from -next
imminently
https://lore.kernel.org/linux-next/CAK7LNARg8OpqLR_71PJV3ZoLuDV8+mz9mphg=CzEeEEMY0G3rw@mail.gmail.com/.
-- 
Thanks,
~Nick Desaulniers

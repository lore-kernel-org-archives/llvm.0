Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E554D17D1;
	Tue,  1 Mar 2022 10:44:05 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id m185so17934778iof.10;
        Tue, 01 Mar 2022 02:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dohQLzfhr7wZu6SxVtIw3CHG42SObGN2SXyswtlVBsg=;
        b=WrUDonvN2fO25UTk5VNVhFhd8gruRaN5xzDoP4JD0Sakac0hlwGn0vLFs4yYd4XAFv
         uZKJIKn4j7cuELvqeeSDPXMNu2C1n0MsJpfl9rt1CcXMWz8ysAwYiWu0FU5ssFw8GnBu
         KImb7bl4uZxpEQ889GR2FwiQtAowT5cOncwrkuheaR+UErGWa6dJdP5knzUj9ZNji+C6
         SaCIGAmJwbqyXPo1H+nGW/xKoV4Sv5xxMQcmeQv2UvCQ1LPx9cytIPoPatO3xtpXO37Q
         QL3drAKRoTDr8u6LO2OfPrWDqwyTUyYOMOn4N3XOwbIN3FW3QG+ijjXJMFfWWnQ72HyS
         YuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dohQLzfhr7wZu6SxVtIw3CHG42SObGN2SXyswtlVBsg=;
        b=vfOPM8eOGI4HYZ6fq66ilEumZWClHSPvV2Rc9k16wBI9fGlp+hW2JkPCSxt9Jm52Ns
         WKtbKbJ6DE2EvWVKWCzRz0i0Ydy3GMK3n35S3Ctt8gnYdJ2E7BMNctILqiCgA2ECZzP7
         2p9L01J7p8vQIf4et3EP6tcErgtrKv6x08c8rhZQ0K/7ATJMplgysfvYuUwMop7qp4MN
         WiXnHN6qiKtnhX62CA9bVSxFRf3QSbFAs4qnBH4CdzyxqezOpMAt/B5G0YGJU/BUIv1Y
         UAZv9ixlqbpHvdbcBm8HIbj/iUb4sZ/Yu4pCCwmxAZCsUAiAZOPX9sDieeXLZhmNxlmZ
         tA6A==
X-Gm-Message-State: AOAM530bShUWimLF9ENYSzynGiFLTiX/KAan3quOBbdLmkiAcEbTdwPG
	5v5nQoSjAJFETLnHyHzXPfEvqE7RTc/YpSRKAJg=
X-Google-Smtp-Source: ABdhPJw1aZ/CGkeAZM6RKVYVHBay0f9lMjJdsMqyLhdijbZf60uaKu7bggqdaHiabrS+XPZY5qiqhEF5Hass1iDJqZk=
X-Received: by 2002:a6b:661a:0:b0:640:dd42:58ff with SMTP id
 a26-20020a6b661a000000b00640dd4258ffmr18921633ioc.64.1646131444958; Tue, 01
 Mar 2022 02:44:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org>
In-Reply-To: <20220228103142.3301082-1-arnd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Mar 2022 11:43:53 +0100
Message-ID: <CANiq72=wmYeBcJvRbBgRj1q_cHjZBVjxStXSu-8Ogv5bJhCqpA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Kbuild: move to -std=gnu11
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, 
	Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-doc-tw-discuss@lists.sourceforge.net, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, Linux Btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 11:32 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> -under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO C90
> -(including some C99 features). ``clang`` [clang]_ is also supported, see
> +under ``-std=gnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO C11
> +(including some C17 features). ``clang`` [clang]_ is also supported, see

I think the "(including some C17)" bit would not make much sense
anymore. There were no major changes in C17 and GCC implements
`-std=c11` and `-std=c17` as basically the same thing according to the
docs (and GNU extensions apply equally to both, I would assume).

When I wrote the "(including some C99 features)" I meant that GCC
implemented some C99 features as extensions in C90 mode, and the
kernel used some of those (e.g. the now gone VLAs).

With that changed, for `programming-language.rst`:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

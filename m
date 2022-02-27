Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F8F4C88
	for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 23:12:03 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id u7so15007152ljk.13
        for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 15:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJKFWkaNILgrND2ajpv99ahQRaE4hGQV9IUMvW6X5jc=;
        b=COC/4g+XK0ncFFdjTFjbGI8kwJnazvpy+Y8Z5kBv2abHG/7OdfJl8XVUO/gQJQXrgU
         7syJ6Bl4EH1rhevEXJDyJCzV6vXIrdiBYUsB99agtvA7QQFqI7pET+wt/bULnxpe/llB
         DoHBp+DrTOur4By7IXXtsNs4+hSllcxUFM+zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJKFWkaNILgrND2ajpv99ahQRaE4hGQV9IUMvW6X5jc=;
        b=HPDLmSQFR8x1tXuLFbRtSVIQ6VQ5hbVTyxweUy+yt+zYhc4l4sccAyuxxX14pIVMk/
         UX9boBrCWl3gOotZyIfpHMdc7EmoTDWTSzFb4h5upH0tI79F9wJb36TD+4COgLTglvPw
         pY7h0vNBSO+IlvGBW7SfLOBVA1FJeUIBFd32+kO5+gfdRM/zqoSwawVUX5z6SeZyvdtF
         MCKzLVP0mRJeiUawjfIAioVgP+wlyyXC0PR/kbB4WsolCEQgEDhbxDeez5uOvLhi7QfD
         S9+kXaq1KTk6zY7SF7IMDMT2du+vJHTArVFTwHIMhYC80mVUoX2VvaN2nMWl9oX9iZaQ
         JGnw==
X-Gm-Message-State: AOAM531duXtHx5//cfX+m1lAlVOr9beiuxYw20XK60GGM/qcfJwnO586
	7Y1S4NBhiquddCI/XlU65hniwu3730rk48R5dc4=
X-Google-Smtp-Source: ABdhPJzJ5Ee0XVz5FjUF6TQnsaZtDnYFw8Hc2K4fYVT7xs3JKH8Eg6UDB0WMvLO2GaQgz7lynuFgqg==
X-Received: by 2002:a2e:808b:0:b0:238:ea7c:faf8 with SMTP id i11-20020a2e808b000000b00238ea7cfaf8mr12515995ljg.513.1646003521837;
        Sun, 27 Feb 2022 15:12:01 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id f11-20020a05651c02cb00b00244bd3dd6bdsm1070740ljo.5.2022.02.27.15.11.58
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 15:11:58 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id p20so15101965ljo.0
        for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 15:11:58 -0800 (PST)
X-Received: by 2002:a2e:b8cc:0:b0:246:4767:7a29 with SMTP id
 s12-20020a2eb8cc000000b0024647677a29mr12717079ljp.152.1646003517979; Sun, 27
 Feb 2022 15:11:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org> <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
In-Reply-To: <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Feb 2022 15:11:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
Message-ID: <CAHk-=wg_r01OASRuSFfbEk_YHjve2BsBbkDYiEiKTaX2jm=53g@mail.gmail.com>
Subject: Re: [greybus-dev] [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
To: Alex Elder <elder@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, 
	Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, 
	Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 27, 2022 at 3:04 PM Alex Elder <elder@linaro.org> wrote:
>
> Glancing at the Greybus code, I don't believe there's any
> reason it needs to shift a negative value.  Such warnings
> could be fixed by making certain variables unsigned, for
> example.

As mentioned in the original thread, making things unsigned actually
is likely to introduce bugs and make things worse.

The warning is simply bogus, and the fact that it was enabled by
-Wextra in gcc for std=gnu99 and up was a mistake that looks likely to
be fixed in gcc.

So don't try to "fix" the code to make any possible warnings go away.
You may just make things worse.

(That is often true in general for the more esoteric warnings, but in
this case it's just painfully more obvious).

              Linus

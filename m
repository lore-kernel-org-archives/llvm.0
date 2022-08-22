Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303D32580
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 16:34:24 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id be9so8107398lfb.12
        for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2vQSeG17lzwccuXXheDklfdz+rvEzFZchuxcxOfWA70=;
        b=QS+1k7+PE+rePGoe9S3/Sv5bzXx+MhKRdXlXZFyr/Fbt5c6Cz9Zaanza+Ak1wKazBk
         m/rIfz7sa8ff2z4xpc0om5KqeFWYh/69V8JYMeB2GHSkRL7O9KD8hncg+smlKcyWWVPT
         MqFz/Ce4uMUr1qiCsX2rfd2wEeDM899inOCWguVFSAHBHudGjIfswLuaL70NbPhh6wak
         eStexTI6QP7EpgiA3CHeM8D1rfdZiMDqMUNmbiNeMo+s5hO0ktzSywOJxF751Wa/eKMR
         do7TXBX3bO0L16iRgPQ1jbgVrKwlcLIreT0U2UkFsZhZ5rRebQfMNqFHxKluHLm67odY
         uBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2vQSeG17lzwccuXXheDklfdz+rvEzFZchuxcxOfWA70=;
        b=Q3ZC9tdLRkJTHENIIMuyYA5vonndRBvoKXxaCsAzGGHBGPTJtG+UUqa7vRivqdg4VZ
         OdsqZIFOVIdX9+L98JCovUJLGSIzB5PIk7Th/lNkwME4+Qs5myWu+m8HpZHyyYjc0Igr
         8BVkQuPq2RGlq1tb0iMXB2qLQmqVP94AlBa542QZfYr88GQnoQA19vEy4sf1xA/M6igy
         WHyP6twxkmfHMMg72v0it7o36OMcYKurQyFXLDM58Bw5RTGO5O90lvWqMQQzM1slTUVx
         oSLCw1ZQfZp6EH+NxQQh3cF9xNM8fBMY8PYt6kgD7kZoKGB0El0+pcKkqdMRTHkkzkMq
         bGQg==
X-Gm-Message-State: ACgBeo3+1ex9aUkuMV3sICTVDjAjrCnD8241pk4CrfGMpMHynX7s72+4
	wA+//yKsrcvOUbtTPMLvy07FwMkTIkPFLGzWEWJZgg==
X-Google-Smtp-Source: AA6agR5wdEQEK+Retm/u5BnbwMryz3pxZ3P0il+KFDxb5lpW/sWxxXD0EVQECkE4rzxIJGgJ1jK/jYaZzrJSAyb58/M=
X-Received: by 2002:a05:6512:2356:b0:492:e06d:7530 with SMTP id
 p22-20020a056512235600b00492e06d7530mr2582685lfu.103.1661186062033; Mon, 22
 Aug 2022 09:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YwNMUlAmu/qCjuva@debian>
In-Reply-To: <YwNMUlAmu/qCjuva@debian>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 22 Aug 2022 09:34:09 -0700
Message-ID: <CAKwvOd=9ozTdeYDWzY0i-hrD4Vew5qPAcamx6wo_Y7PA+nCYBA@mail.gmail.com>
Subject: Re: build failure of next-20220822 due to 4e6bedd3c396 ("ASoC:
 codecs: add support for the TI SRC4392 codec")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Matt Flax <flatmax@flatmax.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 22, 2022 at 2:28 AM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> Not sure if it has been reported,

Hi Sudip,
Thanks for the report.  Two ways you can check if it's already been reported:
1. Check our issue tracker
(https://github.com/ClangBuiltLinux/linux/issues), you'll see that it
has been (https://github.com/ClangBuiltLinux/linux/issues/1691 ->
https://lore.kernel.org/all/YvvbKry5FVFbNdcI@dev-arch.thelio-3990X/)
2. Search for the warning message on lore.
(https://lore.kernel.org/all/ -> search for
"sound/soc/codecs/src4xxx.c Wsometimes" ->
https://lore.kernel.org/all/?q=sound%2Fsoc%2Fcodecs%2Fsrc4xxx.c+Wsometimes
and you'll see two reports from bots and two from humans).

> builds of arm64 with clang failed to
> build next-20220822 with the error:
>
> sound/soc/codecs/src4xxx.c:280:3: error: variable 'd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>                 default:
>                 ^~~~~~~


-- 
Thanks,
~Nick Desaulniers

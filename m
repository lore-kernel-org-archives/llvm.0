Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8C31C00
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 22:08:08 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id c2so24687493lfk.0
        for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 15:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KXWwIJvBgndA3WhK3GL3i3aCpDws4Fk1OlRLme0f82A=;
        b=mRKePrjtbODAs180aZDsLAEONbuWrZ7iGPXcpUcfSsrbTaJykoYbaixY19NrzKgz7j
         1/my6u6yhWkZb5L5apnLqQX9tN9kuwSNicpksyprremF6LMxq2Iy334TSqxCxNTO94NL
         bo9B0OdZSvL3+EoKfiLr4jPe6x/Okg94myvTB7LOBFfxM2w8kpRF8rIsJ2B91aZxzjp2
         OizmhlznIuMCkJWavRj5GCmTeE4RqozPM5Tx3k0xtMn0R8rQsPIBQPhu2LRW2AwpXJN8
         Qoens8HmrxcVEMMc2WJpaBQeFUfS9L2PvzbNgnc/KBmZgVP2q8DPl0VpJILYyw6zURnN
         Nkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KXWwIJvBgndA3WhK3GL3i3aCpDws4Fk1OlRLme0f82A=;
        b=xSWVHAGifVKLu4l3dhPReVynSNIwc+gCci1NYk9siiNesNzJSWN3pS2Ktd2Cngp+Ub
         T+xbU8Uge/hkIvM+WSk7ZKLpX/5DqtqvrmQ7HNYTUDDUD/x97VsBx94qrQFIKYSZ2pQY
         UZV1H0ngnb1d8v0Q8tmqy3mubqBrGO5JpoHY72/gax5J9hF1dmWqkgh2ecq3JTby4SWk
         DLn5ZC2cLupin6meApcy5U+Ow2XNUYA5+xyyUIpF/u5l654ksQwaqoXQTcD2Pe5KdwEN
         piJ2umyRw/CsigkeC3G7mkvkHmYZllkZzkGFoAr1V+bqJNHWVi1AXYlcw8GW7MMj56IR
         JDew==
X-Gm-Message-State: AJIora9VtD9XVBHOrhd90duVE4OLTGLDlDGHwVDCzgvOXWx99fz6nDmI
	mSE8Wazzxr/gWgCmHdaWRH+xVPh0k0pVMGuEjI6pJA==
X-Google-Smtp-Source: AGRyM1tLMp5Ggp2CW7vw70R1i+unH7HMYj8AjZRj1bFWF1Nw2npoZKI4aWcJQ+py3yCG2KULLc91IK4cn22E3FnjVOc=
X-Received: by 2002:a05:6512:118f:b0:47f:69ef:91b4 with SMTP id
 g15-20020a056512118f00b0047f69ef91b4mr261672lfr.100.1655849286267; Tue, 21
 Jun 2022 15:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOd=nEddFaTVQ80JrHcpjVv34=EhxJ9bb7rUFrRapuGFj2A@mail.gmail.com>
In-Reply-To: <CAKwvOd=nEddFaTVQ80JrHcpjVv34=EhxJ9bb7rUFrRapuGFj2A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 21 Jun 2022 15:07:55 -0700
Message-ID: <CAKwvOdnG3YWLEJ87a2HptA5y4mDBKWp3ZpEV_g6jN9t9uJZA0Q@mail.gmail.com>
Subject: Re: Fast Kernel Headers talk @ Plumbers?
To: Ingo Molnar <mingo@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, clang-built-linux <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 20, 2022 at 11:14 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Hi Ingo,
> Jose and I are currently in the planning process to put together a
> Kernel+Toolchain microconference track at Linux Plumbers Conference
> this year (Sept 12-14) in Dublin, Ireland.
>
> We were very excited to see numbers posted about improvements to
> kernel build times from your work.  If you're planning on attending
> plumbers and our MC gets approved, would you be able to present on
> this work?
>
> Would others be interested in such a topic?

Hi Ingo,
Any interest in talking more about your fast kernel headers work at
plumbers this year?
If you're still considering attending Linux Plumbers conf, please
submit a proposal:
https://lpc.events/event/16/abstracts/
Please make sure to select "Toolchains Track" as the "Track" after
clicking on "Submit new abstract."

> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers

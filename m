Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E8C2FAF
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 16:56:19 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id eg48so75531933edb.13
        for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 09:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1679504177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObydWNcsN+yJjQR232+qhKPgXiEW95d36vBjFwkTd3w=;
        b=IoYIuv0c74xAIGn1TWP8KV8wy2ZYjqP4mF3RLvlNIIbOTqOjdOkmYyjwsZnaGRbg4A
         m19AquLYmi1k8VkbzLpHZBZ+ljhlWVTj0tZD2HlmTsvzdLy5BM1XHLNfxXqEzmPYOrDR
         eOSJCYmb9Pun6t3MCm3bnoGxKDwy8dLuPyrOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679504177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObydWNcsN+yJjQR232+qhKPgXiEW95d36vBjFwkTd3w=;
        b=SEkAQx+EaJm4lbZ+HRP5e71h3nH45ZvXyaL3gQ2QS9mUVULycN3LWbASBd2SlpuwAl
         AZIHMEjTDWT9OleqkN07yGB/5crNTRBdxmtM2fKhGjeoWJVsup3r7bibT2V8NLWwBpLh
         gcQo+dakCc0puvjfc4kvDosceJuSiq68DLKKiEXRFOqjeLMFqdDu/mQDEXkOfPp9iTbi
         GabmtHynW+8XYYxoQzrcvZP3tzraoVzKRtuXWphIfb/7wsGrjSB+aRZ15SxD03zz7cns
         Y/ZpyifXbaF0/9WxLmiSH9aWlzh4hIc16JSgfmwL7/EN5OwHP8ybeKYTIldsbssQNPd8
         VdLA==
X-Gm-Message-State: AO0yUKUtlqNsRQA5MclXmngHujLHGlVSRiAhVBciaLl/9fglNxZocIpW
	oa+c41s59CYI5Me2wIY7e8KpEaZhpazb/v+B/eACeXFl
X-Google-Smtp-Source: AK7set8IkBBWzqeKDEWEv3aT69Axx6tkaNdqiqTxcIBzW8WsldW9kJr9+YtTOq3NA3tlClTpTQtxjA==
X-Received: by 2002:a17:906:9bd8:b0:879:ab3:93d1 with SMTP id de24-20020a1709069bd800b008790ab393d1mr7057225ejc.4.1679504177538;
        Wed, 22 Mar 2023 09:56:17 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id k15-20020a50ce4f000000b004bef1187754sm8017740edj.95.2023.03.22.09.56.15
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 09:56:16 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id ek18so75662321edb.6
        for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 09:56:15 -0700 (PDT)
X-Received: by 2002:a17:906:6d6:b0:933:f6e8:26d9 with SMTP id
 v22-20020a17090606d600b00933f6e826d9mr3542731ejb.15.1679504175429; Wed, 22
 Mar 2023 09:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X> <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X> <87pm91uf9c.fsf@kernel.org> <CA+icZUUYyqhV2HFzVtpi_KjBoYxjk7OB0UBVd2mX6abjmYhDjg@mail.gmail.com>
In-Reply-To: <CA+icZUUYyqhV2HFzVtpi_KjBoYxjk7OB0UBVd2mX6abjmYhDjg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Mar 2023 09:55:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=whdrvCkSWh=BRrwZwNo3=yLBXXM88NGx8VEpP1VTgmkyQ@mail.gmail.com>
Message-ID: <CAHk-=whdrvCkSWh=BRrwZwNo3=yLBXXM88NGx8VEpP1VTgmkyQ@mail.gmail.com>
Subject: Re: Linux 6.3-rc3
To: sedat.dilek@gmail.com
Cc: Kalle Valo <kvalo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-toolchains@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 9:40=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> You have to pass `make LLVM=3D1` in any case... to `oldconfig` or when
> adding any MAKEFLAGS like -j${number-of-available-cpus}.

I actually think we should look (again) at just making the compiler
choice (and the prefix) be a Kconfig option.

That would simplify *so* many use cases.

It used to be that gcc was "THE compiler" and anything else was just
an odd toy special case, but that's clearly not true any more.

So it would be lovely to make the kernel choice a Kconfig choice - so
you'd set it only at config time, and then after that a kernel build
wouldn't need special flags any more, and you'd never need to play
games with GNUmakefile or anything like that.

Yes, you'd still use environment variables (or make arguments) for
that initial Kconfig, but that's no different from the other
environment variables we already have, like KCONFIG_SEED that kconfig
uses internally, but also things like "$(ARCH)" that we already use
*inside* the Kconfig files themselves.

I really dislike how you have to set ARCH and CROSS_COMPILE etc
externally, and can't just have them *in* the config file.

So when you do cross-compiles, right now you have to do something like

    make ARCH=3Di386 allmodconfig

to build the .config file, but then you have to *repeat* that
ARCH=3Di386 when you actually build things:

    make ARCH=3Di386

because the ARCH choice ends up being in the .config file, but the
makefiles themselves always take it from the environment.

There are good historical reasons for our behavior (and probably a
number of extant practical reasons too), but it's a bit annoying, and
it would be lovely if we could start moving away from this model.

            Linus

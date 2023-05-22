Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF9D110E
	for <llvm@lists.linux.dev>; Mon, 22 May 2023 18:37:38 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-3f42b4da6e5so29576431cf.2
        for <llvm@lists.linux.dev>; Mon, 22 May 2023 11:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684780657; x=1687372657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE1YGTh9d+XFdvUdt9kLMAcbrISnJqMCKvDPYim3xk0=;
        b=n2/HPeqVEZWy94HrQrqzpMVvrl8ot28r4dGOugqG0lH3NmFZPilmgiPUXx/ZmabsCE
         pZZO+fv+LxjFa/JcmhLZrxIVO9tlxxyNJmppY8JIpZduWebGSB9u/e6ByyFEPx0eJXk9
         e9fzE7yTHOyOeqBrK2VCPLjmlU/sV5fC+7pgN18LadnrXNr5+ehBkOhf+4f2R5wYNVkr
         0+NwRHlKqDuN+rTSBvMWsG97KbmkoTistkEe4sBHKJ7PQqzSINJiwobu3NUBqGPBvYTV
         qOrsPSRCciGjoYRy/jvs7UKjSEdacvD2yV+nPEg6kOsEZTc4XoJ7zOG+5F8pI0XAaz6/
         sV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684780657; x=1687372657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kE1YGTh9d+XFdvUdt9kLMAcbrISnJqMCKvDPYim3xk0=;
        b=WrKaL38E8cwUTk4afK8oj/sKoXMvq7CggqfwMYJKogZBkZF5sNh8l3V1ekw2tFkcpr
         iPsNFE7DuxDjIUKFc4b08GneV8g2DKQ2GQqB8lYiS9VjjGSZKvfFDKCFQwnuGdKFwK5P
         b8X54mR2s3VfRvjkkhAL6lewocb4epIoX7mwpXOHFMmOL0Ch6t30ggUxl7qAj/ZMKEt2
         YuqE2+x0YKq56q3ZXNtrqWFIqgnNXiRezzTs4Rh4E5OnygyT7MZSMpff6nRSkMJ89VLP
         VbKfq6Tf4aTxFR10raDYE98AoDlanoszrX8ug59GKSOm3U6FaZ6C8wypmg8XtuHyJult
         YAfA==
X-Gm-Message-State: AC+VfDxAkYE+4us5OB2zvmrqKlXFHSzSEBUcaCtd7XvQ+CUk9A5G0Woa
	8Mqh1/5hGME1N9NfQorFavktFAheuJRCvecCo+JLnw==
X-Google-Smtp-Source: ACHHUZ6Rk6oINXBumC91jfi1Bk3n+Xl0Ur5oT2V+khLVw4FLlQUt8KN9UKD2SJZMHH4eDVe+WuyTAUs9CW6+i0jXomU=
X-Received: by 2002:a05:622a:85:b0:3f5:3659:4901 with SMTP id
 o5-20020a05622a008500b003f536594901mr19532832qtw.20.1684780657335; Mon, 22
 May 2023 11:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEUSe78ip=wkHUSz3mBFMcd-LjQAnByuJm1Oids5GSRm-J-dzA@mail.gmail.com>
In-Reply-To: <CAEUSe78ip=wkHUSz3mBFMcd-LjQAnByuJm1Oids5GSRm-J-dzA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 22 May 2023 11:37:26 -0700
Message-ID: <CAKwvOdn3ngS101Y8DiBQgmw4K8kEX+ibGeXYBwTRVLT59q6wsw@mail.gmail.com>
Subject: Re: Stable backport request: skbuff: Proactively round up to kmalloc
 bucket size
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	linux- stable <stable@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Kees Cook <keescook@chromium.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, rientjes@google.com, vbabka@suse.cz, 
	Sumit Semwal <sumit.semwal@linaro.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 11:24=E2=80=AFAM Daniel D=C3=ADaz <daniel.diaz@lina=
ro.org> wrote:
>
> Hello!
>
> Would the stable maintainers please consider backporting the following
> commit to the 6.1? We are trying to build gki_defconfig (plus a few

Does android's gki_defconfig fail to boot on the `android14-6.1`
branch of https://android.googlesource.com/kernel/common?

(i.e. downstream branch from linux stable's linux-6.1.y)?

We just ran CI successfully on that branch 10 hours ago.
https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/504=
2504560/jobs/9045030265

Do you have more information on the observed boot failure? (panic splat?)

> extras) on Arm64 and test it under Qemu-arm64, but it fails to boot.
> Bisection has pointed here.
>
> We have verified that cherry-picking this patch on top of v6.1.29
> applies cleanly and allows the kernel to boot.
>
> commit 12d6c1d3a2ad0c199ec57c201cdc71e8e157a232
> Author: Kees Cook <keescook@chromium.org>
> Date:   Tue Oct 25 15:39:35 2022 -0700
>
>     skbuff: Proactively round up to kmalloc bucket size
>
>     Instead of discovering the kmalloc bucket size _after_ allocation, ro=
und
>     up proactively so the allocation is explicitly made for the full size=
,
>     allowing the compiler to correctly reason about the resulting size of
>     the buffer through the existing __alloc_size() hint.
>
>     This will allow for kernels built with CONFIG_UBSAN_BOUNDS or the
>     coming dynamic bounds checking under CONFIG_FORTIFY_SOURCE to gain
>     back the __alloc_size() hints that were temporarily reverted in commi=
t
>     93dd04ab0b2b ("slab: remove __alloc_size attribute from
> __kmalloc_track_caller")
>
>     Cc: "David S. Miller" <davem@davemloft.net>
>     Cc: Eric Dumazet <edumazet@google.com>
>     Cc: Jakub Kicinski <kuba@kernel.org>
>     Cc: Paolo Abeni <pabeni@redhat.com>
>     Cc: netdev@vger.kernel.org
>     Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>     Cc: Nick Desaulniers <ndesaulniers@google.com>
>     Cc: David Rientjes <rientjes@google.com>
>     Acked-by: Vlastimil Babka <vbabka@suse.cz>
>     Link: https://patchwork.kernel.org/project/netdevbpf/patch/2022102123=
4713.you.031-kees@kernel.org/
>     Signed-off-by: Kees Cook <keescook@chromium.org>
>     Link: https://lore.kernel.org/r/20221025223811.up.360-kees@kernel.org
>     Signed-off-by: Paolo Abeni <pabeni@redhat.com>
>
>
> Thanks and greetings!
>
> Daniel D=C3=ADaz
> daniel.diaz@linaro.org



--=20
Thanks,
~Nick Desaulniers

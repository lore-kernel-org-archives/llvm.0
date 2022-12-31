Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4600E7E
	for <llvm@lists.linux.dev>; Sat, 31 Dec 2022 13:34:23 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-48641a481dfso157102887b3.11
        for <llvm@lists.linux.dev>; Sat, 31 Dec 2022 05:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OlG2ZWLwbg11x7JqxmIJ3EwjPFABMN8qelHH8mpSWZc=;
        b=cfYlJYBuHpSDOAhy/8zE8zsVlHJeZBQvdMGgSLilSsfqdHmDmRuo5IRnNdWKhthSVZ
         93kPS4nSL+i+ht2tAVBdY49beKm5cIqQIMcGS4pxOUO7k3H9UiQ6pRQkqp5o4LGgkQP7
         zyg45TdoBwwGqNL/qEYI4IjYihrQQ8mvr2RoyL6hWLecnWmI93BNmnZWpoMIGznaWVBE
         G74UF7DULynd028rHwswinaDkTl+z6YmeveQ8z81iIvIRrCOODcc/mwTmaWeUgJOKGeY
         0KHDhyP/H4hVJx7zJsMJcRCOMOx03aC2s9Zhezlx3CpPf4bcb5jTyyoiG2eWyXCIFe9Y
         hWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlG2ZWLwbg11x7JqxmIJ3EwjPFABMN8qelHH8mpSWZc=;
        b=3BIqtmUOB5Oc6u6/pC3fEB95srOlIChUK4k9dDQDyHrLL5lYmqhBNQy57oCHHg/DZe
         vfCGMPBftpODWoA6dT5u38teqOHTTzlSHWzp4sVZUOJLbSspiVXoVlm5XyC1Ys4U5teR
         IKUiqb9wJGO1slkoZVsk2XsjdsFODjZFdN9k9sleiOHUhLiOEVDBaZjzivMxaKNrSP3V
         fedSBOHeYR4V3wuCFPcH5+MI8aV8mCSszBnNX8KVpJa/CEwzzhBMUd/jRUdtltaaWvu4
         W/SZu5lnO1cIAvvgsfSPm2ORlqEL2nQojaBaTabSdoIrLumboNW2gjY8aSq8Buatta29
         zr+w==
X-Gm-Message-State: AFqh2kpO2QuPL3e6eLAPmbSaobdjOt6HDONTiUNhPXvx7iJyrWD+xxl3
	0r9rF9DWtUVPkdbvMQA+FcbvnYaEraLVBeQx/2g=
X-Google-Smtp-Source: AMrXdXuTGtVzVPnubHM0TtSu1jEEw41VpKdyluBDPas/jnvfbBCV/QMV44rkDFhm0CXUR7AuOEsyjwLk51bvrotnYPI=
X-Received: by 2002:a0d:ea54:0:b0:483:813:c70f with SMTP id
 t81-20020a0dea54000000b004830813c70fmr2048084ywe.266.1672493662289; Sat, 31
 Dec 2022 05:34:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221231064203.1623793-1-masahiroy@kernel.org>
In-Reply-To: <20221231064203.1623793-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 Dec 2022 14:34:11 +0100
Message-ID: <CANiq72m5E1MehfqdrkmJt43fAzUMc9kEKu7x4WaALdgDGJ30-g@mail.gmail.com>
Subject: Re: [PATCH 0/6] kbuild: fix dep-file processing for rust
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, llvm@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 31, 2022 at 7:42 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Masahiro Yamada (6):
>   kbuild: specify output names separately for each emission type from
>     rustc
>   fixdep: parse Makefile more correctly to handle comments etc.
>   kbuild: remove sed commands after rustc rules
>   fixdep: refactor hash table lookup
>   fixdep: avoid parsing the same file over again
>   fixdep: do not parse *.so, *.rmeta, *.rlib

These cleanups are great, and it is a pleasure to see proper
integration with `fixdep` -- thanks a ton! :)

Will you want to take them through the kbuild tree? (I guess so, given
the bulk of it is on `fixdep`)

Cheers,
Miguel

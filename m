Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050D21D311
	for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 15:35:41 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-56ee1ed7781so2181055eaf.3
        for <llvm@lists.linux.dev>; Tue, 22 Aug 2023 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692718541; x=1693323341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpbWlkgF9G5c4BilgR6T5ZL9WbK7oG3eh1MZ64UeGN8=;
        b=oVBjRzuWLb/E/mNr/XFPgnetSqGJOOikX5qFkcaXbIfhF3Adqd+YTxWnAL0hwSH0Vs
         I3yD/vKvbzIP0Jbkhe5KzdYbM8xFTJifvMW1+DqUq0Qi/WsExmmQ/k1If5GBBwOmi/40
         9HLTOsWwDW+UcjVXyH7ZMI6RX63sjCfU/wiI5hbn54OZqT3EWiYs8CqsoVVz5xpB6+7T
         Lkpu22OaAJHLjDUJeusaU+rC3v4cARdhBgl5mdV5BuPFzj2/z/MG4UymX0TPWkgfvZFe
         OFXnjB2DSk2IcOkyzAOJTiK08dwpwdT0mlnqFkMUZnSw58/nckVVAGQZDo84C0LZ2C+S
         HxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692718541; x=1693323341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpbWlkgF9G5c4BilgR6T5ZL9WbK7oG3eh1MZ64UeGN8=;
        b=R2wrYshYt2n6GqnCPecM0w6VmgT4il0NbArWRGL+w/k1cCm7kCyBIrvPL+4NXJGfVg
         NpmmV57+WquPfp/VoHUGeBQw2/QN26bhC9rtlPVOWFA/MD8xQtfV7ky6kVAGj0sYNVG2
         5fLVbV7P7Se+e1EbhBoGBTNX9SYCi8xa+Pgbc9kd/cvarQf/P2gSI53sdiQHJsYOhGwR
         rfMUFpZP3V/yicBBvaGB+pfOlUHUfJgdYTV2essuezV1y+9/Og/QX380XgUg68hFcPMb
         Xi9SzAHz4JYg0b4Lw6E8zIXjNZ7u0bOLLaFJBJxcYDgJAZuTOu8yBUf4BmtMe1eyMGoo
         ckHA==
X-Gm-Message-State: AOJu0Yxg4vzywtePR0zoNiCq8sICQuNZeOr+v2RwoX8h0+f6I3XPcH1g
	BwDgJZVaDO/W0WcaeUFsZmwKBRnxsbCtpvFOFOH7/w==
X-Google-Smtp-Source: AGHT+IEu9fpvg1xzFrKoksiTUhLosXRcg0doGL8ZpFS+ulK3Y1saBpwBsZnKEb6cAyffL90OscOIfxXp1S8cMVX8kI4=
X-Received: by 2002:a05:6358:278b:b0:139:9fc3:eade with SMTP id
 l11-20020a056358278b00b001399fc3eademr11387966rwb.29.1692718540654; Tue, 22
 Aug 2023 08:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230822-rtw89-tas-clang-implicit-fallthrough-v1-1-5cb73f0fa976@kernel.org>
In-Reply-To: <20230822-rtw89-tas-clang-implicit-fallthrough-v1-1-5cb73f0fa976@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 22 Aug 2023 08:35:29 -0700
Message-ID: <CAKwvOdn=Juj--eXFV9t2tOdUQqYdOFFvtk9ZobjXcmbi0a0MsA@mail.gmail.com>
Subject: Re: [PATCH] wifi: rtw89: Fix clang -Wimplicit-fallthrough in rtw89_query_sar()
To: Nathan Chancellor <nathan@kernel.org>
Cc: pkshih@realtek.com, kvalo@kernel.org, trix@redhat.com, 
	damon.chen@realtek.com, linux-wireless@vger.kernel.org, 
	patches@lists.linux.dev, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 8:27=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> clang warns (or errors with CONFIG_WERROR=3Dy):
>
>   drivers/net/wireless/realtek/rtw89/sar.c:216:3: error: unannotated fall=
-through between switch labels [-Werror,-Wimplicit-fallthrough]
>     216 |                 case RTW89_TAS_STATE_DPR_FORBID:
>         |                 ^
>   drivers/net/wireless/realtek/rtw89/sar.c:216:3: note: insert 'break;' t=
o avoid fall-through
>     216 |                 case RTW89_TAS_STATE_DPR_FORBID:
>         |                 ^
>         |                 break;
>   1 error generated.
>
> Clang is a little more pedantic than GCC, which does not warn when
> falling through to a case that is just break or return. Clang's version
> is more in line with the kernel's own stance in deprecated.rst, which
> states that all switch/case blocks must end in either break,
> fallthrough, continue, goto, or return. Add the missing break to silence
> the warning.
>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1921
> Fixes: eb2624f55ad1 ("wifi: rtw89: Introduce Time Averaged SAR (TAS) feat=
ure")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/net/wireless/realtek/rtw89/sar.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/realtek/rtw89/sar.c b/drivers/net/wirel=
ess/realtek/rtw89/sar.c
> index fafc7a0cfe97..715bf5c2f56a 100644
> --- a/drivers/net/wireless/realtek/rtw89/sar.c
> +++ b/drivers/net/wireless/realtek/rtw89/sar.c
> @@ -213,6 +213,7 @@ s8 rtw89_query_sar(struct rtw89_dev *rtwdev)
>                 case RTW89_TAS_STATE_DPR_ON:
>                         delta =3D rtw89_txpwr_tas_to_sar(sar_hdl, tas->de=
lta);
>                         cfg -=3D delta;
> +                       break;
>                 case RTW89_TAS_STATE_DPR_FORBID:
>                 default:
>                         break;
>
> ---
> base-commit: f585f4ab0b998578b4ef3610ccfc08e207fc3499
> change-id: 20230822-rtw89-tas-clang-implicit-fallthrough-aafed8e950fc
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>


--=20
Thanks,
~Nick Desaulniers

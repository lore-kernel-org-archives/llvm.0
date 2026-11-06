Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793989034;
	b=tvk9l2+eROdVxhqG9Wr+T57xDU8doj5Nsn8m1zEgq/0j+gbFM9hRdLYfJOURWjMY0je2
	 v6X2zUFTZpiU1gDMgIfeXZcREx3rYCim/sY5qFMhbxJIRNM1bcC80lMYC1qR9DUUGoeBc
	 8OGkty0jklpMSWuaG9d2rd1TKXs6f/2I6FmKR3kDuUotEfa51UdCSWX4IAATS6OFAUGst
	 zNjVvRrIFNQYaoYOjEsVKsKJEPXQVn4BAnG1FqB/ygO8pi2rLPVwUEQHVXM3+wXJ0SZnH
	 GMD0Wcr4bTFDLDGRUNgZbGKhe7ysQd9oHmywDMXlXC93HiB3BVpjDReg4jm3Qtij04w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=iO2JEAydHDgBReyWjoaKwK3iFfajRHjkVPraMabJC1Y=;
	b=mP1+rNq9hafNa4Ch5tdtXWkBxcqR3BYNcC+7vDWFMhCa4gtpqMXw6cB+FooBMQLLh0Y7
	 XYmVDmhgoTOwzmvEJJGC35FDFFkA64hAD6s2M5vqqbyy6CF6hzZWbAIzFp5xQrRmnxsYo
	 WK/jF6mZPinWSbxWCBZj2GPRA15szgHOTvd423KbA+sMB5LakMx5wTYo8xDiTs4cJXgzb
	 sw/ihXBeqyy17p8NJ8R+XMFSa3Fj7VHo90V6vPCnb8CTQx39EW0E2aro2LrUkeQfebdkY
	 yUNLms8C0FNttZ4INAiCMjUwY9vCL+2eLcfvtrzuaGnjSkleg8ekR60IGdUeyxN9a0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ghxOrqJW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282BC606A337
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 18:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282BC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ghxOrqJW
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491971ac844so844023f8f.2
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 10:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793989032; cv=none;
        d=google.com; s=arc-20260327;
        b=CoexZ8/tarJu7UYqWk0i30OF5Hp1HC09LAmkYFduwLucO6e7nFoERxP7FytQHl9WNy
         3NxvlFcx5arEUwDAi3Be/4njfjdGmg+0Z+d/tvUfdXllD2puTlOrzkELB0A5VxzmO4NM
         iWigtZMyQjNGNZycz+ulxI0ZzQ4Rl2SuXGQJy7UizYh6E8h/BgomJBmLeu812iv/dPt+
         vSPR9V/FUC3xH8G9WGxnrgKg5akPeXoZwXT5MYrVcIoD1W5SASsP8SX4heTD4pPMqH03
         XkiF0gJTNRVIF1l9W1yzent06UK2pQu2sEZWxkIg1/ImEVmc9in27dJa/GiJ7rlzj8Hu
         I5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iO2JEAydHDgBReyWjoaKwK3iFfajRHjkVPraMabJC1Y=;
        fh=qgGyuDgGrzDqN//oZ8Xy8Eiomo1iGOQvi6sghCG1lqY=;
        b=lntGRVmj0qPtNE6zZVCcPKsxJalk9WnhMBMp1DYf5Ppxdq07dWYEpN/CQxwaUluYC/
         WYjsKNBjdX6KjX0xvjnw1ZaWg2Bw+UkwZLpLrwBte0ql8QPwavk5AXMZetTER9A0i9Hy
         wRD8733VQcA2vHBwePJgt7vqBVcwLjBf/bfRmqCJwet59vJh0Q2UsWFgkRyM/sfjXOPZ
         m+5mIdNkBeZ/BPs5+rRg7GG09SfnhNJ8Evo4Dxwlr2I+MOAoR/ELDy3E2jNTMcMOYZni
         z9LbwRUCwycGd01s8KeeNCfy8N9lwB+Z+olP6cZVyyvgyv+dCFPSXoqEmWLyJn/Q5wlw
         qHTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793989032; x=1794593832; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iO2JEAydHDgBReyWjoaKwK3iFfajRHjkVPraMabJC1Y=;
        b=ghxOrqJWxkGFpy5tKhA9vkE7LFHPMbWx/anvXOZJ2ettGw+Ae4YQJmDloohzFnXz3w
         HBwQLHqGOj8X2z7Rz7TqNIultOdHBgGNtnKSY1Ovcj3lfTAzTM3dUTLUKbYCObaVvOrJ
         5mmvnH+1GgkZTWgdKSrNBMKH48d0jUYTZIX2F0l586G50/rQbngI1UUAQMMwCDNwyMc8
         Fl8HS5B+u8orpkQe+TpHhhvQT8gDm1eNIUpMILp0OHPrFHILWhKGzL4+2oSRL9Pbwo9+
         q4nqWyM2ZF+McNVjbqMvdliS26DT4ZzX9er92yZJL4gxmZwFKKgXL+J07vZZdjlgjnhG
         RsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989032; x=1794593832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iO2JEAydHDgBReyWjoaKwK3iFfajRHjkVPraMabJC1Y=;
        b=xiX7XVCVUndgUl/NM04sUlOdyrxvz+lzUwBkmSJMcnY7DahRrcXzbMxoALLFM5gkAQ
         qJStITu2VwmT84qT2PWH9NX08jXfnp1NymW3pPUj0pfIDOxJJxdLgEsJKB39QiBpU+26
         GpxC12sxjGVoQMEumvucDh370Rwn0o62SHzh9peQbWkNbWb2GcLpUESaUlM2zdrmIFXx
         MX+5jLfNxcpjYCUtLREHTYi1OzayjnyxvTZu9W9NkNvWJUGb13Byd1Tc81aihxTDeTlZ
         9WT7VZSg8lBU6Z+qIu55BFQ4uEuiy5qGCysTGPKcfXvSZyuCcyA0YNbBpyxRpFvPQjbX
         ZiGw==
X-Gm-Message-State: APuU4Z+yhqQJkNbVu7lOW4PLaCVjf3Xj+h8SONzc/mo4PjiXetC5zcq6
	65dMKwBP4at7Llb8yW2v8uCC75UUNi4t5hnCVoAGA2dDA/YK714Ek4twYqQyE08jSWVdVz/mMcd
	Lc67WGex0dsfmPHHmEJ6/qg5gLsKZ+sHEqFXXiPWk
X-Gm-Gg: AYBFou3VZHOEf+Z3oIlxxdQigVYMytRFb/zR4nsLo8NYruJSZjrMGtdrThvTqIzL8ih
	i91TyUMfDJpEK12JAtzuYJUu/TCuivge9MnT6taRpS8gJ5IL1L6VcZVXI5gDhbVxf74immq0H3M
	F97270Tot9wu99xXI2/gWe5QzJtCcx7mvn0h/ODHVcqqtzgSyP/pijVP2+y5cDhezPlsndppTax
	nhHWSy6bo7icbvMR6jxH7aRjpB/TrjlxeJn+swiOmlYJy6GzfejtsgYx2awKcJMfKlDdcx1c/bT
	NRVKEN/ioDDDzASR6rzM+IZHs0oec0QvlKGaG8vtRTTYatBaqoAYwlTrsLW/ZYZd9vNI1UnIanL
	/+o4ziPdJVKlXnrNEqzlKSenvaShWoRm63w9EoSAGCDmk3guCEDNQDQzsW6Bt2V3HMmnC/bHpQK
	gtAxAzKH9EgjKm1ZBnMQopxBPR4XmaIANjNhi4HdNPEwt7SV7PFEtsLVYQpAVQDU/S6khEWw7+G
	3fc4wo9xsUTGQkKbqtjqWIWyxDfHc0WrMjxQRYZya/bv803rCpESCk5Y0M=
X-Received: by 2002:a05:6000:2892:b0:48d:c186:dcc6 with SMTP id
 ffacd0b85a97d-492777dbb54mr6867359f8f.57.1793989031973; Fri, 06 Nov 2026
 10:17:11 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
 <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
 <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com> <CAF1bQ=TWZ=u1h92Nt9NgGcaDNTo=BOHmUp1DCWEeUMfwBb3WhQ@mail.gmail.com>
In-Reply-To: <CAF1bQ=TWZ=u1h92Nt9NgGcaDNTo=BOHmUp1DCWEeUMfwBb3WhQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 6 Nov 2026 10:17:00 -0800
X-Gm-Features: AclHuK9SWyCEYtuJGMl-fJhTBaGxGHpWXefZx7LtX8R0YzDCJePA2Pf99_IEKbE
Message-ID: <CAKwvOdmTaMQf4Wyk_sygaushmMd9dRR3xPZ6K9rbKYB25uz7jg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Rong Xu <xur@google.com>, Doug Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Han Wang <nesthanwang@google.com>, Snehasish Kumar <snehasishk@google.com>, 
	Nilanjana Basu <nilanjana.basu87@gmail.com>, Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:13=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> As far as I know, Profi is enabled in the Clang front-end initially. I
> remember reviewing a patch that enabled Profi for the Rust front-end,
> though it's possible that has already been merged.
>
> It seems strange that these flags diverge between C and Rust. Could we
> add a comment to indicate that Profi is currently not enabled in Rust?
>
> Rong
>
> On Fri, Nov 6, 2026 at 10:06=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> > >
> > > Just one thing: I think we should also have this flag for Rust so Rus=
t
> > > and c are consistent.
> >
> > Please see the commit message, which says:
> >
> > > RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes becaus=
e
> > > SampleProfileUseProfi remains false by default in the LLVM backend an=
d
> > > is only enabled by the Clang driver.
> >
> > Is that incorrect?

Probably better to be explicit, rather than rely on the implicit
default value, which sounds like it may be changing over time.

> >
> > -Doug



--=20
Thanks,
~Nick Desaulniers

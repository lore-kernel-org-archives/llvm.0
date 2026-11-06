Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793988812;
	b=ajEORCqxtEXdftxZOTFjwT7CEkKp5Gpk0ZJYSUZ3KPcA6/tfrY4/Wfyca8MmlGln2A+l
	 Htnl4jRO/E61T9GNgUTGmid85OdUSrFlb4NVFkOwZeo+4BArSgfFdne8ltWyoS1lnNUTB
	 zTGVuii5vw4NFkYrS+ukLGVXGVqCsR2xtNrRBY8Zde2ajqFnmFcx48l7xqVz6yrvZ+iGu
	 leAS+w1qirvNL9iLUfaat+FYSACqst5pzYqPjMURSGnP3RC1P6yFCMu/b/8RyvBmcLgu6
	 hb80uZocO6A//MSnnpR9zsFihfmHcfyxMAbSrQ+XiVvFTxf58Z8Y7wpk6BwbSDen+aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=IN6twHDIaLh5ilgymQBvZ60S6ffcPsE8wQzp8ZyOj44=;
	b=3F5F3RNmcN4vq/7tZ7+Gryp4p403V38gqu6wfvN7SJ+knK28xXcUCLPfGH2xErjgM5Dt
	 MkLvO7WRhlZSwZr+xMJvTndeVpOauxuoGqDJV1GOHM6/TxgDIBjNR8dBvHxaqnh6otxbX
	 vKv7gOlscnitr3dEXIXCjayiOk09r7iXzaYXQJDyMTrXNNOtQioLlcI5z2K1eqiyWmcwK
	 ppk/nBRLOzUoYp9qdfHZH0Tnp3gqNMsgUuS42casQgTjt2az9JhCEePOQkiNQQMYAvrdH
	 dqB0ykTWTerIzF/T8hb/VZiz/tFatJ0avlVI+vRQgCGHpi4K395uL4vJb2fuTLk0ESQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E30C606A332
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 18:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E30C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so933a12.1
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 10:13:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793988800; cv=none;
        d=google.com; s=arc-20260327;
        b=eGYToTCyePp3FUYdcwaD9mmB7icipCPdu9qY2FKK43rWXuZfxngEeF4fZq9FTDVAWf
         UGWQmh3l65oB6CX0ha+NTYAnBUKmYT1j03nIpsooeRvJW1VVlM2WRihDw5ogqNofLqOr
         zW+9fEtHTnnJIpsELv24kAuf5SKxsczH/nbKo1E08eK6THa4rUP1jS6lv6OvqhfvpCqw
         8L2RNhGl8eOGElqFa0PO8O5ohgkuDA6vsc+tZGvWcnLEhg1mm8iCzzTvLyPEHS15/nz3
         t0q5nTxhsXt9n4jfIgcO5KJAPdw7nBKP2QZVlovnwpEPm0Q9EX/ubwMFvtuQDdcwPMdW
         LkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IN6twHDIaLh5ilgymQBvZ60S6ffcPsE8wQzp8ZyOj44=;
        fh=tHDV++SiXO+kKwgP7MhwmBE2a391OGIyb9L+iUHHkRw=;
        b=cCcxuUfZ0pVM8QCeyvKI+FMTtzWlk6cdE/bbNeLFF36oYbYEAwvjdNUvUpANrnp/s3
         2LsVr6rFwpRgS9m26fwsJBnrD0IdeJjDdDh9FnO0wFmx+f4H5ZN5B7Lgfq44zfbJHfU5
         vj4ts19bILz3ObwpFXJI6rtJqwPp3vKPU9u4Ysrt1BWni58Za2iujMlJOknP4xl1w65B
         G5YJdYT+NReBsCYT77g8hA6Zc/W5QaDge8QfJmSozJORz87vX8omd9jRq9Jq/EOQU7Oc
         b2R/50VeycDx6bl5W2PCUiyCaSaM3w+dkkHj6WZeNBbuTehhyTmt7iZLIgHkQ6cpjkSN
         xpKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988800; x=1794593600; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IN6twHDIaLh5ilgymQBvZ60S6ffcPsE8wQzp8ZyOj44=;
        b=CQ+laNLoFLrqrm7TTpnUtzD03HPw5pudLxbj3r7h/rkMK6OCXcUoDPmhULpFFzm5AW
         FuQOwg27WAfbh8Y5HF42wZpj6/diFoyvqI4CA0/oDQsLGM7YvyIMgamKRCKLYoIQg/IQ
         YmMHh+iZ0Fkx5Pu/K5wHgTiJjiri3KTmYN6h/dhl8YjlRykqAaR+1zo3tGI81u+ViZgB
         p06Y3rHXrR0v+pNWpUsN1NSJNM6QnDpy1rNpW5asgMW3a6oWzvj+5rA5CYvGCaEcw+tF
         HTyakDztcLygZ6WmJNTPV+ULRvQj0wBU0Ig1JzoOTH9FG1I+mS+3PxtYyFKuYE7tALJm
         9Y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988800; x=1794593600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IN6twHDIaLh5ilgymQBvZ60S6ffcPsE8wQzp8ZyOj44=;
        b=WjaPFzkIKaWN85gwCo6Bb+FotF1C/9ZcjPXZh60pay+wZuuf9slOElR3nJ9m5HkClT
         IL/QV6DWB91cvuQ0WXlp/oAjufftrlU+/VJW3yYGAOhef6Il/Wxkt3IBsTTl/6BzCnzg
         reOi5lj+IgbgPXVg/WmOg5euvNTYyYQp7dw3wP9+cbPGJxv1fy+1GF9qnDn6hXmTmU5M
         mze4Cg0g7wdQhjOHlt0GqH0nqItcmbRUnUQx4geWBy+l13641ClD3ymHE+ZWB+Ou+FEG
         8z7tNwpnzjafd7QO7aIWqPcVvYD3NZNUVs4kNHJSHGkNVXwgaylZI27zgwyQerKET3Ii
         PIRA==
X-Gm-Message-State: APuU4Z+KnMZxZskKgyH0foaBQK8l5NL6QFDHEoQYFqp70VeDsLgd8ctW
	ekEjqJ0JOmtcoi+HFlq3DyT2/MbJjcjWkGZPtRHCJME8OE1QjPN0QIs8h4COhKxOSYeg673oy2R
	UgXf/5u6BTOnrwkkLCejJgAcrbTMZ3Cvu59WEYNSg
X-Gm-Gg: AYBFou2kRX4WIvMFir+sgv1lPrynV3ZtpeAbM8QHA3m4jLHnlQFBJsslrs6Q+ba+fEy
	0W/IuoRwZnOe53C059zOaA8+m7krThESgK8U8GRxpmwb0ymBrH7YxwZYJJDcIBitB3iXEolpU3M
	wF6dahEjcnP5vxVmVUg0chNThWGHTow/o1yrbDPotqEodkj9dabpd4iuyQVhSDGlTvFEFnpmCZg
	O3q8d8GJ9gisG13zEAxl4t2nZD+y911U2Jlodzg4Wz3RLGlTJjssnnvzJuvsu/1OGvjcOMM5Jdx
	g4gnC9KkxnLWlotMUGEat7g23izGFHriLrxyPKVhp56yjBnbnvcde4uSf2YUhvr+U1h+OHpxEHE
	eYIvyLKP2liKJTS1Jk0G237oT6EFrl132uExvvQ7PGXvuPUSmUdx0I0fi8KqbD33pK0ExDSKNK1
	STz9+O14Vw2wI+
X-Received: by 2002:a05:6402:4025:b0:6b5:70a4:c77c with SMTP id
 4fb4d7f45d1cf-6b6f8405023mr6118a12.11.1793988799653; Fri, 06 Nov 2026
 10:13:19 -0800 (PST)
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
 <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com> <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
In-Reply-To: <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 6 Nov 2026 10:13:07 -0800
X-Gm-Features: AclHuK8M7aEN7HUd8VzCV7EfdL7Os2jiojoMycd1W00kFFu83GOEk2kpHYqCCkk
Message-ID: <CAF1bQ=TWZ=u1h92Nt9NgGcaDNTo=BOHmUp1DCWEeUMfwBb3WhQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Doug Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Snehasish Kumar <snehasishk@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As far as I know, Profi is enabled in the Clang front-end initially. I
remember reviewing a patch that enabled Profi for the Rust front-end,
though it's possible that has already been merged.

It seems strange that these flags diverge between C and Rust. Could we
add a comment to indicate that Profi is currently not enabled in Rust?

Rong

On Fri, Nov 6, 2026 at 10:06=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > Just one thing: I think we should also have this flag for Rust so Rust
> > and c are consistent.
>
> Please see the commit message, which says:
>
> > RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
> > SampleProfileUseProfi remains false by default in the LLVM backend and
> > is only enabled by the Clang driver.
>
> Is that incorrect?
>
> -Doug

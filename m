Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921130;
	b=1+d81qPPATuh7BhmBh3lMSOkbB/F7/9KbPjM/ZXDLSvtqLAXyFkI6wxEBiMSfjI+Ry0s
	 ofpkBBq14EVdd8+fXwTyPPam7OA2OzBb+/15flkvAUKOJZC3iiXe1dTmuvEOyZrMt72sY
	 /lDoz9oVekzhxKc7/RuXnpA4SyWYkWM7ohhWoS2qXgmIW83U2pgodZcbas9BKwDvi9k2H
	 hm8HxkdUnFKP0Sj3uB2gvTokr2OccbEKh9CiocOAfxK5zonMdCxPBHCo1A3q+OXnA83g+
	 wkzhCJIwat16pMqS67D8URHAMS/4OJZjSTY8SC5QfeJq1+ZbLxoq8Mhh6YdKFjlpUBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7a48SL2J6QQ6m+cZHRMVykFklMv/YM8YuhePjmhR4UA=;
	b=rt5SIU+yeCJN2MCPli0nt6uhSIpZWMeYfWxgtooZOW/+IdBEZvVBhdQaVLtXSC3tn3g1
	 Xa/yW6FOlSEJgQTDdDxFh/c3J8VFFGuGWMs6ZvnnIClECppgRhx1lmnerMyLCD/r0dfqO
	 29fWcdPaOGbDMIZ1jyau059Cb3j4MSit23gwkSxBYLPmnQ//0GlpddQn3OD/uL9S5s/DV
	 x9o1qgMeTSl6M7qQsAv9y6OQts3WUhGgB9/xtJJKn6ZShQ4/aSKgqMskHvCp8b85tbSWP
	 3yz6qHYUV66cMgsfvNLgrjFWFVgvQYmoAJn9Vg1ME6YEHuwh2WdYroLnGp++GfcBaeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LuXZisKh;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081AD606A31B
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 23:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 081AD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LuXZisKh
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so6657166b.2
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 15:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793921128; x=1794525928; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7a48SL2J6QQ6m+cZHRMVykFklMv/YM8YuhePjmhR4UA=;
        b=LuXZisKhsAhmlrIg7yFMXBWraMnlC+63xJEZEUDYArf3+lbaY9WJOuPkLs8i3DAQXN
         epvIVbkoL03PrAI5tPI02uW3oBDW8ZbjWeDksqj2tupWS+BkMWzW9aDf5YGyROobbFyR
         ATo4xTQI6WCLRLbsaJ91eG8BpHZgqayijrfHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921128; x=1794525928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a48SL2J6QQ6m+cZHRMVykFklMv/YM8YuhePjmhR4UA=;
        b=ExxP7THjCJaxwwxPtBXE8yCiUsrKP5eO4EOQ2RiqnTBLO37Q/5dKCHOb+hS+e1ielF
         BILho3lscStjl/nCyz6C2/AvjfO9du1f+24ELoBtb2WBrGplEQjH8EFApvFxw2c+VQ4G
         T+i/Cpm4Bd/D1Y/ZPjgFPZo2USPliAQpAdju4d/WubUpQmjNWONipRH2mF3uXYj4hbFT
         lUuGY7TP3wWvabOu1q1xh/e0JeFxfkBAjbmwi9I2pHi9bAW/Qlt+vi42kkIxmvrcm+06
         Yd/UKndIaXLjvruBqebpPcdf1MVKvBNr3Oirc8kEAqqVxrPiUS+4pTteXA8rjSupAq/F
         Gekw==
X-Forwarded-Encrypted: i=1; AKwUvBxmuNNl4ibrIfSRWGy+seOHsE5tOVDeyDEmOP1vZlP8Pbv3wZulElz+FmoS8EbDHPbPPR/i@lists.linux.dev
X-Gm-Message-State: APuU4Z9skLgJTyxXQNmc6yjdsuBKDWOJLAQhXiV3+Vx7qqm1H+SoTY75
	38OFjkQkEhclcgTF/uBdZXUHbqm0bolrngXxjK/kNPoU7OrG0J+u4AtDBHbgSlJ0LbMh68RAhhj
	JU9fl0rX6
X-Gm-Gg: AYBFou2Z5I8mQzLTARMtXLDGeR9vDI11PtrJdjQYLB7HyhOGSJoHtX8VnD2kU9wXQlR
	AQJAsg0sLU0/5fk7MulZZ08OqU4uRM5gpD6h13XTTOW4D1ubgyDRi/IbUm54/iP84vgmKIILs+/
	F/4cCQ6k8MSWBKeQLG6D534tT9M0C2KidOGaN+aIe078GLO+59PAT35jdHVgjs4+Q4FQwUN50YJ
	TRqQgWb77yln28ubtWQbbwdaYhaGjK3X4tUvoOeg68w0u9k0pxlTU9mqdAR+K84AJwVlThgEHb6
	eD8sq+e6wKu7jyUIiZCrCbHQ8BxpOkPZyzPwVgjIDQ+74w3FfjERJczAZKW3gUYEHHam9EYMidS
	mJRZ9h3B7EXg4gteRXHEbzNujJhXiabgsxDXeFOeFyM7zkAG5IvGV5r9chjrUPd8TgCk61yCQyL
	v+6q3iY0JYmha1eH/a36QM3YUzEBnQdPKpfH42uKjkEiCoHTwV0RpZJx0hSu/N6p/7S9LVdmpQX
	UlaEjggeq34C2wNt2Yk3Ifte3BmAxpitTX5e74l+q/TXsJqdyXxHHNncd5VTpmM5gi9I6qzPBgC
	Q+A+LZf6NQzy3LQn94TfJ5OMMLt4IgHhJ1Tt37jAsGiAbjp/rzGT0HkhoaKmGwqcwQk=
X-Received: by 2002:a17:907:ea8a:b0:c25:504a:1e25 with SMTP id a640c23a62f3a-c4d3522a51bmr66483966b.13.1793921128277;
        Thu, 05 Nov 2026 15:25:28 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d352c31ccsm29252066b.0.2026.11.05.15.25.27
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:25:28 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so6655666b.2
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 15:25:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzFn+4OV9Ee9U/g9NX9MCEEfdTjRBGiO8xmjWBiXDooMum8+UZL3wszrwks3P9t9pCscx7O@lists.linux.dev
X-Received: by 2002:a05:600c:4e14:b0:4a9:18f4:925e with SMTP id
 5b1f17b1804b1-4b6df8c9443mr8848245e9.18.1793920627925; Thu, 05 Nov 2026
 15:17:07 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com> <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 15:16:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
X-Gm-Features: AclHuK979bKOyfBMwiTt2PX8WJCz_unHupEnRKfbNiYMNWMSzKi0DQ3cEAIAtrs
Message-ID: <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> > While I haven't looked into this specific bug yet and am unsure if it
> > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > to disable Profi for now.
>
> Interesting. I can suggest that to the team digging into it and see if
> it solves the problem. My AI agent says it will though. It claims that
> the default flipped recently and "-fno-sample-profile-use-profi" will
> restore the old (tested) behavior.
>
> Should I send a patch adding that flag?

I went ahead and posted the patch:

https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1=
bafce6370@changeid

Obviously that patch and this patch conflict because they touch the
same lines of code. If folks think we should still move forward with
both patches, I'm happy to rebase.


> > Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
> > reservations about adding it for the following reasons:
> > 1.  It is heuristic-based and not enabled by default. I am unsure how
> > thoroughly it has been tested, so we should assess it further before
> > enabling it.
>
> FWIW, we did find that Android seems to enable this globally across
> its userspace, which suggests it has been fairly well tested. You can
> see the change here, which landed about 1.5 years ago.
>
> https://android-review.git.corp.google.com/c/platform/build/soong/+/35242=
91
>
> A few notes:
>
> * That change _also_ adds
> "--salvage-stale-profile-max-callsites=3D2000". Internally, there has
> been debate about whether adding that would be a good idea, too.

The conclusion of the internal debate is that, yes, we should add
`--salvage-stale-profile-max-callsites=3D2000` too. So if we decide to
move forward with this patch, I'll send a v2 that adds that flag as
well. For now I'll hold off until there is consensus. :-)

-Doug

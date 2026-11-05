Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793918274;
	b=3+0lRH96tHmwrBpuRgVHucFCsDjR+QtLc/yunqDFHi2fVVRmGjLZPfHq07C1b+KKh0P9
	 28ZwqDdFdo4nP728zMm3yEJZa77UfrDh0eUh93+yEYFtU67ND+Q4tVUPqTrrprkWMptSb
	 YSeKeClzEntmi5zd4JJAk+GVklVXF+helezGNyNgC5N0o/G/eelnuRhN+jxylDt6kGOFd
	 Rah3vBkkoRV4u6SO3L0u99oyvSm3HobSOCsM8pV8+X/1xNSjj5U8v8xvqLe3UFdwPlAC0
	 MfkuYC3WdFRwyFkv/VAUhBjKLIYQ23X0LaVB9+lna/j7loIiZyOtUmLbsM1hcwr2Fmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
	b=ApFoWgkpTZ59N6NoR+9XyP+wJ3MMrk3ae6sHfs0pkiQuOh/EFrvJFnbtUuLxg8uYjuX2
	 I52s4Cl3+jPBDATh3TVJSmM2rmxyi9vD6xW6p6U0pgpVU0ye0WFbUK+8vBgGuKxUYFpSL
	 R4K+2dvo6iwhIHIrN68ZYcr/mPzjp4gRW4y0PPONuOvbjt2S48OLfkrKSG1RfOKKj+txC
	 pG52HgkeumQjtrw27BFD0r5JnGtVKfOjY9K1iPBSwUoLRzRaLwelAhS1ySFe2jYAw6b98
	 TjecXCHY3QnDJ5V584T3czWG30cbUZOW/WFIO9FcROVDSvUW1Q5JxWMWDsJWOzJa8OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5292F606A326
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 22:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5292F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4f540ebso33072f8f.3
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 14:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793918273; cv=none;
        d=google.com; s=arc-20260327;
        b=gQFXlMsWynPs0xVGAaDKwMxb70LxMPAZjuxGnS9JLPOAGXXxxmKZwpyd9KEcbAIYWc
         xKoV1ZUivK6AvQqGp7nN3o7bUbpIboc843QkMkDhY3ZyzDKKmikTsIqAKyknRumfD53N
         32hCqyxh7OSDCKH/Ps+olB1v27lGU/Tan4+55+DZ9mYEXxIEJDUPAWgIRGTft55PfVw9
         /i8C0jToBeTsDoQb3Ik51v6N973e6yinG09Z7RB/X/rGSlj0Ih72JAlBFHJlyCVLh+7E
         i0uMTVMcf6s//Q3zU2nRsa3oY8F9MhEBUwHJs/pOiJvFJxCyEItMOLBE3W5o0jljMGKZ
         Pcsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
        fh=DiQ/b01kMFAXMF5Gs7M2JnqOwX2wpM7aBJq8WBzMMoI=;
        b=FH7cRHwMRb7te+1ppUZJCIBtpM1u4F0ybV7KeGfFs3ipNN7UaxMCvONzL1P+ddw99a
         2d/89kSt98J1oOMZmkNx00SgL3sViRgzfqTQv7aP4v4XeWH0pUMixpacIAhUKUgCqqzN
         LNvJ3S8g4tBYtOluZZCj5oYl7ZtOcIpX/hnq30x1T3q2NGs3GhV8hmLRq6U4y1Xa2lGb
         8DeX9NbeStK4pbt+yicmO9Q7hh7NujObwliSH4tytgo9owrA8/90daQJStg/jvchjpes
         HrRGX9sYpTbNjBHjEwgysFBOmXKpU/ZM1fnFicNAxeU2OcdMcmRiYxHXBZTn7DM+yeYb
         AoRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793918273; x=1794523073; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
        b=KymQyxHY67Yq9t5q+PsudHyh5mvZmrMuadGb2rsXxn7RQkv1PabAl8XGVlm+C1Sl5A
         KjM0QEYtC4fe8DE6v123IVoceKULkxyz4gBi/QQAi25GCmcF26uEfYjpqPYv2mkMRP1U
         zDfGgWCovtbcbGlvo79YRScNKk3T8nPFCnyyLSL9SltttxV3jdA2+GaDDwAp3V0muYRx
         D2lDEIwdYp824H/FDnFiuXrkM4kVGknR8nXjsjonoYOREnICTlCcvyjwmSgRMCSgHnEr
         Ci3doCUGySgBKamYjvHYWTl6+1dCjFCpVnShD6xRq9QUe+4TLjG3rVRedvvvH5q6jVW/
         jCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793918273; x=1794523073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
        b=BOOSoFp69yY09NRhFIlfnII75czjjrvDpsnWcXsDBuSwmOfRSAQTkR8GMURUD+eSEZ
         LLzvEvtLHx9JuuLBxYvaqjPEWoAKlXowMzQPzYufVw0kArDfeW6oDpc3OJwF5UO4d0m8
         daA9IoNCMYiODk6Wn+pdjeEKrP9MgeccfWQz0zQeilpH4v+fviv6/xdufWaQJ9NlTiBW
         Z9Aq/p2F6VNnsx9aL4+692Z4P4pbWBrcGHZo5m+hc2Tp5n8S6OqXUKFtd6f9AaBxHR7B
         0fn+C7tzJjA0pUKcEaq3HoBdgOzjoKKbmnRO56C4kIh0fCM+oMp7JLH5IYymlch22rbK
         cFlg==
X-Forwarded-Encrypted: i=1; AKwUvBww9ZMgsGN6OroecTqb6+Foo8mQjYrtJi3hcIl7JgrRyL4kBQVca/wxSb/w1VA6zqHQHJnv@lists.linux.dev
X-Gm-Message-State: APuU4Z/ClUITMGN/iToHT0yOu9W0ngXXiRxa5sXC7Qzs1IiZrjqHv3n4
	A45LpZ8OB9YiZKWcSdGrGHsvafLTewOpn9fRIT7u2ew8NuP6b8MUYPRwsht0pFGAkwyEwXqM3EK
	rSKLpjnn5xkJUe3gfdRXUvJvwptY8jALkB9WbnlmX
X-Gm-Gg: AYBFou2at8gnBS5UBzEFGNTxHx8+O2rxMCA53XKtH6ChvaFd22MdrcDaNo7d8dc/mOo
	pvtXw1JcKVPguFMaGNU7Aui1eijcDRL/WYDDZgRqavCDdGRC2QiubrCl+a8D0f1gGn/x3LJTmoG
	gFiTuXTCvzswMww4R+Y2JYe3JaiRhkZNb6EVaFPUdha1GRRQMratvYFlb9gUln2/JAVRSPB/pr/
	zRjgSMktZSnlWMR7030v0ERzE7OyqtXO3lCW+uOOaBMBGop+abqKJ93KKijobn9bN1WnZ74mTo1
	ZER3RtdwqlG+otjXroC6HmLusEn8SLkQKf9l6LobsBuYgrYweIL1/Jwt0DAdeHYlcQgkagQmVPm
	rCfGKx9ja3zzrHyWlFzFqdALVD2WowC3FDz1Pa4EgRpn5nD0Up0JYBKrenZVGLMMNzEMI2XC2O9
	eaSWiMrVwOqN+HdzTIh/Y5+ap87A70O0XLEYInrOXZUu0MeCBTbXp6/VA3H+QrWLAS40JvLRm1/
	TOwztFDQdFNKWPWMX+ZhD25UsMELHh4Nlcw
X-Received: by 2002:a05:6000:25ea:b0:48d:f39b:83de with SMTP id
 ffacd0b85a97d-492732dc7edmr1852328f8f.3.1793918272221; Thu, 05 Nov 2026
 14:37:52 -0800 (PST)
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
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 14:37:41 -0800
X-Gm-Features: AclHuK8wUx6mjaq5nmDzGyrOyknjILFX8cjQ_WCJLMf8UUGbwiTYmUffT-QGEo8
Message-ID: <CAKwvOdkRAB7QUApoYyKU456GF3bY67PKqQRfbtmW1gcFbpAFGQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>
Cc: Rong Xu <xur@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Yi Kong <yikong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > 2.  The recommended usage model for kernel AutoFDO (as documented) is
> > to use the same source. While it might help in an iterative build
> > model, I don't see a strong reason to use it if there is no source
> > drift.
>
> Hmmm. I guess in the purist sense we'd want the AudoFDO profile to be
> for the exact source. ...but from my experience, that's not what
> happens in reality. If nothing else, developers locally working on the

Right. Rong's recommendation makes sense from a google3 perspective
(who I suspect is continuously regenerating profile data), but isn't
feasible for Android or ChromeOS (who are not).

> kernel still want to keep the AutoFDO optimizations so they're testing
> as close to what's in the field as possible. However, the act of
> working on the kernel will touch _some_ of the source. Keeping AFDO
> working as much as possible seems nice to me. Of course, I'm by no
> means an AutoFDO expert and mostly just got dragged into this issue,
> so happy to defer to the experts. ;-)
>
> -Doug



--=20
Thanks,
~Nick Desaulniers

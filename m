Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914906;
	b=GQ+k6nVvSzUAKAFumR2bD99IJH1sGcba4sZKNnTeYJt+A+XDxBKe1S1MJ2+SI3I7YYw3
	 7I95QVPpAYHW9I5gvwZBZnRu92FX+fl/+2brrMHZE0ZjPOb5cvEmddcOgkACratfqxI52
	 Ajr6MVe4AhSIjKEqhgTDGCL9SGNKAP7ZEOwAso/AnRhgeYT+IXFzcggOOA9AZro+lI9+1
	 CxXr3j1Iti3gK/qBylmKQvnF9RgLE6qTtm1HHmX4ePNCydyut3l6fX2k7WwE3OSgYsVn/
	 sWqHDcK2TrCOuHZ7Mt5HnQ9BcEfUnOEdO3eIDFcz2ZDy4q6mTYxPB+xoAMW04/9+ADQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=s4SrHx4NDmSwFFwnd47qpoIo5tq1c/z5dpWsYBRL0Ro=;
	b=wKc2SO/AgeqRvmmvbX1g7aMzLrHXFVdHOP4PKuU1SPHWhjtMr6Lg7fvZ9LscCVVpM/70
	 Nu3n9G1BK/dTMsClsWkBE1uAUws1IjV6xwDNOk+NqEPg7q+QNZHXnD7yLFtXlTfTphlwk
	 xwDbrwK9D0G7yjwPOStUQtkShH+OZPj9nVqk+uW02x2Jc2hx6Te3dZk47L8nQVR1BZ520
	 AP6XnApK1zjxqgk8MQdz8A/CHDj315tyEyDIfskwWb0sC5Zc/9EA1JSMGKLv1Gj3jWoza
	 ojGqlvOg9GeIhseJduQf1Asoi8FgjLFk5wcIqiFAiwJxa3+LgRohxlKYqVb4Z2a4jew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TaygoTah;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB69606A32E
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 21:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB69606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=TaygoTah
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so233031a12.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 13:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793914905; x=1794519705; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4SrHx4NDmSwFFwnd47qpoIo5tq1c/z5dpWsYBRL0Ro=;
        b=TaygoTahExSZoty4QOQuAJ6o/yD/3LZ87FFgP4Vwq41+ErGEgj2ZuZcEFF90OL9tgf
         7NzKQpcoJLJFzYxmP9NgDs7PdnnwcBgQbiXQuxG+nvFceIH54qABRC/kIlzPOgPHDYNE
         g+UqeoAQoqkYDm9gUc33EEpl9OC/l7fRC3gGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914905; x=1794519705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4SrHx4NDmSwFFwnd47qpoIo5tq1c/z5dpWsYBRL0Ro=;
        b=SSKv2mqBppfZTAh0WW7IM2FFakKfmaIjYatgIy28+AwOSau3zIbTaSR88Mvn97VnZ7
         PqbnYVjILI0uEZAtUVkYhuoJXR28vJPRL3B1gSqHM18XsB5rA2wd7xP5WO6oHg6zFtBQ
         kOyDMHCp4OGKCKecF5ALWSbSYUtIIoVbyC3eIy1auFftl6UA8npUTYs77csi6KV6PsbT
         YmejTxSAIc7r60InxtUZKPPZfws5UJ+UKi3I/V9tyzuQL5TkG77frjxd+lQKOLUrMj5t
         xB4i/npOaxomPWyPpYXcx8auiwdc6MtarxwW7979MKz8bFX3OTqF89Sk85HK9jT9d5U2
         wF/w==
X-Gm-Message-State: APuU4Z9+83p18XjlGpWKX3FDgnDGU96XqHLvMvS7+VGX7bkZ8obIuCpU
	/j1x8tqGWomveQ9rQ4mH76EM8PRfB6Uzr4q/wWYn2/JsvVs+YEgUakW/0WK4xGcXFZCdZvW1CsV
	qipfCyDGk
X-Gm-Gg: AYBFou1SUsB1o3O/9yL3W6SlHcm3AFyAa0/kB+2Rj6uD63oFxZ3+ZHw3ulYJ7jNaplt
	a+xog6ackCV6LJca6+vtdWXSdePYlGYtrQkp4rG74d+a4qk9u/PqKfjB07LMvuzKxTPcJQwJdDt
	JjsHshaiwom6KoSSPCkqHAkAtIjQw4z4qmfK5S7HK454h1mWCSYzD0fx3XqH1FOvedRW6WwS76q
	jD32gt3Vel6ICbuvqedjlnlsLTEDyOlfyEfXJZYgPfbxwZmVwsZWpbkQ4DYCaYS/5CCrkmDPjcM
	MBun0sLIDi48lum8aNnsZnSmT5d46XQ1xkmD9a5k7+vL32uPzYt/nx+Mcv/MsYsDsoHuiU1NzMV
	MJto3yy1yJRZmDgaLmqiXitQNbVO2EKUgmWUSAkHptPyh1/1WP6Pt0J9qmR6CETkIUIoUnsFYUN
	OnnmypIyNr+mMIA51z8tCW7AI5ER5o5fYlATzAkJ2U4vttjLn8cT7OCunyEzqxZL+N01uJonSV4
	kvUn2c5ycTKFXe2LpYHCaC30Imm26MK5yiNo1yyQpSvnVkJEioyY4wGDzc9iYG3qqWRsBgMi3FK
	DWDONvxmLo0Fw/M+E2fHphs7Qlx70l/qPPNtgu2OK5tF+Ta4wpjJvwMW+DmFz7moZvc=
X-Received: by 2002:a17:907:d22:b0:c3e:d2c7:c530 with SMTP id a640c23a62f3a-c4d3546a930mr56102366b.12.1793914904608;
        Thu, 05 Nov 2026 13:41:44 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac7ecsm20014666b.6.2026.11.05.13.41.44
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:41:44 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3587718a12.2
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 13:41:44 -0800 (PST)
X-Received: by 2002:a05:6000:385:b0:492:b1c5:6db4 with SMTP id
 ffacd0b85a97d-492b1c56de6mr417579f8f.26.1793914590008; Thu, 05 Nov 2026
 13:36:30 -0800 (PST)
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
 <CANiq72==m058rRQfZTLSsSSSRhNLgSEkLnREmAo=52Vj70yWdg@mail.gmail.com>
In-Reply-To: <CANiq72==m058rRQfZTLSsSSSRhNLgSEkLnREmAo=52Vj70yWdg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 13:36:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XbBPOmuHZBuQVPQeA876CA7y79rGc4SL43e+At2+nMMw@mail.gmail.com>
X-Gm-Features: AclHuK_BAv4LnN1aXcM3KqfNxo3MqIMIcKw4DlHvuup3PEDMGIp0DVrOUgx1RpA
Message-ID: <CAD=FV=XbBPOmuHZBuQVPQeA876CA7y79rGc4SL43e+At2+nMMw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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

On Thu, Nov 5, 2026 at 11:47=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Nov 5, 2026 at 2:46=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> >
> > Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> > since LLVM 17) for C, Rust, and ThinLTO builds when
>
> > +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-salvage-stale-profile
>
> I double-checked that the flag was introduced in LLVM 17 as the cover
> letter mentions, and so it is likely fine given the Rust 1.85.0
> compiler (i.e. our minimum) supports LLVM 18 as the minimum major
> version, but if the patch goes ahead in the end, then we should make
> sure it works well with that one (or probably you already did, in
> which case, please ignore this!).

I haven't extensively tested the behavior across many versions of
rust. If you are worried, I guess we could remove the rustflags part
of the change? ...or, of course, we could just fully drop this patch
(and maybe add `-fno-sample-profile-use-profi` instead) ?

-Doug

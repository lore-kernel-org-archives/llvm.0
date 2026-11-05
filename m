Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919282;
	b=SddxCZK1ZpOwfeHnKzy1uzzVw6+myVUUkkPN9PunfE1Z8OY9G0ZXG+SOHAePpf8Cm/V7
	 96/gunBq1nyTt0pcjcpdpJJx4K/r6CWkuYiCMwg7Grsxt6FkDX9Lx09TAWOTpIncX0OwL
	 5vhnaCKoOOP/jkBMWuSZHTD7groqvjIWPHKjRLHF0EyZwGZ+Lwe7WtmZO8hT5TJAVEA67
	 3JPG3FZsl0UMvXdoTA3V99547nEztq8T4yUTcNmu6l1cw+dgc5IWfHORr+Vm+JpDE1+1b
	 4LSaYkHHkhAdrK/WPTd5+bIRmD9yIJ0oc2U03kPeIQy1TcUhsP/PrMbypEXJU+vBRrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WotC0SC+byrPPXJl6m1kLGnVJbE6lPSdMSYkFBTw4wY=;
	b=Kbn8ibMQJF3hbLKfdfQfhhhw5QFGAWVoCho/1odR5agq/2m+3FNsW8ilisUw2QSR6qff
	 Se2ztbTdpdV+URNDuZMeqFdF42T9MwVG59a9PQ8vi2dSKeENLIVO8jL/XffSJ61gL5sgQ
	 r6nKfiNNVoGkXJQVxlKAemqYCRgCuuM/RhfbszY7amdaDgJJfJvpZy+PTDaQ/EvtyddLc
	 VM3jZL8lD4GhJmRuKhRP94Dmvi/OWYlVSl7Yv8MX36l1Z0ialwlngNAJ78ZnuJ/AGam1c
	 8rM8L0BA9qpNhCImkt5LUO1/QR3Nxt3oz91sfVLcNVxcpeQM7mSv6z7oilV3mqO8DTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B5A0uB8k;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E63606A31B
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 22:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67E63606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B5A0uB8k
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c45551fa84eso3921566b.3
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 14:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793919280; x=1794524080; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WotC0SC+byrPPXJl6m1kLGnVJbE6lPSdMSYkFBTw4wY=;
        b=B5A0uB8kbeiRT/PvOgTqGtj98mibm4Hk4rSgew567DevnWr5x4/13BUNim83bjMGqa
         A3p56qxHt66mFseIh4zqL03sUcAiOALigKvNeAFVEhh2G4GzEc79589LYkRV/xmk+srP
         AQoU/UWyVlfTcwE1YrHgjJGExzFO6+jbheITw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919280; x=1794524080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WotC0SC+byrPPXJl6m1kLGnVJbE6lPSdMSYkFBTw4wY=;
        b=TvkQSWdvrz0PKx5YCuaCjwyg/2EGS5i+47ko8LFdm8Kjsq6H+pwnnTvI3bXiG4Adpy
         tRlszaVCwikmPT2JTAaGE710xuEuzz1ssR70stCjvaLMe2y1uUFI9JyCavXteyNRLBzs
         pTNCYiPgQbR7/5OZQ1xNrbnK4QzDmsKsk3ksDIN+MUYKUf8Oh7m7uQ3Y27N8qMPxfpI+
         EY0QjGqc9Nk42N5G6h9dke2oHLcX5d2Ts8tOlt14pvl4iAjehtiy+syFoXEMDLBHPQX/
         VASzIToOhEELR+WlB8lC98ct1tRqjNy3XpAVb2QuEt5f/S96M8eUFHoaYcy6pzdj6QmL
         DqRw==
X-Forwarded-Encrypted: i=1; AKwUvBwNPGnmXYaX7GjeSqTHoa+GPEkJl/Ykb/0GjuOpAgvURqdLYnMbFZTFWEK0SfP7DgrymMoX@lists.linux.dev
X-Gm-Message-State: APuU4Z8Yr7EgxdLPIeWewSX6PsJwnZHLGygY7+RM1iJdMKq25ustGD3S
	oWkVWtHTCAg/MTJAmvViKn0ilJc9Fu+n7m9TxZX7Xl/3WYSLrDj/tIvP92YhRRLt3G9f2WhcGfs
	JCiwF/2o7
X-Gm-Gg: AYBFou1M0IZ85Aw0hJzPo9EIY8e9p5pkV7SkWmjZUkWOSL+8RQwJ6B92BWb6XJgGkI9
	xm3Z45arpSCPtaQ21SAW9/aCGfUmrUqgIwkJ+e0aUqxIoNTaigYououd3wqw2kRkm9mTveqE1VB
	sDEmDjeTkm1b4btX/u2hA/2fGJbzC2vg6X5ja4jAGlPRapDBIJghzzCSKTrRvnQEi7XvGCZTV7L
	nc46Rzua9CrLRJLpjHR5hjbjVvjL/38QbAZojAsQcIDbkbySVoGjUHjUQV9C1Aas3BVtPIhiOii
	ArdLsFTNZCwQzqjqHOaQjVc/AXiH614KwkOrtA4bZsZxCrioQ1Lk7jNyz9YSJQmeNC3Iq/YJFBb
	a1H7eYvGAkveqIAe9IwYRX7h9gFB8402fDz0wOgVHrCVi3rVWPNghMbDNtbbGcXB+a9s3MrTW/C
	DcQ4U36Wo75bHpKWGfDwl6tG/YEZ5I5sD4FFjwTwswAP890R4NoLYYKBtBcYG8NCwbPGIrgeE+R
	NWRaLryHFgmYL5lcc3qHVaCviPp26XbgfqpmOrqvWaz7N95U69vUiSnKjUVgJK17Il3m3BrFTiX
	Yxu3/15uZhYOnXb7BF9mmMVzRbw7oV5klDriJPFT8hMJUDRce/gNb2zWAzUEHePuTjI=
X-Received: by 2002:a17:906:4fd1:b0:c31:91f9:60b7 with SMTP id a640c23a62f3a-c4d3556b18dmr60793766b.34.1793919279759;
        Thu, 05 Nov 2026 14:54:39 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d35670910sm24604866b.40.2026.11.05.14.54.39
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 14:54:39 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so361005e9.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 14:54:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxNoJb+/R2i8FHSzkOy2BazWaE5fFNWe3UPvckjwv+pVvslFd+wHYW2Kct0LCH99xhTA/yu@lists.linux.dev
X-Received: by 2002:a05:600c:c4a4:b0:4a1:f736:79f3 with SMTP id
 5b1f17b1804b1-4b6de4a7678mr7775055e9.5.1793919278293; Thu, 05 Nov 2026
 14:54:38 -0800 (PST)
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
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
 <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com> <CAKwvOdkNvYz7mSmfQzWuFd7FZEUyZkH0L2tfPSbouE0J2w=b1g@mail.gmail.com>
In-Reply-To: <CAKwvOdkNvYz7mSmfQzWuFd7FZEUyZkH0L2tfPSbouE0J2w=b1g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 14:54:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UW26c_28wcZeHkZbwwfV6-r6YTzi4BcBmJTJXzCvygBg@mail.gmail.com>
X-Gm-Features: AclHuK_Ffzk__3YGh5Ruw9BKABV7G_tKL1f1gc3qp3lqSWqolrpj8eHeMy1suUo
Message-ID: <CAD=FV=UW26c_28wcZeHkZbwwfV6-r6YTzi4BcBmJTJXzCvygBg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Nick Desaulniers <ndesaulniers@google.com>
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
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 5, 2026 at 2:40=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> > >
> > > The issue you mentioned regarding excessive time in applyFlowInferenc=
e
> > > comes from Profi.
> > >
> > > The AutoFDO implementation used in the kernel is FS-AFDO (which uses
> > > FS discriminators). There are known issues when using Profi with
> > > FS-AFDO; enabling Profi actually degrades performance compared to
> > > original profile propagation. When we tested and worked on AutoFDO fo=
r
> > > the kernel, we did not enable Profi.
> > >
> > > While I haven't looked into this specific bug yet and am unsure if it
> > > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > > to disable Profi for now.
> >
> > Interesting. I can suggest that to the team digging into it and see if
> > it solves the problem. My AI agent says it will though. It claims that
> > the default flipped recently and "-fno-sample-profile-use-profi" will
>
> I wonder who flipped the default? Perhaps they're not aware of _all_
> of the existing users of AutoFDO, such as the Linux kernel.

I've been preparing a patch to add -fno-sample-profile-use-profi. As
part of that, my commit message will include this:

Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
automatically passes -mllvm -sample-profile-use-profi whenever
-fprofile-sample-use is specified, enabling LLVM's flow-based profile
inference algorithm (Profi) by default.

Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef25=
522aa17c2a71003
[1]

-Doug

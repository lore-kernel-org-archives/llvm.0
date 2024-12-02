Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BD31DB922
	for <llvm@lists.linux.dev>; Mon,  2 Dec 2024 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733160386; cv=none; b=evu7bDJp5hxSrSBuFDfpqh4QaVL/ObUmAhqP6GWxlI30RxgdlVV6Qyj8J64EV/lgCOt5cNoj/QIip34jV2DgE38SP0ojrf8VuMUUpAthSNRzj4lq4Cr9oXruJLB3ukSFcSFOioBAD5rnGJzVROrnHZ13XmElTp0yyMYBq7+pZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733160386; c=relaxed/simple;
	bh=ae8KEDqDkL/cV/eSqqI5LQ5Sz4A4iJSDek5yer/4mas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXLkMIObulnS1OovNB3IcWYH/FlqCoJoZpBTCjZW/V1bsUQc211/VYYKVfmtAMprgOmBq3ujQW9suztbDRUJwtuwYLb9CEcnZNfr0dh5ElYM4WwLKdGDYPJaLhFS9fVegbQ3Ot7Xev9l408yntIg0lc0y8n4L4bRQ8w6EUwon5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fE/NxA94; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fE/NxA94"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-724d8422f37so3694114b3a.2
        for <llvm@lists.linux.dev>; Mon, 02 Dec 2024 09:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733160384; x=1733765184; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hQBhvBNYSI1fNvIhGqfRe5QD/yRE1BVFAKx554DMguU=;
        b=fE/NxA94+kS1hlB356hfxX2/QM24pOEWdoYRjq8hh98PeRSiQteNI7gORisI8c9HiE
         tMGGStim0poDR46ipX6pi0X33x8BTa4b9wSDDF8+h/bqxcy1zW9VCHZ4KfMUDJLDa1J0
         hZ/BI0I4n+AqmqjOzXdazFKsrmaNC7frm6u3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160384; x=1733765184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQBhvBNYSI1fNvIhGqfRe5QD/yRE1BVFAKx554DMguU=;
        b=bWf9ZVW0myYwV4mMsmSp6e1dSiYSiBzFljC6tsW3a85l8NdiCQqX4mUvFeqwLgHwcO
         XweOUmKquqH9BZ5XCzzLClfF7FemCv1d2rZkto0SpklMhfhRC8MGyYej42CtoyAKPBtI
         2vk4USdWZwEGYmGFctM3MO/CWS09HIRIxkmEqasHQFivSWsxIPwUWXjP0/127aDPnsqd
         AvMCoeTYb5hX1NKd/ceEvhCD8ZK3P4irjipd+7iVW/Ao57sig0I1YemNn4vxOhizP2S2
         WKH64saEM04aluJoYjf1zHLV7hUZ3J4Ae9L935jRvvn32rsc/wYbIEb8D+8kc6WK7RXM
         zg/w==
X-Forwarded-Encrypted: i=1; AJvYcCXNj7E6jaJ1bVKjh0j6x2YMX6IsUT3gT1x9jC6DZu+9QdSb8XEBMhVmhYw25/tFYSzMKw6M@lists.linux.dev
X-Gm-Message-State: AOJu0YxxZGKhWJaGyaCDlgldJrFtN2+ArwaiWh5wabk08+EujK5Xcque
	3bw7jrC2t5bkyzqydsdqyuX1wF0wX+q1v+weDaFnVMRSYtLkCLs/qnvGCZXlp7m34gCROEvbDls
	=
X-Gm-Gg: ASbGncvuOE6rwlLW5F+jU2ruAmGc+raEfjvAdOVdZms1Hm/x2RPCZ+a+pAHIMEdMrHS
	rOVe21Zllt96QRw2s3UrDq6BOJDnrn56WKONiP2TzDGSEMdWbblkhZhvFcA7Xnp3yqSDIJr2Vd4
	+N2a3UUdhkzzhhLQ/ioyWuVKqxo/iXiKQDlQ+jbzI4WJarDezuL0nZ2xnya4NXVivzzIjF/Y7mI
	hAK88mxc9byttPa5Gb+8MFVsvIfYncwjMFUQo0SlYQP5/tZ4YYEnLwxiZOxLTeC9/wYcMm3UEak
	MWP7I0qMMZWTfFEc
X-Google-Smtp-Source: AGHT+IFaMQMJzIbSCZLw+/OtUwru8251gGhHAQUvzBiDciHIrZg7Vr6eCXpUNzJhIS0hjNXcqS00WA==
X-Received: by 2002:a17:902:f60f:b0:215:30d1:36f7 with SMTP id d9443c01a7336-21530d13a51mr260939565ad.44.1733160383777;
        Mon, 02 Dec 2024 09:26:23 -0800 (PST)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com. [209.85.214.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215b0887f58sm4642665ad.208.2024.12.02.09.26.20
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:26:22 -0800 (PST)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21578cfad81so13153075ad.3
        for <llvm@lists.linux.dev>; Mon, 02 Dec 2024 09:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOSvbh8iJkfaLpcw9Qyrgxvb/hDRwW4EfZNtf6le036j4YT4J0VHwHDGXu+L10C0pz0GPt@lists.linux.dev
X-Received: by 2002:a17:902:e5d0:b0:215:5a53:eded with SMTP id
 d9443c01a7336-2155a53eff1mr163851165ad.39.1733160379613; Mon, 02 Dec 2024
 09:26:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org> <20241202162454.GA2848026@thelio-3990X>
In-Reply-To: <20241202162454.GA2848026@thelio-3990X>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Dec 2024 18:26:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCu+gJb5aTywEnGDQUJYws++9x=be5QLsdSUqS=XjFZGnQ@mail.gmail.com>
Message-ID: <CANiDSCu+gJb5aTywEnGDQUJYws++9x=be5QLsdSUqS=XjFZGnQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: mediatek: vcodec: Workaround a compiler warning
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi


On Mon, 2 Dec 2024 at 17:25, Nathan Chancellor <nathan@kernel.org> wrote:
>
>  Mon, Dec 02, 2024 at 03:47:17PM +0000, Ricardo Ribalda wrote:
> > llvm identifies that the SCP_IPI_VENC_H264 and IPI_VENC_H264 are from
> > the same enum type, but their are part of the same ternary operator.
> >
> > vpu_inst.id is of type int, so we can just rewrite a bit the code and
> > avoid the following llvm9 warning:
>
> LLVM 19, not LLVM 9, as the minimum version for building the kernel is
> LLVM 13.
>
> > drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: warning: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Wenum-compare-conditional]
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> FYI, Arnd basically sent the same patch October 18 but I guess it has
> not been picked up?
>
> https://lore.kernel.org/20241018152127.3958436-1-arnd@kernel.org/
>
> Hopefully the new media committers model will help patches like that get
> picked up in a more timely manner.

We can take Arnd's patch.

Yeah, this is the kind of patches that the multi committers can really
help with :)

>
> > ---
> >  drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > index f8145998fcaf..4786062e879a 100644
> > --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> > @@ -584,7 +584,6 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
> >
> >  static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
> >  {
> > -     const bool is_ext = MTK_ENC_CTX_IS_EXT(ctx);
> >       int ret = 0;
> >       struct venc_h264_inst *inst;
> >
> > @@ -594,7 +593,10 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
> >
> >       inst->ctx = ctx;
> >       inst->vpu_inst.ctx = ctx;
> > -     inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> > +     if (MTK_ENC_CTX_IS_EXT(ctx))
> > +             inst->vpu_inst.id = SCP_IPI_VENC_H264;
> > +     else
> > +             inst->vpu_inst.id = IPI_VENC_H264;
> >       inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
> >
> >       ret = vpu_enc_init(&inst->vpu_inst);
> >
> > --
> > 2.47.0.338.g60cca15819-goog
> >



--
Ricardo Ribalda

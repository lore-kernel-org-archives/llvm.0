Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0EF1BF7F9
	for <llvm@lists.linux.dev>; Thu, 12 Sep 2024 21:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726177147; cv=none; b=igj9eHPPruyeonorg/lTq7wkVTT8/88/G06zhK87/IhS9NtcyuVcERGl8G98GTowaVGG2cloQ5ULolf/NWlVucFTgYG+MMgGIo9L5SBo8Yc+/EColqTqwvkdvuK05Ex8TfJK0a9tIZkm6oa2dJ74oqHUcEgxxisdVs263luqp00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726177147; c=relaxed/simple;
	bh=4Z3y2ExjN+sfTTdyRG0DobCkSSROnQTal3/BbxZMT9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmIksZnFXA10Qlk+o/b8cu76oC5IVCfngafQ3gMd/9XvjBMPkKyW4lKxLM06JAC4QgoowK+AQrWRAAOnu6BfuocxFPaBjckZLLE7nCbsZByoToFS3+2sRsmlGVvHKVgd+mEk3fBhOWYXYO610b/kqYjLEvDBLKTgwXKWcuUTJns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fQDxpV5U; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fQDxpV5U"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-49bd45cfe38so497086137.1
        for <llvm@lists.linux.dev>; Thu, 12 Sep 2024 14:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726177145; x=1726781945; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnUGUKViCW+3BbsFSQi1k9zreDMxoTLJCm+OUAY9KGo=;
        b=fQDxpV5Uk7lVXyMpl1koRS2OpCIjMceMCY5NtGCkzOneAMMe5oaqMkcVAM/+WGduof
         Zsj5KCa8LimiKn1VLOLGKRmvT8AicKGmQ7muHlh2p+l83qVEJuSMKoA5w5rraMB683dm
         lWf2492DcE4Y4izraSeqS8I87Mc7tt+QNpfSJbAEPBX2VevjXZDHnVmEU0D+TQbOxXID
         zhlIO9qSAwnYU+kDnQFsx5+npUvivZL8eoH0nlXGC0qVyqB7nvDL1xNCmND2sR/PaNgR
         Ukesg+rYVCVgt0FvrMKU80NDFKuJ6sLuygVM5EUUF+/QRfIFg4bVnd4KXF1jGtn4A+og
         wJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726177145; x=1726781945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnUGUKViCW+3BbsFSQi1k9zreDMxoTLJCm+OUAY9KGo=;
        b=Jp91+WHZVxWWUeFH8UC4pLWc5VLgV7EC/hdVBf5DIg2dct23jM7gHt5d6AiNliXLEo
         maw98u03rRgM7I18st7pmD/vkMTGlWa4LD1GYknGLnSvkTGsm9ciBkkTm4AqXmikmOMp
         8o47atoFrwa8/gYqe2pKdHup6+KmIL1FGYWSJgNWBURoGc7UEquVUWKPfLm0mve0+Dvp
         cSzK224tfTi7przZhGrepDtOxU6xJjhOAUoM8VEIRKE6kyx4eFr3jFczzxfhYNDEPhw9
         twnQJl/Zrfjr2D+OfE3JhWdqRXCblGvgzDry10SPfk14C6LyhJ1/6V6n0jkXZd2WQMhB
         2I4A==
X-Forwarded-Encrypted: i=1; AJvYcCUYTlR4Lu8GifGeG9Itj/TselYlFt6zne++hkWzV1AreinZQXqC+rG88WjQ9AVC35/dQHlf@lists.linux.dev
X-Gm-Message-State: AOJu0YzZiAVfce+DBXHEAV4fa/7rOnnESKzTFgF+kj/QUR1bZjigxt8/
	Lpf/+T/i2DR/1IiiZf/2JbrlWsx3kZoTijvZqyxEWLZ+oA1epl7ldXriDhb/is6P4+Y1iGbcvv0
	jzeEIQPMhplW9Julnhw8DgbAZeYqzMNE8FkiE
X-Google-Smtp-Source: AGHT+IE9lzQsVM3OtKM1DDO5bp6YhBv9ztTqMYR0Z4axeHZ0pxVhuPDcMiTJqM5GQZoQwIGD5+xxoKWGH0xp0FCEwsY=
X-Received: by 2002:a05:6102:3750:b0:494:3a01:e340 with SMTP id
 ada2fe7eead31-49d4147e662mr4516160137.6.1726177144959; Thu, 12 Sep 2024
 14:39:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240912110119.2025503-1-suhui@nfschina.com>
In-Reply-To: <20240912110119.2025503-1-suhui@nfschina.com>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 12 Sep 2024 14:38:53 -0700
Message-ID: <CAFhGd8ruRrZM0Q2Z0UJdf98gKvtP64H2k08gvB_=97pWs4p8cA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: tipc: avoid possible garbage value
To: Su Hui <suhui@nfschina.com>
Cc: jmaloy@redhat.com, ying.xue@windriver.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, tuong.t.lien@dektech.com.au, 
	netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 12, 2024 at 4:01=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> Clang static checker (scan-build) warning:
> net/tipc/bcast.c:305:4:
> The expression is an uninitialized value. The computed value will also
> be garbage [core.uninitialized.Assign]
>   305 |                         (*cong_link_cnt)++;
>       |                         ^~~~~~~~~~~~~~~~~~
>
> tipc_rcast_xmit() will increase cong_link_cnt's value, but cong_link_cnt
> is uninitialized. Although it won't really cause a problem, it's better
> to fix it.

Agreed.

Reviewed-by: Justin Stitt <justinstitt@google.com>
>
> Fixes: dca4a17d24ee ("tipc: fix potential hanging after b/rcast changing"=
)
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  net/tipc/bcast.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/tipc/bcast.c b/net/tipc/bcast.c
> index 593846d25214..a3699be6a634 100644
> --- a/net/tipc/bcast.c
> +++ b/net/tipc/bcast.c
> @@ -321,7 +321,7 @@ static int tipc_mcast_send_sync(struct net *net, stru=
ct sk_buff *skb,
>         struct tipc_msg *hdr, *_hdr;
>         struct sk_buff_head tmpq;
>         struct sk_buff *_skb;
> -       u16 cong_link_cnt;
> +       u16 cong_link_cnt =3D 0;
>         int rc =3D 0;
>
>         /* Is a cluster supporting with new capabilities ? */
> --
> 2.30.2
>

Thanks
Justin

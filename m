Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531F43DD50B
	for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 11:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781783009; cv=pass; b=VhXE9a9SGAQim+dOLEKz5WvOhrF81moIjAhYDdd5wK7GVbqwyIZp/5q5BBEugaDneeyhx8NI16B67mDcOBPYbFGxKO8Tpc9Bf9DLGM4dXrHwH7TEdEdEIZf89KRCGcDvrnmndY1Od8uZwFPnaP5qprbqpiwZdAPk2AqsfJFZS3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781783009; c=relaxed/simple;
	bh=aiBMmDxUbkczn/Vb9JP5UZM5Zl61RSgtXrA/0C46Sgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skyjwmIebmef5hjpIu7GWKFCbxsRPD9Ylij6tyaKv/y4R4QtU+yQQAhiZNUoeFatcuEnXVXJu+d5dyd4G8GvRLhJg4i4Qb8YK3PtQWG/s7QFXeOv/wrETLVFmSuU6CBQUlFn3/ytYUYbXBb9vh0YrV5Fb1Ohlx0kZqAzKAOQ/CE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ownrisk.dk; spf=none smtp.mailfrom=ownrisk.dk; dkim=pass (2048-bit key) header.d=ownrisk-dk.20251104.gappssmtp.com header.i=@ownrisk-dk.20251104.gappssmtp.com header.b=EDklrMOO; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ownrisk.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ownrisk.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ownrisk-dk.20251104.gappssmtp.com header.i=@ownrisk-dk.20251104.gappssmtp.com header.b="EDklrMOO"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8db35680d0cso20008406d6.1
        for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 04:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781783006; cv=none;
        d=google.com; s=arc-20240605;
        b=ZU1ikJVbDERv0uzeMnHavdshTJz0Gr4DevxZEUwMhsr7WU7Ur+U2VTNvW8v98x5Kj2
         QUwFFuvdUMeL8HOl/byXckM5KSa69ht/OhrxPVgFM0Dvil2vqNpdH8PARVvyiPrdviOl
         WnP07MXfH2/Hzm+a8Yyo4BOmX9mo9Nw52C4vf/79agcZWbK0vln+mE7eN6eG0ZXHcufc
         HVyUXX36MEAWvccSyNz3/ndxePDpAdQnI7CyMFwlxag9cz1Jl7oRDjXRR+y6oRDHUp2j
         +mbaUOejHPtRhrGOSwXpnEVuss48qQk44orKJ7ilVkfj6QktAVB9D5acpfcJHzyLELfc
         iSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fGm6AcqnI1+bNBW3QZHl+Bh51II3lcjM0XYTu8SKeS0=;
        fh=lswEEQqY29S+M8kHrxCR+Qdkw4xLGDlSvfmZ3c9MfNI=;
        b=deW8n+9QsQxs8CoJ/Uf97uqmy6+yo8LTVUvqtoX06YXH5yTj4vViDqqqbavDErJYNX
         E0cc50xRFbCpmz2vZAtmRc08/gixgtSrc2188m5epw6OCFBc+wk0bkjNQG3MQ0WSt8HQ
         NqmYTEsNxd2ZCaK4lhjc4f1JCsyvFQagkyx21s62tPeyzSRpt79z1HHVBptBeR84KCVV
         sx0oZtXsVRZ/y53qrFpuYOvLdlGK61jKs7nQ7BGFc5bFX1LrcrCd8QRO/9nJLKzNPyko
         RXWkwsMIDlBao3/bgJNQJeFX4WI7+ISI3W1bHhxsjvjT8RFQKsOIaee/6iAvOk88nBsV
         dnKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ownrisk-dk.20251104.gappssmtp.com; s=20251104; t=1781783006; x=1782387806; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fGm6AcqnI1+bNBW3QZHl+Bh51II3lcjM0XYTu8SKeS0=;
        b=EDklrMOOFztR5hXtnIDOvS6+0TmdAdS04gMlCzbdlCu47BXF9T3it5e7hJgQXruzKt
         PFNL56xdFhZJY2RWVaHTHQSYWcoqPJ+8umtTRtvIqBdaXTzAlXof8UuIM830lxGFxY9X
         fmHNfXATdIXIyBhA4SGPHmStgOUs720VLBOs75CNBdz2HE5oQoHv/g4eQZXtjfz+k7dW
         wdrudYFExgBesa1fd840xfqaqNPyPZuW5hXUurZjNr8zKOSF7i5s70IhGHNxVTAthPqR
         bCKCLh8bu+w7iqvp5jzpz2PJchWkjOJimtHZTSTfSuWAhO8MYSj1iSBCYWDvwuc+sjO9
         Vc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781783006; x=1782387806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGm6AcqnI1+bNBW3QZHl+Bh51II3lcjM0XYTu8SKeS0=;
        b=Po2Kc38LZ2hM17XcjRDOsL3G4hywNtoZGAlU5ubLKm10WzPjp8RZD5LBdLGCD+baY4
         XA6pTgwIivlAb/FSjw/eVcOr+K0hnLhOWPEGSlQ4VAfJ0b3hTbbPtreKvRLEQMhqIiMO
         WcdXsGLS+fZnFzfjkeIQgmNwjEHayCYrAnreKOpamGoeKpULzwJLh8pmCS+tjgmysgae
         JaM/AL/3ZtFROhsn8VNtCb0YTtQiVGonNSZpgENdhGtfwkSTaVvPcUVYSdcE5Ub8r+W0
         Ij5R15zsUK7BkFdQrqv/Pdh3NqjpOzLzWFZIZ8buJLI0nuszMHQDCZRvsTbzED27zG4h
         7rUA==
X-Forwarded-Encrypted: i=1; AFNElJ8LSuiGU5O6NNly0SQM05Azcu6fUjqo84N0jHu1Yce+vNxEwO0T+0v59QQFTlgR8yUk9448@lists.linux.dev
X-Gm-Message-State: AOJu0YzmlUc0Yh3D+kgg+Lcq+6JTQ5JL11HrZiKWENmUeX0RO92N4M+v
	3Tc6JNkwewmBFB93Rvp4d2ZeYsuEqQ7KjCC0rsUpH9YBmcN5gR86XVHwfT7OUN5HI66Dam3RhvL
	E5h67t93rquYa/TKwYvlg4J2S3J3cN1aVwCRCYXx1lg==
X-Gm-Gg: AfdE7cl8J+cJb0tmt7c5vOtPB9sBOsisChnhdPopRn+R4F9KRpL8Y7R3KgW7CBbhnoo
	LS+m1h89EF9S3VJUXlMlGFaflWTl1FFWTxAt4zbp4JFe0ZIerqO1jH5RBwhTmf7ekPaYvTNP///
	Y6akHuu+507C8AFTdwjdYJ4NnuMVJYdQfhZVU/F2V3qByk/P1UP4BUeMZIOeTa0AR45Rr7chu7O
	OZkggcUN2SnRzjbSIrCGmIQMSM/JwzYjTnXqeqiJSTUmRnUmK5fR6gO4aeK2KnavedUCANNRKpE
	RwbyVFN4u0du2lTljluGjHgHThyQ
X-Received: by 2002:a05:6214:4801:b0:8db:6d7d:b587 with SMTP id
 6a1803df08f44-8dccc14dac9mr52050636d6.11.1781783005874; Thu, 18 Jun 2026
 04:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616100332.1308294-1-i.maximets@ovn.org>
In-Reply-To: <20260616100332.1308294-1-i.maximets@ovn.org>
From: Johan Thomsen <write@ownrisk.dk>
Date: Thu, 18 Jun 2026 13:43:14 +0200
X-Gm-Features: AVVi8Cf3XOkaQmP6GH0ARFvC4rsKf-fMT6mtyJYcQfTm0vSkjjtCI2heDspnweI
Message-ID: <CAKv6aAMTqSo0qSng2Kv4=i6BSvJuUy9KSfeFRYx5JsYuo9=kqQ@mail.gmail.com>
Subject: Re: [PATCH net] net: dst_metadata: fix false-positive memcpy overflow
 in tun_dst_unclone
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Johan, if you can test this one in your setup as well, that would
> be great.  Thanks.
>
>  include/net/dst_metadata.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/include/net/dst_metadata.h b/include/net/dst_metadata.h
> index 1fc2fb03ce3f..f45d1e3163f0 100644
> --- a/include/net/dst_metadata.h
> +++ b/include/net/dst_metadata.h
> @@ -164,8 +164,11 @@ static inline struct metadata_dst *tun_dst_unclone(struct sk_buff *skb)
>         if (!new_md)
>                 return ERR_PTR(-ENOMEM);
>
> -       memcpy(&new_md->u.tun_info, &md_dst->u.tun_info,
> -              sizeof(struct ip_tunnel_info) + md_size);
> +       /* Copy in two stages to keep the __counted_by happy. */
> +       new_md->u.tun_info = md_dst->u.tun_info;
> +       memcpy(ip_tunnel_info_opts(&new_md->u.tun_info),
> +              ip_tunnel_info_opts(&md_dst->u.tun_info), md_size);
> +
>  #ifdef CONFIG_DST_CACHE
>         /* Unclone the dst cache if there is one */
>         if (new_md->u.tun_info.dst_cache.cache) {

Hi Ilya,

Sure. Just stressed it for 24 hours and - I cannot trigger the bug
with this patch applied.

BR
Johan

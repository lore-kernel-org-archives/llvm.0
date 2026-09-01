Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CF5267B89
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264614; cv=none; b=KjUdJYE2/BJDnnpf59vMpn3kEeOjz7XBISNW9QAT2tEVV3agegw3Gl3NPm15QkuC3sLsXdaD/52SLAIe69xfupa0dxSSrg1xXDfgCN48aUFjgxCfQLj+TodLHWc7lCtCJlM9OXeIlqiBRhs7uj+b3Oz6+aDYW6vKARtV3FcfKrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264614; c=relaxed/simple;
	bh=pUAQhpIylhH03veS5v2pJ5187OFtExWloOWxSlrMTWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UvXeGjnvHjuHTAPOaeyDqerpSDiA9DmW4TyUdy+q9NUbEjxH8EJKkDQturim3dPgcHGTiHUUXeNRpd2Vgdsd93+att2nrMj/QfalVgHeN0jZIrBUeT6a/i/a+33Xumg05Ii2itAcKQ89SOWVvPQmTmUiFZZhj3ql4M/1kaED9u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L0WL+qMs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L0WL+qMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788264611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fwOGFXieQl813ckc/IUkjGRGe4UDJCJhqZtMy1/kp8=;
	b=L0WL+qMs21h4npjxV39ddsGKirXhBC2Cl/FZGOJIh/G5FNwtWwU95SHLrPTnhGFSJ8HsI5
	besD1hBDa6xLZ3wpkGDuLqMLFferqTRwhMiy5aYqJkNa1o4rVlYTsg3deFRy9asVXwNi+X
	u0DP9Jb7LNrfdvNDT3kv4xhZhkG7ngs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-ipdM7xpRMC-bZMVqhKiq_g-1; Tue, 01 Sept 2026 08:10:10 -0400
X-MC-Unique: ipdM7xpRMC-bZMVqhKiq_g-1
X-Mimecast-MFC-AGG-ID: ipdM7xpRMC-bZMVqhKiq_g_1788264609
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4843313047eso1830564f8f.1
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 05:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264609; x=1788869409;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8fwOGFXieQl813ckc/IUkjGRGe4UDJCJhqZtMy1/kp8=;
        b=JklrJgvVIwhk/Iw6U2tECOg/dc5s06/kycpONjQDtHy0b35zsoWmlMTvisr43EDFyC
         n44qzKX9Nn17N9JRw7A3o3vqF+a5ZuDpgc4NdxRudTZbPmkEzBSdEqTT9mgzXSBmPiYI
         b3g5S8bp2zrHUl+J/WssQA0JM9Ron8gUeZiawOJeOfDxj+0XUxDP+m3vBJiwmpZntCpb
         pOSmfNAVc39clhdntgJXNmZDPYvQZmDmPP/zcmK++Rjwka5s8CanwbcA60G2Dr2+/pRH
         zE9pGMr3wHP///cdD6Ql0pplXy1upEptFPxL8idgvNJoGP3JH3886YbJkwRPdCdGaa2l
         ZQGw==
X-Forwarded-Encrypted: i=1; AKwUvBw9T11fNO6Rxq26ppGacfDT72Emu4kn6piTnZSxGipnz0ytPIEWJaW/B5XLU/0z01gBlU//@lists.linux.dev
X-Gm-Message-State: AFuF++kkFVYDa1HXq+sez8D8GFYvn5jeZy+eL7S36cDnJDGA6Oqwd2GP
	e2DsFuiHGjMUid44bUOb7Q5E0pZ9WmTbpEwphrYCQty/f3ySbbeORa8XKZ3+efZ65nf+hDqGMwW
	Za1hGD5ZkBpWXiPYMygAVN5sE1q7lfIbc8LuUWntgvBQ+DaSZtVYTeok=
X-Gm-Gg: AYBFou3KOu0Q1FmbaW3elfEYinKyW6bMky//XnKDqvxATNQoVVSj1JDXhbjVD2OFHKb
	SJZUcdlPoQQTgdXSWP9DnN5eiV5KB5C9m/QJ1y7rOqp67Dw0bpZ/IHAplvJB5sQfgWsC8/Vgw1S
	twr/SONlNTQEOZRzaAIjTSrkC7IhiBC/1RAmEFEh4no/vm2nkVzYJ6mTgjJ47xyOvFr0YZHLvnb
	1h/dBGThKvBxmos8piwRLaHmgWFbmMj1RZ/AAEsUyWNd4Uc0TvMel04AByUK165vXl7fiJRl6/+
	1NTqkHUPE0cpO4l1Q5aLnqjlOwY67nTO3Im0jaf5YPP5YWP1GN5ti5AcJryidnGoHvjh+8tbbC6
	lnp4y/F1Z7d4dMYwlOk/aJh92cLVrb//qT0NQt6Qx78VfbMPFIa1iAuyn/Qmt/1QHGy6EFJwcFg
	==
X-Received: by 2002:a05:6000:1ac5:b0:484:3785:210e with SMTP id ffacd0b85a97d-4844103cd55mr13007013f8f.25.1788264607307;
        Tue, 01 Sep 2026 05:10:07 -0700 (PDT)
X-Received: by 2002:a05:6000:1ac5:b0:484:3785:210e with SMTP id ffacd0b85a97d-4844103cd55mr13006886f8f.25.1788264606789;
        Tue, 01 Sep 2026 05:10:06 -0700 (PDT)
Received: from [192.168.188.218] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d36e9csm4881021f8f.3.2026.09.01.05.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:10:05 -0700 (PDT)
Message-ID: <b8b6db7b-353d-4d6a-b0b6-3b5e1be22008@redhat.com>
Date: Tue, 1 Sep 2026 14:10:04 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4] bnxt_en: Bound SW TPA IDs to prevent crashes
To: Joe Damato <joe@dama.to>, netdev@vger.kernel.org,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Rukhsana Ansari <rukhsana.ansari@broadcom.com>, horms@kernel.org,
 colin.winegarden@broadcom.com, linux-kernel@vger.kernel.org,
 raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
References: <20260828190900.1767611-1-joe@dama.to>
 <1c87458d-7d76-4da4-9981-51756cef391b@redhat.com>
 <apa9qofhuatqGTra@devvm20253.cco0.facebook.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <apa9qofhuatqGTra@devvm20253.cco0.facebook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MutomltpeBAWGrJC6y7F7D3T8fOkR92iGnU_Ai464yw_1788264609
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 1:57 PM, Joe Damato wrote:
> On Tue, Sep 01, 2026 at 10:16:54AM +0200, Paolo Abeni wrote:
>> On 8/28/26 9:08 PM, Joe Damato wrote:
>>>   - Moved bp->max_tpa_roundup_size init out of the early return path and
>>>     documented that TPA is unsupported there, as suggested by Michael.
>>
>> Clashiko quite convincingly elaborates that the above is not enough:
>>
>> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260828190900.1767611-1-joe%40dama.to
>>
>> Could you please have a look?
[...]
> 3.) "The new assignment sits after the max_tpa_v2 == 0 early return, so on a P5+
> device whose firmware reports max_aggs_supported == 0, does
> bp->max_tpa_roundup_size stay 0 while BNXT_FLAG_TPA is set? ..."
> 
> Michael commented in the v3 that this is a false positive, hence why I changed
> the code from what it was in the v3 to this.

This is the comment I referred to.

AFAICS the problem is that the driver sets

	bp->dev->hw_features |= NETIF_F_LRO;

regardless of the supported capabilities, and that seams to disagree
with Michael.

/P


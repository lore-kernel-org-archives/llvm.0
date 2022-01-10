Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0EF2CA1
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 13:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641822186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pWO8bUpZLUYe86Yo5GKizn940aDxxY2uX8Eua9eNw/E=;
	b=P8VDKf7md9bsBvDsZtM031TnKTLl7el8b5jHdHXIah7mKnQxQo6kKI+LFXqt8fDk06g/tX
	2uP+VOVzObhPltjUlqRbb17iC6lbW5cuhWjxTwhiRWlZ2s8Xz/d7w1t/B8zgOIck6Tph7i
	BRRaSW3xgesCGL05CcsAKXFgCYVtP+Q=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-p5hwaESsPdSW9bzLnZC0Eg-1; Mon, 10 Jan 2022 08:43:05 -0500
X-MC-Unique: p5hwaESsPdSW9bzLnZC0Eg-1
Received: by mail-oi1-f197.google.com with SMTP id p203-20020acaf1d4000000b002c660fc9a2eso9996320oih.9
        for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 05:43:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pWO8bUpZLUYe86Yo5GKizn940aDxxY2uX8Eua9eNw/E=;
        b=GMM+efI226RJAhjKNyv1hEvOFfiuHRjJgvIXQCePWMTyW4QFzxFsvbH95GFnvQOtKp
         NtVA0ClD35jsAG81Eex9hnPKn9xbFU62FIrESbHqP63a3bFo4lU0U/vt+MrfQro3m1C+
         6lHjzDmjaE2YSs5pSp6mzUc7jL7dc5TL8p+bor6kgxk0YBTgyM2ZriKyVUTYKgPt9jx8
         O9/7pj430IlkI35e63FpBCYsOs4RE4Jtmox/4+7iVqUWHe7tabzsgQH3H2rxFkd0s5ZM
         NxkfvX7qkCaxtIUqJetviXpp5XJoJYhErDyCDaZC7m7pEQgLLkxYn4JfmwAhW+xWBl2u
         UI9g==
X-Gm-Message-State: AOAM533nQcoWE9b9QtH750euN/cl2RRaovhiszZLbXDfE35BhggXy8Lh
	XsOPGN+cCiy9euH4UFoy99nhescTu9TVa/twhQU7whPXVU1dY74pl0VF3kVqdOsnc9MaZJCetrl
	Mho/ZBkddzs4JXXvKsX+8jTN+pE8wkar8Ygb1f7IBxWDdDIfBWW+5OCJ8YZgW
X-Received: by 2002:a05:6830:4034:: with SMTP id i20mr7351290ots.243.1641822184558;
        Mon, 10 Jan 2022 05:43:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwra7ExUsBTMUvid99Z4eMEaJDEt12JpY0FwhcWLFMOignU8NPtKadY96Va2EYt/fw8qI/dxQ==
X-Received: by 2002:a05:6830:4034:: with SMTP id i20mr7351243ots.243.1641822183935;
        Mon, 10 Jan 2022 05:43:03 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id z19sm661908oid.57.2022.01.10.05.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 05:43:03 -0800 (PST)
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: fix error checking in
 mtk_mac_config()
To: Jakub Kicinski <kuba@kernel.org>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, matthias.bgg@gmail.com,
 linux@armlinux.org.uk, nathan@kernel.org, ndesaulniers@google.com,
 opensource@vdorst.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220108155003.3991055-1-trix@redhat.com>
 <20220109164333.61dc2e89@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From: Tom Rix <trix@redhat.com>
Message-ID: <f3025d42-6ff0-8880-c0e6-3ee45a8556f7@redhat.com>
Date: Mon, 10 Jan 2022 05:43:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220109164333.61dc2e89@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 1/9/22 4:43 PM, Jakub Kicinski wrote:
> On Sat,  8 Jan 2022 07:50:03 -0800 trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> Clang static analysis reports this problem
>> mtk_eth_soc.c:394:7: warning: Branch condition evaluates
>>    to a garbage value
>>                  if (err)
>>                      ^~~
>>
>> err is not initialized and only conditionally set.
>> Check err consistently with the rest of mtk_mac_config(),
>> after even possible setting.
>>
>> Fixes: 7e538372694b ("net: ethernet: mediatek: Re-add support SGMII")
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> index b67b4323cff08..a27e548488584 100644
>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> @@ -385,14 +385,16 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
>>   		       0 : mac->id;
>>   
>>   		/* Setup SGMIISYS with the determined property */
>> -		if (state->interface != PHY_INTERFACE_MODE_SGMII)
>> +		if (state->interface != PHY_INTERFACE_MODE_SGMII) {
>>   			err = mtk_sgmii_setup_mode_force(eth->sgmii, sid,
>>   							 state);
>> -		else if (phylink_autoneg_inband(mode))
>> +			if (err)
>> +				goto init_err;
>> +		} else if (phylink_autoneg_inband(mode)) {
>>   			err = mtk_sgmii_setup_mode_an(eth->sgmii, sid);
>> -
>> -		if (err)
>> -			goto init_err;
>> +			if (err)
>> +				goto init_err;
>> +		}
>>   
>>   		regmap_update_bits(eth->ethsys, ETHSYS_SYSCFG0,
>>   				   SYSCFG0_SGMII_MASK, val);
> Why not init err to 0 before the if or add an else err = 0; branch?

This is the way I would have preferred to do it but the function's 
existing error handling does it this way.

I'll respin the patch.

Tom


>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621723;
	b=wWbVgz+HULgSWhkNLcVjaSrUZqLaBe0k8GaCCUVwC5gxROvneupHUCk+bdRQ+h/KZsSt
	 aZatbgyRzqhhz7GetKQq8/SDhvt+/p+7WUgrJJclaiMUQQFFPXMAFQiszoDiu2x6OtQ/X
	 DvkpoNF5fOoM/CxcSo8SbrWurrkfTBwKzWoKVPKaVfSeKAc3L8lk3KbtLeOZx4MZR5se8
	 pnP2w6jmfdxfvTnzmtLDHbw4nteFAgrVojQgsm5IYY5d2RbdIIQhpWdHlhHktNsWX789n
	 yxh6k+IdQKzOpnh7IwITshIIqT3EeqhP0GznJ7bltHMCu1cd6oI2IgCbvE5kzEnaJpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621723;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:From:In-Reply-To:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=JBmfc2TJahlGMnvUMErDpl5CqbKG2TSTACsgzVeGXC8=;
	b=py7BJBaqfEzy/XD0Wn0VFXBQhZOKHccgNcQVHDS4wnLr5XqG2+nu7la3WYNUNm4HGLUY
	 BCD+lW2C37RT/0up07W256TrNkgUktewk9U3cADereDWsM79yvMtQs6gZJnxVIQCGE8Zi
	 xhNMbXYtrUse4xCcf7jN/kI9AjXdrAB7rcLgDOiSrIx+o+jpUP2K9+yW+bE3GzEgCadeM
	 CL9ROnT3tk+PIdaPASdqICkI8bN+XU4EKwm/QzTBYbGGFvWcUseGbeXFNygVK9q6Hivz7
	 7H7ea2St9xBAlSnzb24uPaIvZUREtEQKeBCdFVcgbu4dwJv4GQnyMdQQlPMnjkk5b0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nmep5Zxi;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE053606A337
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 15:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE053606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nmep5Zxi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795621721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JBmfc2TJahlGMnvUMErDpl5CqbKG2TSTACsgzVeGXC8=;
	b=Nmep5ZxiA356MmdZh/F+FnCO5DUcWucQaKTQMfWh+jwh2ss4Vvt365J+ud6lrRXOTMi2eZ
	QfTSRnBp3Sugjn8qgOIBC+oRLT4Z/t3DQQrYsLEWeYAGy3vWdO0SJExiHqxNAEZQrdmPGT
	7ePeITzGS56D564iMeEixEyWlrjuYF8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-yjETsu6YOMic1DFzys1vog-1; Wed, 25 Nov 2026 15:48:39 +0000
X-MC-Unique: yjETsu6YOMic1DFzys1vog-1
X-Mimecast-MFC-AGG-ID: yjETsu6YOMic1DFzys1vog_1795621718
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a799d93bc3so2877102f8f.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 07:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621718; x=1796226518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBmfc2TJahlGMnvUMErDpl5CqbKG2TSTACsgzVeGXC8=;
        b=Bx5yL0aoVGvnwFLEJjS2gidkudy7Ft6XwVSM+Fa36JkEgviyJmM5c5S924uxcoRBB/
         OmRS+Nj5gT4SUQKe4SbnEYVowboOfbKil/r+hP/N4rQkWWuXST26+o7+aIuLB38PcIUz
         F9vWxHKIty50h5qBqbuHPZh2Ci0bSqa0vP6IEQQOCknUaIH0wTU900Mf6Rvet4vwwCrv
         ad5VULmWFu0/zNbnkZQMOqbAZrBhtA7o46BC8HcZUrK9W8I2XQI2YH+usU5OjOSTLFCx
         evnh0pZ4ce8o3unQLnrsCNy1lXgYegxYnDrfwL7BbStTHYc54xWMqYJXJxlCIj/15nbS
         bdNQ==
X-Forwarded-Encrypted: i=1; AL+hErEzELErK61mYvASPyXAu2b/yJRAdmmpxg5MJrEIgFXZbclOdzlWcqmrRLYALGIAcJwo8w+M@lists.linux.dev
X-Gm-Message-State: APuU4Z/TpC/B8ja6pHH/ngGqBX/zHvzLqh4kceO8diu11dq4e7EgTlmO
	lUTRydq1Cdq/twm+eLgRcE4u8Eg2xUBGXeMfCAQdEu4IvIw8QZiVCTq+H5Ig7MpFuEgLgU0JfOk
	0LTlPONM/Pn5gLz/MEvqb2Pcdo2VFtN3rYBNbiQ0c1rmZ+NMj1bButLk=
X-Gm-Gg: AZFdTZeeBFr655Ow9k6zWV6mXtK4Ob8+7M0JmQGkI9/Yapox8GwVPeFVt07ByEkNTkB
	ucKe7AD1SIoBZ8B/7ZVn0W/LhucfJgG2eDAPTqdCWBbxJ+60GJenSIJOU+n/J9ieJqTmlPNGnok
	I6c3s6mHzN3gnfVuVoCzM9D6YtCoNzFBcIK6pge5TTS4lP2OLVqaC01DdB1toQV+m9A5vz4QlXi
	73zPIwiUJM4G2Fm1zLYe6qZaG+6wkouw4z934wyQ/BSE1lFs0WDtHBhBuQWlWvu0Y3lP15XyOqv
	TpAABVKP2wU7P+8LTpAzVCn3uFJCGKikuTbGdx3FnqjgwwU3RraTpKVKPc2kSo37SgWJU7PDu5K
	BEeSiVpSDjSca195d1fHNMAkA6+je9Fm/GmgU0QyutbHrv4GQVindyvMp8pkuOfkSSZkLgR9etV
	9oyowopjJBpQCUqDReijEjpNFpbS1nlb8LTdl0l4K8Pd03
X-Received: by 2002:a05:6000:18a5:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-4abb7f3e149mr34479758f8f.50.1795621718006;
        Wed, 25 Nov 2026 07:48:38 -0800 (PST)
X-Received: by 2002:a05:6000:18a5:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-4abb7f3e149mr34479706f8f.50.1795621717500;
        Wed, 25 Nov 2026 07:48:37 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm28780389f8f.45.2026.11.25.07.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:48:37 -0800 (PST)
Message-ID: <3b3939f1-fa7e-42ed-ac74-c96c0bc930cb@redhat.com>
Date: Wed, 25 Nov 2026 16:48:36 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] eth: funeth: Include FEC stats in
 fun_free_stats_area() DMA free size
To: Daniel Machon <daniel.machon@microchip.com>,
 Ian Rogers <irogers@google.com>
Cc: Dimitris Michailidis <dmichail@fungible.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Elkin Cruz <elkin@google.com>
References: <20261119170613.1519353-1-irogers@google.com>
 <20261123090722.z5xcxwwdelnnjifq@DEN-DL-M70577>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261123090722.z5xcxwwdelnnjifq@DEN-DL-M70577>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qb7S2gAmALLjICAj2FXHQdin23UJonDItsR0okaQu74_1795621718
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 10:07, Daniel Machon wrote:
>> fun_init_stats_area() allocates coherent DMA memory for
>> (PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX)
>> 64-bit counters (632 bytes), whereas fun_free_stats_area() omits
>> PORT_MAC_FEC_STATS_MAX and passes 616 bytes to dma_free_coherent(),
>> triggering DMA-API debug size-mismatch warnings on teardown.
>>
>> Extract a shared fun_stats_area_size() helper used by both allocation and
>> deallocation paths, and cast the leading enum constant to unsigned int to
>> avoid cross-enum arithmetic.
>>
>> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
>> -Wenum-enum-conversion enabled; fix and changelog drafted with an AI
>> coding assistant. Build-tested under LLVM=1 W=1 and
>> -Wenum-enum-conversion; not tested on Fungible Ethernet hardware.
>>
>> Fixes: ee6373ddf3a9 ("net/funeth: probing and netdev ops")
>> Signed-off-by: Ian Rogers <irogers@google.com>
>> ---
>>   .../ethernet/fungible/funeth/funeth_main.c    | 20 +++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/fungible/funeth/funeth_main.c b/drivers/net/ethernet/fungible/funeth/funeth_main.c
>> index bad8276d26b0..e0d4e69abfa4 100644
>> --- a/drivers/net/ethernet/fungible/funeth/funeth_main.c
>> +++ b/drivers/net/ethernet/fungible/funeth/funeth_main.c
>> @@ -1457,17 +1457,20 @@ void fun_set_ring_count(struct net_device *netdev, unsigned int ntx,
>>   	}
>>   }
>>   
>> -static int fun_init_stats_area(struct funeth_priv *fp)
>> +static size_t fun_stats_area_size(void)
>>   {
>> -	unsigned int nstats;
>> +	unsigned int nstats = (unsigned int)PORT_MAC_RX_STATS_MAX +
>> +			      PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX;
>> +
>> +	return nstats * sizeof(u64);
>> +}
>>   
>> +static int fun_init_stats_area(struct funeth_priv *fp)
>> +{
>>   	if (!(fp->port_caps & FUN_PORT_CAP_STATS))
>>   		return 0;
>>   
>> -	nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX +
>> -		 PORT_MAC_FEC_STATS_MAX;
>> -
>> -	fp->stats = dma_alloc_coherent(&fp->pdev->dev, nstats * sizeof(u64),
>> +	fp->stats = dma_alloc_coherent(&fp->pdev->dev, fun_stats_area_size(),
>>   				       &fp->stats_dma_addr, GFP_KERNEL);
>>   	if (!fp->stats)
>>   		return -ENOMEM;
>> @@ -1476,11 +1479,8 @@ static int fun_init_stats_area(struct funeth_priv *fp)
>>   
>>   static void fun_free_stats_area(struct funeth_priv *fp)
>>   {
>> -	unsigned int nstats;
>> -
>>   	if (fp->stats) {
>> -		nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX;
>> -		dma_free_coherent(&fp->pdev->dev, nstats * sizeof(u64),
>> +		dma_free_coherent(&fp->pdev->dev, fun_stats_area_size(),
>>   				  fp->stats, fp->stats_dma_addr);
>>   		fp->stats = NULL;
>>   	}
>> -- 
>> 2.56.1.708.g77570a6a1d-goog
>>
> 
> Fix looks good to me.
> 
> Although, I think it's more common with a compile time constant for a fixed size
> used for alloc and free. Something like:
> 
> #define FUN_PORT_NSTATS ((unsigned int)PORT_MAC_RX_STATS_MAX + \
>                           PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX)
> 
>          fp->stats = dma_alloc_coherent(&fp->pdev->dev,
>                                         FUN_PORT_NSTATS * sizeof(u64),
>                                         &fp->stats_dma_addr, GFP_KERNEL);
> 
> Not a big deal though.

Please use the macro, as suggested by Daniel. Also please wait a few
days before resubmitting.

/P


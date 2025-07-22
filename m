Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2410724169F
	for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 15:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753196622; cv=none; b=F7xtImiKoQ4e1h/rZ3rmMgtiUDoVeFBLlpLkYSooI3PNZqT8jE1sXHjh8SF4EW0J/vmuI5pLv+WSqHV7qcMc9lZd04ScI1LIQekXkdVFmZraQuxAQdxn6qE1q8jORRdUjdGLi1ceVXpnBvGqeMynopnfy9XScTlX9xTYGxsUcp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753196622; c=relaxed/simple;
	bh=z2gj5V7u4WprQQoCZFJO+IylNg/HsgVNMYcaqhQgwVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TOYIBOhTzIHgPYm3hoBm5vxBHAeTu+FRXFe7oZJVaMXZ+3pPaNmL6CT0dr1hXP4GXrqvYnZAXI912F1v/PiIIu2d6xyfP21R2E0OBOXFmLvKm0eYApzYYkcQal5W5I/Sxo07aSN7yKYKDrylDyxTjTP6NsJptogPbLqDnF1n3Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W+8I33Nl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W+8I33Nl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753196620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yLoXN0zviuhjRHlOKL2rQE3hdCG3gOLWxmD1fwrgVH8=;
	b=W+8I33NlCzefY9VilWlrriOctn6SJomNs5+xwMo6/1GozuOUPTZPfHYVOMGzREjC5rmwpz
	glp2usBy8gBJaWTvwZBj4A5+qZo+wtHqfCBn+DVh5BM9a4rF1D6XzMN7zgdo9E6c3U40zB
	xckBRkpiUjtPcOuqVgBy9R19hErlQTE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-ICWoZKtWPZSZLfDGRnPpQw-1; Tue, 22 Jul 2025 11:03:37 -0400
X-MC-Unique: ICWoZKtWPZSZLfDGRnPpQw-1
X-Mimecast-MFC-AGG-ID: ICWoZKtWPZSZLfDGRnPpQw_1753196616
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so31885945e9.2
        for <llvm@lists.linux.dev>; Tue, 22 Jul 2025 08:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753196616; x=1753801416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLoXN0zviuhjRHlOKL2rQE3hdCG3gOLWxmD1fwrgVH8=;
        b=ZjmNg4a4Y7UkwSSXTk85JtNCaf34IwgsnxbX6JOb5/7kuVeFEnuYjH6whwPdMNKTRg
         dND+IGELF69NpxzNnnNpjg8HyHsiDXkK+vvXDoYvy2UZd11x2clpnyolUHQBnjwJKZ+1
         RKLlNK0CG56dW94++XYqwvDgHlMEWA2VW3EKmazCxtqhtIpn3koO2pCUOX9nly8Qq8/b
         p9SJdMZBrXhZT1JXU/KWr9zBZRwzp9r8SFxSQeIEx6RpFY3wA6paJhPhfb3/wj27Nkjw
         3ogYT6mtZGvkhMTgTMC+Y3Hm8frj/hipZWI3Pv5fbpijwSczJiRK8s+OpyAHyWJk9wVF
         0Rdg==
X-Forwarded-Encrypted: i=1; AJvYcCVD8lB1soAPzfwgbmKNcz3ub3eZwxO+vqOpiZYXOVzM6o5xKwjOA0c9caYxxlS4QMJ+/S4k@lists.linux.dev
X-Gm-Message-State: AOJu0YzSFLvc38B/XVtmhgPgkEH+Zw0BlelXCamBVAUT1hEYIDp6etLl
	scw/UpF2Mur7JUmP/+WA5T/LGhbPv0ommg5WZ+Pq55Dgucowx+dSoz3QbnWur8+WcSPmgFXK9IE
	7LSQByrYaGLKwnp4QxeJD2+ZkjMoxcZs+r4lZepdiL4RJX5t0m7iP2Vg=
X-Gm-Gg: ASbGnctvNLEphm5WX16kh87Ws18eV5TJGZwQYZq+x1EKJ3+b/krVVMmT2/U/eOy4gfk
	/myjovNyx2stN6jt/+C6LTr8Nw87HBSNkDrBMBQg5iM3wCndDemYcVIxvwbgMyC8sOrsaWpxXDK
	hGD0by/XCmpAJVL28TUXcdS9kWna6y/zZasuVTBDYvkKnYcGp676vY5oshYyyfGWkBknp3n88B2
	1j5H1i/awKq5UVpOqCAFkUWLGB1xfTADqRWkskaLBuuM3f84G8WABis2DN06btM6yTyghGJ901+
	NrrnvPPCbHEbf/Y5Fk/HFE8AoMe6u8UhAvTogoAjQ6Pzx3AC/IqbQdTZDaOWG2VJ52XiRK/vRGY
	En5BMtRF/INE=
X-Received: by 2002:a05:600c:8588:b0:456:22f0:d9ca with SMTP id 5b1f17b1804b1-4563bf262e3mr103369925e9.26.1753196615967;
        Tue, 22 Jul 2025 08:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXBjtom7DfrBS3RzSHHM2jEi5VfD/84zxgrNdm4BqqX7Z5GS1hjLJJaVsZOKAqO1uS8F1VCg==
X-Received: by 2002:a05:600c:8588:b0:456:22f0:d9ca with SMTP id 5b1f17b1804b1-4563bf262e3mr103368725e9.26.1753196614818;
        Tue, 22 Jul 2025 08:03:34 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b73fa43sm131621725e9.21.2025.07.22.08.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 08:03:34 -0700 (PDT)
Message-ID: <eea3a104-1cb9-4606-9664-a8beda93e018@redhat.com>
Date: Tue, 22 Jul 2025 17:03:32 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next V6 2/5] selftests: drv-net: Test XDP_PASS/DROP
 support
To: Gal Pressman <gal@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Nimrod Oren <noren@nvidia.com>
Cc: Mohsin Bashir <mohsin.bashr@gmail.com>, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 shuah@kernel.org, horms@kernel.org, cratiu@nvidia.com, cjubran@nvidia.com,
 mbloch@nvidia.com, jdamato@fastly.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
 justinstitt@google.com, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, tariqt@nvidia.com,
 thoiland@redhat.com
References: <20250719083059.3209169-1-mohsin.bashr@gmail.com>
 <20250719083059.3209169-3-mohsin.bashr@gmail.com>
 <ab65545f-c79c-492b-a699-39f7afa984ea@nvidia.com>
 <20250721084046.5659971c@kernel.org>
 <eaca90db-897c-45a0-8eed-92c36dbec825@nvidia.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <eaca90db-897c-45a0-8eed-92c36dbec825@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FQHFqt3lfu5cy3RaFZnu7nCQxCGiP9EKpI9BBBtFs6w_1753196616
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/21/25 8:34 PM, Gal Pressman wrote:
> On 21/07/2025 18:40, Jakub Kicinski wrote:
>> On Mon, 21 Jul 2025 14:43:15 +0300 Nimrod Oren wrote:
>>>> +static struct udphdr *filter_udphdr(struct xdp_md *ctx, __u16 port)
>>>> +{
>>>> +	void *data_end = (void *)(long)ctx->data_end;
>>>> +	void *data = (void *)(long)ctx->data;
>>>> +	struct udphdr *udph = NULL;
>>>> +	struct ethhdr *eth = data;
>>>> +
>>>> +	if (data + sizeof(*eth) > data_end)
>>>> +		return NULL;
>>>> +  
>>>
>>> This check assumes that the packet headers reside in the linear part of
>>> the xdp_buff. However, this assumption does not hold across all drivers.
>>> For example, in mlx5, the linear part is empty when using multi-buffer
>>> mode with striding rq configuration. This causes all multi-buffer test
>>> cases to fail over mlx5.
>>>
>>> To ensure correctness across all drivers, all direct accesses to packet
>>> data should use these safer helper functions instead:
>>> bpf_xdp_load_bytes() and bpf_xdp_store_bytes().
>>>
>>> Related discussion and context can be found here:
>>> https://github.com/xdp-project/xdp-tools/pull/409
>>
>> That's a reasonable way to modify the test. But I'm not sure it's
>> something that should be blocking merging the patches.
>> Or for that matter whether it's Mohsin's responsibility to make the
>> test cater to quirks of mlx5, 
> 
> Definitely not a quirk, you cannot assume the headers are in the linear
> part, especially if you're going to put this program as reference in the
> kernel tree.
> 
> This issue has nothing to do with mlx5, but a buggy XDP program.

Note that with the self-tests we have a slightly different premise WRT
the actual kernel code. We prefer on-boarding tests cases that work for
some/most of the possible setup vs perfect ones, and eventually improve
incrementally as needed: the goal is to increase the code coverage _and_
encourage people to contribute new tests upstream.

We try to avoid breaking existing tests (at least the ones actually
reporting into the infrastructure), but for new ones the barriers are
intentionally different than VS kernel code.

Cheers,

Paolo


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A395137D
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 08:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673513124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QRkGofy0rOYQohBlbN5nSy8RN48skKljdqEjml4OAaw=;
	b=iPnMDtmuILR/vGcbTYDNaQGz47PI5WZj/cC7BTD/fhENPTfGhgeveKCxycIG18gy3bZBZY
	4f3/YQNz2MhgEUk4QHoAFZ6i95mM6Kcoa4Eb3t7EF0fvjfh0M3LNqDUb802lP3VfjrD79u
	oW3AMbphzV8caluzXLcn84CMrxjSDB8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-318-n_DVltVZN5KC0_rKDVmT4A-1; Thu, 12 Jan 2023 03:45:23 -0500
X-MC-Unique: n_DVltVZN5KC0_rKDVmT4A-1
Received: by mail-ej1-f72.google.com with SMTP id sd1-20020a1709076e0100b00810be49e7afso12397742ejc.22
        for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 00:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRkGofy0rOYQohBlbN5nSy8RN48skKljdqEjml4OAaw=;
        b=sqcxFTzE+g28ON+OXKfoyHKx51KzZ4SvRZZgVkOOWil7IJTRLymQC8LoTUzoLaKlcJ
         ojQFmq4KA7rayE/vvL9HekKGfEnhPuFdwQrTIUx/qv2kOG+W4vYco6zf8yj9YRlsccNJ
         r2cLFcW8XsMm8SxjyEF0UA8BBYiresFKqVmPah8M79gUPKnF3qI34V0BTRfwKvn3GrxP
         ackXSFlQ7a75BQRxedYdl5pGiyoTZdsxbEEjtn46IhdhAyocrrbIQX88PC2nlTbjhD91
         HSSuCVFI2fqqEQ8fuR2GoC4uRRB24z26CeARsVt+c4iuDGVJoO3+73yK9x9GWuNuk6Y8
         zZew==
X-Gm-Message-State: AFqh2koo7FAD2Q21aDQ+FaPX1PVVxHQ+ai8k0WJnRIYw0+EUZPv9cUAr
	ynQHA9aCLyMS7l4izRdaJ+nVx2Lh9gGGnO9Z3Jv3ihgYCPlPf0A3ptcrZirgElaZIhxIEgBlZw0
	KjMLYv3KmY8EQ7Q==
X-Received: by 2002:a17:907:1b0b:b0:7c1:6344:84a with SMTP id mp11-20020a1709071b0b00b007c16344084amr102056843ejc.5.1673513122002;
        Thu, 12 Jan 2023 00:45:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu54vDYgLEuxRyxp1eTz+c6OzQAOq5kS8s1aP1PTT89lIebzPDO4yj3/Xck4uxhw5HLniQNWw==
X-Received: by 2002:a17:907:1b0b:b0:7c1:6344:84a with SMTP id mp11-20020a1709071b0b00b007c16344084amr102056814ejc.5.1673513121707;
        Thu, 12 Jan 2023 00:45:21 -0800 (PST)
Received: from [192.168.42.222] (nat-cgn9-185-107-15-52.static.kviknet.net. [185.107.15.52])
        by smtp.gmail.com with ESMTPSA id r2-20020a17090609c200b007bd28b50305sm7182953eje.200.2023.01.12.00.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 00:45:21 -0800 (PST)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <95ea32dd-8605-f1ac-3799-400918e29e07@redhat.com>
Date: Thu, 12 Jan 2023 09:45:19 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Cc: brouer@redhat.com, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, linux-mm@kvack.org,
 Shakeel Butt <shakeelb@google.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: Re: [PATCH v3 18/26] page_pool: Allow page_pool_recycle_direct() to
 take a netmem or a page
To: Matthew Wilcox <willy@infradead.org>, kernel test robot <lkp@intel.com>
References: <20230111042214.907030-19-willy@infradead.org>
 <202301112022.zmClDxtO-lkp@intel.com> <Y769E3ZpCCuykk94@casper.infradead.org>
In-Reply-To: <Y769E3ZpCCuykk94@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/01/2023 14.43, Matthew Wilcox wrote:
> On Wed, Jan 11, 2023 at 08:48:30PM +0800, kernel test robot wrote:
>>>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:2978:4: error: controlling expression type 'void *' not compatible with any generic association type
>>                             page_pool_recycle_direct(rxr->page_pool, data);
>>                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> I swear I did an allmodconfig build ... don't know how I missed this
> one.  I think I'll make the page_pool_recycle_direct() macro accept
> void * as well, and treat it as a page.  Once we finish the conversion
> to netmem, this problem will go away.
> 
> ie this:
> 
> +++ b/include/net/page_pool.h
> @@ -485,7 +485,8 @@ static inline void __page_pool_recycle_page_direct(struct page_pool *pool,
>   
>   #define page_pool_recycle_direct(pool, mem)    _Generic((mem),         \
>          struct netmem *: __page_pool_recycle_direct(pool, (struct netmem *)mem),                \
> -       struct page *:   __page_pool_recycle_page_direct(pool, (struct page *)mem))
> +       struct page *:   __page_pool_recycle_page_direct(pool, (struct page *)mem),     \
> +       void *:  __page_pool_recycle_page_direct(pool, (struct page *)mem))
>   

I'm okay with this change, and you can add my acked by.

Acked-by: Jesper Dangaard Brouer <brouer@redhat.com>

Maybe broadcom/bnxt driver should (later) be converted to not use void
pointers... cc. Andy.

--Jesper


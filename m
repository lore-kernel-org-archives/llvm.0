Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127352F35
	for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 23:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648596085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vnEVLzN6wtV9JQalUxoL87eeycMaKfu2BZqOrOuPk4E=;
	b=NG6ek5Ue9ncyj9C4wv6UjsQb7VRWVPgP6WC2nAI3g6VM9OJVVOdsLuA7DOqlmY5k1zPWaB
	yxAF86UqkVirqcebJ9w4JIus/UrrYeFHksz6OG5T8DhaJzEWUDeG8Jii4969S3g7HUZ290
	81Rn5TBcYAzRt9oit50yoXcIWapz8kw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262--ODmVwd7NSuyzyNV1FVd1w-1; Tue, 29 Mar 2022 19:21:24 -0400
X-MC-Unique: -ODmVwd7NSuyzyNV1FVd1w-1
Received: by mail-qt1-f197.google.com with SMTP id m12-20020ac807cc000000b002e05dbf21acso15981872qth.22
        for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 16:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vnEVLzN6wtV9JQalUxoL87eeycMaKfu2BZqOrOuPk4E=;
        b=ILF+ZYS1O1vFDB8u3epTMjelQi86lc2SzoF2wMugQiRjGiXknDruNIOgDbwV+m+C8u
         zMLm0mCeLRZdYw9HZyJ1IVO7eUKPoAabBX3uEXnjkn3aHJPpqKFTBQPNwhtwdpawhjCt
         1KAtgbfMpo7UVDVspbiZkfMdVFgHh3QC14Wt+WYjSPnw7OcPb24M0JQuQ94UeLfu4lWj
         9y5i4XjaP0lV9GL8pFVYefNn+2RpoVuS6cpNmtzeFtfMNuQ2nUmBlgttRuyE3nM1W+5q
         an/MmV/2/ztmG+OwkZetZSd+HuqH8H0x7/UJOoiyTYasPulltPRCPe+9CyvdazQDfD7X
         EXRA==
X-Gm-Message-State: AOAM5318mxdJgRO7GX0QXgFvYH+8ljxjFe3xXh0LeZE5Arwm370go8Yf
	qDWhw0dWKrBPPMTbCZ5wUKU8f5emu+oXxBHNvup5SkWv3tVoA17M6P6StMwn8tzKff50SsxNrEg
	jZdahbepUPXVHqcnP1t0y+tyaDET93QUNbEXx7wrBA1eBbZ99VPuEOHhVb6FE
X-Received: by 2002:a05:620a:1a99:b0:680:f33c:dbd3 with SMTP id bl25-20020a05620a1a9900b00680f33cdbd3mr2912694qkb.17.1648596083929;
        Tue, 29 Mar 2022 16:21:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaMl8cwEN02JVbghXfjiOKK5vbmlk7rHZYxrkXCYwKhBHbTy3z6OejWxFNRFl2ohGsizFJXg==
X-Received: by 2002:a05:620a:1a99:b0:680:f33c:dbd3 with SMTP id bl25-20020a05620a1a9900b00680f33cdbd3mr2912659qkb.17.1648596083595;
        Tue, 29 Mar 2022 16:21:23 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id q8-20020a05622a030800b002e1c9304db8sm15819272qtw.38.2022.03.29.16.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 16:21:23 -0700 (PDT)
Subject: Re: [PATCH] media: staging: atomisp: rework reading the id and
 revision values
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
 ndesaulniers@google.com, hverkuil-cisco@xs4all.nl, vrzh@vrzh.net,
 tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20220326191853.2914552-1-trix@redhat.com>
 <YkN0w5NxLcBFes1b@paasikivi.fi.intel.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <2ab474d8-ee4e-44b5-ab3c-38b72135a27f@redhat.com>
Date: Tue, 29 Mar 2022 16:21:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YkN0w5NxLcBFes1b@paasikivi.fi.intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I'll do a resend.

I use git send-mail, sooo not sure what went wrong.

Tom

On 3/29/22 2:06 PM, Sakari Ailus wrote:
> On Sat, Mar 26, 2022 at 12:18:53PM -0700, trix@redhat.com wrote:
>
> Hi Tom,
>
> It seems that somehow the Content-type header of your patch  is
> application/octet-stream. I.e. not text.
>


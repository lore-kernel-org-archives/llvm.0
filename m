Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C5E29CA
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 19:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643398641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJ78PqpfaYdoTQU7JcioKlmBoZlxq+jRcIlavIlWaQw=;
	b=Z8q5S7QA0uW+cvVGnuqhqNblWPHsSacXxEdsTpnI56NNhQtyEYMM4K/yAS6tSxh64NgSGv
	W/m8+j/1tl2bjTVrAs4PgsJjze87PnISILX9FnjE7fmCUHW2PTOvU2X843COLC2qAEDJec
	cnujYtuZeMNFw3JnqQjNLmsyNB3bwOc=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-f2FAaomkN_SxIjmQotMg1A-1; Fri, 28 Jan 2022 14:37:20 -0500
X-MC-Unique: f2FAaomkN_SxIjmQotMg1A-1
Received: by mail-oi1-f198.google.com with SMTP id g4-20020acab604000000b002c8b24c3964so3665296oif.22
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 11:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sJ78PqpfaYdoTQU7JcioKlmBoZlxq+jRcIlavIlWaQw=;
        b=bXKNNMQXga+yhPWsCp/WB1KdT+L0rLcRYafqIu6owv1kXV0gUdHvDNvclQQYLpabuM
         Ax+Mnos2QvNkPNjKHaMI0OtTvGjmRlSWQ6P/bvXePMYnZWPoKsRhTIyZNlgJkROP650I
         EUkqgoIHIOu2KbcNMGpgzDW+hrOAvuq2DD4owbv7SJhfjIcNPmyUJWmR7K/K4XiR+AQZ
         KKf/h8zJDM4Z+CeY6iS+/JuDMKtXF3nZ6/g1oHoioc34JRwPWJEx5SwRWqwwJxGAm0Yk
         qsxOdPr/SBnldAXwVXH2hhJEus9wdXlZwJdXeNmikRG76Z9cnXFwbBZjBiGchhZKlV2L
         AdXA==
X-Gm-Message-State: AOAM533ZHT5ylsarloMXFT/8VuqDTLvUCGbTvfJBJ+N3oc6RD77UBZAy
	bDAl9gStI8OmfQR9Vac5Q+XIhN7637Pf1wQGLj5uabFChzo0S2pDYrtefUl3GCSkTKvoEEA6Cxx
	nAfa3y6yPXPy/40dNrt6wswONJVrHFSuTleoXo5j6oXbn5c5q+UkOIhI4n4l+
X-Received: by 2002:a05:6808:302a:: with SMTP id ay42mr10605369oib.9.1643398639450;
        Fri, 28 Jan 2022 11:37:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJH5+YbwP3uDIx0eIMGxxU4M5Gxe9auKJAqcbbxh30RRitEA2FqyPq4CXplO1Q4MwMWUJJZQ==
X-Received: by 2002:a05:6808:302a:: with SMTP id ay42mr10605345oib.9.1643398639151;
        Fri, 28 Jan 2022 11:37:19 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id g20sm12023713oiy.34.2022.01.28.11.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 11:37:18 -0800 (PST)
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
To: Joe Perches <joe@perches.com>, Bart Van Assche <bvanassche@acm.org>,
 kashyap.desai@broadcom.com, sumit.saxena@broadcom.com,
 shivasharan.srikanteshwara@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, nathan@kernel.org, ndesaulniers@google.com
Cc: megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220127151945.1244439-1-trix@redhat.com>
 <d26d4bd8-b5e1-f4d5-b563-9bc4dd384ff8@acm.org>
 <0adde369-3fd7-3608-594c-d199cce3c936@redhat.com>
 <e3ae392a16491b9ddeb1f0b2b74fdf05628b1996.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <46441b86-1d19-5eb4-0013-db1c63a9b0a5@redhat.com>
Date: Fri, 28 Jan 2022 11:37:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <e3ae392a16491b9ddeb1f0b2b74fdf05628b1996.camel@perches.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 1/28/22 11:11 AM, Joe Perches wrote:
> On Fri, 2022-01-28 at 09:59 -0800, Tom Rix wrote:
>> On 1/28/22 9:42 AM, Bart Van Assche wrote:
>>> On 1/27/22 07:19, trix@redhat.com wrote:
>>>> From: Tom Rix <trix@redhat.com>
>>>>
>>>> checkpatch reports several hundred formatting errors.
>>>> Run these files through clang-format and knock off
>>>> some of them.
>>> Isn't this the kind of patches that carries more risk than value?
> Risk for whitespace style reformatting patches is quite low.
>
> Nominally, clang-format changes should not produce a different
> compiled object file unless __LINE__/__DATE__/__TIME__ style
> changes occur.
>
> If it does, the clang-format tool is broken.
>
>>> Additionally, this patch conflicts with a patch series that I plan to
>>> post soon.
> []
>> Long term, it would be good have a reliable way to automatically fix
>> either new files or really broken old files.
> That's really a maintainer preference no?
>
> Especially so for any automation.

In practice everything is up to the maintainer.

If some maintainer wants fix their formatting then clang-format should 
just work

It isn't likely they will have time to hand fix every file.

Tom

>
>


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4AD2C80
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 18:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643392800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+Hmwc9+6O6R90bO9i51djyWsBTgueZPwQigGIkzQcY=;
	b=KeCnTNgc+X/marPq6erYQgfYZN5XnIRcmW8T+RPluLCeAE2TaogbwS70Z4mZn9TFJtQbkK
	rAEiO5G0oWoW+mzrBeD3I2axyJ+f6wowT9YU/tFBYkWNZLATNoP0Go9U58g6DcoxN8+oVQ
	ktLsbQqu0Sc+4RnHXD5rImNhyf1YSXI=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-HsL8EKdyObyxa4W8YeerNQ-1; Fri, 28 Jan 2022 12:59:59 -0500
X-MC-Unique: HsL8EKdyObyxa4W8YeerNQ-1
Received: by mail-oi1-f197.google.com with SMTP id bf12-20020a056808190c00b002cf68d61ccfso925981oib.8
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 09:59:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=u+Hmwc9+6O6R90bO9i51djyWsBTgueZPwQigGIkzQcY=;
        b=ItY8TOohsOVRTJJyQcV1xQCSIUW4070rmfjNt5zUkRkpLQG5R+EzVTy0lxSNQtoY1p
         un3epvcOW67Df9XS729XpaQ7DUvAeLl9nc2p/kkx78yvl3ND2xxc3ipz5KqAmuB6m+pX
         7zCvkmUi1tE2uCHdsLHBWtn7/7jGRmnmeVSCC5O625H9SQAM9/jIdbB4bTIjvXLXVYUS
         g91Sn4cDHkpo3WrRFFGaes7R66htZ1a2JkcxVD1EktX4mG9yUJHJ7cBZ8jW7X1lbmgcJ
         Fn42UFOAzFjXT29+d2Bk9ayLHzkyDJ2nOu8/zRqlxcAXHKqSG4mvCMPtz2xQDqvnLPdc
         XwxQ==
X-Gm-Message-State: AOAM531oDMOpBsAy5RWyHp15Xf7WLaxZ79S5uzRL5Q1Oj4zody/rAEWy
	CNlU+WYTmYE3G5wfiztPRWAoo5suAyWHuJty+IjDRxxmm6dzp7h7UWGTZs8/NK15hUFjB3QiGal
	M0vtIvME3gxWfS/6gM0S56OCrsTADv00Vij6nzwtOZ28zy5lBUU4cAbHjqOe7
X-Received: by 2002:a05:6830:1091:: with SMTP id y17mr5517937oto.251.1643392798099;
        Fri, 28 Jan 2022 09:59:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7tzvwbAnDL33am0wCZlnAvRFJbSDVAbo5b1w5J/mtfZ8VVd+wV4q4yxN0XRiY8J66auWK3w==
X-Received: by 2002:a05:6830:1091:: with SMTP id y17mr5517919oto.251.1643392797859;
        Fri, 28 Jan 2022 09:59:57 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id l19sm4578463ooa.7.2022.01.28.09.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 09:59:57 -0800 (PST)
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
To: Bart Van Assche <bvanassche@acm.org>, kashyap.desai@broadcom.com,
 sumit.saxena@broadcom.com, shivasharan.srikanteshwara@broadcom.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, nathan@kernel.org,
 ndesaulniers@google.com
Cc: megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220127151945.1244439-1-trix@redhat.com>
 <d26d4bd8-b5e1-f4d5-b563-9bc4dd384ff8@acm.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <0adde369-3fd7-3608-594c-d199cce3c936@redhat.com>
Date: Fri, 28 Jan 2022 09:59:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d26d4bd8-b5e1-f4d5-b563-9bc4dd384ff8@acm.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 1/28/22 9:42 AM, Bart Van Assche wrote:
> On 1/27/22 07:19, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> checkpatch reports several hundred formatting errors.
>> Run these files through clang-format and knock off
>> some of them.
>
> Isn't this the kind of patches that carries more risk than value? 
> Additionally, this patch conflicts with a patch series that I plan to 
> post soon.
>
> Thanks,

I have dropped this patch.

Long term, it would be good have a reliable way to automatically fix 
either new files or really broken old files.

So you could do two patches, first would be fixing formatting problems 
and second would new stuff.

As it is your new patch will have to both for now.

Tom

>
>
> Bart.
>


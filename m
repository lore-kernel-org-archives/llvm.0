Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6737A
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646296686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7VbL5lT53mUztHyArx9pP7wyihmJ4M3NPqTtcvOQ2VI=;
	b=Q5nhq6/wzb7uVvj8eCG+9zk9HjP252gVR3JdSNtcyWnrF25FA2y++to3OYD2CCIK8scfo8
	JOpG8jWSBqUAf00OqZw0U4O0iAGp9rkD+FlHUTWIQAqsoYCUbntSkAetf5vEFQHEjgqMgV
	8KfiUbfgGbgUpwgzKoEymdJ/V2Eu3Ww=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-pM9p8JdsPW2XBj4nxH1r7g-1; Thu, 03 Mar 2022 03:38:05 -0500
X-MC-Unique: pM9p8JdsPW2XBj4nxH1r7g-1
Received: by mail-wr1-f71.google.com with SMTP id x15-20020a5d6b4f000000b001ee6c0aa287so1747315wrw.9
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 00:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=7VbL5lT53mUztHyArx9pP7wyihmJ4M3NPqTtcvOQ2VI=;
        b=Af/8ovQR0QOuc6/ntiC4d6olcD2l9QSuOJKpLJp+etZbkzZ3A/heffsYxvmrifazkB
         pnST+0h6D6fvr2YPjbah5+L6jGE9zQsi+Wlai+U0KDvhdHmg3Mk6u7wJUxELgUhu4t8N
         DDURd6zey667FcGy6BhGwpYvSKGIPw2gq4ev5/bqpOGZ+SNdtfv5Y/4PvnYDBtaWxhv3
         L2xHRZUvAYFem9SegTL/8h/JkILGLKx5iA7fcrP98UldJ44fYMPxFAIBesHp1dwdv01f
         cfq3zCCuCLk1I6TG/Yfzg8v/Tj/Eyi7IR3C6XUe7t8c6qMiZCC0ZDqmscVLVxCbgdfWB
         l7jg==
X-Gm-Message-State: AOAM531uEzD+LHmGZ3IxuPFxu4Dmirt9dfb5bnXG413X2A5Pg5Lun6a9
	cUC0mHTmMPOB+UHVSh4rTnrERiwFnLwTuQkCq5KNW0sa4gQGvaeZZdk2t2ENhD8ACX7PVCnDLLD
	zcrsWwKVdcyTDwA==
X-Received: by 2002:a5d:47a4:0:b0:1f0:46e4:19bc with SMTP id 4-20020a5d47a4000000b001f046e419bcmr4066494wrb.601.1646296684782;
        Thu, 03 Mar 2022 00:38:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/AOr9kcfSCL6dEmzp2KPAxB6X5N/u/fMMDoNJCyjfqcaaRT42zcBqSgBSliGMWF1kL7ADpA==
X-Received: by 2002:a5d:47a4:0:b0:1f0:46e4:19bc with SMTP id 4-20020a5d47a4000000b001f046e419bcmr4066475wrb.601.1646296684567;
        Thu, 03 Mar 2022 00:38:04 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d590f000000b001f04b96f9a9sm1338936wrd.42.2022.03.03.00.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 00:38:04 -0800 (PST)
Message-ID: <8cef7451-ac6a-9ca5-b521-1eec53d30880@redhat.com>
Date: Thu, 3 Mar 2022 09:38:03 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH][next] drm: ssd130x: remove redundant initialization of
 pointer mode
From: Javier Martinez Canillas <javierm@redhat.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev
References: <20220302175309.1098827-1-colin.i.king@gmail.com>
 <CAFOAJEfS9dMY5nudeFxtwchTtLnBCh7N4qKaCdqvaodnRUFKzA@mail.gmail.com>
In-Reply-To: <CAFOAJEfS9dMY5nudeFxtwchTtLnBCh7N4qKaCdqvaodnRUFKzA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/2/22 19:29, Javier Martinez Canillas wrote:
> Hello Colin,
> 
> Thanks for the patch.
> 
> On Wed, Mar 2, 2022 at 6:53 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>>
>> Pointer mode is being assigned a value that is never read, it is
>> being re-assigned later with a new value. The initialization is
>> redundant and can be removed.
>>
> 
> Indeed.
> 
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>

Pushed to drm-misc-next (with fixed drm/ssd130x subject prefix).

Thanks!
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


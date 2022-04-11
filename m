Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1715110EA
	for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649694686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9npo1nqXaxbPxEQzLk6Betnt1M5YLmZj/dlQsw0KH3E=;
	b=YiHrMYvHInwGeCN3bYuEPlIoiDiJVFb9MVt+VeLTcktAdCuNMwbMiegis3p6SVGNsPwCAv
	5vUEJREkqLSwoCOFuH/+OayrBJT7163N7tjN4yxJhv6w9fmlvXj/vgIEMDDKAHYsFcwWgA
	4IPkTADn56RN2w6+eOU8j+gb1lcUbXA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-S1fBsDdLO1GqUjVyjkDOMw-1; Mon, 11 Apr 2022 12:31:25 -0400
X-MC-Unique: S1fBsDdLO1GqUjVyjkDOMw-1
Received: by mail-qt1-f198.google.com with SMTP id o17-20020ac872d1000000b002edcca4ce06so2525756qtp.7
        for <llvm@lists.linux.dev>; Mon, 11 Apr 2022 09:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9npo1nqXaxbPxEQzLk6Betnt1M5YLmZj/dlQsw0KH3E=;
        b=uxnPKRmuZX16jtu0CgiGDMTVoR1GAOFDNj1YuoXomF1NuXsziL6UNz1uUq7qYyLXEk
         Wb5mJI22xsbPqRzmHGB6WkrU6OYkXocUXIAjpmyy9qxZ6R5gRNzg48yrK4ACMgUwUG99
         LlcBQNH1jSzTzmQs+yYF+mCBBPO4ZBJm/tAfU/En2LjdP+ToUi0OtM4zJeZMcP5LQZ2a
         TH7m6CjZhELiSIuEH1c0a+FuvS7+c+oVAwswFAsA95c+Lwsld+AV9ic8VB2ijaIbtYtN
         RATy43t1BwPh623KmrSPIC9e5CagF8DJ+pos1oX4Uo/+AcuZODYGNd5mhsCAVnw6kwvF
         A++g==
X-Gm-Message-State: AOAM531jjXI9o5aiEVQRFf/ddveJLwurJcye+pjNuKEhXOK3hW9Py6Nq
	hhEzu9wqf+KnM1ViL+iCATRW5pMOSg9+dY7smdUpuZS6a1i5T2skLMJWSPurouwuot/LxIkUHbg
	OOHPfJA6ro+O4guSJ5IHmwtm0eejGaVTl8zmJxEf+m0aNycyQOb18nZ1MF9YF
X-Received: by 2002:a05:620a:1024:b0:69c:2e0f:d020 with SMTP id a4-20020a05620a102400b0069c2e0fd020mr160256qkk.108.1649694684387;
        Mon, 11 Apr 2022 09:31:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIBbuzUKRKdpRu1szbFKkqYCYu3AmHHhLAg8TDSWf8+WPdx1Tx8DzyFwTfgzm1rUwE2RhpZg==
X-Received: by 2002:a05:620a:1024:b0:69c:2e0f:d020 with SMTP id a4-20020a05620a102400b0069c2e0fd020mr160226qkk.108.1649694684121;
        Mon, 11 Apr 2022 09:31:24 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id s31-20020a05622a1a9f00b002e1df010316sm26851091qtc.80.2022.04.11.09.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 09:31:23 -0700 (PDT)
Subject: Re: [PATCH] security: do not leak information in ioctl
To: Christoph Hellwig <hch@infradead.org>
Cc: tim@cyberelk.net, axboe@kernel.dk, jejb@linux.ibm.com,
 martin.petersen@oracle.com, nathan@kernel.org, ndesaulniers@google.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, llvm@lists.linux.dev
References: <20220409145137.67592-1-trix@redhat.com>
 <YlREKRb/xgAFsi97@infradead.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <eec2efee-1153-8d8e-77c2-96156733a0c6@redhat.com>
Date: Mon, 11 Apr 2022 09:31:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YlREKRb/xgAFsi97@infradead.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/11/22 8:07 AM, Christoph Hellwig wrote:
> Wrong subject prefix, and this really should be split into one patch for
> pcd and one for sr.
ok i will split
> The sr prt looks sensible to me.  But for pcd why can't you just
> initialize buffer using
>
> 	char buffer[32] = { };
>
> and be done with it?

The failure can happen in the transfer loop, so some of the data will 
not be zero.

And checking status should be done.

zero-ing is because i am paranoid.

Tom

>


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C853C2F23
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644425066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KaPxvUPz73vOAGz6EpqAVnHUMksefzUrg4OPSPo/82E=;
	b=EO5+ml0wGH+2oUb7ToKNMCPM5zT7DGq22SZFRsJtoED5ylMJsCMUl+ycCItPVr/x11RE8W
	IOkZoAV7R83kYVwHrm1VnqUoQOEfcmdp6c8120FJo6PrjokkQDdQzzzFbJNqNqQHkpfaHN
	8MKMzdd1Q4vXqeILMiYQvYX0EF68mz0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-9s5aTWRgPY6T3zQzinFCag-1; Wed, 09 Feb 2022 11:44:25 -0500
X-MC-Unique: 9s5aTWRgPY6T3zQzinFCag-1
Received: by mail-qt1-f199.google.com with SMTP id s1-20020ac85ec1000000b002cf7c93d56dso2119879qtx.21
        for <llvm@lists.linux.dev>; Wed, 09 Feb 2022 08:44:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KaPxvUPz73vOAGz6EpqAVnHUMksefzUrg4OPSPo/82E=;
        b=cyadG7pQacF40c+1B6YZHI1EJWLphMbqdcSPMUkGjSO/1togNUarnRNsRFoifWnbvp
         q2kP4eUfipQ15iYfKbneB7uVo0yjPOnC4mZcEE0ZDQdykKNgWOJ7OOCcnIteTeWxMymG
         Xi3A5xUIFIXaHgFfZxKOFar8j9ol/G7Q6HsyIemvjL3Gdtr6UF/nPT50sjCW6Onn7SZb
         nQPjPnLqk6VfBAJo4EYux8DaVIft6NMpysr94bIs4MJz9bcZdr1A2vXzKTiRhU5tqe3l
         cscntSy74jQWgKgxEcC7k/67ZSaWyrW/Kt0rQI2UL6R334iDLltKgOErCjlSh/49GXvz
         R+xQ==
X-Gm-Message-State: AOAM530EDBX0Ez9fhoePp7A01UBqeEmsqXT5WDb5VBOulIT3fRM66Sj1
	mvlyw/Voutzvhf/ABB4zPPQKujU5r9yhFhN6x/x1wRfi2GehthQWT6Na2x8nBjfWYRczsSzqxn5
	u8jup0OwwQw/ipf2DB+rNmEjYR2bRN2SbD2axdFDep2JTAYrqM6yvxjcM5QZr
X-Received: by 2002:ad4:5f8a:: with SMTP id jp10mr2065536qvb.14.1644425065089;
        Wed, 09 Feb 2022 08:44:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybkvzBKSgzu3wGFvXoOyk0MMma2dAefl2ZmvFzuoL1BtcD2RSBS5I5yrk8+S9FDrmA/r6VMQ==
X-Received: by 2002:ad4:5f8a:: with SMTP id jp10mr2065512qvb.14.1644425064775;
        Wed, 09 Feb 2022 08:44:24 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id q15sm8760820qti.41.2022.02.09.08.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 08:44:24 -0800 (PST)
Subject: Re: [PATCH] spi: initialize ret variable
To: Mark Brown <broonie@kernel.org>
Cc: lhjeff911@gmail.com, nathan@kernel.org, ndesaulniers@google.com,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220209163029.2299009-1-trix@redhat.com>
 <YgPs8U85ZFbDWYlx@sirena.org.uk>
From: Tom Rix <trix@redhat.com>
Message-ID: <61a545d5-224d-86fb-2fe3-406c3ffd78fb@redhat.com>
Date: Wed, 9 Feb 2022 08:44:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YgPs8U85ZFbDWYlx@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2/9/22 8:33 AM, Mark Brown wrote:
> On Wed, Feb 09, 2022 at 08:30:29AM -0800, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> Clang build fails with
>> spi-sunplus-sp7021.c:405:2: error: variable 'ret' is used
>>    uninitialized whenever switch default is taken
>>          default:
>>          ^~~~~~~
>>
>> Restore initializing ret.
> Are you sure this is a good fix and that the compiler hasn't instead
> identifed that we should be returning an error in the default case?

If setting mode to idle is not really a valid state, then default should 
return an error.

The old behavior returned 0 and I am treating this as a regression.

Tom


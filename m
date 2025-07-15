Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503F927056F
	for <llvm@lists.linux.dev>; Tue, 15 Jul 2025 22:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752617439; cv=none; b=CUQGrR+aZ2l4c/EY4LvN6vXfJEh7+vHG2uUvfq1tAHowiYrbCTuzoSD99smsT1ASne4qAXtIrBlxvQsSW1vQHdLHAG1fHYD6TUi9of2GFDhIrT/+M/ErW4ybXCsdJ9DpuuWllmpK/9P8+ocVQOlbMGGHrCAs7K1UJJ7FHQUI2Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752617439; c=relaxed/simple;
	bh=7Pi5i8c1oOsD44JSwXy+KCYbfn/pw/8qQKAyrPzsiM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVICchTcjfa57DBEYRZb60fgK3ed7Vsl2rCJ9IKh1QRGto7wwMPi65TLvGM9jGaUhEDUAT0oSr4NZ2ZSFhu26+hU1PTwsuwcGXbP/PNezuuB/s1JrUlWKIXqryCUqJNdRL34Zpe8DqgrOvoKTkeucQ5cnIwtbq32EiGHrWW2NJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TkRzE0YU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TkRzE0YU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752617437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+67HnVcSFpNiw/rBFyAFgRiuoVZq7tztY8c0N72Msk=;
	b=TkRzE0YUBhZDBWV/W4STWsx/aCUT3oU4mJe5C8PsN6SXRWMnPkxfuoAYgBxW4UtMeoO3zp
	071RJYPZU8RhcjL3h9aY5/ctcaNTghkrt6h8m99zUqbqt9kPeIoJGi80DH4NefvxqUnNcz
	Tn+fJHfifNSm38aG5BFXIlsDXsY/mSc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-tY0ujKm9OKmdxmoa4xCSyA-1; Tue, 15 Jul 2025 18:10:32 -0400
X-MC-Unique: tY0ujKm9OKmdxmoa4xCSyA-1
X-Mimecast-MFC-AGG-ID: tY0ujKm9OKmdxmoa4xCSyA_1752617431
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b20f50da27so128687f8f.0
        for <llvm@lists.linux.dev>; Tue, 15 Jul 2025 15:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752617431; x=1753222231;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+67HnVcSFpNiw/rBFyAFgRiuoVZq7tztY8c0N72Msk=;
        b=oJ0G915Cl2HliqdTyPQgie4ZG0q3sh3wxckmd8nnyMeZviUgjlnpd4KvKtkBdQXPmG
         2Mh3MH7BSDUjj5s01pYVX2G5D6ZLbyMpi8dkGxq/T6wOhHeRKR/GoVfBNwIzKyIxzWs/
         joouXmMeNtWc05etQE2GZ8luK5SczGVx9FJvTHsNVX1X8k22FfiTU4LF5AUKmyeng1ac
         Q0zL8P1v1yk1hCckYTiza7HRRCcNHB/9UbfLO8NhQsGdanGpAwiSVuDSBZGBE+Vvgzwn
         ubOTuhB20jPo+BRWMAx9rOdZbzZ+7m3O2fxTwzqRY9f4QBQwmKGTOY54LPW9edenwXaP
         9YYA==
X-Forwarded-Encrypted: i=1; AJvYcCUyFsTZdpEdpp6mEMOffV/LKKDPj5sOt+PXQBBdRsunRTWJy8fYS9X7SzRpjrJD4QRpqTqh@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0leiaxutjMqyHaSGG4Mss+rDrehy+4jJ0rNKdjLWPJ87/WjfG
	XCEmbwryxdfSQ0rjtwZN0+bnbtlL7auUsYaSS5c9ezcozZ844Rw2dN7indi0y8CM64V0qzudZlu
	56kXvDsGk4qmC7WpxS516iD1ZCp5iEgyU19Tbwx3zmZXg1yPT8+UttHw=
X-Gm-Gg: ASbGncuRAYeoC0I1kUIPMQociFr8GHqy5lsegvlzSyoZ1kpqn8dAAnF7y4OeXS0TO2e
	AT86V89KfMZgDCh9jM25ySeWBZW45h49kLaFNnVUUECww3iFI7wKWYQxoZTc+I1eE18+lhS7Lld
	EB6CksqnRAPs59U0Meb9tRCz1OGnYe9U8gWla9E1DYjTQuJpL6Kb+x9ryUU2s6y0GICfiFciKdL
	e22BaCYXVDujQfQk1silYuNmEapEBodUp72EGuYSlvzMpDpj9cE8WPELEYav631Mg6QQVWKpERa
	98+kCJViJs6tIVP4rdZG0EqBnxA3iCILY8HofYC2yrld2QNSemRQsOjLWLugNNSnIcTDGvDLAbl
	LpUQ3dKpVwxQuxLtpkEn5ipJKJG/8RKqfF5FuH5jx7nsf8p+gsk1AeG5EJXyNnx483SQ=
X-Received: by 2002:a05:6000:240c:b0:3b5:f151:207f with SMTP id ffacd0b85a97d-3b60dd400b9mr641203f8f.3.1752617430817;
        Tue, 15 Jul 2025 15:10:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB84MFGi05rY35yL6MIzZQ0EALiVeKmmgXNHM4/pemU7kxyusO5BHrdWD1UdN7S4Bt+4ZHCw==
X-Received: by 2002:a05:6000:240c:b0:3b5:f151:207f with SMTP id ffacd0b85a97d-3b60dd400b9mr641184f8f.3.1752617430413;
        Tue, 15 Jul 2025 15:10:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:4900:2c24:4e20:1f21:9fbd? (p200300d82f2849002c244e201f219fbd.dip0.t-ipconnect.de. [2003:d8:2f28:4900:2c24:4e20:1f21:9fbd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26c97sm16385239f8f.90.2025.07.15.15.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 15:10:29 -0700 (PDT)
Message-ID: <ff2b8113-4fca-4de6-8703-f3e50a27bb68@redhat.com>
Date: Wed, 16 Jul 2025 00:10:28 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/ksm: Fix -Wsometimes-uninitialized from clang-21 in
 advisor_mode_show()
To: Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>,
 Stefan Roesch <shr@devkernel.io>, linux-mm@kvack.org, llvm@lists.linux.dev,
 stable@vger.kernel.org
References: <20250715-ksm-fix-clang-21-uninit-warning-v1-1-f443feb4bfc4@kernel.org>
 <20250715144926.90546c48efc5f288cfde319e@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20250715144926.90546c48efc5f288cfde319e@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g_C5_iyA11IbGkmrDTT6MO_euJo-dAp3-VYCvBT83mY_1752617431
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.07.25 23:49, Andrew Morton wrote:
> On Tue, 15 Jul 2025 12:56:16 -0700 Nathan Chancellor <nathan@kernel.org> wrote:
> 
>> After a recent change in clang to expose uninitialized warnings from
>> const variables [1], there is a warning from the if statement in
>> advisor_mode_show().
> 
> I'll change this to "a false positive warning".
> 
>>    mm/ksm.c:3687:11: error: variable 'output' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>>     3687 |         else if (ksm_advisor == KSM_ADVISOR_SCAN_TIME)
>>          |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    mm/ksm.c:3690:33: note: uninitialized use occurs here
>>     3690 |         return sysfs_emit(buf, "%s\n", output);
>>          |                                        ^~~~~~
>>
>> Rewrite the if statement to implicitly make KSM_ADVISOR_NONE the else
>> branch so that it is obvious to the compiler that ksm_advisor can only
>> be KSM_ADVISOR_NONE or KSM_ADVISOR_SCAN_TIME due to the assignments in
>> advisor_mode_store().
>>
>> --- a/mm/ksm.c
>> +++ b/mm/ksm.c
>> @@ -3682,10 +3682,10 @@ static ssize_t advisor_mode_show(struct kobject *kobj,
>>   {
>>   	const char *output;
>>   
>> -	if (ksm_advisor == KSM_ADVISOR_NONE)
>> -		output = "[none] scan-time";
>> -	else if (ksm_advisor == KSM_ADVISOR_SCAN_TIME)
>> +	if (ksm_advisor == KSM_ADVISOR_SCAN_TIME)
>>   		output = "none [scan-time]";
>> +	else
>> +		output = "[none] scan-time";
>>   
>>   	return sysfs_emit(buf, "%s\n", output);
>>   }
> 
> Ho hum OK, but the code did deteriorate a bit.
> 
> static ssize_t advisor_mode_show(struct kobject *kobj,
> 				 struct kobj_attribute *attr, char *buf)
> {
> 	const char *output;
> 
> 	if (ksm_advisor == KSM_ADVISOR_SCAN_TIME)
> 		output = "none [scan-time]";
> 	else
> 		output = "[none] scan-time";
> 
> 	return sysfs_emit(buf, "%s\n", output);
> }
> 
> Inconsistent with the other code which looks at this enum.  Previously
> the code explicitly recognized that there are only two modes and that
> became implicit.
> 
> Oh well, no big deal and we don't want clang builds erroring out like
> this.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


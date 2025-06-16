Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E1A1FBE9B
	for <llvm@lists.linux.dev>; Mon, 16 Jun 2025 20:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750105732; cv=none; b=Hy4H58/8d2BeZZKL7QljuyaxwQNHeiIkW2xNiJvMNgH/6JnUcXP31fMRTQlyuY1DCKRp6LVp66brhbHAJQftJouQUZetr4OmC7qW9PdXZ3qMlFBqIMltW3teNjOOjmuv6MtrOlcMvSaYbnWvEzKgeRdNLa3ZnzpQcdk7A+/czFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750105732; c=relaxed/simple;
	bh=YUEMCKij4cw6gsjf4i1nGzv6J2HAa+qxkPKnX3YfliM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fT4jZoPjOfpmNzF0/ff2wTCWH+ZtmssmUZ0D5up+Ry0GcnFsqkKyo/hCfsU0l1OMNOrbVDR5DHLa+hZXGjGWIQIzx/Q43RqB4ex2Gy6exU5asAKg8TkzWs9CgkmNFtlFEC7Fp+ab3Rb5/g67e1ev/x/pTxATH78WurQ0sBDoY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X3QkQIKC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X3QkQIKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750105729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i1IPXsOEh/p6y3rDNG7kT8FS6NJiHgtYggv8i7AMSnQ=;
	b=X3QkQIKCWpqzL2eOIqGsPexUTktlCPxfVZNHZ/6aoIfwaGOIzrII/P6rQaPVPwPfiMCgtE
	yFZmQ7UgrsjrMm7mrhUKgxaBJxfmexcirEnkpdww626MKYx6d3TDRyVzhiGcpCbaQpKA8T
	bG3eDm0jO8tZdsrHagfVaprT3MEL9Qk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-_mAvbYPxNlefcQ8MzthUqQ-1; Mon, 16 Jun 2025 16:28:48 -0400
X-MC-Unique: _mAvbYPxNlefcQ8MzthUqQ-1
X-Mimecast-MFC-AGG-ID: _mAvbYPxNlefcQ8MzthUqQ_1750105727
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso2234490f8f.3
        for <llvm@lists.linux.dev>; Mon, 16 Jun 2025 13:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750105727; x=1750710527;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i1IPXsOEh/p6y3rDNG7kT8FS6NJiHgtYggv8i7AMSnQ=;
        b=M6qSTZIrBU321W6iciHAs+5sjxrFjQmBXAy4r+yfko4OeNEievJlrH7jSiEaqeWMMs
         9w8ZLc62r7LCq7cdjMPvDqiDJ9Gjl746vR3PNrBoTywig1jfJcI0kxO7Rv9UwuuBn+/t
         C06efNiXsUoI7c/jFfIHSBKW5ul+axrKXON9yc7OSz21gUc7zYLFegQXFAjhmHuPDWRC
         xPIsuxCmOiIvGCwiiv+BtSK7lQ/nud+UPEm7ONOI61efIM9Zs7qBt+k/fZwmSNzfwiPi
         rFZ+a/mCgXxBKLtVqlGAjE/pOG8Ciig7CCBclXhocykG9YPxakZuzL3UfC76Pty6ejWr
         h9tQ==
X-Gm-Message-State: AOJu0YyCYohFXw78a4apFM4Xw4JtEY2sbSumOXsL1e1B/aXkwmxk9PFF
	3VN9AuBIdEbH+GAnVyWYq1LlIK7wroPKLFAfP/e9+YRLlV17hrkXa5uB2ccuNfMLZCaWLcIkjiM
	I44EeCL5b1KJ1On+qbp/JLsumrIeO9MxTD//Co0mrNq3ArY2y7j6dGT0Ne9T87YQ=
X-Gm-Gg: ASbGncv9qyD+lWfZUAgOMa+qdv5r83M8JRIDY+IUBIt95mgMW48EGjuPLiVzKptBouX
	GVs2bNcF2Ory4axYvYbQFtNC4fsvSEv6K6WBdwLZk7uF5BXQ8rCl+ED5aqkerNRNcIXK0xC3bYY
	UZLOgtbDzFtyWW/sQk8lA8HTsyizdK/hvpI3frX+XCJWPAXkzSGDa5e03K8MaPjL8AAE6EX4CyC
	+/ZF5foA2rGqDAE7jKpQRKHsX5+gkkewKJYzPfc82O7euvAexM3VFkoMiw5Nwil7m4xJFbevMkW
	M3dgB8dOtTWIIaVl4En6isah+qbRSfjWSMZnQWPt+6mY4EiNP9Qqj0xx/RaTv5QJpRDr9S9hhd3
	NspilRmrJ7Nh0iS/1YqwHe4cOvQN4PbIHTPjE8oN5USn6WdGPmA==
X-Received: by 2002:a05:6000:2582:b0:3a5:3a03:79c1 with SMTP id ffacd0b85a97d-3a572e2e062mr7702108f8f.48.1750105726989;
        Mon, 16 Jun 2025 13:28:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG7nU5/7LN/0O+ekOUky7kNwsRWJhG9H1OaqaKshtklk2XpSEzVBRROwu2v7BpseZlkSXqQQ==
X-Received: by 2002:a05:6000:2582:b0:3a5:3a03:79c1 with SMTP id ffacd0b85a97d-3a572e2e062mr7702084f8f.48.1750105726527;
        Mon, 16 Jun 2025 13:28:46 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5? (p200300d82f3ae300c6604ff55bfbf5c5.dip0.t-ipconnect.de. [2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e195768sm155188255e9.0.2025.06.16.13.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 13:28:46 -0700 (PDT)
Message-ID: <ec18001d-7123-4d13-aea7-a28594cd137b@redhat.com>
Date: Mon, 16 Jun 2025 22:28:44 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: clang: selftests/mm gup_longterm error while loading shared
 libraries liburing.so.2 cannot open shared object file No such file or
 directory
To: Christian Heusel <christian@heusel.eu>,
 Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Vlastimil Babka <vbabka@suse.cz>, Shuah Khan <shuah@kernel.org>,
 Zi Yan <ziy@nvidia.com>, lorenzo.stoakes@oracle.com,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>, jackmanb@google.com
References: <CA+G9fYssELHcYKwgGNBMLrfeKZa9swGdLrH7gxqzd4P0kaOiZg@mail.gmail.com>
 <7c101fe5-7c73-4916-a832-d656511eeab8@heusel.eu>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7c101fe5-7c73-4916-a832-d656511eeab8@heusel.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gQqwRyGQRMbZTv7hodoBCauHdup-Zmkp8w34EdTx0BA_1750105727
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.06.25 21:14, Christian Heusel wrote:
> On 25/06/16 11:02PM, Naresh Kamboju wrote:
>> The following test regressions noticed while running selftests/mm gup_longterm
>> test cases on Dragonboard-845c, Dragonboard-410c, rock-pi-4, qemu-arm64 and
>> qemu-x86_64 this build have required selftest/mm/configs included and toolchain
>> is clang nightly.
>>
>> Regressions found on Dragonboard-845c, Dragonboard-410c, rock-pi-4,
>> qemu-arm64 and qemu-x86_64
>>    -  selftests mm gup_longterm fails
>>
>> Regression Analysis:
>>   - New regression? Yes
>>   - Reproducibility? Yes
>>
>> Test regression: selftests mm gup_longterm error while loading shared
>> libraries liburing.so.2 cannot open shared object file No such file or
>> directory
 >> Test regression: selftests mm cow error while loading shared 
libraries>> liburing.so.2 cannot open shared object file No such file or 
directory
> 
> These do not really look like kernel regressions, rather like a bug in
> the userspace testing tool 🤔 Could it be that the tests were not
> rebuilt for the new liburing or that the dependency is not installed in
> the test environment?

It looks like the tests were build with liburing around, and then ran 
without liburing around.

Note that the file for example has:

#ifdef LOCAL_CONFIG_HAVE_LIBURING
#include <liburing.h>
#endif /* LOCAL_CONFIG_HAVE_LIBURING */

You should be running into similar issues with cow.c, which uses the 
exact same approach for detecting+linking liburing.

So seems like something is off in your testing environment?

-- 
Cheers,

David / dhildenb


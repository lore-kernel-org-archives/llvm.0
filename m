Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5667559D
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 13:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646054336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3S17ktpShuLkpMCDawhKpZmIUnAd7X+YczocvP8k9U=;
	b=D6XJiKcQR2vQVfW9qmiip9hSyuFO4BInJIzfhMmfAtl9hkK+FbKV0nqvOT6y386yIlxw1h
	/F1sK60ktUeUae4Xzhmiceh1Wl1JksVXwBcBIhr+qxbprq+MnbZtbdr5J0Uy0rXtwxJoXO
	HuYEzUYZw6G/gomw8xPpwiK9wYeBik4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-ItF5dusKNL6k9RSZsCkH6A-1; Mon, 28 Feb 2022 08:18:55 -0500
X-MC-Unique: ItF5dusKNL6k9RSZsCkH6A-1
Received: by mail-qk1-f199.google.com with SMTP id t10-20020a37aa0a000000b00605b9764f71so10834266qke.22
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 05:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=V3S17ktpShuLkpMCDawhKpZmIUnAd7X+YczocvP8k9U=;
        b=N5q3wF8hb5ab/EQLqEzVre0XalhjdeA7tQF+1W+ym1/uAuy8TWADm4zi45CZlcpux4
         PucbQS/n8iccANZfimN0HRJSryKDcqW44eSq/eOoJG6ZX75dsXi864ESEs7XRfGZNSaG
         LQ+13KeebaVaDt4hFWgY0HHDHFdGOXLJW5UwS66mg0d+8eR+cweU61IsUC8s2QhJiuRL
         lfqKmVHWnUK62eJCS4Z0oTyWNUTC7LPWqZVTDAYRCRGnufa4MMwO5RIvNhvDwfXvkT+s
         KtY8hF6fOCnY832rYgBXBrUW0d6lYUIggb3ILQUCu4d2q81Lwlzcqi2MOYx0CuH+G5/g
         OMhA==
X-Gm-Message-State: AOAM532qV0u1fulWnCNG0p+7PaX6C/xMlllKVbn4h5eG5YsvanK39Wg4
	ayGjQnQew9jd9YXTZTcjtr1Ub0cGyvR+Hide/qua2PMrD3iMxwKDVAsdNforA4ur6hLlHH5Aj/S
	NvJWvimi61vJsT7J56R6ZNSHzOeYslV4PrgzvU3VqitVJDN0FYl2VnbvRf7KA
X-Received: by 2002:a37:a514:0:b0:5f1:8c59:ea45 with SMTP id o20-20020a37a514000000b005f18c59ea45mr10813975qke.169.1646054334738;
        Mon, 28 Feb 2022 05:18:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGeFcU+I1XCZpbdq3sBwWpimaNVMlZLAq4Jix+zHUTpG3vRZyRyR8N2XAlTQiq4xGgw1qpVg==
X-Received: by 2002:a37:a514:0:b0:5f1:8c59:ea45 with SMTP id o20-20020a37a514000000b005f18c59ea45mr10813955qke.169.1646054334442;
        Mon, 28 Feb 2022 05:18:54 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id o24-20020a05620a15d800b00648a9cf86e7sm4951492qkm.33.2022.02.28.05.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 05:18:54 -0800 (PST)
Subject: Re: [PATCH] counter: add defaults to switch-statements
To: William Breathitt Gray <vilhelm.gray@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: nathan@kernel.org, ndesaulniers@google.com, Jonathan.Cameron@huawei.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220227161746.82776-1-trix@redhat.com>
 <20220227174610.0e0e73e4@jic23-huawei> <YhzIFofXbnbFe9N6@ishi>
From: Tom Rix <trix@redhat.com>
Message-ID: <fc462e60-9a33-39a4-a0be-b6331923be74@redhat.com>
Date: Mon, 28 Feb 2022 05:18:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YhzIFofXbnbFe9N6@ishi>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2/28/22 5:03 AM, William Breathitt Gray wrote:
> On Sun, Feb 27, 2022 at 05:46:10PM +0000, Jonathan Cameron wrote:
>> On Sun, 27 Feb 2022 08:17:46 -0800
>> trix@redhat.com wrote:
>>
>>> From: Tom Rix <trix@redhat.com>
>>>
>>> Clang static analysis reports this representative problem
>>> counter-chrdev.c:482:3: warning: Undefined or garbage value
>>>    returned to caller
>>>    return ret;
>>>    ^~~~~~~~~~
>>>
>>> counter_get_data() has a multilevel switches, some without
>>> defaults, so ret is sometimes not set.
>>> Add returning -EINVAL similar to other defaults.
>>>
>>> Fixes: b6c50affda59 ("counter: Add character device interface")
>>> Signed-off-by: Tom Rix <trix@redhat.com>
>> I'm fairly sure this one is warning supression rather than a fix as
>> that type u8 being used in the switch is storing an enum which is
>> set only by kernel code and all values of the enum are covered.
>>
>> However, that's not locally visible so to me the addition looks good, I'd
>> just be tempted to drop the fixes tag as backporting this looks like noise
>> to me.
>>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Yes, this isn't really a bug because the only values available are those
> from the enum, but I see how this is not immediately obvious at first.
> If Tom has no objections, I'll pick this up and drop the fixes tag so
> that we have it along with the other counter changes for the 5.18 merge.

Sounds good.

Thanks,

Tom

> Thanks,
>
> William Breathitt Gray
>
>>> ---
>>>   drivers/counter/counter-chrdev.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter-chrdev.c
>>> index b7c62f957a6a8..69d340be9c93f 100644
>>> --- a/drivers/counter/counter-chrdev.c
>>> +++ b/drivers/counter/counter-chrdev.c
>>> @@ -477,6 +477,8 @@ static int counter_get_data(struct counter_device *const counter,
>>>   		case COUNTER_SCOPE_COUNT:
>>>   			ret = comp->count_u8_read(counter, parent, &value_u8);
>>>   			break;
>>> +		default:
>>> +			return -EINVAL;
>>>   		}
>>>   		*value = value_u8;
>>>   		return ret;
>>> @@ -496,6 +498,8 @@ static int counter_get_data(struct counter_device *const counter,
>>>   		case COUNTER_SCOPE_COUNT:
>>>   			ret = comp->count_u32_read(counter, parent, &value_u32);
>>>   			break;
>>> +		default:
>>> +			return -EINVAL;
>>>   		}
>>>   		*value = value_u32;
>>>   		return ret;


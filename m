Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E46730171B
	for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 20:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760126833; cv=none; b=guAQGa24IBis/9cio+WDihKnu4xNKWDTfVZWBhZcVWbv78VlhQunJZnN4/eDEa5YJLCXz7q5vcJbBKSynya6e3XTrCCCfDOUm05TOsyGLthjq+DFKCJjqVUnj823ExnPHaK6RSkYjQ9P6kxmhZtPCsynRai+6lnBXNGAgX/8Seo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760126833; c=relaxed/simple;
	bh=qJNQginXw33OCL6otz/mio9dtPI95vuO0c28D6VMtAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jlQlVdFPTFZ0MdkNUeZZgmKC8HwKVkbkN3U0MihV5lrzB4eVmJV03jBuI/cv/MhoTA80wVEdC1eWYmgN+AMedqINJq3rcvv6GMCM5KLCZTc6hFaDJKRU1C+w6IUNRGYNVdCTU4xknvtrP9I2JdRn7wrPRv8WdAqj3TkC0Z3ygMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h9ckVc1u; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h9ckVc1u"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-912d4135379so100334239f.1
        for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760126830; x=1760731630; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1C9TGYFUXxVemAwR89Ulh9sGzSp7qA+8XlrADAfHgVc=;
        b=h9ckVc1uaK9ldX3TDFZqMAqQw92ohwt2RYRDilEZCZpUZvhMS5yhdvU+jB/fn6NTew
         NDKDjgw9XjP9RujSy9iZYkcDYqg0mZ0+6bSLcfkEbrWrSEYkrGGBykAS0ohg6CEhN+Xy
         VHahfLXu3OMnwE2HhPH1n2fxVmgyg8kP9O2m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760126830; x=1760731630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1C9TGYFUXxVemAwR89Ulh9sGzSp7qA+8XlrADAfHgVc=;
        b=KVcW7X/1fTZ51a2znn8GWHgow/9CnwjzoRJQYKfP/iMKzgbTK7vhzi8WBouczqDGDi
         KpCyN87mIkv7lQLT51nap9iYgg5Q7/n2a3alIPj2lNxY9SQmrVRvuWIpWme7xXNg0c3O
         gBXJIeF2ASMoDfnAKHqEerSLSp8He+rQHF0+VL/JPPJi6UhhQSWRElcZzcZ7aQsvE/AN
         gjjTCnQEn48Dexb9hPbbL9DDpxhtetC7VC/gl4mS8492a6vAmWz3oWgJPk/jSOjYhSRh
         QnYv2yPnKLdSpUq20nV9BAqtAtgo9xWD6lGeSDM170I+E01LzrvTGlJ3DSQjLzoG/3OA
         DCYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd/f7XLrmfYgyuWFhQKzNdiKhFk7i5/nxnbKTl9IX5SQU928KANwZLR6ygKRfevTtr5/iU@lists.linux.dev
X-Gm-Message-State: AOJu0YytZCD4HzC4oqIBBjNurTut54FOS4LSPMnKqOeZjxKu+EuvXbxI
	UdtrstY3w095XYYs37Pb9wvbnYaOPJp9HHnw20ZxP5jfBSq+lDq+NJY+OowcbUxsuCE=
X-Gm-Gg: ASbGncvluty0f0z+sL0GJ1Ny7YwB6NyPZQ+D2DLlSyr5wHSLWkk2EDOmiqCtKCYKx6G
	ZgxZBSPHlHbM8Pp13Ah/H/eFaDEUONuQAnPlNwLSEgyI/qCkvocA+IU5ZVuFuZQPeKgrAMTWnkx
	0QbrRKi3avP4Lc2lrzTniktnDrbVrjPLqq8CGCwLLeZWLIefg4idVF7SDItl7HE+TYEWq3WDAX8
	SP6fR9pJYkFe1U3/xQwGtNihxzEvOMl6xc4u0cMvzckVl1kD47isxXpOimwltdcvsCnb4r/5rSn
	cFysRHi6y1zFvPcSTwG2qcSJ7bBlTqDYRAq/jRvz9RJdc7Bpd5vdhYmA9o8qBhXsfiwTQ/ADPx6
	hbpXaEdvrCRLjcvQQhFbx7a5UiA08w02OuZcdegU737Ytp0IH9pGvTA==
X-Google-Smtp-Source: AGHT+IF47OBorJnDZLxogs92bg9DbP41Re55bcWPxH2LtcWYwZh2W54OFZb8SOadJVjAyPp0dDz4Zg==
X-Received: by 2002:a05:6e02:2186:b0:42e:6e45:e0a3 with SMTP id e9e14a558f8ab-42f873544bfmr138691105ab.2.1760126829993;
        Fri, 10 Oct 2025 13:07:09 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f9036cee5sm23494755ab.32.2025.10.10.13.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 13:07:09 -0700 (PDT)
Message-ID: <75584276-6d30-4e35-9e59-e084c60d1c5f@linuxfoundation.org>
Date: Fri, 10 Oct 2025 14:07:08 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] selftests: cachestat: Fix warning on declaration under
 label
To: hannes@cmpxchg.org, nphamcs@gmail.com
Cc: nathan@kernel.org, shuah@kernel.org, morbo@google.com,
 justinstitt@google.com, nick.desaulniers+lkml@gmail.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, david.hunter.linux@gmail.com,
 Shuah Khan <skhan@linuxfoundation.org>,
 Sidharth Seela <sidharthseela@gmail.com>, SeongJae Park <sj@kernel.org>
References: <20250929172724.75108-1-sj@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250929172724.75108-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/25 11:27, SeongJae Park wrote:
> On Mon, 29 Sep 2025 17:24:06 +0530 Sidharth Seela <sidharthseela@gmail.com> wrote:
> 
>> Fix warning caused from declaration under a case label. The proper way
>> is to declare variable at the beginning of the function. The warning
>> came from running clang using LLVM=1; and is as follows:
>> --
>> -test_cachestat.c:260:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
>>    260 |                 char *map = mmap(NULL, filesize, PROT_READ | PROT_WRITE,
>>        |
>>
>> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
> 
> Reviewed-by: SeongJae Park <sj@kernel.org>
> 
> 

Johannes and Nhat,

Assuming this will go through cachestat tree

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Let me know if you would like me to take this through my tree.

thanks,
-- Shuah

Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2257B72
	for <llvm@lists.linux.dev>; Sat, 20 Nov 2021 00:16:50 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id s14so11834537ilv.10
        for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 16:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QdcpYj8Ya7TgsiSo0zXQg+j2JxFNjYPDgCsajefoarg=;
        b=UYYN+tHet+ZKfdibSzAAAHNON8NxQt9HKNYbmdgsAoPXoyl+So8H+PwMoTuIUKes2Z
         yEh8KY4CWaEjM9Q8ke4Z4Qay/b5/oyuXrDpnvOfsni2F9vs/q0wgAiBqiWR+But/55vg
         C5sGMM9Ru7Lioy1g/XnJB5xf6VziACFbrJv60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QdcpYj8Ya7TgsiSo0zXQg+j2JxFNjYPDgCsajefoarg=;
        b=vKBTOw5+1FX4r+Ye7RPC+Iy7DjdYrvW9epbhcXj2QERvVCLUarOuobKxevJyTguQSA
         THq5b3BF6yg5vUPpu+YU5+mUoiWwgnEiby9n7iiZmVgQFU3H5y+dYIOf9hpU+bETUzEJ
         /Thx4Duy71mA0rxs3J2fFc9xnzZmK4v8m1KvBrvutmqcfjZNKlHLjEH5d3jEXvaPVgmF
         /W9Al7oAizGYWP39gZUmffepKnot6tUvfE9Fpnq4sLjzy9P0cB8jRgldkKhxGfuSDpTH
         i+Y7wgY7+5sautjlDTVEKb55rV0UYIq9ikgFmGkB+9sZviCpo/ggcZO61nqcriRoNuMU
         K8fg==
X-Gm-Message-State: AOAM5326fFqe1nxMoBz9jrEKBRLKSRnzXqDyMd/4dR7UeC+j+wLELvwG
	JJwmUbzs2iJl0l1bu6lXepzNIw==
X-Google-Smtp-Source: ABdhPJzIEM05T6Zpl3No9G9ZEmtv+51gqOm+8FZxnaSZjPVxnRAg5iyA7UylaFGvWOyS4KtnhCA+8w==
X-Received: by 2002:a05:6e02:156a:: with SMTP id k10mr7449888ilu.200.1637367408959;
        Fri, 19 Nov 2021 16:16:48 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id q13sm955457ilo.25.2021.11.19.16.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 16:16:48 -0800 (PST)
Subject: Re: [PATCH] selftests: vDSO: parse: warning: fix assignment as a
 condition
To: Nick Desaulniers <ndesaulniers@google.com>,
 Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, nathan@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20211105162756.3314148-1-anders.roxell@linaro.org>
 <CAKwvOd=dtb98Ue1xYz0gQmRGeQWdH6sBEkpXioevPQ94envK8A@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f4ba0730-d997-396e-29a6-157e05a04166@linuxfoundation.org>
Date: Fri, 19 Nov 2021 17:16:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=dtb98Ue1xYz0gQmRGeQWdH6sBEkpXioevPQ94envK8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/5/21 2:17 PM, Nick Desaulniers wrote:
> On Fri, Nov 5, 2021 at 9:28 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>>
>> When building selftests/vDSO with clang the following warning shows up:
>>
>> clang -std=gnu99 -Wno-pointer-sign    vdso_test_gettimeofday.c parse_vdso.c  -o /home/anders/.cache/tuxmake/builds/current/kselftest/vDSO/vdso_test_gettimeofday
>> parse_vdso.c:65:9: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
>>                  if (g = h & 0xf0000000)
>>                      ~~^~~~~~~~~~~~~~~~
>>
>> Rework to a parentheses before doing the check.
>>
>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> 
> Thanks for the patch!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> 

My commit script failed due to checkpatch warns. Run checkpatchp.l --strict
to find the problems and send me the fixed version.

thanks,
-- Shuah

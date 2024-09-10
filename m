Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A1E199389
	for <llvm@lists.linux.dev>; Tue, 10 Sep 2024 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981074; cv=none; b=hhqYJyZck7oGt7JHPpyOh+02DoDgx4HYXcV7b4+/S7Efy7kmGfQiDfBf9m0pBCnCclDO1IQbmse2NwH0PTF9pFwzQnv1kMz/+EVtzUmw+NVOvS/l2SqrWrVXel1SE3IylGsf9bfp6bpvYGl4wFc1OxB2Oi+GkK0ttsVtZs+hqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981074; c=relaxed/simple;
	bh=prLlPjWTsc2LP0znA1j/xItWCYCvZhEOWpqEYX0advg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OxKMhKoPXYs3Hq2NAuWi7x4CA64owIj3Ys2UHo5yaW1UcP7n5oGPs4dTFRfc/nvo3frM2QtaXZs3Kt+avQqPjMQILCaiNukpr+bGN4Z+7iQMTmgc3HB+vfjsZ2kIaT5WyNIK6TNZmWu8v2rfJPTU8YxgnUbYgOhVzl+/njms7eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h9IpLZ/w; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h9IpLZ/w"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c7e64b60so529073f8f.2
        for <llvm@lists.linux.dev>; Tue, 10 Sep 2024 08:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725981070; x=1726585870; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4omZGnwLy9o5pCzuwFX+0s6xgGqjQG3r3xzFhc8Ovk=;
        b=h9IpLZ/w7rSBqrZLhiwUCJdz/AYt8M2PsEQ0GOGzw26rEKrdvKL5X/RKzB4GM67m71
         T0FWLTfB12ANKNM+PR3iKeAUeBir4y5WPKiDhcPEO8k9vlFsI1rm07Hie/ZsT+LoQ1DB
         KdAvZSzihirN4sV3eTJ2i7Wn3KQbj7/eN6HzuaZYlAXAErBnKqkRJJDv0c+MVTPQz7UE
         HEb4mJ0TzCXJSKe6v5HlexhpbKsO3Cua9HiM4qIXjJPYIv7wWvc0bUTHbmVisFgeru1M
         4bziew8FFan0c2cxY5lTeGS2G+THySjhkvi2MXVqugov7nFI+TJJP6Z9vcSmLdgPiTQ0
         wRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725981070; x=1726585870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4omZGnwLy9o5pCzuwFX+0s6xgGqjQG3r3xzFhc8Ovk=;
        b=gaOkFVyvvbFa/lyBJAe8+XPpzFfFGO73rJYXuQt8bKwctM+1+1N4K+4hDo0k2NKmUE
         j/UBV6Qmk4+5WEHyseEEgtscLEjW4xx4QLe6hfkGrOXS7cMnv9yw9h4Y3CI1XEEKSj2m
         yj77ek2vosf+3lerxXsWqa7pxedeLwxEIKGD0ta2OGF+QvJhTS7dHa34k8N4A8+GbR4Y
         C5rxsB3AhLO1Qt/tfIvs23AO5Lb08FyrhPzQDudw5xEI2FRuOmJ4WIj8AE/wAKsk2uPc
         WX3U06iwsgMrAnEMVa/hpKS8Bod4fRbXmHVH8HuWXmz5bUXU3oESCv4WKzouESjDs7Oj
         7vWw==
X-Forwarded-Encrypted: i=1; AJvYcCUb1XwXOp8/gkrSf7Df1aeTg5EYRRxKZiG6e1x+nb5rlfmGz/Lel0NsoYrgYwzj2Jsn2EAy@lists.linux.dev
X-Gm-Message-State: AOJu0YwobaNOgZ0URQWzmPB2FckSwCGmpKcnjqznMrl/5BMxvqbUEZzz
	j3VYVk/t6xcSiUW3tfB5zFFMsv7o5xZEbchsIWe4u6Up1VPHDYvVV/uEJM+U6zI=
X-Google-Smtp-Source: AGHT+IH84Qhesqc2MQ8kxebwny3AJtf0ZcLT4gkcsxiOZjP6fqWKqRjUPUNK42wE33dQ9hF54eF0WQ==
X-Received: by 2002:adf:a3d5:0:b0:374:baf1:41cb with SMTP id ffacd0b85a97d-378b07966fdmr11699f8f.4.1725981069896;
        Tue, 10 Sep 2024 08:11:09 -0700 (PDT)
Received: from [192.168.1.61] ([84.67.228.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378a72367b6sm3494235f8f.52.2024.09.10.08.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 08:11:09 -0700 (PDT)
Message-ID: <307568b9-9b6b-4eaa-973c-8f88538b8545@linaro.org>
Date: Tue, 10 Sep 2024 16:11:18 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf build: Autodetect minimum required llvm-dev
 version
To: Quentin Monnet <qmo@kernel.org>, linux-perf-users@vger.kernel.org,
 sesse@google.com, acme@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Changbin Du <changbin.du@huawei.com>, Guilherme Amadio <amadio@gentoo.org>,
 Leo Yan <leo.yan@arm.com>, Manu Bretelle <chantr4@gmail.com>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
References: <20240910140405.568791-1-james.clark@linaro.org>
 <b2e813c4-be89-457d-8c38-38849177ec93@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <b2e813c4-be89-457d-8c38-38849177ec93@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/10/24 15:27, Quentin Monnet wrote:
> 2024-09-10 15:04 UTC+0100 ~ James Clark <james.clark@linaro.org>
>> The new LLVM addr2line feature requires a minimum version of 13 to
>> compile. Add a feature check for the version so that NO_LLVM=1 doesn't
>> need to be explicitly added. Leave the existing llvm feature check
>> intact because it's used by tools other than Perf.
>>
>> This fixes the following compilation error when the llvm-dev version
>> doesn't match:
>>
>>    util/llvm-c-helpers.cpp: In function 'char* 
>> llvm_name_for_code(dso*, const char*, u64)':
>>    util/llvm-c-helpers.cpp:178:21: error: 
>> 'std::remove_reference_t<llvm::DILineInfo>' {aka 'struct 
>> llvm::DILineInfo'} has no member named 'StartAddress'
>>      178 |   addr, res_or_err->StartAddress ? 
>> *res_or_err->StartAddress : 0);
>>
>> Fixes: c3f8644c21df ("perf report: Support LLVM for addr2line()")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/build/Makefile.feature           |  2 +-
>>   tools/build/feature/Makefile           |  9 +++++++++
>>   tools/build/feature/test-llvm-perf.cpp | 14 ++++++++++++++
>>   tools/perf/Makefile.config             |  6 +++---
>>   4 files changed, 27 insertions(+), 4 deletions(-)
>>   create mode 100644 tools/build/feature/test-llvm-perf.cpp
>>
>> diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
>> index 0717e96d6a0e..427a9389e26c 100644
>> --- a/tools/build/Makefile.feature
>> +++ b/tools/build/Makefile.feature
>> @@ -136,7 +136,7 @@ FEATURE_DISPLAY ?=              \
>>            libunwind              \
>>            libdw-dwarf-unwind     \
>>            libcapstone            \
>> -         llvm                   \
>> +         llvm-perf              \
> 
> Hi! Just a quick question, why remove "llvm" from the list, here?
> 
> Quentin

Just because with respect to the linked fixes: commit, it wasn't 
actually there before. It was added just for addr2line so it should 
probably be llvm-perf rather than the generic one.

But yes we can add llvm output if it's useful, but could probably be a 
separate commit.

Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BC15FB8A
	for <llvm@lists.linux.dev>; Tue,  9 Jul 2024 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720558303; cv=none; b=jqpdBL58vYSnlLy3dTrU/30FlJu/EPsuVP7ODv1mUuWMZ6oThRVEHecn6hH0KU+p7zbAAcvcdGDl46xFXsKceTaODIUO9FJYzLLdsZh7yG66ODf1jFpfivICDYeB10QdTlD/hWM6RAQ18JowyFfHEkUsZdrKs01t+bfHqMAxSOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720558303; c=relaxed/simple;
	bh=UIhfklEojLDQfKqDzlwiV+qYzjKtVVw9UeAmeQy8piY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IAIn7Tbr3XeKRhFJtWB0t4E7/SieSuG9zusnTSOTMhK0w8DDyct7h7apUBDaUtkOToJNuA1/Xj8xgefoqVffYlarfdE6eD5+/FbcljtDhIrILTUXYCs52VYxBl9ycpzl5QLWhHkY8IJFVB8neNoQGrm1GcRIheK2fA/PFJ6ywiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mdl+/L/B; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mdl+/L/B"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7f7c41f1bb5so9066839f.3
        for <llvm@lists.linux.dev>; Tue, 09 Jul 2024 13:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720558301; x=1721163101; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UIhfklEojLDQfKqDzlwiV+qYzjKtVVw9UeAmeQy8piY=;
        b=Mdl+/L/BUB8Or+YN7IGxp1TraU9tbMHQnZ3FieDiTT4yIhU3xa2WZqRPFB5aRo6R0h
         0PPYdGWuZDeYGTEKkniIkIC7Wuj/zyeETWVUrMxgGguV+aQb0A4IdroDmadauZ1Hq1Fv
         EvB2KKPwc6fDcjt7Of6NwTKOjGkqE6O9lAvTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720558301; x=1721163101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UIhfklEojLDQfKqDzlwiV+qYzjKtVVw9UeAmeQy8piY=;
        b=ukCJppykvIgC3IjVMsV3/cxGNKMsqE+s7abHBN0tx7+/NHc8dekxtkPdDsv8qEZKV3
         X0wDO8XP/HaT7S+4YngzNQJjyxkT3k6OhXsypMSwrx+spVtQ2cU9gyes+5XseAdrzfIE
         kYeD+cW30vJwM/W0QVa3vhEBF4Pqv9PKidcG9cxD7P6G7AbtyBKqOwHlsnOvIbc8//t2
         bJtoZWFFm0coN6Wn9RS1KNijPlGzJljhxZ86KSME9RbJ5siLYgB38sZWf2C6a9LWsk5m
         GFGHyx8pUTWG+NhNG4dIHrEo0xZB7EooFahxaLt/nNe2wkq4z+aNYVRt4nABlyRP3tJn
         unwA==
X-Forwarded-Encrypted: i=1; AJvYcCVktmZumLyszTkWmowUXagzUtdpTeRdc6rAvPYAbAOMB9LpZ+DB3e+WFVVmJtWlCJ9fzfVs6ht67E5RcprxKV1SW5XD3Q==
X-Gm-Message-State: AOJu0Yy2buOzXsivFJgO3OdSiWkcaNJM5CjlVS2DfTjPkja1WloO5+rL
	uIXNWE0tOd2qz09yPJbB5UoislUpUO2yxZHzYVsLkhITJwNg66iMM70SNZRl9AE=
X-Google-Smtp-Source: AGHT+IEqMVN2v6iXfRRRelBibAQXZalOQUm9pKB32R2RN8hexYBdUR2mGYYnXtQP1/9U74HqyIxrgg==
X-Received: by 2002:a05:6602:3413:b0:7f9:90c5:4107 with SMTP id ca18e2360f4ac-800023b5fdcmr489122939f.1.1720558300852;
        Tue, 09 Jul 2024 13:51:40 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c0b1c138f9sm690522173.148.2024.07.09.13.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 13:51:40 -0700 (PDT)
Message-ID: <78c3ed1e-32b2-43aa-9979-0479fa524018@linuxfoundation.org>
Date: Tue, 9 Jul 2024 14:51:39 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] selftests/x86: fix build errors and warnings found
 via clang
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: angquan yu <angquan21@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ingo Molnar <mingo@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Sohil Mehta <sohil.mehta@intel.com>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, x86@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240704072431.111640-1-jhubbard@nvidia.com>
 <a08e6846-2f9e-4fb4-910f-b33fe779fa01@linuxfoundation.org>
 <49c14f8f-0c08-41e0-b987-7c4253edf6de@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <49c14f8f-0c08-41e0-b987-7c4253edf6de@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/9/24 14:40, John Hubbard wrote:
> On 7/9/24 1:34 PM, Shuah Khan wrote:
>> On 7/4/24 01:24, John Hubbard wrote:
> ...>> Muhammad Usama Anjum (1):
>>>    selftests: x86: test_FISTTP: use fisttps instead of ambiguous fisttp
>>
>>
>> Usama and John,
>>
>> I am seeing checkpatch warnings in this series.
>>
>> v4-3-7
>> WARNING: externs should be avoided in .c files
>> #210: FILE: tools/testing/selftests/x86/fsgsbase_restore.c:46:
>> +unsigned int dereference_seg_base(void);

This one looked new though.

thanks,
-- Shuah

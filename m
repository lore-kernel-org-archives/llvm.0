Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD59D2C82
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643383836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1MzpLEHNt998Fp+0Cju8ZrRTa2fyOAxv9mE2xz2mj8=;
	b=RHCWMW/M80xhF6VAmDFK9fitsDJxxnM3wnsaF79bbSMisX8fwMzm1bk+tPquR9uORVHjTc
	0NDlFeZhnCxo04d1Zw9T5TgSxGwzf8Dq1vKQTL5iy/KBE7NqejNIknYHX5uSslUkbJ6WGb
	JnezzaM0jBbGhj0AF669oPbbHkZc4tY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-mLq2rsA9PaOR52lpxUUIRg-1; Fri, 28 Jan 2022 10:30:35 -0500
X-MC-Unique: mLq2rsA9PaOR52lpxUUIRg-1
Received: by mail-oi1-f198.google.com with SMTP id t6-20020a056808158600b002cec2812d52so3367359oiw.9
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 07:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=R1MzpLEHNt998Fp+0Cju8ZrRTa2fyOAxv9mE2xz2mj8=;
        b=lCpfS4rcc72YQs/ySpXU4dcbAfHHWdMihN5H1q9m/++8rgQbMWWQlC2XX/7kIAUAqF
         s85wSGSypIGP0o36nn4RU9GaPlgf8/T4Ydyee84e/KBwJY2J+Zc7B9783I06MBvMn9c+
         ToMu+4pgPlmTpve4ZXIpnf1J0tHXwngd6mOERjqcKVeIQ4Xnrg0EAxQHNEfrmz1MCM0v
         ZSKwpEY2BOrhYSiXoxIPYaxKWP+WQty2Q1QAjGRpqHajWxSnmK/EsrOrNy1nGgCzE/0K
         xzBkGqCrf2r8VXzG5+bavqJxI4S9apjOLiVkqrCTsD5Nov7n+bA9DUnmXrlNBEw7VBoC
         lPOA==
X-Gm-Message-State: AOAM531Qmmw85xN91B0bdrBR7LQWofJyx2GF3jrP+5+B/tH9Pb4DwqRo
	7izAGvSLtcnhbwlHbtAI6tVgQl6f5/qzZvtIYaz0ZVSEEVETHQjH0wJqeXhe07/jlPzNVFqMNMI
	R62anWqhkgW+snJ3V2EbiXwfwCZYYQTygHJwTSBbU+Tn9+T2WHNnA+CjwAnoB
X-Received: by 2002:a9d:69c1:: with SMTP id v1mr5199562oto.134.1643383834534;
        Fri, 28 Jan 2022 07:30:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrc2gAf4ubCCj0EwhXokMaa2jqu7rpkjWiv6FEjBV/7u+RmiWHylH0XXldFnbrntjxa/Fp/Q==
X-Received: by 2002:a9d:69c1:: with SMTP id v1mr5199538oto.134.1643383834219;
        Fri, 28 Jan 2022 07:30:34 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id ay14sm13152476oib.5.2022.01.28.07.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 07:30:33 -0800 (PST)
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
To: Joe Perches <joe@perches.com>, Nick Desaulniers
 <ndesaulniers@google.com>, Finn Thain <fthain@linux-m68k.org>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: kashyap.desai@broadcom.com, sumit.saxena@broadcom.com,
 shivasharan.srikanteshwara@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, nathan@kernel.org,
 megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20220127151945.1244439-1-trix@redhat.com>
 <953eb015-4b78-f7b-5dc1-6491c6bf27e@linux-m68k.org>
 <CAKwvOdnWHVV+3s8SO=Q8FfZ7hVekRVDL5q+7CwAk_z44xaex8w@mail.gmail.com>
 <fb308f51-f16b-3d9b-80c2-180940236b00@redhat.com>
 <5554a75f65fddab4de60d61fd503fe73773dafbb.camel@perches.com>
 <c801989d-5f3e-84d2-24a0-7022be70da98@redhat.com>
 <7bff2de309384b7c9ee71ad90881d1e0bbe0a781.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <0567fce4-256a-e1b1-dc66-221ba97153d5@redhat.com>
Date: Fri, 28 Jan 2022 07:30:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7bff2de309384b7c9ee71ad90881d1e0bbe0a781.camel@perches.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 1/28/22 12:41 AM, Joe Perches wrote:
> On Thu, 2022-01-27 at 21:31 -0800, Tom Rix wrote:
>> On 1/27/22 6:43 PM, Joe Perches wrote:
>>> On Thu, 2022-01-27 at 16:32 -0800, Tom Rix wrote:
>>>> On 1/27/22 2:47 PM, Nick Desaulniers wrote:
>>>>> + Miguel (the clang-format maintainer), Joe (checkpatch maintainer)
>>>>> These criticisms are worth reviewing.
>>>>>
>>>>> On Thu, Jan 27, 2022 at 2:38 PM Finn Thain <fthain@linux-m68k.org> wrote:
>>>>>> On Thu, 27 Jan 2022, trix@redhat.com wrote:
>>>>>>
>>>>>>> From: Tom Rix <trix@redhat.com>
>>>>>>>
>>>>>>> checkpatch reports several hundred formatting errors. Run these files
>>>>>>> through clang-format and knock off some of them.
>>>>>>>
>>>>>> That method seems like a good recipe for endless churn unless checkpatch
>>>>>> and clang-format really agree about these style rules.
>>>>>>
>>>>>> Why use checkpatch to assess code style, if we could simply diff the
>>>>>> existing source with the output from clang-format... but it seems that
>>>>>> clang-format harms readability, makes indentation errors and uses
>>>>>> inconsistent style rules. Some examples:
>>>> Problems with clang-format should be fixed, I'll take a look.
>>>>
>>>> I was reviewing this file for another isseue and could not get past how
>>>> horredously bad it was and really did not want to manually fix the 400+
>>>> formatting errors.  I will drop this patch and use the use these files
>>>> to verify the .clang-format .
>>> I think this is more an issue with clang-format than with checkpatch.
>>>
>>> If you have specific issues with what checkpatch reports for this
>>> file (or any other file), let me know.
>> Yes, I agree. Its a clang-format problem.
>>
>> I will be looking to minimize the .clang-format settings to only those
>> that agree with checkpatch.
>>
>> Then add settings back in later if their problems can be worked out.
> Another option would be to use:
>
> 	./scripts/checkpatch.pl -f --fix[-inplace] [--types=<list>] <files>
>
> where types is an optional list of specific things to change
>
> see:
> 	./scripts/checkpatch.pl --list-types --verbose
>
> to show the possible types.
>
> Only some of these types can be changed with --fix or --fix-inplace
>
> If using checkpatch to change formatting, it sometimes can be useful
> to run checkpatch --fix multiple times on the same file as a
> checkpatch --fix can create a change than checkpatch will suggest
> should itself be fixed.
>
> Of course another option is to do nothing as many will complain,
> sometimes senselessly, about 'churn'.

A testsuite for the fixers may help with churn

Any interest or thought on organization ?

I can take stab at one.

Tom

>
>
>


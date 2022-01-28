Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC37F2CA5
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 05:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643347875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OD6WAteNVjoEL5BdQQseFUQxBcO/VHXKit43SSCC07c=;
	b=CHEeGk76PCcr2FYL15DJSWQQJpmgQbziyjMtlEpirF6c6fgFEj7VOwvbsJLSEceXcgkPbZ
	Wi5Z/dWyRwdRasa5hQW6BJXeqVhbNH0Cp+w1fR7Az27fKvDOXLS2GEQwqkC7S/TCwD3LG5
	Pg53ShCLa5dJfdx3u8ojDNrA8vt/iW4=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-W2zw-3FzMfmV_gok6bApLw-1; Fri, 28 Jan 2022 00:31:12 -0500
X-MC-Unique: W2zw-3FzMfmV_gok6bApLw-1
Received: by mail-oi1-f199.google.com with SMTP id bb20-20020a056808169400b002cd940d6247so2679593oib.7
        for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 21:31:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OD6WAteNVjoEL5BdQQseFUQxBcO/VHXKit43SSCC07c=;
        b=6Yim0TaMr4hQmJkNomplNz1u++fJ+0NJeY7Y5v7jcLH1dpnbGSC4wivWQ4lEJbm5Cy
         zshK3zaYCfgHdH9e6hKH8JemynJA2g3BnVWft47QMHgqS4E+g5Mf2/7DZ3zwnXj7PJfF
         PXWiiqR+Vfymmomtqz2mDh/lHKupV8F7HdXJH8NA2/wg5lvi2ZOM1fUw3/jFwSeddWlH
         yPO5ZQNM1ItldNK159xKZtJYV8DdE0RZslhgc4wqZ458QVzaOnbfC5xSI2TlcSLqRn74
         D29hnthJWG2udmQ59KUJX215ysPM07D03xU/INB62T6vNlTGyZwwWZDZm9IsvaxbUDYO
         Ek0A==
X-Gm-Message-State: AOAM530JpIoO/wYEc2BDoX/und662/pzJY271hYTU5HP53kcTzfQCeqM
	duFE0sYuCs8CWuzLAT+3bRw3oBAn4X2/Evn1CGnM4b6tAr79zMlbskLjlrDowjhuv+Qo3eGLJ+6
	YOhaNiStQyvAgcwfIyVA68FBhlR0e1OpP66IGlvVR/BXG/JjUKyko5fBBTl0z
X-Received: by 2002:aca:45c4:: with SMTP id s187mr8701066oia.306.1643347871460;
        Thu, 27 Jan 2022 21:31:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuhkflKEAecETUqZfO5ziqGnq0F7Y7PbpsqMcaOvz3syLgEDVc9dZjOB54pRce/FUMMXYg5g==
X-Received: by 2002:aca:45c4:: with SMTP id s187mr8701050oia.306.1643347871213;
        Thu, 27 Jan 2022 21:31:11 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id m7sm2628382ots.32.2022.01.27.21.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 21:31:10 -0800 (PST)
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
From: Tom Rix <trix@redhat.com>
Message-ID: <c801989d-5f3e-84d2-24a0-7022be70da98@redhat.com>
Date: Thu, 27 Jan 2022 21:31:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5554a75f65fddab4de60d61fd503fe73773dafbb.camel@perches.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 1/27/22 6:43 PM, Joe Perches wrote:
> On Thu, 2022-01-27 at 16:32 -0800, Tom Rix wrote:
>> On 1/27/22 2:47 PM, Nick Desaulniers wrote:
>>> + Miguel (the clang-format maintainer), Joe (checkpatch maintainer)
>>> These criticisms are worth reviewing.
>>>
>>> On Thu, Jan 27, 2022 at 2:38 PM Finn Thain <fthain@linux-m68k.org> wrote:
>>>> On Thu, 27 Jan 2022, trix@redhat.com wrote:
>>>>
>>>>> From: Tom Rix <trix@redhat.com>
>>>>>
>>>>> checkpatch reports several hundred formatting errors. Run these files
>>>>> through clang-format and knock off some of them.
>>>>>
>>>> That method seems like a good recipe for endless churn unless checkpatch
>>>> and clang-format really agree about these style rules.
>>>>
>>>> Why use checkpatch to assess code style, if we could simply diff the
>>>> existing source with the output from clang-format... but it seems that
>>>> clang-format harms readability, makes indentation errors and uses
>>>> inconsistent style rules. Some examples:
>> Problems with clang-format should be fixed, I'll take a look.
>>
>> I was reviewing this file for another issue and could not get past how
>> horredously bad it was and really did not want to manually fix the 400+
>> formatting errors.  I will drop this patch and use the use these files
>> to verify the .clang-format .
> I think this is more an issue with clang-format than with checkpatch.
>
> If you have specific issues with what checkpatch reports for this
> file (or any other file), let me know.

Yes, I agree. Its a clang-format problem.

I will be looking to minimize the .clang-format settings to only those 
that agree with checkpatch.

Then add settings back in later if their problems can be worked out.

Tom


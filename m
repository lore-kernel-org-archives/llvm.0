Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CB51FC6
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 15:24:01 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id h11so24526676ljb.2
        for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VStffjPSoNuLVmgDL/ileLhw4nppALw1IFNpnjw+ytU=;
        b=BSrsVveb2Ov8wixMuMVEF0afp0t9GItWPOTZos5ZRGOn853uCe9L80l6HaT2uoI+PZ
         dnHRW8B+/F0Sd7bg/sTthP04nX1KwcfAOL56k2+KMbjyeYLsg73rBvNISTLBaGgRHsCj
         qXLus9ixicO3LD1Jqd+lgKZrsqX7YMX3jKZQM2Qbv67Vx2nvzT93b8R2oq8FJrmt+Qzk
         bLEwY6oHS8k4dWdTg/DZ6gNtfD+p4KTG4hfq/f7cG0GJOS0abEpiu7NF/roFpvTzDH5k
         yMuJZ29VRGw4x8NAGwc+lBpY0x+47fLIRfyAbG3+Ert2383Es+T7wYv83OScKUWw8sMy
         qgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VStffjPSoNuLVmgDL/ileLhw4nppALw1IFNpnjw+ytU=;
        b=TdLSQ5lptYrfasVtE6o1d8zQg67LaEQcVgeRkf15Lh8vwOJtlFIqA7NKuPnOL6deSV
         qBL58RL64cwdP/Y5xWg0msMoR/PUhhP2NYjE24B/rfcIIVKIjMKpkLDs31YkPPb9mUdH
         1STAK8IG6/qqM0/Q2G8hZb87A1ORIfUR5kjUvdDgr3fWsCDx1qe8Hnb82RUsE/DuwObD
         pzBC4oMrZZ1+by5W9bF99Z7jDQOzrTmEWtdv7c2DW2GeRksLm0oTwguJrtpmLzX6wuk6
         /73px/8TZI5vYpTu18cu/rUhH2ytZXyVB9Eft8TOscCaaPKyOLJ936swlCeI4mS0IH+b
         JHug==
X-Gm-Message-State: AOAM532vnIaHPINC8ieo94obj42F2Rn3B1jmQlD2fUWA7+Mdgo0MkLbn
	KZEtdQIxAq1Vg3KRYxPncus=
X-Google-Smtp-Source: ABdhPJx8ntIZ64Ep+1//eaVIjzbkY6UpyEKqOwRsH3Vumux5OXak8LEcuT8NThTvX5bZM+fbF/uzDA==
X-Received: by 2002:a2e:381a:0:b0:24b:68ae:4169 with SMTP id f26-20020a2e381a000000b0024b68ae4169mr5020616lja.208.1649777039712;
        Tue, 12 Apr 2022 08:23:59 -0700 (PDT)
Received: from [192.168.31.104] (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id o26-20020a198c1a000000b0046bc20821f6sm126079lfd.115.2022.04.12.08.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 08:23:59 -0700 (PDT)
Message-ID: <1c8fa321-d91e-c906-a7da-c252a112191b@gmail.com>
Date: Tue, 12 Apr 2022 17:23:57 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] block: Remove redundant assignments
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 "Richard Russon (FlatCap)" <ldm@flatcap.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, llvm@lists.linux.dev
References: <20220409101933.207157-1-michalorzel.eng@gmail.com>
 <20220409101933.207157-2-michalorzel.eng@gmail.com>
 <a56d1184-d399-d5f8-765f-5a4f35dacd5e@redhat.com>
 <446a3e88-4c14-300d-862a-1279274c3760@gmail.com>
 <c2c40f00-777c-f19a-eb5f-6e978ddd6bcf@redhat.com>
From: Michal Orzel <michalorzel.eng@gmail.com>
In-Reply-To: <c2c40f00-777c-f19a-eb5f-6e978ddd6bcf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tom,

On 09.04.2022 18:03, Tom Rix wrote:
> 
> On 4/9/22 6:20 AM, Michal Orzel wrote:
>> Hi Tom,
>>
>>> On 4/9/22 3:19 AM, Michal Orzel wrote:
>>>> Get rid of redundant assignments which end up in values not being
>>>> read either because they are overwritten or the function ends.
>>> This log is the same as your last patch.
>>>
>>> Instead of a general statement on deadstores, a more specific
>>>
>>> analysis of the setting being removed would be helpful.
>>>
>>> This will mean splitting the patch to match the analysis.
>>>
>>> Tom
>>>
>> I think that this explanation in a commit is enough for such a trivial patch.
>> It informs that we are fixing clang-tidy findings related to deadstores
>> in a block subsystem. What analysis would you want to see?
>> Something like "Remove deadstore assignment ret = -EINVAL  in a function bio_map_user_iov" ?
>> I think that it will create too much of not needed overhead.
> 
> The compiler should remove these already.  All of the static analyzers produce false positives, if you do not provide analysis the reviewer has to assume you have not done any and has to do the false positive analysis themselves. This burdens the reviewer for something of small value that can be dismissed as churn.
> 
> Tom
> 

Ok, I will split the patch into series in v2 and I will add some analysis into commit msg.

Cheers,
Michal

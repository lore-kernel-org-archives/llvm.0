Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E072115
	for <llvm@lists.linux.dev>; Sun, 22 Jan 2023 22:27:55 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so13713644pjg.4
        for <llvm@lists.linux.dev>; Sun, 22 Jan 2023 14:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/dAZopDqbAo3QdY1k+KfmF5laZlZPUhPOvXWpz29n6Q=;
        b=Te1loueT5FFT0///54ss+EGi5NnqZVnF66p9MrcSE2rlWW1aIYLlCCmGTCSW0F6DSF
         zGy/XhMPjWNOg0DTMdyryIdeC6S94qekXqZk6buO+/Y1zMPfGEuPKe1HnPmE+ScrERWn
         xI0FN6LDwN/9ZhC6ZxOtaJRABzDIs/aJ7ag5KnguVVe25wjnO9VF6p7+lMwTFL65IFcD
         gYlMIM1RXLCrAEXfPrPZoDmNxd0gYLglpwxFXhBXpa316k2GQE2o2N4FFVpLefP8Lhf9
         Xcqt1FTx9L0iCGSIFzYdmU532nJrR280DdX4Ubcy0mcevXrzERjnxXMMVfUgJYIabw5P
         V7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dAZopDqbAo3QdY1k+KfmF5laZlZPUhPOvXWpz29n6Q=;
        b=M7lrB4MIdImO2IX8cuHImxRgfyFToDS0WOD6CJyofveh17IU3XVu+4jwuPAhT1WnCf
         K+nphL7hRXUy1X8PPi+Hj1LhRbePPLJM6qSSCtYKqkqgFjAv/g3/g5qL6nFKAmD/HCq9
         VCEZBQgASDy6sc9z+Md3o8MYEmuoDZMkulay9BAEQeufldP3OlcchJszYDmfEzXlroxG
         u0NQEmAYxK/NWuinNwlJLa+n1cROTDwU2/p+OtHiubhZ0HqicfZUG1Y0YdkBpSbbpMLO
         HVwbib5PFqzbgAZv1o4MdlquDAIGXtA5ZovUCQ4SpeHmFKXAERf7yat3aqdcP3qIU7dX
         MLqg==
X-Gm-Message-State: AFqh2krK+EiKLXBjFKjwlqkw2Yg9EmHxNx7Q5Ijy4bx0GNTBt5gZcPdQ
	CzDffhW7aTQL78ih20By7D5CRw==
X-Google-Smtp-Source: AMrXdXvaxXC+r8949o3MWU3crnBc0kvErgg9rRt/S+eh5ENhV+3MuHcztG7rmUXpDJjEAnKh9bEC/A==
X-Received: by 2002:a17:902:9041:b0:193:3a44:c436 with SMTP id w1-20020a170902904100b001933a44c436mr5527342plz.6.1674426475215;
        Sun, 22 Jan 2023 14:27:55 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id t16-20020a1709028c9000b001947ba0ac8fsm3706940plo.236.2023.01.22.14.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 14:27:54 -0800 (PST)
Message-ID: <1ce4f09a-f4c3-ccd5-556e-3eb3aaa143f1@kernel.dk>
Date: Sun, 22 Jan 2023 15:27:53 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] paride/pcd: return earlier when an error happens in
 pcd_atapi()
Content-Language: en-US
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Tom Rix <trix@redhat.com>, tim@cyberelk.net, nathan@kernel.org,
 ndesaulniers@google.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230122154901.505142-1-trix@redhat.com>
 <1a501bc9-7058-6c47-0ebf-44459bc0e730@kernel.dk> <Y820PCtcJv12fJpI@ZenIV>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Y820PCtcJv12fJpI@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/22/23 3:10 PM, Al Viro wrote:
> On Sun, Jan 22, 2023 at 01:49:00PM -0700, Jens Axboe wrote:
>> On 1/22/23 8:49 AM, Tom Rix wrote:
>>> clang static analysis reports
>>> drivers/block/paride/pcd.c:856:36: warning: The left operand of '&'
>>>   is a garbage value [core.UndefinedBinaryOperatorResult]
>>>   tocentry->cdte_ctrl = buffer[5] & 0xf;
>>>                         ~~~~~~~~~ ^
>>
>> Has this one been compiled? I'm guessing not tested...
>>
>> In any case, this code is going away hopefully shortly, so let's not
>> bother with changes like this.
> 
> 	Look at the callers - the value left in entry is discarded if
> ->audio_ioctl(..., CDROMREADTOCENTRY, &entry) returns non-zero.  Sure,
> it's a nasal daemon territory, but realistically it's not going to be
> caught by testing.

I don't expect anyone really to be able to test it, but v1 had a pretty
basic issue that would've surely triggered a compiler warning had it
been compiled.

-- 
Jens Axboe



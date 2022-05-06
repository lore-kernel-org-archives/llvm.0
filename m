Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9027F
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 15:09:44 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id iq10so7297964pjb.0
        for <llvm@lists.linux.dev>; Fri, 06 May 2022 08:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=12UMdmYoYrrFYK3VfNeGnEK3WmXz254CwsHVBYebRMk=;
        b=LASvZd/kr+O0L5A3bEKuR8CTk3fHm5Tsd9lUjfYwpqn33d7k3Q1zsMSLxqM2Wvmjfi
         U9X9eV7HuBPN5VQdn6QkXC7TyhZPYAzEmjTJjpaD5GIOeD6QowBVqIADEj4QvOrPEVtg
         ixMVdzrHVAvfbZZWmaW4tVERpTCm8iDa/gmWxbCttBjaVWUI+z2M45U6eU6/izM7UmEw
         06W6+xGWjrV9ntNXVSJcxZeWZPlDMQeHyRKnhuxcRvfzKtHy8hThyvLAr/AALg2Mc12H
         wnFPOPC2IlEl29O2OH/A+ASOIh9PPps0VTvp/TnkmuOcnlQwc43q1Oz0o8B4VKCBOUQ8
         GpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=12UMdmYoYrrFYK3VfNeGnEK3WmXz254CwsHVBYebRMk=;
        b=UrEbYjO64FAy/xnaaL0ugsCa7Fc1cqRC3BiH4erP51SOl41Cg4YcBAtBupjjHO9G21
         5jNKDtpEedooLbuUkOl4mEwohsHNqozR5rtN3cPF5Dn9yUAFgJO5XWlN4CRaaYWiTJx1
         9bdF+Vq83NvAgfdOMemVAw4usssE4Y94GJJoWcKf8/pKASyf1GfYylLFqe1XqQ1lA1su
         UMK8wOm+iWdkt8auvSwbsDpwwTQo+tnXXwFNA6z/mwk/0xOnd6lrO3YXgmOXWtR2jO9r
         ybYUcy3NW2/TRrdi9rHhaZMYTjVal/YZ72fIA0uL2MBmFGB/idsq9X+aQy+9pbjReGgV
         sXag==
X-Gm-Message-State: AOAM530fcSgZzv94D+EmUCfSQhP6AEXTtCMAHxX3g48fTFN70ofo27UR
	Z6XqVTCKSWs80UaI2LKm1Nczug==
X-Google-Smtp-Source: ABdhPJyXNCnjMbf233x1TRm9Ax9LXKujaxCcbwMHpOtAWrTw2hiA71j0kvmsMI4qbPaIDzeMtLIaSQ==
X-Received: by 2002:a17:902:ec83:b0:15e:b5d2:a81b with SMTP id x3-20020a170902ec8300b0015eb5d2a81bmr4083716plg.64.1651849783670;
        Fri, 06 May 2022 08:09:43 -0700 (PDT)
Received: from [192.168.4.166] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id d15-20020a170902b70f00b0015ea0a679ddsm1868392pls.251.2022.05.06.08.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 08:09:43 -0700 (PDT)
Message-ID: <4a87c2d9-89fa-2cec-7707-08fc78c88bf8@kernel.dk>
Date: Fri, 6 May 2022 09:09:41 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] nvme: Ensure ret is always initialized in
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Kanchan Joshi <joshi.k@samsung.com>, Anuj Gupta <anuj20.g@samsung.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20220506150357.2443040-1-nathan@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220506150357.2443040-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/22 9:03 AM, Nathan Chancellor wrote:
> Clang warns:
> 
>   drivers/nvme/host/ioctl.c:674:6: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>           if (ns)
>               ^~
>   drivers/nvme/host/ioctl.c:677:9: note: uninitialized use occurs here
>           return ret;
>                  ^~~
>   drivers/nvme/host/ioctl.c:674:2: note: remove the 'if' if its condition is always true
>           if (ns)
>           ^~~~~~~
>   drivers/nvme/host/ioctl.c:672:9: note: initialize the variable 'ret' to silence this warning
>           int ret;
>                  ^
>                   = 0
>   1 error generated.
> 
> Initialize ret to zero so that it cannot be used uninitialized.

Thanks, will fold this in.

> Or alternatively, remove the 'if (ns)' if ns can never be NULL; I tried
> going down the rabbit hole to see if that is possible but I got a little
> lost :^)

For the admin queue, ns can be NULL.

-- 
Jens Axboe


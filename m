Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD1DA93A
	for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 15:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679584762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9JfTMOmWgVFviT3j1h1ZVlXRJuPtZf94XGhzCpT7TZI=;
	b=jLTQ1vaM/Pj1cL5OKcCYKuefgMRr2NwkFH8yBJzqAMKhAI/73islrDaHDyx+pKAbB6Z7zF
	8R6eSRDsBx2LKMaWTBNySrU2Bw9a69q/+oCCyXbFeYcnZtwMPVnZ1IUv8IvuzqIgh3IkXK
	7lXqtZsXQ+VenaDeSD+nun3SHao21wA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-RwDnlBkIOuyjX7phPRzJfQ-1; Thu, 23 Mar 2023 11:18:14 -0400
X-MC-Unique: RwDnlBkIOuyjX7phPRzJfQ-1
Received: by mail-qt1-f197.google.com with SMTP id y10-20020a05622a164a00b003e38e0a3cc3so2781307qtj.14
        for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 08:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679584685;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JfTMOmWgVFviT3j1h1ZVlXRJuPtZf94XGhzCpT7TZI=;
        b=UWY4XS6Gt/3EnThRSOHTsjS+E1+/ntr7LwOzr1shddGMEgJMBHvJjPTnFiZXbqn4+P
         FtxzgzpB3GhQehNCr9UV/9OS3SjQnjt2s3yJEX/zfzF+PJohTErvdbaD4OAWrukOVfQC
         RZUxWeNy0sK3sMtnakzkIM3dE2EBrcVI+KB7IEhGhk/UlMnfNZGVAkycunNNtDwACDdT
         EGjCqw079HYcb4l2fYFWzc4WMYYVqL9GQLwNtVhtTGTbBTmhjMkx6cyqSmUStpzcQyo7
         Gu78x3sgSLL2mPtwTtLZqpeFZMqe0B2fHymo9Mmr3EfuhiItZ6eAcbz3023ehcAfS8fL
         0bWg==
X-Gm-Message-State: AO0yUKW8wsdSR6vAq9ZzkaZy0SuaxhzRe4wPdrRXn8sa/dVG4YlNgHdz
	XNv+StrrA0BWMlqIyxN0PmrCUSlSWZb/JrLAYpDY3LGrR+jriZVSyD6/O+iy6vlrHBxS4PKgm1K
	5XtfoipZfZ3Db1f6obQywK2qkCwa9nAFDblHoK/1+3NGRvZUv1HQrZBRL6+paIUjnPdxb
X-Received: by 2002:ac8:5bcc:0:b0:3e1:65f5:4a85 with SMTP id b12-20020ac85bcc000000b003e165f54a85mr13130763qtb.58.1679584685652;
        Thu, 23 Mar 2023 08:18:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set8LNOQxfUqAJQEgzeCPGIWCE6BE+k4IT7L6mRJOClAlDS0h+wmBxg2TVB0f+9BHgFC2x3KR1g==
X-Received: by 2002:ac8:5bcc:0:b0:3e1:65f5:4a85 with SMTP id b12-20020ac85bcc000000b003e165f54a85mr13130718qtb.58.1679584685365;
        Thu, 23 Mar 2023 08:18:05 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id w8-20020a05620a424800b0073b587194d0sm13656463qko.104.2023.03.23.08.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 08:18:04 -0700 (PDT)
Subject: Re: [PATCH] mISDN: remove unused vpm_read_address function
To: Simon Horman <simon.horman@corigine.com>
Cc: isdn@linux-pingi.de, nathan@kernel.org, ndesaulniers@google.com,
 kuba@kernel.org, alexanderduyck@fb.com, yangyingliang@huawei.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230321120127.1782548-1-trix@redhat.com>
 <ZBsArtzFkgz+05LK@corigine.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <bfc6db20-e094-7fd5-21b5-3d0b81fb494f@redhat.com>
Date: Thu, 23 Mar 2023 08:18:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZBsArtzFkgz+05LK@corigine.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/22/23 6:20 AM, Simon Horman wrote:
> On Tue, Mar 21, 2023 at 08:01:27AM -0400, Tom Rix wrote:
>> clang with W=1 reports
>> drivers/isdn/hardware/mISDN/hfcmulti.c:667:1: error: unused function
>>    'vpm_read_address' [-Werror,-Wunused-function]
>> vpm_read_address(struct hfc_multi *c)
>> ^
>> This function is not used, so remove it.
> Yes, agreed.
>
> But with this patch applied, make CC=clang W=1 tells me:
>
>    CALL    scripts/checksyscalls.sh
>    CC [M]  drivers/isdn/hardware/mISDN/hfcmulti.o
> drivers/isdn/hardware/mISDN/hfcmulti.c:643:1: error: unused function 'cpld_read_reg' [-Werror,-Wunused-function]
>
> So perhaps cpld_read_reg should be removed too?

Yes, i will add and respin.

Thanks,

Tom


>


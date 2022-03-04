Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2442D6AAC
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 22:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646433523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pCMnoGKikt99i+bOvmFuu+myd6ACV9D1g1NEWSuvSEg=;
	b=Ju81av7NAYGQnDByVpAudHCGDHWHeNUreSEwi3oTY0yNEGekhVQpC3ytSYFmG3iBPIidoj
	8x7ul80uFpjjtKwP07rUOfk3+7v/vtJ7hj41G80fNMAxhgoYmJ75bs6U+p47unMIVVMoh9
	P/0ryn9gGsW0oqSYysRZeqDvsnvIXa4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-YwLM7f71OgqkFtuwvY1Uyw-1; Fri, 04 Mar 2022 17:38:42 -0500
X-MC-Unique: YwLM7f71OgqkFtuwvY1Uyw-1
Received: by mail-qv1-f70.google.com with SMTP id m19-20020a056214159300b004352bebfd8bso6964155qvw.6
        for <llvm@lists.linux.dev>; Fri, 04 Mar 2022 14:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pCMnoGKikt99i+bOvmFuu+myd6ACV9D1g1NEWSuvSEg=;
        b=s6ISt5oY5TAyBDqazUHf3vkr1Sy5SUOVbDv13mWnWRmLh3j5c5Naw6iIrOA+13CTVI
         IAxNoGBQY87i1HwIhps4a/i0NBtnYcdxbKT/ns+GpHma77ZNhyDCtSVD3/FSBW1176Ci
         uYzii+t0VHo08KcQ2ntupsVzxRyTEHFmPxA/+jUjbjOpr92i9b+FEUi3pzFs1v/j7VY+
         KtZJcEk7qqGL8EZQxJBb0gbI9Yw/D82jqMzYgWHINCTsF51GgYdbZ4Ior+7ggxjsDrSK
         ySP3kunDvJEBN5AkeQR2saGVNyObC+yEXux4oPjSO3oVNqxgMWXbtTcrFjMC18rtwRC7
         S/0w==
X-Gm-Message-State: AOAM530DPyng8PTDcXjL98i5m1h62bKxjYj7PIE9Q4z/UZ0462pJ3oDz
	tkopO7Bp0Go+bzfuuJHFGDxgEs93h+B5LvE4bkJ7QlRYVRALPskdH9l0seW6JppJGkBcuAvz4xn
	4fOodHdBT05RaXYMU3WGsaSGWFayuk1ECuvPqavaILOCq8nErvs7StkTcPjNt
X-Received: by 2002:a05:620a:372c:b0:67a:de08:875e with SMTP id de44-20020a05620a372c00b0067ade08875emr574251qkb.149.1646433521472;
        Fri, 04 Mar 2022 14:38:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1p6YxKKR4VWsIy4ZmjNNbsE6elG5BIMU9tJKjj/hlKR7R2HxTWr2egC175Bkb4O+EYPxtiA==
X-Received: by 2002:a05:620a:372c:b0:67a:de08:875e with SMTP id de44-20020a05620a372c00b0067ade08875emr574221qkb.149.1646433521171;
        Fri, 04 Mar 2022 14:38:41 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id d16-20020ac85ad0000000b002d71c463d9csm4117216qtd.24.2022.03.04.14.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 14:38:40 -0800 (PST)
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Joe Perches <joe@perches.com>, Finn Thain <fthain@linux-m68k.org>,
 Konrad Wilhelm Kleine <kkleine@redhat.com>,
 Bart Van Assche <bvanassche@acm.org>, kashyap.desai@broadcom.com,
 sumit.saxena@broadcom.com, shivasharan.srikanteshwara@broadcom.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, megaraidlinux.pdl@broadcom.com,
 scsi <linux-scsi@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
References: <20220127151945.1244439-1-trix@redhat.com>
 <d26d4bd8-b5e1-f4d5-b563-9bc4dd384ff8@acm.org>
 <0adde369-3fd7-3608-594c-d199cce3c936@redhat.com>
 <e3ae392a16491b9ddeb1f0b2b74fdf05628b1996.camel@perches.com>
 <46441b86-1d19-5eb4-0013-db1c63a9b0a5@redhat.com>
 <8dd05afd-0bb9-c91b-6393-aff69f1363e1@redhat.com>
 <233660d0-1dee-7d80-1581-2e6845bf7689@linux-m68k.org>
 <CABRYuGk+1AGpvfkR7=LTCm+bN4kt55fwQnQXCjidSXWxuMWsiQ@mail.gmail.com>
 <95f5be1d-f5f3-478-5ccb-76556a41de78@linux-m68k.org>
 <CANiq72kOJh_rGg6cT+S833HYqwHnZJzZss8v+kQDcgz_cZUfBQ@mail.gmail.com>
 <7368bc3ea6dece01004c3e0c194abb0d26d4932b.camel@perches.com>
 <9dc86e74-7741-bb8e-bbad-ae96cebaaebc@redhat.com>
 <CANiq72nsKijH4zgLoEpiiq4462r1zYmaiDs13SEHDYR3aQziUw@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <4f535f31-b993-7365-4964-9f7549afc2a1@redhat.com>
Date: Fri, 4 Mar 2022 14:38:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CANiq72nsKijH4zgLoEpiiq4462r1zYmaiDs13SEHDYR3aQziUw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/4/22 6:02 AM, Miguel Ojeda wrote:
> On Fri, Mar 4, 2022 at 2:46 PM Tom Rix <trix@redhat.com> wrote:
>> The churn level will be very high.
> Nobody is planning to reformat the entire kernel, at least not until
> the tool is close enough to the kernel style, which will take a while.

The churn on a single file like this is high.

There is no way to separate just one type of change, you get all the 
changes.

Not having an opt-in/out per type of change is a flaw that makes 
clang-format not ready.

Tom

>
>> Until clang-format has an opt-in mechanism, I do not think clang-format
>> should be used.
>>
>> .clang-format should be moved to staging/ to reflect its not being ready
>> status.
> What is not ready about it?
>
> It is a fairly useful tool that some people is already using, either
> for full file formatting or for sections within their editor.
>
> Cheers,
> Miguel
>


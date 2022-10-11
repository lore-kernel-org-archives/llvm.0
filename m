Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2553C14
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 16:17:47 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id w18so22405031wro.7
        for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 09:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8p+Ph8umyk1fiV8rOh8aDOZpPjjfRG0WHPagf8EYGjI=;
        b=LD0gGXDMEqnlsIxmg0Bf/DhQPtX3hLNQyJtg7EC16SmGNowy/93F7CLepmdLP417rL
         4tREBjrSdHGSA/WBUkWANyn51X4CKiDUtc/bBqmqW1l9dCcVktSKDhziGWMFDFx2FfEk
         00aCa49AU1QzBU61GiEqOzXUUjkp7P1Cw0I5ifW503DsoATwzYap0kC3aaXDs58plncF
         UGvfQ/aMdB8N7MHHd5tNx0SFUcRTECD7AZjCJ0xX30IRmb/rbEXX+AbmrfvyqT0E6ypG
         k5+z8/p86SDwGtxQgD+Pg1K9AYiBcKhpcFooG1QfKfHRv4LBWVHU/Hs7IRmLGRIuZgKr
         oJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8p+Ph8umyk1fiV8rOh8aDOZpPjjfRG0WHPagf8EYGjI=;
        b=M/zQfcNs0SRr0fOnq1IglvhO+V5rJ6+zyx0Pg94cDjx51BEESN3zIaNRGpTSJ7O5qg
         g/s0EDao8EQj0EvkSKp4G4p8L914+MKtut1WdlVHW5a+U1SBhxfBQ9gH19JtCK2Wh9xy
         XyvM1KQ6OvB63X+ESdacEQngcBZ1p7nr2otJsyQMvV2QwDpoAXfMfnEvRXULdtNkLLqc
         D7A9Bsfeyfu8iTIwjjf5+SngKr1mT6uONTvjIFWrOq0YHlqaa6/Y4OsK96I1hhSSRzAL
         oSmqUVpPoS+v50C/4cK+tOo+pXom75KRQ4fPDrKf4PQ4eVSXn4s3HDzxJl6tadjiVeSq
         PdCg==
X-Gm-Message-State: ACrzQf1g8IRoZ23OJ9v1BqViLh2MYDZxtrQoBNgKfeH9099GfXeoDs8o
	6eBm3VNT4getNSwIlGQ0Cba3OA==
X-Google-Smtp-Source: AMsMyM7gpUdapuVTKHfKEDpK7jYbQ5SOEi2bep8snUSDGTh015napIGgYLeHXayu6RLOZacsubuMVw==
X-Received: by 2002:a5d:64cd:0:b0:22e:4af7:8182 with SMTP id f13-20020a5d64cd000000b0022e4af78182mr16328525wri.453.1665505065986;
        Tue, 11 Oct 2022 09:17:45 -0700 (PDT)
Received: from [192.168.178.32] ([51.155.200.13])
        by smtp.gmail.com with ESMTPSA id t128-20020a1c4686000000b003b4a699ce8esm11025005wma.6.2022.10.11.09.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 09:17:45 -0700 (PDT)
Message-ID: <9ea9fc0c-41e7-d7cc-7822-dcfab9398d7d@isovalent.com>
Date: Tue, 11 Oct 2022 17:17:44 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [bpf-next v8 0/3] bpftool: Add autoattach for bpf prog
 load|loadall
Content-Language: en-GB
To: Wang Yufen <wangyufen@huawei.com>, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, davem@davemloft.net, kuba@kernel.org,
 hawk@kernel.org, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
References: <1665399601-29668-1-git-send-email-wangyufen@huawei.com>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <1665399601-29668-1-git-send-email-wangyufen@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

2022-10-10 18:59 UTC+0800 ~ Wang Yufen <wangyufen@huawei.com>
> This patchset add "autoattach" optional for "bpftool prog load(_all)" to support
> one-step load-attach-pin_link.
> 
> v7 -> v8: for the programs not supporting autoattach, fall back to reguler pinning
> 	  instead of skipping
> v6 -> v7: add info msg print and update doc for the skip program
> v5 -> v6: skip the programs not supporting auto-attach,
> 	  and change optional name from "auto_attach" to "autoattach"
> v4 -> v5: some formatting nits of doc
> v3 -> v4: rename functions, update doc, bash and do_help()
> v2 -> v3: switch to extend prog load command instead of extend perf
> v2: https://patchwork.kernel.org/project/netdevbpf/patch/20220824033837.458197-1-weiyongjun1@huawei.com/
> v1: https://patchwork.kernel.org/project/netdevbpf/patch/20220816151725.153343-1-weiyongjun1@huawei.com/
> 
> Wang Yufen (3):
>   bpftool: Add autoattach for bpf prog load|loadall
>   bpftool: Update doc (add autoattach to prog load)
>   bpftool: Update the bash completion(add autoattach to prog load)
> 
>  tools/bpf/bpftool/Documentation/bpftool-prog.rst | 15 ++++-
>  tools/bpf/bpftool/bash-completion/bpftool        |  1 +
>  tools/bpf/bpftool/prog.c                         | 78 +++++++++++++++++++++++-
>  3 files changed, 90 insertions(+), 4 deletions(-)
> 

The series looks good to me, thank you!

Reviewed-by: Quentin Monnet <quentin@isovalent.com>

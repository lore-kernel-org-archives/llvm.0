Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CBF33ED
	for <llvm@lists.linux.dev>; Thu,  9 Feb 2023 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675950994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Y1joeNdYJ7b/1/klwyqyf65Bv+i6Ox7LCf5OuDMUyY=;
	b=Oc/Y3RZs8q5NWc87xNvMvSqrSKB89vczbaJ0zOYBej9rsZrhqfxZGVwg9JBJ2jz+53Xyii
	Dv0+QZ5vxh+o+TVB/6XLo3W1lTZB7FGbP71GjQx/ClRZnQEofOTUvAhyvX7ChR4zkYCusY
	dVte0E/eqhOiMdfOfFeDK4c0Qi0qk2s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-177-Wqj8frSLPlO_VTbaEcnBng-1; Thu, 09 Feb 2023 08:56:33 -0500
X-MC-Unique: Wqj8frSLPlO_VTbaEcnBng-1
Received: by mail-ed1-f71.google.com with SMTP id p36-20020a056402502400b004aab6614de9so1500400eda.6
        for <llvm@lists.linux.dev>; Thu, 09 Feb 2023 05:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y1joeNdYJ7b/1/klwyqyf65Bv+i6Ox7LCf5OuDMUyY=;
        b=HQVtbKlX85Ji0NJdUJVuDqSA3EKBMOvtU5Jdd9wM21ZCaQavLJXjQvj9TOASqEVXUk
         p3DQIWbk6p34giPSRWix8hN3IjDS2MlfNYnrEiVH4X5tT0QRx4DL/Bk/08Ikz4/LW0WZ
         zbI38396mGhOBupCWKtTkF5PbPt5VsrZpBd7aJLDmXehDdzkoWQniM9+AZh4am4RW2lD
         keEUH5XUFAsWModfktVTQYCh3VmHw9XOM/SDUUjZ5vRfKslIwcrboVIBRseaJcMKV6OL
         d19LFcmqQDz7E7ryzJPfXcENJb3/Kdyu5M+aTOFB3ePlt0v0pmiSa3MLbk7/PHDh+tRI
         jOGA==
X-Gm-Message-State: AO0yUKUvNqEsjlEpIx3e0TLHa+SYYOjRJReNFjxkScmnXWS2ag3l6BKI
	AStx3HDW1xHaXKeMZ2RCr7sF3AmCi+6+keLpXl9ydsZt1+BTM47Jfljc59kl8E1YNcgLbBbM7uR
	BveT5x5DUqGLMWLhxseI=
X-Received: by 2002:a05:6402:194d:b0:4ab:1715:2858 with SMTP id f13-20020a056402194d00b004ab17152858mr4109689edz.11.1675950991945;
        Thu, 09 Feb 2023 05:56:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/rRi6gsWVma21TmnsOmaUPrCABx15ptYtiwRoMF39J6s62FtDltEJsH0rjNZMggaFe7tZSYA==
X-Received: by 2002:a05:6402:194d:b0:4ab:1715:2858 with SMTP id f13-20020a056402194d00b004ab17152858mr4109677edz.11.1675950991787;
        Thu, 09 Feb 2023 05:56:31 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id k8-20020aa7c388000000b004a2067d6ba4sm786081edq.52.2023.02.09.05.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 05:56:31 -0800 (PST)
Message-ID: <1433ea0c-5072-b9d9-a533-401bb58f9a80@redhat.com>
Date: Thu, 9 Feb 2023 14:56:30 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] KVM: VMX: Stub out enable_evmcs static key for
 CONFIG_HYPERV=n
To: Vitaly Kuznetsov <vkuznets@redhat.com>,
 Sean Christopherson <seanjc@google.com>
Cc: Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20230208205430.1424667-1-seanjc@google.com>
 <20230208205430.1424667-3-seanjc@google.com> <87mt5n6kx6.fsf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87mt5n6kx6.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/9/23 14:13, Vitaly Kuznetsov wrote:
>> +static __always_inline bool is_evmcs_enabled(void)
>> +{
>> +	return static_branch_unlikely(&enable_evmcs);
>> +}
> I have a suggestion. While 'is_evmcs_enabled' name is certainly not
> worse than 'enable_evmcs', it may still be confusing as it's not clear
> which eVMCS is meant: are we running a guest using eVMCS or using eVMCS
> ourselves? So what if we rename this to a very explicit 'is_kvm_on_hyperv()'
> and hide the implementation details (i.e. 'evmcs') inside?

I prefer keeping eVMCS in the name, but I agree a better name could be 
something like kvm_uses_evmcs()?

Paolo


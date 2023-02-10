Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E54A29
	for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 09:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676022923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XlYTQ4KlxOnSSgOz5EYIJQVx78dcnp/7ObBZhHdZOfo=;
	b=AFYsqaLP07REA8xGySf/LhwgISCO51Xn1ILsKIBY+XgUubhDocHPoLU0fLtdD592oaFqeY
	In6cvGHCgGFInltu6m+rZDe9cVmZs8Wbg3DwVsxmk/Z3oB8O9RtPqVqX7gj9e68ANph+Sm
	vlQzT2luRFl/w+7mR5kRGSZR5ur2mtU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-wZfglyESPpaqiiAkPNLjIg-1; Fri, 10 Feb 2023 04:55:21 -0500
X-MC-Unique: wZfglyESPpaqiiAkPNLjIg-1
Received: by mail-ej1-f69.google.com with SMTP id ud13-20020a170907c60d00b0088d773d11d6so3287065ejc.17
        for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 01:55:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XlYTQ4KlxOnSSgOz5EYIJQVx78dcnp/7ObBZhHdZOfo=;
        b=PHSw7zKJ/oL9BDhaGevAF52mpkgjZphVZNROoa+DSdeOYxbyYtTgvCS7Zdrs8TLkwv
         9mKZ0BKgb3rDdaRwB/FuAAe1TWvf1KxMW+A8osThw01RONyH1bzQvU8eHdC+h/oY23Fb
         6Wg3Aq5i/Q37np/KNNg6Kg9nsd1myk9ehqxpsVPK1FCT7od3XDJxnoOGz161IFVmW/nG
         w51l7fMwKLonoRzvOW8hgho0LHC06fhHiq1EpnAQDcVQyR649SiKNiyMpqmJkFDy0VnD
         Sd9ITxbaerPsCiTEwLptDWoQHIMGo5+8n/8j+as9GW6VcxUeqAGxcaNFm6m+QB0pZqC3
         sgQQ==
X-Gm-Message-State: AO0yUKUUj5dVng+QR9ayKpnoTQ7M+eeuibkCgo8rfOzEpwIx7Kc+F/XM
	zkzjmdgpklpl0tuDfwyDIAiDIN6IFFpl3weqfyKpm9nZtlwx9q+QuFOaHsd0nj31l4KcFuTcEf3
	jFIWzSvsdk76w7A==
X-Received: by 2002:a17:907:8e86:b0:8aa:33c4:87d5 with SMTP id tx6-20020a1709078e8600b008aa33c487d5mr14015956ejc.10.1676022920962;
        Fri, 10 Feb 2023 01:55:20 -0800 (PST)
X-Google-Smtp-Source: AK7set8l6KUkKlyqNem1AZE2/KhW2JD0JqV9K6hSx1e0fgBDbFsSiIPL5QzIdySg4c0oOxOTyn5rmw==
X-Received: by 2002:a17:907:8e86:b0:8aa:33c4:87d5 with SMTP id tx6-20020a1709078e8600b008aa33c487d5mr14015949ejc.10.1676022920808;
        Fri, 10 Feb 2023 01:55:20 -0800 (PST)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906469200b007c0f217aadbsm2140397ejr.24.2023.02.10.01.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 01:55:20 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Cc: Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/2] KVM: VMX: Stub out enable_evmcs static key for
 CONFIG_HYPERV=n
In-Reply-To: <Y+WaN8wW1EOvPbXe@google.com>
References: <20230208205430.1424667-1-seanjc@google.com>
 <20230208205430.1424667-3-seanjc@google.com> <87mt5n6kx6.fsf@redhat.com>
 <1433ea0c-5072-b9d9-a533-401bb58f9a80@redhat.com>
 <Y+WaN8wW1EOvPbXe@google.com>
Date: Fri, 10 Feb 2023 10:55:19 +0100
Message-ID: <875yc97sl4.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Feb 09, 2023, Paolo Bonzini wrote:
>> On 2/9/23 14:13, Vitaly Kuznetsov wrote:
>> > > +static __always_inline bool is_evmcs_enabled(void)
>> > > +{
>> > > +	return static_branch_unlikely(&enable_evmcs);
>> > > +}
>> > I have a suggestion. While 'is_evmcs_enabled' name is certainly not
>> > worse than 'enable_evmcs', it may still be confusing as it's not clear
>> > which eVMCS is meant: are we running a guest using eVMCS or using eVMCS
>> > ourselves? So what if we rename this to a very explicit 'is_kvm_on_hyperv()'
>> > and hide the implementation details (i.e. 'evmcs') inside?
>> 
>> I prefer keeping eVMCS in the name,
>
> +1, IIUC KVM can run on Hyper-V without eVMCS being enabled.
>
>> but I agree a better name could be something like kvm_uses_evmcs()?
>
> kvm_is_using_evmcs()?
>

Sounds good to me!

-- 
Vitaly


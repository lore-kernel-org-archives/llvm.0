Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B958624
	for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 01:13:34 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id m2-20020a17090a414200b00231173c006fso7399738pjg.5
        for <llvm@lists.linux.dev>; Thu, 09 Feb 2023 17:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k3av9jkUvE9A6NJ/myH2LVzHPBwDhgbAq+TXm0rIoTM=;
        b=PHZQYT5oASeECsZsHRHQMGmmlRn/fh1qFIyHRbeqb6UKHavmxO4hmYGKVNZ3HXfHCP
         OC+jObRKncg1lbUI1c6zLMxOulEL4CDQTfhrHtjSFhe60xMZzvHSZKHiz04WTd812P6c
         /gmzgZGkx8I5YMNuPo9O28D4S2q+ikgRILRReal9hzuIijl6Zu4RVW6sHImTFlsiNrI3
         YVkJmEkMBeHhPbqmrRnCQuyvV8054XIVeM+4KGPkRjrFvaIx64M0S/WFnVQwX9NNiWbF
         hMWRMMEk9Iz3eHX6+Tp6StYtSqPySt+Z95pXifmRZBUzvX8dri+GKO8RUx9Sfcd1JPKs
         b1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3av9jkUvE9A6NJ/myH2LVzHPBwDhgbAq+TXm0rIoTM=;
        b=4V4HcdVEWBQxfXvUowcSV/fuLDO1nib3p/pDkvwGZ1XkFmMxrxsbq7tiODEzlyw2gm
         j6EvzlCci7mtPZXwsqLLd7wEeupE3nWDATZYCqhPB1YSTkRs+UERjSlWdcHW4c3Xoisw
         CS0Zfw3c20a8UamltpaTHpwPpt7frKI2UGqamfDnNQ2aqm2+iwI5B1RbJXGKtMq6Jb4/
         iLDyyPy8XVdO4lS7cy8+NBkRLT242sld9GhRxtmSxEUL2g5qT7476c0gdRJ8FAuknSsa
         zN4JBbhrGRMheOy4ZYYrDkOvPrZ02/U+QueUUAckyiH7LZU1J7vn6skq9z3dap9CFpjH
         XrKw==
X-Gm-Message-State: AO0yUKXGGjgI7aucCKFm9dsRXxZL6TCDv4EiNhHREd2SitySqKZdnyB3
	Rkxvosw49pcttD3ScBDx3oUuJA==
X-Google-Smtp-Source: AK7set9pFw3J5w5r/xV/SoTgrT6GjoR14zs1JLwGP7oCVVKObwM+RL2W/uCJ6aaf3zqmyu8HS/ZqXg==
X-Received: by 2002:a17:902:ed89:b0:198:af50:e4e4 with SMTP id e9-20020a170902ed8900b00198af50e4e4mr102079plj.10.1675991613691;
        Thu, 09 Feb 2023 17:13:33 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id i25-20020aa78b59000000b0059428b51220sm2040561pfd.186.2023.02.09.17.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 17:13:32 -0800 (PST)
Date: Fri, 10 Feb 2023 01:13:27 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Tom Rix <trix@redhat.com>,
	kvm@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/2] KVM: VMX: Stub out enable_evmcs static key for
 CONFIG_HYPERV=n
Message-ID: <Y+WaN8wW1EOvPbXe@google.com>
References: <20230208205430.1424667-1-seanjc@google.com>
 <20230208205430.1424667-3-seanjc@google.com>
 <87mt5n6kx6.fsf@redhat.com>
 <1433ea0c-5072-b9d9-a533-401bb58f9a80@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1433ea0c-5072-b9d9-a533-401bb58f9a80@redhat.com>

On Thu, Feb 09, 2023, Paolo Bonzini wrote:
> On 2/9/23 14:13, Vitaly Kuznetsov wrote:
> > > +static __always_inline bool is_evmcs_enabled(void)
> > > +{
> > > +	return static_branch_unlikely(&enable_evmcs);
> > > +}
> > I have a suggestion. While 'is_evmcs_enabled' name is certainly not
> > worse than 'enable_evmcs', it may still be confusing as it's not clear
> > which eVMCS is meant: are we running a guest using eVMCS or using eVMCS
> > ourselves? So what if we rename this to a very explicit 'is_kvm_on_hyperv()'
> > and hide the implementation details (i.e. 'evmcs') inside?
> 
> I prefer keeping eVMCS in the name,

+1, IIUC KVM can run on Hyper-V without eVMCS being enabled.

> but I agree a better name could be something like kvm_uses_evmcs()?

kvm_is_using_evmcs()?

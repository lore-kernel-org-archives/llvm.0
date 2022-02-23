Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D1F6958
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 17:59:11 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id o23so4381159pgk.13
        for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 09:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i9ZmGUIwkyC7vjnII3cOeTZiB9a3MACRa2J9UXGI/ow=;
        b=XJHhTu/IhJCZ37/XrmsRBgCMoxE7LQi7Lo2Wi2s9PrXp0NKXlVd6zNTxZYdlTEDAqx
         L/j6e0Yamrbm7MLR3xgUc3Lw2+IT950x0WmnqU5OXUM//6aHcMBdwkA7rIK6YFT0JUhc
         sZvfycmuBlW+7vxVI4IDjx+/5a+Tmn8tspepbIAylqOg5aUfL+ulyJwBswjF0ItOtVKO
         97WUPmaUab1x3mwDYSGjTBxch3l8b3hxugErDO2pW1LUwJTeMVzMA6djZdYgR5ys3I6O
         QnwB+tBGJWUDAijMLK5HnyZoR8nHcsOuSTEBguK42TJ00sTtcT0wbBla4qArjLsIo/nN
         0v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i9ZmGUIwkyC7vjnII3cOeTZiB9a3MACRa2J9UXGI/ow=;
        b=KTNd6zYw2AuQPRxb/uMESNLyWHcCWagK93mxyccQoctCFIJNJyojSwkohMIlzTXPAd
         E9WNlg/0fTrAzNrTwlslvfgzYS7vuo/eLY3ZS3X+1QWWbYj+BryAUCCg1Q+n28gfx6yq
         I6WQ8CIADqniT0hvWzI9FX8dVUmeP69d4pn1KJxvRd0xfQjHlJXKNc1HbZ5re1KGvlMd
         bxeOejRTusITGjRtKy2tZtPRUNsMOsyRyeOfukPJ9FEcizhsig7EsObfhvM/MJZCEs91
         KxAikVq8d9gqRX34XFHSscM+sGIb6Bl0QS7FMBBhY0uTF1i4z9VEUuz+i0oFbUUY/RaP
         g0DQ==
X-Gm-Message-State: AOAM5309GvI9hKbxU5Zj+4epCAOUXH1ieLw39Pe1DNQnIVwTf6+gmxDU
	SoCyZQAeJIPeOCsOO7MdrM+h+Q==
X-Google-Smtp-Source: ABdhPJyWY8cS3LAxq9EqCzdtTUyda9OxIuVZO+b/1nALlGyO7RfH+5KzoRu/A7B8I7ghZ74CG6Bi7Q==
X-Received: by 2002:a05:6a00:174e:b0:4e1:7cfb:7a26 with SMTP id j14-20020a056a00174e00b004e17cfb7a26mr928875pfc.50.1645639150179;
        Wed, 23 Feb 2022 09:59:10 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id h27sm170144pgb.20.2022.02.23.09.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 09:59:09 -0800 (PST)
Date: Wed, 23 Feb 2022 17:59:05 +0000
From: Sean Christopherson <seanjc@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	kvm@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Like Xu <like.xu.linux@gmail.com>
Subject: Re: [PATCH] KVM: x86: Fix pointer mistmatch warning when patching
 RET0 static calls
Message-ID: <YhZ16cMMcHQIvS9d@google.com>
References: <20220223162355.3174907-1-seanjc@google.com>
 <YhZuk8eA6rsDuJkd@dev-arch.archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhZuk8eA6rsDuJkd@dev-arch.archlinux-ax161>

On Wed, Feb 23, 2022, Nathan Chancellor wrote:
> Hi Sean,
> 
> On Wed, Feb 23, 2022 at 04:23:55PM +0000, Sean Christopherson wrote:
> > Cast kvm_x86_ops.func to 'void *' when updating KVM static calls that are
> > conditionally patched to __static_call_return0().  clang complains about
> > using mismatching pointers in the ternary operator, which breaks the
> > build when compiling with CONFIG_KVM_WERROR=y.
> > 
> >   >> arch/x86/include/asm/kvm-x86-ops.h:82:1: warning: pointer type mismatch
> >   ('bool (*)(struct kvm_vcpu *)' and 'void *') [-Wpointer-type-mismatch]
> > 
> > Fixes: 5be2226f417d ("KVM: x86: allow defining return-0 static calls")
> > Reported-by: Like Xu <like.xu.linux@gmail.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> Thank you for the patch! Is this a bug in clang?

IMO, no.  I think it's completely reasonable for the compiler to complain that KVM
is generating two different pointer types out of a ternary operator.

clang is somewhat inconsistent, though it may be deliberate.  clang doesn't complain
about implicitly casting a 'void *' to another data type, e.g. this complies clean,
where "data" is a 'void *'

	struct kvm_vcpu *x = vcpu ? : data;

But changing it to a function on the lhs triggers the warn:

	typeof(kvm_x86_ops.vcpu_run) x = kvm_x86_ops.vcpu_run ? : data;

Again, complaining in the function pointer case seems reasonable.

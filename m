Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669506AA2
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 18:56:33 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 27so15775425pgk.10
        for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 10:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WO10LZXV2/UIWFExeWc5y4Axog2LtDZPkQsLOSvWfIQ=;
        b=D8TkVS0SFNlR75Wec0ztTxmXYaKBMsKoUqb/Nhs2hNUiK/oaDz71s6bWwqHwBV1Wjz
         cslgksXqAs492hjk4W5fOe6HJmIx2jOGr42dklLADLnuAj6O7rlxzR4je1EbsPrOP8wk
         weGsjLeFnSuR/7vT+UaNHlsfv8241RQA0ZB5g3tenBZ3jhcHWHEPO1lvjP6HPgoGmptr
         iscT1tlwsb64dhL/wSDAaCJ/0x3uLXRTToo1xd1dpg2OSIUJMis8ITDrAWCTvY2C72SG
         xThZMVdYqHwxBZkQnHbX5lJxFn9v35CY9ZtkqKIMMIPzO/6GSf6aJeMr/VWZ4lkhrzKF
         +BNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WO10LZXV2/UIWFExeWc5y4Axog2LtDZPkQsLOSvWfIQ=;
        b=EKCKQ89+sEl4k0YpuOJfkRKJtlzEb6LpxquqCuLD8QHv5HEXX+1FIiEQm9UCEoJRD2
         2oCs8S+QfR7glD2Yarv+14lj9pcL7MAM1U1MxTamRJ/qY3eWTqOASvotRHTUScs9dBV/
         LCw8f++axetl2bZsK0+sz4r7UpF4C8nU+jpQpi8/tK+fvj7qKvgkc46QqdQ+dPMl+FYU
         9W5CjodGRecsz5gJpt61nsHIos3RBqxqx2Cbxr74kxwWx5kIG7YF2WXuJpXhVkD+mv96
         7s5eHD8lcKIAF7M+IK5EeEKL/RoWg7lx2r3Z2Oox37jcO9pvqU+nZm0TO4ZrAN9RE7kc
         jHyA==
X-Gm-Message-State: AOAM530GbgYWUcQC2YO+8TmYtSaOkwvE4TtLV0vwkjSGxe/yNFo55Kvl
	6XvkyDW4xShcINpSeOwQlfz8AQ==
X-Google-Smtp-Source: ABdhPJxWzseRIGwjKlr0g3XO7WPLxpsY657PyUA0i4zsqM9a8QWHzQK5Zdw5cIoRSvIs8eDmqn0I2g==
X-Received: by 2002:a63:31ce:0:b0:34e:4052:1bce with SMTP id x197-20020a6331ce000000b0034e40521bcemr735240pgx.459.1645642592668;
        Wed, 23 Feb 2022 10:56:32 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id i11sm231887pgs.58.2022.02.23.10.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 10:56:31 -0800 (PST)
Date: Wed, 23 Feb 2022 18:56:28 +0000
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
Message-ID: <YhaDXDfLBQtkmbtV@google.com>
References: <20220223162355.3174907-1-seanjc@google.com>
 <YhZuk8eA6rsDuJkd@dev-arch.archlinux-ax161>
 <YhZ16cMMcHQIvS9d@google.com>
 <YhZ5Q8DNoGGWUBLh@dev-arch.archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YhZ5Q8DNoGGWUBLh@dev-arch.archlinux-ax161>

On Wed, Feb 23, 2022, Nathan Chancellor wrote:
> On Wed, Feb 23, 2022 at 05:59:05PM +0000, Sean Christopherson wrote:
> > On Wed, Feb 23, 2022, Nathan Chancellor wrote:
> > > Hi Sean,
> > > 
> > > On Wed, Feb 23, 2022 at 04:23:55PM +0000, Sean Christopherson wrote:
> > > > Cast kvm_x86_ops.func to 'void *' when updating KVM static calls that are
> > > > conditionally patched to __static_call_return0().  clang complains about
> > > > using mismatching pointers in the ternary operator, which breaks the
> > > > build when compiling with CONFIG_KVM_WERROR=y.
> > > > 
> > > >   >> arch/x86/include/asm/kvm-x86-ops.h:82:1: warning: pointer type mismatch
> > > >   ('bool (*)(struct kvm_vcpu *)' and 'void *') [-Wpointer-type-mismatch]
> > > > 
> > > > Fixes: 5be2226f417d ("KVM: x86: allow defining return-0 static calls")
> > > > Reported-by: Like Xu <like.xu.linux@gmail.com>
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > 
> > > Thank you for the patch! Is this a bug in clang?
> > 
> > IMO, no.  I think it's completely reasonable for the compiler to complain that KVM
> > is generating two different pointer types out of a ternary operator.
> > 
> > clang is somewhat inconsistent, though it may be deliberate.  clang doesn't complain
> > about implicitly casting a 'void *' to another data type, e.g. this complies clean,
> > where "data" is a 'void *'
> > 
> > 	struct kvm_vcpu *x = vcpu ? : data;
> 
> Right, I would assume this is deliberate. I think warning in this case
> might be quite noisy, as the kernel implicitly converts 'void *' to
> typed pointers for certain function pointer callbacks (although this
> particular case is probably pretty rare).

Aha!  Looks like clang's behavior is correct, assuming a function is not considered
an "object".  From C99 "6.5.15 Conditional operator":

  One of the following shall hold for the second and third operands:
    — both operands have arithmetic type;
    — both operands have the same structure or union type;
    — both operands have void type;
    — both operands are pointers to qualified or unqualified versions of compatible types;
    — one operand is a pointer and the other is a null pointer constant; or
    — one operand is a pointer to an object or incomplete type and the other is a pointer to a
      qualified or unqualified version of void.

That last case would explain why clang warns about a function pointer but not a
object pointer when the third operand is a 'void *'.

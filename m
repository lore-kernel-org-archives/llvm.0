Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DFD7E
	for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 00:07:34 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id a23so7598908lfm.10
        for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 17:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ITeXNmTHghT7JbHp8okODbZaYzIJfstIsA3P3tV9y40=;
        b=W9pYztkij0UdIoVKCwii/oFiV0cvZ5D936E0/mEOHV+PGCHn9DscpcUnOl4HetSX0O
         6idU7oCZ5SjLAeIknNBeMGaKoJlq+2hNYU0MxEGIRNKR/px74S1VmIV/weHGBGbkAo8b
         K6czUcrgj5P6xHnLaQGr1Xv1xoSpEB/5K0v/0YySzYEp3Lt98KIWz5/rE3SG9wg3QALE
         961WwNiLN/kU+46s4yDrn6mpPVkM71wbgIvv0vUamutY7QfvNc86ZJBf8QHZAOjSCAex
         5/eRQyYeeSlDXjMwP5dA2jLTyLpvweEdNiXtMhmMAbeAgVI4z4Pqk2HiLP/xsTgIhqjy
         EfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ITeXNmTHghT7JbHp8okODbZaYzIJfstIsA3P3tV9y40=;
        b=k5ZwwxWzKhEsa2+IiY0gdzps2RcmB/nzCKvwxT77UVFtmMAzk0qLL163+Ch9WgRIHA
         auMwMrV1df7jtP3YDc/kkAwMVpT06ljQL36pdNfqb2ayDcceNcdvbiZomv1wlix9WHOm
         POwK4Gte6NXbj2c8i3iHqege4WCI6toWcoSs8q/xQHyVgwcroWsm53EZp5jDOqlO4/j9
         HCdSaHORRp+AoCku08a41xc0EhO9wxbd74YQI3o8DpJPkOrhLxONEtAjGSUck32tsCxr
         ktkMCWXuMV4QPTV5r6JX0lNWO9FVC/qxoSD8kCIFDbzF0cm/eA6xAG6zM5Ffm68OJJGc
         NIRw==
X-Gm-Message-State: AJIora+RZWyxD76wTAoonEsrC2jZZUO9JiR0cMh45ByuLKtOPFTIkiNR
	7sBdSCu0OweLhIaijJJry6pE9LcyC90JVGNdo6G3lA==
X-Google-Smtp-Source: AGRyM1vhBy1BgDXpMpcs+ikuvIT5rufv+Xk7q4ZO7FkjKO1mj+TBVoGrz0GeyPpBFfd6JIvzLIa2nGMc91CSlhV3ZEk=
X-Received: by 2002:ac2:5207:0:b0:48a:7aa6:e74c with SMTP id
 a7-20020ac25207000000b0048a7aa6e74cmr831153lfl.104.1658534852169; Fri, 22 Jul
 2022 17:07:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220722234838.2160385-1-dmatlack@google.com> <20220722234838.2160385-2-dmatlack@google.com>
 <Yts6cCcnfg1xV54O@google.com>
In-Reply-To: <Yts6cCcnfg1xV54O@google.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 22 Jul 2022 17:07:05 -0700
Message-ID: <CALzav=fCZkyO=9Hvub+Grb3QYW6QJ2bLyUACR8Aaqzx+k8O4LA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: selftests: Fix KVM_EXCEPTION_MAGIC build with Clang
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Peter Xu <peterx@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@google.com>, 
	"open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>, kvm list <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 22, 2022 at 5:01 PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Fri, Jul 22, 2022, David Matlack wrote:
> > Change KVM_EXCEPTION_MAGIC to use the all-caps "ULL", rather than lower
> > case. This fixes a build failure with Clang:
> >
> >   In file included from x86_64/hyperv_features.c:13:
> >   include/x86_64/processor.h:825:9: error: unexpected token in argument list
> >           return kvm_asm_safe("wrmsr", "a"(val & -1u), "d"(val >> 32), "c"(msr));
> >                  ^
> >   include/x86_64/processor.h:802:15: note: expanded from macro 'kvm_asm_safe'
> >           asm volatile(KVM_ASM_SAFE(insn)                 \
> >                        ^
> >   include/x86_64/processor.h:785:2: note: expanded from macro 'KVM_ASM_SAFE'
> >           "mov $" __stringify(KVM_EXCEPTION_MAGIC) ", %%r9\n\t"   \
> >           ^
> >   <inline asm>:1:18: note: instantiated into assembly here
> >           mov $0xabacadabaull, %r9
> >                           ^
> >
> > Fixes: 3b23054cd3f5 ("KVM: selftests: Add x86-64 support for exception fixup")
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
>
> Reviewed-by: Sean Christopherson <seanjc@google.com>
>
> >  tools/testing/selftests/kvm/include/x86_64/processor.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
> > index 45edf45821d0..51c6661aca77 100644
> > --- a/tools/testing/selftests/kvm/include/x86_64/processor.h
> > +++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
> > @@ -754,7 +754,7 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
> >                       void (*handler)(struct ex_regs *));
> >
> >  /* If a toddler were to say "abracadabra". */
> > -#define KVM_EXCEPTION_MAGIC 0xabacadabaull
> > +#define KVM_EXCEPTION_MAGIC 0xabacadabaULL
>
> Really?!?!?! That's what makes clang happy?!?!?

Heh, yup. I was surprised when it worked.

Hopefully some of the Clang folks CC'd can shed some light on why.

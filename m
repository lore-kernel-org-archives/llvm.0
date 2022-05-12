Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D76190
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 00:36:33 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id p10so6294291lfa.12
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 17:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BYfA6+AQY2p6jwKyBDeT4MOWORLN3pflMxreFdtcGEU=;
        b=axJUepJ8XhBP+IP9cLQH6t4hUt9ujOf7BNRj2tisvmOex6qyZQ7FlGVGeeXtMMsvi9
         jr0X6x1y+B5bGjror5UpgHh6VKyR3VGSurCoHFG0KCcnwkcbD7SnBtnmeiryHdfwDBVj
         iEbN841PqmiNok8ZDY1jZoyIEMQVQCsXzEEFJLVFOR3OsOh6KKLPT4RuKEONGo9CZYLI
         YkVl/tKSpINl+IB9wL8rbC7VMMEZUm8eiUlqzi1pQyDdq64+zyD8RqFzMK7YmEtf23oH
         rI1De0ujlFENDQdsrEIT7UlOnptGrleWiwVseYqHz/a+K45XO251Po29godo7mw70GfP
         uckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BYfA6+AQY2p6jwKyBDeT4MOWORLN3pflMxreFdtcGEU=;
        b=z8jKfLHjOFPayrOyycJ156oBHML3ITpoum+sXQjOvyz5vNFzmBKukbMP9anBz1exRc
         saV48flqjfgfKMhRnWLGRoREiMoOGqWiiot5J/VLt/hhKYtZ8/PqBO94sgfMy0x4T/tF
         DiP9mkkwLE1LZ+4Ka3lNpg4xIVJQe3DJkMJaeEOstglyFXZpQ+y5z48B/ovaWtGqOHL1
         rWkh5t9RJdw1L6QJLoPHiXuqHxoQYRihFa2Wiqsvi6TRNebkhYn2BMTfoOY3rgMVwlTj
         6+7W4L2WlQMmVB8J0l4t4mxIFM5g7ywSdQ+Xg5f7EOCG/S6ay/2Cfbtzs0dL+bAIjbXj
         dC8w==
X-Gm-Message-State: AOAM533/rfcA7ssUM8uZ7JVfpO90g+ODOJBLDZFt+puxG6hmA9PkLfza
	vIzsheo2mbmoRrSNtqmglfnrTQ9rDM15Y2OycPm1mY9mIfPwlw==
X-Google-Smtp-Source: ABdhPJwVMpLfOk2buj3G1lyViGjSWxQ0qwm5E7rJpEiMlMtTH1Z8E1zbF0Gww6uY/gIQi8jkhojRBneXHWnUOtE7pdk=
X-Received: by 2002:ac2:4646:0:b0:472:108e:51af with SMTP id
 s6-20020ac24646000000b00472108e51afmr22216354lfo.184.1652315791654; Wed, 11
 May 2022 17:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGb2aXVu7eys5PM=xZ7gtzdap_QyRrzi3WzY83ka=heOwQ@mail.gmail.com>
 <CAK8P3a0Lwtm86wYH+0yFtr=Luc6g3OLu_+vzZaJqxDxNHFmQDQ@mail.gmail.com>
 <CAKwvOdmfHS8UwZhEL-tLMJSzCXQEZZZhEMpDXuJHtP5s9yePBw@mail.gmail.com>
 <CAEQFVGYpPaE3cCxUBaiT97GU1i4Nr6yJdv6mU1kiCxqkLSMfBQ@mail.gmail.com>
 <CAEQFVGaUOQhCCceNzivzsR7XeNFrau48BuV-nf7CnSw7YauVoQ@mail.gmail.com>
 <CAEQFVGY6UwuV0s_926Mg=fWaApjYUJmqeK_E4ySpABkZRFwTLQ@mail.gmail.com>
 <CAEQFVGavOWzTf5VNNNr39pHaaJW8W=6hiGDH1JmVTQ2kf5KqAw@mail.gmail.com> <CAEQFVGZfq17gj9z7Z_MDVUAsx-e16cJ3h1KVzcZ1-eimBcGoag@mail.gmail.com>
In-Reply-To: <CAEQFVGZfq17gj9z7Z_MDVUAsx-e16cJ3h1KVzcZ1-eimBcGoag@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 May 2022 17:36:19 -0700
Message-ID: <CAKwvOdkU=zRu4EiH9R=M97bgGoqGuWLSphGevXvpQYQ4AS3d_A@mail.gmail.com>
Subject: Re: Android 11 clang toochain: kernel 5.18 build error with 32 bit target
To: Mauro Rossi <issor.oruam@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chih-Wei Huang <cwhuang@android-x86.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 1, 2022 at 11:40 AM Mauro Rossi <issor.oruam@gmail.com> wrote:
>
> > As promised I have rechecked the kernel build with Android 11 prebuilt
> > toolchain (clang 11.0.2)
> >
> >   CC      mm/maccess.o
> > /home/utente/r-x86_kernel/kernel/mm/maccess.c:37:3: error: invalid
> > output size for constraint '=a'
> >                 copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
> >                 ^
> > /home/utente/r-x86_kernel/kernel/mm/maccess.c:19:3: note: expanded
> > from macro 'copy_from_kernel_nofault_loop'
> >                 __get_kernel_nofault(dst, src, type, err_label);
> >          \
> >                 ^
> > /home/utente/r-x86_kernel/kernel/arch/x86/include/asm/uaccess.h:538:18:
> > note: expanded from macro '__get_kernel_nofault'
> >         __get_user_size(*((type *)(dst)), (__force type __user *)(src), \
> >                         ^
> > /home/utente/r-x86_kernel/kernel/mm/maccess.c:37:3: error: invalid
> > output size for constraint '=a'
> > /home/utente/r-x86_kernel/kernel/mm/maccess.c:19:3: note: expanded
> > from macro 'copy_from_kernel_nofault_loop'
> >                 __get_kernel_nofault(dst, src, type, err_label);
> >          \
> >                 ^
> > /home/utente/r-x86_kernel/kernel/arch/x86/include/asm/uaccess.h:538:18:
> > note: expanded from macro '__get_kernel_nofault'
> >         __get_user_size(*((type *)(dst)), (__force type __user *)(src), \
> >                         ^
> > 2 errors generated.
> >
> > At this point I will proceed in testing the build with Nick proposed
> > changes in __get_user_size()
> > and report back
> >
> > Thank you
> > M.
>
> Hello,
>
> Nick proposed patch works for 32bit build and shows no regression in 64bit build
> For Nick, in case you are not submitting for kernel-5.18 could you
> please provide me with
> commit title and message and allow me to use the fix in our future
> android-x86 LTS kernel builds?
>
> Thank you
>
> Mauro

This is the commit message I would use. I don't plan to send this
upstream, since the toolchain you're using is kind of in a funny place
with regard to our support policy. But feel free to carry it locally
downstream.
```
FROMLIST: x86/uaccess: further __get_user_size improvements

Similar to
commit 158807de5822 ("x86/uaccess: Make __get_user_size() Clang
compliant on 32-bit")

The =a constraint is only valid for 32b variables, so the use of __get_user_size
with 64b variables causes the =a constraint validation to fail before
optimizations can elide the 32b cases that use =a constraints.

Link: https://lore.kernel.org/llvm/CAKwvOdn1Li3+_b7M8pdJ+-J=PZ_B6PVZ2o3QSbYXtvJ=B6eOXw@mail.gmail.com/
```
-- 
Thanks,
~Nick Desaulniers

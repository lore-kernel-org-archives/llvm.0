Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5596D1844
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 04:51:37 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id f8so1108383pgc.8
        for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 20:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=U8eQUsaiuvfdO3IgfBqvbUSDsbva5gKLb5MEIzgw2eE=;
        b=cZIDOJeahCGn3AdKZfVPt+MiKrc+rR+MukeFhI+8YawjGR9fnZiZtpUUvOFDzSRHh3
         9kCzHQke5DEYQROn/0+O3cCFmAttsee0CJ3kG8lNF4p5hB49AFumVtCYtepWTGtWqu9d
         NnrQbyyvoXrLTdyoZ7IddsvbVPuekOi7EcrImSl9Ebmc693O0PJ2rdPzuwxZWzhLnN2I
         Ud8ZROljBZYzqjmb0971DJFJPmkLkMnX/3gg3Ouht1OiZgcTXlngU8hWVhNrhrlq2lX3
         Kcacu8E+fHVDsrylulXA1rxiDT2EVjULsR3Kyb3sAJq+hKxd3HRZbrqaXBH1fKFTNaM7
         lPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U8eQUsaiuvfdO3IgfBqvbUSDsbva5gKLb5MEIzgw2eE=;
        b=eVM5DyC3g3OShiBcE96J4V0gEjqeqi50JNOKP+sD45YRfBYyVrpiDxW25MIuK3GnOx
         CHnI5E/+QJaUN+FqBRO3ZcEJzFUeZLoLvV9SM66z7UwgMYppfR7OVfYlY6F19whcua3S
         xRfDkXBhh5rxk46R3yoEhRsYgD8DLG2lKeNSJ202wwhMm7ddNBEJvE2SNAJhm+ZjpNZE
         XTj6XZcSP0Gey2PIVehR2yPI9wNXUQQh+zqPjL7W39Xw2gJY42F3AHOeNq65kcb8kO+Q
         hpl7bvnfHULiDoxUKzMBSiL4C5+/gnXBeTVzsQiCj4DC474PyfJuFh4c0kcwZK2aW8aV
         df8Q==
X-Gm-Message-State: AOAM532BH8BxTc2xgivSKdP05eIKOYHXuN7T1cjtauSkksUGJADdAozr
	SXiE9Ap0gVPSYSjviZTEe1YzrQ==
X-Google-Smtp-Source: ABdhPJwOgmr4/U+0CQce1FmUkpL5w9ASN5368AKCh9x8pGmOIigflKL2cjulpUa3pybTAQZ9Wa9Idg==
X-Received: by 2002:a63:4cf:0:b0:363:c42:c135 with SMTP id 198-20020a6304cf000000b003630c42c135mr887140pge.82.1644987096612;
        Tue, 15 Feb 2022 20:51:36 -0800 (PST)
Received: from [192.168.10.24] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id t11sm4251105pgi.90.2022.02.15.20.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 20:51:36 -0800 (PST)
Message-ID: <5b021d73-51c1-164f-6136-483eeebef6fb@ozlabs.ru>
Date: Wed, 16 Feb 2022 15:51:31 +1100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
Subject: Re: [RFC PATCH kernel] trace: Make FTRACE_MCOUNT_USE_RECORDMCOUNT
 configurable
Content-Language: en-US
To: Sami Tolvanen <samitolvanen@google.com>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>
References: <20220211014313.1790140-1-aik@ozlabs.ru>
 <CAKwvOdkKsoYw9KOfwdHYg7OkTz0TQ6YgZZcqQ5PNg+_O1Q5bgg@mail.gmail.com>
 <CABCJKudj5VJ-f+QU0qmnODoadEzpVME2rXhtUZbzrEV8o69hqQ@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <CABCJKudj5VJ-f+QU0qmnODoadEzpVME2rXhtUZbzrEV8o69hqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/15/22 03:10, Sami Tolvanen wrote:
> On Fri, Feb 11, 2022 at 4:11 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> + Sami, Kees
>>
>> Do you guys remember why we don't support
>> FTRACE_MCOUNT_USE_RECORDMCOUNT with LTO?
> 
> It's because recordmcount cannot distinguish between calls and other
> references to mcount/fentry, which is a problem with LTO where we have
> to process the entire vmlinux.o and cannot ignore individual
> translation units. Instead of resorting to workarounds, Peter was kind
> enough to implement a smarter mcount pass in objtool, which we now use
> on x86_64 with LTO.


So can x86_64 have both FTRACE_MCOUNT_USE_RECORDMCOUNT and LTO?

> Alexey, which architecture are you trying to fix here?


powerpc64le.

> 
> Sami

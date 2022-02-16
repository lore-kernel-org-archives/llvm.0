Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF621844
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 01:28:55 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id i6so831259pfc.9
        for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 17:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tQTDncmXURnIkQJis+wxjFZC0hGspK56+Qdf43TRr3E=;
        b=H+50svR9Fo1VEERYUeQdw5S6DLto/gQadF0oqYP7WRy6XGdQXD3BPwkjbRpy52LbV5
         rRe1ILqmSjWwAuyPZebSKMbskC5iphX7EXTVBCVZCWXtF1JOik0dvuLT4CaeLG9p4O/m
         1WcBi1FwIdMfNxBRhSbZj0I+Li2KiEGVoioM3+BTNNIMmZHt2O4Lt7xGzDNTOBKMlLoR
         Np02mi1pjOCEOEtTvpr+BPp7oi3IrLeAwfzTnv6vX0rFOIsdSJN+RW9BYrDa9YLl553z
         NCC3WvrredcVtaKufNs/tk98SQSGWqL1gWGyJM4MkAM7CbuV8sK/ZSdWZ75H9IvdVWcn
         rxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tQTDncmXURnIkQJis+wxjFZC0hGspK56+Qdf43TRr3E=;
        b=udKiPdp1+Vi3NRz9izI0kbBQZGDkE0JROlIu8czMr+MLfA7q3XvfUCjFX+Yy+1Qa9g
         wPGYZCeDuh0SBliHQIfmrDMwPEP6BBw2odHJRtDO1AvW1YJYt7m+Ko12ab7wlaoGirz3
         yOwVxKp4tkTxCIFnfb3kyxujLLMrb2m1ELDXQOvuZpE1BiKx8sWkn5IHTHMfeu5IEkGU
         mmrqa6UXYBCycVzmbtPaGn5O4Vlj+D8884V4tPS0UkmSgp7LyiT7VUnHrGLqTsXP6Eh+
         MXkogg+spUG+mTezt3EXptzzfYTpZvFMcPpuc53lCMyUxqkjWmEeoim77CUT3rAscXAW
         UKzQ==
X-Gm-Message-State: AOAM531rW0NkiUkJUH7ruB2ZM0qCqLfvpBIZSxaszPiUFBKfQDdK9Ljh
	eGRrt2naQFIEbkkyfkF0heumfg==
X-Google-Smtp-Source: ABdhPJwM77UFLOF1OiIUZL5zuriL3dDg9+gURcyC0/EAXme+PzwciNao4NhxjcQ3KNF6vcDe8cHzUw==
X-Received: by 2002:a63:f011:0:b0:36c:2da3:32bc with SMTP id k17-20020a63f011000000b0036c2da332bcmr342889pgh.40.1644974934995;
        Tue, 15 Feb 2022 17:28:54 -0800 (PST)
Received: from [192.168.10.24] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id t22sm1149617pfg.92.2022.02.15.17.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 17:28:54 -0800 (PST)
Message-ID: <535eefe8-c332-4c66-30d0-c792911ee4d5@ozlabs.ru>
Date: Wed, 16 Feb 2022 12:28:47 +1100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
Subject: Re: [PATCH kernel 2/3] powerpc/llvm: Sample config for LLVM LTO
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Nathan Chancellor <nathan@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>,
 Fabiano Rosas <farosas@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
References: <20220211023125.1790960-1-aik@ozlabs.ru>
 <20220211023125.1790960-3-aik@ozlabs.ru>
 <CAKwvOdmJspxuNh-K-CeLJh4X4GGVYJWH29HnjJwuRL+jcN9G5w@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <CAKwvOdmJspxuNh-K-CeLJh4X4GGVYJWH29HnjJwuRL+jcN9G5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/12/22 11:05, Nick Desaulniers wrote:
> On Thu, Feb 10, 2022 at 6:31 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>> The config is a copy of ppc64_defconfig with a few tweaks. This could be
>> a smaller config to merge into ppc64_defconfig but unfortunately
>> merger does not allow disabling already enabled options.
> 
> Cool series!
> 
>>
>> This is a command line to compile the kernel using the upstream llvm:
>>
>> make -j64 O=/home/aik/pbuild/kernels-llvm/ \
>>   "KCFLAGS=-Wmissing-braces -Wno-array-bounds" \
>>   ARCH=powerpc LLVM_IAS=1 ppc64le_lto_defconfig CC=clang LLVM=1
> 
> That command line invocation is kind of a mess, and many things
> shouldn't be necessary.
> 
> O= is just noise; if folks are doing in tree builds then that doesn't
> add anything meaningful.
> KCFLAGS= why? I know -Warray-bounds is being worked on actively, but
> do we have instances of -Wmissing-braces at the moment? Let's get
> those fixed up.
> LLVM_IAS=1 is implied by LLVM=1.
> CC=clang is implied by LLVM=1
> 
> why add a new config? I think it would be simpler to just show command
> line invocations of `./scripts/config -e` and `make`. No new config
> required.



I should have added "RFC" in this one as the purpose of the patch is to 
show what works right now and not for actual submission.


>>
>> Forces CONFIG_BTRFS_FS=y to make CONFIG_ZSTD_COMPRESS=y to fix:
>> ld.lld: error: linking module flags 'Code Model': IDs have conflicting values in 'lib/built-in.a(entropy_common.o at 5332)' and 'ld-temp.o'
>>
>> because modules are linked with -mcmodel=large but the kernel uses -mcmodel=medium
> 
> Please file a bug about this.
> https://github.com/ClangBuiltLinux/linux/issues
> 
>>
>> Enables CONFIG_USERFAULTFD=y as otherwise vm_userfaultfd_ctx becomes
>> 0 bytes long and clang sanitizer crashes as
>> https://bugs.llvm.org/show_bug.cgi?id=500375

> 
> The above hyperlink doesn't work for me. Upstream llvm just moved from
> bugzilla to github issue tracker.


aah this is the correct one:
https://bugs.llvm.org/show_bug.cgi?id=50037

> 
> https://github.com/llvm/llvm-project/issues

oh ok.

>>
>> Disables CONFIG_FTR_FIXUP_SELFTEST as it uses FTR_SECTION_ELSE with
>> conditional branches. There are other places like this and the following
>> patches address that.
>>
>> Disables CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT as CONFIG_HAS_LTO_CLANG
>> depends on it being disabled. In order to avoid disabling way too many
>> options (like DYNAMIC_FTRACE/FUNCTION_TRACER), this converts
>> FTRACE_MCOUNT_USE_RECORDMCOUNT from def_bool to bool.
>>
>> Note that even with this config there is a good chance that LTO
>> is going to fail linking vmlinux because of the "bc" problem.
> 
> I think rather than adding a new config with LTO enabled and a few
> things turned off, it would be better to not allow LTO to be
> selectable if those things are turned on, until the combination of the
> two are fixed.

Well, if I want people to try this thing, I kinda need to provide an 
easy way to allow LTO. The new config seemed the easiest (== the 
shortest) :)

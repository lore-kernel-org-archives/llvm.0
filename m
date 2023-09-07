Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A1963A3
	for <llvm@lists.linux.dev>; Thu,  7 Sep 2023 20:33:05 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-502984f5018so900242e87.3
        for <llvm@lists.linux.dev>; Thu, 07 Sep 2023 13:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694118783; x=1694723583; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P1ER09Tm8HaXNHr1o16m8HylrPTLTZyqmFLjhfBRzpU=;
        b=Roq/Swqq530DXR9oAa3wWXwJTJerIzdop63uoqXpfqWuZZPhzP6WSfsiKTMDjnXFgg
         m27aALn/ZqCUgxuxpBgJqApevSZqviitrZTI2MKIeQO+H6nTa38ajqEe22zzI1ZnknEp
         tzO3YLs51W07+HRVEbllXAzKCQxnFTc3SsPU5tDxIhiaRG/tZKlMd2l/9H7XqDU4HAJo
         H8egk5LgRfm2v5mFEHobS+YKW9MUhPxJdPIOXjtLLbxqu5Hrq4r9QXk6etCFfa9PNXEl
         F+LpugDHs68IPw9Ma4a1hYD2zmRkRae9SgPnVAbAkwaGIC2J8tezNz+ZU9JTAyCd14X1
         flOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694118783; x=1694723583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1ER09Tm8HaXNHr1o16m8HylrPTLTZyqmFLjhfBRzpU=;
        b=nNdp9EJxB1SwKKgeUgomnNjCJbMIcFxGl7TRugzZMUrGupMpMkuxdYBROL648mjH91
         FKsejrkHthoqc9O/GY8Q2Luvys5b9D/zat9MPLT9hNyxFkzXQHcXSqIbEcoPh1tQavRm
         Tj7Nl2WtBTbBpGOPG0ZUeyavPkKH2ILj4ab9tPgqkME6uwD47C/ro2fEXEB/QqGv4Umm
         lrmO305iupeO/24ald2ZiLNqayCGEwh3SYKemBFFS6eYAQF19KfWTA2YR0YKziy+Q0Lv
         gmv8eMQ7ulJ9Zz1Gd2p2yeM5nva50/SpVVqHBZXTobLhmmRMC5TzckcU//BPYMq8Pj1j
         dtpA==
X-Gm-Message-State: AOJu0YyRCfZOwpld8e6XNv/3I9ap/pKovMPwkdp4KYimpojlyd5HHs5C
	OpanR1VRLM2Ojsr+bPz+BD4=
X-Google-Smtp-Source: AGHT+IEJqWm7XFYDSsaDXikPhTvM/sDF/Xu0+O/i8o48lFmyFtw0x1kW+/KSE806D7cGxOLldeOGLQ==
X-Received: by 2002:a05:6512:3d09:b0:4fe:3a57:7c90 with SMTP id d9-20020a0565123d0900b004fe3a577c90mr493422lfv.19.1694118782847;
        Thu, 07 Sep 2023 13:33:02 -0700 (PDT)
Received: from krava ([83.240.60.60])
        by smtp.gmail.com with ESMTPSA id p9-20020a17090635c900b0099bccb03eadsm80068ejb.205.2023.09.07.13.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 13:33:02 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 7 Sep 2023 22:33:00 +0200
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: bpf <bpf@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>,
	Stanislav Fomichev <sdf@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: Re: duplicate BTF_IDs leading to symbol redefinition errors?
Message-ID: <ZPozfCEF9SV2ADQ5@krava>
References: <CAKwvOdnaEakT_y8TA9b_nMY3kMp=xxqKpGQPc2drNqRdV39RQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnaEakT_y8TA9b_nMY3kMp=xxqKpGQPc2drNqRdV39RQw@mail.gmail.com>

On Thu, Sep 07, 2023 at 12:01:18PM -0700, Nick Desaulniers wrote:
> So we've got a curious report recently:
> https://github.com/ClangBuiltLinux/linux/issues/1913
> 
> ld.lld: error: ld-temp.o <inline asm>:14577:1: symbol
> '__BTF_ID__struct__cgroup__624' is already defined
> __BTF_ID__struct__cgroup__624:
> ^
> 
> It's been hard to pin down a SHA and .config to reproduce this, but
> looking at the definition of BTF_ID's usage of __ID's usage of
> __COUNTER__, and the two statements:
> 
> kernel/bpf/helpers.c:2460:BTF_ID(struct, cgroup)
> kernel/bpf/verifier.c:5075:BTF_ID(struct, cgroup)
> 
> Is it possible that __COUNTER__ could evaluate to the same value
> across 2 different translation units, leading to a name collision like
> the above?

hum, that probably the case, I see same counter values at different
__BTF_ID_ symbols:

ffffffff833fe540 r __BTF_ID__struct__bpf_bloom_filter__380
ffffffff833fe548 r __BTF_ID__struct__bpf_queue_stack__380
ffffffff833fe578 r __BTF_ID__struct__cgroup__380

perhaps we were just lucky not to hit that :-\

> 
> looking at another usage of BTF_ID other than struct
> cgroup;kernel/bpf/helpers.c:2461:BTF_ID(func, bpf_cgroup_release)
> is only defined in one translation unit
> 
> Should one of those two `BTF_ID(struct, cgroup)` be removed? Is there
> some other way we can avoid these collisions in the future?

need to find some way to make the symbol unique, will check

> 
> Was this a previously observed/fixed issue?

first time I see that

thanks,
jirka

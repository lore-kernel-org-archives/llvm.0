Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43466624
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 15:15:57 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so9673069wmq.0
        for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 08:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rK0qJO7Dh7n2l25BJgf7UBZiynAmtJpBCfoCvPDnO4w=;
        b=xRSQt6foeVbB30dhdwxyxqUnzVkRBbvKhGtLjmke8wzbj+crJfxtcFXiQ7zPGjJpt1
         0oWyDsu7++7KvLMMAUW9tdRn6NrHmHMI62yUC+ILerhLEEPaKq+e3Dasz8bfX0pyNPoq
         uefb0bHKVv6Zwbju4SLfJcGR1MfIX0/UZis2RqCw69N6iMNIcSLvRRjcFafRmQDb1+C7
         i3rWHPhysbmNQiwHsbEdoXyDej698nOA+5XVU1hEz0EY1jWRM9stCTkz4c4VozoUjSL7
         +tx72X5+4ATOmANEAEULLh4FfJ20xTg4poFCslTnvxFJbcfW+zX9VhwsKfhmnj2CnrP+
         xVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rK0qJO7Dh7n2l25BJgf7UBZiynAmtJpBCfoCvPDnO4w=;
        b=h/cnC08dRGRnvN+ZW81mlW9mL/UV17OhSylSC4BpnxaUx0HuUMty1XKahlcFMPXQzO
         xY7EaLQ1nZVh/8gjKd2BTjsz46Qj/Oktlv3e5xN77h+xz43vk3MmmphRRucScMRVYJeP
         S6RDuLUpuS7gZqI10qRngbxG2HnaqRDrqntzpBzTTJJVLprJHO/IcslqoSSHyeLM2T3k
         VcxWbymm6Ie6Tbm/I3TnntxTyfi31k9yl4rFSPr785wySz2SoY2VKIxtvueDkvbVHp6w
         edGprpj6lse93JN1x1wsbf2RdyBOCX/Hxd3sMnsXbOOY68vy+oBPiIiGzEcJCIW7dv99
         KgPQ==
X-Gm-Message-State: AJIora8CYyO+HzXdn3rQ35CkoStVM+d6iIo5FWUMkWddN3FpgJNzZSPx
	wQ3J6hAlJb9Ur5CJU3IybFtaAA==
X-Google-Smtp-Source: AGRyM1uWG6ktrbOE3BNKs0s25HDywKOhd7I0UvloEYVw1p//zHLTRdlDoRXER6oW+GWf5kX+u9L+Cg==
X-Received: by 2002:a05:600c:a03:b0:39e:4f0c:938c with SMTP id z3-20020a05600c0a0300b0039e4f0c938cmr92194wmp.145.1656429355425;
        Tue, 28 Jun 2022 08:15:55 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id f18-20020a7bc8d2000000b0039c747a1e8fsm21258152wml.7.2022.06.28.08.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 08:15:54 -0700 (PDT)
Date: Tue, 28 Jun 2022 16:15:52 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tom Rix <trix@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable clang tools for kernels build using gcc
Message-ID: <20220628151552.zkbvof7fyu3wtjqe@maple.lan>
References: <20220628122741.93641-1-daniel.thompson@linaro.org>
 <0478d832-d902-69ed-7c1c-4f19d942cddf@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0478d832-d902-69ed-7c1c-4f19d942cddf@redhat.com>

On Tue, Jun 28, 2022 at 06:19:09AM -0700, Tom Rix wrote:
> The limitations of the compilation db are not limited to the kernel.
> 
> Why shouldn't the change be made in the llvm project ?

I'd rather answer the question why should it be in the kernel ;-).
That's somewhat easier to answer because the kernel does have some
unusual properties:

1. It makes heavy use of kernel command line options, especially
   when compared to most user space components where the default
   compiler flags are something very simple ("-g -O2" plus include
   directories).

2. The kernel provides it's own tooling to generate the compilation
   database. For example, if tools like codechecker added features to
   their front end to mitigate this problem[1] the kernel wouldn't
   benefit from them anyway.

3. Rules like `make clang-analyzer` generate *and* consume the
   compilation database in a single pass. That makes it impossible to
   run fixup tools between generating the database and consuming
   it.

However going back to the original question:
> Why shouldn't the change be made in the llvm project ?

clang can (and probably will) learn about some of the newer gcc options
over time. However that doesn't actually help much since all that
achieves is a game of whack-a-mole where clang has to constantly play
catch up or the tooling will break.

Some other aspects could be added to the various different projects that
use the compilation database that would improve things (better automatic
handling of --target for example). That sort of change should still
peacefully coexist with an approach based on gen_compile_commands.json
though.


Daniel.


[1] Currently they don't workaround it automatically. They just imply
    that you may have to "fine tune" compile_commands.json after
    generating it:
    https://codechecker.readthedocs.io/en/latest/usage/#step-7-fine-tune-analysis-configuration


> On 6/28/22 5:27 AM, Daniel Thompson wrote:
> > This patch set makes it possible to use clang based tools, such as
> > the clangd completion engine, regardless of our choice of compiler
> > for the actual kernel build.
> > 
> > Most of the fine details are included in the patch header for the
> > first patch (since we'd like them to appear in the kernel history so
> > they can help future archaeologists).
> > 
> > Daniel Thompson (2):
> >    clang-tools: Generate clang compatible output even with gcc builds
> >    Makefile: Enable clang-tidy and clang-analyzer for gcc builds
> > 
> >   Makefile                                    | 11 ++--
> >   scripts/clang-tools/gen_compile_commands.py | 71 ++++++++++++++++++++-
> >   2 files changed, 74 insertions(+), 8 deletions(-)
> > 
> > 
> > base-commit: a111daf0c53ae91e71fd2bfe7497862d14132e3e
> > --
> > 2.35.1
> > 
> 

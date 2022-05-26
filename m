Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740AA10EC
	for <llvm@lists.linux.dev>; Thu, 26 May 2022 04:16:54 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id x12so369440pgj.7
        for <llvm@lists.linux.dev>; Wed, 25 May 2022 21:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=37YmkyKoFHlIVhfVoKPCu3X0KtxvVYiEfGmgY7IaoWc=;
        b=BKcYn8f17L+yU+CGhIC8h9AMgvMwnsvssgbOwL4AtCl2N5YT4quFIhiVYfdVcpzK/u
         lmTboJX5vE4RCnHUXecBGyRskSFfH6EOKmZs//ZKhd1ZNDQkSJc9nCszYSeUDs3ZRVTD
         RdIQUUXYfTAuoJ4mA5ULHontCPdbN0x/VOslUR6kpNyhkQQZRb03uDNaJSQS9/HvRc5Q
         2HFTpjbouv3Rdbu00Rv/ZDWbS+LXmzYvjTeiNwzCssBSJAISOl5jSRhgQ5gDLQ2cuxCT
         hAZIfCHVxQQ4hMzEz05dexDU4UgWAPCGQ1CNzDrkbC0ZLN/CQCvj6bvpm2bT7AVvcbHJ
         c+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=37YmkyKoFHlIVhfVoKPCu3X0KtxvVYiEfGmgY7IaoWc=;
        b=Nx5aEijKlaONLjWpI2iMqK3T/DavJkzHY+JwbSVi2691TngPcFg4ci0hgD2XdyiRwi
         IP9MaOGJ1lShLebL6tjZCIXUOqNNgxpfnT0OWo2MVIzaBXHohGpQN/Hb1KGkUaKk2ZEH
         ioXLw9Jc6L4TwHdyaM/G8zOQVP/8HdRWvo0NgeZVsk6F+sYxJRXFvqIJeTGJPiZarNDZ
         P3TYN/VEYu101yLd3yWXYl28GnVCj5RAOn43uysja4su7x0QAECKhwDCRC+W+MuAl6y3
         CSsSBXYFbUrx+GsMrCkiCfE0l2Yx8FDGvbHyOjn7njetdyBUxX3UkJH1bYXvP9YCyZay
         un5w==
X-Gm-Message-State: AOAM531t7UudQvh65hntiGJIc2/W4hzxA+/lkrQoHr/iZJFKqgvVi2lC
	auV6ZB5aoKXLwCwYAooA0KW45Q==
X-Google-Smtp-Source: ABdhPJz38bx3fzyCT+4echKVG9eVivcAwLYHYzZlB+x2j8aVSjuNNiASg7wab2fv8AOxmbz9/3KdrQ==
X-Received: by 2002:a63:8ac1:0:b0:3fa:d86b:c76d with SMTP id y184-20020a638ac1000000b003fad86bc76dmr6097250pgd.418.1653538613654;
        Wed, 25 May 2022 21:16:53 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:84dd:75b4:f155:aebd])
        by smtp.gmail.com with ESMTPSA id a26-20020aa795ba000000b00518d0707b52sm205809pfk.208.2022.05.25.21.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 21:16:53 -0700 (PDT)
Date: Wed, 25 May 2022 21:16:50 -0700
From: Fangrui Song <maskray@google.com>
To: Ian Rogers <irogers@google.com>
Cc: Travis Downs <travis.downs@gmail.com>, linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: Call graph dwarf unwinding fails with lld
Message-ID: <20220526041650.esbcujaihdv5jqxm@google.com>
References: <CAOBGo4zjkcX=ZQm1uYRDe9EjYqsTCyZY-Gf1C4XqMNYGFCcF+Q@mail.gmail.com>
 <CAP-5=fUobnt9anqeTaUt_EJVuMOpsxGR-Sa_e7qX=ZxqPDr+sA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAP-5=fUobnt9anqeTaUt_EJVuMOpsxGR-Sa_e7qX=ZxqPDr+sA@mail.gmail.com>

On 2022-05-25, Ian Rogers wrote:
>On Tue, May 24, 2022 at 1:50 PM Travis Downs <travis.downs@gmail.com> wrote:
>>
>> I have been tracking down an issue locally where `perf record
>> --call-graph=dwarf` stopped working in the sense that unwinding always
>> failed.
>>
>> Turns out it was related to `lld` - binaries linked with `lld` don't
>> seem to unwind correctly with `--call-graph=dwarf`. I've confirmed
>> that the `.eh_frame` sections are there, but I guess they are
>> different after using this linker.
>>
>> Has anyone run into this?
>
>I was unaware but thanks for filing the bug!
>
>> There's an open LLVM issue at https://github.com/llvm/llvm-project/issues/53156
>>
>> ... but no activity since it was filed, though it is not clear if the
>> problem is really with lld or the unwinders.
>>
>> In a related question: perf supports more than one DWARF unwinding
>> implementation, depending on what libraries are available at build
>> time, right? Is there a way to select which unwinder is used at
>> runtime?
>
>I don't think so. There are two build options NO_LIBUNWIND=1 and
>NO_LIBDW_DWARF_UNWIND=1. I played around with the example from the
>bug, confirmed no difference with the eh_frames and hand verified
>them, I also added -fno-omit-frame-pointer -O0 and -static. I've not
>got a good handle on the issue but my suspicion is that the
>eh_frame_hdr is broken - it is at least something that lld generates.
>If I change the eh_frame_hdr finding to some findable but unexpected
>offset like eh_frame here:
>https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/tree/tools/perf/util/unwind-libunwind-local.c?h=perf/core#n286
>and then test with a working linker the unwinding is broken similarly
>to with lld. I was looking for a useful tool (objdump, llvm-objdump,
>readelf, dwarfdump) to look at the eh_frame_hdr but I didn't see one.
>Perhaps someone has a suggestion or maybe pahole can do it. Hopefully
>this gives a lead for you to dig into for the bug.
>
>Thanks,
>Ian

I am very familiar with lld and have read some nongnu libunwind code, so I guess I
may be an appropriate one debugging the issue, but I am puzzled about how to build tools/perf:

/tmp/out/custom1 has needed llvm-project tools, built from origin/main
ninja -C /tmp/out/custom1 clang lld llvm-{nm,size,strings,objcopy,objdump,readelf,ar,strip}

```
% git checkout master  # torvalds/linux
% PATH=/tmp/out/custom1/bin:$PATH make O=/tmp/linux/x86_64 ARCH=x86_64 -j60 defconfig all
% PATH=/tmp/out/custom1/bin:$PATH make O=/tmp/linux/x86_64 ARCH=x86_64 -j60 -C tools/perf
...
In file included from bench/../../arch/x86/lib/memcpy_64.S:8,
                  from bench/mem-memcpy-x86-64-asm.S:14:
/tmp/linux/x86_64/arch/x86/include/generated/asm/export.h:1:10: fatal error: asm-generic/export.h: No such file or directory
     1 | #include <asm-generic/export.h>
       |          ^~~~~~~~~~~~~~~~~~~~~~
```

I am running a 5.16 kernel so I have tried `git checkout v5.16`, no luck as well.
I cannot find useful information about "asm-generic/export.h: no such file or directory" on www:(

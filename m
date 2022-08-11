Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B397F17D2
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 01:06:03 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id r69so9305546pgr.2
        for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 18:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=qhmWZeCsJqnoVO/4I2HwU7vBh5Ud9ehabi2slZ+OMXA=;
        b=czd/vDTVvda6KZUe547hGPrqW6j/oPibFGcMv5Ju4naIyPN5+WftwBAOtO9knYBBvo
         I5jB4g+nnPGq1BrTyADevnOrvpxnlDOQwwBr0y0qd4UJ841eTsaMKn+U/YngqEf7dag7
         2ysKxAxO39BeBxMmX2SDLCWW+W9IMI1xkYxmeVtVgB1G1lOfLhbfrieLeJ6UaEZtmiuE
         f+ncNwpfIdjC7eg8teK07EcvvYtCQRukL9N/pGJjV2Vrio4Cp8qTaaRVmpbqxwgHe4Qj
         4SvG0SU8U1wbD+CA82/DHrJGSUqGyhKOJ+kMtCsAkh++lu6kG7RSjq50jiYw1ORm3ugE
         Vc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=qhmWZeCsJqnoVO/4I2HwU7vBh5Ud9ehabi2slZ+OMXA=;
        b=gC4scz4/a4H24gp40cPE6h8voFd86w7bcoEXJu648Uodkh/sBRHq1A6JTT/n8etRCp
         R5UpQ5/d2YF/8IbmjVWmFJ+qtwCCSvsNZBuIjKR2nX8tVeZp2G/6clrvOB+ES6q3vxvW
         AklOWr4MozR12SVrLHFiunqHQfjEtAbiQRK/eNPBqiSW6sSKvCFfDAj66VfLiReErFMe
         PR5WfIy8ZC0T5mZICZN43kbZQm6S52ppPyTL6/ROtRYVv2qWvuSUz8cCAS1c1Qrv6//3
         eNYzjS/erqLRqW6C4xBSRQ4zEBxC4+wJOv9umFLWUqcVHBbFZCRGhO0X8WQtmioMc2WA
         AdBg==
X-Gm-Message-State: ACgBeo23TnMXJVzoeQAsm6f+oW1RQwrDt9xOs6rgxlshGYMHRgIZnUh+
	W7p0Mz0Q7T+cFGBrZbY9kbQrEw==
X-Google-Smtp-Source: AA6agR7Y+m5SQRx3CxOTCGuD1TjkYJX4IebNcEiCYYik42BmCmjB4gbh8/MtxkeBRwKROOvb3Y+EuA==
X-Received: by 2002:a63:6642:0:b0:41b:51af:63d with SMTP id a63-20020a636642000000b0041b51af063dmr25089583pgc.358.1660179962852;
        Wed, 10 Aug 2022 18:06:02 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id j4-20020a170903028400b0016ed20eacd2sm13484492plr.150.2022.08.10.18.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 18:06:02 -0700 (PDT)
Message-ID: <c01cb530-a937-4eba-92d0-0e7cc497929e@kernel.dk>
Date: Wed, 10 Aug 2022 19:06:00 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/2] link with -z noexecstack --no-warn-rwx-segments
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: Fangrui Song <maskray@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nick Clifton <nickc@redhat.com>, brijesh.singh@amd.com, hpa@zytor.com,
 kirill.shutemov@linux.intel.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, michael.roth@amd.com, n.schier@avm.de,
 nathan@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
 trix@redhat.com, x86@kernel.org
References: <20220809013653.xtmeekefwkbo46vk@google.com>
 <20220810222442.2296651-1-ndesaulniers@google.com>
 <20220810222442.2296651-3-ndesaulniers@google.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220810222442.2296651-3-ndesaulniers@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/10/22 4:24 PM, Nick Desaulniers wrote:
> Users of GNU ld (BFD) from binutils 2.39+ will observe multiple
> instances of a new warning when linking kernels in the form:
> 
>   ld: warning: vmlinux: missing .note.GNU-stack
>   section implies executable stack
>   ld: NOTE: This behaviour is deprecated and will be removed in a future
>   version of the linker
>   ld: warning: vmlinux has a LOAD segment with RWX permissions
> 
> Generally, we would like to avoid the stack being executable. Because
> there could be a need for the stack to be executable, assembler sources
> have to opt-in to this security feature via explicit creation of the
> .note.GNU-stack feature (which compilers create by default) or command
> line flag --noexecstack. Or we can simply tell the linker the production
> of such sections is irrelevant and to link the stack as --noexecstack.
> 
> LLVM's LLD linker defaults to -z noexecstack, so this flag isn't
> strictly necessary when linking with LLD, only BFD, but it doesn't hurt
> to be explicit here for all linkers IMO. --no-warn-rwx-segments is
> currently BFD specific and only available in the current latest release,
> so it's wrapped in an ld-option check.
> 
> While the kernel makes extensive usage of ELF sections, it doesn't use
> permissions from ELF segments.
> 
> Broken up into 2 patches; one for the top level vmlinux, one x86
> specific since a few places in the x86 build reset KBUILD_LDFLAGS.

For x86-64:

Tested-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe


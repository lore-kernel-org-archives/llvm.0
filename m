Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D5F7B
	for <llvm@lists.linux.dev>; Wed, 26 Oct 2022 15:37:07 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id y14so22337191ejd.9
        for <llvm@lists.linux.dev>; Wed, 26 Oct 2022 08:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NRAl70qY3j3vZyMIUT7GcMaBI6a+DFlOIhNnlrtBaJA=;
        b=nR++oRk27KdpUHzK25KyNMB64Fuzm7EE1QplYlREBHrVorYnfPsIjfL7225fR4CFbw
         R3xvYodLRcSfcS+jEZRdyHj8asnb72yEInDf7fjg0UHqx6/d/mLyV4XtTQ/9UIiI6ugP
         4U59B82KVk7dlebEavREE0TgILSbxHrumVJbMz3jX1S8h6fzvJL2yy1DXUE6j+ek+Fsj
         pb2I4RW2bDsz65BbQrV05oUMraHAX4XR8m5mr5yVl/kMwj49u5tXDjHoymCKGDgrHHs3
         kqB6X8WR+yDJVVLk9O418NnltJ3L538wszB0s1iHuCF6Y8yA8GensADLg19zDkWQqf1b
         DhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRAl70qY3j3vZyMIUT7GcMaBI6a+DFlOIhNnlrtBaJA=;
        b=Y2LX/QtRkD+bQ97ZtA5wheRsmsFYPRC8LVpZ7uXInXjT+kS0MkzofEl3yS+3T1Pv0c
         M+MTkSdwy42BEeUsxbh86MMsXOdBRJQELsAdWB09uDBut0kDpcfxmLazzLroO016A2ow
         WV/ZatLND4QY3pkvyhOUdZiST640WX3ZpU1WuohW4ic32KxrNsw5oU+xFwBycTlZsIjq
         KMhCetyjzEmLAQFlDt48aEujQwDSRSPU9s1VB4G+KdJvO+wm/cJQGq7lCZRVUrKpaXXs
         2nqGGnLZ+jdrcjt6JpRb/hxTphNxNiyRo2qyaNr0Fz7POJIAQIq2Os4u0d8YH6gsjfGT
         L/Sw==
X-Gm-Message-State: ACrzQf39pOmaGEEi8BlIfgavcEq83cxq75ZDeTQx7Ax3rKeedcGwuIoi
	/jarLVCDOHDnBM5NlkFIVrqKXzQnSal0DrKnxoSfSQ==
X-Google-Smtp-Source: AMsMyM6GD20fveHyuqvQkjReBdrzYGU7sOoLCm9Y1Gr6teII7lBnYnsilAIBr4rOTLjo/ieQPi4ahPPLbjAl6euKnHI=
X-Received: by 2002:a17:907:7633:b0:7ad:85ee:c66d with SMTP id
 jy19-20020a170907763300b007ad85eec66dmr1087291ejc.730.1666798625785; Wed, 26
 Oct 2022 08:37:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210251659.tRMs78RH-lkp@intel.com>
In-Reply-To: <202210251659.tRMs78RH-lkp@intel.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 26 Oct 2022 08:36:29 -0700
Message-ID: <CABCJKudMzRcgZCVv4gF3QwKGxq3F2aVQj87WkMdh1ZFvy10DoQ@mail.gmail.com>
Subject: Re: ld.lld: error: undefined symbol: __kcfi_typeid_ftrace_stub_graph
To: kernel test robot <lkp@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 25, 2022 at 1:22 AM kernel test robot <lkp@intel.com> wrote:
> >> ld.lld: error: undefined symbol: __kcfi_typeid_ftrace_stub_graph
>    >>> referenced by entry-ftrace.S:299 (arch/arm64/kernel/entry-ftrace.S:299)
>    >>>               arch/arm64/kernel/entry-ftrace.o:(.text+0x48) in archive vmlinux.a

We don't seem to have any C translation units that would take the
address of ftrace_stub_graph with this config, which means the
compiler won't generate the __kcfi_typeid_ftrace_stub_graph symbol.
Adding __ADDRESSABLE(ftrace_stub_graph) to a suitable place would fix
this issue, perhaps somewhere in arch/arm64/kernel/ftrace.c?

Sami

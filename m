Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B322C80
	for <llvm@lists.linux.dev>; Mon, 15 Nov 2021 13:09:26 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id c32so43466512lfv.4
        for <llvm@lists.linux.dev>; Mon, 15 Nov 2021 05:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g5lYCRdztAJ/tNA9EHXetSNsC/jaC9qtFRqYEhiyLhc=;
        b=O+chpzPjiP8XKcxY8+0Fu68ASM4imghDVHWGNyZtJ5+gPrZ4tK7cz0jW+x4UdbS2Ja
         oKdJlQfwHRgriJGGd144tvhtOzhec/bLVuS8h5weXjr925N/lX+ZFu7YAc+diEDi5zTy
         REvQN3syJPiNbAmhBkuUg+yf/o8HtJdg+R2ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g5lYCRdztAJ/tNA9EHXetSNsC/jaC9qtFRqYEhiyLhc=;
        b=VU9IiKdHskf7OQdI6IhaWTGyqA34k3b9SvMyvndRyxWrkRXkgEZ1XXGjLpWsk4N5hP
         5x54rfBedhM9NgsUBCJrOA5+O+4cgf0cXJgUuFJYXkDXn7ekla7zyz5BVW3bHDIFsNHg
         oAkOO8wFQhNJqgZ+V9cOCHdygu8VFcAg0SnR1T/IBztgoCL+5CbRoupgY31J+NniGt7w
         rKEt7iFH0g5qPrU+FBpqezORdyJ/R/FehL0IHMib80Kx1wyLyPzmqzQbmStX/x/dXTY3
         i1Phxz1VL+THD7U15YCk8hMWZtEZiPCeONLGZpWxRptqo3VRp9iaWfpmf8EYlyD7zGHr
         AqFw==
X-Gm-Message-State: AOAM531KsElpp0BSUNk1wyJXKFXyxxJabr7P7GhdVrvYW3BXWpyVOScN
	A650cQey0WanJDSvpr1ZovLILg==
X-Google-Smtp-Source: ABdhPJwoLHLUq1UBckpkf1rqac8FXosa8RN7DMRBASeZDBEsIZQtkRNrhdZgHcUG1w3gXbQIWM6LtQ==
X-Received: by 2002:a05:6512:39d3:: with SMTP id k19mr27702195lfu.81.1636981764529;
        Mon, 15 Nov 2021 05:09:24 -0800 (PST)
Received: from [172.16.11.1] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id k15sm1495966ljh.98.2021.11.15.05.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 05:09:23 -0800 (PST)
Subject: Re: [PATCH] static_call,x86: Robustify trampoline patching
To: Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-hardening@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, joao@overdrivepizza.com
References: <20211027120515.GC54628@C02TD0UTHF1T.local>
 <CAMj1kXEx10gC8eH7rV-GbZZj2M3uDue6HYsKb+A5J01zOxm_FA@mail.gmail.com>
 <20211027124852.GK174703@worktop.programming.kicks-ass.net>
 <YXlOd1lyKZKAcJfA@hirez.programming.kicks-ass.net>
 <CAMj1kXHKh7wv6JqusVnoiQDMm7ApFq2ujzbfWmM9AzLKFehhAA@mail.gmail.com>
 <YXlcMluaysPBF92J@hirez.programming.kicks-ass.net>
 <CAMj1kXECTdDLVMk2JduU5mV2TR0Cv=hZ9QOpYRsRM1jfvvNikw@mail.gmail.com>
 <CABCJKufpS4jJxHqk8=bd1JCNbKfmLDKBbjbhjrar2+YQJFiprg@mail.gmail.com>
 <20211029200324.GR174703@worktop.programming.kicks-ass.net>
 <20211030074758.GT174703@worktop.programming.kicks-ass.net>
 <20211030081631.GF174730@worktop.programming.kicks-ass.net>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <554c64df-14ca-2019-a54c-cdc4d84e71f8@rasmusvillemoes.dk>
Date: Mon, 15 Nov 2021 14:09:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211030081631.GF174730@worktop.programming.kicks-ass.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30/10/2021 10.16, Peter Zijlstra wrote:
> On Sat, Oct 30, 2021 at 09:47:58AM +0200, Peter Zijlstra wrote:

> So fundamentally I think the whole notion that the address of a function
> is something different than 'the address of that function' is an *utter*
> fail.

Agreed. IMHO, commits like 0a5b412891df, 981731129e0f should have been a
big red flag saying "ok, perhaps we shall not mess with the semantics of
function pointer comparisons". Yes yes, the commit log in cf68fffb66d6
did dutifully say "This may break code that relies on comparing
addresses passed from other components.".

But it did not spell out that that for example means that i2c bus
recovery now doesn't result in recovering the bus but instead in a NULL
pointer deref and kernel panic: Some i2c drivers set ->recover_bus =
i2c_generic_scl_recovery and provide ->sda_gpiod, ->scl_gpiod, then rely on

if (bri->scl_gpiod && bri->recover_bus == i2c_generic_scl_recovery)

in i2c-core-base.c causing ->get_scl/->set_scl to be filled in. That's
of course broken with ->recover_bus pointing to the module's jump table,
so when ->recover_bus is actually called, the bri->set_scl() call in
i2c_generic_scl_recovery() is a NULL pointer deref. [I've tested that
this actually happens on an imx8mp_evk board.]

And who knows how much other code happens to rely on function pointer
comparison working as specified in the C standard for correctness.

Rasmus

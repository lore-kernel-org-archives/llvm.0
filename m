Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989CE2C9C
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 00:20:36 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id o6so155018566edc.4
        for <llvm@lists.linux.dev>; Tue, 04 Jan 2022 16:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IDbU1kj34UMWw/qTzlhM7eSBun7e9w/1neHTsviDCAI=;
        b=bPPmygOAG5tVVPOwFV8D0riSscD+Im6II1WEcywcC33AefldB0PhZQvx4diULh53ih
         qrnyuVhk0sJOjvd+jfD33OGkstu9HsWIhgniqi59UnoQhy3HSJ9RPKqJl3fVdQvofIpo
         +yHAJVdgbgHlZINRN1Dq52wj13djpvQS4G7uCNCL64EfiNS0bXkmtuaLoOlb73rHqSXf
         TF0RI5uWSMl2dTL7sEGYKcHbNe9pWqgjPbMLOmxH2MjMIb6Z/g4U3NY5hzR2iZrZ+Slg
         StrPTx/RNMqAUUrDMya7lcLR7iQy+rAA9nzHnZpODOnfZxM5S5t6qqjvzZDS0/A3mh18
         53kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=IDbU1kj34UMWw/qTzlhM7eSBun7e9w/1neHTsviDCAI=;
        b=RkmfMYBKymZ4Eug84Y2EGhu5eJBXEht/l8esfOl3w/tGNgen9HfM8h20D8m/h861SQ
         CsjSN3iBcnhl8YV6DMj7LeCNiA7D1T4HUYC94JGa+jCcizNRleWuqRHPfzgJHwRx5jB/
         uih2tfBGZbsDp+h87nyiooOD1A4w8A1BQPNYrRTyhtPGzflwqjgnwTndL2PvRky9wGZQ
         9JSWkN2CWyE+Fcjn3Wj1n3JGM6GiqddVZZCsOoj390gFAiy3dUmjNFox2/zRB5VBgG8w
         s/jnAXxTCANtg/lrfm+eTTt7g30l+am6K54RzE9jq9Vw9Pw//jnoTOw73eRb/uhyWG9H
         2S/w==
X-Gm-Message-State: AOAM530Z0nezMG4uBaUEUX+K0X6bVp1hl5yxbtxhz6cpr5jrNkEf6aHO
	ziriXShIRm1f+RiW5NXkudA=
X-Google-Smtp-Source: ABdhPJxskks3Pd8N4UAavKBRQ9f1aed6hiyrJvAMxloD2sXbO5IBOoYHeauxTHhjrjJS4TaRCIc6SQ==
X-Received: by 2002:a17:906:a091:: with SMTP id q17mr40602282ejy.669.1641342035022;
        Tue, 04 Jan 2022 16:20:35 -0800 (PST)
Received: from gmail.com (0526F11B.dsl.pool.telekom.hu. [5.38.241.27])
        by smtp.gmail.com with ESMTPSA id ky10sm9551054ejc.151.2022.01.04.16.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 16:20:34 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Wed, 5 Jan 2022 01:20:32 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, llvm@lists.linux.dev
Subject: Re: [PATCH] headers/deps: dcache: Move the ____cacheline_aligned
 attribute to the head of the definition
Message-ID: <YdTkUBSLCQv7++FN@gmail.com>
References: <YdIfz+LMewetSaEB@gmail.com>
 <YdM4Z5a+SWV53yol@archlinux-ax161>
 <YdQlwnDs2N9a5Reh@gmail.com>
 <YdQpSigW9X224obC@gmail.com>
 <YdSJH7empIUq9vbE@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdSJH7empIUq9vbE@archlinux-ax161>


* Nathan Chancellor <nathan@kernel.org> wrote:

> Nowhere does it mention that it accepts the attribute before the type 
> keyword and neither compiler respects the attribute if it comes before 
> the keyword but at least clang warns: https://godbolt.org/z/E9fTecKPv
>
> $ cat test.c
> #include <stdio.h>
> 
> struct foo {
>     int a;
>     int b;
> };
> 
> struct __attribute__ ((aligned (64))) bar {
>     int a;
>     int b;
> };
> 
> __attribute__ ((aligned (64))) struct baz {
>     int a;
>     int b;
> };
> 
> int main(void)
> {
>     printf("struct foo alignment: %zd\n", _Alignof(struct foo));
>     printf("struct bar alignment: %zd\n", _Alignof(struct bar));
>     printf("struct baz alignment: %zd\n", _Alignof(struct baz));
>     return 0;
> }
> 
> $ gcc --version | head -1
> gcc (GCC) 11.2.1 20211231
> 
> $ gcc -std=gnu89 -Wall -Wextra test.c; and ./a.out
> struct foo alignment: 4
> struct bar alignment: 64
> struct baz alignment: 4

Ugh - so my changes there are outright buggy.

I'm reverting all those attribute position changes as we speak ...

I'm actually happy about this in a way, as it settles the issue nicely. :-)

Thanks,

	Ingo

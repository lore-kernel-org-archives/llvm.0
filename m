Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FCF5A7C
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 18:10:56 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id b75so4908946pfb.7
        for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 11:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FdAwaR2ThOuiEkbcZBSK+LnUmsamyS86q3QP/tm0gAk=;
        b=l7a1aZIzcaqxlxcKCOg2rfD97WjT6mvyxS81K+jeiPEurzrvoMXhrmG7+DY3ACQRKp
         eqh+1SeGRM4Gvzfo0L77PITM901lagPAy9lB2dzRjNnftL6Aqx0g8i51uYGXx4E4tqce
         BdSW4Ryr9LwIHzyHWZE97S+54YNi5ptJlU8bLbpORMt10xlSekDHWmoaSEaVC+6dX6N9
         ab5ezxQpsnvMSUY4/6SMgATV+4pVdmux8qv4W3ByYsp2NFQy263vTkvV9362enHEROkh
         OtQB7iq2d6GzbAOn0E/oP3/jlXZAIiAFJw1MQBWyw4lgPNrbndVa/j/XjURbLkpkK6nO
         OTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FdAwaR2ThOuiEkbcZBSK+LnUmsamyS86q3QP/tm0gAk=;
        b=oHAvnbsXoGCISbOleMLOCtmXBtzF0LvMGvggFl4maJENk5C9Ano97BpN+LSeZxyHEQ
         hPsNN+hh7CzFwzYGnphOl9eeCzLMm1zZ/U3FzzT9XEeE20GutgCoqdd8XkqcgJd5MAYu
         BtGv4ybQNu4s22SWvPQmZpGzjwvm8I4+StQV90zbagLjXsU8EuoGIBlwJs/sLZDzBZ88
         oJ/T3ugkrBisAZK7M2Zno79qz8GInNIpJ7wTOjy6ZHWqDdkTnIe5MdRJT4Zr/iFm+Eox
         9Ntd+pgDi3K2HV1KdcgxI3RT9VNWp8HHVLR4x54zIr2C5NjYq8KIq+15ncTN3N95le2t
         n6Vg==
X-Gm-Message-State: ACrzQf0uSTI89yy5PC7PB/hIE4FwE1YKEu8q1ipRc4T6ol6bEUzdXm4K
	Fj/K7nAdT8i5nrpSBq9sb0JHu+uoIeiE+Zu69u0asQ==
X-Google-Smtp-Source: AMsMyM6b6d5PRzEl8t8Xryx+i34BOBUdxOQjKRDtvOB1nuKhNXfvBQg1ErJjFskWinXmgjPpV9+i5H9hBPxol7sIhOo=
X-Received: by 2002:a05:6a00:4c11:b0:53e:4f07:fce9 with SMTP id
 ea17-20020a056a004c1100b0053e4f07fce9mr10553729pfb.66.1664561455909; Fri, 30
 Sep 2022 11:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220817185410.1174782-1-nathan@kernel.org> <CAKwvOd=0R76r6YqNiOhGNt_XrA_t_ZbuBbNNdNXV4CWpDy0+Bg@mail.gmail.com>
 <Yv3uI/MoJVctmBCh@worktop.programming.kicks-ass.net>
In-Reply-To: <Yv3uI/MoJVctmBCh@worktop.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 30 Sep 2022 11:10:44 -0700
Message-ID: <CAKwvOdk_XAXNJ5n_WdymSqZq=No2pbHpSJiJkH6K4gPFEEVNNg@mail.gmail.com>
Subject: Re: [PATCH] x86/build: Move '-mindirect-branch-cs-prefix' out of
 GCC-only block
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, "Moreira, Joao" <joao.moreira@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 18, 2022 at 12:45 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> This being clang, you'll ofcourse still have a few weird:
>
>         "Jcc.d32 __x86_indirect_thunk_r11"
>
> sites that will not be able to be replaced, but there's nothing I can do
> about that other than to continue to encourage y'all to stop emitting
> them ;-)

Joao has a patch up for this:
https://reviews.llvm.org/D134915
-- 
Thanks,
~Nick Desaulniers

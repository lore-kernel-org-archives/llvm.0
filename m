Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA9BA44
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 17:48:53 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id ay14so51969543edb.11
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 09:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1678211331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZk09D5pV/NBkHKsxPjLwaZasMmLHwZapP7AnIBpNcg=;
        b=WruLAjKFZOFdfIe7EuDK9tY/N8hZkZIRh8wNI71uWLzKHx0REgxD21cB3kBYCSZvA2
         5S2B2/+pW1GvA/Q/erVyYaHSoy2t4rZUZyJCYVlyCrWcxfXkyM7lxtbXGtjgkLJd9ZG7
         Suz3TullXqi0bnxkPa/QJDUMy3HwYMeDIJPCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678211331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZk09D5pV/NBkHKsxPjLwaZasMmLHwZapP7AnIBpNcg=;
        b=PYKK8DE8+FE0AL1BZSzsWzSqm39K6mKC0F0UAqijLqjsHDBjvQ1nYKkRbk8qtYgtvg
         55M7kI169v5hthtoC3BpYBWQioXlnH0zBIZhpt8RvGX4pKaV8Z4KbnXdMBtOwqH+11lG
         GrmqKxMo0LLYxSu3OQv3mKCE/4NG6UZ6S+k9T/HVcdv4in6MI7fPQXoAwgDa3Ln1LV6c
         UOXfOtK+rzXE+5P5F4w6LJtml9PDZhI2JQPs7eaHEBWlP9ze1YrZ9011wjqurxf8Hicw
         HNm7jnioTZO6bPZoJuGsEEW/RiFd9imO7QdzN0K139sWxTLw0wNlAk9kF+HwhEAyYCOD
         gUbA==
X-Gm-Message-State: AO0yUKWHl0BE5wXbQjAf0wQLwKigZV1sKTXe5YBWULbRTWe4XYNqpZil
	9Qqlis+ap9yyUHvKzRMcK0Hm3vK5gb6ZJS3w9VI6EX7n
X-Google-Smtp-Source: AK7set84SVLhaBhPvHv/tp0v/k5zaeA1DRqgxHaMf6wVzlrxL18FaNzENxPLc1j136dzJyjATYcvnA==
X-Received: by 2002:a17:907:c61b:b0:878:4e5a:18b8 with SMTP id ud27-20020a170907c61b00b008784e5a18b8mr16906113ejc.66.1678211331448;
        Tue, 07 Mar 2023 09:48:51 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id p12-20020a17090628cc00b008b1797b77b2sm6406982ejd.221.2023.03.07.09.48.50
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 09:48:50 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id g3so55795975eda.1
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 09:48:50 -0800 (PST)
X-Received: by 2002:a50:cd94:0:b0:4c2:1a44:642e with SMTP id
 p20-20020a50cd94000000b004c21a44642emr8679892edi.5.1678211329875; Tue, 07 Mar
 2023 09:48:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303231133.1486085-1-eranian@google.com> <20230306120106.GE1267364@hirez.programming.kicks-ass.net>
 <CAKwvOdnRvd5KK01awAyeyt5S36TPPW4_8Z6YL1r4gB-pBrHTbg@mail.gmail.com> <20230307113545.GB2017917@hirez.programming.kicks-ass.net>
In-Reply-To: <20230307113545.GB2017917@hirez.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Mar 2023 09:48:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=whX6g3QPA_g_ovsig8CsSHRS-vTWkdn9GCUCAZY=XPtCw@mail.gmail.com>
Message-ID: <CAHk-=whX6g3QPA_g_ovsig8CsSHRS-vTWkdn9GCUCAZY=XPtCw@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: avoid compiler optimization in __resctrl_sched_in
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Stephane Eranian <eranian@google.com>, 
	linux-kernel@vger.kernel.org, tony.luck@intel.com, reinette.chatre@intel.com, 
	fenghua.yu@intel.com, peternewman@google.com, james.morse@arm.com, 
	babu.moger@amd.com, ananth.narayan@amd.com, vschneid@redhat.com, 
	Nathan Chancellor <nathan@kernel.org>, clang-built-linux <llvm@lists.linux.dev>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 3:36=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> > I don't have a satisfactory answer yet, but am looking into this.
>
> Oh, geez, what a twisty tale that... So Linus knew back in '09 that "p"
> was icky, but it sorta was the only thing and it 'worked' -- until now
> :/

Yeah, so 'p' definitely is about the pointer, and I do worry that it
is only a dependency on exactly that - not the memory behind it.

I have this dim memory about us having talked about this with some gcc
person, and coming to the conclusion that it was all fine, but I
suspect it was in some very specific case where it might have been
fine for other reasons.

> Is there a way to explicitly order these things? barrier() obviously
> isn't going to help here.

So one "asm volatile" should always be ordered wrt another "asm volatile".

I have this other dim memory of it not even being clear whether "asm"
and "asm volatile" are ordered. I don't think they necessarily are
(with the obvious caveat that an asm without any arguments - a
so-called "basic asm" - is always volatile whether the "volatile" is
there or not).

I have a lot of dim memories, in other words. Should that worry me?

And then there's the "memory" clobber, of course.

But both of those are also going to disable CSE.

I do think that percpu_stable_op can use "p", but only when the value
is *truly* stable and there is no question about it being moved around
things that might modify it.

                         Linus

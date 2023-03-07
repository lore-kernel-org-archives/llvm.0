Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D1710792
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 21:19:27 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id g3so57990359eda.1
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 13:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1678223964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRkOZ5wI6FwGaM4HgKKUX1s/pa2xIbKjX2uXD922yeA=;
        b=chSxj0mpjqI9ZSrsguW7U9GOdTy4KEDIvukMgkc4YnzALeW9HrqOIacWOobYTCh3EX
         B6wl1EmFC72B9L33/XjxCNazJTQ23/gG8du2/WtM6iUrzM170317QdCukLyDfdwZrDss
         Kt+vda2NA7yyoAbWwjWP+EqCS93q0CkexZJeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678223964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRkOZ5wI6FwGaM4HgKKUX1s/pa2xIbKjX2uXD922yeA=;
        b=Wccz3l00iieSmqDnEuH+G+uUjj9IjiLROiVFSDntsUWUwyo4OkqPrVInxTq0DanEMA
         xKtNhA6v1lssjPuq8OKvJGY7YOirflISe/QdlsD3BqjXxwsabPaNqyjkD14O5z21bs9l
         7dHUTFFp59dmqokbU9jGBywdAa6jyQwlUNiAUYcNFrKBOjT35OKAQUKelO/ZVk36DSII
         i9TMUDKHgITIr7f2A3tYhL5F3XEepPZyHvX7bO6ZpWKZURQgJB+7i3lsEbfG1rjkUKqa
         Veyoh+y1n6/7o2HLe3WH2IC2d9zdl6j95/yaewBGE4xDADWjrjr/dmmVeGEbKcXvtE6z
         hMoQ==
X-Gm-Message-State: AO0yUKXnGUZRcBQKDYkd4nDt0AV0uCEIXiSD7tfHoPwQW5NXQ9zj4dcA
	I08kENZ5VIqOMFjhz3RcAzN7v2s19MK0Qj9qkzCIedSG
X-Google-Smtp-Source: AK7set8bFEGRwQTQ1hXOg3Zo3m0q7MSBv9iaMMgUs2tncGyR5O0Ior07XvI7Lr/lF+R//kzdF9z9iw==
X-Received: by 2002:a17:906:6c9:b0:8b1:77bf:5b9f with SMTP id v9-20020a17090606c900b008b177bf5b9fmr15637441ejb.13.1678223964008;
        Tue, 07 Mar 2023 13:19:24 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id p6-20020a170906498600b00914001c91fcsm2350694eju.86.2023.03.07.13.19.22
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 13:19:22 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id cy23so57729947edb.12
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 13:19:22 -0800 (PST)
X-Received: by 2002:a17:906:a01a:b0:8f5:2e0e:6dc5 with SMTP id
 p26-20020a170906a01a00b008f52e0e6dc5mr8132383ejy.0.1678223962342; Tue, 07 Mar
 2023 13:19:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303231133.1486085-1-eranian@google.com> <20230306120106.GE1267364@hirez.programming.kicks-ass.net>
 <CAKwvOdnRvd5KK01awAyeyt5S36TPPW4_8Z6YL1r4gB-pBrHTbg@mail.gmail.com>
 <20230307113545.GB2017917@hirez.programming.kicks-ass.net>
 <20230307184315.GS25951@gate.crashing.org> <ZAeh8g0nr3IFRSVI@tucnak>
 <CAHk-=whOLcy=oz=gHyoSSEnqc3M-APKFKTtTvA_3wYYPV8L+oA@mail.gmail.com>
 <SJ1PR11MB6083CADB2B6E859915D456F7FCB79@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CAKwvOdna5NZ0ZTv0pXVVz15=4FLkw7pfFgr6KsRtXRmi2o1uEw@mail.gmail.com>
In-Reply-To: <CAKwvOdna5NZ0ZTv0pXVVz15=4FLkw7pfFgr6KsRtXRmi2o1uEw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Mar 2023 13:19:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiVP8ezgCyBTq3GV-1ebiOf03Qo_iHnVAR08NJO0jOocg@mail.gmail.com>
Message-ID: <CAHk-=wiVP8ezgCyBTq3GV-1ebiOf03Qo_iHnVAR08NJO0jOocg@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: avoid compiler optimization in __resctrl_sched_in
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, Jakub Jelinek <jakub@redhat.com>, 
	Segher Boessenkool <segher@kernel.crashing.org>, Peter Zijlstra <peterz@infradead.org>, 
	"Eranian, Stephane" <eranian@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, "Yu, Fenghua" <fenghua.yu@intel.com>, 
	"peternewman@google.com" <peternewman@google.com>, "james.morse@arm.com" <james.morse@arm.com>, 
	"babu.moger@amd.com" <babu.moger@amd.com>, "ananth.narayan@amd.com" <ananth.narayan@amd.com>, 
	"vschneid@redhat.com" <vschneid@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 1:16=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> >
> > Can you expand about part "a" ... Linux has zillions of static inline f=
unctions
> > in header files to handle CONFIG options. One version is the real McCoy
> > while the other is just a stub for the CONFIG=3Dn case.
>
> Right, I had the same question.
>
> Perhaps it's more so that no one calls __resctrl_sched_in, only
> resctrl_sched_in, therefor they should be folded into one function?

If you think it should be inlined, it should be marked as such.

And if you *don't* think it should be inlined - quite possibly the
right answer here - the definition of that function damn well
shouldn't be in a header file.

So either way, that __resctrl_sched_in() was wrong, wrong, wrong.

           Linus

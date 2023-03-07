Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4947810792
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 21:22:57 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id y19so8442904pgk.5
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 13:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678224176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67EAjS6OmcGVxbTP0Fh6bz0JB0dwnl7kfC5zuHtq9rU=;
        b=iBGugF4Y1PFbTwiaL4V7YFcnD/gnmu+YDPZKoeiYCz1/zmDS06H69//j+KGTvJfKBy
         OcOw1FDGiy16Qt6jOmKfjg/RHsxctVnKfCnHy462Y7thrWinNX1/oBhpMUJhEccllpmE
         DMVtfFKJpHfI67Ntlf5jgPW7DqJHiXpDJxAMDg41e4fKR0bPTZiqGNFQMsubLICWbIcJ
         haOxBSGcdvL0zzEuL0NTV7hgfcyIhJdlWGwb46z0c/S5HgZ28fpcYn82Kzz2ZlXP+rCa
         JJIGQXb8xihxwWUY12p1JoJQbi8+OpGvR4LXshBcujAxbkDrB9KrLlJaL6pNxkZgRFjG
         l0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678224176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67EAjS6OmcGVxbTP0Fh6bz0JB0dwnl7kfC5zuHtq9rU=;
        b=vLfHbUrz7CU7WrPC9yovLcWHMqqldgtwvh/Z001i29Viu3adFXCeePjtgGzIfHm2v5
         bddHvIk+mZTpLnzZ2a1KAjd3dncxk9Wt7Ffdwh8V5q7dEc1T2dwpXiP2anHfNgqqJTV4
         IpzcFkLWhfKgjWBiqd1ZBwbdld22AKgAySrJXsUHjtHbLz5YWZlbluOsOsDRcTFgUtL+
         jABv7yZr/wwXyAw+bXFGINzqMc88vr8yscwM2X0v8oX4NW9jFid9dKwYz4aiGITU2ZE9
         /SS30yK2ubAaftIN69SzErQw4gMUyAuzX/U7yK4x+J1eRVygvb2g66yVHoztsX+dl86i
         tVeA==
X-Gm-Message-State: AO0yUKWO9porgHvZ/dd6b03YmaPLs+rGWdv+Moj3jcas/S/POVlZwXhK
	Mkd9Alz1t6np4h5zqpJyL/V8vsR4vAPzksW0PlORlg==
X-Google-Smtp-Source: AK7set9uvx8ttF6ieYsBsI1zZDQOyhN7yS7IciKF4MD1fsN1gODyh1DdeG6lFiyweJw2iC+Ipfs3zd2zAh0J4ZzEsdo=
X-Received: by 2002:a62:ce4c:0:b0:606:63cd:506c with SMTP id
 y73-20020a62ce4c000000b0060663cd506cmr6797543pfg.1.1678224176420; Tue, 07 Mar
 2023 13:22:56 -0800 (PST)
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
 <CAKwvOdna5NZ0ZTv0pXVVz15=4FLkw7pfFgr6KsRtXRmi2o1uEw@mail.gmail.com> <CAHk-=wiVP8ezgCyBTq3GV-1ebiOf03Qo_iHnVAR08NJO0jOocg@mail.gmail.com>
In-Reply-To: <CAHk-=wiVP8ezgCyBTq3GV-1ebiOf03Qo_iHnVAR08NJO0jOocg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Mar 2023 13:22:45 -0800
Message-ID: <CAKwvOdk1n2v5Sym14BR0jGWKX8nNP1VL4Z1vXtAOWvQETOCSmQ@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: avoid compiler optimization in __resctrl_sched_in
To: Linus Torvalds <torvalds@linux-foundation.org>
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

On Tue, Mar 7, 2023 at 1:19=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Mar 7, 2023 at 1:16=E2=80=AFPM Nick Desaulniers <ndesaulniers@goo=
gle.com> wrote:
> >
> > >
> > > Can you expand about part "a" ... Linux has zillions of static inline=
 functions
> > > in header files to handle CONFIG options. One version is the real McC=
oy
> > > while the other is just a stub for the CONFIG=3Dn case.
> >
> > Right, I had the same question.
> >
> > Perhaps it's more so that no one calls __resctrl_sched_in, only
> > resctrl_sched_in, therefor they should be folded into one function?
>
> If you think it should be inlined, it should be marked as such.

Yep, sorry, I missed that `inline` was missing from that definition!

>
> And if you *don't* think it should be inlined - quite possibly the
> right answer here - the definition of that function damn well
> shouldn't be in a header file.
>
> So either way, that __resctrl_sched_in() was wrong, wrong, wrong.
>
>            Linus
>


--=20
Thanks,
~Nick Desaulniers

Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480742C8B
	for <llvm@lists.linux.dev>; Tue,  9 Nov 2021 21:26:01 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id c32so777796lfv.4
        for <llvm@lists.linux.dev>; Tue, 09 Nov 2021 13:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0pEy8zRbX4M0WulD1O3v1mhyXPMQ6YHtrHY83BsLR0g=;
        b=m4GdQSz+6PKu49f3JNqC0i9Ir+h0KyfXoFOYlFH4WhD4aZ1lWy7xNAp6CdaNqcc6Om
         PJoUfVnVTHKpTKfuhhBnTWP5OeSjqM3u5moYAj4FACkujCsLl2Av2YXANeQOmGZASu57
         Pc1Fju4Fx9mhlkloszkJRUhsrcIwm73AFRVazYvQ+0h2kDIiKGX31LGPt0CcLPDM3jrn
         ikXuEC0R8rCJjqWYR1fJ3Zny40fRohWvauCds4E70RsEIrNf190nFlSGHg1GcqIdMEZm
         Su9pp5hly9gWq4FLASd3z49GVs7dWSMcy6QVWUvhB/k7WeLty9YlGb3t8FUUw3PloGyD
         ToDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0pEy8zRbX4M0WulD1O3v1mhyXPMQ6YHtrHY83BsLR0g=;
        b=GSJfla3ZQYmj7o40Lw3lQ0NhxZ+fXsOd27auYP2tOgNPZlzeeHxhZtONwJqXbyigZw
         7puaOr3wOaB2oNYzDUB7tSl/7E/gX8fF8Tz8sEYOH8JJLOFDIlAqK3dqtBQL2mPHXUYZ
         mAbb6WJjaHMfG1TSM3ijaDpJzfEXwbuzIRCYDyFomtR+W3t2YWNmhJE2yzAb6oVssPmT
         eoUkRLq3BSKtSE9EmBxpQKwC0wFyPs839zfBSpHnZIj0UVK0Ahm/QnEEsEG10s8aoigt
         BcHeEl7PMy6JwI2m+3g0uTZKyz9yVWIBZdPGwOKXGGig6/jBtYzsJlsVIcZHwPA6Falw
         nyZw==
X-Gm-Message-State: AOAM532lkO7xSrtMbDM8LRMOQdc+SHQoB+FLyAb/ZjuXGu3intf942ms
	Fae5Ux9XmDyl5ro/UhWnjA0ny3V9QopBA6dHtv6iRQ==
X-Google-Smtp-Source: ABdhPJzAuZ0fJiDD4u+9qnqI2MbQh8ZPVDGKUAVD3PQQU+dwZoFDORUfzFz1zfA/o6wRbHl6wwGW32ZCEBhXHLlM5Zw=
X-Received: by 2002:a05:6512:110e:: with SMTP id l14mr72283lfg.550.1636493159120;
 Tue, 09 Nov 2021 13:25:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211105171023.989862879@infradead.org> <20211105171821.654356149@infradead.org>
 <20211108164711.mr2cqdcvedin2lvx@treble> <YYlshkTmf5zdvf1Q@hirez.programming.kicks-ass.net>
 <CAKwvOdkFZ4PSN0GGmKMmoCrcp7_VVNjau_b0sNRm3MuqVi8yow@mail.gmail.com>
 <YYov8SVHk/ZpFsUn@hirez.programming.kicks-ass.net> <CAKwvOdn8yrRopXyfd299=SwZS9TAPfPj4apYgdCnzPb20knhbg@mail.gmail.com>
 <CAGG=3QVecQroYbJ05AGk2f0pe=QOtWuZHyQowzG0i7os8E9fdg@mail.gmail.com> <20211109212116.GW174703@worktop.programming.kicks-ass.net>
In-Reply-To: <20211109212116.GW174703@worktop.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 9 Nov 2021 13:25:47 -0800
Message-ID: <CAKwvOd=3wFr=juT7hXPowHBvOTVPTW7LuB6XwHzURGd=GXkK1Q@mail.gmail.com>
Subject: Re: [PATCH 20/22] x86,word-at-a-time: Remove .fixup usage
To: Bill Wendling <morbo@google.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, dvyukov@google.com, seanjc@google.com, 
	pbonzini@redhat.com, mbenes@suse.cz, llvm@lists.linux.dev, 
	linux-toolchains@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 9, 2021 at 1:21 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Nov 09, 2021 at 12:59:12PM -0800, Bill Wendling wrote:
> >
> > Adding attributes to labels shouldn't be difficult, as you mention. In
> > the case of cold/hot, it's adjusting some of the metadata that already
> > exists on some basic blocks. It might be enough to allow the normal
> > block placement algorithms to move the hot and cold blocks around for
> > us. The question becomes how many attributes does GCC allow on labels?
>
> I'm aware of 3: unused, hot, cold. Also:
>
>   https://gcc.gnu.org/onlinedocs/gcc/Label-Attributes.html

Re: unused:
Being able to selectively disable -Wunused-label via
__attribute__((unused)); seems useful, too.
-- 
Thanks,
~Nick Desaulniers

Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E00515B1
	for <llvm@lists.linux.dev>; Sat,  4 Nov 2023 02:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XbH6Do/P"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso404234466b.1
        for <llvm@lists.linux.dev>; Fri, 03 Nov 2023 19:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1699066356; x=1699671156; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Dpj2y7+UJfhhgZ/IwtypkZiq2pEc9qcg3Om/7IiMFE=;
        b=XbH6Do/PV5PfSUayjj0bqpoBE9QQ6907GCXC8mEqrgbmctaDGxanEZHJT4K5z/93ne
         FG8eE4bUxYitt/CBTxBkO9X622q6PdHaeKZInTlxge132I/WAj/0QMoOwkudhg7MLV+a
         SaxVPzZN5y9ywWlBhT1VW0dpL1cJsaOMLY6ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699066356; x=1699671156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Dpj2y7+UJfhhgZ/IwtypkZiq2pEc9qcg3Om/7IiMFE=;
        b=BtCSfWv3zJj/HOoyD9wS3S7i+PD2TsKrHexpF88ZGoODgc2Gw5cunyVkfKXR+kTwWE
         qNRSeNzAG3vVOW7QQ90As5I4wOX42bVj4IpKagBQvGwJme5RW0wQou4BJommrHHlK+WV
         fTKltg7L1j17OUkhanjMzpSqysGhw0Gteb1pZihpi+62m8dnb8xsCEx73m2q7pSctIDX
         O3IH5ilcHhz08m7E5KNY7zfSYxZuG2sduR2g//FNzzE6+pJszJ8hbJkATWs8hqFUZVp5
         eKUH9LIfYGzdaWQFV1KDFMh1fNqa319wJ3MB4TZUurX0mh2WGM1sGICpxDplsjUrPsuP
         tbLA==
X-Gm-Message-State: AOJu0YxGUiQd3TX7BwmkXSY82wUqVjfuJ6tYUCJhJ0jUVoO44E1ZqQpj
	MEZ+FUjy1B9mI/9MG43yKFNplzB5xEE6ih8TF9E9ttcf
X-Google-Smtp-Source: AGHT+IHyachTWpBryUbMWGmC4APG5Qg44iD3tDMNFpWZOKpB6KuuB24kZ3Rm10mPz7yRZOCAlDVReA==
X-Received: by 2002:a17:907:70c:b0:9bd:d7bd:1a52 with SMTP id xb12-20020a170907070c00b009bdd7bd1a52mr9929398ejb.20.1699066356139;
        Fri, 03 Nov 2023 19:52:36 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906454500b009c7608eb499sm1512323ejq.94.2023.11.03.19.52.35
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 19:52:35 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9d2e7726d5bso405388066b.0
        for <llvm@lists.linux.dev>; Fri, 03 Nov 2023 19:52:35 -0700 (PDT)
X-Received: by 2002:a17:906:ef0e:b0:9c2:a072:78ca with SMTP id
 f14-20020a170906ef0e00b009c2a07278camr9376984ejs.28.1699066355251; Fri, 03
 Nov 2023 19:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmOpXr4=Eoeis0ngU2QPTejWTGmm99bLkFEyBPPW7TD6g@mail.gmail.com>
In-Reply-To: <CAKwvOdmOpXr4=Eoeis0ngU2QPTejWTGmm99bLkFEyBPPW7TD6g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Nov 2023 16:52:18 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgXDTfWFbn-481=it6W_B0KTQsOhdgXL6mweVm6ewtSvA@mail.gmail.com>
Message-ID: <CAHk-=wgXDTfWFbn-481=it6W_B0KTQsOhdgXL6mweVm6ewtSvA@mail.gmail.com>
Subject: Re: minimal soak time in -next leads to breakages in mainline
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Nov 2023 at 12:34, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> What if a large feature hits -next for 1 day then gets merged into
> mainline the next day?  2 days?  3? Where do we draw the line?

Well, the basic rule has always been that it should be a "few next
cycles". We've neve really made it more precise than that, partly
because I'm not sure we have documented what the exact linux-next
cycle is (Stephen takes time off too), but also partly because I don't
really tend to check unless things look suspicious.

IOW, what happens is that I tend to fetch linux-next at the beginning
of the merge window, and then I use that state to

 (a) guesstimate what I have left that I haven't even gotten as pull
requests yet

 (b) when some pull makes me go "that looks strange", I will then
actively check what it was in linux-next

but that (b) tends to require some other trigger (and honestly, tends
to happen mainly for when I start seeing pull requests come in late).

Finally, it's never been 100% anyway. Stephen tends to do the
post-merge-window stats, and they are generally in the "low-to-mid 90%
range".

It's actually higher than that - when Stephen calls out the subsystems
that had most commits that weren't in linux-next, it's often
networking, but I feel like one of the reasons for that is that
networking also tends to not just do the big merge window pull, but
also almost always does a "fixes" pull at around Thursday on the
second week of the merge window.

So I think the real numbers are often 95%+, but then look slightly
worse in Stephen's stats, with some subsystems then having a fixes
pull that often wasn't in linux-next (certainly not in the tree _I_
look at - because I fetch my copy of linux-next early in the merge
window).

But that still leaves the "we have never been 100%, more like 95%".
And honestly, I think that's healthy. Yes, we have rules, and some of
them are stricter than others, but we've never had _truly_
black-and-white rules. There's always the "Oh, I had to rebase because
of good reasons" etc etc.

End result: I think the thing to do is name and shame. If it's a "it
happened once", it is what it is. And if it is a pattern of "this tree
has problematic behavior", then name it publicly, and make me aware of
it.

Because yes, one of the "I need to check linux-next" criteria for me
is "that tree was bad last time around".

            Linus

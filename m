Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0D83225
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 21:21:39 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id u19so11241141lff.4
        for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 14:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0sPK0ChjNw7tXzEe9rotzqgy1YIdVEAmTT9OqaXLkVE=;
        b=axOCTDJF734bIOMqNm9SbSBcIUhzVwGinksnc9wP2smqTP9J1j70Sr3k8TShJmOIy2
         4bVSSPj+MpOnT1++/cnUDrAlzKSREogJ0get6nwX/FHyg2cI4Lsl4/pLkEcNvZgRh1T6
         8CF7jAfypEUqEvLcF46XYjRu23PaG33i5GqXEGLVCUfSbdw6FSL+IEf9F0kgg9O1bc1D
         cXQ4QaA8J1Vfl3IxmIpkcDC1JuMYHl30IAccsc8E0fxPVn7qVENiTUagLOEJznxiOV9H
         sc103ZeWWazvWwKFfZfeLlYIltnp2fISiSaPu57hDR9SCgmYnvSwGoMBOyGF6kRz7F0X
         BjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0sPK0ChjNw7tXzEe9rotzqgy1YIdVEAmTT9OqaXLkVE=;
        b=4v2YaVwqOTepf1roW8AUgYE/jDnFTNPg/+Ul6PzUJSjBpQTQJ0f/xrJSlqy6R2lZRR
         Vc3XMJraOdTzOh7gKWDtL8SztvLGcI4zrCYpRikESkLRZRr0OUKuQKR5QiEZ3fC9G6w8
         vU6Ut6tVjgI0DgkvyzCgdWLu8h1iZNo3oDrSo5+22IGUkMcLYUi4uSyZFXbhiXq3PLHK
         Oo75KDWjHiKInGLEE5izR1KgMEDfLpX2EKCrm0NtTJwJEeKiVmA5wp+0m3engjbQ9haM
         dMK0N3XCewJFgdpdNNqMR8sFgHe4U2iZarzdPJKuicupTaqJe1PLCsvwvK0eNY31BuyG
         Y5wg==
X-Gm-Message-State: AOAM533h+I4pgM3ePRfNCc4AJHau76t5V5EeDrBT+Ekq1T0wDKr2h9Rs
	XleqY7Hk1SI84ZWOgu7RZapXDDb+eIcVglp8xfVK/Q==
X-Google-Smtp-Source: ABdhPJzGCq5I2pdT/WfEaOqf+NEUjGEo2tp5xmUox0iKDOOpzdH8W3rdPksokfYD/0rNSBZ1HO2C4INST3ITCcpac8s=
X-Received: by 2002:a05:6512:3d8f:b0:46d:152b:5952 with SMTP id
 k15-20020a0565123d8f00b0046d152b5952mr2783659lfv.579.1649971297139; Thu, 14
 Apr 2022 14:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yk7/T8BJITwz+Og1@Pauls-MacBook-Pro.local>
In-Reply-To: <Yk7/T8BJITwz+Og1@Pauls-MacBook-Pro.local>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Apr 2022 14:21:25 -0700
Message-ID: <CAKwvOdkEULT_OOeaaCneJjbrE=O3kC8SMDs2thFa9gBfpuo2Jg@mail.gmail.com>
Subject: Re: Dangerous addr to ctrl dependency transformation in fs/nfs/delegation.c::nfs_server_return_marked_delegations()?
To: =?UTF-8?Q?Paul_Heidekr=C3=BCger?= <paul.heidekrueger@in.tum.de>
Cc: Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Marco Elver <elver@google.com>, Charalampos Mainas <charalampos.mainas@gmail.com>, 
	Pramod Bhatotia <pramod.bhatotia@in.tum.de>, "Jose E. Marchesi" <jemarch@gnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 7, 2022 at 8:22 AM Paul Heidekr=C3=BCger
<paul.heidekrueger@in.tum.de> wrote:
>
> Hi all,
>
> work on my dependency checker tool is progressing nicely, and it is
> flagging, what I believe is, a harmful addr to ctrl dependency
> transformation. For context, see [1] and [2]. I'm using the Clang
> compiler.
> [1]: https://linuxplumbersconf.org/event/7/contributions/821/attachments/=
598/1075/LPC_2020_--_Dependency_ordering.pdf
> [2]: https://lore.kernel.org/llvm/YXknxGFjvaB46d%2Fp@Pauls-MacBook-Pro/T/=
#u

Hi Paul,
Thanks for the report and your (and your team's) work on this tool.
Orthogonal to your report, Jose (cc'ed) and I are currently in the
planning process to put together a Kernel+Toolchain microconference
track at Linux Plumbers Conference [0] this year (Sept 12-14) in
Dublin, Ireland.  Would you or someone from your group be able and
interested in presenting more information about your work to an
audience of kernel and toolchain developers at such an event?

Would others be interested in such a topic? (What do they say in
Starship Troopers...?...Would you like to know more?)

[0] https://lpc.events/event/16/
--=20
Thanks,
~Nick Desaulniers

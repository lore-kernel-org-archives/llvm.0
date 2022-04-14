Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9869F3225
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 21:42:25 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id bi26so11322833lfb.2
        for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 14:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=tcBZgcin2Qyz/lpER3nOUcqk5oo+6NLHp21dTPe5XSI=;
        b=qr0NB//CO+T6ov9HWJAjA7QrzZwDVcVTEJCMfcqFTiHPOyq/M9Yiq7SAXiZ7PyrfrI
         iVIqF8xNnQm4BzAXLPX2wEZrAPGS/Yz12lackQllkmoX/eJ2pGARERTH9lc31ZAsk1be
         SsSTw5+s70/B4BoSErVc2CeOVArFf0Js9vxOh3Cd/LKXWiPbdfN4CNTRGEtObJaKuoam
         BFWuU2DzpbVcy5HnuauliH11YNi30vHfmu1uptVLWZ+I1KdDu6i4CPK6NDRUemnWx+Ac
         0xMHrFqdsIyPo8W+31mrroZnED/c2Vm0LSYjKhQYw/9KBbRlJio1SZVunj0v98iF5Bpg
         mvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=tcBZgcin2Qyz/lpER3nOUcqk5oo+6NLHp21dTPe5XSI=;
        b=vxHB1dsaeKdDGGXR6MvufefyTvmpNkJqaNPuuK+ONq/R5/RTM9/vockfJdSV9BYc04
         SO6iREEIfhwl4ZUIzHxfQLnz4oG5Avm0fMX010AIKgq6wu7yW8XTt6MHlahh/F5Ch9iR
         EPOBHyYyUX8ymj6rg+z8Tujld76ir/fMzRB57TXj6hc38X2dmfzGRiQ9Nt42KIDZ5qh3
         qUV664XaGCl7Q9BqawIiY46ppuw2GWM+IIuwRQHI0NLxvdN99El+vkkoggrhyBvKA9Ql
         0yrecUQUpf1jDGOfAAhsg5t/u2XDy04ygBa5/nwQWKigBu7iHtF8ZxGR1X4THwTVeeHG
         0qWw==
X-Gm-Message-State: AOAM531yeADsSTK9X9oQrNmofvxT5ok9tjR/+CxAXBd3O2HnVNP4HBVW
	Ow4qvpknPQwAnrZypx38gxeZ9zhVcFRmjGmKaMXlirduBaOWCA==
X-Google-Smtp-Source: ABdhPJyZTsFVcgmSTJ6yKli834hTErha0MggV+ytWjbk/HkHWABtMkkLdxNE86W8Tsx/mX0eglCRmLLZpuu294lTrdc=
X-Received: by 2002:a19:505d:0:b0:46d:167e:b9df with SMTP id
 z29-20020a19505d000000b0046d167eb9dfmr2612287lfj.184.1649972540744; Thu, 14
 Apr 2022 14:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Apr 2022 14:42:09 -0700
Message-ID: <CAKwvOdnb-DiAnq4bT7XiJpFtqyJYpWNw1shEp8gWYpVmUpRBaA@mail.gmail.com>
Subject: Plumbers conf presentation on -fanalyze?
To: dmalcolm@redhat.com
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, clang-built-linux <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,
Jose and I are currently in the planning process to put together a
Kernel+Toolchain microconference track at Linux Plumbers Conference
this year (Sept 12-14) in Dublin, Ireland.

We had seen
https://developers.redhat.com/articles/2022/04/12/state-static-analysis-gcc-12-compiler#scaling_up_the_analyzer
particularly the section on The Linux kernel and were wondering if
you'd be interested in presenting more information about -fanalyze to
kernel and toolchain developers there?
-- 
Thanks,
~Nick Desaulniers

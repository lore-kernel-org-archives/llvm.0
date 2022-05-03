Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6D57F
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 18:09:02 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id m2-20020a1ca302000000b003943bc63f98so1712975wme.4
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FGUxPrzjI78BA1FDy50uQWcrTLirYMlLkUJ+7H09hDo=;
        b=DOkMy16hOEa5G+NiABpSRJI/5qnS/23Fgla038FCGDOWawxG4ToWbvMhqHO4sQYZem
         hvfVJZJbM+0LGlsFNBWMnrLa2N4B6Ci2s+3UP3iWmb0RrbDGA6glNNed8O2aQV6zhkAg
         VpFy6uUb+BUWS4gm/zinLbPtQEGd4CBX3lUasRwwAHWMuWUxuUr40Gre44slJjotkpz0
         m1dqBP3uY+3gtiWq4xGX6VZunGu040EXRhbhVzgXAeBOCoVgUftlg7kjbjw7dWHaAkEI
         EhtKavYBVAGX15veMloA4EQs+36hyBanxTLWEMqwkHwhB1Nw5mH7egvHhvoJvCJCcb1c
         2TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FGUxPrzjI78BA1FDy50uQWcrTLirYMlLkUJ+7H09hDo=;
        b=aVMeL4TklZbCzTvd8enT9iq01mjwjXdPFPQ25eTI+owsvD1PdHx2l7bQqfSGptatIF
         MINlx7Lz/HL1gORLl4LgrbJyHYJuMJtC7kfZB2L8X9ApG83dP3jU4LPSRAvDVotLTB2c
         qAn9hdgPO7efHBDeNXDvLKrfP+xwbUp0kSvM3puM6ahKtTmswBVvVyHCizKKPdhtuxgS
         kCqvh9IUY+uIB8leoTrjjy3DqHE7Z+TK0cK1O141w6H/KoKiWI0nfPWqn48x/2cr0B0C
         2lJZGZ8LgKU5qQ7GLkMicUY1suAxIYQcmVURNQtDFNyJHzJoPdddtGea2AlBCwspqH4F
         2p5A==
X-Gm-Message-State: AOAM533LGu4QjDDnTuuJ3kaiq+kvkqiYqyRpcMUocerZkP2vj7hfqf1y
	vgi0Dm1dJVAIPGiIAUGrFA68d6mCblM26h56Y08u
X-Google-Smtp-Source: ABdhPJz8V6A4NLi3gByFCmDPUvIX7h8XeCZUuGOAA7TrZf7o8M1QoEBfUcYVZUrLW79Qy+wom7w0dKIuYr2li6iTM6E=
X-Received: by 2002:a1c:f009:0:b0:387:6fea:8ebc with SMTP id
 a9-20020a1cf009000000b003876fea8ebcmr4504416wmb.84.1651601340763; Tue, 03 May
 2022 11:09:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220502141052.34413-1-cgzones@googlemail.com>
In-Reply-To: <20220502141052.34413-1-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 May 2022 14:08:50 -0400
Message-ID: <CAHC9VhQEAcwWvEfV_-4cO6ZRzjGs_7cEpKi3jTXF1HJ_vp16iQ@mail.gmail.com>
Subject: Re: [PATCH] selinux: avoid extra semicolon
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 2, 2022 at 10:10 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> Wrap macro into `do { } while (0)` to avoid Clang emitting warnings
> about extra semicolons.
> Similar to userspace commit
> https://github.com/SELinuxProject/selinux/commit/9d85aa60d12e468e7fd510c2=
b5475b5299b71622
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/avtab.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Merged into selinux/next with some whitespace tweaks.

--=20
paul-moore.com

Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB19AEC3
	for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 23:00:01 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id x21so7654910edd.3
        for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 16:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Pj3DvG1yaHOkAJw48TxvAXH1Fka6b4HnFllXzmcNwmw=;
        b=gzkf8K+iznFC9OOtWwMej/nzlLqmZ0MKBv/EwSRygYlFzaYE0tX304Bv695K4p2emu
         Vry7WzQ7X7QHzQbhWpuhBUZjFOa/TpLQzwwFM9uiuopeowiIuBUohclzsijz/xuVK/QU
         Z01A8WEGSY17fYuv+7E/1BhUBqQcl94xAR6kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Pj3DvG1yaHOkAJw48TxvAXH1Fka6b4HnFllXzmcNwmw=;
        b=RlREFlTMA5TgBxt3oseQX7/kmmNNWZ+6iTmGVH5UgR6HnitZKAMk35V+mVUavhp6Ia
         hkyIBZsfJOBBkB58IM8vLpHKgPsCn4A65wrhmTzk+hdVVJDmfTLIdQ1S+EBrd+KxSPPt
         lRvKC5AIkUJlyFuKRi4PGYNjvmUtx/JTxqciKFPbr4QmXWGWg2rpnlQz5v4lykPpjKuD
         x2A5A0OyPVDj3U4AbJrqfOixaM5BoUjxENTjNpgGv3hsHbF/Igpz7kl/tMAn3b8iJD3f
         ycEMAfmRwGh7KY7JJaIqrok8zhJ3tBexnSHVVNIWrLBoiz8HEc8McUVf88uBG0hVpnBA
         WAyw==
X-Gm-Message-State: ACgBeo1sFfBVFH9RbPOPsbYB98nV341smoOlSXcci8TgNfLDCRSV8K/n
	VkGFlnZKEZk2HJQNHb3Qb3SYCYkNVzZmCxO+
X-Google-Smtp-Source: AA6agR4fiO9DRyGRHc/a1UIWLjFrOiMxtVapsnK/kolTLzXWK7SmqKwle+bRQaodcUMSG9pv3BE7mw==
X-Received: by 2002:a05:6402:4312:b0:43d:b9c0:65ee with SMTP id m18-20020a056402431200b0043db9c065eemr12230515edc.205.1660517999684;
        Sun, 14 Aug 2022 15:59:59 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id i15-20020aa7c9cf000000b0043a78236cd2sm5509826edt.89.2022.08.14.15.59.58
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Aug 2022 15:59:58 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id j7so7258995wrh.3
        for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 15:59:58 -0700 (PDT)
X-Received: by 2002:a5d:56cf:0:b0:21e:ce64:afe7 with SMTP id
 m15-20020a5d56cf000000b0021ece64afe7mr7004000wrw.281.1660517998361; Sun, 14
 Aug 2022 15:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wh1xHi-WeytuAK1-iSsR0wi=6e4-WgFq6ZPt8Z1mvqoNA@mail.gmail.com>
 <20220814225415.n546anzvud6sumux@box.shutemov.name>
In-Reply-To: <20220814225415.n546anzvud6sumux@box.shutemov.name>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 14 Aug 2022 15:59:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiOqbuzy7xzsLrN8LXKGGUUMH109wcKOXx_PV9PkHa=Zw@mail.gmail.com>
Message-ID: <CAHk-=wiOqbuzy7xzsLrN8LXKGGUUMH109wcKOXx_PV9PkHa=Zw@mail.gmail.com>
Subject: Re: Simplify load_unaligned_zeropad() (was Re: [GIT PULL] Ceph
 updates for 5.20-rc1)
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 14, 2022 at 3:51 PM Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> Do we gain enough benefit from the microoptimization to justify existing
> load_unaligned_zeropad()? The helper has rather confusing side-effects.

It's a *big* deal in pathname handling, yes. Doing things a byte at a
time is very noticeably slower.

If TDX has problems with it, then TDX needs to be fixed. And it's
simple enough - just make sure you have a guard page between any
kernel RAM mapping and whatever odd crazy page.

There is nothing subtle about this at all. You probably would want
that guard page *anyway*.

That "uaccepted memory" type needs to be just clearly fixed.

                Linus

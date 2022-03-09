Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F6C7B
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 00:09:31 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id bu29so964189lfb.0
        for <llvm@lists.linux.dev>; Tue, 08 Mar 2022 16:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tYmupwL1NthFsF42+Fr0z4aIrhKGW9iSWfQCfyDDaEk=;
        b=T9Y8CKYiSW3hGc9HM0/MT5sFo5blD99UIhMWcRbFD5kggM3DUwxybXuISqMFUGIjrg
         mWQ74CDHtfn9kXLqt5VqIvjs1zPAj3pO65tEdbgr+OX1FrAEaiMiYghKLtQSRfh7w9WS
         TgKR2SZWDkmK6Hkv45V1e1kyBDZQ0M8AOrIp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tYmupwL1NthFsF42+Fr0z4aIrhKGW9iSWfQCfyDDaEk=;
        b=AhKoW6xlf5bv45hLXoPM0Lp+3+LdsS7tV3vP1iUTG6MNWs9lfR66ACKcK4iDoGRiyZ
         h3wRImIoXEjfWcAb9Ds7R+dQm3YuU/rAwoK6E7hgSjRj9B5/qbugl8CcmApPH06Q1Uwf
         2UArpBtZZguOMNt+6eL54bXfx75MfN5zHolLIFIZIAO/OkZNSB8BH4s4XY5/rE/9wQhK
         b9OGvxgrBkGpHoE9PoFcV5R0Z68Rnd4KBT7pnQdywCq4O8S8aRLhD/QyX2g+Q50A772b
         I/Q+EVKnD4cnGm/oTy2pUpaR5Cke2llw1Qz9h8NrmDMs6jXCJo9rHaZ9RrgzzbRA+uZo
         IPdg==
X-Gm-Message-State: AOAM530KVyjPqdnUeyK0bemYnqyDrvrpdTW1+DpB50GinZGQTT0RQQM3
	GEPxy2vab+DMcAziqU2xu+bCysLofyvs+k2+zrM=
X-Google-Smtp-Source: ABdhPJy4KH501vtGRi59Lg2gZhqjOzgEo3knanJBhoPeAT0I8p77JmMGE83Z6fCW7DaNPls/aZnUoA==
X-Received: by 2002:ac2:44ae:0:b0:445:bf4b:303b with SMTP id c14-20020ac244ae000000b00445bf4b303bmr12719271lfm.253.1646784569869;
        Tue, 08 Mar 2022 16:09:29 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id r6-20020a19ac46000000b00442f6964cc1sm61389lfc.230.2022.03.08.16.09.27
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 16:09:28 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id v28so828577ljv.9
        for <llvm@lists.linux.dev>; Tue, 08 Mar 2022 16:09:27 -0800 (PST)
X-Received: by 2002:a2e:9b10:0:b0:247:f28c:ffd3 with SMTP id
 u16-20020a2e9b10000000b00247f28cffd3mr3400178lji.152.1646784567653; Tue, 08
 Mar 2022 16:09:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220308215615.14183-1-arnd@kernel.org>
In-Reply-To: <20220308215615.14183-1-arnd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Mar 2022 16:09:11 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjsCrVxToP0Zx+cUAVZmSKi=Y6NP1+VnBcoPyPPEBfonQ@mail.gmail.com>
Message-ID: <CAHk-=wjsCrVxToP0Zx+cUAVZmSKi=Y6NP1+VnBcoPyPPEBfonQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] [v4] Kbuild: std=gnu11 changes
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>, Marco Elver <elver@google.com>, 
	Jani Nikula <jani.nikula@intel.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 8, 2022 at 1:56 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> I've incorporated the feedback from Masahiro Yamada in this
> version, splitting out one more patch, rebasing on top of
> the kbuild tree, and changing the order of the patches.
>
> Please apply to the kbuild tree.

I'd actually like to see this as a separate branch, so that I can
merge it early - or other peoples git branches end up depending on it.

Yeah, it shouldn't change anything on its own, but since it allows for
new syntax, we might have other things depending on it (I'm obviously
thinking of the list_for_each_entry() series that keeps getting
posted).

                      Linus

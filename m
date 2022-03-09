Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA58647D
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 22:31:46 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id w7so6308110lfd.6
        for <llvm@lists.linux.dev>; Wed, 09 Mar 2022 14:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4je0unW4G5dhYAERbboQeaK3T2YDLbSq75BkxjOTCkc=;
        b=NvqzVrCnOoQt5ccdqtnDcaRXHev3N/fZfvAWcFnh1bTbxVAVYlSK/1PikemA2qT9jk
         m8Zz4PK09MV1rCbVfKku3JDVdun0GJbIht1p427qlROuJMB+VRHB8+bcQqya5vF8+bkV
         tFe/oiRBcvfRKEG/xcFzgb/UE23TJ5UDD+ovM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4je0unW4G5dhYAERbboQeaK3T2YDLbSq75BkxjOTCkc=;
        b=kznZtsQ7bO1fK12fsdP4No/5mROctxXa4lFcz2T74hTaONuDJ3vjNenqe7pui2tyxs
         Divp1dSzOFtCYQP+Re0EiiaER57hyEWNeMFlqCHDmyR/BTJhRPKbRP5hFbTaM/8MHnBo
         G5EFCX+1OW0QMVBUAaEDqvSJDKRNq7+UXlmQRFNuDb7bPPnUJAQqnC7h5yxhzju86BRz
         toPxm16hNnwkOXUKjyxO8MCLLcDWHBu46eR2LvD+cCF2TVcLvSPuh73wIcUZw0feJDnP
         j06gTbca3rbcFXt8ws7XZKucxvctA+RWrO3iYSWp6tmUdlVWGcDCzJPu4yCItx4kwgRs
         ufyg==
X-Gm-Message-State: AOAM530yDL/GirpB6LkTNFxs5GwEglhgrtWSsZ9RhR1tIwjpQQlYJP67
	eGjsqPp13nzGj0u1nFfbLRwXaszO+Y+HE4PxCmY=
X-Google-Smtp-Source: ABdhPJyl/doGe8gaxK2HelMjEmMaHuv+j6l3+/orJBedR0lVJq2wx12j1PVS+MVqvpwx04U3JfMuxA==
X-Received: by 2002:ac2:5628:0:b0:448:54e2:284e with SMTP id b8-20020ac25628000000b0044854e2284emr1077341lff.560.1646865103588;
        Wed, 09 Mar 2022 14:31:43 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id m14-20020a19520e000000b004483213f607sm617046lfb.103.2022.03.09.14.31.41
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 14:31:41 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id l20so6243195lfg.12
        for <llvm@lists.linux.dev>; Wed, 09 Mar 2022 14:31:41 -0800 (PST)
X-Received: by 2002:a05:6512:3049:b0:447:d55d:4798 with SMTP id
 b9-20020a056512304900b00447d55d4798mr1100238lfb.531.1646865100980; Wed, 09
 Mar 2022 14:31:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220309220726.1525113-1-nathan@kernel.org> <CAHk-=wi23APrArHX7bcrvKBDZYpHXbeyEW7dRsirwoSPCKgqJg@mail.gmail.com>
 <YikqFxHP+Y+lecbX@kroah.com>
In-Reply-To: <YikqFxHP+Y+lecbX@kroah.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Mar 2022 14:31:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=whAL3L9gTPp5y7-dweM1xrOA+7aCtG9BvbeQk6Gaz-1UA@mail.gmail.com>
Message-ID: <CAHk-=whAL3L9gTPp5y7-dweM1xrOA+7aCtG9BvbeQk6Gaz-1UA@mail.gmail.com>
Subject: Re: [PATCH] ARM: Do not use NOCROSSREFS directive with ld.lld
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Nick Desaulniers <ndesaulniers@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 9, 2022 at 2:28 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> What about this one too:
>         https://lore.kernel.org/r/20220309191633.2307110-1-nathan@kernel.org
>
> it should fix a arm64 build with clang.

Heh. That one just came as a pull from Catalin. It's now commit 52c9f93a9c48..

            Linus

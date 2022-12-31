Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1A92903
	for <llvm@lists.linux.dev>; Sat, 31 Dec 2022 15:25:44 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-45f4aef92daso334603087b3.0
        for <llvm@lists.linux.dev>; Sat, 31 Dec 2022 07:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vTIkUhi2i57VDmwoitY7JCvY+QmJnIfSHOGksYjEkbA=;
        b=Wxutio96iEpSuzsprYxs6IHmn0oqq5J1twDr1+aDhNeWMa8G1wNSSFKAZ+NfqhV4xD
         49C2ygL/+2VW1SxaGbsz+qISSaSeeqK3I/h6Xmf2DpuzKNFnM+xUdJxr607Kv5Y2pGvd
         5FXZkH1X/33EAm5k/R0b5F9MrTpYwBjUL/1QgSGuM7QOyMkKiRoqBtEWYnGackGNkhcp
         UOUX/kgmSoVgRhl0XWE2KfsBnAyGaMEdjMy1ZfJJU+X46TPE0zH5WVEXvHN5H7Z1CzOQ
         t2kj9AXh9kyFroKHFPzA8N6hrWswDQbf0QIRPUl/U0clUCXJkPHbSPE+8iaDX4sgXYOc
         zn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTIkUhi2i57VDmwoitY7JCvY+QmJnIfSHOGksYjEkbA=;
        b=w/+WT7kh0NmhebZR57JGLx2OKvNN9hUB3/A0Gfoe94xSzvU5mwi5Bmfj6NgioDpA3w
         sCgmspm/wVTIPZFwXoEERpS9SGys9vTDYEmX5ThkbJrgbkKdbH0EyQkUWElFqmK4rwDf
         jXHgng8byAkWx8zDHoC+ZB/fdwMDv6NKBLEzFIaaiWmBV8nsYqUdpIyj/V6KGjfTTsfe
         oav0BxzuAy6qFXd9Vaw8Ph1DUroKIpcxy3jZNUGBuDBIeoIyZIYx1Bz5/Q46vI1KA3uG
         HIGsNhrNF9pWX31MzJEHU9Y98sfay9sK+SHjANKyt9eFyXUAm3rCRFrDdGWNzECSYkG3
         80ag==
X-Gm-Message-State: AFqh2krDFv8Ww1FgXPa3V8TP0EEJ2dveUGkbT4Lm37jw0O/J1vcA/rpc
	6HyY3CLTuadx1Q1l3SEQE0igDmKG2HeSehugl5k=
X-Google-Smtp-Source: AMrXdXuz6tWQhdwH3LFnVRkp0Z4hMEe45w1XsqKtayO3NmjA7lcsPsIu3ThMzTEuO3L1zUpDAC/cJ9LCOISwbELZGjw=
X-Received: by 2002:a81:7343:0:b0:484:a94f:210 with SMTP id
 o64-20020a817343000000b00484a94f0210mr1918307ywc.129.1672500343240; Sat, 31
 Dec 2022 07:25:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221231064203.1623793-1-masahiroy@kernel.org> <20221231064203.1623793-3-masahiroy@kernel.org>
In-Reply-To: <20221231064203.1623793-3-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 Dec 2022 16:25:32 +0100
Message-ID: <CANiq72mbazF7b3sbH=9F=cHbTB_np=os+YzUPCzh=4HgEHsEKg@mail.gmail.com>
Subject: Re: [PATCH 2/6] fixdep: parse Makefile more correctly to handle
 comments etc.
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 31, 2022 at 7:42 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> My main motivation is to drop comments. rustc may output comments
> (e.g. env-dep). Currentyly, rustc build rules invoke sed to remove
> comments, but it is more efficient to do it in fixdep.

Hmm... I couldn't apply this one, it turns out `#include <stdarg.h>`
is gone. Adding it and adjusting the patch fixes it.

Cheers,
Miguel

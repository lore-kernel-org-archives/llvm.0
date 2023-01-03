Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B992F33
	for <llvm@lists.linux.dev>; Tue,  3 Jan 2023 20:45:26 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-46198b81e5eso452658167b3.4
        for <llvm@lists.linux.dev>; Tue, 03 Jan 2023 12:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+3JBM1k56yKl55H/sSVuzObxHoNMCyKwCe4lUAVYz8w=;
        b=JIjRdZPV6+BSjR1ei14D7j5zk9/1vwJwzYbL+Q4/0tWfxOdhiaZT1sAaw20OZlQpTY
         qg044Z3y0LBmEJIod7ReIE1pX3P4KLWCk2gTLO9XXepI04IRWRJsYl75xPw61SlOwWWC
         X+QYXE+q4vYXBnnHl0XNSqeMl9J5PXyvqmHtTHNvB+igy7UmU+GHaL3jmFiI5DG3CYnh
         uLpwMUwqxaE9VkWlIw7fAqATVkPKb8AIM14OUuNQKgWloPrY/j7POOp5IT0OEI/8y7df
         jfGEUSzNTPk+LjMSSoDIj5XcZ+U8Up6+oEViIX2T8Lym9Io+tbuF80c9iSUI/tSf/CeT
         zitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3JBM1k56yKl55H/sSVuzObxHoNMCyKwCe4lUAVYz8w=;
        b=rYSSKvhfFwfhZZlPCIXjIhdZphZHRZpis2W1jXB3eyKLnCosSB/cdodncniGyq3x5G
         KZonckYjPgqWf0hiDiOqptE7hTQrOKzjjepOBIySlzQEMYZFraKayr8DM5j9OOngtThy
         9v2G++nvaGERt/I7AXvaCnTdNetbZQC3SL1xfvJUBcquxPEDHs/PvwwNer72B0L82YzA
         lHphjNc1iLY4SnC9CQg6p+dcEdx5nHx18OyW2xJhPMpZrdsX/pZhs+l5V3OsFYPIvSDu
         MSaL6xOUrjwUc4ki5uA6IwrTIOSRpbnX0AH59pDcQLbcGkQ7GrU0kCZXS4qRs9ZcGSbg
         sZjw==
X-Gm-Message-State: AFqh2krL0docX26htF2N2cRM2fX+3X+03VSMoLEqfwuJGVHiooBtnzzI
	Z0vW4z4jEk+Db43/+d4Fd3y5KbbnKiy/sidW+90=
X-Google-Smtp-Source: AMrXdXuDfedFAD34vQELEPd/hr3pWJDR0G43tXNA7Ak90t3yosTF3jzXmM7MeqbHYm0/FgdrZaHJ6/MYjKLTEMSjTQM=
X-Received: by 2002:a81:94d:0:b0:3bc:7270:cb70 with SMTP id
 74-20020a81094d000000b003bc7270cb70mr5510503ywj.83.1672778725262; Tue, 03 Jan
 2023 12:45:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221231064203.1623793-1-masahiroy@kernel.org> <20221231064203.1623793-3-masahiroy@kernel.org>
In-Reply-To: <20221231064203.1623793-3-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Jan 2023 21:45:14 +0100
Message-ID: <CANiq72mxvxE+6p44157v4hFgyTugO_0+J4nuZteajM4wLVbCtQ@mail.gmail.com>
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
> This commit improves the parser a little more for better processing
> comments, escape sequences, etc.

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F8B7E
	for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 13:43:01 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d7so6715525plr.9
        for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=74P+O8sp5lm0Sg+UxTgNRhPNuNgtyuLNzL/6fehWii8=;
        b=cb9KopSME0jgsnIYppaXVDtaldungGRFtZ0C312W7DD3noIbLzEoG5Fa1ocTgHkXaj
         ev47B/UYsERE/Nc1T9UxI0BCfZF97//epatiKgkIcx1JIbfjVBZiukq+M1248pWh4uMb
         91voPmAk7fdFlzbNf/jdDYC4Z69TiYBjd1/Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=74P+O8sp5lm0Sg+UxTgNRhPNuNgtyuLNzL/6fehWii8=;
        b=JFtmVldefDD5cuS9TnTeQoCVcOcJ41Uuy8eqhunrgPH6ZdL1VHP4BHmpNvMf45x/NI
         COTew3KyoybEOl5+AXtkE9XosrCh5+n+OmXOaKNYgAxaOctY5wlsOGzBAbIzei879LF2
         XyYtWnCe8zwl6VuvWDI8B6ey/p2H/H/w2Dj44SuOELFoeMk3MvcIgBCZKCRuoVzxocUH
         qlawAUdBNwk8h8zuypXilXm7AoE53CGFi8i7Asw9LWD9YA4T2FeVYE/DuMDjhbB1CzRM
         f2M4oSwuhUXhxxHkaPUxSwrUwqFjyp1JQBV61N1nR+M9JpuRZ/9LYqWSmGe2OiF2KEeC
         Z2uA==
X-Gm-Message-State: AJIora8gQBD5wjb+Rw7+hqqJg3eqIx6sJ9PfQX4jIsdNjCN0xhmnVW+y
	fi9B18aeUOMdJMVEGZ3lER3oQw==
X-Google-Smtp-Source: AGRyM1sByCtQL20f2n6BkvzsUI/95ohfg27wPbdftUGAk9oS174EzDS/7gH9vcSzem0b0LufuyeMPw==
X-Received: by 2002:a17:90b:1c8e:b0:1f1:b5a8:330f with SMTP id oo14-20020a17090b1c8e00b001f1b5a8330fmr22633471pjb.179.1658583780802;
        Sat, 23 Jul 2022 06:43:00 -0700 (PDT)
Received: from [127.0.0.1] (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y17-20020a63ce11000000b00419acadde52sm5161337pgf.46.2022.07.23.06.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 06:43:00 -0700 (PDT)
Date: Sat, 23 Jul 2022 06:42:57 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>, ndesaulniers@google.com
CC: arnd@arndb.de, gregkh@linuxfoundation.org, justinstitt@google.com,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org,
 trix@redhat.com
Subject: Re: [PATCH v2] drivers: lkdtm: fix clang -Wformat warning
User-Agent: K-9 Mail for Android
In-Reply-To: <20220721215706.4153027-1-justinstitt@google.com>
References: <CAKwvOd=wn=tbX7ixs9a=4zoVSbAU1qP-6NE04hGG9dzvo0zFJw@mail.gmail.com> <20220721215706.4153027-1-justinstitt@google.com>
Message-ID: <9306DFB1-1873-481F-898D-CE141D0C32A5@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On July 21, 2022 2:57:06 PM PDT, Justin Stitt <justinstitt@google=2Ecom> w=
rote:
>When building with Clang we encounter the following warning
>(ARCH=3Dhexagon + CONFIG_FRAME_WARN=3D0):
>| =2E=2E/drivers/misc/lkdtm/bugs=2Ec:107:3: error: format specifies type
>| 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
>|                 REC_STACK_SIZE, recur_count);
>|                 ^~~~~~~~~~~~~~
>
>Cast REC_STACK_SIZE to `unsigned long` to match format specifier `%lu`
>as well as maintain symmetry with `#define REC_STACK_SIZE
>(_AC(CONFIG_FRAME_WARN, UL) / 2)`=2E
>
>Link: https://github=2Ecom/ClangBuiltLinux/linux/issues/378
>Reported-by: Nathan Chancellor <nathan@kernel=2Eorg>
>Suggested-by: Nathan Chancellor <nathan@kernel=2Eorg>
>Suggested-by: Nick Desaulniers <ndesaulniers@google=2Ecom>
>Signed-off-by: Justin Stitt <justinstitt@google=2Ecom>

Thanks!

Acked-by: Kees Cook <keescook@chromium=2Eorg>
Fixes: 24cccab42c419 ("lkdtm/bugs: Adjust recursion test to avoid elision"=
)


--=20
Kees Cook

Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EAD7B
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 16:59:40 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id f14so13257322ioz.1
        for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 08:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kUhUIIyA9GUDM8KAXwt3EGlZrHMsIuoyJtppWvJlpD8=;
        b=CDa4MR96luDCq3/3+R1N8T0Pu1JW9iXOgvzqQpbn2Z14ilhGhdOncz7u8Dpe8sej6G
         9ri5Lc4CH1xQfBxDfaLGxR/knU8dI9COjumA2Ekkt4tJbfqAfDLX0R10dy1xTOAV129/
         x8WLL8ezTrhtbU7BPvTNOrR2fZOkPTvjZeyq3bF+x98VRTqC6B+i0zvS0VOKjbSeQspM
         UODPTZRrLHrVKjOwc7Evd3ajetOcKlAjfijWUq8bfAYEatcZLVZ5ReZAWQ6uxkwFfOPI
         2OfMKZS4h8nc/clDlpskPws0oHuNAbsIfBX/SK2ZQFFBPao8PU3yBmy2TTnzj2l1iSoy
         y48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kUhUIIyA9GUDM8KAXwt3EGlZrHMsIuoyJtppWvJlpD8=;
        b=7DkbyTw26nBBer1YkPO8ROEn6iN5CrV3KcTnEdwSwc11OQhLrNaS65JP4FjHPCr+lF
         ZaflvMkO5baSAuVGsLmhnAovz5OsVGyAtJXAaDttne2dNXoskztEi3U4683cWwy3v5TW
         X1y39RrXfTRmXnaxDm65UkLi2Z6pAf6uFOV4AUsd1h85D9HCEv3s0gTyTxTQQ0TZ3Qd1
         ADKmw/GUWkkIH5viXa6J2hG2j1ykEPpjaAP/qB3QlBOLRf5gHmFXUxT1la5cPTSxHXwn
         w8+/T8PlelDZGaR+6F4ORY713StfSxvCerjCQviVW1j67K96Sp6wZ9spgvCKaSg6m2x5
         aWbQ==
X-Gm-Message-State: AOAM532aSVTqzZ/FU0u/OaZ007v82Ya54ChwYGUa+JretFV9SyNbplXU
	9pmEeAceZLPu042rDJ45AZccKNIT9BTRXGbJJ6Y=
X-Google-Smtp-Source: ABdhPJyOix0MphY4qHD8XfOuBGs0S/4oSg4gAzztyQmn/MgeYmRbPXRpPA0Lye6W0eH522Agyz1bmc6W3MZDm7HoPEw=
X-Received: by 2002:a05:6638:204d:b0:314:a290:48c with SMTP id
 t13-20020a056638204d00b00314a290048cmr18055215jaj.264.1645549179943; Tue, 22
 Feb 2022 08:59:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220222095736.24898-1-ashimida@linux.alibaba.com>
 <YhUMRoLDan7tJRiL@dev-arch.archlinux-ax161> <f44612ce-5bb1-da45-d6cb-39464898c4ff@roeck-us.net>
In-Reply-To: <f44612ce-5bb1-da45-d6cb-39464898c4ff@roeck-us.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 22 Feb 2022 17:59:29 +0100
Message-ID: <CANiq72nhu+CtYYNfWLYxf19OscoEEZj=TATM0SHNU8ic1iDhyQ@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] AARCH64: Add gcc Shadow Call Stack support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Dan Li <ashimida@linux.alibaba.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Marco Elver <elver@google.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 22, 2022 at 5:48 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> The point here, I think, is to list the minimum gcc version.
> It is going to be a long time until gcc 12.0 is the minimum version,
> so I think it makes sense to list the minimum version number for
> each compiler here.

Yeah, please list the minimum version (ideally `>=` instead of `>`,
with the actual version where it first appeared). It makes it easy to
then remove things that are not needed anymore when the minimum GCC
version is upgraded.

Cheers,
Miguel

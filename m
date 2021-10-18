Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D054929CA
	for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 18:34:46 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id x27so1733332lfu.5
        for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 11:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3yIhmbyQ2Bjkk7ltMaflrF9iqPQ0fQAIQa9ANGo7kQY=;
        b=mDxHYkIrPyFlZcLd5Lmf1h58osaKBBKImi0vwaR9AA+Z6wjTxmrsnvuHuvVSnRqO5O
         tcs5Wjp2GKH1xK6CecmcUeqjV0xPYjjQPc/2K35jolYlUmWxJxpq6MBFkoC2E/Amf6FN
         YVJERs/vNIyNQ4HZAyDsgejKJWne6YVrLoISBqmJ3HjwHmGU0h6mgx7WDmU+yFmLPIj6
         w0QCSEKlDkaSFaMpyV8+KXG/bcRYC/oLFFZxRrMXl2UAIVUeLBbgFXVxoziea9wdTfKN
         Ok659w6Q+wE/o34cHM90CHcGMjN/VA2l+VOBT73rCrXANUNGs8fOrqxrzdK0tLNRjeoU
         lcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3yIhmbyQ2Bjkk7ltMaflrF9iqPQ0fQAIQa9ANGo7kQY=;
        b=at19DDwSf7dhMPRaNduUzAff2xn+1FUZ0h31WHqjT6umDQU5pTfpB85adJeT1Mo/uh
         Fr1pY9NrNVbEUG0AWNzTHuyzxELyTzN6T1vi2cjMploZZ35q4fR05Au9TLyGaPjR3Smn
         pFYFhjbozfAv+sfgpR2QxHDZPoG0O2jSqDglxYJ5fZwQEq9xATHOX2SOzAah+bIiH1eA
         7TRKAmsmaDwY4ZVXV6o/NqendcdEPg1rd52dWt8++tNPza3PD4B+mwutRLevDy6Dbqp+
         mAH2I0fSxl/EE67+At8T6+r9ZNlspCAL2QVrOOFzvnOcMBwyAhgXZv/kuYH/Iz48KFsI
         /tpg==
X-Gm-Message-State: AOAM530HGiFhKtfJsPbeC7p0UCjY+zEwpxtqIai4Md4RKAbIWTGR0dub
	scaDBRBu7l3pQ38bYYvJbdmmhG9f7zgtF08Rqdw+CA==
X-Google-Smtp-Source: ABdhPJxhiujb58an/syD4wS+0Veklak5dKdvkCcFTUL6Moc+I4DMxvUUPWzB27PibGVVK8AIsW60KddeGG8GuSGi05s=
X-Received: by 2002:a05:6512:b0a:: with SMTP id w10mr1323928lfu.240.1634582084713;
 Mon, 18 Oct 2021 11:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211018182537.2316800-1-nathan@kernel.org>
In-Reply-To: <20211018182537.2316800-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 Oct 2021 11:34:33 -0700
Message-ID: <CAKwvOdn4_DrgaZoAo-v7CbYurNUpfAK5tnzT023=WCDzkmYQVg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
To: Nathan Chancellor <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Hans de Goede <hdegoede@redhat.com>, 
	Mark Gross <markgross@kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Tor Vic <torvic9@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 11:26 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> A new warning in clang points out a use of bitwise OR with boolean
> expressions in this driver:
>
> drivers/platform/x86/thinkpad_acpi.c:9061:11: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
>         else if ((strlencmp(cmd, "level disengaged") == 0) |
>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                            ||
> drivers/platform/x86/thinkpad_acpi.c:9061:11: note: cast one or both operands to int to silence this warning
> 1 error generated.
>
> This should clearly be a logical OR so change it to fix the warning.
>
> Fixes: fe98a52ce754 ("ACPI: thinkpad-acpi: add sysfs support to fan subdriver")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1476
> Reported-by: Tor Vic <torvic9@mailbox.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

LGTM, thanks for the patch! I guess this would be the first
"interesting" case this warning has found in kernel sources?
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 07b9710d500e..7442c3bb446a 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9058,7 +9058,7 @@ static int fan_write_cmd_level(const char *cmd, int *rc)
>
>         if (strlencmp(cmd, "level auto") == 0)
>                 level = TP_EC_FAN_AUTO;
> -       else if ((strlencmp(cmd, "level disengaged") == 0) |
> +       else if ((strlencmp(cmd, "level disengaged") == 0) ||
>                         (strlencmp(cmd, "level full-speed") == 0))
>                 level = TP_EC_FAN_FULLSPEED;
>         else if (sscanf(cmd, "level %d", &level) != 1)
>
> base-commit: 85303db36b6e170917a7bc6aae4898c31a5272a0
> --
> 2.33.1.637.gf443b226ca
>


-- 
Thanks,
~Nick Desaulniers

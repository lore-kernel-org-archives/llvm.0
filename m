Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5ED15BD
	for <llvm@lists.linux.dev>; Fri, 26 May 2023 17:47:15 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-bad1ae90c2eso1093910276.2
        for <llvm@lists.linux.dev>; Fri, 26 May 2023 10:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685123234; x=1687715234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CgerKgLDb+oz0xSGVFgair4y7BOc3TVieOSwAdfKBY=;
        b=jzReXWnsrfCVm/qRO2GA0IRNZFsfmNELIqi6GYheR6lx3tlEdWHPfk8rmaPzVoDauF
         6gAndj9bJiGl6Mziv5QWOqfJghfXRHGzxqfepSG2vaL5L5UXRmos/wwf2VU5mpiUfmzq
         ysOU+bRjvnxfYcT1EgyNIQIme/exlG++FdbpJ7U+BkDnbPQmCo6PG3XSm+KichSQx4B1
         YT0SImUYx9XJws5H8j6YK3WsNRMN58YZK3XYChGgR7j/AzYpLFMbYh3JAA846iLtH9kc
         LFCrRE0J7HSbAQCfS4TbhmPDZnPfmJzn5RewGV/2WqVxzhAZclyON5u2TcfiZttRkq2/
         tgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685123234; x=1687715234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CgerKgLDb+oz0xSGVFgair4y7BOc3TVieOSwAdfKBY=;
        b=c9WLI1e/xjff+yMaylJ4yDSiH+OXrq34BqT+iqruhsHEj3lHveN51zm8ELrFapv1zY
         OHZGpqE2caOQKE0mvQ4ClEJ1C9SeOl7eq1vNN0jLHXrh81FUVTGBtP1lplPUmH/Etwz7
         nqrO52VFpyCPsKBFzN2f64c/Ya9vIUcXsELLOygEHXFRXPEDzx+qwFhjAAYGGW1CKwek
         i8uFpD+5hD65yvVvBGWlVJnuE5+LcWyIg2nzE9C4LZd8idHXEDs/zdoguADyUVJeKVha
         KgXiJtKfXoykmevWRnocF0tpZBMP+3fddk1k2HCFRT4E1NtJ5bym7pWR1yWJ0V8xPjj0
         B1SQ==
X-Gm-Message-State: AC+VfDzsPF6aCfb9bdlDz3IdPab06E/0Z5L82Seyu+lyoNSJNzMPhxHk
	cYn0BO6/mBm+PHOyrxKjCCpXraXzfOeFiMGn2Ss=
X-Google-Smtp-Source: ACHHUZ4zZdQ1OyE283XyEGqpTqmrswifJPDYZ7nrTVJ9mPxQUh0rJPLTrj29G3HM3uhWCePyDZnMZuCQnfenstG2dk8=
X-Received: by 2002:a0d:e805:0:b0:555:d983:f4f0 with SMTP id
 r5-20020a0de805000000b00555d983f4f0mr2753497ywe.24.1685123234701; Fri, 26 May
 2023 10:47:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230517190841.gonna.796-kees@kernel.org> <168512138720.187005.8346289423859319616.b4-ty@chromium.org>
In-Reply-To: <168512138720.187005.8346289423859319616.b4-ty@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 May 2023 19:47:03 +0200
Message-ID: <CANiq72=38mdTnJ3cicgwPB2xWqtbnGsL8Rtr4pwq7xGRr-m=Wg@mail.gmail.com>
Subject: Re: [PATCH v2] Compiler Attributes: Add __counted_by macro
To: Kees Cook <keescook@chromium.org>
Cc: ojeda@kernel.org, qing.zhao@oracle.com, morbo@google.com, 
	llvm@lists.linux.dev, trix@redhat.com, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	ndesaulniers@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 7:16=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> FYI, applied to for-next/hardening:
>
> [1/1] Compiler Attributes: Add __counted_by macro
>       https://git.kernel.org/kees/c/86a76e91cbab

Sorry, I was going to apply it soon -- in case you want it:

    Acked-by: Miguel Ojeda <ojeda@kernel.org>

And thanks Nathan for resubmitting the `Reviewed-by` from v1!

Cheers,
Miguel

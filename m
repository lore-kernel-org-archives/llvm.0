Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734242C89
	for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 20:14:18 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id r19so2245868lfe.10
        for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 13:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tt24hSGflNdpheMRwlJmY7tz8SqrWMFdjzVrWWc99WA=;
        b=ThzaXo9WMP/Hx60CctXyI47vb2LH1UDfrYY8Ar9oaSYyIGAmOezaOvDQ/jGlcx8JQ4
         0brV7of05Lpixk+xH/TLFCWzQwK7jriqQMDLPnN5ss46nsAcOoEsTOur5rdnomWefoPe
         az7yIStcQN012YMWrb/4FUJ49saLFmUDhyvpWcWH6Rx/LzGqfPuBlth8b7OvQYhS+Ysm
         Bz9I+BJUt6goyo6D8gV6hg0vC06pn2nCP16akhI5YQ8Sa9RbvGYGi3pKJdr025cIHpbc
         pNxNRW+eTROo3kwt8ERY1h33eLQTL70ZZI+mcC4i+IT3rm63x9tVUisYuK7cgoANHt6k
         CvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tt24hSGflNdpheMRwlJmY7tz8SqrWMFdjzVrWWc99WA=;
        b=u81Ly04brfvcMa4aBgXl0BWA03vAjjl1i6G5jM0e5GsYZ5hszG31EEfldmq5x8uQk9
         bbktlr+KPuyn9VFDpLtT76Hf09n6gSmNoqdA8gvJDHOyWvXyq68aHMUrzdoIFTYwjwnU
         /H+PORE5YeRkSP6XdzavdXT0XyaFZtT+FFHDty8iFuLFsMOMdk3LOfJvXsYHSgBTgPtM
         uHL1RLW2JMk2T/h/L1Jl/P8ZDF/JAWac1mvbxRT58iVcb8WhqsKxZTAK3BujahMCOopW
         UPdx/o8gBdAWoqjVH7WRNKgwl/BsFWhxpWdLMZoiSYkxgXHmj0h5/pLt2K3drTfvmFFw
         +FfQ==
X-Gm-Message-State: AOAM532RSW30RxVkP6Tl4TO5k7x4S3JHCP5o4o9i8Pv37LYeAOnl3YXu
	1aIQ4gp2m3rNN/1mUGKTSnh22/UHmysKCGySQh0nkw==
X-Google-Smtp-Source: ABdhPJzslvUpnH9sQ/IhkDtp4mGVU7/17DQKkqHCoDvDX9vcL6++QrFeuzEfX+XJ9kFW9AXMdoVU1XuaqjmEeVcZDrk=
X-Received: by 2002:a05:6512:3ba3:: with SMTP id g35mr1762408lfv.651.1634588056448;
 Mon, 18 Oct 2021 13:14:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211018182537.2316800-1-nathan@kernel.org> <CAKwvOdn4_DrgaZoAo-v7CbYurNUpfAK5tnzT023=WCDzkmYQVg@mail.gmail.com>
 <CAHk-=wi7hUsTTcmPfZCkUEw51Y3ayq3JJxzFsNgodsxxDyk9Ww@mail.gmail.com>
In-Reply-To: <CAHk-=wi7hUsTTcmPfZCkUEw51Y3ayq3JJxzFsNgodsxxDyk9Ww@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 Oct 2021 13:14:05 -0700
Message-ID: <CAKwvOd=wGjd_L1703Y9Kngcr9-_wTvcRLToiydXYkR=S_9xWDw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Tor Vic <torvic9@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 12:41 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Oct 18, 2021 at 8:34 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > LGTM, thanks for the patch! I guess this would be the first
> > "interesting" case this warning has found in kernel sources?
>
> The patch looks obviously correct (tm), but I'm not convinced that the
> warning is actually all that interesting.
>
> The thing is, using bitwise operators for booleans is _exactly_ the
> same as using logical ones as long as there are no side effects.

Right, the patch that added the warning explicitly checks for side effects.
https://reviews.llvm.org/D108003
https://lore.kernel.org/lkml/20211018193101.2340261-1-nathan@kernel.org/
is another example that I would point to in favor of the error.
-- 
Thanks,
~Nick Desaulniers

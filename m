Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514DE29115
	for <llvm@lists.linux.dev>; Fri, 26 May 2023 19:48:50 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51400fa347dso1411a12.0
        for <llvm@lists.linux.dev>; Fri, 26 May 2023 12:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685130528; x=1687722528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lf4RRkiPUcNUs6sAKxHRjbAkQ4OPhmS/ejzXep+9w6w=;
        b=CKJONIHYBHoJ36pk3behUlnsORLM/bdJ0rKRwmtMPp0jrr/61zx3jD87TcrsYqy7zg
         k3biIDnQctHE5hJlWcQwUoZNxiDhYsAjQw9EkmEs47vBwpPKETPNuW5TQY/kHezVhRG5
         +AEfGjsfL0QOFBMYQqDqo/12R+BmNy9QDg1/Ks8RYLufZoToWmyDVjZ9zNaJoOQ6tSbD
         mkgN8Z+SQU/8xDSa7AfpFhM5yJiD0fDLr2W5b6q2WasXfoN5IHW3BEgVmKiSxiK3ELxR
         G27OzqOCQh2nquF0d43d717kdH0nfRAkmnqFWwOZNIE5Ka6tq4XteFx/StgpU26cggge
         QN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685130528; x=1687722528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lf4RRkiPUcNUs6sAKxHRjbAkQ4OPhmS/ejzXep+9w6w=;
        b=g3kczdS+YN2GajUQmL3Bsay9Hm7QcGuZuZpaSGOWfesRJpIsLvXmsCDkMr4L9Zr8YQ
         gk5Q3BPhoymakTSNWj1h0qQzU8PkxdkcbkQcd4zqDDKckAwHrqyXe8iOeccHa7exPbDa
         NEJoaVyx+54VTHxrEyif+Qm2IYJCI0UYHkEh4wr1hkyD5EGo9ZjZiPZzs5RKGtEcQ7uD
         zNDTxjoHiHmEvuRsuC/mJcFOw8+CAM3OmnzHU03b4F4PMU/1dU73fyRYz+Xv/10BKWim
         6x5QLQf+eAuzV+1Fr9jUI18u7wtx5AonXQCdQAiHx8v01rSYFDF/vbw6R5MLPooRhdID
         HKZA==
X-Gm-Message-State: AC+VfDw/zNP29q4Bd0wSd9lC1fxZ1uNI29KyPGxIZufvD5F27REAXf1X
	Byic9NLmLBNXux+uSzGWXXUf5Ht44TyHMGTVtqdhpg==
X-Google-Smtp-Source: ACHHUZ6CxetlS1s0rTKhE7K29Vp+fVoMB7NYpov6+cDO8gK7BapHTfvlv5vmr5u3w5Oi3ADVrOxX4qb1dXamvqZdzWs=
X-Received: by 2002:a50:aa93:0:b0:50b:c48c:8a25 with SMTP id
 q19-20020a50aa93000000b0050bc48c8a25mr19788edc.6.1685130528276; Fri, 26 May
 2023 12:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230517190841.gonna.796-kees@kernel.org> <168512138720.187005.8346289423859319616.b4-ty@chromium.org>
 <CANiq72=38mdTnJ3cicgwPB2xWqtbnGsL8Rtr4pwq7xGRr-m=Wg@mail.gmail.com> <202305261156.67CDEE933D@keescook>
In-Reply-To: <202305261156.67CDEE933D@keescook>
From: Fangrui Song <maskray@google.com>
Date: Fri, 26 May 2023 12:48:26 -0700
Message-ID: <CAFP8O3JO42CD2EXk+DJ5pci8ieHvRifAZpKg4iR_NiqTaYfLdA@mail.gmail.com>
Subject: Re: [PATCH v2] Compiler Attributes: Add __counted_by macro
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ojeda@kernel.org, qing.zhao@oracle.com, 
	morbo@google.com, llvm@lists.linux.dev, trix@redhat.com, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, 
	linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	ndesaulniers@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 11:56=E2=80=AFAM Kees Cook <keescook@chromium.org> =
wrote:
>
> On Fri, May 26, 2023 at 07:47:03PM +0200, Miguel Ojeda wrote:
> > On Fri, May 26, 2023 at 7:16=E2=80=AFPM Kees Cook <keescook@chromium.or=
g> wrote:
> > >
> > > FYI, applied to for-next/hardening:
> > >
> > > [1/1] Compiler Attributes: Add __counted_by macro
> > >       https://git.kernel.org/kees/c/86a76e91cbab
> >
> > Sorry, I was going to apply it soon -- in case you want it:
> >
> >     Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Thanks!
>
> > And thanks Nathan for resubmitting the `Reviewed-by` from v1!
>
> Yes, apologies for missing this in my v2 submission!
>
> --
> Kees Cook
>

https://discourse.llvm.org/t/rfc-enforcing-bounds-safety-in-c-fbounds-safet=
y/70854
proposes a macro __counted_by as well.
This patch uses the same name:

> # define __counted_by(member)          __attribute__((__element_count__(m=
ember)))

I wonder whether the two use cases are compatible so that using the
same macro name will be fine.

#if defined(__has_feature) && __has_feature(bounds_safety)
#define __counted_by(T) __attribute__((__counted_by__(T)))
// ... other bounds annotations
#else
#define __counted_by(T) // defined as nothing // ... other bounds annotatio=
ns
#endif


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF

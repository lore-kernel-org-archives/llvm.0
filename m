Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473B03C0A
	for <llvm@lists.linux.dev>; Thu,  4 May 2023 18:27:44 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-b9d7659d89fso1156827276.1
        for <llvm@lists.linux.dev>; Thu, 04 May 2023 11:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683224863; x=1685816863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8tWT+vX21YxVLjsYjF4+K5hr204YCQjlF07PCznWhQ=;
        b=jaE05pf56jkPfMZXJ7ufHmKM0XODi8PyIOsWMZ93xKYDAx/k1ioYI2XEGr50Sui9zL
         KkruEirAIMDmVmtxKM6kIq5CBoj11Uq6YXcH+XioR860ITa9wzRnsqQypTr0eJMarUaO
         4w7qB4oQe225YomfxAcnqHDn7RZZiDm6sE8U1Xj7xPszjMmXPiq8XcMyxXcGmCAxdt5d
         m8sm7lZOm4F0E1rF2S2kjmn2/YL6KFHvQWdUWF+FVo4kgFNWXy3DyjTmiv7tKXlD3AXK
         KoaKptxNt1rdu+dw5z+UFQWrcXyZvHl2nVX8btarR6tlNGy39JfUQQLkRT3CnvojKGHR
         NxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683224863; x=1685816863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8tWT+vX21YxVLjsYjF4+K5hr204YCQjlF07PCznWhQ=;
        b=HEdDu7rVQaWxB2J0FmQJVb83mAB1+8ufo3jPZpA3tv3wBMCrpDj0XA6yEZIciOoTRJ
         8bhJcxNPXmz0OJW03y7NOKB2oRRUirihL9e8XIsumX3uKKhAMkDKZr/Ptwxi4AwNpfMD
         RXBKQfv2nntFptQ+LuYDdpaQOyfdsk8WYzMITWzwCRLTsg/NqGD9pKLRugMbvjDx1IOg
         0iJrvIg9D7tMPeKZC4lHDflhWcFbPmYzfAvKWz/Xr0pDc6FfqmmDg/484JvdDi2xXtjO
         IEAuhxrRkWZ2ERAly6PWdYvFbXtjaol4sJeTYGFp55RqJnWATUboYTLFtfZQ3NOf1WO3
         q5tQ==
X-Gm-Message-State: AC+VfDzFhU9jQzBekVucC+vMlQLmKZV2+y1+gjSDSmj0qQUbM/UM9xD9
	yX9Luffa75CG5tTjMeI63XtNT1m1vvSGAOWHUQ8=
X-Google-Smtp-Source: ACHHUZ4ZEWwpQ+xTlZOQA0iB//dJWSoEdq4wf1HrpMSq7UDmwBStHq/diWL0Is2zFqaLM9MN/uTkQDoFfZJySJ4b3VY=
X-Received: by 2002:a25:b319:0:b0:b96:7d4b:7aeb with SMTP id
 l25-20020a25b319000000b00b967d4b7aebmr938269ybj.34.1683224863248; Thu, 04 May
 2023 11:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230504181636.never.222-kees@kernel.org>
In-Reply-To: <20230504181636.never.222-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 May 2023 20:27:32 +0200
Message-ID: <CANiq72nZNU-x_8ONmtzainxDUMedFT+FHww1xu9Ho07gxfAD9w@mail.gmail.com>
Subject: Re: [PATCH] Compiler Attributes: Add __counted_by macro
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Bill Wendling <morbo@google.com>, Qing Zhao <qing.zhao@oracle.com>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 8:16=E2=80=AFPM Kees Cook <keescook@chromium.org> wr=
ote:
>
> + * Optional: future support coming in clang 17 and gcc 14

Should we just say:

    Optional: only supported since clang >=3D 17
    Optional: only supported since gcc >=3D 14

even if they are in the future? That way we avoid changing it later.
If somebody asks, you already say it it is in the future the commit
message, so it should be clear enough... :)

And if the compilers end up not supporting it on those versions for
some unexpected reason, well, we will need to fix the comment either
way.

(I can change it on my side if you prefer)

Thanks!

Cheers,
Miguel

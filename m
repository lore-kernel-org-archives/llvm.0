Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A3352F8E
	for <llvm@lists.linux.dev>; Mon,  8 Jan 2024 16:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b1DJmHSx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-336990fb8fbso1923930f8f.1
        for <llvm@lists.linux.dev>; Mon, 08 Jan 2024 08:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704731520; x=1705336320; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlZtp8Mc/IdEItW9zdWJoKOLhQnUFxnWRKbUrflBtl8=;
        b=b1DJmHSxiTf69mt+wUG/DKCSyNtqtzDQjYu6yVj6xR7k4Xebmbdcj5gLjMUNYUz1lA
         McPG78dlHQr/+aQ+lhVNS1dPpmSDhr29YT22/WzftndkY3THQjCG3qyB8ue0Hfj7xiqa
         KM4WNHbKrUw/TZSeNnAb8XCrpEfYR3K/LaOYgNx4oLmNfTQOoDlhrixHrB3edITdRCbE
         3i8nDSztbSmXMPpx4i0effzy6C6Id8WMgDGqs3Hyd+6fuNuxGagtKjOo4onYnLiDYuEi
         mqKGHn11BGSYJRzB05C2RvDKkvdwCJA9ZLtRMGbUov+s+jt7HaMZ87brz+mvb6DKfNoi
         ml2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704731520; x=1705336320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlZtp8Mc/IdEItW9zdWJoKOLhQnUFxnWRKbUrflBtl8=;
        b=E9o/PEQ3hwxFwHDn5G1VXK+ZELmqWztIPin3eA6pKMjW3iiS3WMyS5y+567oYfpyqA
         vOvLxBxXPX/7m/Vodd4AjHAIfAMf+SFz+EucYlUWUpej0fj6SQvUHpJwa1ec2KqJjpVV
         DpFEWN8AWQKQj6Lkze6oHlgW42f/gS+XfdS30gUr8YwALWJOYEVAi48w82yOWn93jw8Z
         tqrGOMVcJAq+NXnswB17MmfcrsQV48wYwt/ukEOclxv5XHkql+cY51PFVjgWnmayEOGs
         Rc/StwLzzUENo01PHhuKDEn/M6qzFKsB7/O/fYuM37t1/XOPta6OABDBXLb+5QSgG2o6
         TiQw==
X-Gm-Message-State: AOJu0YwfYuWLqMnITyHhJGi58l6kUXcCnAI2350eUYuvcEEU+9n/Rxt3
	0l8mibB/fA0m+/mshXnlZG8sq61ZVZD9FJrPDJ8LI+gyiryW
X-Google-Smtp-Source: AGHT+IE+HJ6kcZvKnHQNGaVcsMN6yrWNgiZ5/HRkVlFCiWKs0+nk83b2SJCK0fThLzy/qbHzwkldT58c/xYbwY6tIYI=
X-Received: by 2002:a5d:5706:0:b0:336:ca4b:b5ff with SMTP id
 a6-20020a5d5706000000b00336ca4bb5ffmr1831234wrv.75.1704731519617; Mon, 08 Jan
 2024 08:31:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240108033138.217032-1-wangrui@loongson.cn>
In-Reply-To: <20240108033138.217032-1-wangrui@loongson.cn>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 8 Jan 2024 08:31:45 -0800
Message-ID: <CAKwvOd=ygyfAzmk=1TTf+U62U8wkvpFYCJo-Ci--6rs5nSoT0A@mail.gmail.com>
Subject: Re: [PATCH] scripts/min-tool-version.sh: Raise min clang version to
 18.0.0 for loongarch
To: WANG Rui <wangrui@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn, Nathan Chancellor <nathan@kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 7, 2024 at 7:32=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wrote=
:
>
> The existing mainline clang development version encounters diffculties

s/diffculties/difficulties/

> compiling the LoongArch kernel module. It is anticipated that this issue
> will be resolved in the upcoming 18.0.0 release. To prevent user
> confusion arising from broken builds, it is advisable to raise the
> minimum required clang version for LoongArch to 18.0.0.
>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Signed-off-by: WANG Rui <wangrui@loongson.cn>

Thanks for all of the work here; it's nice to observe the progress.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1941

> ---
>  scripts/min-tool-version.sh | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> index c62066825f53..9faa4d3d91e3 100755
> --- a/scripts/min-tool-version.sh
> +++ b/scripts/min-tool-version.sh
> @@ -26,6 +26,8 @@ gcc)
>  llvm)
>         if [ "$SRCARCH" =3D s390 ]; then
>                 echo 15.0.0
> +       elif [ "$SRCARCH" =3D loongarch ]; then
> +               echo 18.0.0
>         else
>                 echo 11.0.0
>         fi
> --
> 2.43.0
>
>


--=20
Thanks,
~Nick Desaulniers

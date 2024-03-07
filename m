Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32EB128818;
	Thu,  7 Mar 2024 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709810382; cv=none; b=CmvZu2W5fS97gubbpx3JnjZytCLcBTa4Z8wY8T3Wi7aKRBDM7TTB6eOueBCIduhsKyZOCiJEPyidBZ2fxXEMzWYRMzEay2Ya01PMHxAqN9jj3bSWvZn9ByKIbABQmfMPErhPLwi5ZcXamMbl2thW0FprYK6RPXGJeVVUy//jQZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709810382; c=relaxed/simple;
	bh=hn5En0wgjaNvAbCB4yyFVqeOLhF2v9p6wp8KiAjFoQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YehqTgOt9OAfztgZLfq3CFquUoG05WV/sD0KckHRtH9+WnTjZv11uTrY3J6jZmo5W/1vvm1DEDX1/DqLbQ71vewh2XK+dRhRr1QfcOA2cGzIdEFjeAREAkkqU44cb8sVRnEorf7Fw+v0K5Xnx6339H0KhSHfKY+u9l0Ccr1taxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVdaYuw5; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVdaYuw5"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a45bb2a9c20so103718166b.0;
        Thu, 07 Mar 2024 03:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709810379; x=1710415179; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hn5En0wgjaNvAbCB4yyFVqeOLhF2v9p6wp8KiAjFoQE=;
        b=CVdaYuw5I4sFaLHeFGzLV7rAl9QWaLpLCzCEbR+Np2c5wOJtydLj44PkW9A1zcehtR
         UgQvVcRKXw5baOv9KhpuTmwt5dueYL6MUD+hwQYqXFoUB3lNCdptYqtTQ86aTMrPeTAI
         nNA/S3kD+NMp3GgiEFBAht+32zkn2Wiy/lc4Jl/spsmitCUZUnscrirhESY7E4gy50Ol
         qJFyTxLl7g4SD8PMNcoS7eJkYqBO1zMFGVtMU9R9TLNWih0oo8sVGMYa6FlSQifheGZz
         iLoybpZDeUKlHN+JoHKswoAg29eqBoaSLUBy8xt/Y6438+8uaD+Bb1DNjN/TKt3sKhDS
         TMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709810379; x=1710415179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hn5En0wgjaNvAbCB4yyFVqeOLhF2v9p6wp8KiAjFoQE=;
        b=SObqqHLDXXShFb5Ysq15lxVufpXOHmd6yu5GtdwQlhpaVvmEnhK6Tzc1nee6Gk9H2H
         ODRqzzMWd4ky+yU0Wj8mMGVbnThiNwkNs2pB3VKXt7bp4VnrLyH8fUaYOSadtvQIyEH+
         tuYxDlV8b27CNNmFH2dtLhyF4w1EAL7qKimwCbTiQUcw7jWnRbCWY2WBIIJA238fN1y5
         nyao4Qk5lXoDgNEMeA6sfvL4j++3ouXngpFCJPScrpn/FTgnMiPwi3N086yc2wzILxdB
         7ZSJZQG/CiKdVBksMtN3oTDPxvZ9id4Zx2ZQ6F08BAKn9NGOar33K9CWYYMFKhBBHYOt
         F1Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWCps7AK73JPW9mVd5BY+4LlySqmNEfwyX8OOK1U/yrteb0HWGoWAr2yOV5X0JC5VxU4gvgbDGfDFQ978SEJ5B2vBMmUA==
X-Gm-Message-State: AOJu0YwElFpTyNPQCEdXI2r+ACeY97fjtFUb1Opdmy8nG3AJNYgcvetv
	LYzP+jth1zJnwLEYwNslLsYP9EC4XYRd28diaKST1mRPFZw6sI/wsTZ4NWW21b2LCd9/Yd2fivM
	/qx3kmJRaAqjlXtnfw5oJIbAQUrI=
X-Google-Smtp-Source: AGHT+IGsBI4NlRfoTAT9x1Ia6fnXS/M4fnxiAqRS52VhyS4qM4cY2ae8RGAyQcBi20BhLbq8kNxOTX3NC5JfG6X/3co=
X-Received: by 2002:a17:906:1393:b0:a45:a72d:62a0 with SMTP id
 f19-20020a170906139300b00a45a72d62a0mr5066632ejc.77.1709810378639; Thu, 07
 Mar 2024 03:19:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <42c7f5a3e07c274c2a9d2e45a973c6306b2ba74f.camel@collabora.com>
In-Reply-To: <42c7f5a3e07c274c2a9d2e45a973c6306b2ba74f.camel@collabora.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 7 Mar 2024 12:19:27 +0100
Message-ID: <CAKXUXMzbZu_7piNcKK5c7Q4pR6KRaY4xuxSuvrNS07MTHE7X7w@mail.gmail.com>
Subject: Re: Migration to Debian Bookworm and compiler updates for KernelCI
To: Denys Fedoryshchenko <denys.f@collabora.com>
Cc: kernelci@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024 at 12:02=E2=80=AFPM Denys Fedoryshchenko
<denys.f@collabora.com> wrote:
>
> Hello,
>
> I'm reaching out on behalf of the KernelCI project team to discuss our
> current compiler setup and planned migration to Debian Bookworm.
>
> As you may know, our compiler images are currently based on Debian
> Bullseye, which is approaching its end of life in July 2024. We have
> been testing using gcc-10, which has presented us with some recent
> challenges, notably a significant bug that results in false positive
> compilation errors (specifically, the -Werror memcpy issue in
> security.c). This situation has prompted us to consider an urgent
> migration to Debian Bookworm. Additionally, the migration is
> necessitated by our requirement to upgrade to a newer Python version to
> support KernelCI v2 development efforts.
>
> However, before we proceed, we have a couple of pending questions that
> we hope to get clarity on:
>
> 1) We've noticed that the minimal available version of clang on
> https://apt.llvm.org/bookworm/dists/ is 15, whereas our current minimal
> requirement for the Linux kernel compilation is clang-13.0.1
> (https://www.kernel.org/doc/html/next/process/changes.html). How
> critical is it to continue providing compile tests for clang-13 (and
> potentially clang-14)? This information would be vital for us in
> planning our compiler support strategy moving forward.
>
> 2) We are also considering migrating to gcc-12 and would like to
> inquire if the CIP (Civil Infrastructure Platform) could provide their
> endorsement for this move. Should there be any reservations about
> transitioning to gcc-12, we would greatly appreciate development
> support in building gcc-10 for Bookworm. In the interim, we would like
> to inquire if it's acceptable to continue using our current gcc-10
> images based on Bullseye until such a migration is feasible.
>
> We believe that addressing these questions is crucial for our project's
> progression and ensuring that we maintain a robust and reliable build
> environment for the Linux kernel. We eagerly await your feedback and
> any recommendations you may have regarding our migration plan and
> compiler version support.
>
> Thank you for your time and consideration.
>


If you want to get feedback from the CIP project, it might be good to
kick off the discussion on their public mailing list:

https://lists.cip-project.org/g/cip-dev

It seems a busy mailing list with a lot of automated email reports,
but maybe you do get through to the real listeners.

Best regards,

Lukas

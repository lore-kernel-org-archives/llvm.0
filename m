Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A7E111E
	for <llvm@lists.linux.dev>; Mon, 26 Jun 2023 22:41:35 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-635d9d6daabso16632546d6.0
        for <llvm@lists.linux.dev>; Mon, 26 Jun 2023 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687819294; x=1690411294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTMSuBih5SJHpThENomHa6PuAfJ+GgR/Xnb6pzrntlY=;
        b=aGepeRFUGjxfiH8oCEK/hjBTTj6VZpHejO26Fgl4ivbCu0z2wia/lP2L/oMInVh3h+
         BaeB4JuEelert0cS3h0rbnuJx1Um+B9zxKL2EocKEiQkjZNqeaMcfs6DlE/GBXynYG3c
         fJHY9JaGv1aGmXq992fZEdSt3UL9luRKGNswux3/vfX1VdEHgnaIL5hkn/GchAO5Pu2V
         lZxOVgQjZ3kx8IDZEzWVvZI/oVQpyWxntOUsLdDf/bsCA5XQXEx9Ax/88VW13xg8/hFM
         fqUT35UbaCDf5FF1NGWuwJpOwv57SQtPGRlyfhngo8B7DpE0MvopN8MoBnzJbyyJhyhX
         kmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687819294; x=1690411294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTMSuBih5SJHpThENomHa6PuAfJ+GgR/Xnb6pzrntlY=;
        b=EBO+6dUMJnl6ligbe2i46eHpReLjrm9Ytw76hesMBSPQ1kTel4XyfW764QqEKX6aQb
         A+XHKkIy7XnSWviyaM6DL/WSZO2LaSnNI1+GMj5ZlVK+M9ZnDNr0KiZgmvnP9gPT3dlZ
         2WRKvVu1rJQWRrAd+v4tOCNg0AsEkmsyh2RJnb6dTQ6G5yLXpEim9d05uQExm+mQ23Km
         S/SFCul2qNqre9MDu7Nm8VVYL+9kao4QImid6FgfAMDtJEIi1EHnHT0+MAVd7RQK0SR8
         bmvUjnuMu1bBUyuc/i3CMTsy65plrx3dBiPYpAtRP62cqfyfDGML93WOxBjze/HXA+AB
         bPtA==
X-Gm-Message-State: AC+VfDyueOkXJ8ok6dPOJ9bSEIqqbKM4u8yO8/jvuiXvcZdsm/IwATXS
	ylxQhiHOVCNk744o9wI0ZWjHcS/HJ+ek+FZOY7/+rm2wTUQGpL0+i3oyag==
X-Google-Smtp-Source: ACHHUZ72mpLSpnxUbLE1jWK6NGLih7t0UKWdnr/Zxbh+5MPR3Eho5Ivd4rRCd3EVj4xxosQJg4uq2n2FYWrntJ0W0BM=
X-Received: by 2002:a05:6214:21ed:b0:631:f49a:6d34 with SMTP id
 p13-20020a05621421ed00b00631f49a6d34mr13339720qvj.64.1687819293913; Mon, 26
 Jun 2023 15:41:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGG=3QWao2bQ0R8yzkjZQwiwGcDf2u67fztPAv09S1ixDUxYrg@mail.gmail.com>
 <CAGG=3QXHK2XhBBV0XwUok-Cop_+xJZtB_D1=qMS6HwWoKs8Hag@mail.gmail.com>
In-Reply-To: <CAGG=3QXHK2XhBBV0XwUok-Cop_+xJZtB_D1=qMS6HwWoKs8Hag@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 26 Jun 2023 15:41:22 -0700
Message-ID: <CAKwvOd=gekbFNdioSWb40wVkd+3a_tzCvR3xEwjU4sf1s-MeLA@mail.gmail.com>
Subject: Re: [Announcement] Clang-Built Linux Meetup 2023 Dates
To: clang-built-linux <llvm@lists.linux.dev>
Cc: Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 1, 2023 at 1:43=E2=80=AFPM Bill Wendling <morbo@google.com> wro=
te:
>
> We plan to hold this year's Clang-Built Linux Meetup on the 11th of
> November in Richmond VA. (the Saturday before the Linux Plumbers
> Conference). It'll be a time to discuss Clang-specific topics and give
> people an opportunity to present their work and/or do a dry run of
> their LPC talks. We'll also have hacking sessions, bug hunts, and
> future planning.
>
> Further details will be forthcoming later this month.

For details about the location, we'll be located at the Omni Richmond
Hotel (this is the same hotel that Plumbers is located at).

For more info, please see
https://clangbuiltlinux.github.io/meetup.html which is also linked off
of our main page: https://clangbuiltlinux.github.io/.


>
> Share and enjoy!
> -bw
>


--
Thanks,
~Nick Desaulniers

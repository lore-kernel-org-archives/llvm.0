Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3727E35EE5
	for <llvm@lists.linux.dev>; Tue, 14 Nov 2023 20:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pLjyVUp1"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32df66c691dso3558831f8f.3
        for <llvm@lists.linux.dev>; Tue, 14 Nov 2023 12:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699992462; x=1700597262; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYXixEKEIJ+1GuvafPDgFdCXIOFGQROEQrMVaOpRSJo=;
        b=pLjyVUp1XKN7Kr5xx/8f84auQyBR7e/y7MaM+MX+vQCHH+rPGzl6Hh82au/xM1OTc1
         80mRlmtqymPxfuvYkDOJVlv4TcAD1AB/QecuJxeFC6f/jsWNzDBGbG3j1RVj3USMw9HE
         2BuS+2UOpuXDQDiop8GZrCeBQI3QusA8osMbjgXmjmaP08fPm2mkf6X2No0muND1kYnf
         Z1jlhqoByl1/RdMoAIIKbiWotghToauPq6KFgOVwhLGY9yh1i2jbkEPihboTlJK8K8Is
         yQPk4XjmJnnw9DdSOl97aQ9TSzsjJY1GwAmQdtufluX3ngVVcpb1ElyjmAnsOhEEHDG6
         OmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699992462; x=1700597262;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYXixEKEIJ+1GuvafPDgFdCXIOFGQROEQrMVaOpRSJo=;
        b=c02b3iQn27vkrW80NgKYUMB4rQOPFj5JyEvs1JhSFB9lL1Ur2QLlEfBJ2Poz1k2qMf
         c7jJLLtGiVZ2ZvUOXZXsrJVAC14mDYNkXO/xGoTrU5zeC3lbIwa7/1ZGYdaAWTP0cEYc
         rQfJiC7VmUjcEeVsmJjv7U+fiDttSlhquR86EhFTGCeai15pjPOwXW3ra+T2ledqQiEb
         C64HM0L33g8QCg6Mg2ngMNfM8npHzUbhZatNZViWUnNgr2BHTtoO3I3a3NFDm+5hp3Yy
         Dv5RmPZEjTyzs6Ez9oUCmxWNz2FTAHDDqa9nYKYP7uFFaufwm4lfl39hmtiWmioPDn9c
         qJbg==
X-Gm-Message-State: AOJu0YxAIsMeFN9BBHqsEFurIqeD/J3UUf0m8HkUOT7ojTiNd8RVjOfN
	j8pNcZJnEy37b5Clc80LQTawgVdz9l8CUXee/TyUKPQT6BHh5xJEe2bDig==
X-Google-Smtp-Source: AGHT+IE9D2eXRzaZsIEEdwmRAiGttxp6tEm7YtXyO2Dk6sIShDX1FY2m6gM/gPtt8AJC8fg4oU1Ls9isjAnZTv8BY0I=
X-Received: by 2002:a5d:6c61:0:b0:32d:8819:4620 with SMTP id
 r1-20020a5d6c61000000b0032d88194620mr8209862wrz.14.1699992461997; Tue, 14 Nov
 2023 12:07:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmvAcnjmTiAoeUFF0yDU=Pf5jRYRwxDU=5x2-Fhocbpxg@mail.gmail.com>
In-Reply-To: <CAKwvOdmvAcnjmTiAoeUFF0yDU=Pf5jRYRwxDU=5x2-Fhocbpxg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Nov 2023 15:07:30 -0500
Message-ID: <CAKwvOdkZt=JBdqDXfUv8_RwQzkijtEf1EVsYGPxkZtok38vnFA@mail.gmail.com>
Subject: Re: removing github group priveledges
To: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 4:49=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Hello,
> As https://github.com/orgs/ClangBuiltLinux/people has grown, it no
> longer makes sense to have so many admins.
>
> I'll be converting less active members to admins.  Please speak up if
> you have a good reason why you need to remain an admin.

I've now converted most folks to members.  Happy to make changes back
if necessary; just speak up.
--=20
Thanks,
~Nick Desaulniers

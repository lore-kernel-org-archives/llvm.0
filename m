Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC38A52
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 05:41:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4005f0a6c2bso30515e9.1
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 22:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694756473; x=1695361273; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87Wnc7pVAI799isdkSampY1vXoiHF+D2AHzNc4Gf7LI=;
        b=nRLT6gXBf1pTXRcRUOxHofr9LJCDRjUQw5fCA+SPS/rell686k88Dnv5muqk1I+JhL
         cwRXCXVsZD6R1QqI3vefz1qDexNiej0lEDBCmmUn7B/Gc5azp91ebAcJdsR2lxwzx5aH
         g3pp6wvhP6LuBePMtO3bkSZxTC05IgKJ+W9EVyQNJ5xll/iLl0hbB0weGIX5KKjHB+VS
         AkR1z6TaOpiHdRTOUd7Ny1soThYGcKlp73oOe/dZK4DyJsiNL4b0kmXIMs+mCqtKIuJp
         C+o/wWpoaMF4LOeeKoNvQ8CP5rwVv1lfoVsAcftLeUd5gZRbqF5EmAuiEvmSZjTAKPXx
         bX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694756473; x=1695361273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87Wnc7pVAI799isdkSampY1vXoiHF+D2AHzNc4Gf7LI=;
        b=qyaO0bYw/U6iYVSD0HpdG5eYAu3sEb7s+Gq8B14NBG61hIUWn0yqBCI0W7SQkbomjt
         BmS56hva4y9cT+AoNOPxmxNe9NsVFKUj9AH/Y1qEaY+4L5bVW8sIJyqRItninapLWH6A
         q3/1moMI6q73Ng+M2VoLWo3bKlqHDzI+aHsYSB9W+i8dLU0Oj6NfosHa86KLX+Pe9Qct
         X4KSJiVhKmW2GPhI4RdjVNmRMgcNbMSt/zzjJAkLRhnmb/4impiiIY5FrJ80KLpucT6I
         18wjgKGtxPS5NPs2kQadp7TN8ViVCogSlvemqyKwyOYNNMUdgtxs3ozrOXn8fa8M1FhP
         FUrg==
X-Gm-Message-State: AOJu0YxVvM+HOrV6YxZARsXJ2Toq/7dLVMnsAHtelNEXKTlm51cQq03M
	WGOMCCLeMzI+M6uq8Su9heJqzXplKtruePRoijSo
X-Google-Smtp-Source: AGHT+IGM7N4hqYeaUT5nz5cwpj+sVZEKV7JoUJje6RYpqjTPFON3VGhEopM7yLALdrFgG6+0YJvZ28HW1looP4D5oU8=
X-Received: by 2002:a05:600c:1d04:b0:403:352:5d9d with SMTP id
 l4-20020a05600c1d0400b0040303525d9dmr52357wms.5.1694756472656; Thu, 14 Sep
 2023 22:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGG=3QVwmn+sLdWUb87hbDEBy63KdYgvExOWJFC6n0wajzhemA@mail.gmail.com>
 <20230914232415.GA1067476@dev-arch.thelio-3990X>
In-Reply-To: <20230914232415.GA1067476@dev-arch.thelio-3990X>
From: Bill Wendling <morbo@google.com>
Date: Thu, 14 Sep 2023 22:40:54 -0700
Message-ID: <CAGG=3QVyHJdjGrPtpAPcSWN4aVV3z7rzxSdJcpgimOuda91JJQ@mail.gmail.com>
Subject: Re: [Announcement] Clang-Built Linux Meetup Signup!
To: Nathan Chancellor <nathan@kernel.org>
Cc: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Try this one:

https://docs.google.com/forms/d/e/1FAIpQLSelo9EWhh2HTDY9kDLgm6okPQ0EVMGDq1X=
8WBsVohdFDfVUXg/viewform?resourcekey=3D0-5StuGVUlJ-u9TutUZ-_tMA

On Thu, Sep 14, 2023 at 4:24=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hey Bill,
>
> On Thu, Sep 14, 2023 at 03:19:37PM -0700, Bill Wendling wrote:
> > Hello!
> >
> > We have a webpage for those who are attending. It's just to give us a
> > general idea of who's coming, so it's a very short form:
> >
> >     http://shortn/_MtOydwQiGs
>
> This link appears broken to me, got a working one?
>
> Cheers,
> Nathan

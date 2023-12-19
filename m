Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6263E3B182
	for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 21:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rJFLeqB+"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5534abbc637so3678259a12.0
        for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 13:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703020366; x=1703625166; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7lbvJCDJ1XM7ZPTdVewOcxLLbPIBuDKo8DQQNb5RJs=;
        b=rJFLeqB+ENbd7SHphXG2VLgwsq6WiUhV1WHvTbBXsL37BUI6OI2g+Xsy+GUW9AYaSh
         WPVRmKt78C0RrVAyow3A2SMYHkL5cKzRuDEdCI3DpxKz7NASIuvf9ab/R8Hkm6awypTe
         VLjwLtNs5m62IgFqLO2jR8YQaKJGdubg1fsjBSUVYh+U45E/oPJ0/nMF3ErBt0pPnIkE
         WzpLtWXPjt3ganiuQIWI7Ffq/jubxvx1oSb5X1sH3tiQasH8z1KLCqXaQTglAwmG5tB8
         gE84wK0DOcZses3PxEwxhCvLJXh9d4+SLjLOYNwU3jgayBk8crb4W4g9li2uMumNlJ7k
         oHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703020366; x=1703625166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7lbvJCDJ1XM7ZPTdVewOcxLLbPIBuDKo8DQQNb5RJs=;
        b=cZTMk/yCDlEtDmiSqAmGA8zUrFj3QDMu6ahkV1mIKOpgSXIEY51UpZzOFHbuLIddEG
         poYwtYMtmYKH52gdZJIHCR9f2zmdSY1TMZ0Jo1XO/crhddAk8E6CeT8iOACCjqV7LXyd
         arlHonfZkOKwXdkonix0Ax/z9bStbRXVH97gL2xzqI//QXJCfyh2CIjKHg4ZnictnjkW
         11ys9oytknutD2LGc5C8l15lbMHBN+JkLPguQ1ILp+wPXsZc/HQMJtssvC8OEcH9UNAo
         lLWrYPdHe8QbRedHNMfxVOUCXM0K9mvsXUe10ikm1yF52HfMGFUCFd/mKaJmMXwTm6Yt
         v7Mg==
X-Gm-Message-State: AOJu0YzUmU8VIvp+K0mtlUZ7RwgPDR7qQ+TnT9HpoU1AvOqHUS/tUNzB
	8n8tOIRdALv3tLJ8uRAaux5rLSeuv2CuUAUk95Xx6A==
X-Google-Smtp-Source: AGHT+IGx3h05PGeb3Es3OTmJpYxj0l2+kg87lc3hinLRFIMaFFOHpmYvxSRHlQSv9b2PFZtnDZ8q60mGJ1mZ6DK6CzA=
X-Received: by 2002:a50:c209:0:b0:552:85f4:ed39 with SMTP id
 n9-20020a50c209000000b0055285f4ed39mr4588788edf.38.1703020366584; Tue, 19 Dec
 2023 13:12:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231215-llvm-decode-stacktrace-v1-1-201cb86f4879@quicinc.com>
 <CAKwvOdmY=Jysqai3KOYO8+c5idP9JjNGKL2xZn2sDNdj5MjTVA@mail.gmail.com>
 <CAFhGd8qA8Hh63iZPP33Nsxu61OycP7oqT50mDgUO-HFNUWHZxQ@mail.gmail.com> <CAKwvOdmMCmcHVd7+ymKgVUe5uZrSvUYMaD9Fz5GSBtHBMPTnSQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmMCmcHVd7+ymKgVUe5uZrSvUYMaD9Fz5GSBtHBMPTnSQ@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 19 Dec 2023 13:12:34 -0800
Message-ID: <CAFhGd8q80F8kvigHQ1Njf3=KzPsahjy+oRTS_QRz6E6ujsSU5Q@mail.gmail.com>
Subject: Re: [PATCH] scripts/decode_stacktrace.sh: Use LLVM environment variable
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, Manuel Traut <manut@linutronix.de>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 8:49=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Dec 18, 2023 at 4:17=E2=80=AFPM Justin Stitt <justinstitt@google.=
com> wrote:
> >
> > Interestingly, I am getting good stack traces on mainline with a
> > LLVM-built kernel -- both with and without that patch.
>
> Probably because:
> 1. you have GNU binutils installed.
> 2. you're not testing .o files from an LTO build (which GNU binutils
> cannot decode).
>

Yes, and yes. Makes sense.

> --
> Thanks,
> ~Nick Desaulniers

Cheers

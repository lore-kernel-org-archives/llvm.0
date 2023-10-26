Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF4E37C93
	for <llvm@lists.linux.dev>; Thu, 26 Oct 2023 16:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjABxFJq"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b2f507c03cso628015b6e.2
        for <llvm@lists.linux.dev>; Thu, 26 Oct 2023 09:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698339522; x=1698944322; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2My7dzj7Sa0rgTJc/yeT+l3xQqlYTaObutNlMsCM2Jk=;
        b=kjABxFJqgHunX4C6I7WyCGr0q0hlZhI/urQoDrDhlqEG2SpxuIyB5gsH0XPP5laUkz
         Xixs2LqTQAovBTMmFjDypSeu+Xgnp86/XPzq7RkdMnOutJRpZpDjwtnrqdUsS7IUonUP
         hcxiDadb5ItwLLQnXnM9s7z1aOtvx8EHkWUA35mMdDxPEXKeWVq2GPBDMXXYIsi9oEIN
         hIbEzDsdq2Q4xRYQgpHpjLbtS8o3kAvef1DZNmlUIR0tKrzBiUwutojhh7BVeYPEcZkg
         SX6U7sxBOPlauRZBq7b5B3H2o6tf4KqsbwLOTOt6ZqtLUWcwZyjN41XPz4i20ctS82Ug
         /2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698339522; x=1698944322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2My7dzj7Sa0rgTJc/yeT+l3xQqlYTaObutNlMsCM2Jk=;
        b=nrP7EiAyL+Zo+OQTZ6fD4ocxikq8VPsYywKfWFE2a5MKhJ1oWRZ+s8cr01g1FOpn0e
         oHjgeaCzq1es1pA0jk5Xgg12TQ6GutUOKgVw2vRTaawdZVM7UMw4p9aA519L7MRsShKY
         QsW4HG4treGiZiOBDQXCDGq+tfnWiSEGenXZwCgaskT+sFPWJzoD6uw9UIqwMhr66vEF
         86jZrDAJNbRbrA3tDYXz5e+yJwWdO9eTPSISqWqUlwlgBg3rXjrzxdTzL7sg7R66Jx9Z
         i3cW18hg8JMqhOX2D0q3NfLgLLeQBq3n/MT3RrGqRd6pREGASDMRYQcuKNIpJo9c1ymj
         CZlQ==
X-Gm-Message-State: AOJu0YxmHPap4kiF6uPZxScumJ3XrBZxsxeNqfIBF3yMyss9u2W2/qZn
	+jO2doBuLBvhx5rh3IpUqO0N9qSPYjY07gc9Meg=
X-Google-Smtp-Source: AGHT+IHYIEtTPq49J47m7L+kP4zWLW1jW3174fCj7Z5xpN8ntf/ECHptkhk8TAFzmkQ0ZcFZSrtrZcJRSuTa9xWZ1g0=
X-Received: by 2002:a05:6808:4d3:b0:3a7:2524:6d3b with SMTP id
 a19-20020a05680804d300b003a725246d3bmr18779047oie.12.1698339522590; Thu, 26
 Oct 2023 09:58:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231024201157.748254-1-alessandro.carminati@gmail.com>
 <5776666.DvuYhMxLoT@pwmachine> <CAPp5cGToUaPCr3Fp2PUQ1yQJ8ci+wTVqgTCEs2OxvR+yTr2oOQ@mail.gmail.com>
 <2162048.irdbgypaU6@pwmachine>
In-Reply-To: <2162048.irdbgypaU6@pwmachine>
From: Alessandro Carminati <alessandro.carminati@gmail.com>
Date: Thu, 26 Oct 2023 18:58:06 +0200
Message-ID: <CAPp5cGQsm9jJw5dktGbM1EpvU1wi1c+Bt2r+Lj=Wn_pBkt6oSw@mail.gmail.com>
Subject: Re: [PATCH v6] scripts/link-vmlinux.sh: Add alias to duplicate
 symbols for kallsyms
To: Francis Laniel <flaniel@linux.microsoft.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Daniel Bristot de Oliveira <bristot@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Nick Alcock <nick.alcock@oracle.com>, Kris Van Hees <kris.van.hees@oracle.com>, 
	Eugene Loh <eugene.loh@oracle.com>, Viktor Malik <vmalik@redhat.com>, 
	Petr Mladek <pmladek@suse.com>, Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Francis,


Il giorno gio 26 ott 2023 alle ore 18:01 Francis Laniel
<flaniel@linux.microsoft.com> ha scritto:
>
> Hi!
>
>
> Le mercredi 25 octobre 2023, 21:33:43 EEST Alessandro Carminati a =C3=A9c=
rit :
> > Hi Francis,
> > Thanks a lot for your feedback!
>
> You are welcome!
>
> > Il giorno mer 25 ott 2023 alle ore 15:21 Francis Laniel
> >
> > /* SNIP */
> > > > debug >=3D DebugLevel.INFO.value:
> > > Shouldn't this rather test nmdata?
> >
> > Not sure to understand this feedback.
>
> Sorry, this was not clear.
> Rather than testing vmlinux_file, shouldn't you test nmdata_file?
Now I see your point.
If the assumption is that scripts/kas_alias.py is triggered by
scripts/link-vmlinux.sh I dare to say that it makes no difference.
But, since the purpose of this work is to manipulate the nmdata_file, using
it is probably fitting more the use case.
>
>
> Best regards.
>
>
Thank you for the precious suggestions.
Regards
Alessandro

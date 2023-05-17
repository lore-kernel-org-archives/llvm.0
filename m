Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6DD31EFE
	for <llvm@lists.linux.dev>; Wed, 17 May 2023 19:09:10 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f38824a025so38301cf.0
        for <llvm@lists.linux.dev>; Wed, 17 May 2023 12:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684350549; x=1686942549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTCrNF1k6eLvgjFBEtoVOllbYMzqAXAFq2VPdBNe0PU=;
        b=1RbKqgNlFVDn38jbjn+Xyf9v2PZkmr8NlkChy47jOU4d/MCsfICl4HNWXWC54W/pIG
         1dofWJXAUWTCZsLtED0n1ndgNbYBCSAPo29fdxJKDrBAtQLgOX9f4pwZf9kS3ghxthb2
         N0cN9RM3ETTW9YLxhlOsJZe46DUn6ZX78QPySHArvwB3zQoi3yo5ttMISt8BFPmlw110
         S2XVBIeCofavikgM7slybu8BTtRWgBDobDNS6+35+preNvJmtRz207zhxdU79kZEcZuJ
         wKIH702z053O+wSyqnfucxGZO8MfVQbrjAHBqACNkUsgYmu7+zNA5DF9+/qkjRd2vMvk
         XikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684350549; x=1686942549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTCrNF1k6eLvgjFBEtoVOllbYMzqAXAFq2VPdBNe0PU=;
        b=jICeWyqkAZs0L7quHtHDRmJelofedtvCI0fds/lkKX5T0jqaWJCyzp00CzUU3ORS+Y
         vXPogYoesglt7AusQz48auiEFXA7pP22G5nAbHHxcvq/OOjWUupsO2PGIXpk8/Kix6kC
         H66AxNNSnd/TMScenuu7WOrxfZeeWxhKgsvmG1jbAzAynJqPxcquyNvVBAtNKA8x06dv
         Y/Fi0KF7gf8bHAygHqBz92Cb8oG1+wiOjfbLx4TVhx0JMLbcygDgY4dPCYpboxGrAFlx
         gQ3lVuDqN+2DfqChjvMu93ZC7tMKi+zet2KBpP4SBcTN5RwSYz4xOa/S+57SsfWAjITd
         uWbg==
X-Gm-Message-State: AC+VfDz9En5EAEV2edH0mtCRTkcXvyG++6UH5KLnqGiMaSikNEZP/DhK
	6laRucCfQhjDKilNU0lgjorgqys9zU6hqXI8MDieqw==
X-Google-Smtp-Source: ACHHUZ4vHFPYr3XteL6OVBxr3sfjSsd2NrUvpo8AQLiFMWwfzIDeniQtS3efGU7DsGoHFylfwTLFONOliqHDKMSojjg=
X-Received: by 2002:a05:622a:181b:b0:3ef:3083:a437 with SMTP id
 t27-20020a05622a181b00b003ef3083a437mr34609qtc.18.1684350549567; Wed, 17 May
 2023 12:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230407215406.768464-1-ndesaulniers@google.com> <168435014337.2056649.7592777028793700479.b4-ty@chromium.org>
In-Reply-To: <168435014337.2056649.7592777028793700479.b4-ty@chromium.org>
From: Fangrui Song <maskray@google.com>
Date: Wed, 17 May 2023 12:08:58 -0700
Message-ID: <CAFP8O3L_RsaTMJvT7hmjD6ON49uob9Fb4mWg8ZUav_Y-FCgTMA@mail.gmail.com>
Subject: Re: [PATCH] ubsan: remove cc-option test for UBSAN_TRAP
To: Kees Cook <keescook@chromium.org>
Cc: ndesaulniers@google.com, masahiroy@kernel.org, 
	linux-kbuild@vger.kernel.org, nathan@kernel.org, 
	linux-hardening@vger.kernel.org, jpoimboe@kernel.org, llvm@lists.linux.dev, 
	mbenes@suse.cz, linux-kernel@vger.kernel.org, trix@redhat.com, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 12:02=E2=80=AFPM Kees Cook <keescook@chromium.org> =
wrote:
>
> On Fri, 7 Apr 2023 14:54:06 -0700, Nick Desaulniers wrote:
> > -fsanitize-undefined-trap-on-error has been supported since GCC 5.1 and
> > Clang 3.2.  The minimum supported version of these according to
> > Documentation/process/changes.rst is 5.1 and 11.0.0 respectively. Drop
> > this cc-option check.
> >
> >
>
> Applied to for-next/hardening, thanks!
>
> [1/1] ubsan: remove cc-option test for UBSAN_TRAP
>       https://git.kernel.org/kees/c/08e4044243a6
>
> --
> Kees Cook
>
>

For this -fsanitize-undefined-trap-on-error, I think we need a v2 patch tha=
t
tries -fsanitize-trap=3Dall as well.

-fsanitize-undefined-trap-on-error has been deprecated in Clang for 8
years, and at some point we will remove the option.

GCC implements -fsanitize-trap=3Dall later, but
-fsanitize-undefined-trap-on-error is documented as deprecated as
well.


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF

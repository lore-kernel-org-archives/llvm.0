Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C625101F2
	for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 17:47:44 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-3f866383b25so9483571cf.2
        for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687542463; x=1690134463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qEXPbdvOITtF78jwrTXORqWaGEAtN/sfBgbj8S0W5w=;
        b=O6ASrmx+PfXHgCskz1yP04s3WLd6KJdj6j0igWHXefGLr6bwoNZBmFGB2jmEKCEG0D
         P9VkBpcy3HQIc+Qm4HlQb6HupIZuyxqmSK6YYj+Gb16/lVqTcAcPALKzHFi1ubJuZrsM
         cNaDVhKmHms6PjAbWoJ0As6JtWQpURWIX+XKkKpDM8qh+hIZfivcn7sIYmkRaeJY2kbS
         rRn+G21GikGG7445s7v8zeWJNNbQ36EN4O4jHr0PETlSXtt4hnOF4gh7qN4l8lgKaEdn
         4QjS2NyA8frDsQ3j0AYHdcjAAjvQiEhP1atwUcXZvqpc9bDTr8uUNRNNmgV3KgwYzbh8
         o9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687542463; x=1690134463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qEXPbdvOITtF78jwrTXORqWaGEAtN/sfBgbj8S0W5w=;
        b=dh3I9tUpD1n65A4QBW6i//+Vw0uerZNMysHi7zE33yjwybAk1yodCx/KP3ds5aHMCY
         Lg8rhVXVP6vhwuwId2FET12e7INEkqUyx0/tJKD+iumnsCziFqQm8Synbf8evJMBJFvY
         HXLf3uvV42xpl/0xl7Zpb+9jWPHX7GKUoUrx9bGlZ6/8+M0Gr8uzeMRKZ4DMU+In8tpQ
         Hi0QnKOYB8IcIliEZKF+4DrV03u3oL07GzMkOuvdx7fLTnHFS6+Ra7hgT/Md/Fi4u1gx
         mT04aWnEMjtWly4/aecV3VUmRKV603+DEsvNc0J36nLpidlCFnZ6lp39SNBfXxrhF7ST
         q1RA==
X-Gm-Message-State: AC+VfDxm88MqgDP559B+4pL9vNqMVZ8ztFt8jn2lTIXeMcSNT+L2iMNK
	cRdoR+/3jS7oUHa42dfzdPsaxKjv5kN8dhOLv2auDTPh/DvlyxmTsNI=
X-Google-Smtp-Source: ACHHUZ49Lngv6h7bS98lDoHYzgXRiJrDLyQL+764lfL6TFT3JL4w/mg9E39Nqha7JyAQW1pR97F1nbLXTXwKqUdIQwA=
X-Received: by 2002:a05:6214:226b:b0:62f:f276:7a39 with SMTP id
 gs11-20020a056214226b00b0062ff2767a39mr30296315qvb.11.1687542463036; Fri, 23
 Jun 2023 10:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230623001140.1111494-4-samitolvanen@google.com>
In-Reply-To: <20230623001140.1111494-4-samitolvanen@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 23 Jun 2023 10:47:32 -0700
Message-ID: <CAKwvOdkMkXYKUKmMdGG8B+afHWEcJ=SBZAZBsu2b8ojGZw86=Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix CFI failures with GCOV_PROFILE_ALL
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Joe Fradley <joefradley@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 5:11=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi folks,
>
> The following two patches fix CFI failures with GCOV_PROFILE_ALL,
> where the compiler injects indirectly called functions to object
> files that otherwise contain no executable code, and are not
> processed by objtool or don't have CFI enabled. This results in
> missing or incorrect type hashes during boot and when modules are
> loaded.
>
> Sami Tolvanen (2):
>   kbuild: Fix CFI failures with GCOV
>   kbuild: Disable GCOV for *.mod.o
>
>  init/Makefile             | 1 +
>  scripts/Makefile.modfinal | 2 +-
>  scripts/Makefile.vmlinux  | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)

Thanks for the patches!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
>
> base-commit: 007034977130b49b618a5206aad54f634d9f169c
> --
> 2.41.0.162.gfafddb0af9-goog
>
>


--=20
Thanks,
~Nick Desaulniers

Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AEC11C80
	for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 20:39:24 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-3fde1d6b1c4so11021551cf.0
        for <llvm@lists.linux.dev>; Fri, 23 Jun 2023 13:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687552763; x=1690144763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtZOBLXx1qaVh8dEPlOQudc9UC+Jo33p6yGPUYlrsSo=;
        b=DjWYIE/gzUN0Iiva7mkvSSuTrCrrIFG8+k9bfhLiENXZkHv0LSIRyQV0CuChbMfFTm
         4XSOIKNbfzd17E1SrZaTFUnAK5r2Xto887LdsWzt0fv8zc62b52Q8Z2eUB00mpYhgcRO
         bWbHk+wzyFGPDcE3AVUhrqiEWJwLl8WMKYzfzcDRLojb49S4oKYZNbBs7c/tsEfEKjyz
         Iay+x8Z6UtF/8ZP5ziuj5VMwzouWdrJ6SIbaqVPE5JnHoUibJhC8vHHs0fCZyvJjAiZR
         DRuJ0HBURTHIY6tpRH7FpoYKCTsR01ENJ31VSTIKCGbqZKIlZgfL2p7cvhAN4WZLqRBr
         n50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687552763; x=1690144763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtZOBLXx1qaVh8dEPlOQudc9UC+Jo33p6yGPUYlrsSo=;
        b=IEKcFcAb2A4IbDAQS4rY/EGxThd3f8Cwa3333lpYmNK0TEtDrS3A70xQuxWbyJ5/Xe
         vDR3VOy7hUMYtGxf6O9CHZtaOuMOCYZHDKVLTSjzzZ+4HN+f8b7Hn+4br+QbEgTSLG4m
         mV+cfyU5GAEnQHOA7yS78CFdLhjUUwBmU1B2GgO86eSEg6usKPqVnELjmn6LMegMke16
         Q5opAApQBcT9uzttOncGM2DXu1Ido9rNqfTLVpcUj7eKTmq/3d81oSIpJ5iv89dAsVuH
         Vxm0tvhQ+YhEIk0IBTlkSQYjl18SFzJI2gHuP5kSIUPPk17KZ2vU6NulaN4Fx1m7+o30
         YnbA==
X-Gm-Message-State: AC+VfDy4t7+1miXH2HrgGPO+twyBfQlOE7a60j0Y6b41Klbuo3KnJDI1
	yc3199b7iI1IjV7h8Gzzqe8JX11sXTITnQeTh6NCYbty9zuOy8vxQdI=
X-Google-Smtp-Source: ACHHUZ5C+T2n2aljTSPuz46L0evX9FbO0qx+MAMVKiVyMT4wrARHms0ylsHGzLcHQiWlg0CE6es1Md6wWggP55Pgz9w=
X-Received: by 2002:a05:622a:1708:b0:3fb:426f:19c0 with SMTP id
 h8-20020a05622a170800b003fb426f19c0mr29888257qtk.29.1687552763059; Fri, 23
 Jun 2023 13:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230623001140.1111494-4-samitolvanen@google.com> <202306230932.539C9DC0@keescook>
In-Reply-To: <202306230932.539C9DC0@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 23 Jun 2023 13:38:45 -0700
Message-ID: <CABCJKufmB+MwjEu=wjina1-F0q9vT--ig=SyLAGuXQViLV_1Uw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix CFI failures with GCOV_PROFILE_ALL
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 9:32=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Fri, Jun 23, 2023 at 12:11:41AM +0000, Sami Tolvanen wrote:
> > Hi folks,
> >
> > The following two patches fix CFI failures with GCOV_PROFILE_ALL,
> > where the compiler injects indirectly called functions to object
> > files that otherwise contain no executable code, and are not
> > processed by objtool or don't have CFI enabled. This results in
> > missing or incorrect type hashes during boot and when modules are
> > loaded.
> >
> > Sami Tolvanen (2):
> >   kbuild: Fix CFI failures with GCOV
> >   kbuild: Disable GCOV for *.mod.o
> >
> >  init/Makefile             | 1 +
> >  scripts/Makefile.modfinal | 2 +-
> >  scripts/Makefile.vmlinux  | 1 +
> >  3 files changed, 3 insertions(+), 1 deletion(-)
>
> Nice hunting!
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> Should these get Cc: stable tags maybe?

I was under the impression that Fixes: tags would be sufficient these
days, but agreed, explicit Cc: probably wouldn't hurt.

Sami

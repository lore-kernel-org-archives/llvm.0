Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339046AAD
	for <llvm@lists.linux.dev>; Wed,  8 Feb 2023 18:04:32 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id p26so53062619ejx.13
        for <llvm@lists.linux.dev>; Wed, 08 Feb 2023 10:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o2JJ1Ee32hzIiRwEE/z4UpbV3JncQtbQL6qzEOH/xcw=;
        b=oGMMmYh4GkhTX0eNkyArCY6BqW0VDFr1Kr7e2SS9bF4awixZHelJSp+hS3Y675NKyv
         7WToDTwrYVIshTFAv0oRAWjywd1yycWgTlOFWjV6HiFNXpUeRq9x2uFbNdrZbnNGiw2T
         d+on5n3MUTrinBoN4ycNqccuzk6QUOk7ZGVtXcIm0A1pmbtdDbw+rTaMeQ5mPqMlb1ta
         m5phSMCmSJYbb6CAdCPgJAZG2eUZbhqlycdK1rvYjHt9kFcKvMc7tfdMJvEr1UWZCYlL
         828yZKtyNDqbAR1eiItaby0ew+FUeAFxXrqaRIf9wkvKgTyv2MHuz8jNLT8UgwSTs755
         XDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2JJ1Ee32hzIiRwEE/z4UpbV3JncQtbQL6qzEOH/xcw=;
        b=hGIoJ5TF1/DfEwCth945Gbh4sPn/sT82eFqn2xHAYIKMcL+BLrR0ZoNzvz4C9EAdj1
         3eg/wHcYBb348QCgPl7P9lVdvfLV5QKmhk9GO9teX9Q5MZW3oIz+vB5c/SXZ5Ly1Z7DE
         pfOfxVBW5+dhK/pEeDCVyvXmB8F0vbYofvIdP+qddVdnuek8hM9+UsZbs0iMrCqVqdGg
         hreCeAUd77mjsQ1RUbaJFa6EEQUq22L3wP/mszFoDGnq+57DOENqmeOKkxSqoZ1OD7EL
         OeMdwSHdjNpwTggzE8Zfmw/NxbdkpboAfTkm5oL1n6XH04axGujxg/SQmaEojQ/S8VDQ
         mrSw==
X-Gm-Message-State: AO0yUKUUmNCdKDpwdy4fU+XcSoeDZltkucSC5dpKb5lYFTvUMsLgVZYy
	whC4/oTvz9X7P5D8SafXN+v5/0LbMrkTok4s37DO
X-Google-Smtp-Source: AK7set/U+12GtAsfcKzD0M3TSL32ji0RZ/tnZtOfMOCEijGlqV7ApAv4stR7at0qeOETNwX3hFK0EmuNR5tP8WJ8UDY=
X-Received: by 2002:a17:906:7f8c:b0:88d:3f80:d57d with SMTP id
 f12-20020a1709067f8c00b0088d3f80d57dmr1507150ejr.302.1675879470272; Wed, 08
 Feb 2023 10:04:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230208065133.220589-1-ebiggers@kernel.org> <Y+Oyi1eZqKtqbL40@dev-arch.thelio-3990X>
In-Reply-To: <Y+Oyi1eZqKtqbL40@dev-arch.thelio-3990X>
From: Bill Wendling <morbo@google.com>
Date: Wed, 8 Feb 2023 10:04:13 -0800
Message-ID: <CAGG=3QW_uRuL_WPHbHOWs0zKROxfcgJvvY-id1XaTbNGx-sD=w@mail.gmail.com>
Subject: Re: [PATCH] randstruct: disable Clang 15 support
To: Nathan Chancellor <nathan@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-hardening@vger.kernel.org, 
	Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 6:32 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Tue, Feb 07, 2023 at 10:51:33PM -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> >
> > The randstruct support released in Clang 15 is unsafe to use due to a
> > bug that can cause miscompilations: "-frandomize-layout-seed
> > inconsistently randomizes all-function-pointers structs"
> > (https://github.com/llvm/llvm-project/issues/60349).  It has been fixed
> > on the Clang 16 release branch, so add a Clang version check.
> >
> > Fixes: 035f7f87b729 ("randstruct: Enable Clang support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
Reviewed-by: Bill Wendling <morbo@google.com>

> > ---
> >  security/Kconfig.hardening | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
> > index 53baa95cb644f..0f295961e7736 100644
> > --- a/security/Kconfig.hardening
> > +++ b/security/Kconfig.hardening
> > @@ -281,6 +281,9 @@ endmenu
> >
> >  config CC_HAS_RANDSTRUCT
> >       def_bool $(cc-option,-frandomize-layout-seed-file=/dev/null)
> > +     # Randstruct was first added in Clang 15, but it isn't safe to use until
> > +     # Clang 16 due to https://github.com/llvm/llvm-project/issues/60349
> > +     depends on !CC_IS_CLANG || CLANG_VERSION >= 160000
> >
> >  choice
> >       prompt "Randomize layout of sensitive kernel structures"
> >
> > base-commit: 4ec5183ec48656cec489c49f989c508b68b518e3
> > --
> > 2.39.1
> >
> >

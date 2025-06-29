Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA3E1E412A;
	Sun, 29 Jun 2025 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202178; cv=none; b=PDg/AojTegRp59Gz/vdVA14rrvKDpQPHFf6kPBSx1nH0rJB1nWb/r18N3pTR7vxq79d9b58vxS/zB9wo8xv9VRCfAWEQ9KDpe9mIMm5H6zsJu8a0o53aYQytbqjvFihsSVjodV49ntPDkPhdjaZApH3ueEfgozNjzVHHXv86Nts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202178; c=relaxed/simple;
	bh=EN2oU54wCuY6GsIt+QUyhoBSYS3VXx7KiRPLz6ra8WY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bImgxyageMLpVkmK90GG7wMIBiYaaHn2FQO/eWX7lQrKhOn3slwxBGFrI8mw40csGTrke7a6kPelvrkrmQOAlNha7kgMOMsW64Ut3JFFwoNgGfP8a9yV7OvRK7NLpUfFffNpRCYH1yAtC7zTP0WxQD9RvDvsfOFuKuo2JDU3Cmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDHhlKby; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDHhlKby"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae360b6249fso340278366b.1;
        Sun, 29 Jun 2025 06:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202175; x=1751806975; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+hIABstLuKTp9oXVilxpuDSR3H6aMNlaV7ZQqsdujA=;
        b=UDHhlKbyBHIbi1wfExw/f14ZZvFdtoMLqbv1ITI96+239BWg4Pok3FMajDeVwUuvf/
         HwOkjh5bZiVPgQ+c5Zn9RqAwDhZmtFAxtyGn8GRELSMlaQ/dVrUj2sfeeavFrgQNB2bQ
         ymUvvYFUQH2WBujq7K4lDIKFAz7Dqetkq0peK3Ek2fInkqlKWp0CTvAP7e1vDT/38RsK
         FM1Mah1lqp/KCV/Vhv/aw01YW5DeZniNmo+tMvejhqAwhDcxpQWBCHKxCiSSabORDdh8
         lYUWgasOZWm/MwuRCWeuUsw9A+xzeBandwYwJlBAfhKddvuDe29DwxWrmgexj0vtg7rq
         d4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202175; x=1751806975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+hIABstLuKTp9oXVilxpuDSR3H6aMNlaV7ZQqsdujA=;
        b=TNzEeYGJYeMlD7ZMGQOJsxsc/k1yrR/blTaWnJxLG8NWIWBS2YqldWPvrfXNAXtSkf
         5UiLUpsDJB1xD7PF9VNKwjU1ydObW3UvtRvUAM7rzHrabCxRGhh4R9zgiCqtyNeLyzO2
         JuInniFXwt5EIysHPzWyoKgoTkA6OEAK1uYZwHn3cuGL0A6E7+VUeU+nSXHSjAaIyBEr
         Ack/ESs5iZXdBpnQ9PSJCqb2eJoeMjOdVw3i+5qMRC0sMKXSF2Ca0ZivSZxYCdy25rdz
         un31s+ftGAGEr/E7m7qoJWoPvjukYH8B71EfCEawdkKSnXH9CpKzCMCxitECpcnRLeSC
         ALwA==
X-Forwarded-Encrypted: i=1; AJvYcCUcHozKCbEWXO0A1KVCcLIVADR1tn3xHoyleERQMhxlJeCuaJ+nzEdJIpjD06+o6UNXKwx6I9O7zc+3T3i7@lists.linux.dev, AJvYcCXo7Dqk1Zl7FKuYCbSS5XfxUZcABgLI86UgnBWP0f+bjyasVpczMcZHaQxfHQVnYaZ+MRJn1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIDd5z9y5dzCxBAduwClk2psdNcVHymYLMo3EBzKjGcuvYNEza
	zkYSMsPzBKxDBphtBwMPIUBHLsBON5VFCQUHjhLrlmCejqgWSksZBK/6a8RUokJJapEpzgM+wR3
	4ggp3MvCCu3Rf/q99mKD1DGhfxhuyA9QcyxwTZH8=
X-Gm-Gg: ASbGncvEkHuwNUeGBvAxoYECO+j/6Q+RlvDqZZhyPQo5apz/HSRjMeTj5MqtssERedc
	x55KF7Qo2g6zwHm8/mNfqxW+GRLX5Jjasy9Kz0myFhGqODTx0em26NvLjMOGIoa6Lg+rsnu9RkY
	ZUf+7i2gQRhAJIyhQmKdz3HHTFUwk6U4ifB/r4nY36U8AlSw==
X-Google-Smtp-Source: AGHT+IGzZG4m5nJ3cy5A11fgQDvb/6qdsnq3/N/EpJ7AuV9uPHGOL2LH30aCHfszUuoqP2ekNSLpiYymPI3meDmevVM=
X-Received: by 2002:a17:907:1c18:b0:ae0:4410:47e3 with SMTP id
 a640c23a62f3a-ae3501a58a6mr976502466b.51.1751202174144; Sun, 29 Jun 2025
 06:02:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250629113050.58138-1-zaq14760@gmail.com> <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
In-Reply-To: <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
From: =?UTF-8?B?546L6Imv5Lie?= <zaq14760@gmail.com>
Date: Sun, 29 Jun 2025 21:02:42 +0800
X-Gm-Features: Ac12FXy0BPQrTL73ahcA03QPM2uG87FF952R6L-TNLWLb0-NWWIF7eGtGwehXio
Message-ID: <CAKEtaPAr6g5bGFwPJZXRHN6p9u5SrUo3kQi6Zcpp7hbFCp-J2A@mail.gmail.com>
Subject: Re: [PATCH v7] staging: media: atomisp: code style cleanup series
To: Hans de Goede <hansg@kernel.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Hans and Andy,

Thanks for the feedback. I'll wait for Andy's opinion on this before
taking further actions.

Meanwhile, I understand Hans' concerns about clang-format changes and
I can prepare manual cleanup patches as suggested if needed.

Best regards,

LiangCheng Wang

Hans de Goede <hansg@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8829=E6=97=
=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=888:20=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 29-Jun-25 1:30 PM, LiangCheng Wang wrote:
> > This series applies clang-format and fixes all checkpatch.pl-reported E=
RRORs in the AtomISP driver, excluding the i2c directory as advised by main=
tainers.
> >
> > The changes include:
> > - Applying clang-format (excluding drivers/staging/media/i2c)
> > - Removing unnecessary parentheses in return statements
> > - Removing unnecessary zero-initialized globals
> > - Fixing space issues after unary minus operators
> > - Wrapping complex macro values in parentheses
> > - These patches focus solely on mechanical style cleanups with no funct=
ional changes.
> > - WARNINGs reported by checkpatch.pl were intentionally left for future=
 work to keep each patch clear and manageable.
> >
> > The full series and corresponding commits are also available in my publ=
ic Git repository:
> >
> > https://github.com/lc-wang/linux/tree/b4/atomisp
> >
> > To: Hans de Goede <hansg@kernel.org>
> > To: Mauro Carvalho Chehab <mchehab@kernel.org>
> > To: Sakari Ailus <sakari.ailus@linux.intel.com>
> > To: Andy Shevchenko <andy@kernel.org>
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > To: Nathan Chancellor <nathan@kernel.org>
> > To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> > To: Bill Wendling <morbo@google.com>
> > To: Justin Stitt <justinstitt@google.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-staging@lists.linux.dev
> > Cc: llvm@lists.linux.dev
> > ---
> > Changes in v7:
> > - Split previous monolithic patch into multiple smaller patches
> > - Applied clang-format to entire driver excluding i2c directory
>
> I took a quick look at just the clang-format patch and looking
> at the bits of the diff which were not collapsed by github because
> the changes are too big, it looks like the changes which clang-format
> makes are useless and often make things worse, e.g. just looking
> at the first diff which github shows for:
>
> https://github.com/lc-wang/linux/commit/8a3bbdba275e42dfcb0af2ddcc2f27463=
bb316d2
>
> which is for drivers/staging/media/atomisp/include/hmm/hmm.h
> then all of the changes are undesirable and unneeded.
>
> so the running of clang-format just seems to make things worse.
>
> I appreciate coding-style cleanups outside of the i2c dir,
> but it looks like you need to do everything manually since
> clang-format is just making a mess of things.
>
> Also if you do manual code-style cleanups please do one
> type of cleanup per patches, e.g. only fix indentation
> using spaces instead of tabs and do so on groups of say
> 10 files at a time to keep things reviewable.
>
> Regards,
>
> Hans
>
>
>
> > - Fixed checkpatch.pl-reported ERRORs (parentheses in macros, unnecessa=
ry return parentheses, zero-initialized globals, spaces after unary minus)
> > - Left WARNINGS untouched for future cleanup
> > - No functional logic changes
> > - Link to v6: https://lore.kernel.org/r/20250627-bar-v6-1-b22b5ea3ced0@=
gmail.com
> >
> > Changes in v6:
> > - Applied clang-format across the entire AtomISP driver
> > - Fixed all checkpatch.pl-reported ERRORs
> > - Added explanation of tooling and scope
> > - No functional logic modified
> > - Moved 'Suggested-by' and 'Link' tags above Signed-off-by
> > - Link to v5: https://lore.kernel.org/r/20250625-bar-v5-1-db960608b607@=
gmail.com
> >
> > Changes in v5:
> > - Replaced space-based indentation with tabs in output_1.0 directory
> > - Used checkpatch.pl and grep to identify formatting issues
> > - No functional changes made
> > - This patch is now focused solely on tab/space issues
> > - Link to v4: https://lore.kernel.org/r/20250624-bar-v4-1-9f9f9ae9f868@=
gmail.com
> >
> > Changes in v4:
> > - Moved assignment operator '=3D' to the same line for static struct de=
finitions
> > - Remove unnecessary line breaks in function definitions
> > - Update commit message to reflect all the coding style fixes
> > - Link to v3: https://lore.kernel.org/r/20250622-bar-v3-1-4cc91ef01c3a@=
gmail.com
> >
> > Changes in v3:
> > - Removed extra spaces between type and asterisk (e.g., `*to`) in funct=
ion
> >   declarations, as pointed out by Andy Shevchenko
> > - Update commit message to reflect all the coding style fixes
> > - Link to v2: https://lore.kernel.org/r/20250621-bar-v2-1-4e6cfc779614@=
gmail.com
> >
> > Changes in v2:
> > - Fix patch subject prefix to "staging: media: atomisp:" to comply with=
 media CI style.
> > - No other functional changes.
> >
> > Link to v1: https://lore.kernel.org/r/20250621-bar-v1-1-5a3e7004462c@gm=
ail.com
> >
> > --- b4-submit-tracking ---
> > # This section is used internally by b4 prep for tracking purposes.
> > {
> >   "series": {
> >     "revision": 7,
> >     "change-id": "20250621-bar-573b8b40fb80",
> >     "prefixes": [],
> >     "history": {
> >       "v1": [
> >         "20250621-bar-v1-1-5a3e7004462c@gmail.com"
> >       ],
> >       "v2": [
> >         "20250621-bar-v2-1-4e6cfc779614@gmail.com"
> >       ],
> >       "v3": [
> >         "20250622-bar-v3-1-4cc91ef01c3a@gmail.com"
> >       ],
> >       "v4": [
> >         "20250624-bar-v4-1-9f9f9ae9f868@gmail.com"
> >       ],
> >       "v5": [
> >         "20250625-bar-v5-1-db960608b607@gmail.com"
> >       ],
> >       "v6": [
> >         "20250627-bar-v6-1-b22b5ea3ced0@gmail.com"
> >       ]
> >     }
> >   }
> > }
>

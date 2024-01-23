Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964C782D6E
	for <llvm@lists.linux.dev>; Tue, 23 Jan 2024 19:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706039917; cv=none; b=snoTWLnzBngqjjI5vzYfIzFgCqYonKmiv7Dnff98a21sA81O8m85MCKYPh5t3JSWY6QkIRk7gtM+aeCnjBDVuI1vJcvhq/xzMtx6LbOpscd2Zdl9kyiR9JPyifZZ+7bFeetvWCq7bjiDujBbGz3/AbDnMMLE+DW81UhZfykJjyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706039917; c=relaxed/simple;
	bh=nYvo+rfNB69fdGKHBcdMDR6KR35HaCryt3kDT3duWoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtmWiOIrORZ+nNgz47JUMTU8+TLMPYxMQP0xLB/q+1/PxVDGcIQ24Uc2i5lJ60DjCWw8RsaTF9YytXs0ENMFwSmcfni2mnmPsn1wQXAsnM7wpYx02+RsQOaXR5bVXxNDHC8iXKa1ChP/Gaf5rN5Vv+9lUvB22fL1ndmz9rzEF54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R++Jdfu4; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R++Jdfu4"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc24ead4428so3158119276.1
        for <llvm@lists.linux.dev>; Tue, 23 Jan 2024 11:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706039915; x=1706644715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYvo+rfNB69fdGKHBcdMDR6KR35HaCryt3kDT3duWoQ=;
        b=R++Jdfu46WQZrBDr9l5Vp2Ec5nKybCK5vdg6CtliOrGpBau6rMTwzHe+J9UTJBeLiT
         YSoiAZOVKkruNH6Z6jMHrwcvrMSpO3Vm+iDyB9EO3TbB/XFAzZL/xpqlOohvwddtjaYS
         COfTBXGbULcETkNUEB1DEwWH0VbP675nj0FkHi9bmJktPISpKT59cdbMn/o96jAimG5D
         YLTdVtcDI0itBOB3fW8vQdQDnCzmT9sJfvgERqaUMi3GSDwDxdKVoHfDFgUc8h/8Oeh/
         CB0/BzEVVjWRhDrB+gFHC9ldo/llkqTSugkQS9B07Co/vPGeThIFXQ6sjH+TLiCv8788
         b6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706039915; x=1706644715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYvo+rfNB69fdGKHBcdMDR6KR35HaCryt3kDT3duWoQ=;
        b=e3SKhreQfrzcsmOR3wCoqAybxwegQL0qiyo/IDaenOgaY96RE2mx05bJ9swe3sIYqm
         VMdfkxztoFW5tO2mg8WjIw1nnLOBux2hGrS6UiuSLz8wDD54UwzV89XRQV1ERRXoL6Bi
         5G4n9QI/A2+cZBVGcPaUI4c6jmMfk/MHJSNE8r/o21dj2gzRZbGRCk74SkN4t7LTQLJh
         J1adonvy/tQoRSj4weOVTV16Gho8UP7jch/B3aEmndF4dcyF1jTKYTno1Xd1gvWAMXSU
         bjbuLK9vMyezwW/WP17fERB5DNT7dlX3XyMnZWAA79/ZiJ0SZ7bSokL6paSKmxBgfTIf
         mIGg==
X-Gm-Message-State: AOJu0YxsbtXVl4OsFylzsxXVpQDwUKWrUhYDOzoS4zK/mPn1PGara2cS
	Xwufsc/Au9XEA6MuDiDZQXXN9rWUxqCna4X2dEq9zJ9YJk/PWjOycQF9QZfBia6o1mcn6wLUiE/
	jXDpspJB/EbI0V3QxASVqfPe9niw=
X-Google-Smtp-Source: AGHT+IHGoSEchkymg5ddhczryrZhgHLXWuEEwXlE6/ePL8YyPjoBb9/I9QQxbPyGzX8/yCnShMQwB4Yciia010VzKCo=
X-Received: by 2002:a25:2fce:0:b0:db7:dacf:6206 with SMTP id
 v197-20020a252fce000000b00db7dacf6206mr4150549ybv.88.1706039915535; Tue, 23
 Jan 2024 11:58:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e1c27b64ae7abe2ebe647be11b71cf1bca84f677.1704855495.git.senozhatsky@chromium.org>
 <202401101646.B1C4FDA@keescook>
In-Reply-To: <202401101646.B1C4FDA@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Jan 2024 20:58:24 +0100
Message-ID: <CANiq72nQsBvNFnr3Rp9aX17X4=G+jFQBB-7Uv3dXY3uKN+3xcA@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] Compiler Attributes: counted_by: bump min gcc version
To: Kees Cook <keescook@chromium.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Gustavo A . R . Silva" <gustavo@embeddedor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 1:46=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> Yup, this is good. Miguel, I can take these patches if you want?
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks Kees -- just applied them on top of v6.8-rc1 so they should be
in -next soon, but if you need to pick them up for another reason,
please go ahead.

Cheers,
Miguel

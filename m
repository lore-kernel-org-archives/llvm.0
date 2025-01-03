Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC24185935
	for <llvm@lists.linux.dev>; Fri,  3 Jan 2025 20:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735935151; cv=none; b=e1T9Zh6yNjKsj7X19PHqhNVhO+YQBFiwDgWTQW0YxiJemwoEIyp04fwobXmNlaBNi1J2fcJgag/7RqhmEqZynQYGHGqPKwr1BKygLiZaRfRCy4V3Dce5ETtEVfOxS+0NjCXWLkKMPbIsL9wwcUDfITXTIXUHiKQUQC6XQOn8Nbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735935151; c=relaxed/simple;
	bh=JCzV1NWfuf4unN2nk8NJSOMhoxf3M6FEsxvPcMOPhdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yjk+VDP2iXh6aqruK5qXZR6KGt4Izqbi+MOFfsEqYUU0k+3e7C6AOZjbnjgzq0jxZwu0U3E26MVxnN47x/b3ILVTK+yNzHkwx6jxFL2RTpZlABT9sYQiN39OXuLrxJQv4Xessvp33v6EOZLu3OycpjMBf8I38yYUWlPmdonQrW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ke92FbW+; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ke92FbW+"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so15882256a91.0
        for <llvm@lists.linux.dev>; Fri, 03 Jan 2025 12:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735935147; x=1736539947; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2Luw2DINIQTTEGEL/uyBPOt8+ZF34Huq2NNPKvNTdA=;
        b=ke92FbW+vXcyIBxBaSf6VJcRBwUpSQugQkFIWmbcuf4nnEl99X0NdeXpqJtSfs8pSn
         OW+WsIOWuCRQB8QBK0N0sNYDnoeJrjMKmywhwEMtXcvVMPlD8a3cH+gUmTl+cmaqUEAb
         i97M3GBVog7H6hGEg1X9gXvcRHm13/hHNWctZn+FR4Uj8MNc78l/z7qfwOwTFjD2HSub
         YzuATw1TeFwaBRjGh7QlEH3qPwSXsoqRrlyVLuKJ72foihUqPtTlrS8Z4oK2LJH7Hb+f
         hS87uPAudp+X9bOPNTqvb2e+B1WOOjTMlkAny/MaxmA8Qb17rUIOGnbSmqerjqfNbC12
         lWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735935147; x=1736539947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2Luw2DINIQTTEGEL/uyBPOt8+ZF34Huq2NNPKvNTdA=;
        b=StLH9jyDDKscfwgKQkcA4JfIbm0ZwIJapNqMClXp7tZA3dmg2Oly1XoEPv9ZftnWWt
         J9wWvOX15kjLLx9859potTi8REcmkNXdNhAT9E1Q7xT93HHXuK2NjU6K6SSCHW+voWrO
         GCa7nB/yHjOKaKgy/CJ30f5JiEiudLatUp7cDc9acT6uVdSX9r+FCXgaIUqo1Deq1l+W
         ZTJ6DuhjfGer5k/mW3mETn7iAyyV3A0rFO9PlzTX+JOkGfDn4hiCA49N9hV6mlqlg+kA
         xmbdegO/uVfH4+Bx5s8d5lScdqvaeezCtsuu53pW4+wPZtkpd8vqEXnOdWCQWHHFr1fR
         SYcw==
X-Forwarded-Encrypted: i=1; AJvYcCXsAtbASjIiwqu7UMZIlJfC2kZ75QcPb7Bkx4UaGUKERVmXIRsELbJP1sUt7BkuRA/pvKwp@lists.linux.dev
X-Gm-Message-State: AOJu0YwgKvphq2EuIntrMcepclTK8iVrT/T55TjLspcIbKUvBczpjUfm
	fNofM6kfwBtTCc4uMgyvVXB/hCyxrbi95BQrs++aifgzLK1YOeQutfiFMZNWoH7Quq7iowDxuck
	vhiySLoIFeOVoxrKGICV8FhgCRpXO/5+7
X-Gm-Gg: ASbGnctw442bzfwhh2hmvYhae1T9SxwRb7D0SJ1oCUwvXXRJRVMO0CzHjT90ZnDNYYw
	iXzDGE+aXo78RTiqDEi80UvgAYnt3g8haeiLucA==
X-Google-Smtp-Source: AGHT+IGIvfnFKdwJ+ZFwJvvl+sBsVjkzs1CEt3tgv/ORIAc9/cq0w/2brKNfQaBja+q/j3KxBHXbS6o0nFSidbj/xTs=
X-Received: by 2002:a17:90b:2c8b:b0:2ee:edae:775 with SMTP id
 98e67ed59e1d1-2f4536030e3mr71461546a91.3.1735935146656; Fri, 03 Jan 2025
 12:12:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241216164055.96267-1-cgoettsche@seltendoof.de> <20241216164055.96267-22-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-22-cgoettsche@seltendoof.de>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Fri, 3 Jan 2025 15:12:15 -0500
Message-ID: <CAEjxPJ7NdTWu4dspY9cbPMtRsW_jERoRbKBsObbvsEnwgmZ8Ew@mail.gmail.com>
Subject: Re: [RFC PATCH v2 22/22] selinux: restrict policy strings
To: cgzones@googlemail.com
Cc: selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	=?UTF-8?Q?Bram_Bonn=C3=A9?= <brambonne@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 11:42=E2=80=AFAM Christian G=C3=B6ttsche
<cgoettsche@seltendoof.de> wrote:
>
> From: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>
> Validate the characters and the lengths of strings parsed from binary
> policies.
>
>   * Disallow control characters
>   * Limit characters of identifiers to alphanumeric, underscore, dash,
>     and dot
>   * Limit identifiers in length to 128, expect types to 1024 and
>     categories to 32, characters (excluding NUL-terminator)

One option if we are concerned about breaking backward compatibility
with policies in the wild would be to make these restrictions
conditional on whether the policy is being loaded into a non-init
SELinux namespace, similar to:
https://lore.kernel.org/selinux/20250102164509.25606-38-stephen.smalley.wor=
k@gmail.com/T/#u

That said, it seems hard to imagine real-world policies that would
exceed these limits, and likely could make them even smaller.
But as Daniel said, we should make them consistently enforced in both
userspace and kernel, and potentially these should all be #define'd
symbols in a uapi header that can be referenced by both.
Looks like you left the type limit at 1024 despite Daniel's
observation that CIL uses 2048 as the limit, but as you noted, given
the page size limit on the entire context by various kernel
interfaces,
this is likely fine.

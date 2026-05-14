Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67333314C5
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 05:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778736899; cv=pass; b=WWAyiv9X3aHsujZHId0vYZYCtCnLhwhMAO8o4I6fd5ac0oztWu6MyQnmp7y0csvxUh+Heefs6DaeNIAaunbnhU244ocQ22n4oI5FA9uF/RCqeoKP5vSSDhKBuWVUgVToKQBXtxuyHK9Ll7VAnZWliXiQATF/t+2D8ZmplgshScM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778736899; c=relaxed/simple;
	bh=LI2uQiX1c/C+6kF1oi0rst1iJDuzd442XbGt5etALnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N22YJ7R+AcxWpEqG62UpDHU6t6Vjk6yOeVaT50bfFmny/R63ND499abwoDYC4Vw/w/j9maMmnTtN97RRA6nCQPf0ftSGHWZeSVtiSwyvx8e9/Er/iqDD8PUO1IGvevTb6zQZ75L/mBdiJAouXYbqAXVc88zpW1yt8N1S8dfrWG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRRc6l2i; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRRc6l2i"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so1357090a12.1
        for <llvm@lists.linux.dev>; Wed, 13 May 2026 22:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778736896; cv=none;
        d=google.com; s=arc-20240605;
        b=gOkLQ04DvYzb9HDt2VT30ZsSyprsHs1LD5QZUnch5TrpAU/cDcX94N6YkbzoPpb7lB
         9QdEEcTqgF1JFq5X67bwOZkkicIlI66gY0q4S80tJ40mnlSwuWJlKwy7wBGYeHmWiY9X
         OL24bCjf7MM5UxYw1eETs2dFSG0css3cocZunAHlTnpBCvJeaz8umHuPkRojv6rDCnye
         xGx7cFDgKyxzNvjIPDIZ/zVMmYvGrJzv/sk9zcD4PjoYyHcqorwbA5MfOlwlanF4tSl1
         SLZFIxj41/f/lr07vVkt+9bec4KHeyQEAFyS13uM+AU0hyDFCqyD+0uFEc6aoFz84i3z
         Du+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xtenubrnHd/7okEMU9AwV4hJhC5AhgRcEvRa83caoZo=;
        fh=/56T1aYOTy7lOvYOUdzglSOtaDyqgQp4HJg2GsKNDck=;
        b=BbthKPM4VzMKZX463uIOUUKdKrr+AFpMb6n7yWr9NrmtwlLr+z5Cod+ZC6WKgrG9cs
         i/agQ/9B4u/jarzUnOydL4csJCrGxuxup/0j+mJ0Iliue5D6M12HawyPdkrCwrVZx7Px
         qyAcgKcXfpluAZ4eH+ecNWYWI4U+yhrPA93E9DJESveEA+f9K7Ue0ZzZEaQP1+LAOPl5
         Ib1TQSpNt352wThUPKoASjj0FD3xoMS5mVAsOF8CvnYM2ksDutnI90CuaAVvsynt9xLo
         cHICdmgkUgLio38XBFuggnEcSFk0vUsPzI2N53Y/Zo2W31TWQp34kkHqaY2jgXXsz532
         wRuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778736896; x=1779341696; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtenubrnHd/7okEMU9AwV4hJhC5AhgRcEvRa83caoZo=;
        b=sRRc6l2i+pIAEbGtQ/44rc81OirSfDepQwfxZmYP/b79ILJNPM9IXwN2BSTqrpW1px
         81knDHDRXWz07c3QV1Cu38vch27x7hb4KiX9UWfoe0mvtfrOojsgCAQisJrkRwfT0cUd
         dttn96Fib48YBpO9X7JKD28+vSBEVs37VtoQV0qajjwDmyzyevQeoIDuiq3OUoBJPJ64
         6OvWR96KMqmr1S7OWwew9Zdml5Kq0DuwuJ9GfNy3GZjSBl9qzRPfvrtZyU9ckF+/7m96
         MRyr1KAPz5SBcyZER6tLiAZMeW+mQgTX3u1mBLq1DPnpsXL7Um3vuPtIYRloos7SPjVR
         uNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778736896; x=1779341696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xtenubrnHd/7okEMU9AwV4hJhC5AhgRcEvRa83caoZo=;
        b=sVRx7Pjv8BMQTsxNyT/E2bW1eXQ+lvmD56L8I/rD1lSYUlYWfyuA8wTvWVha37Gqi4
         OTsL5bn/JGwDWZ/iEhfN+9bPpsBLFtj/mwFurmUfwisr47687CEDn0q1K/dxnkbRkGY5
         UITgUmXKHbIApRTWF1lNoetyvNx5Wo+zrGhkqT3XmEXCB7GqVs5oZC9zX6YJ+wLdQpRd
         n2kRMmscpXqwnDQVX9KMPMKQTIuLQjp9lfbahSJ1no5c5Z6mtzylsdUH9jN44aFuOyhm
         i4f/IYznb8SvjGPK+NKBSPxjnPyQuguRv5W8dzARxQGqrU3ElMnZjMbUUvpVL1FGvJNE
         EQRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5Q1KgNYbxNPm6E8NDktY0VxLPiZ7wsikMVfqRphjNxVwcB5Wb5q+jLXva33hvViusczD0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0gEAVnyNax9qC1sy52YAX7LRbCpfe0DT33DDwri2mlej2D9dS
	BsQha5NaBn4CJP63f7JNuV0Cv1ZE47C1bulGdF941dpcQ/m5AKX9JolmKbEnKW3dq2HhkIMYEMx
	H8Re8YZYTCzU8vXBt3WhHafb17FV2I8E=
X-Gm-Gg: Acq92OGZrJZ+WoIlO2gYpqsvQtQ2CGmacbwHeI5YhXKBkSlHD1HujH84V9v5SNkvhr7
	7n2NeqwQrdMs6m/mquBIjl1MH5BeMrJBfWXDzbs7Sf5Fv/qOAQelN/xOX7yXbBWpVBaM1U4GwVi
	sSgGvZTIRNGXDzOl12dtxtc5ihuy3wG/LhmxURNzBaPTESmQmYsZMRVYiKTdg+7CE2q/svmwot/
	AJefW8JUT1r844i7z0gnvJZg+2MJUki21Lhbe0RwO6GIKxgU3ljXDUF2bCH0/y2gFD/h3v8c3e4
	9bm7z8oNcpPAgcyxLE5B/T0XKglpgpqIaAHcW1ALp9ikRFOxs+XG/bUqnQJnfbAaQVKyMzhas2u
	70hbdM7vK8wOeGsP5aHvWDVFiD2CCWBjFhc30YHoBEVXRI9yKZwh2qV8wkg==
X-Received: by 2002:a05:6402:3251:b0:670:8d21:dab with SMTP id
 4fb4d7f45d1cf-682a780a6eemr2482315a12.24.1778736895824; Wed, 13 May 2026
 22:34:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514041908.874355-1-rosenp@gmail.com> <f8a58a8d567149f514f2f5f47af25905f254f72f.camel@physik.fu-berlin.de>
In-Reply-To: <f8a58a8d567149f514f2f5f47af25905f254f72f.camel@physik.fu-berlin.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 13 May 2026 22:34:44 -0700
X-Gm-Features: AVHnY4JKGFtMc7HLQqgstk12QDdcDoNuca3jknYjanpMtySQzdVFdmm86cn8OXc
Message-ID: <CAKxU2N_p7unDCif826jpTUtzs8=-ZoKw4u-Eg1UEM+4o+5Fbzg@mail.gmail.com>
Subject: Re: [PATCH] sparc: Avoid unsupported LLD branch relocations
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: sparclinux@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Christian Brauner <brauner@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:\\b(?i:clang|llvm)\\b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 10:03=E2=80=AFPM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Rosen,
>
> On Wed, 2026-05-13 at 21:19 -0700, Rosen Penev wrote:
> > LLD does not support several SPARC branch relocation types, including
> > R_SPARC_WDISP16, R_SPARC_WDISP19, and R_SPARC_WDISP22. A sparc64
> > allmodconfig LLVM build can therefore fail when trap table code and
> > low-level assembly leave branches to global symbols for the linker.
> >
> > Use local labels for branches that stay within the same assembled
> > object so the assembler can resolve them directly. Convert the
> > remaining cross-object branches and tail calls to absolute set/jmpl
> > sequences, which LLD handles through the usual HI22/LO10 relocations.
> >
> > Disable the unused sparc32 syscall trace entry points when compat
> > support is not built, and request sys_llseek for the native syscall
> > table so the LLD allmodconfig build remains self-contained.
>
> I would rather fix LLD than making such intrusive changes to the SPARC
> code in the kernel. In particular, since this touches the CPU-optimized
> memory routines which had been haunted by subtle bugs for years and were
> only fixed recently.
>
> Is improving LLD in this case not possible?
Above my paygrade. I use this so that allmodconfig succeeds.
>
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

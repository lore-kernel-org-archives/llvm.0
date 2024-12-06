Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3A61B6D04
	for <llvm@lists.linux.dev>; Fri,  6 Dec 2024 11:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733482846; cv=none; b=SBdW8JLALZi/jXo9XiG0pXwSr1uSgi5zT6el8TScHPRADscPaiKVaoXVkYhSnn9QH3WBu7Lqwre8BO/2lAZjAHagNBT98YaQZ9+y7TcU0FxYSeEtFTEzoSZ9phn/sKhvDoRLsNAq2L9FMIoH+macZTap7SQ23758Xs8UFgfZZqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733482846; c=relaxed/simple;
	bh=cQlFajvuHyFsfmxrk4m+vVxvc7Bo/fdPu8CtdTBVCWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJ1iawaQrJmpcGfHBN6iEohaY0ACdOe0dtDL0pW/7FMGsWnQXETWFNDRO8GbbwYGSI+ir7aS/4E1vyiS6PseFZVo4DgxZmfRGkacFWrb9Q7lnWEomKAzfFaBjMdIG0I60JU5N3KbwxDw/+gPQAHmA+LuPPsodwIe8Wbp9bzQiJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xq1WZqrj; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xq1WZqrj"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ea85fa4f45so210602a12.2
        for <llvm@lists.linux.dev>; Fri, 06 Dec 2024 03:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733482844; x=1734087644; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQlFajvuHyFsfmxrk4m+vVxvc7Bo/fdPu8CtdTBVCWE=;
        b=Xq1WZqrjIIiPySSpHROX7vvD+o2Yvx7gBCiJu6pt3ZTyb4jnzY/Kcw3tcp40duncb5
         hdqfjSnh3QuLxmNkZHnKIHXbEjahyvcKO9EJCwToEpU1iTrvxKnuCMC1Vqs30YWCQY19
         GMru2X0dcf9KUYE98H6QbA3snX7bFzWh7pnX5ADk8G78LawZPbZrZu1Ik8+dVEDxiTEA
         WklldE6FIDOxIuZ0d9W/WOS9KvSRL6LRuO1JZM2uwyOprZS0Xvf6iNuppVLwR2u3Lg1d
         P0ZRWwuhfnpJO2Y0jCOHUIXCgSZWxx7BV34L7BNcJAdWRn+MxYskpGvlTQ7imOkfbJaB
         9mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733482844; x=1734087644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQlFajvuHyFsfmxrk4m+vVxvc7Bo/fdPu8CtdTBVCWE=;
        b=BIndPDzB94ROBznaLnMdg/ptODQtB9+pC33a5rmwI8F4C5IdFIjuWaTwstA2eoxt5J
         B/GLqLyo743ntXJR+PZylHFzLgWqktbByVnPhHrLA2qJkYMdbAphq57jU9noY5FkAlg1
         YacFrMSN6BfuMVccnrOPzfnsKYNnUSFG7gag/nR0yDd9IDLYfNTQiEw9HOm0n+lXYpX9
         YT5yYmj7JDD+TP2xoy/xu5bKg4et+w0uLy95SMwStrNagRAQGvjS96tag2A88+KxagIM
         VBDEzsS2T0s/0aF8CkJykHRaDnZ1E/wgQ/jrqNXR2CNRTB+XbT5YTt44haG8MLchxSEX
         +x0w==
X-Gm-Message-State: AOJu0Yxar55urNYzJPqW61jpN2tzEd5Ilk1rkUccv7sGYx7aimdPTsma
	ODjpTM6rC3h0c5C3huYclbPNWrtO7H8Kuimdd2PPVkWJC2wGL4aXgvGsoOtG2snyvlLEV0oEWjd
	QVPWPRoAGHoY6isRDv2aIdXmYfas+xvqz
X-Gm-Gg: ASbGncv6KCz9Xsz3fYcOwLwsTh1JdVWKatG5y3mou3yFGSo2y5flkQkjaKW1nsczWwf
	LI/44jJ4H5IfRuHyeYTpSp9FIGQMEpV4=
X-Google-Smtp-Source: AGHT+IFlTQf96GggNi+tTMsEv+Ohdjf+dgguO6qstJdTsai1UF/MPTMj7RQXJgLK15YYVqvphXUSwHYiM7UuBcTd5go=
X-Received: by 2002:a17:90b:4a49:b0:2ee:c059:7de6 with SMTP id
 98e67ed59e1d1-2ef693630a5mr1590944a91.2.1733482843973; Fri, 06 Dec 2024
 03:00:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241204000652.GA1999416@thelio-3990X>
In-Reply-To: <20241204000652.GA1999416@thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Dec 2024 12:00:31 +0100
Message-ID: <CANiq72mZzevQY=wouBiTzPoC3jn9W3B-kKKsUnaZvTYDLYQ3sw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 19.1.5 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, conor@kernel.org, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 1:06=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I have built and uploaded LLVM 19.1.5 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 19.x
> series is no longer supported.

Works for Rust -- thanks!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

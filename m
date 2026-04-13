Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E900636EA9F
	for <llvm@lists.linux.dev>; Mon, 13 Apr 2026 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776102676; cv=pass; b=HoHhQvsJZ2gzCK6RDPKwyLV0bg82XsOKuBHzRmdgMxqaeY9PXSBwSVFgmj2nvaiENcwkl0oA7MUngGBQPayeEXcKaAHZsSRfvgDzBtgkBIQpZIqEcAmm3S9x+LjbWb6iBJOuFribHhzVkYaBf7cXBMjEtwkkf6UzLt6KKts3xjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776102676; c=relaxed/simple;
	bh=kK9NR0IgY6j5zF8S249PN4+ualmtOPXk+aSV0TH/7O4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgY3HDXigi3ymo0TFkE5RXoRP03tMxQWUxDtbjQUwfpukNhK6zX6o2SRHuMZgrD6oRAlO89/3tYckiDJTJYr51vy64FOQNGKC3gfysZfRXRNCQq4FHIC7daTyZvuq3X352pQE3zqwXpcqhkd8JcHg1S4NdGyS28e/asR5XnEeNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ze3xhlsJ; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ze3xhlsJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso135425ad.0
        for <llvm@lists.linux.dev>; Mon, 13 Apr 2026 10:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776102672; cv=none;
        d=google.com; s=arc-20240605;
        b=heWcea4ZaEnAlb27EHjBFUoaqaSxQymigkVYI4Vy+LH5J6S3vXa9NxsfINZfATzgJ3
         jX0FFmdy95qiyqIMiRnNSp5pbOEl8VzAvh/j40l+HmZMefESjV+W6UgfbNOCDXcYvyva
         Es3OAZ6VF1zxKuCCEWu7H/Sx6ddkgr/PKd5R6fF9nmxfDMo4HQuj0D3FWCuOepRT02JB
         SyJLuodIj4B4Oi9RPkcg97ZHQi+KnRkKWkGIBwyarktmlMcX9oUB9K6Cs+ITnBCW7iIK
         PgGEenPSSv2sa+am1vgwO5cNZFnSuFq5NIoFoGzIdAuimFwnlo68XgsNaG5sIk0bK0pF
         ytcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kK9NR0IgY6j5zF8S249PN4+ualmtOPXk+aSV0TH/7O4=;
        fh=zijQXDZBJdaqcNCmDDOQyOv5L0z5cP7JSF8O1afMobc=;
        b=SOv4b4qaA4Bv9Jx6094TKPCQvizj+RM02a4gkelzJQ5Jz4a4yMikaUu/siTEXcvrwJ
         S/sYt8Khr9OOaDZDBQS6anwcFj85asLw8cUmP4C26NXEdkSnfCQhnOU39BA/w+YvEnBd
         YezM7J/LW52rRUGKIKxqrHQGgtMn8fyWbRamHudGAAffNXtI4W9YVdE7lrxHOQptqVqr
         2xeGYT5COiu9fdWIjQrMwhwqKaWiPDoSUe3ieD8UyIEeBaXm+jdNL3l1jrgKD77ycQk+
         HgThBSsq48T3amqvlMzL56iLomUQsuewPWjeHUOGpjhem4ub7frV3mM4+mvWSNHcXXd6
         +rwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776102672; x=1776707472; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kK9NR0IgY6j5zF8S249PN4+ualmtOPXk+aSV0TH/7O4=;
        b=Ze3xhlsJhKZ6TkA1hm8+WRspZCBsU+pGvIn4oJdn6g3tQxChuxSTER87Gwx0/lMNYi
         v4TV3hib1UlnVvAUsSQbkdqKSRVE8dHSinO2Gt7bGEkPyXpW7Ch6s0ZYsD0neGNpK3A0
         u0NiKY9pDfWwp5UgH+XJM9RPpMLSnyGst7MsLwy4PlHZlt9cnMOpNC+vjLjRCBGsNad3
         yoUSyl2dqn4gNEyMYEqX2AG3kL29QQfqD0ib6Wt1jrJdx+U9NLzqPPLde/SJAhz+Q60N
         UXIohyGH3qJvGitzN5/5NxwW9ajoHs4zn97l2czV37UUtb1XlF+MyKOtWBXOGXnAv9Fv
         /FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776102672; x=1776707472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kK9NR0IgY6j5zF8S249PN4+ualmtOPXk+aSV0TH/7O4=;
        b=ZEpQR7IU2X0G1+T2avDHu/dMLp5CxlIE5XSIyWQEUqPUrehCyQAtOWElfLk3ax4NA0
         w6L4RBjiz31MGdpjvTWLNK8hjTlZS7bykDm2Gdp83/T2nsVnRrGI/RuN2gsRvKLe8qVf
         XVR78dOzD8+QzUEXk8MUiZEdjg7uqfHWD6R5Sh0IGIg+pqSIwfLuW6tk0yP5HRRe/e0E
         qZZwDCLlnGaRkPbdlDIJtwkzIPinkIyG5cjCEs4xVK6qY+t6TEViUf+Mew56fRLAonQX
         fDSLiCXqNZmQbd7Wt1t6TTsfE05hIK/hKmlPw6ooJ/OGRwdWsGNcaJtN+PYNimytNkeX
         zUZA==
X-Forwarded-Encrypted: i=1; AFNElJ90mHC0dcwd319fhxbI7ZT1h7zQqozU6YVhO+juWV6E91IynC5+BOF34jl1zFe6BtTJKTmM@lists.linux.dev
X-Gm-Message-State: AOJu0YwjIHclJkV1yEqB19XKA9Fm5vRaWbUxLxcpc1jIw0vDY7BdO85D
	utUgOn1OKAWawTysCHqYMH0poFAGO4ZQygb7umOmOtHrZJSQE6GCD3gSiJKXtPqrwWq3rGgHYI5
	tkywutaJn9d0knsukN0THXnx/4qUGZEzVATS9FJCz
X-Gm-Gg: AeBDievYtCigkGW5DLibK3ksvXlr672fnDaqqR9CaHIPgORyX8tMoRid141e9JFYhZ3
	a7Os3PmlDmzqd4vDCvKDgx37E9R9UedcnVrPJfHHHjajI0n8CHc6wnQgqAvdcJrB+5VGaZgcfL1
	UgBEg5W5qd/+R/1Bsy8NseaPZ3Vs+/67vYxbkAkn1njVI692rBoJnEKc2tofzi4bwnnbsoZBlt/
	y/o6uyFNj/JEgfZzyReKjISn0x5668Y+AILH9oDEDSYMIzHedqJf7MUIe1Gw2ULGh79WDtqvTDu
	5IQxK8p401jgoJwcGgYTkUUy92dx4tZHYJdSFBY7GxbZXQKo
X-Received: by 2002:a17:902:e78f:b0:2b2:938a:9350 with SMTP id
 d9443c01a7336-2b2c8cd36bbmr12367425ad.23.1776102671339; Mon, 13 Apr 2026
 10:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407165551.3075684-1-irogers@google.com> <672710335e73ed76ddcd176a5879817c40d1c314.camel@perches.com>
 <CAP-5=fX92ncYELs_XQXw55A=PYxBnLY2V1CqSpCV71Zc9Pf3oA@mail.gmail.com>
 <404f559a885169513b7e3526eeff77148ee55bb8.camel@perches.com>
 <CAP-5=fWteCfNQ7DmwLorcs9h3iH__XK01CrwnJ4-qUfcDCsSSA@mail.gmail.com> <b4e9f338b8cdc168f90848b8daf321386b863915.camel@perches.com>
In-Reply-To: <b4e9f338b8cdc168f90848b8daf321386b863915.camel@perches.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 13 Apr 2026 10:50:59 -0700
X-Gm-Features: AQROBzBih8lCxudn3cL601yrvS_TdhTnfQLvVTF9WGN0G5UZD7mK-B71W1tnidc
Message-ID: <CAP-5=fUfhcmt=kzY0GsAZm5J_EiyttMHOTbUyFkp+CjiRcitWg@mail.gmail.com>
Subject: Re: [PATCH v1] tools clang-format: Add a tools clang-format that
 overrides some kernel behaviors
To: Joe Perches <joe@perches.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 9:54=E2=80=AFAM Joe Perches <joe@perches.com> wrote=
:
>
> On Mon, 2026-04-13 at 09:19 -0700, Ian Rogers wrote:
> > On Mon, Apr 13, 2026 at 8:45=E2=80=AFAM Joe Perches <[joe@perches.com](=
mailto:joe@perches.com)> wrote:
> > > On Mon, 2026-04-13 at 08:39 -0700, Ian Rogers wrote:
> > On Tue, Apr 7, 2026 at 10:11=E2=80=AFAM Joe Perches <[[joe@perches.com]=
(mailto:joe@perches.com)](mailto:[joe@perches.com](mailto:joe@perches.com))=
> wrote:
> > On Tue, 2026-04-07 at 09:55 -0700, Ian Rogers wrote:
> > > > Sorting headers is desirable to avoid issues like duplicate include=
s.
> > > > > Perhaps.
> > > > > Some others prefer reverse-christmas-tree by length ordering for =
#includes
> > > > > though I think it's poor style.
> > > > Thanks Joe. I second not switching to a reverse-christmas-tree styl=
e :-)
> > > > If this patch is okay, could we bring it in through the perf tree?
> > > It's likely better to avoid this suggestion.
> > > The issue is that others strongly prefer that reverse-christmas-tree
> > > style and would object so nak.
> > Presumably that is a kernel suggestion rather than a tools directory
> > suggestion. We can move the file into tools/perf, tools/lib/perf, etc.
> > if that removes more global concerns. perf hasn't adopted a
> > reverse-christmas-tree style.
>
> Fine by me.
> Just curious: is this a style control file used by directory depth/path?

clang-format searches from the directory containing the file to be
formatted upwards until it finds a .clang-format file. This change
places the style in tools/, which is my preferred location for
consistency across different tools and libraries. Header file ordering
is a different issue within the kernel tree because it generally only
references itself.

Thanks,
Ian

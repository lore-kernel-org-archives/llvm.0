Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA20742A91
	for <llvm@lists.linux.dev>; Sun,  1 Sep 2024 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725187123; cv=none; b=dILH+GgcRM2gPHmWJbM/D9FkfsqXArB6HWPGi8i2pV32+A7rVgq40PA4Parjq2NBR9E6Kf74PNy06zdlFdTWHCEAsoV6LyXvdS8WLSU3vFicFrRuzkNNHuuBxvgdFb3oeFdpqE08tssgP2B3qa+kFoph7IqnZNvaPsiyggKvgAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725187123; c=relaxed/simple;
	bh=RtbrHR8X01m8ZmauEKuNsNd8YBX31NLA3tjo7E1zYhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4t5nfoxk3YE7RBNORu3uvX6dMae0anLgOOeHzE3X8cZLVuc4L99yMYUN7Gd6rduWSqKF0fKQb3U6zCykMQHyoLbrlBK9y6/yKr+d121eXcZFF5Is4S8OON9wTBBsyAaYDb6B6u1oQDiLF7U3Qf4lHjO1cyMQpqIYfqcImgoTiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=He983XTS; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="He983XTS"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-277f0540c3aso93949fac.3
        for <llvm@lists.linux.dev>; Sun, 01 Sep 2024 03:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725187121; x=1725791921; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyzhfAO6X5H2nFlBE67hjFSOfmqgByxBU/TMolVNnCU=;
        b=He983XTSKqoSjzXIrYTR9rA7wreV519lHgCzJx7mpGJ0lDM8GJ88qe90AkgtgrGx2c
         Dt3jlNW/RL8qYh9VgT6J+31i+qNcWZCIw7f7r7ycRCl0O3ys3Io0QkeF0WPfRWrB97kX
         2HdinyDF4nyxBM+Jee6jd1fOXt4RKgfV4PuD1Vt9qe++J0s+ghzrHIjVeoyFnUVHBFo7
         S88Golp/d6UU0TfnIxn/eYfrMMKZuVuHc8NwlYkGCHJPs5pN01T1WRqnwr5UlOnSJYcv
         rouNbwCVnQCfLWUwFwexNbwnVC+Ki5r3coRNh8/9LUOzYl4ufex+jlGcI0yZzu7Hk/pK
         iXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725187121; x=1725791921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyzhfAO6X5H2nFlBE67hjFSOfmqgByxBU/TMolVNnCU=;
        b=lbtQPwPe7N6VjTNiKmSvzTWuNjcjL+wPvvHVkM3gz/gzigejwh3HNCvGzX19d2Wvrp
         nb1xJ/Pu97wGA5kXQJGt8FfnMccF1TTvpxF6TQl6jHk5Xk5OsN8gJQkt6EJItNezM+jt
         D8X9F/uFj84cCnLgSWF2OOBHckf12IHAilcJ9V3DogxpaFs4K/WD5sVl0D4T0TVh7Djt
         vD/eLKVUyV4wOAxyUEd7RJkaBvLAv72pvU7jyt+sLJAH4S3RJb2zQR4k+uMJnX0C2B3H
         RiSHUkvc1WlF1cUcS+fepnC/1yKo56aK6TiJXCiz9PBqnYxpdmx0s+jEMNUTaWcJWuQE
         x4Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWTsiH1+cJ0jA06Dg8wxiJj890ThrldXkq0NbDm4bwK5LkNGX00eQoZg2QGZUFlpSYhb4Kl@lists.linux.dev
X-Gm-Message-State: AOJu0YwsbfFJDe97+FQ0s1aPULpfAu1NEcmT0QF/IaveLbE0IcvoDMqN
	CSHHgdgFmHyrP6NymjHwBklGgAo7W/AEHa1+eVtk9M2Ee8oOLf9yoQCSkpFMpZFk7sNwBFRxQaJ
	1kGZbpbAlIFKCw0k+a06VswWFOiE=
X-Google-Smtp-Source: AGHT+IFwDrFIRchFBPeU5Cmhdf8kTcaSFA4UqvIROjrdvU6DSkfFqOLzuG6/Nk75iyrmFNWILWDA+pXxJaqlFWVRaBE=
X-Received: by 2002:a05:6871:1cc:b0:25e:b999:d24 with SMTP id
 586e51a60fabf-277cc63f0f9mr4474832fac.0.1725187120778; Sun, 01 Sep 2024
 03:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <35904aa5-9851-4894-b953-689904bf33ca@hust.edu.cn> <58b7c7d2-f60c-4a2d-9cb5-d583182bfef4@gmail.com>
In-Reply-To: <58b7c7d2-f60c-4a2d-9cb5-d583182bfef4@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Sun, 1 Sep 2024 18:38:02 +0800
Message-ID: <CAD-N9QXks-bFxz+4NVbuvG7BJQZrRiodHXqSadqzdA-ammsM1w@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: add the translation of kbuild/gcc-plugins.rst
To: Akira Yokosawa <akiyks@gmail.com>
Cc: dzm91@hust.edu.cn, seakeel@gmail.com, corbet@lwn.net, 
	hust-os-kernel-patches@googlegroups.com, justinstitt@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	siyanteng@loongson.cn, alexs@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 1, 2024 at 2:03=E2=80=AFPM Akira Yokosawa <akiyks@gmail.com> wr=
ote:
>
> Hi,
>
> I'm not Alex, but let me chime in.
>
> On Sat, 31 Aug 2024 17:34:11 +0800, Dongliang Mu wrote:
> > On 2024/8/31 12:11, Alex Shi wrote:
> >>
> >> On 8/31/24 11:48 AM, Dongliang Mu wrote:
> >>> +=E7=9B=AE=E7=9A=84
> >>> +=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >> there are still a lots of sign incorrect. Please be sure everything lo=
oks fine in a web browser after you 'make htmldocs'
> >
> > What do you mean by "sign incorrect"? I check the html rendering in the
> > vscode. It seems fine to me.
>
> You are right.  There is nothing wrong as far as the reST specification
> is concerned.
>
> Quote from https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.=
html#sections
> (emphasis by me):
>
>     An underline/overline is a single repeated punctuation character that
>     begins in column 1 and forms a line extending *at least* as far as th=
e
>     right edge of the title text.
>

I see. Will send a v3 patch.

> HTH, Akira
>
> >
> > Dongliang Mu
>
>

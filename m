Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C8B24728A
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015157; cv=none; b=rtDecsQSU7xvB18khLFfMVQQZR3u0KhUCI3PJc1rMLEsLKnqtS3ig4Kc80RjSwnOoFGqtfDP77l2xnZgef975PxIs2Rn4xfq/tJdRWOqDLV9Fuo8DSRNNEOa7U2xtZf6b5kjPDby3oSwhYe45N/a1LJb2J5p8yVYc/hiswJ0ln8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015157; c=relaxed/simple;
	bh=gvAopjoNyA7dbzXulW4xl/bX7+60c+NQIsGH5vBcpAM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JVV6Zk+0Mj5nc55DAcvTtgEVuvpkOwm72H4bsl7076gPJlgbdinXFh9JomdjY5Tx3Ew0BLkKlXQf6n9FKIwRC8MKZRbNU1g925CkwYkAU4GSsOHvQhUCaNZAYFl81sogLY9kFYV5sNUFizj3NbJ2VMGDssUBnKtKcVJAVMmmSlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKk40oN1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKk40oN1"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso4782350f8f.0
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746015154; x=1746619954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exV/Dw+Vt005ATLp0ivkfrkkCFtH2VHvaATRN0wi0iE=;
        b=aKk40oN11Pfj6iS4ixgS/bi6eDwpA9NHAFYr0zoXJ/94akbvQLf4219JdQmunrE6nC
         tIA8yjBbTRAIrsw4fr6pHvHS9WrGmsMBChQFlwi5laCVMs0FgoNNG6pPSsl681h5rJWC
         JSJukjM8VsvJFOhp91rXypMAKwLZHsqlgtLnCSEe+ue06wlGy6wjB9zRJv67R7ewgr6/
         +hhovKO/yUVX9CYe8wk3AqsaujMXZMe21JOotvhmadGDyXtCjfKA9wjkPGkY7YDE3jpq
         3Aua47L8MOH50AZskh1aP1AnxkO1Hms6gB2rEp+t/FXmgqdt2O5KuSed6KKF+yns3TWa
         W0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746015154; x=1746619954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exV/Dw+Vt005ATLp0ivkfrkkCFtH2VHvaATRN0wi0iE=;
        b=ftidzYvNsxDvZILtVyNrzWX1satvqFNv+NolxaU1weDhPyIr7dMIOkKrkPJyzBP2/I
         r22KyfCkbnZi082otL3XukDVGb2ZD394QgONdoX6zAz/oA6ResFrA3N9yI5+5YNbksVH
         u6Nq/Cuh7j9+9BAVW+ZgHalGFKyCPIZrBjTkz0iXynadGqYiJ+euY598tDkh/szazA8K
         vbpUwuEn9vM1Xs4o7AppmFjGTd7j+lQ2VCRkVkS5d8hF29SZp0uLc5VdW/RoAD6rGXm7
         9mjmv5LHU4fVCwuPIPOGvySIBZj/nxgDSm9M1K4/oBPTbKFZkqWERsXgGHSxGv+FTYXs
         fJag==
X-Forwarded-Encrypted: i=1; AJvYcCVjv1Ni7Aj6Q9W+AUSc5UxTegV6eS7BqMhIINT71kMErHMW1ZVUAmhOgM/CI2D//iFtmBQh@lists.linux.dev
X-Gm-Message-State: AOJu0YxnlFAUgJ1+sHjmwWtstC9DkXd3QXq0WwK6tY4QSXnkSfpqkUwN
	DaeBtC8DzUZmwvcpiJEr0APUJsZHz4YdjF2t/URR5RG1wxGbnion
X-Gm-Gg: ASbGncuYwUCsqtD2QG4RWfM/0G6xtoCuk2rPSVP1NXNIXYfO2lK08yqh0c9ONSlgWEr
	0zcrtv1Wokz5B5dIJdki7V5xQ97UXzytFGlfIzOhULX5F4EFt+sFTbkxROauGBlQrsJNATyjPic
	m+iOWRr4eSxhL8pDIZ9t1HV5/t1C9ohtiYMoUX3jONqPkrtRpKqjGiWSJbSDwaz0Qy4KgD73Krb
	hHjlcvemdtBTcyYncT53W6sQ+xUtErfitQ07YCeg06aqQy5OnpWK/Do6CmT5Mum4g16geEBjki5
	GThdF3p84ZC4Npunf1/y0A6poR2Osv2u9SOK5BDHRwv1MFpNMs+NzaHj4rFsDtWSoMJoD2//i+l
	iJ+s=
X-Google-Smtp-Source: AGHT+IHdNy2cnEFHIFGItGh5hGfN1ZHCaeYaOLyj5VuHMZN0pXEx9Cb435wW4njErTV4EecqJL6luQ==
X-Received: by 2002:a05:6000:2585:b0:39e:e217:28c0 with SMTP id ffacd0b85a97d-3a08ff34c51mr2240192f8f.10.1746015154143;
        Wed, 30 Apr 2025 05:12:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cc1842sm17094081f8f.54.2025.04.30.05.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:12:33 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:12:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: Adding __popcountsi2 and __popcountdi2
Message-ID: <20250430131232.3caea352@pumpkin>
In-Reply-To: <20250425003342.GA795313@ax162>
References: <20250425003342.GA795313@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Apr 2025 17:33:42 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> Hi Linus,
> 
> Since I ran into problems at pull request time previously, I figured I
> would save myself some trouble and gauge your opinion up front. How
> palatable would the diff at the end of the thread be for the kernel?
> Clang would like to start emitting calls to __popcountsi2 and
> __popcountdi2 [1] for certain architectures (ARM and RISC-V), which
> would normally be a part of the compiler runtime but obviously the
> kernel does not link against it so it breaks the build. I figured added
> these may not be as bad as the wcslen() case because most architectures
> generally have an optimized popcount implementation and I am not sure
> compiler builtins are banned entirely from the kernel but I can
> understand if it is still contentious. It sounds like GCC has previously
> wanted to something similar [2] and it was somewhat brought up on the
> mailing lists [3] but never persued further it seems. Since this is a
> compiler runtime function, '-fno-builtin' would not work to avoid this.

Is this the compiler converting a call to __builtin_popcount() into
a function call - which the kernel can arrange to never do.

Or the compiler detecting a code pattern that looks like an open-coded
'popcount' function and deciding to convert it to a call to the builtin?
(which is a translation the kernel pretty much never wants for any
such code pattern - including memcpy()).

In either case the link failure is exactly what you want.

	David


Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E63C6A
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 14:48:12 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	by gnuweeb.org (Postfix) with ESMTPSA id EBD497E348
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 14:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1647960489;
	bh=nhc/SeLNGo4re2yxQ5GoFnaoYMAKUce8gFXe5zfGqKM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nqD4OJZRnEtIfchYlG0B7/CEbk7S2QS37xuYHeYRndTo2VdyD3UOjwiaj1/5wRQZC
	 VLYuLnysAOyD0VJQdmTxi1UElULypMQ2y6RIG5b4ZI5BqKp8t3b5vIkhSVW3Z9jH/U
	 9O3CDSm042cXqNJwBg8jws8zbXBui9N8kSngk7V2eUUNDRy8HOk4JkxalGMZ1ldN5h
	 4HdqqoT/NEzeIzRGUoMAF/b+OfROT9uJirU4WPUp+JBy4WrO/m+PGYCb3iHahSrktN
	 nYpIw4yXbwa0pCccmUoksIZYwkD4GxAiZtgf9f6WIuBJpBr4lCrA/4Khz9mqUJ+EyP
	 VfIjAeIsS3RwA==
Received: by mail-lf1-f54.google.com with SMTP id d5so11023651lfj.9
        for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 07:48:09 -0700 (PDT)
X-Gm-Message-State: AOAM533io400lJFcH3E/u5HOCyNfhhs2Mk8EmbdzTUaBhDqFi+pBjiQa
	ZJYfxikC/L8IC8OnltQ5gIhYDbvEQiKqUpnLkHg=
X-Google-Smtp-Source: ABdhPJws2O+yg6MTOzRKnrJ03Qv3OmYB19iwU83i646P4wI3U5QwCr8Nh6DmLxi2UmhoItx5UgiRuFRnOThEvm9siNM=
X-Received: by 2002:a05:6512:c06:b0:44a:2a0f:9d3c with SMTP id
 z6-20020a0565120c0600b0044a2a0f9d3cmr7838759lfu.136.1647960488026; Tue, 22
 Mar 2022 07:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220322102115.186179-1-ammarfaizi2@gnuweeb.org>
 <20220322102115.186179-4-ammarfaizi2@gnuweeb.org> <8653f6784a9b4272a59a75a530663567@AcuMS.aculab.com>
 <a8eeec1d-656d-15a3-dde5-0f8cc8c5956b@gnuweeb.org> <20220322121338.GD10306@1wt.eu>
 <22fd9709b3a64a548226741b682ca155@AcuMS.aculab.com>
In-Reply-To: <22fd9709b3a64a548226741b682ca155@AcuMS.aculab.com>
From: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
Date: Tue, 22 Mar 2022 21:47:56 +0700
X-Gmail-Original-Message-ID: <CAOG64qP=Hn+Z6zO2pEafE4acLiGig79OCPQCAktb4bhV6DFBAg@mail.gmail.com>
Message-ID: <CAOG64qP=Hn+Z6zO2pEafE4acLiGig79OCPQCAktb4bhV6DFBAg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/8] tools/nolibc: i386: Implement syscall with 6 arguments
To: David Laight <David.Laight@aculab.com>
Cc: Willy Tarreau <w@1wt.eu>, Ammar Faizi <ammarfaizi2@gnuweeb.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Nugraha <richiisei@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, "x86@kernel.org" <x86@kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 22, 2022 at 8:37 PM David Laight wrote:
> dunno, 'asm' register variables are rather more horrid and
> should probably only be used (for asm statements) when there aren't
> suitable register constraints.
>
> (I'm sure there is a comment about that in the gcc docs.)

I don't find the comment that says so here:
https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html

The current code looks valid to me, but I would still prefer to use
the explicit register constraints instead of always using "r"(var) if
available. No strong reason in denying that, tho. Still looks good.

-- Viro

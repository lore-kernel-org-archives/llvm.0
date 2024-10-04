Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760C71448E0
	for <llvm@lists.linux.dev>; Fri,  4 Oct 2024 21:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728077040; cv=none; b=q3lbWWvQ1027cld+pmpiNKnEpNXetHYc2+uFXcC2xrFe5zl80t/+oqQdSWReP9yI2Qzy7LTXDZCRDyrHu6GHwtMer8O1q5MQE7QYIYSQnorFf/tvEskKFTETd79CNACUuwhVvU65BGsnrWwwfAS+KThbeW9q/GMmMq39PqAUMS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728077040; c=relaxed/simple;
	bh=1OR4Ve0G8ozTpeMWZS3Lij1bBkuy08uUBWlqH40INcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUGQApFKxtuVX11jtHA9yAfH3QhvTRLyFIl92OO+5cmHfmplhFd+K6QEH9yvuP+wwn6Dfl+GJF6oQM6C7l/r+uViCmd+TwReUo85i4YmGDIftAGQooreUfQayk/1q/NNeisGOWe6G0SJmfMkpdjGznBp2DQAsMk9wbndpPG38wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pJ1S9H68; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pJ1S9H68"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-84ea658b647so856337241.1
        for <llvm@lists.linux.dev>; Fri, 04 Oct 2024 14:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728077038; x=1728681838; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AS2Tt07mNVpSQvOxW3B3xdNnuSdtzeSrYZ225ecdgxI=;
        b=pJ1S9H68ueuHi1HMWp2GAyT6WsSp4Dn/ESqOrvd/2JPX7i1KCKVZCgMClpZLBWzDwC
         d1CDsZACCTJ/HTY+JQ7Tf35Y32VwzjL98NYTy43/vynsNfILGoquyW807Wf/Nla6KIhR
         T1xjmjDDMHNwanUqmrJdKpZwe8yorpaNJHJIJsR3JHmiLr50uW4CVWOKZcIZZD+RTEGX
         QPGmaOa7nx5NbIRQjEo+gQzy1v6Xgw9SJbgmb5cSBn21m2y3Kt3bCdi6N37pd2DW8uNB
         cLVkkTfe6h51l4TXi5GZFwzA9JiRXBAgWAE+b5k7FUzhvzvG7VHNVfaiEJodV5WbZhbZ
         MJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728077038; x=1728681838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS2Tt07mNVpSQvOxW3B3xdNnuSdtzeSrYZ225ecdgxI=;
        b=GLtzfYlpP1SBlxkKENzN9qaYR+eamOlw6x0ZKKkWiRAkfkHViim84Xj8EmfC+wAorr
         hW9K9MYzC9ScJVwq0RVNZZhnKTXAsGZwGECl3GfM5LhxC6UKr28bRjwEaluC31yOvb0k
         TZ9gRshePjKqzs297h9U3A58nSOnSs3YEhnuqE9QAi2YKvAYCR9SbQAbzhzGOhcnozLK
         mDyJusJ0eCblxmg2pwL7wBFLNjBAQfBd4BS/jRF8F9ryuUNJqCYaDTH9N9fYuHt7i7ZV
         04XD9QbrfZ1oq7YZUYicYJUj/aOTrs0MKll4gc/pRvByGlZkO79ZGeZEZe0jU7QUhbWF
         hGRw==
X-Forwarded-Encrypted: i=1; AJvYcCU/mKtBEsQAnVJ91+4RBx31E9fVw3YMMa+x1tVT7do+dQmWj9NHdfsrj7GiuB/uYn6UQgFE@lists.linux.dev
X-Gm-Message-State: AOJu0YzfIwFPs9rJjZQDuc15MoO8VAPwmwGNfmBGAGx8KaOcOlQDmPoU
	xa7Y9kwpavSsRXJ2eNiD1JsLQDMd4yD8QtgA10xm3FTSvc+PNvIVyg1rJgnOemoZoT9rAldEJKZ
	a5HEpazMwiBuwh8zunMX6aoFLXSiWwTW7YZ+m
X-Google-Smtp-Source: AGHT+IHirBWZiJ7avVL8zp5O8TKnny8LN6+S0bUCwVjwrwc/DYRkrAgQjSc8Xmqms5tSFJGQ8crQgjb9ejhVAZBSMZc=
X-Received: by 2002:a67:fbcd:0:b0:4a3:ac2b:bffb with SMTP id
 ada2fe7eead31-4a4058e1360mr4377858137.22.1728077038261; Fri, 04 Oct 2024
 14:23:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net> <202410041106.6C1BC9BDA@keescook>
 <20241004182847.GU18071@noisy.programming.kicks-ass.net>
In-Reply-To: <20241004182847.GU18071@noisy.programming.kicks-ass.net>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 4 Oct 2024 14:23:45 -0700
Message-ID: <CAFhGd8rPLoufNx4BMV993c+S_6psLGU6Ow49Frc9s88cStcuCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, x86@kernel.org, "Xin Li (Intel)" <xin@zytor.com>, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 11:29=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Oct 04, 2024 at 11:10:04AM -0700, Kees Cook wrote:
>
> > +Configure the kernel with::(make)
> > +
> > +     CONFIG_AUTOFDO_CLANG=3Dy
> >
> > Then we could avoid the extra 2 lines but still gain the rendered langu=
age
> > highlights?
>
> The whole double-colon thing is already a pain to read; you're making it
> worse again.

Lots of people read docs on the web and having code blocks with
monospaced fonts (+syntax highlighting) makes them easier to read
there.

Configure the kernel with:

     CONFIG_AUTOFDO_CLANG=3Dy

--versus--

Configure the kernel with::

     CONFIG_AUTOFDO_CLANG=3Dy

This renders better for html through Sphinx and really can't be that
bad to read in vim, can it?

two cents and such,
Justin

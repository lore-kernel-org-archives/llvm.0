Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B772194A59
	for <llvm@lists.linux.dev>; Sat, 15 Mar 2025 19:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742068080; cv=none; b=Q2RtVwGHE7lIlG8h7Tx9yiiWCeRBu5JbaB0qeg41o1IRZfaXs6j9/0G8Dbud1pGoomykpHCMf6w7g8kx1SxEzayMhxNM4HojJOnZw1i6BAdymJ93fSYVpkrjOk4x/KCHKJAUNo4Jg0uTdrzn/6nSrj+pGO+G7Wa7hUGqBRhRhfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742068080; c=relaxed/simple;
	bh=wJ4l6J6G+qyPJ3aBxSxuXZf5GDw9i2YcrDUY7OWKhmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHdWOXQ0rWmoyGoO8C+HhUkgoiiPVNNNSbQqYx+Kiw3TM7QmRa9RVvxwr1YgUJE315ZbXjXutGZ6Y+ROMKA2e5nDAPH0kfuVV6Tumqh2PGoK0SyX61Y7CXNucPC6SzREEruPfrRnDwRopbzMB0CYCffDyAv8ZpUjC30M3V7wW/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0kIi6mE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0kIi6mE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff611f2ed1so207440a91.0
        for <llvm@lists.linux.dev>; Sat, 15 Mar 2025 12:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742068079; x=1742672879; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMChtj/qs0+2j6FZvP0hkcUuVJ7qalGUp9JEm+CkAO0=;
        b=Y0kIi6mEKgZG3FE6QiGTdmCZMnMY83n4nY5xniJ1ifGqgpXPsh37PAUpSQFx61n8IT
         nMcqTbRDBgfSrEKYEHcKA8IsQ+P3+xFZbGulNOAjWN2zMAUEUk8J02V0p3/En4CPPKpe
         W96mnX4vErwAi2Vw7y+5ZwTZmAdNzz3NYIGPjf3VOtVyKbyFJIUUNvrOvacc+FdCYfAv
         1jmxoj+ePdXFdLymbkKkEvsnz9jhGHIOphZUkrjp3I6RLVoRzuBkFcM9Hk9MgXAnp0eF
         ICx2I0T+dRvgy6hXJrW1VUavxutA0qW8yWaMBrG4IfD3toJDAgDPf0RXlDAGLycmfaIW
         wHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742068079; x=1742672879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMChtj/qs0+2j6FZvP0hkcUuVJ7qalGUp9JEm+CkAO0=;
        b=jJkb3YM/SCrS099fSg1nstH98pT0XVVACTQ7sVsxl7Ea6GamgAg3PzAk988ylX4anK
         5n+cjyWfW5+qR1cJbVQnNmJk6i9TSp/RfeOEp4PnF1tKvkIHLx0SNGuP1ORIZ66z72CH
         O2kuxVc3tpRBAOC0sj07hr5NbiQcTwVLnsYBGd7Bp0Y2svE2ZUKbXVU0dGtVmztHodTb
         EeXHx5ZYECTLqyOwwVwvkVOizPbOlBjUkL7c2yVZ8E0sLHYIbiK+sS1tcT+x2j5Wj4Z/
         hD23CZAhyCr33QPJB4g9kBvtx7j2amA25mnmSwrl9ZBXSrbWq7Izny4PjCKUzzM2uyb0
         iGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF5u40AedGnZW75JsHGGt6IsIEI9ALWM8pxvSdee7SNGz83W5aTsCH/NvBvwBEQRBavERm@lists.linux.dev
X-Gm-Message-State: AOJu0YwUt5YF8KaFm+xbYnG5lNai/4NgSaM2PFWJTJwGLVuDTl1fyrTo
	gi8e/H44tAj6K9kHETshcIY31UL3bcKpI0iUcm6pKjbl91uQvvF1EoVpv9z95vrUbaAsFMbZQuv
	567zmJ+wrycImPWjxsImBaRUYlJo=
X-Gm-Gg: ASbGncv/3z7khHUVILq3OZ7+56WCNtgXmEgUOe/x/JkCSoDxLZih/I+giwtB448jKN1
	itJBG5xGAXvKmN17PPDRMMhrDsc9ZnOqu89m0HwrrzmKh96eAR4w4pCRLmoVVZF2InoM2ZE7cOm
	23tHJuRYXYXXqI3Bhi9Dh5IZJGwAeqIEgZjDel
X-Google-Smtp-Source: AGHT+IEdSuV95kVoV/AdTuJBpKGMb2i9LnB/HhcT8qPMxQn66E6o9ceqOM1QpXD2UnRrMI7THra8nGM+kEBtkK5IxYQ=
X-Received: by 2002:a17:90b:4d8d:b0:2fe:b77a:2eba with SMTP id
 98e67ed59e1d1-30151c5dfd6mr3410961a91.1.1742068078596; Sat, 15 Mar 2025
 12:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250315025852.it.568-kees@kernel.org> <20250315031550.473587-1-kees@kernel.org>
In-Reply-To: <20250315031550.473587-1-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Mar 2025 20:47:46 +0100
X-Gm-Features: AQ5f1Jpcv2jHsvKdPH3ud-Cw7eDilZMZWJEW0e1jOqoBRQkpg0FQvOZE9YOPiqI
Message-ID: <CANiq72ki=h4YWBWpoTpZz6525Cdt38aFN0kFwW7dJNPcVi_m2Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] compiler_types: Introduce __flex_counter() and family
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Miguel Ojeda <ojeda@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Marco Elver <elver@google.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	linux-hardening@vger.kernel.org, Christoph Lameter <cl@linux.com>, 
	Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>, Yafang Shao <laoar.shao@gmail.com>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 4:15=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> + * clang: https://github.com/llvm/llvm-project/pull/102549

That is an unmerged PR -- should we link to the merged one?

Or, better, to the docs, since they seem to exist:

    https://clang.llvm.org/docs/LanguageExtensions.html#builtin-counted-by-=
ref

?

Thanks!

Cheers,
Miguel

Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8989188715
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 21:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727386525; cv=none; b=GNma3/F+3qVn8RzBilP7crvQYDneNFEOWOE76anhgB0nbgNJZnsNHS1B7U+RhAdJEoNinS43HEvjKBelJwjPX62w8tHb0FPpWnam/uGajZqxhMfFk9LBeg/v8t46NV8VFCG6N6Pe6llbS9UbtmkZbzhVATfyihgmvkpL3tU7Do8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727386525; c=relaxed/simple;
	bh=1/AF0ye1aEDqbRIMOiqu2UP5rEYyIqLBgduhnkT/Gq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBJfh/5Z7VEQxAgZ34fM/Fcum9KV9uRA4YIPjdwVhv1SKHj5FlBKtaFrY9UklpOXb6tj9a24Ppj0UNskaOvLs1phEpW4M0T3GA05X3E3GzoES+ZHys+EPON/W5TX4FRw1SnZ4EYkHV1ZwW9wX5nfulw3klh0rZgUbhtG3nAQFJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9uDyNHf; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9uDyNHf"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2db6e80555dso259811a91.0
        for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727386523; x=1727991323; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN3ZIl0AHdW2Pc3ccHhFRbQ1ihSm5IEdT9WChsNSY6k=;
        b=W9uDyNHf/xAqM40DVlOEeW9iNR0kof99nGLRtmT8BOXU6nREQs4wKs7NRUD3fNjXjW
         mgChn0f2QXM+HG67wv+nuREhIHcpUNFFtIHB47pU2kob5JKvMbjbOugfhBCnpzpYHoY5
         XAkWuuy/LiBEWxTouVFoAGhhE+5xI5BY3mkE22EWFomNCFyhTgsB7Fl/Av60pQX+iesB
         UieQSd61s0R1o9/F+EjUhTCjXirh3Q6tNtSAY201gBCX6nUxjEq1SU5Rmjl33LJDwy+Q
         J+88cHiKPxa9Yq8zKKi8jdXAEg/N3SuMkNvS7wq7wdl+7viwg+ZFp2R0dlUSDArVYGdL
         b9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727386523; x=1727991323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YN3ZIl0AHdW2Pc3ccHhFRbQ1ihSm5IEdT9WChsNSY6k=;
        b=CZqWC/wNudJjSlnS8FOV0MmlRjl/6vcm/c/GKDdmAUC2RmOyDCD4I01Wk2kDUjH00N
         TTrz4qw7QmZICM8U4Zn+WXnFb7OgTy1L6sWrb4jMK2HGw8uNcEcN7LDX6ka+hvsgsfTl
         M6O3Ykie7LPMClzfUDfj2rHk10R1IIrsqlsJNz9w3Tic06E2mYS/iIuZ+a/Yd2E33H4w
         6rUYz4+MLNCHc4t8TlJ+CD8syo9K+k7p59yC16EbF6p5/fCus7Sbx7PpQufKZsc9usLv
         dAxpYQGGEqiZ4G4VEPHY91Y8aC70yMMSZORfZu/zWdSwIRBTg5VRxjiFGWDJdKfhqMK9
         3PGw==
X-Forwarded-Encrypted: i=1; AJvYcCWz8s373KR8cTLAgSf6++K7jS5jUiApnqBwxXgpcXu/PBcsuzzTfPOvaQx7eB7gw7/EeDfT@lists.linux.dev
X-Gm-Message-State: AOJu0YzHYlvubb53+Hgsxa0GdH/sJWizWZ1K7W2344MiJPhFMo00ttgm
	iiSHbkEohf8oBNvMFrlnylNmHQCTCOXyYCapXGtkVwWbbt7yGkNBPEldVMkxXrIosQeKs/ZuUkk
	lU2nN/kK893mKFGvVbk6sVDrgbnU=
X-Google-Smtp-Source: AGHT+IFP+qclc+DwNk0VcbiLZGtyseD1sfEmeyqBVla3e/ZDfuly9waYm3g7wRqfrKuy03nGqriwsOXLp8FvWSa4ibk=
X-Received: by 2002:a17:90b:3698:b0:2db:60b:eee with SMTP id
 98e67ed59e1d1-2e0b8ed348emr498104a91.9.1727386523117; Thu, 26 Sep 2024
 14:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-32-ardb+git@google.com>
In-Reply-To: <20240925150059.3955569-32-ardb+git@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 23:35:10 +0200
Message-ID: <CANiq72=z6A=50QO3V0S3Kgx6XQT93GxbB_LN6PFAQCmNgy370A@mail.gmail.com>
Subject: Re: [RFC PATCH 02/28] Documentation: Bump minimum GCC version to 8.1
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 5:10=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
>  Documentation/admin-guide/README.rst | 2 +-
>  Documentation/process/changes.rst    | 2 +-

This should update scripts/min-tool-version.sh too. With that:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

As Arnd says, the cleanups can be done afterwards.

Cheers,
Miguel

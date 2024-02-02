Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD4F146917
	for <llvm@lists.linux.dev>; Fri,  2 Feb 2024 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706890141; cv=none; b=dU/pNVJHwMBE1AeR05eu9eKCkrIRr7bERIObh+W8n75r5FR4IERPwErvL1d05aOc/5rWoKsOwLX5bgI9f0qsAFbCqKEeNGtPx7JSM+fhS+ntsa9UCgSKJDTlCqQVOQD+agQYAmOo6CWdb9dekiXMIPIz/t/2nAsQK5XCuzLRBqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706890141; c=relaxed/simple;
	bh=ObobwIusGY63NE/2MOWR+NbMWvgKu/d9ZjBL9g2lKRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kajev0WQYA2nM82+q9syszUfKIauJApKdM5R7kYTG91f6wNfilqg37PfllFjrGW2naYAD+nXNL2KA9mM9UzuG93pVnaVjKeaLvQOhStXLG8zvG9jL1epwXDvOEh9JiEwTpW5rwgRqNzKYRM5CQzpVGGfPBZ4HK0Wq3rAwPzkcxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMD1AIcv; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMD1AIcv"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6041779e75eso24009247b3.3
        for <llvm@lists.linux.dev>; Fri, 02 Feb 2024 08:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706890139; x=1707494939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObobwIusGY63NE/2MOWR+NbMWvgKu/d9ZjBL9g2lKRM=;
        b=UMD1AIcvrOKpiqWtGv/SI8NYvgfQkAsPKSfIbmxvpxN+eYyi/Xc8eI2+BnkpT9slU1
         xtFJvtm8Wkbt+L6T1HzGU2ZliW2gCAE4CSIiLK8rofBv+LoieBNxbMxJfmhcPVQUmEzv
         Hy/6rQE1H9AFVyDiVsuF1s5F1kFKLC/yn/gATvCdENYBq1l1LBjx2VFJYz00wm47astm
         EYUFMxqz/yQQegaVqSC/hmHqwD6DKHEBDF+b05GFGuQi7nzwngirkJkQL7LMSCMF9KIF
         hvs/1E/w5LrHjo4QkO+7zXDTsXvC3bOyx8LxXuuRlPStPb6tWTls06dbEAnHzzycFtlB
         lNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706890139; x=1707494939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObobwIusGY63NE/2MOWR+NbMWvgKu/d9ZjBL9g2lKRM=;
        b=vRuPZP/dcxVjrrlyZ1YHqairp+xGmqy4YX7hx4200SPvzcYK4LnwXvPwujsTecbxu8
         0kANlbsAzaH8nnyfKES2wX+aYUGzsSEVyncE5j4t19WtreJ5GV+OOGURsHS1g8CbeFif
         hljb6Y0IITIE+pFSkfykoSFQQKQrgG+hgEK8PisKe/6UXK0lsce1PtpQjTMiEsdoxxrf
         cNOZ6PWlKA0f287nOhKL7FFqglocf0CZRgbZPSrXq/GOGdxuzG/IJBrpGgT13WVcsfl5
         Tnerm2xxF/+c/BAzG4mvUQ9caFXASh9Wf/QznN5F3gF4GVv1buDGGxHK69wrWxWwe5n2
         LAcQ==
X-Gm-Message-State: AOJu0YwOBsV2ynMwqwE/z8ZXq9bEmf7OXGZuJxaisxQvmbprX3O+n490
	QeQgp3o7Q+pLZbTEUsy/xELH+87ocDK6esoXLRCZs7Iv23eptw0PUbnUx6p3DW0N7JxtK4qc9ke
	gfT1pS6be7VMHs7DuOPNRG4y0njk=
X-Google-Smtp-Source: AGHT+IGMWWJJIsEQaIGhd3HotQ+QkJuC6kkshmtHK3UG+EVQsNgMHpDuOqo3DccHZuJCzl1gJq/ilLs/vZ/Z4MzkmfU=
X-Received: by 2002:a81:441c:0:b0:5e8:92f9:46e8 with SMTP id
 r28-20020a81441c000000b005e892f946e8mr2730296ywa.30.1706890139331; Fri, 02
 Feb 2024 08:08:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240202101311.it.893-kees@kernel.org> <20240202101642.156588-2-keescook@chromium.org>
 <CANpmjNPPbTNPJfM5MNE6tW-jCse+u_RB8bqGLT3cTxgCsL+x-A@mail.gmail.com> <202402020405.7E0B5B3784@keescook>
In-Reply-To: <202402020405.7E0B5B3784@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Feb 2024 17:08:48 +0100
Message-ID: <CANiq72ku9wsHtnPAh5G71Y_pbsftrPPyV5wmDCcZRM+WB6KVjA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] ubsan: Reintroduce signed and unsigned overflow sanitizers
To: Kees Cook <keescook@chromium.org>
Cc: Marco Elver <elver@google.com>, linux-hardening@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Hao Luo <haoluo@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Fangrui Song <maskray@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Bill Wendling <morbo@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-crypto@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 1:17=E2=80=AFPM Kees Cook <keescook@chromium.org> wr=
ote:
>
> Perhaps I should hold off on bringing the unsigned sanitizer back? I was
> hoping to work in parallel with the signed sanitizer, but maybe this
> isn't the right approach?

If you can do anything to keep it in-tree, I think it would be nice so
that others can easily use it to test the tooling and to start to
clean up cases. A per-subsystem opt-in like Marco says could be a way,
and you could perhaps do one very small subsystem or similar to see
how it would look like.

Something that could also help would be to split the cases even
further (say, only overflows and not underflows), but is that a
possibility with the current tooling?

Thanks for working on this, Kees!

Cheers,
Miguel

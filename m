Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8E5149C4D
	for <llvm@lists.linux.dev>; Tue, 29 Jul 2025 23:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753830980; cv=none; b=ZRrl5IhwhdpyIgjZjd39VA8JTXYZWnpLroSt2KB7BZ66Yym2x7e/525Q+6z5+wL1Kx2wf3ZFrjEz2f76AEWnaMGr5qMQVr0sj4MlqLbATv0JpXC/keCwJDLFi7PW61ZVIdXZMbKAHhW5lAusaPw6iCauq+f+atnsam2UslZjb9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753830980; c=relaxed/simple;
	bh=89oO5yBwKXogRnHzKM7W3myuaKHzc+gF2Cis+Twd0oQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8VbasOPDHCm++DsivrveEeU7vDd2noBa6Nb7+tLoWeaQggp+10Lgp/gjOr+Pxu++pWQsya4tk3xKjKNxvEjXymbNez3Hesp9LHvrY6evy9vDKgm7zlBjA3k1lxE9xMl6HC6WWpCUji1OxOuO4VcRpYBBSDU1Mz/Pr6jTEsEbIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bLMqNgBU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bLMqNgBU"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-615398dc162so4703487a12.3
        for <llvm@lists.linux.dev>; Tue, 29 Jul 2025 16:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1753830977; x=1754435777; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V7MELq/l6D9hMY/qV+9sozKMnnecRDmbGpZ3SGFvMEw=;
        b=bLMqNgBUwiAPVAIoeesqqc+1PqcK++NSKLCDu0XuNs0lOTpzM0BcxGEs4eb1jlcpfM
         C4KS81WU5ANhBGeYmOswYT0k4/AadtX7VF0YheYiVqKdVDOR7gm6oiDbRS3QU1RbBPs6
         57TaikOTb0zw6yXcQubwPsBkD5ehcovxWD8XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753830977; x=1754435777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7MELq/l6D9hMY/qV+9sozKMnnecRDmbGpZ3SGFvMEw=;
        b=p9ifz0LI3lgLcBgQkvWwoYvXqiNIEM6v2BhnMOLlDNIWnPuMPZCeVHwbavwDAZ1LiX
         QwbL9SbEJTXpl1ePbf+Lztv/iQEZyDgUPJbZ08LiVj6YBw8G/MFXBpZMDEOUAntE0e1I
         kp5ziwQ2OhcCKN8Bmxxfx8Z5OJnEp8vEBxCR9DDrkE9L/Y4n8nix0148Ui8GvvYcj1a3
         BdtNIZoOKkkLprvcfvTWDK0o8Vkk2UPJvvYV9D7PqNNcatKxYUuYAjhW+sm5ozVh8gxj
         dJBZUqWd1hzQV4aJQYj4xR9BJnxNuQDW5oRa8QVJVAi8dYWU9F4cAKCecCd7FnIzNXqv
         Uxtw==
X-Forwarded-Encrypted: i=1; AJvYcCXhhmdFtfqEBGYNyeJwnliWQ8UHiKPYUwvQILUrjS26lsVeOMT3AKoVR4wD+ekuzuiWxcIm@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv6UyJgLww93v82QHhv7U1prI84rOGZ/Hx/KUFiQAmmu2+jE9a
	UPOXpwaoY29Tyz6lB2QK0bi2aPrTkEugVtfD5nU7EgyUn/O7ViaN3om/Dm95wBt9Tve++K83zyQ
	tR/dxrBk=
X-Gm-Gg: ASbGncvXGHJYPIvn9+TiOJ0TUD6aKwNJp+459HbwavEIYHshgQn6uoae2gUeCgL17Qy
	Pfqcnpmq3hAoK3jm8H7oIV6S5Hr/69eXEFYnLl5QuR3I9NbaCLHWb9GOz05cXkpFzdQpilgkh0e
	rLwDDBdxCI9DzPaFjqyet6R9FIpniVLDAJbOgZyLtknpjLXRYF17/dYcS06YmYMRLdqnGNrnfVH
	6Wd2ckM5Y0O83IXk+tEfC50PBsUdaVmemL2UJK3uD549m9wkaSRpOUDL2VIMMYZPdQKUfzoe0hh
	Ls1kqBZLPE91WBM5LFbI+d6Z+/tTzLwSKzIeAXKBFYd2Qqyei5Wtw9nYZpTPhwsltS/DIuy7ZyE
	ENuHmSnSng7wr7/6TQRaDKM7E3/skbJYiqM+01TA4fJ/T+iYXbWkVD4uHtz+kPdE0szh6wtwLG+
	0DL0WWOg==
X-Google-Smtp-Source: AGHT+IFvkmR4L/xNhjtjDHieCiFNdeb18Oi6N1FSJxAGuOp1qJ/tsquwJhiGhLPwVINzKDPsq05VQw==
X-Received: by 2002:a17:907:1c8d:b0:ae0:1fdf:ea65 with SMTP id a640c23a62f3a-af8fd71f16amr134160866b.17.1753830977117;
        Tue, 29 Jul 2025 16:16:17 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635860113sm660820366b.6.2025.07.29.16.16.15
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 16:16:15 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6157ed5dc51so1282643a12.1
        for <llvm@lists.linux.dev>; Tue, 29 Jul 2025 16:16:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpmwI022qr4chfGh9eYUROmKmc+FpXmOHY+23Q/+aCtnftwHZQOlDbA864IFzZc5ZGbb31@lists.linux.dev
X-Received: by 2002:aa7:c558:0:b0:615:684c:c2d6 with SMTP id
 4fb4d7f45d1cf-615870b6891mr1084772a12.22.1753830974956; Tue, 29 Jul 2025
 16:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250729224325.work.019-kees@kernel.org> <CANpmjNNkYE9dvyR-YH3U18+g4bG4tpgD1pv99xG6xhdRuQYUQA@mail.gmail.com>
In-Reply-To: <CANpmjNNkYE9dvyR-YH3U18+g4bG4tpgD1pv99xG6xhdRuQYUQA@mail.gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 29 Jul 2025 16:15:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh9qD2tY4+C9mjPviAZLHJ+Bix3KyBfKKYfYbP1XxnUVw@mail.gmail.com>
X-Gm-Features: Ac12FXwyykh4eQS4aG6NfTaU_pPeuzIhKc2c8ZPYUithrQ3wXc60zMPaSd8W1iw
Message-ID: <CAHk-=wh9qD2tY4+C9mjPviAZLHJ+Bix3KyBfKKYfYbP1XxnUVw@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: Provide __no_kstack_erase to disable
 coverage only on Clang
To: Marco Elver <elver@google.com>
Cc: Kees Cook <kees@kernel.org>, kernel test robot <lkp@intel.com>, 
	syzbot+5245cb609175fb6e8122@syzkaller.appspotmail.com, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, "Kirill A . Shutemov" <kas@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Wei Yang <richard.weiyang@gmail.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Michael Kelley <mhklinux@outlook.com>, 
	Marc Herbert <Marc.Herbert@linux.intel.com>, Yafang Shao <laoar.shao@gmail.com>, 
	Uros Bizjak <ubizjak@gmail.com>, Jan Hendrik Farr <kernel@jfarr.cc>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Jul 2025 at 16:01, Marco Elver <elver@google.com> wrote:
>
> I think this belongs into compiler-clang.h, we've typically refrained
> from ifdef CC_IS_CLANG/GCC in the generic headers.
> See __nocfi for an example, where compiler_types.h provides a default
> empty definition, and compiler-clang.h provides a non-empty
> definition.

Yeah, I think that would be a lot cleaner and matches the other things
like this.

               Linus

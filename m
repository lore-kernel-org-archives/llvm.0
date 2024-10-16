Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4EE2101B7
	for <llvm@lists.linux.dev>; Wed, 16 Oct 2024 17:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729098207; cv=none; b=gTqaoCdOyYPoMD4wbMvTFMBOF8TsT5bbElzYFADdFkbvdLgF6Pby0IlBNYOWaPkN/lrVQV8nS9PIAraTTuuRPnk0yFyBAuW/GnUh90BsPnj6GBstN3sRMwEzuXd0rkk35XD9BV6MiYeDi+Stxr0cSETp67FWFk2ZpNuqB5e+k34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729098207; c=relaxed/simple;
	bh=f/ummaRRuCG9uUiZCZDzKV9LYoJWA6E413cWfBgrgkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQwchp8M0HgKocs/U87IEnMm6zKYSMNtXC58eHLGUu8A33RGk6sby44Rf/olTYP151i6xO03Aoa2NwwNrUUMV9bbUEi0WDXwfYar9DWFT68dVAm9omYbwVgpZpqP5VLJVSPgotZt1AxSDWbJ8M/yirKYlmsEe7oyik5LPd5nId4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S/Wi7rh+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S/Wi7rh+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d41894a32so13308f8f.1
        for <llvm@lists.linux.dev>; Wed, 16 Oct 2024 10:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729098205; x=1729703005; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6NQw3g/UfWLYCW0OnmDDAfoLvAyPJ8Gwf5pyCdbD+M=;
        b=S/Wi7rh+jdT/j8cRUmeAzxbdpySoSDOHFOZCNS33yvYugDEDRDdZMBVtVsIKLhWxLx
         wNlqKU5k0miPGJrswSmcYO4XzpKEWVAfiqhY/6CJc9kMYpmtw04EBrchbyTpeWb5hWE/
         Vam1ILL9XpzauFzDNPNZQaJn22tjOwRN6rfxFf8EhcpjvCUVdLBXWzal8qJ6qpfFflv3
         hkpjWJTUcSRYt3I7jJNt83JS4UWvIuelUrdF9TATN3J6Ybluow8dp4KMPuzA9D8SUvqd
         A3ZzDD1MCLPsLulHHnvNEMhhaFhlm5APoPyb3v5F9wHoKl8Jmuo8lKH9w38KHpT+cUou
         Xc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729098205; x=1729703005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6NQw3g/UfWLYCW0OnmDDAfoLvAyPJ8Gwf5pyCdbD+M=;
        b=qVMbZItoK8AvzxowimghmqhUuG79pjy6AmgdyN6/iXzHGnf3A9av0wZmjfGpIDyrGk
         iOMW9weq1J+96sqTy6JOIEGFvdxk6+X7b4VTw+FaklUiExbNUoIzjz7MAaf14x9J+CwO
         T0eVQNteh6Al4Ld6OnaclUrc7mmIWUObVnAhA+XvR/p98TzX2Nc57mz+4AfvXCMcwB4I
         kIhMGNkEZK1h/uAiYUWuSEcTD4MspAaRQY+8mykdnAjgDU8BUxxYqxTkDRzGxwDWzn1I
         KVeeosmSqz9KWBeV4sXfcU55xqaKFWBcP6BFbWTqbcQpW+aVOb/tDED+wbt4Bi1IbYdN
         2Q6w==
X-Forwarded-Encrypted: i=1; AJvYcCWm/wwjmOO5je+iaw566wpMKseVDnwQ/wu1hvWLDduo5NrFppOVQulHDhjIZVbhKH7iocg/@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7XaIFvytGnww+SDrPTHH08qRulIV3lyRU06CBDHWmp9GACjiZ
	/uyh+XpBQawVzg5Rii5aDpSeXhxPorxZoRx71AVNIPbwx0coeKGgDtVIlsvrDwMBFb/VkNrTgCU
	hl54UOr8Rtpe28EAozo5DARkLGsGGwyJDfLWt
X-Google-Smtp-Source: AGHT+IEqeiZSkbrI4YnBSZrXg2BTTyC1pkP7ycvQB0JOgIEkg8lTnedO3VPHI70vDkeusHVa0f75pXN3IJk45GFNGq8=
X-Received: by 2002:adf:fa87:0:b0:37c:c4c0:4545 with SMTP id
 ffacd0b85a97d-37d93df72e3mr185806f8f.10.1729098204259; Wed, 16 Oct 2024
 10:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905170356.260300-1-andriy.shevchenko@linux.intel.com> <f02e0624-ad4f-473c-b172-6dadea37f600@intel.com>
In-Reply-To: <f02e0624-ad4f-473c-b172-6dadea37f600@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 16 Oct 2024 10:03:10 -0700
Message-ID: <CAKwvOd=m7bMWLVNRcr6BA_gBaqKmZ1NOd0=Sa5322FZZ4jAmqg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] x86/percpu: Cast -1 to argument type when
 comparing in percpu_add_op()
To: Dave Hansen <dave.hansen@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Uros Bizjak <ubizjak@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 8:45=E2=80=AFAM Dave Hansen <dave.hansen@intel.com>=
 wrote:
> Since I'm making comments, I would have really appreciated some extra
> info here like why you are hitting this and nobody else is.  This is bog
> standard code that everybody compiles.  Is clang use _that_ unusual?  Or
> do most clang users just ignore all the warnings?  Or are you using a
> bleeding edge version of clang that spits out new warnings that other
> clang users aren't seeing?

Note the W=3D1 part in the commit message.  That's the part people
generally don't test with, but the bots do.

On Thu, Sep 5, 2024 at 10:04=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> When percpu_add_op() is used with unsigned argument, it prevents kernel b=
uilds
> with clang, `make W=3D1` and CONFIG_WERROR=3Dy:

--=20
Thanks,
~Nick Desaulniers

Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E5D21105
	for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719566506; cv=none; b=YaYz08VKsrYJENfwm/nS2gfyU2dfYtNvVjkjsqrrgFa2oYstRK8FaAEm1PfHIQaiT9Im6a1aMtd+ajeGDVmyQnRS2QK8Pv4i5UW/6QwSXPBkvq2SrURkVLyBrihjFNnuIx3TeU17yFOKJtBXfrE0cTbjsu/MuI8nNYg7/R4VM/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719566506; c=relaxed/simple;
	bh=GUUeOl5OTYU1P+SJ7athIDCY6ruVMMiJN7zw6ctaH28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwPS+Rc1MAbGdy9F7YVvOgsSx2aQSvpFBYCm0pzVtjCPCDSLvQjgu0CkqN1X0SbNOS2fDtQtiXRLDQ6ZAm6Dz4buTIyo+mVPQAsmb3hycwdCnF1t7et52NyQmXZrcqsjweENerxm5iELc3uTtWt6GCrl9Q8D8ERa6wcBC6MvG0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=uBISvJQ8; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="uBISvJQ8"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a727d9dd367so44228666b.3
        for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719566504; x=1720171304; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUUeOl5OTYU1P+SJ7athIDCY6ruVMMiJN7zw6ctaH28=;
        b=uBISvJQ8kGVM0DGsIecIX6ka2JVeR0exlpLsIT5xK7w0PBnLPDaiG4EDGI59i5wqI3
         IAD7VRJxJOCunnQknEH7H3yxIVbUvcrU1bgftrcQcv4TRhK2Fhd+YmplZP2X52feleIu
         zX9B2JDD2nbQmirlkecK2DHRgbu2b2pv2G0SIzkZR9rAbiBllQJuIXJ9itnvAL+Z1Oqu
         MiWqRWbTTPHkxb0MjsisQGiCMzoRUnNu7xyrsx1ZqCpZ4a+ubUQsiKfqRh32OV5r8o7k
         xqB4pcelardsZCIkSG5xFg0PQ5+3BAF1Erjyit6uZ3E6ZOC7FvTVB/WtINLBCgSMJUIN
         VMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719566504; x=1720171304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUUeOl5OTYU1P+SJ7athIDCY6ruVMMiJN7zw6ctaH28=;
        b=QhmxCnXiYtbwPyxKzSGgV/FUrUhE3TgQ1lo1fW6zIgdNcuC6JjsNoYbECOLbDBlwrh
         T6ZKgMDMtRalPmWnV3+xBm4KT1LYjFBdZekGPl/cWerJQhZsUANH0Save22Zyl/NrDg3
         kXQZD6a/oaBVbwGoxPT/VZTwEy7P8fVZ2OyPiEKkC43BEKAecrLyNppQd527AU6InhCg
         /4+CGtX78xGnXKUvnoqQNa0jzXZ7dD2krmstjsmWl2vMAnnVfIhDHJhrm9G2sYpvZIdP
         0s4Le75t4izrjNWw60Ge8Tq5BNuJkoSSqoCzw1xaE5BVswAaXM/EVtZkMrPYTg/qU67Y
         8ltQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoTTHNBFhAPvcH+ysBwV8IwTIWm4IkwsPQvjhiMeRll9I54ipqmey9dTAfFRgwXRQQNi805NW5V7YRskzLkdcmlQLiCw==
X-Gm-Message-State: AOJu0Yygzur2vSc0aBiQ/zx+2FXG5lY62Te+HtDAFqNmXgcxWu5nogLT
	l/94rqvo0oKT0UI3o0Vps9mGenb/izt2zhWvuJpou57K+6uVqcU6K8GKG/nbGjrqVdDW3W6FDK+
	uKHhVi9DxKwaE7599hibua0aG6Dmfecj6z9u9qw==
X-Google-Smtp-Source: AGHT+IF7NFei1EQBJfySUv3C79EdZFXolxqVCoTcA7eZAbhURusjPaToikXelhSoNh/rrjdKoBeJoJz3xOL6E3X1Vt4=
X-Received: by 2002:a17:906:c44d:b0:a72:548a:6f42 with SMTP id
 a640c23a62f3a-a72548a702emr1002466966b.18.1719566503875; Fri, 28 Jun 2024
 02:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240626171652.366415-1-jesse@rivosinc.com> <20240627-boring-handgun-40ae5bf2651e@wendy>
In-Reply-To: <20240627-boring-handgun-40ae5bf2651e@wendy>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 28 Jun 2024 11:21:33 +0200
Message-ID: <CAHVXubik-T=dv3hds4VuJFFxen1CRhfintGdOu3JsdAeouuOtg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] RISC-V: pi: Force hidden visibility for all symbol references
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Wende Tan <twd2.me@gmail.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Sami Tolvanen <samitolvanen@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Chen Jiahao <chenjiahao16@huawei.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

On Thu, Jun 27, 2024 at 12:35=E2=80=AFPM Conor Dooley
<conor.dooley@microchip.com> wrote:
>
> On Wed, Jun 26, 2024 at 01:16:50PM -0400, Jesse Taube wrote:
> > Eliminate all GOT entries in the .pi section, by forcing hidden
> > visibility for all symbol references, which informs the compiler that
> > such references will be resolved at link time without the need for
> > allocating GOT entries.
> >
> > Include linux/hidden.h in Makefile, like arm64, for the
> > hidden visibility attribute.
> >
> > Signed-off-by: Jesse Taube <jesse@rivosinc.com>
>
> Did you forget to add --cover-letter to your format-patch incantation?

I admittedly don't understand all the details but it makes the GOT
entry disappear and arm64 uses it too, so:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

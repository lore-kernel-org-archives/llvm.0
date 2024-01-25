Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3706213667E
	for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 20:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706215611; cv=none; b=mOkxuC8rR3r3/9qDO4K+fNISg7PSD6jBWRQSq/XsQqf878tk9zN8xMt0qsxW36TnMCR5K2Z2tJjcrPwFkVZdd07YfF+3fgwly08iKsx1isqW/0JnBpifGiGxT1TEzhtRFYqmfn5CQC62wgvh7Q1jDAgLEKl+Qga91rxbFR1nyIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706215611; c=relaxed/simple;
	bh=ouunYuQuL5e9JirkoCcY+XKKJDTYYnL7iTYoEB+yr0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1YQP67gCtkoAmGJonqLWoSN6FXlLTxEFe1o2pywWV7rI6fP10sBQaW/RUUKnSpIF7HeAgVYIhqtvxm0/e09EP0ZUn0ax5d9sBhsRZ7OfT1wtgUZn8Jr46n0H+PmZ0ivoNPD2TkrTRYn1d2xVNV3obLeGk5+0r+AzPtEN2hkFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3KgQau1H; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3KgQau1H"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4bd87fd64c1so362255e0c.1
        for <llvm@lists.linux.dev>; Thu, 25 Jan 2024 12:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706215609; x=1706820409; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJCIsrO2o9NvHQxNMc03LGFVf6NoDfQO8EJsLkzfJx0=;
        b=3KgQau1HmklTEaZr6MZU+wGeBTKStyMdF91fgnFppVBhl4G3F1QvCfdOi5a6bMkC72
         MWf0iGdNqRAH6EErUomU7nM8VvshwUMMozixh/5gPqKjJjjqBbaGG+omUM9eMLty6MBF
         lBneDHZkTfRb1EUQ2Vml1XLBE8HMpHCo8gtHQOqLok12IrPBT3/TTRFNs0u1WfNElY8E
         Qif/2W35rhhYKzNbE0UZ04lZdcfXleZHQUcBMwAUvoYkCp9BGW+3RRVe6VIMqAi0Av9T
         JRnratsUQ8leIqVoBHp3r/5MnBLooODkPLCP+0Ih4yJ0fyCWyhhX2XxjzWq4fald+SbU
         pKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706215609; x=1706820409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJCIsrO2o9NvHQxNMc03LGFVf6NoDfQO8EJsLkzfJx0=;
        b=T6s22Wa43yWADLbIE3KFZyJMyx7k+uMX7GvXGHhbXFLN0lNYWjClWC0CBJ8jdWM3rc
         5LNCFbR8vHNZHpA1PPcd9390L0E7ewXb27VnxMAW1o1wpcYgaVAQPjSSnXVUKSCXIlUt
         b1F0Im+iB63sigiGIgiwEZcYOW0AUXU00odmnu89EoWqG80HiwLzKWnkeQsuwbScW3w8
         U8Q+5fB/FsHJxtWDk3+GzNQ9Qjh1TxM+TlsQRZg7n/wd6FsEdpGUu/hw4w7A32Iw4+O9
         f7k4hpnw8pSyCvY+a505/9SGa5/P8VISqM/1v8V85GDMNpp/fZUg8o+gUkHI5lHQOsEz
         Rjeg==
X-Gm-Message-State: AOJu0YySE7NSHlVvXTBOwgKS7wh2x6sIWBXjCf/nvdoXWLj58pJWYA+N
	UndaeKiFuK0aYOP7i6nSc9EY94RG3Eb74wlU35Y5HY0QsBes32q+9RYLOQe6B9pPzXY95Z4q/Qk
	/CzIZPCc1wNSwqkyOEdSa2og2dF3brJJnquTH
X-Google-Smtp-Source: AGHT+IHI8Q8dDZexTdG1oWiuWwKZqI7C18nLfjSkoGLgeVlXiyjEX7qqaULmDSBIhQnv0IiiZWJY1/qCHVluRpNXcEk=
X-Received: by 2002:a05:6122:58e:b0:4b6:cde4:5217 with SMTP id
 i14-20020a056122058e00b004b6cde45217mr292246vko.29.1706215608955; Thu, 25 Jan
 2024 12:46:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240125112818.2016733-19-ardb+git@google.com> <20240125112818.2016733-35-ardb+git@google.com>
In-Reply-To: <20240125112818.2016733-35-ardb+git@google.com>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Thu, 25 Jan 2024 12:46:38 -0800
Message-ID: <CAGdbjmLEsj1cSnxoneSrDy2J2SFenjEdoYa_zoDQQhtU1nccMA@mail.gmail.com>
Subject: Re: [PATCH v2 16/17] x86/sev: Drop inline asm LEA instructions for
 RIP-relative references
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 3:33=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> The SEV code that may run early is now built with -fPIC and so there is
> no longer a need for explicit RIP-relative references in inline asm,
> given that is what the compiler will emit as well.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/mm/mem_encrypt_identity.c | 37 +++-----------------
>  1 file changed, 5 insertions(+), 32 deletions(-)

snp_cpuid_get_table() in arch/x86/kernel/sev-shared.c (a helper
function to provide the same inline assembly pattern for RIP-relative
references) would also no longer be needed, as all calls to it would
now be made in position-independent code. We can therefore eliminate
the function as part of this commit.

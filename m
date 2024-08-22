Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127B616D4EF
	for <llvm@lists.linux.dev>; Thu, 22 Aug 2024 08:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315977; cv=none; b=c5tJRiEx1oFiNf+P167+HmDXn/663WgFtsIJ+EiiYC+MjaZtHPigQiplOEU4T6ssPbDpUUqXuK7ty3yCQYCPATMSgwjBUXSZvygnNm4NCr6Q33l4jF2XqfdrQgV+5IlytiPjkokeNsah+JcTZD5zW1bPQm92oYVXAicBkyMZds0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315977; c=relaxed/simple;
	bh=/eQ4p2wkfuEw0Nha5S3OKTT7W6j71aVIFBzaGsaDr1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8uJHlZJiVr78TgzYTK+JKCR0glcOQQtgxm0AxZw5XM0JZ1ZG8GvooKp+fKjb0KN3pKmiSpvFcClvBY6C0HUhFPj8+/AbMH9CMvj0oFGmEtQqhy1+zY/vSsCisO6qkMDuhCGgE+vKarGaouHonU+ApmequcpWVTiYWJXd7O308Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=DnPfic/S; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DnPfic/S"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e162df8bab4so558907276.0
        for <llvm@lists.linux.dev>; Thu, 22 Aug 2024 01:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724315975; x=1724920775; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eQ4p2wkfuEw0Nha5S3OKTT7W6j71aVIFBzaGsaDr1A=;
        b=DnPfic/Sqz/A0ScnOVRXlw6Ar1J/2I9OEbRqHjQC2wiOw0AVW3Dd1EPYpUfGptFTsm
         JAZYyAA8cqcznzrtG4bD+gWRfB6a4w57jxrRwVA6m54v6UjV7KKIlucUt8BBayrvtwzw
         jLMtk2nKYVp6i0U0SLIR91G4cZbUS9MeqB0bUX2mjm5zEgjsnNckGgS+T4p+TeaWW46d
         uZlvEu0HTOmqjaokKDlsSunZpP0v+YX8s3FJsgMFVIgrilZHgbfHIJk31jAp0eYun4hq
         n+pPma/o1ug9McU+trjVwVh2ZHY9wgFstk9+HicUqFxHJz+2e+nNJZYatMYQkUJG6KsI
         UjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724315975; x=1724920775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eQ4p2wkfuEw0Nha5S3OKTT7W6j71aVIFBzaGsaDr1A=;
        b=HJsP60io0+H0XoIE9VqV3QC2VkxIyswHke/fM8hxtrbDpzt1pPfdCpErTVpJClA6rR
         cx0HnDQJYytR+zV3xvT8CJOtiwXkG8yMBE9vZqPEzfnOxCa3hqxGhnqgTyvhbzQzwTgj
         ppOuptzek8QhhXP2+cRNlW0ulQiYP+Rcpjch5JjBM2M00R+BhfgOl9rotBpXCDgrqfZ8
         CpYojVyR/Wna6c9xLepgiDGDFSb5TPFurdmYrz3Gb5M2lKFgy5G8dnSWB/Vsi49b3NqX
         8S0vKEH8X6FCRInpGJhuRsZakicU1GaPoZuvG1bBx3aVjyZUMTFLc14jytx6pUojU14I
         9+7g==
X-Forwarded-Encrypted: i=1; AJvYcCUoXVmi/aDnH83ARfw7r9QClFiOME20uLJrfeQhk3WQx3kbWJZX2i1hgYzzjwZljxFsQd8G@lists.linux.dev
X-Gm-Message-State: AOJu0YzvlcGmhafJah2j5QPNY8EMrJxqoO/yW3qiZfH67//6W4hPeelg
	tDQsiDrGkNGKAZOFgRq+oygSh07V01ONo3nFaglxCv5rXxsYocp6sTIcAwGUqHT3F8yD7zGKRV+
	kIcYnKyf+bbzPSIrlChmj53zf8VTfwlOpkxTo5g==
X-Google-Smtp-Source: AGHT+IHkFdJeVV+WqzmMGZrvSF/bGpFOy2vIodVP1TRyAky2+0nTxS+aXkYfl2LkMvbDx6kyhrF2nGcG5PB1NQylZEg=
X-Received: by 2002:a05:6902:2607:b0:e13:c8e7:5bcb with SMTP id
 3f1490d57ef6-e1665555b3emr6002370276.53.1724315974761; Thu, 22 Aug 2024
 01:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
 <20240628-dev-andyc-dyn-ftrace-v4-v2-1-1e5f4cb1f049@sifive.com> <877cckadci.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <877cckadci.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 22 Aug 2024 16:39:23 +0800
Message-ID: <CABgGipV9R_=Sy1uJ3YMXzm3S9W=yHWxRD1J=drFaw8-Jesym0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] riscv: ftrace: support fastcc in Clang for WITH_ARGS
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Zong Li <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Evgenii Shatokhin <e.shatokhin@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 7:09=E2=80=AFPM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> Andy Chiu <andy.chiu@sifive.com> writes:
>
> > Some caller-saved registers which are not defined as function arguments
> > in the ABI can still be passed as arguments when the kernel is compiled
> > with Clang. As a result, we must save and restore those registers to
> > prevent ftrace from clobbering them.
> >
> > - [1]: https://reviews.llvm.org/D68559
> >
> > Reported-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
> > Closes: https://lore.kernel.org/linux-riscv/7e7c7914-445d-426d-89a0-59a=
9199c45b1@yadro.com/
> > Acked-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
>
> Shouldn't this be a separate fix? Still reading the details, but it
> smells like something what should be disabled when building w/ LLVM, no?

Yes, this is a fix. My intention was indicating the dependency. So
people won't hit into trouble testing it. I can send it in a separate
series.

Thanks,
Andy

Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA06564E
	for <llvm@lists.linux.dev>; Sat,  3 Feb 2024 00:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706919736; cv=none; b=uskqLORAqdUj8962PSzGlnDTMZpJGA9g4j9hmxsQ5Nf9wE3RwbsOKyYZhdnuOv82QVv+iQrYreVDWpDoC1ZEGB1KlPCeGzH7PtVTfakaW0TCJEkCD0wLP5P++biA3jnml9nEqdnLObIjeRgGCGiuSsbdiX0aR9MHCT+n5SCFKjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706919736; c=relaxed/simple;
	bh=C3o1qfywwUvUIabd5hwuMZUV/1xDnvYKJcKZvUvEyP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lf/te1Q0QIBamTB+tlAvBzXEa7Bj5VdVGw0prjJUl4H/jaIyyVIDX+ottChEnSFq8VQ57CSCyxi9q4v+gEnHvMqOpeLYS2zDz+BHhFucAaWhW9DzRoyjrfby8AefnX/9/GG1PvBNN9PIIsEMZji3PdcCOoicJfl2BOgpQqiK1Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QLvkZs2q; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QLvkZs2q"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7d5c7443956so1201427241.0
        for <llvm@lists.linux.dev>; Fri, 02 Feb 2024 16:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706919734; x=1707524534; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3o1qfywwUvUIabd5hwuMZUV/1xDnvYKJcKZvUvEyP8=;
        b=QLvkZs2qRK5BE/rCRKToV7nmoPfDLD2HBXITO4SAnwJeJyVqvbPvmAa4bY9YT3vIEx
         4nfHBeprDe7V4TXk27iRIBu46xoc6Gxu2+gQ0Z4YK3tf/mG/81sbbOJ5pY1fbvV8pI5Y
         CBDs3WyfWpteZ9g0ppdZR5nGSR9ORa4H+p3KEdlA/3tHjE/H6dKkHhURwYW5Kikr763y
         F8DG0tJSVk6PUZAkKe25hFTj4NqGPgzaD7sdo01HmibPNxETP1IDEub+bow6/MUqXy+1
         kUTpt1D12/m2MTkJW4eweTjTDX+p8WhAvd/DH0ymex6tiIK9tafG7CYpQSee8clPFgGA
         ifQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706919734; x=1707524534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3o1qfywwUvUIabd5hwuMZUV/1xDnvYKJcKZvUvEyP8=;
        b=sIaAxYtXK4dW6puPybH3Ors5kmmvnZwMkDqmIsC/FLDtWw94M2dUIiY0ou49lt7jdy
         qCAGvhY+d3B+A/wBjBWaTmiW1vwDt1kv1iHFLJEKfLur1lmLiEh62HdQRzYf8Gw5SOSS
         ugn25cqX9+9OibqTxwMsWM0C2lj8up2myJ7BgYjhtr1EQ0xXiRxUg1xbVn2BTcCzLJmb
         MeVQpgay8cr6V0RMeXxSbVIcgruIgyXy18V/mYmOhmeSIjDl3QIKy3rwBDSRGsy87tz2
         cbLuoSB/f/HqwDFl21JATvmOuh+rzXZr6KATGRXwbJCz+zUm6Bu+Zw4TIBOefMuQXkiY
         Uo+A==
X-Gm-Message-State: AOJu0YwtPR7nFPiF4++Sx4Dwz9JnAOGN2badcgkEeSjBFmQXfb3bJAKd
	B3XvE2M6GgTAp9bva0zMifvdhCZHma4NlWp7WHl0MJDlAi8qPACY4MlxINejSz3a81l0RHeAWgB
	VWh5Aq8gm1PzeMy57iCjJPSAa+OtoYROCFVtj
X-Google-Smtp-Source: AGHT+IFSIhEFEg3nGk8Qq4T6ff1tMbZrmfYUk214IAEgqeFc1NH2PoHc6yH0A1svYC8k8WQyWHifnBrhsB2roBVlmO4=
X-Received: by 2002:a05:6102:495:b0:46b:1c45:f269 with SMTP id
 n21-20020a056102049500b0046b1c45f269mr9900834vsa.24.1706919733626; Fri, 02
 Feb 2024 16:22:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240121182040.GBZa1geI5NxWSslvt0@fat_crate.local>
 <20240130220845.1978329-1-kevinloughlin@google.com> <20240131140037.GDZbpShX2b0elXlqDA@fat_crate.local>
 <CAJ5mJ6j-Vw2P=QLK-J_J79S35UggvZPtm5sia74=enR1qq9X9A@mail.gmail.com> <20240131182944.GJZbqRmBN_KDgK_nmB@fat_crate.local>
In-Reply-To: <20240131182944.GJZbqRmBN_KDgK_nmB@fat_crate.local>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Fri, 2 Feb 2024 16:22:02 -0800
Message-ID: <CAGdbjmJgu4euOTEzns4-7pqUWo8n-gNJiAfARoZWxw8T252zJQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] x86: enforce and cleanup RIP-relative accesses in
 early boot code
To: Borislav Petkov <bp@alien8.de>
Cc: Jacob Xu <jacobhxu@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Pankaj Gupta <pankaj.gupta@amd.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Michael Roth <michael.roth@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-coco@lists.linux.dev, 
	Ashish Kalra <ashish.kalra@amd.com>, Andi Kleen <ak@linux.intel.com>, 
	Adam Dunlap <acdunlap@google.com>, Peter Gonda <pgonda@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 10:30=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Wed, Jan 31, 2024 at 10:16:55AM -0800, Jacob Xu wrote:
> > We're interested in fixing SEV-SNP guest boots which are currently
> > broken when using a guest kernel compiled with clang. It seems like
> > every other user of SEV/SNP linux kernel code uses GCC to compile the
> > kernel so they've avoided this issue.
>
> Lemme give that a try here.
>
> > E.g. Google COS uses clang to compile the kernel and we've made do
> > with an internal fix for a while.
>
> Which means that, theoretically, you could forward-port this internal
> fix until the issue is fixed for real, I'd say.

True. I just think it would be better to have an upstream fix for
clang builds of SEV-SNP guests; I believe the first such SEV-SNP code
was merged in 5.19 if I'm not mistaken.

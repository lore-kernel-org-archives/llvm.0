Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236F847774
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 19:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707765095; cv=none; b=USfO94Ti3VIW1SnjNJX4oi3Ak06brC3aOxSOnDSiAF7hmeHILLz8OFLr6gioL6rkb1Pczo2EycNI1DmsBTWuIgF5my/2v253oUZBTwwfB4A+lSY2H3UiaM4+8i1zYHQ4M30vOQj4N/cdOSLqCx+4oiDl9pq80dPO4n847jkU9o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707765095; c=relaxed/simple;
	bh=uShb6ZcgqhX2ALUmZCWrjlz3y5tvNFOTevE37zcmKJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=teBwHUCy1A2FC8TUttP83baHtbXqgus1FlPknxq7uyak179qRhIvhLr/cFWIE2u8AqVC86myGYgpA/NXATspZ61fOXjKIr1fhV3K5BscjAGqbGsg/F4jmpKW14nXIEMQpZs7fvTMolOS2K4nSymXdrwc0c4Pxg2LRmGpYzTlCsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCktWuhY; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCktWuhY"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc75c5e3151so90550276.1
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 11:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707765093; x=1708369893; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uShb6ZcgqhX2ALUmZCWrjlz3y5tvNFOTevE37zcmKJA=;
        b=gCktWuhYFW50KEIzCfaNA6rA7MKGni04lr0pYOeoxG6HoDc5RvHSOGQ4L112oUlgxx
         0Qn54LgakWzalEGjqFUuwFA30J5xfgCrC/hRqVjPVkqcPe631TyXs8XOm5xfcaWPMctL
         dTDcnfGPihq+neQt/vrAgW/Fcqhii7rWnblmW9ipk7NudxqdHuqQ3l2JKesI+BGAqZ/w
         iI1UuyoSjExwd67ZUxOOuROBR2LVrs6B5D1LdCPQybHMt1YkY7u1kvKQzGOnudO9kUmu
         hTQg/XRxh1mquIC28zWeBActN5P0cAdIifTJl0stvh2dOBfMt/EJRL6pJH3enmPsQ27O
         GRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707765093; x=1708369893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uShb6ZcgqhX2ALUmZCWrjlz3y5tvNFOTevE37zcmKJA=;
        b=dKHwx/EjynMunkpT36L6TK1ZADWU3uJJ2uDKjVI3MihEneoNhSYCBxWub+Fsq7WGpu
         P69sswQk3YMIRz3w3EkpHE+SUpHumDlwk1zTZaYPbDOEvQUgqpMHIu8aRyueEwb7RJPZ
         WtHD6728IyG9P5FOg73fy7mGL5077dLbZYpP2s3TGYc6yFXz26Q4w+lctiq92sv/+YRy
         QBNhUGdmhW8kV5IN7qV1apYWLBkizbspn9jECpyV9+zX2vKvJylzURNKyQavdM/ATTEH
         sqTspHhlFNe0Bgoa2FCgXhMzUBsryDpzM1UtDVQMhKBtNufqdg/DPSs9/N4tqFQrDEzM
         FBFg==
X-Forwarded-Encrypted: i=1; AJvYcCVbmiUSG0ZNmobuX3O25DEky5/bk9ameqHBH43aWN0u/zTWMLIwyoM7Qlx2qckLY6hsTP/sF+XcZA2pxl/q/5IeYLPSDg==
X-Gm-Message-State: AOJu0YzpNGgfQ/oAzloURunvmLGPjUl5tbDVWN+nGsUs7Un5Uuc0NjOR
	FFOCMBG2KHERPDZdIjzw5SCmI7j8C0ldrbaOgOHkAA61Hp4Jd4iaKD5E8WtMFr+QGGHffHyJIZx
	G3+2MRdWrjHqUyW0X5GSDkpgRsWU=
X-Google-Smtp-Source: AGHT+IHqXLnUCxAsb7XvKnFAPSGDB3hUHETodqtr+uDm3QdrNT5WCj6II1sL9VaSLYPlv+uufOR+eCV6bruG7EgGquo=
X-Received: by 2002:a05:6902:4e6:b0:dc7:4758:7802 with SMTP id
 w6-20020a05690204e600b00dc747587802mr6000531ybs.48.1707765092762; Mon, 12 Feb
 2024 11:11:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240117-swiftly-parasail-618d62972d6e@spud> <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
 <CAOcBZORDaHHH3jTL3GO7OsDubhhyQE0Uy2uAjJpiRzrKBgqaOw@mail.gmail.com>
In-Reply-To: <CAOcBZORDaHHH3jTL3GO7OsDubhhyQE0Uy2uAjJpiRzrKBgqaOw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Feb 2024 20:11:21 +0100
Message-ID: <CANiq72=VBFvB9O9c84YxpBBftpfNnnXx-+Xes0h8h6rN3EN5pA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Ramon de C Valle <rcvalle@google.com>
Cc: Trevor Gross <tmgross@umich.edu>, Conor Dooley <conor@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 8:02=E2=80=AFPM Ramon de C Valle <rcvalle@google.co=
m> wrote:
>
> Sorry for the late reply. Sami might be the best person to answer this, b=
ut KCFI (not CFI) tests are lowered by passes that are architecture specifi=
c (see https://reviews.llvm.org/D119296), so we'd need to add support for R=
ISC-V. There is no additional work required in the Rust compiler besides en=
abling it for the new target.

Thanks a lot Ramon!

Then for RISC-V let's go for the `depends on` for the moment, and we
can remove when the support lands for RISC-V (ideally when someone has
managed to boot it at least under some configuration).

Cheers,
Miguel

Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F1C1D691
	for <llvm@lists.linux.dev>; Tue, 16 Jan 2024 23:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705448663; cv=none; b=uABfIdZteTTpH+OYo57ZUR0jiPC7gBufyErh7Gy+86wvj+hnI3eazVIGg1H1aubDi3wU08HNt6yWcAxUIRCpA4kB/gn21oecFMABZn/TcyDf8WRLcnbCdjGemkvIsSfDkeFy7TitnFrNHld3tKKvWg0lE0uStwcbp9PesNohFZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705448663; c=relaxed/simple;
	bh=9DmDWifX5Z6JOjtDY3idRRSQYZv+kZmuFZPwB+mkrwo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=VUJ28vxPdpg5BanPL/lpFZV5yF+Y/XGagXgkpS1pyPaJ6O8kt4qfYlYD6isV2bUZR5Tk4rDyrxfpwLmPfVMNpJjnKS9g2UzOhZpG6Fj4HTF4k+W7wr7pdCkNC+5RegYh4dzBL9cwO24HC+KTrdYE7u9JikQN4e4hJ9EiQDLnIa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rg/7r0d1; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rg/7r0d1"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7cc92a83200so2385304241.3
        for <llvm@lists.linux.dev>; Tue, 16 Jan 2024 15:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705448660; x=1706053460; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdQ6eiAEP5p2d80q3UGVJcNCex+HtcKgUxVE8iUlFVM=;
        b=Rg/7r0d1q9LDK8a0E3aQXldJrUOJKSpYoomCkqZeJqIhPn9ts4Ja+V6STJ3ii86tVp
         FMc1TqcdkdfuIiotIRcd6SuqpfdC68zcQ9orLqSlXcYPwG962857KNKj6cxWhjDqe4on
         x9iM5SWM/tuh3YskKRB8Vlo+A9aHzTAQvrRQK9BDHNfWGGxZloYfE0iF6mSo4hEOjU4h
         LrkgwtdR30V3pHnWWwGmI48kp8A8gFE9R786fv/76TiKxq4EpPzcXefcN//TOD2QNYVh
         EWl/u+Za47Q5dyPH+JGUCTzVRyzzpIfW/4QPu8C6EvyBtPPYhMCrQJVsuOdNXcNMwfve
         LxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705448660; x=1706053460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdQ6eiAEP5p2d80q3UGVJcNCex+HtcKgUxVE8iUlFVM=;
        b=KnG/UU8wIxoKdnE0rAJY0AA8QYxidxcn6BAVA0/8AUnrloGHIkQmKlqR2zc1Q4i78R
         e4bhkP0zfsDfMSCAjw7z/YDYwLmZdz+3mASS4b1+FeuP9TGODWR0jcyJPSVsbQrdQlO+
         BKNaJZoM+5GkuFnP6LQXVCWHm8cqRzR+wrZ0UOSpC4gN5wdlEWFEYBS/so1tH5Ag/PJd
         M4pssbAVFWZgCBKMbtUrRhpvnimm2OOFaPZ23LzH5H4bBeILgRaRg7REHfzJrwXrKCD5
         RsbWKLEHVa15/Tgt+++uyJFll8pgN4bkRAoXMCdk7PK4dA6C/yHM7qvWqnwdZWqjA+GU
         O+ow==
X-Gm-Message-State: AOJu0YzXkpPRa0z6VQXAL6rmRzlwkKtEeSdRTZbZ9HsPHa4vspMNUwil
	p+5nd/HDDmWsFHa9/fm6Jdo3Gapex3y921HjG9OTepTvK8C7
X-Google-Smtp-Source: AGHT+IHyTwjhU9khtcKJv8NUtOGmEIX06trwG04+ik2FnF1wYm8lVJ6tIZBYJhmYaBLWiR0vQf/XBsl+DQARU6XGzSI=
X-Received: by 2002:a05:6122:3691:b0:4b2:dd80:4db0 with SMTP id
 ec17-20020a056122369100b004b2dd804db0mr3234536vkb.32.1705448660484; Tue, 16
 Jan 2024 15:44:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZZ7YuEexYSaZYmLK@tassilo> <20240111223650.3502633-1-kevinloughlin@google.com>
 <7144c0d5-8fb4-8d83-a854-ed597296c68f@amd.com>
In-Reply-To: <7144c0d5-8fb4-8d83-a854-ed597296c68f@amd.com>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Tue, 16 Jan 2024 15:44:09 -0800
Message-ID: <CAGdbjmJih4G=JG_6rLJnSAF8j3bhtLeREqDzuzFp-C7XWOqCCg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] x86/sev: enforce RIP-relative accesses in early
 SEV/SME code
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Michael Kelley <mikelley@microsoft.com>, Pankaj Gupta <pankaj.gupta@amd.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, 
	Steve Rutherford <srutherford@google.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Yuntao Wang <ytcoode@gmail.com>, 
	Wang Jinchao <wangjinchao@xfusion.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Brian Gerst <brgerst@gmail.com>, Hugh Dickins <hughd@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Joerg Roedel <jroedel@suse.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Michael Roth <michael.roth@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-coco@lists.linux.dev, 
	Ashish Kalra <ashish.kalra@amd.com>, Andi Kleen <ak@linux.intel.com>, 
	Adam Dunlap <acdunlap@google.com>, Peter Gonda <pgonda@google.com>, Jacob Xu <jacobhxu@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 7:53=E2=80=AFAM Tom Lendacky <thomas.lendacky@amd.c=
om> wrote:
>
> On 1/11/24 16:36, Kevin Loughlin wrote:
> >
> > @@ -61,33 +66,34 @@ static __maybe_unused __always_inline bool amd_cc_p=
latform_vtom(enum cc_attr att
> >   static bool noinstr amd_cc_platform_has(enum cc_attr attr)
> >   {
> >   #ifdef CONFIG_AMD_MEM_ENCRYPT
> > +     const u64 sev_status_fixed_up =3D sev_get_status_fixup();
>
> Why not also have a variable for sme_me_mask?

`sme_get_me_mask_fixup()` is only used on certain conditional paths in
the calculation of the return value (therefore, a max of 1 times per
invocation of `amd_cc_platform_has()`). As such, calling
`sme_get_me_mask()` unconditionally at the beginning of the function
would be unnecessary for some invocations of `amd_cc_platform_has()`.
In contrast, the sev_status is needed on every invocation of
`amd_cc_platform_has()`. Additionally, the `sev_get_status_fixup()`
result is potentially used multiple times in the same invocation of
`amd_cc_platform_has()`, motivating the use of a local variable.

> > @@ -130,6 +130,7 @@ static unsigned long __head sme_postprocess_startup=
(struct boot_params *bp, pmdv
> >   {
> >       unsigned long vaddr, vaddr_end;
> >       int i;
> > +     const u64 sme_me_mask_fixed_up =3D sme_get_me_mask_fixup();
>
> Should be the first variable listed given the length of the line.

I will incorporate this and all other stylistic changes that you
mentioned in v3.

> > @@ -110,8 +115,9 @@ static void __noreturn sev_es_terminate(unsigned in=
t set, unsigned int reason)
> >   static u64 get_hv_features(void)
> >   {
> >       u64 val;
> > +     const u16 *ghcb_version_ptr =3D (const u16 *) GET_RIP_RELATIVE_PT=
R(ghcb_version);
>
> Is this one really needed? The ghcb_version variable isn't referenced
> before fixup, right? It's referenced in both decompression and early boot=
,
> but I didn't think a fixup is needed.

You're right; it looks like we do *not* need the fixup for
ghcb_version in both instances that you identified. I will remove
these particular fixups in v3.

Thanks!

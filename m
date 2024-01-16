Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99691D523
	for <llvm@lists.linux.dev>; Tue, 16 Jan 2024 22:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705443218; cv=none; b=p6vsR6HX5za/JDTtOe9CrSRPQKSZfcIhdXldSQJ3VKf5Y74jq1iLnUUEov2UP8e2c9o3NNdhrBxiKbPrvkgVYrYvY0gyyU0vTP89ZEeAbuTDkw+CSm5yG0jaTFB1J5mG+lqzdEMJCfuNzK8tbyOtypSzeyPbFgSQUtfnfUpUUlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705443218; c=relaxed/simple;
	bh=uXUySLhnCG85bx+rOKM7Gu9Ss1FziVWmsqNmRvNkWVg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=J4Es/Iuju3oE+kkydRyiFIAxtAUbbLdP7V0DYoRZt83RV6ph9/otJI/asfI/oTZZ7NXuFYJlJ8sW3HOXJyuxak/5Ukk2SVeWq3d/EH+vRytBZIzty6ZOT43kkNMea+tbfmiIEGNbYl7ZpfE27xBAwtWH+QsL+9fncysiyv8Hls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FcEZIRLa; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FcEZIRLa"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7ce9defc4c2so1620482241.0
        for <llvm@lists.linux.dev>; Tue, 16 Jan 2024 14:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705443215; x=1706048015; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXUySLhnCG85bx+rOKM7Gu9Ss1FziVWmsqNmRvNkWVg=;
        b=FcEZIRLa892/RovyeCzRNENzinsf+tGmMkFQS9DCJDSk9rwVLFm6e8f1PiIGEwERIC
         MzKa6XQpPvnj01s1bI7XB8gTGk+gIyHLOlfcH6Q9iCSKq6psFo8pwnS1a3ogI2c0OCms
         Mqq+n3TzDkWOObVOy5RbHBsGEtM0q7SBe2scl1EfZ8EcYTpO3SX1R+0NMKQZg47vQJOR
         Wk2DZOoyRH440DkcSs/eF063XtnNgC9xo87HzjYYJZ7c6g8q0iDpCSFIuJoow+vkXWhA
         pyesfjgvwNh8/ws5LBNjFo9ZSXiynNnL9nBKg70nFqC0MXpznJ7M9/ZBqYghkwPytM1U
         Fsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705443215; x=1706048015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXUySLhnCG85bx+rOKM7Gu9Ss1FziVWmsqNmRvNkWVg=;
        b=QpPwnK+ulAgtgk+coDMyzQoxHNF03BV/WTX1y+pXpyh7JC2dRVHwAJWJD5OhwTWG4l
         MMYvd3jVgqpXyXIv0h+DVqgFFUo3SEbR+4NbxQ1UknDOFqgNTuj0Q0fD03pQ48T1f5CV
         /vpBfo7QfFh5ZWuQhU/2irYxjnZecAmkCjv8eKK/NhZaEXf3RSiRH2qbZCwFqG5CfOAn
         NB+T6ZYZCJZRmx3WROvsNF6hDDWrwnvByrIwTkNo3eP3U1g3VY1KvPR6tau4mFxxU52o
         cZOTFZhvXmbSxqKiIVV3IJ3XwCkyLgYSdqlH3CK7FJWTYF6FuItNsbCca2tpGv8F93j8
         EegA==
X-Gm-Message-State: AOJu0YxHxEN/g/HBKMQDjTPYAMHLxQe+jaIx8EisLyeM6gmZPBBiScoy
	ME8sNJ97amcXHSmtfS7odL6VeLLH0oSH6CBIs6m7vz2vLbpk
X-Google-Smtp-Source: AGHT+IEGScU0ZTL2QhTP1nMK173wqMj1xkpPYqcsbNcqk4CrqzbSWm31Y8eJbmw7bHyYix3JGRToRDf4tDjpfl1vLj8=
X-Received: by 2002:a05:6102:1811:b0:467:f7eb:8074 with SMTP id
 jg17-20020a056102181100b00467f7eb8074mr3965650vsb.29.1705443215629; Tue, 16
 Jan 2024 14:13:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZZ7YuEexYSaZYmLK@tassilo> <20240111223650.3502633-1-kevinloughlin@google.com>
 <20240112121725.3amxlumpifhagamb@box> <CAGdbjmLeyPhYfjVHPRa8LgNYjt9-rOPiyCodHoQOkEh9iQhjBg@mail.gmail.com>
 <20240115101239.nab725vuazvutgw6@box.shutemov.name>
In-Reply-To: <20240115101239.nab725vuazvutgw6@box.shutemov.name>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Tue, 16 Jan 2024 14:13:24 -0800
Message-ID: <CAGdbjmLrH_fZMS6pCX5pNKCJ2jLm1xAcJkHv5R4Z7MycvhbR5A@mail.gmail.com>
Subject: Re: [RFC PATCH v2] x86/sev: enforce RIP-relative accesses in early
 SEV/SME code
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Kelley <mikelley@microsoft.com>, 
	Pankaj Gupta <pankaj.gupta@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Arnd Bergmann <arnd@arndb.de>, Steve Rutherford <srutherford@google.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Yuntao Wang <ytcoode@gmail.com>, 
	Wang Jinchao <wangjinchao@xfusion.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Brian Gerst <brgerst@gmail.com>, Hugh Dickins <hughd@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Joerg Roedel <jroedel@suse.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Michael Roth <michael.roth@amd.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-coco@lists.linux.dev, Ashish Kalra <ashish.kalra@amd.com>, 
	Andi Kleen <ak@linux.intel.com>, Adam Dunlap <acdunlap@google.com>, 
	Peter Gonda <pgonda@google.com>, Jacob Xu <jacobhxu@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 2:12=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Fri, Jan 12, 2024 at 10:29:36AM -0800, Kevin Loughlin wrote:
> >
> > Per my tests, yes we can; I replaced the fixup_*() functions with
> > GET_RIP_RELATIVE_PTR()/PTR_TO_RIP_RELATIVE_PTR(), and guests with and
> > without SEV, SEV-ES, and SEV-SNP all successfully booted under both
> > clang and gcc builds.
>
> BTW, do we need both macros? Caller can do &var, right?

While I don't think the caller doing "&var" would work without passing
it as a separate argument like `GET_RIP_RELATIVE_PTR(var, &var)` (as
we would still need the original var's string name in the macro for
the inline assembly `#var(%%rip)`), we should nonetheless be able to
merge both into a single macro with one "var" argument. Specifically,
the only current difference between the macros is the input operand
constraint, and GET_RIP_RELATIVE_PTR()'s constraint will work for
both. I will make this change in v3.

> If we are okay with single macro, maybe rename it to RIP_RELATIVE_PTR().

With the merge into a single macro (and upon thinking about the
macro's behavior), I have a slight preference for
`RIP_RELATIVE_ADDR()` in v3 because it makes it clearer that the macro
behaves like the address-of operator "&" (just guaranteeing the use of
RIP-relative addressing to obtain the address). However, I'm happy to
go with RIP_RELATIVE_PTR() if you feel that's better.

> One other thing: I see you sprinkle casts to for every use of the macros.
> But why? void* can cast to any other pointer without explicit casting.

You're right; the casting is unnecessary. I'll eliminate it in v3. Thanks.

> > On Fri, Jan 12, 2024 at 4:17=E2=80=AFAM Kirill A. Shutemov
> > <kirill.shutemov@linux.intel.com> wrote:
> > >
> > > Also, is there any reason why GET_RIP_RELATIVE_PTR() and
> > > PTR_TO_RIP_RELATIVE_PTR() have to be macros? Inline functions would b=
e
> > > cleaner.
> >
> > I used macros because we need to use both the global variable itself
> > and the global variable's string name (obtained via #var in the macro)
> > in the inline assembly. As a secondary reason, the macro also avoids
> > the need to provide separate functions for each type of variable for
> > which we'd like to get RIP-relative pointers (ex: u64, unsigned int,
> > unsigned long, etc.).
>
> If we do it only on pointers, wouldn't void * -> void * be enough?

Only using pointers would indeed eliminate the secondary factor as a
reason to use macros. However, the primary motivation for a macro
would remain: we still need the string name of the variable for the
inline assembly.

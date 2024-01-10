Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC2B4CDF5
	for <llvm@lists.linux.dev>; Wed, 10 Jan 2024 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t1BTYmfI"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-467fc249208so174359137.2
        for <llvm@lists.linux.dev>; Wed, 10 Jan 2024 09:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704907712; x=1705512512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1gDQWRsTBn8FfuPpZdgTLj6dmGKzp9kvOi2HJqDhRc=;
        b=t1BTYmfIUL6q6ddNVeKn+UdYIFdk5nckTczMxDedvb5u9fjMCoACb4Ecq1XwKkI6e1
         5lSdxOGLd83a3Vb68W0yGqwV7LKDStwEQ1A2posiGMb9T80dh/VOx68giqA4eaaO6mat
         5mMIVZ7BI0L+XUwab8pyJZYzgmR8F1LbFeEcKbrkh2DP8S8IOKIFE5CEP9uU3Rob5XQa
         BrTRhfS+bf+t8BbK1BFWdd16am8P2qokw77B9Lbrnh5auhNGqi7b2uMtIy+BHEZ+Ew9N
         ZaIgR5VszQ1EWh2lXj5coF22Tu168z71hb0J94r42QZ4dtuItrEgtCjbS78eGdLs/RG/
         6+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704907712; x=1705512512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1gDQWRsTBn8FfuPpZdgTLj6dmGKzp9kvOi2HJqDhRc=;
        b=RDWc4P2CArJUgsidRT8epC/+V9Yj/xRBqx1qAX8xKFOSOcJWJNT8MZEpbZh+SsW5kJ
         oaYW9l2oQjUF5TlGlqleTm4fhJcA+KUh4wHjcHhJ0158ZfWlHfPvFqHYTcTPxO6bbMNS
         YZAnZuk5tUOANfQwQ9XSSgpZTB6Yk1a70v/3viTvbtuGdBx15z+vQYAUDGIT8o7lYJ8M
         Tup1soabU1GEik26GQ96LWxE5IVaNNs6ENBUEegW/cJT9g5yCMIDx0lxoxnFqcHRANoK
         60XLCq1zBVyABHyMiey1z9hBV1lrxsJrNj1Dbr/yO8ocFwTOCfr2Pq5Fe5QWzk5nd1/w
         NfpQ==
X-Gm-Message-State: AOJu0YwqOZ9DpXYjWKzY1h+OgklRg8A06n2x68KW+ZV5ilhe4F1onjdr
	oRlnnrQpwD1I3d72+byltlcUwGQ9zoKqqgjk8Xsqex83lMen
X-Google-Smtp-Source: AGHT+IEoYRbB+JirhI0ipcDY02s6rgl5EC07s+Fc3so1lLucdbroukxYD53l0f0ymZVkJpINcTS4YfR3xJ093roH2P4=
X-Received: by 2002:a05:6102:5091:b0:467:e34a:e8d0 with SMTP id
 bl17-20020a056102509100b00467e34ae8d0mr1169324vsb.2.1704907712294; Wed, 10
 Jan 2024 09:28:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240110012640.1335694-1-kevinloughlin@google.com> <20240110133657.vbpzplchgaim3bya@box>
In-Reply-To: <20240110133657.vbpzplchgaim3bya@box>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 10 Jan 2024 09:28:21 -0800
Message-ID: <CAGdbjmK3oTE=3PizXrvux2XT1GLMPp=Fto-2ySfSf_Em4Tjnsw@mail.gmail.com>
Subject: Re: [RFC PATCH] x86/sev: x86/sev: enforce PC-relative addressing in clang
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Kees Cook <keescook@chromium.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Ze Gao <zegao2021@gmail.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pengfei Xu <pengfei.xu@intel.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Joerg Roedel <jroedel@suse.de>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-coco@lists.linux.dev, Adam Dunlap <acdunlap@google.com>, 
	Peter Gonda <pgonda@google.com>, Jacob Xu <jacobhxu@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 5:37=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> Similar issues was fixed before with fixup_pointer() tricks. Have you
> tried looking this direction.
>
> Relevant thread starting with:
>
> https://lore.kernel.org/all/20210920192341.maue7db4lcbdn46x@box.shutemov.=
name

Yes, I considered using `fixup_pointer()` as well, and I agree that it
remains a valid option to solve this problem. I just now mentioned the
primary downside to using `fixup_pointer()` in my response to Andi
(https://lore.kernel.org/lkml/CAGdbjmJcQeLWroBkbRC-cFQ6OuMHONsGLzpUrrA5k3uc=
8Rzkmw@mail.gmail.com/).
Namely, we would have to pass around `physaddr` from `__startup64()`
to any functions wanting to use `fixup_pointer()`). However, we should
be able to get around needing `physaddr` by using something like the
`GET_RIP_RELATIVE_PTR()` macro that I proposed in the same reply
(forthcoming in v2 of this RFC PATCH).

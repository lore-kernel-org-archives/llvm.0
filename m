Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9003F1AAAA
	for <llvm@lists.linux.dev>; Fri, 12 Jan 2024 18:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gsLxCLoK"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7cbeaacbcb8so1763178241.0
        for <llvm@lists.linux.dev>; Fri, 12 Jan 2024 10:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705084187; x=1705688987; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1csma4A5U64O+REmW+zu6/PA7desA13VUuUwLGfC3Q=;
        b=gsLxCLoK6n3WlpM2R67HHDhL+872sftnhtc25mof2Egd736LFCu+bxKYaj6DlYvrd5
         DGK/SI0x5osvwcd17tT63qeEvOU8NRDk3GEvwqmsZDZ+wp+YwMBBKBIYf2/Vsd0yr+4v
         NACRsOgUNm62F/iF8JcQ3/cxLN3hO0NLgKo5G0E6CmN0TpMJGhUwDhh1MHX0DMGIQJAZ
         n3YDfGlU0goaeiZeuzJ3hz3ECdocDukFKWhTmgvvIl6JmoDKhdm6NXooTb8J612/NR1n
         DMeaDmXgn5e02C8MEpA44BySH6QwScEhJArtUKoAlGhwNVKJ6qOGLf5W1DgsFJIQyDWf
         tCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705084187; x=1705688987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1csma4A5U64O+REmW+zu6/PA7desA13VUuUwLGfC3Q=;
        b=MmpnhNnA+xtjX8/m0UATcywxIsxfJ/vrpi/amQ3wILCV/CcIbXSh2EK81UJrkzauJv
         zOl65MVaRU2VA/zYfTr3UewDWaXIJn9/uk/ar08hJNAorMMJviGZGva6YBW0ZazP7fb0
         UU6IDFtJd85NWSOoFkDE91AXkSDHnC8mJ7qeHCTDKC60YOkM7+4JzdPXimClBqK5DipU
         WZmIVGDOKUHBVSPMDx4uBRqJt89zculyZbOGiKq22HRkv6NgViclDGGvqL8wZ77zbBy+
         S5bXI4S3rMW80OuCf1kfIJ0hj1sxsyavWcOXhHaMumZ9rLn4imr9PlCegHgp4V9lagvo
         xqsw==
X-Gm-Message-State: AOJu0YxL00jVziP8MPfTy02c4x858OwGh1+l3uHSa9Yo31oBnLPamzGM
	cNrSh92uHaG+2HDkAxuTM2kCRmB1FyDVmA5D5sLf0rCud0HB
X-Google-Smtp-Source: AGHT+IFbEsPC+6pQYmKgmUdqKvTP1jQV+FRoiuzD78v/fDaV2RhMwCdQ3K00zV5/Vj8TA9sq36+8X1YIL/ffox626bo=
X-Received: by 2002:a05:6122:3809:b0:4b6:f254:b234 with SMTP id
 em9-20020a056122380900b004b6f254b234mr1441346vkb.32.1705084187287; Fri, 12
 Jan 2024 10:29:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZZ7YuEexYSaZYmLK@tassilo> <20240111223650.3502633-1-kevinloughlin@google.com>
 <20240112121725.3amxlumpifhagamb@box>
In-Reply-To: <20240112121725.3amxlumpifhagamb@box>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Fri, 12 Jan 2024 10:29:36 -0800
Message-ID: <CAGdbjmLeyPhYfjVHPRa8LgNYjt9-rOPiyCodHoQOkEh9iQhjBg@mail.gmail.com>
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

On Fri, Jan 12, 2024 at 4:17=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> Can we replace existing fixup_pointer() (and other fixup_*()) with the ne=
w
> thing? I don't think we need two confusing things for the same function.

Per my tests, yes we can; I replaced the fixup_*() functions with
GET_RIP_RELATIVE_PTR()/PTR_TO_RIP_RELATIVE_PTR(), and guests with and
without SEV, SEV-ES, and SEV-SNP all successfully booted under both
clang and gcc builds. I have a slight preference for sending that as a
separate follow-up commit, but please let me know if you feel
differently. Thanks.

> Also, is there any reason why GET_RIP_RELATIVE_PTR() and
> PTR_TO_RIP_RELATIVE_PTR() have to be macros? Inline functions would be
> cleaner.

I used macros because we need to use both the global variable itself
and the global variable's string name (obtained via #var in the macro)
in the inline assembly. As a secondary reason, the macro also avoids
the need to provide separate functions for each type of variable for
which we'd like to get RIP-relative pointers (ex: u64, unsigned int,
unsigned long, etc.).

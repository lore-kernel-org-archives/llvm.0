Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816A115A6
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 01:36:58 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id e8-20020a17090a280800b001f2fef7886eso10815755pjd.3
        for <llvm@lists.linux.dev>; Mon, 08 Aug 2022 18:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=Urt9D1pDp7wJLd+Y0cr81FZpsM8CKH8Y5Qhm/oGPRYw=;
        b=qTFSHOsw7sTmZ8J+3Vb4qHel1OcWTR+DFo3zBm7rejaLneZfzv8fbBlKEI82iKj0RQ
         e+jrS2zD6zStvsHVIi4JXme6qY59WxDARcN0ESudFKRk3ocs1GP8Q6pG5Veu3MSnPQCI
         Ayp+NYTBLX5PUqCjo9FrffvUWwBA3AkTebPkkU3jgLOgUV/dsmsbZrYyCipdxjX80j16
         78/kba/PeHWonaT7WtVi2qr/fHMKNWE57Kriq63D0lw1a3rSu1zzXcNFY53XhoezzhRN
         JUZLQbOcsCpATHVwB+tcPtk9Iwbfy0eAImwAKBpCg0Qpn1IgCNt7x/o0sHaol+6fPYEg
         z+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Urt9D1pDp7wJLd+Y0cr81FZpsM8CKH8Y5Qhm/oGPRYw=;
        b=L6Eh/j7FO5piGIgms6v1Pj6Jf7Szfzv0RUnUdxAkHHEHTfRzViGsvLWt9YEALgWhCt
         HbOPl5JsHWff2cm54XSGircN3AxMFbkcG23LkaQawMOs0DF1/Ilf6N8U7iGIxrHSWIL7
         UwhSxUYLgdwraunP4FvLIdi1+DVghKXrcDX3A5zfm88cp4dzIlDcPS41DQvJW20Yy+jS
         Q5iD/EweDiKDiAt02s+txpT8xfi5bfbE8fos56ZKJ85ptDy5tHuTEg6DkNtingqzL9ek
         D6e8kBPWXzJI+xAzpwxqSS2HDJgxXvAWy8CqIhX4GGfDGdB9txyl8Ev89LMBEk+AGBwF
         l0ZQ==
X-Gm-Message-State: ACgBeo0AuYPLll8A8cBVC9kyGrnTp+U9jPtRn1UafvDpFO30ipE6JZL3
	9tIq7bJAk0lb8uIWMAqe9Ur03g==
X-Google-Smtp-Source: AA6agR5bAuHo4NxgRj11MLPcGSkbKoMA8lxtIH804DW6Jk6LmX8lOJCMo6fGe+dRf1BHF9gyzyPPjw==
X-Received: by 2002:a17:903:41c4:b0:16d:cb15:290f with SMTP id u4-20020a17090341c400b0016dcb15290fmr20883166ple.47.1660009017786;
        Mon, 08 Aug 2022 18:36:57 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:bab6:334a:f9d5:62ba])
        by smtp.gmail.com with ESMTPSA id j11-20020a17090aeb0b00b001e29ddf9f4fsm8807037pjz.3.2022.08.08.18.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 18:36:57 -0700 (PDT)
Date: Mon, 8 Aug 2022 18:36:53 -0700
From: Fangrui Song <maskray@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Nick Clifton <nickc@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Tom Rix <trix@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Nicolas Schier <n.schier@avm.de>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Ben Dooks <ben-linux@fluff.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH] x86: assemble with -Wa,--noexecstack to avoid BFD 2.39
 warning
Message-ID: <20220809013653.xtmeekefwkbo46vk@google.com>
References: <20220808192321.3490995-1-ndesaulniers@google.com>
 <YvFkmfHTUYGzeeQs@dev-arch.thelio-3990X>
 <CAKwvOdk0q1G--S7JhxOdN4KtCgDETDbkMMnfRZoCERfOmVyVyg@mail.gmail.com>
 <CAHk-=wiFDPvKZORw228YFWX_QTc7D0EoMEDP58P2pCocRSnsHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHk-=wiFDPvKZORw228YFWX_QTc7D0EoMEDP58P2pCocRSnsHA@mail.gmail.com>

On 2022-08-08, Linus Torvalds wrote:
>On Mon, Aug 8, 2022 at 1:32 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>>
>> Thanks for the link; I recall Ard mentioning the ELF segments are
>> ignored by the kernels loader in another thread.
>
>Yeah, the kernel loader is not some generic ELF loader thing.
>
>> Perhaps we should be adding
>> --no-warn-execstack
>> wrapped in an ld-option check to KBUILD_LDFLAGS at the top level?
>
>I think both the linker flag and the assembler flag are the "correct"
>thing to do.
>
>And yes, I don't think there is anything architecture-specific about
>it, and the top-level Makefile is likely the right thing to modify.
>
>I'm a tiny bit worried about "what versions of as/ld accept those
>flags", though.
>
>              Linus
>

If most ports don't need executable stacks, I think using `-z
noexecstack` is better than the binutils 2.39 specific
--no-warn-execstack (not recognized by lld and older GNU ld, so a
configure check will be needed).

Then -Wa,--noexecstack is not necessary: if the built relocatable files
are destined to be used with ld with -z noexecstack, the input
.note.GNU-stack sections are really redundant. It would be a difficult
story if the relocatable files can "leak" to the outside world where a
GNU ld without -z noexecstack may be used. But IMO this is not the case
for the kernel.

Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B404399DD
	for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 20:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416419; cv=none; b=ZXqQo6Bkw0H6CD5pz+U6OLlqhKfoHGSUAF9tAD8Qf6HJUJXincw7t9TGbdGq627YfitemLm0+NmBeRTkU/jWs6TjgqIT5rSF1ZloiR3mcXBLWHQPKt/E1EIepffwiK3fspVdREtn9Bd1DLV9o0/id0466IsWOJbn2iVvDyV/Vxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416419; c=relaxed/simple;
	bh=g8JbSv2uB9OVHPX6mK0/xKaLA1R5JXVM4OnU1gOEgUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhV7zPYY5GQTtsp1KRQVmPUWNYOkBX9EjXYK0HCnVGGRsiWjOmUPK2laUHrriwOC6DBzC859gMEU43JI6xdme8hVaEuGojgA7fWLPz1jM4UTWaRRAEcUet5vAO4lzKM93GDDRR4PckYopMe0pyaKgKNnC1A5G8B1gYl6b31H/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HgppED+f; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HgppED+f"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso3739972a12.3
        for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 13:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789416415; x=1790021215; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhpCYoKplrM1IaRlncQiHxwpj03BaeP0oenEDpXOAEg=;
        b=HgppED+fufQXE6Ui5oSQ2bKBhjGyMa++kumaJG6vQlBITw8RTSd36AJb/HpPWBFbam
         RjsyaasmYqbdtDW7TvyQSYEHGwJ9bMAZE1xIZ9oOdpmDe58JA25geLgqYzYXQIsed9Af
         e+cppf20FT0lsiedF2KSIKtbXZWcBUn4W3I5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416415; x=1790021215;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhpCYoKplrM1IaRlncQiHxwpj03BaeP0oenEDpXOAEg=;
        b=iTo8yoWN2Yt2PWUkmBelcYz814GoexYyza38/BNtso/9PmntJzt6cxVpJo5atRGhre
         xRdwu08gdltV9czbIOL5cWHqpQM+3OsIzmahYon+XNc/42U2VJDY4f+s/9MMGJfY7CnH
         HWpsjmGrYt0z/JgY+hOvJ6QmDJnD43Edl1yawxeHiyLXSv7k1GcBcnDoGHHEU3iM1JH6
         OCcnVlkNp8BoqVn7eHkTqtCqJ/68VVgXQ5t8N2faJNwAujJbi8gha9vPEoQMoMIDdgGe
         07TDCv0nrVRtmbhWfRUIxSYjTmJPaHfeJ76DPUQgDpZdln95Adv6VO7JukSZydo1amLN
         z/9g==
X-Forwarded-Encrypted: i=1; AKwUvBzBdjRCPO3/sM6UpbitCmf7xYb1M3U2SpTrVozHe1bMuWu/8EcNnL8ExT50FLQ3VIL6UK8I@lists.linux.dev
X-Gm-Message-State: AFuF++mIb7eWXbjp1T/3dL4zfCMvs6mTZGf9rzLgyBLDPbHLZN4bYqH+
	jtmSnsY7WLtdApOAIxkCrpeTnQg8u0ZHLCSUrQb7iTDlzGCV42oi4VTYYiyrtu+q9EZgwiULAcS
	2GNRasfRlsg==
X-Gm-Gg: AYBFou3mQxdGdgrJXLhuKFOuo35wL65PSxqJW0WOOes2XojF3cJX88LMRBqzJGHOFM1
	Uw6ikBhKit+Tt+vhrZ9ZqB8zvg1yGxrpiOOdU/dEb7SgMBV1QgiRPc+PyLA0adoXeF41jsZ1yN4
	o8+4E6pCe5Wl0i3+hj1m2xiJDizl6++oM5gaLNy6+aoDHPpX7Vp5g3Cj2abWf8wKFYNHcXu5JaM
	5fRsG1fEr3tIgUy6l6xuD3+/p/kFxVM6k8Gh2yAy7UX846et+zx79FvOFj2bUxNMJvN/XgvzObW
	d3an8jQNAZRdyggWxcu0fBVvt1ov9anY/Vgspdc1XvegwCffyVUHuoSfhF7ktlWd5vlCVOAEPY2
	xVOkMZuUzDxINJKgWRl+ULbQAGTiQ2UXMbvJxTc+3bOQiB7dSwR/BliVT2ZLx/3Nsmb8CWC7BQC
	MuDqzjOebuakHlGohhmAwr99l4AQFLbq4r8x5mHZL8uTj/9+dlGHKkJ0rbZe/oj6egxI8ml/ViN
	1fXaAFWvYHMjngu9/amS0Trh8TB+nolwsbx5MQKF2eERyPaHNa7rgRr9Qjn
X-Received: by 2002:a05:6402:46d0:b0:6a9:9230:7ee6 with SMTP id 4fb4d7f45d1cf-6a9f61e7da5mr2383505a12.6.1789416415382;
        Mon, 14 Sep 2026 13:06:55 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5831187sm4809368a12.1.2026.09.14.13.06.53
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:06:54 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe7so342892466b.3
        for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 13:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBygO9MgKCLgW4TvgMYTkol1A7JtCPgWfPhhtVI6Eion7a3rwlpNYTcDRzXYgk6MfNlqe/Y+@lists.linux.dev
X-Received: by 2002:a17:907:6d1f:b0:c25:5faf:b207 with SMTP id
 a640c23a62f3a-c29b84c9a48mr280688866b.3.1789416413732; Mon, 14 Sep 2026
 13:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org> <aqhLhVMkNzf_4oJw@jpoimboe>
In-Reply-To: <aqhLhVMkNzf_4oJw@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 13:06:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
X-Gm-Features: AcwNN1XwkDuRyfqGBvPSv1hGEYJIl2TPFZFoOf2g9mdtKKeoU1aAJmlE5veL8PE
Message-ID: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] objtool: cache relocations, do less work
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 12:44, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> BTW, I found another initialization bug: klp-post-link.c uses
> elf_create_section() to create a reloc section, so it missing the
> initialization of rsec->hashed in elf_create_rela_section().  But that's
> moot if we just get rid of the hashing.

Talking about "getting rid of the hashing": the instruction hashing is
obviously a big deal judging by the hash size expansion in that other
patch.

Do we actually look up all instructions by hash in the first place?
From a quick glance, it looks like almost every user of "find_insn()"
is looking for just certain *kinds* of instructions: calls, branches,
returns, endbr.  And branch targets.

Maybe stack updates? I didn't check.

Yet we seem to hash them all - even if they are just some random
ALU-only instruction that is in the middle of a function and never a
target of anything and has no impact on any code flow.

So the question becomes: do we actually need to hash those
instructions at all? Are they ever actually looked up?

I don't know this codebase at all, so maybe that's just a really
stupid question. Feel free to look at me condescendinly, shake your
head and say "Poor Linus has lost the plot".

[ And yes, I see that whole "next_insn_same_sec()" thing, which
obviously *does* look up all the instructions when you iterate over
that function, but it strikes me that using a hash table for that is a
bit strange when the natural way to do it would be with juyst a
"struct instruction *next" field instead.. ]

So if hashing was such a big deal that it showed up clearly on
profiles, maybe the answer isn't just a "make the hash table larger".
If a "next" field were to not only make the hash table much smaller,
but also mean that next_insn_same_{func,sec}() would become a "follow
one pointer", mayeb hashing would become rather cheaper?

Stupid? Or maybe "not completely stupid, but too painful to change"?

         Linus

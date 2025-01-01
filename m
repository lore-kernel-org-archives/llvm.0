Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75A028DA1;
	Wed,  1 Jan 2025 02:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735699435; cv=none; b=FeKf0ZH6YFkdED06zIcnVyVf1V7u4JHbRyUwrXqjtYkcwO5T+Is+J8K3FyiMkZ6tOMpfQQ4/PedgXZ8vOegxwM1aiuPt04XuzPfScP79CXLqHeAa5yjUgWRbElunwk6nUpxdvgvaQcHhC+HPxmXDe1mEf9odlH19VNo6Fwdf5JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735699435; c=relaxed/simple;
	bh=VZ+StQg/WKi3iiiExgx/YCP2fRO0RPXVWh01Ab7twhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfLx8fkRjMV7d9a7giWHFKEUwPZ9xi0dkCyqLCvwTthMiDtevYAvOy2FTj/ZDaQUgpVywlrUCnlKw27K/FhmMecCTMQNUZxCK2Iq23ydZ+AkUtzSQcCfK1fIMsO77dauQsF9CvuU7lKh9ygWURDy5j7xS03yBVcthngm51N7gBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHP8KvIQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHP8KvIQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C56EC4CED2;
	Wed,  1 Jan 2025 02:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735699434;
	bh=VZ+StQg/WKi3iiiExgx/YCP2fRO0RPXVWh01Ab7twhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FHP8KvIQtMQSpxuqM2Zi7MqijwDgNlUiIsT1tIh/1qwHIb7MEY+hqwMvxFNipTUzq
	 ADYozAsF1XqG8jbtbJt2mB1BAWYzetP4CYlh8SinlkPjwrm/HaJAvebPovV52Oq9N2
	 pTWf3UVWxeW4TszQlVSqGOQfjL06GHuTyR02xEtAfupWLz+QXpkr8LpuKq+O2kN3Hz
	 1K/GptP50xLMGPkltUY3+RxwyrwYUvvj7Jc/0cErlbLB12aLPxmUdnBErxQDB/StgQ
	 i9qDvF3io/thj3nHEPyeZ9sY4uvOTAxAsXSfR1lgEPsGcCJhTJKbUj6mUKZhEmdnKu
	 4Io0S4lkuxc5w==
Date: Tue, 31 Dec 2024 19:43:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>,
	clang-built-linux <llvm@lists.linux.dev>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>,
	Kevin Loughlin <kevinloughlin@google.com>,
	linux-toolchains@vger.kernel.org
Subject: Re: [PATCH v4 0/7] x86: Rid .head.text of all abs references
Message-ID: <20250101024348.GA1828419@ax162>
References: <20241205112804.3416920-9-ardb+git@google.com>
 <20241231100137.GBZ3PBAdixv2CR_H9C@fat_crate.local>
 <CAMj1kXGAEc92TfEO-i+9SAmsso-NqqX1HbqFf49CC-QbOmpT1w@mail.gmail.com>
 <20241231103510.GCZ3PI3gSuuDzkG1q4@fat_crate.local>
 <CAMj1kXEj7-PadFJ57uYUTC_TCicX6E56rSiEF8Rr9_vH_G8PoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEj7-PadFJ57uYUTC_TCicX6E56rSiEF8Rr9_vH_G8PoA@mail.gmail.com>

Hi Ard,

On Tue, Dec 31, 2024 at 08:29:17PM +0100, Ard Biesheuvel wrote:
> (cc Nathan)

Thanks for the CC.

> On Tue, 31 Dec 2024 at 11:35, Borislav Petkov <bp@alien8.de> wrote:
> >
> > On Tue, Dec 31, 2024 at 11:12:55AM +0100, Ard Biesheuvel wrote:
> > > I'll look into this asap, i.e., in a couple of days.
> >
> > :-P
> >
> > Thanks!
> >
> 
> I had a quick look, and managed to reproduce it with Clang 14 but not
> with Clang 18.
> 
> It looks like UBSAN is emitting some instrumentation here, in spite of
> the __no_sanitize_undefined annotation (via __head) on
> pvalidate_4k_page():
> 
> arch/x86/coco/sev/core.o:
> 
> 0000000000000a00 <pvalidate_4k_page>:
>  ...
>  b72:   40 88 de                mov    %bl,%sil
>  b75:   48 c7 c7 00 00 00 00    mov    $0x0,%rdi
>         b78: R_X86_64_32S       .data+0xb0
>  b7c:   e8 00 00 00 00          callq  b81 <pvalidate_4k_page+0x181>
>         b7d: R_X86_64_PLT32     __ubsan_handle_load_invalid_value-0x4
> 
> So as far as this series is concerned, things are working correctly,
> and an absolute reference to .data is being flagged in code that may
> execute before the absolute address in question is even mapped.

It appears that this is related to UBSAN_BOOL. This is reproducible with
just:

$ echo 'CONFIG_AMD_MEM_ENCRYPT=y
CONFIG_UBSAN=y
CONFIG_UBSAN_BOOL=y
# CONFIG_UBSAN_ALIGNMENT is not set
# CONFIG_UBSAN_BOUNDS is not set
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_SIGNED_WRAP is not set
# CONFIG_UBSAN_SHIFT is not set
# CONFIG_UBSAN_TRAP is not set
# CONFIG_UBSAN_UNREACHABLE is not set' >kernel/configs/repro.config

$ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper defconfig repro.config vmlinux
Absolute reference to symbol '.data' not permitted in .head.text
make[5]: *** [arch/x86/Makefile.postlink:32: vmlinux] Error 1
...

Given that this appears in LLVM 14 but not LLVM 15 and newer, I reverse
bisected the fix in LLVM to [1], which was actually a fix from a report
from Linus [2]. That seems like a reasonable change to blame, as UBSAN
is generating this check from the asm() in pvalidate() and after the
LLVM fix, that check is no longer generated.

It does seem fishy that __no_sanitize_undefined does not prevent the
generation of that check... Plugging Linus's original reproducer from
[2] into Compiler Explorer [3], it seems like __no_sanitize_undefined
does get respected. It is my understanding that inlining functions that
do not have attributes that disable instrumentation into ones that do is
supposed to remove the instrumentation, correct? It seems like
pvalidate() does get inlined into pvalidate_4k_page() but the
instrumentation remains. Explicitly adding __no_sanitize_undefined to
pvalidate() hides this for me.

[1]: https://github.com/llvm/llvm-project/commit/92c1bc61586c9d6c7bf0c36b1005fe00b4f48cc0
[2]: https://github.com/llvm/llvm-project/issues/56568
[3]: https://godbolt.org/z/cxhW5orxr

Cheers,
Nathan

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 91f08af31078..7887bac1fbab 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -414,7 +414,7 @@ static inline int rmpadjust(unsigned long vaddr, bool rmp_psize, unsigned long a
 
 	return rc;
 }
-static inline int pvalidate(unsigned long vaddr, bool rmp_psize, bool validate)
+static inline __no_sanitize_undefined int pvalidate(unsigned long vaddr, bool rmp_psize, bool validate)
 {
 	bool no_rmpupdate;
 	int rc;

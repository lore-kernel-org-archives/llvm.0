Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792458727;
	b=EpOLTS60sajKP579QgDonhh+oPw3EPZpfGW9qilKsmPlcg3BommX0gfU7GoqXKy1OOX+
	 YGkO/26o3LDTBF9on+jcjQ4l0uyGxlR1DsbWWBZQSwAGGFxNy+sZ/osms4aRp/DJBlUWj
	 udJuz4fTJtptwpEaqmvZW+zpUHppyeROfGQsboineYDHYyZTUQ/huUqVkVCpoFtMC8M1J
	 LjxXHFxa43fGqKltiirTmLexzWkDX3Mv06qsj6P+hKw7udpn4ZA+tHsYlDg/0skjMMpNR
	 LGLaqZs/t4r5TGwdPPmfptRj0qrwalEeK0jx9GzngTUE7HjAj5uSDuVqycADcvPhATA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458727;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:
	 Content-Transfer-Encoding;
	bh=O0M/YbM5lygtAmfbOg3WcN5OXpI23UNp1u8jJj8E36Q=;
	b=eAHS7XMRdULI8JbBABgIn4u/0TZvy6wnSZ3Hr7D/W8W59NgidzJGyTC35PxJg9vVsuf8
	 tMii4tr9JB6CBwmVE4eSkmFJl8l8P5c36JAY6EVkehq1uTKXbD9rrv0XFIvayDmN/HWgj
	 CQrl1ySx0bGtaqpiBPl0CftKP+uXKYNUAVdcXc/TSEu2fruZEd3OiCgzeSUzoJr3L4BTs
	 2aIPv7r5+gItttri86yXlkyu5rZFBvYZiWrGRLZxlrXFb+jMONqH1kjwuhcwNbghUBDWb
	 h0DGs1E0Dpfv0fuF7BcczuUt8M/btiFVafnKWZJRXvHTeOGLhAzODS7HBkb8NzocPKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=fail reason="signature verification failed" header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Cc4lcU6V;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1F5606A31C
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 01:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Cc4lcU6V
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3EB4740E029C;
	Tue, 20 Oct 2026 01:12:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uVtPxzSqsT91; Tue, 20 Oct 2026 01:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792458720; bh=eRjXcbG85F4jlGtFHHIATpzSSdXZ+qHaLx8RJ9H1BXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cc4lcU6VJZsELX8vdP+xwA0SXmEbtTFFe7QikS3M3hCQko7QH5vUUUD2EgtACoGMI
	 5Z1EaksLIIevKTLJtvne9yirPnOo2naXCOtkVwJZwa79ZAdqsmik2fZXdsLkpP+xMO
	 0EbQiY8jx8gAk0XAEXzIeGTugT5QeV3HqkbZ9723+1XNU/q5oARRBb/H+RDTPxvIA7
	 Zp1xxAGN52Ko2OIK9bMHMckQqVN108997wSFNJJwcJp55TE9qc7+yFC8awSWmN7hhU
	 GI3BMs0H/VwGwHAEJe5US9pc//YiUsW4r3IUyMwF4idSLDhSAWLZptcGCjlPipNLPs
	 WdGmReMXIM/zo6o5FQRER9fN7tKqhfDJrVkDqGLquGVvSEOtLj2bAVz63Pnp0+aSb1
	 sBPwZGK42yGYRu3Ru9fkPMNS9EuzZdsoFlKAqSHa0YhLkOTXJxuT1EuJf5KL6VSdAl
	 Wv1KA8XOt+Z7/A+Gmv/xTr4HyFRgHV1KdUqTH7FcNboye1KaJVLj7lu+pEH+iwsAYu
	 SANm0NKxmyFhRCyRpu0iehznYBwzPtAAQy4qt9/tr96TWytkU7mGXDD3cjjpEswNc9
	 43C2I1QChcUN0Myp5zwu36yGAN0Vk7rbzgr4Y8Efj3del26PYpaduCIkEj8eOLBLGe
	 YkTR5r9RZXhKXN/ScxFiyVxw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5977440E029B;
	Tue, 20 Oct 2026 01:11:43 +0000 (UTC)
Date: Mon, 19 Oct 2026 18:11:40 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Florian Westphal <fw@strlen.de>, Julian Anastasov <ja@ssi.bg>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/csum: Relax the len and proto constraints in 32-bit
 csum_ipv6_magic()
Message-ID: <20261020011140.GCata_zHOTeTXLdlr2@fat_crate.local>
References: <20261020003238.2823758-1-sashal@kernel.org>
 <CAKxU2N9paXhCuNknUzKx5dYxhXitLZ=OVVY7Sym1HV8Mow6cSQ@mail.gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKxU2N9paXhCuNknUzKx5dYxhXitLZ=OVVY7Sym1HV8Mow6cSQ@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 05:56:44PM -0700, Rosen Penev wrote:
> On Mon, Oct 19, 2026 at 5:32=E2=80=AFPM Sasha Levin <sashal@kernel.org>=
 wrote:
> >
> > Building an i386 allmodconfig kernel with clang fails since allmodcon=
fig
> > started building netfilter with GCOV profiling:
> >
> >   In file included from net/netfilter/nf_synproxy_core.c:7:
> >   In file included from ./include/linux/skbuff.h:26:
> >   In file included from ./include/net/checksum.h:21:
> >   In file included from ./arch/x86/include/asm/checksum.h:9:
> >   ./arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly =
requires more registers than available
> >
> > The csum_ipv6_magic() asm needs five registers at once: the early-clo=
bber
> > sum plus register-only inputs for saddr, daddr, htonl(len) and
> > htonl(proto). With frame pointers enabled, six general purpose regist=
ers
> > are left to choose from.
> >
> > In synproxy_send_tcp_ipv6(), the GCOV instrumentation lets clang's
> > machine scheduler move the copies of two incoming register arguments,
> > EDX and ECX, below the asm. Both registers then stay live across the
> > asm, which leaves four registers for its five operands. This is LLVM
> > issue #206307. The error goes away without either GCOV or frame
> > pointers, and it reproduces with clang 19, 21 and 22.
> >
> > Neither len nor proto has to be in a register: adcl also takes a 32-b=
it
> > memory or immediate source operand. Use "g" for both, so the asm need=
s
> > at most three registers whatever the caller looks like.
> >
> > ASM_INPUT_G, which normally replaces "g" to avoid clang's poor handli=
ng
> > of it, is not enough here. It expands to "ir" for clang, so callers t=
hat
> > pass a variable protocol, like nf_ip6_checksum(), would still need fi=
ve
> > registers. With "g", clang passes a non-constant len or proto through
> > the stack and still turns constants into immediates.
> >
> > Fixes: 403cec8ab6d0 ("netfilter: add option for GCOV profiling")
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> > Closes: https://dashboard.kernelci.org/build/maestro:6ad55fe255fda507=
603d2651
> > Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> > Closes: https://lore.kernel.org/a28df759-d0e9-41c0-97c7-5f89a18d54e2@=
oss.qualcomm.com
> > Assisted-by: LLM
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > Cc: stable@vger.kernel.org
> > Link: https://github.com/llvm/llvm-project/issues/206307
> > ---
> > KernelCI's kbuild-clang-21-i386-allmodconfig job has failed on mainli=
ne
> > with this error since the 7.2 merge window, v7.3 included.

This'll tell you how much people including us care about 32-bit...

> > Tested on i386 with KernelCI's allmodconfig-based .config: with clang
> > 19.1.7, 21.1.8 and 22.1.8, nf_synproxy_core.o fails before this chang=
e
> > and builds after it, and net/{netfilter,ipv4,ipv6,bridge}/ and
> > arch/x86/lib/ build without errors or warnings. The same directories
> > also build cleanly with GCC 16.2 (i386 allmodconfig). A 32-bit usersp=
ace
> > harness comparing the asm against a C reference over 2M random and
> > carry-edge inputs shows no mismatches with either compiler. No full
> > allmodconfig build or boot test.
> >
> >  arch/x86/include/asm/checksum_32.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/include/asm/checksum_32.h b/arch/x86/include/as=
m/checksum_32.h
> > index 17da953879976..f74873a5e3510 100644
> > --- a/arch/x86/include/asm/checksum_32.h
> > +++ b/arch/x86/include/asm/checksum_32.h
> > @@ -159,7 +159,7 @@ static inline __sum16 csum_ipv6_magic(const struc=
t in6_addr *saddr,
> >             "adcl $0, %0        ;\n"
> >             : "=3D&r" (sum)
> >             : "r" (saddr), "r" (daddr),
> > -             "r" (htonl(len)), "r" (htonl(proto)), "0" (sum)
> > +             "g" (htonl(len)), "g" (htonl(proto)), "0" (sum)
> >             : "memory");
> Same as https://lore.kernel.org/all/20260904000833.2058186-1-rosenp@gma=
il.com/

Except that Sasha's commit message explains it perfectly clear how this
happens while for yours I would've asked how you're reproducing this.

OTOH, I'm not sure I care about Sasha's AI's blurb about what params shou=
ld've
been in what registers and so on... :)

If only you guys would agree on how to merge the two, assign authorship a=
nd
drop the unnecessary blurb...

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698EF3DD87E
	for <llvm@lists.linux.dev>; Tue,  7 Jul 2026 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419673; cv=none; b=ot7NSSBpwDadSCkMPj7L2GAq/sWRZD5Q1w9SjYXSIVU3QYrPIW7hbHl8fUopZBEg4/tH33Y8HXtYi0Ud/kbIvOBgSRk0bvxRjDihn/U3mpUWPN05bPuXbjbekSNaib+qeYW8zyeV//a5UeK6T89XCn5vMQJche4G/ecKsuu4ExY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419673; c=relaxed/simple;
	bh=Et2YChCIgxBMzHN3HVyEe2kBLlRfEDaxSCtv5yTjziA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJG4fq+9vM5fnAJPEDJnX2iF3JTnvfMigm/+AX0CeK72h4YVaV2Fgbw9Mkug63Zc1i5Pq7ohaHnDJLXS8xKw3M3MJCjyerAIXk/SrpyTnqgKRMsPGbZCmDZ23BNoS3MsMh592XeJD3DZDB+S4DwxZ6cFHShuiVGRV2la29VxPow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id A7880F40C4B; Tue, 07 Jul 2026 12:20:59 +0200 (CEST)
Date: Tue, 7 Jul 2026 12:20:59 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org,
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, daniel.almeida@collabora.com,
	acourbot@nvidia.com, fujita.tomonori@gmail.com,
	gregkh@linuxfoundation.org, prafulrai522@gmail.com,
	tamird@kernel.org, kees@kernel.org, lyude@redhat.com,
	airlied@gmail.com, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <akzTCxnSgxba7Yen@luna>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
 <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mj1P9QykK6vbPK37hZkMLwd7RcgVWEcxxuE=9OL+4bAg@mail.gmail.com>
 <akNXvfSfue7_3tyd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <akyiZBPCaZOOyTw6@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akyiZBPCaZOOyTw6@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Jabber-ID: linkmauve@linkmauve.fr

On Tue, Jul 07, 2026 at 12:41:37PM +0530, Mukesh Kumar Chaurasiya wrote:
> On Tue, Jun 30, 2026 at 11:15:03AM +0530, Mukesh Kumar Chaurasiya wrote:
> > On Mon, Jun 29, 2026 at 11:11:44AM +0200, Miguel Ojeda wrote:
> > > On Mon, Jun 29, 2026 at 6:57 AM Mukesh Kumar Chaurasiya
> > > <mkchauras@gmail.com> wrote:
> > > >
> > > > Sure i'll bisect. Meanwhile i would still like to get this upstream.
> > > 
> > > It is very early on the cycle -- I would suggest bisecting first.
> > > 
> > > But it is up to ppc, of course.
> > > 
> > > Cheers,
> > > Miguel
> Hey Miguel,
> 
> I was able to bisect this. This got fixed in 1.87 with
> #![feature(asm_experimental_arch)].

On 1.85.0 though, with this feature allowed, the kernel gets built
perfectly without any need for 1.87.0.  You might want to require 1.87.0
only with altivec enabled, whereas on 32-bit we can build on 1.85.0 just
fine.

> 
> 1st commit that contributed towards this is
> e4f539ea17a3 ("Bump to version 1.87.0")
> 
> This caused another issue to come up while building
> 
> ```
> error: extern blocks must be unsafe
>   --> /home/mkchauras/.local/rustc-src/lib/rustlib/src/rust/library/core/src/../../stdarch/crates/core_arch/src/powerpc/vsx.rs:38:1
>    |
> 38 | / extern "C" {
> 39 | |     #[link_name = "llvm.ppc.altivec.vperm"]
> 40 | |     fn vperm(
> 41 | |         a: vector_signed_int,
> ...  |
> 44 | |     ) -> vector_signed_int;
> 45 | | }
>    | |_^
> ```
> 
> Which is fixed by 
> a78d1b092c9c ("Update stdarch")
> 
> Both these commits went in 1.87.0 and fixed the build.
> 
> Regards,
> Mukesh
> 
> > Sure, I'll bisect it first.
> > 
> > Regards,
> > Mukesh
> 

-- 
Link Mauve

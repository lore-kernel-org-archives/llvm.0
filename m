Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F14364038
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 17:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776791445; cv=none; b=Yp3aA85AoHD7vW0v4kXQFLbA+y9zLbKnVYJU8Kpuu0BWlj7noBrGm0x4stsTq2a8EqvfvvyI+ZwgH3p6LTfwpxMInLljSEBO+WNOHqHd4l9D0x03iOioEkRgKkKmTBnssGC39ze4F20+DTJSKGMdeQlsU3BspWzEJVTB+pRZKrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776791445; c=relaxed/simple;
	bh=Na/64lRMFc91Aus5mQaas5ANVkDJMBK1Dle2UAWwS9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xt5qTPtDRUpy2qR6FRFEWyaF8PMqA5171PhXUmgBACk+Wh/8H5t/nlrQU/GLt5KjgPInB2VsvTbmFztrtqxKDcZGGlpPqVR08Rd3YDKJQGUlnDOQQI9r/ffVzxYWNqzBoWeaJ/5EJZPbmSCdExbwju5kszzq4ZaZNY/tlwy4eII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 47C8AF40852; Tue, 21 Apr 2026 19:10:39 +0200 (CEST)
Date: Tue, 21 Apr 2026 19:10:38 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Gary Guo <gary@garyguo.net>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org,
	ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <aeevjubaW30LP8Pi@luna>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
 <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna>
 <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna>
 <DHYYH903GZVW.EU2UKXD2ET0S@garyguo.net>
 <aeenqoV-dWWW3tZv@luna>
 <DHYZLGGNTTLL.AV3V11M454BO@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DHYZLGGNTTLL.AV3V11M454BO@garyguo.net>
Jabber-ID: linkmauve@linkmauve.fr

On Tue, Apr 21, 2026 at 05:51:42PM +0100, Gary Guo wrote:
> On Tue Apr 21, 2026 at 5:36 PM BST, Link Mauve wrote:
> 
> > This works fine for the core crate, but now panic_qr also gets the same
> > issue, here it is with V=1:
> > ```
> > + powerpc-linux-musl-ld -EB -m elf32ppc -z noexecstack --no-warn-rwx-segments -Bstatic --build-id=sha1 --orphan-handling=warn --script=./arch/powerpc/kernel/vmlinux.lds --strip-debug -o .tmp_vmlinux1 --whole-archive vmlinux.a .vmlinux.export.o init/version-timestamp.o --no-whole-archive --start-group --end-group .tmp_vmlinux0.kallsyms.o
> > powerpc-linux-musl-ld: drivers/gpu/drm/drm_panic_qr.o: in function `<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next':
> > drm_panic_qr.f39a15fa3c72e9fe-cgu.0:(.text+0x200c): undefined reference to `__udivdi3'
> > ```
> >
> > From a cursory look at the SegmentIterator::next() function I don’t
> > understand where the division could come up, but it’s actually nice to
> > get an error when operations which shouldn’t happen happen anyway, it
> > makes it more likely to get them fixed.
> 
> There is divide / modular by 10 code. Although, this shouldn't really cause
> __udivdi3 to be generated for constant divisor, unless `-C opt-level=s` is used.
> Do you happen to use that opt-level?

Indeed that was it!

With CONFIG_CC_OPTIMIZE_FOR_SIZE=y the kernel is 4 MiB large, and with
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y it is 4.9 MiB large, but
CONFIG_DRM_PANIC_SCREEN_QR_CODE=y works.

As I target the Wii which has only 88 MiB of RAM, a difference of
920 KiB is actually quite important, and someone[1] is even making it
work on the GameCube and its 24 MiB of RAM where it becomes critical.

> 
> Best,
> Gary
> 

[1] https://github.com/Wii-Linux/wii-linux-ngx/pull/13#issuecomment-4233447365

-- 
Link Mauve

Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFDF2C15B0
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 17:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776793634; cv=none; b=g88AY6TeEDPX+aMuxqiKgufi9tZp9brUa+vyeBSQ6/KIHNzOIYqkUWx7d1NwTIFhx8FQAmmSUlIJFVags8X4XTJLFSbq/DPA67FTo3uC/hTQ4p/ZHsxxuBatHXZD9+zUXUkoHqNFrtjdq33jHfYeY5/+cib5e+8qcDoSMd0c4mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776793634; c=relaxed/simple;
	bh=nOSHrva2nXHzqZqGu1/iH9kaKHFuQj9BTdYURkrJ2Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCNZsdaaVVXM7tVcN2N66Yj7jZwnPgo2fYVJwxpK8Ka2nOV1Dp7jaYzI8Z5/S9DEb+HRsq3yDG5chzdx6hWdaSO7FWgpB8XKT40FdavDeVxOhfUYa0E9wdXRtIFCDHZfZ7hHxdTaLxaDnaxf4nm9rFWVO1VHezd/T/nQaPt/egk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NspH68nt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NspH68nt"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a9296b3926so26569695ad.1
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 10:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776793633; x=1777398433; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H/mDrKOFxxuG8D7mTy6jMBe8ODvCnPyqTfBHZNb5vVA=;
        b=NspH68ntIahEywDWWli70LGDJtFkcJxBra35m9oLp/D7EjCziHH9wwvDNO0WC9pIUY
         qwTfXOfRnqdMdzgoBA3tKw8ysFiS2VBMWxCqJ8vt8kDeMPVPftDk1ItqdlZyzmbk0eUE
         r6flTkGHGVYBWT8yP5+56C7IG9D/4ECN1LTFgqydHdqMNW86aZf3I5UmU0jUv2bpL2vp
         9LvFVj0l3297/VoW+FcY9FJUxG7YcPveth1/H15upkmq5L0qcGXChTz9Y3TMi1g63uXo
         U2DAkXlIV3JVhqJ7rYimqzOWCS/46lLQdOMT/rxDh5vUfOT4GKKb+SkoYp/LQ05WnB/+
         pidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776793633; x=1777398433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/mDrKOFxxuG8D7mTy6jMBe8ODvCnPyqTfBHZNb5vVA=;
        b=fDBUPaUU7kzssg1ZZq00ss4mRJFdmKRf3SDBqeBvOazaFPEF1W7XfqDWu+piiQ72fe
         Y4ZgXPxRPh80mbJxixGUEhOOfW3L3lZ+uBbr5RXB6lU3LoC/x7Q6mWXFfb7hCKtT9Z+s
         9cktg4fRLBdQ4c5GfKjke5o8diLSo3i1QVACgUUDUXpoEq/212jMm6X2enSjyDWYDmd2
         Vu+Lt6Z+w2TjLNIzgzJdH8ex3py6QfSHJ8+2cfMX6PfacOu4KC4+oET35E+Xz2+Z0UTc
         +Ga5n3d7TgVwV9GiErAiEMPQpCytMTrNI2QgQKbK0xz/Xp9ktCTsK3fZ0PB8mV1QkhbP
         tUPw==
X-Forwarded-Encrypted: i=1; AFNElJ+n/trvNxCocVfFmn+lyBvakVj9SA7H9/yveEP3IgnmZh+FcNUAPT3bvBjQrVkjhAXqKyHH@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpfsv3aVqHJUUkN467vcY9D4l9Xyj/0TdebBWbC7bQxlS3hJTR
	6vHRDSEvpRuSD9i4Dt9VhDqbGEr/jlv98WpuxiSnSKHf+ClLWFsFwc28
X-Gm-Gg: AeBDieuJ0sTxBtGujOl3oceAU/2gHYkBXELU8v/f1ra+/ZYEKdltE3qVrTl9Gd77aLp
	wN2YaVPqXZA/B4VkUf8fwizPZNQVfbV6QeGsAyrvwU4d8YkZQx5YscEAULFQZ5dx2FPNeXqD97n
	TkGfTjptKlRM7Zh8rHod5Vqn1hBFbcoGT7GPSTkgp1jQ3SeLYjDjLi9i/deBW87H52MQ7yBqH8p
	A+UeqdWprXqJCHbQjON3ctC83id9oRrYCdJblRyBR70L03h8REqWCFHiXaLpUYXWfRRHQ1zNErh
	ILw3lBh+dYxGivXLMiDL23bin+lJGq0cRkeVxC6XuTg/vYacsqEHop+JiVxvSMPcFXkehQc8goN
	JpLb7rrr9oy+OwO8J54JdS/83AOQYP60COK2N9XLym90YQMLVb2ru4FH+0MF/8eLp4+37rQL483
	efGQ3re/5vwQdAWS8hjtDgXQ+MtEajYUkEowONehIn/sXoeP4D7pqyc8s21kskw3y4vrmbam9hu
	yg9bIxf5nWeAJAE8ELy
X-Received: by 2002:a17:902:f712:b0:2b7:88d8:efde with SMTP id d9443c01a7336-2b788d8f36cmr33715215ad.7.1776793632622;
        Tue, 21 Apr 2026 10:47:12 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0d0f8sm132131255ad.47.2026.04.21.10.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:47:12 -0700 (PDT)
Date: Tue, 21 Apr 2026 23:17:01 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Link Mauve <linkmauve@linkmauve.fr>, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, 
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <aee3ivM9VkbqdQby@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
 <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna>
 <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna>
 <aedpk1iaeYyKPSOI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aeds6_8Mr_w38oYI@luna>
 <aeec_IzVJwlfarN5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <DHYYG7A745M5.VQY4GMDJNC1Y@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DHYYG7A745M5.VQY4GMDJNC1Y@garyguo.net>

On Tue, Apr 21, 2026 at 04:57:49PM +0100, Gary Guo wrote:
> On Tue Apr 21, 2026 at 4:53 PM BST, Mukesh Kumar Chaurasiya wrote:
> > On Tue, Apr 21, 2026 at 02:26:19PM +0200, Link Mauve wrote:
> >> On Tue, Apr 21, 2026 at 05:49:32PM +0530, Mukesh Kumar Chaurasiya wrote:
> >> > On Tue, Apr 21, 2026 at 12:26:51PM +0200, Link Mauve wrote:
> >> > > On Tue, Apr 21, 2026 at 03:25:22PM +0530, Mukesh Kumar Chaurasiya wrote:
> >> > > > On Tue, Apr 21, 2026 at 11:38:08AM +0200, Link Mauve wrote:
> >> > > > > Hi Mukesh,
> >> > > > > 
> >> > > > > This patch doesn’t apply on top of mainline, which tree did you base it
> >> > > > > off?
> >> > > > > 
> >> > > > It was on mainline v7.0 tag.
> >> > > 
> >> > > Great thanks, they do apply there!
> >> > > 
> >> > > I needed three more patches for the kernel to build on PPC32, I’ve
> >> > > attached them but they are absolutely not patches which could go into
> >> > > the kernel (except for the second, enabling asm_experimental_arch).
> >> > > 
> >> > > What do you think we should do about them?
> >> > > 
> >> > Regarding the 2nd patch you sent, As the support is experimental as of
> >> > now, Let's wait till we get everything stablized, till then we'll use
> >> > nightly build for all variants of powerpc. Once we mark it as
> >> > maintained, then we can try to push that patch.
> >> 
> >> Enabling the feature is mandatory even on nightly or with
> >> RUSTC_BOOTSTRAP=1, otherwise no asm!() macro can be called and so the
> >> kernel crate can’t be built.
> >> 
> > The stable support is available on nightly.
> > Refer https://github.com/rust-lang/rust/pull/147996
> 
> In that case you should add the feature with a comment that it's needed for PPC
> only and is stable in 1.95.
> 
> Best,
> Gary
> 
There are some other build errors apart from this on 1.85. So few months
back in the meeting with LLVM team we concluded that for sometime
powerpc will be ahead of other archs at 1.95 till others catch up.

Regards,
Mukesh
> >
> > Regards,
> > Mukesh
> >> > 
> >> > Maybe Miguel can comment better on this.
> >> > 
> >> > Regarding other patches, I am planning to work on ppc32 once ppc64le
> >> > stabilizes.
> 

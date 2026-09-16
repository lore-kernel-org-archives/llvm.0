Received: from mail-pj2-f19.google.com (mail-pj2-f19.google.com [74.125.227.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AE5309EF9
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570015; cv=none; b=lGOyAvtOYQfm9Z4AhBrax8ihGFi6dm4GlHltoXQd37o7AuoPnlRWkCtwfI/fBdv6TeEhfx20BCKLmAyMbr+/LtVD187qG9di+XBmvgkbIzluVaVzNgDcni/BfyDxDSqLBtsnK+oGVClsqjrZPeFVD2KWgyEKjKwD1HMZ6zVWUL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570015; c=relaxed/simple;
	bh=ry0gP9/nte5FvnTqKFpnVOsUj0CotpETxmQQImGcUyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmhKRaq/1eZrFj0WPBnOOx6RpneYGTcFTVI6A8ZmWydMHyN+k7Mat6lCXMrM62IksVbDfPZB2zOq37hrn/NVHEKfNxXEoH9UtRD7FOI2LJVFWWoDi8um4rtQebKyqqpqScZnZg9G0WlJ5S6dokGZjpqXV1zd+g/Jy1M6rvdaBeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ku0b+fsp; arc=none smtp.client-ip=74.125.227.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ku0b+fsp"
Received: by mail-pj2-f19.google.com with SMTP id d9443c01a7336-2db18fe433fso8544185ad.2
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 07:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570012; x=1790174812; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Leygo7+6aTim/GwiqbwE1kTpWGv4lEshT5ezDgEePDE=;
        b=Ku0b+fspY3//zbO+fVbVcK1OnPNiI33zAv7ZjgKzsf0M80iQSBM6tNTN2P1h0HvKlR
         /Bqk+7/pl35N6PQWG0XTLOJmDXcqmPWlmftJRGHBXX1fPr4ZYQxl5nH2aDsL+dZaQQUu
         860HVsoQfvWnmvB8CMQKCqk5uUnFb4aOr1bxxO7q9goMalMVgeEU6LuGRUBjWX/Wh79Z
         CBs/ry4Zaqk/hGzaj3Zu/iKs2By6PAxvbqWjJWlMnDQAhUbls29kBZ+9GfqxXbomV5wU
         xr/6PoJPWb5w45yAtInS/FbHDspet0P/hKNEGQI/S7s2QWMKfuh5a73Vydtf4wc/Ut1n
         KwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570012; x=1790174812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Leygo7+6aTim/GwiqbwE1kTpWGv4lEshT5ezDgEePDE=;
        b=0zOjSLiTdXlfVH0CyCJMHTP3L84ZVs/1/jvvW3+BjQ+ZDtMX3A1Hw3MVR+pD0+NnNU
         8ws4s+JOYaY1LCZzX2FQGrj3Qm0W37G3O9B8gWtvDeJDjz1RxJ1zvcvyI6ZhLZR720V0
         9FCLel6juCofv7uqOBe+pgydtz79BVJd6nvMrOkwLkimfMDsIXF5U3UjvTrQLdcvBY9X
         tj30lsirVSHo9VlBYxV7qG/1XlXrL7MlYjlahWr/7rCkDZtCMVGFmUW9OyHqyTcSQN8N
         m+7EOhsp+DUYU3E+guy/8e9mtdn9SHy/nhmUekIrt/AbGpm8mtDh0rtakt1tmD2pfI4L
         7nAA==
X-Forwarded-Encrypted: i=1; AKwUvBysdroju22qTZEFeZYJ7WNQejJ6ktgT+7VIsHij9XUzKavlsiKZCy80th2VnE5GdkIFl/ci@lists.linux.dev
X-Gm-Message-State: AFuF++kbTFKDBxk3CkWHytXuASP4wH435JiNlE009VZURB/4L2HHxBLb
	XyxjKSygLw4gzjMljiYWnuIGSLvqT1pAnVoxPFzps6XfnoRolDYqEFP1
X-Gm-Gg: AYBFou10EdZp2shkLF/yjNPEGvWLJ9XqGuXFhSs+lGbqy+1jvvBfkNFbmK8jC1hbBX9
	mRzoWjHmyMfnbYINOT0vFxLO8fzfePAbFyJhBO8A+h6nu9+GAaRPmwtgkcveEEJKEjNrkqLMWiT
	pSIBd9Gk98fkhGZFCX40t+WkzDAq6jfN8epxX5aIGVnKb0HM80G1aSflIlesJOx/uBMkvbHGnD9
	MNXhaLKzka2yvvbeKNvCkkFd6vgcyR+ASqiKVV21DjKKQ7x+8KA5F42wB/NG7nu6W2KNgby50qH
	5uKI/7e4JCfWbcRHNAG328D91ScL5XVQ/34wptYQLc1D9kKbR9UFYTe81pc7qnSEow58Pps8tFX
	YCbmD1GSPRqf/zbuVpRPs4frFk3pyqSLbp+ZOyWJHGEhEMLJIdEqjPoH8gsRymrQrEr0lsdrZLl
	EVUaA5iNwAAevo27aELg7BefgxYTEEHNkQb0ZjFrNbe3IWRCguALvaAnpNsBK0DJjJXXuje43hU
	7FYdsLq+UN075Oxxba0PGNRuk1qNdTpEopYL+D25JDvQg==
X-Received: by 2002:a17:903:2f10:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2dd8e7aa5afmr63174535ad.20.1789570012227;
        Wed, 16 Sep 2026 07:46:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fe00sm13298065ad.12.2026.09.16.07.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:46:51 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:16:39 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: David Gow <david@davidgow.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, ynorov@nvidia.com, joelagnelf@nvidia.com, 
	fujita.tomonori@gmail.com, linkmauve@linkmauve.fr, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH V5 2/2] rust: kernel: Add KUnit tests for powerpc
 ARCH_WARN_ASM bug table emission
Message-ID: <aqqqKyquDoisxvZL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260915090453.1227034-1-mkchauras@gmail.com>
 <20260915090453.1227034-3-mkchauras@gmail.com>
 <236f1c15-9532-405a-818d-9bf52349f25a@davidgow.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <236f1c15-9532-405a-818d-9bf52349f25a@davidgow.net>

[...]
> This works for me under QEMU, but I have a couple of small suggestions.
> 
> 1. You should use the kernel CStr and kernel::ffi::c_* types, not the ones
> from core. This properly matches the way the kernel uses -funsigned-char.
> For any architectures where char is normally signed, this would fail to
> build. Which brings me to…
> 
Thanks for pointing it out, i missed this.
> 2. Why is this specific to powerpc? Shouldn't it be possible to do this in a
> way that works across more architectures? (Indeed, the current
> implementation happens to pass on x86_64 with the above fix, though more
> would be needed for other architectures, and there's probably a better
> solution overall which doesn't hardcode a special bug address.)
> 
> So this still seems like it's something worth having, but I'd much prefer it
> to not be architecture-specific if we can avoid it.
> 
> Cheers,
> -- David
> 
The dependency to support these on all archs as it is would be to probe
the implementation and figure out which will again cause it to have some
arch specific stuff. I couldn't find a clean way of having all that at
the same place without a lot of #cfg's so i just made it powerpc
specific.

Tomonori sent out a patch with a single test that's arch agnostic, but
for ppc I would still like to keep these if the maintainer agrees.

[...]
> 
> It'd be really nice to use the warn_flags!() macro here (or even all of
> warn_on!() instead of hardcoding a separate implementation here. But even if
> we can't (due, e.g., to the need for global_asm! vs asm!), it'd be nice if
> this were more similar to the warn_flags!() implementation. Not only would
> that reduce the likelihood of these deviating needlessly, but it'd better
> support more architectures, too.
> 
> For example, the commented "{size}" would help on architectures where size
> isn't needed.
> 
Let me try this.
[...]
> > +    /// With `CONFIG_DEBUG_BUGVERBOSE` the entry must record a non-null file
> > +    /// pointer pointing back into this source file.
> > +    #[test]
> > +    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> > +    fn bug_entry_file() {
> > +        use core::ffi::CStr;
> 
> Please don't use core::ffi::* in the kernel. The kernel provides its own
> CStr and c_char implementations. Otherwise, this can lead to issues as the
> kernel builds with -funsigned-char, but core::ffi will use the architecture
> default.
> 
Sure.

> > +
> > +        assert!(trap_addr() != 0);
> > +        let entry = unsafe { bindings::find_bug(trap_addr()) };
> > +        assert!(!entry.is_null());
> > +
> > +        let mut file_ptr: *const core::ffi::c_char = core::ptr::null();
> 
> Again, core::ffi::c_char should be avoided in kernel code. Use
> [kernel::]ffi:c_char
> 
Sure.
[...]
> > +    /// With `CONFIG_DEBUG_BUGVERBOSE` the recorded line number must be
> > +    /// non-zero (a zero line would mean the asm operand was not substituted).
> > +    #[test]
> > +    #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> > +    fn bug_entry_line() {
> > +        assert!(trap_addr() != 0);
> > +        let entry = unsafe { bindings::find_bug(trap_addr()) };
> > +        assert!(!entry.is_null());
> > +
> > +        let mut file_ptr: *const core::ffi::c_char = core::ptr::null();
> 
> And again.
> 
Sure 

Regards,
Mukesh
[...]

Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72153FCB2F
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498733; cv=none; b=Y2S8MT0isG10KabLBLDNHg2DPiZtWOMUdU7oF1ycixmpu/YwxzyBO3tTAelCDdYdF1vcOBeD74O55qQ6n/sLG5c5QSjfK41yplSzCfMhxwKrAoME0GZOvKdDXB7RSBdPA3C/zmctjKGwnMfEWG7f0UOQQKUKfiSIF7CT4UY7cY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498733; c=relaxed/simple;
	bh=nXuVdlrE0d05b1rMUSrzol4wnLS7LVrUEegBEgWQ69k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDmNbdq5mVPvF/kkhctRKqy8AGvbp9E2ktCerwAfUVai1f+MM1swx7vQB8EYYvwy8HXkdSmX4G3oGiy3QuvI41voISGEPgRTd8Yk8qBF1CoZXjM+f6oAptDUDrl2szKTxWo3gqD+1wyE/NvZ7wq8kcSRqE5/rlVhyeEWh2LJ70M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BM8voAVu; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BM8voAVu"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso449604b3a.2
        for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783498731; x=1784103531; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59q6kMti6TEuYkK2zAzI9NhF5BHSzay0sLHoUMAZAzs=;
        b=BM8voAVuuQyYiLbi2+l8EXi/ThtZICR5Zewx+unQNLkomvZQCYWru0sruGiD3esiUG
         wbC6EGkXLrA0JstnSuf+rdz0mABW5NJZj29A/q3miugQ/f6vhRo109KEkc3OFEAQ5up0
         qetNQcvTq/ndHCEu7YwsQHatfIC36NZSPTDrdgI19L7Z8G2RfVjly8dCUmOVDEw0OW1H
         dmu7Yot5hKGxP8GhWTNCGjm2G16C6ytzCYRVocSGj8lA5DSUmVZ+OSHaSbeL0XQkKOAV
         A1gv7MLeWHmv1XLR9UqeFiDH5/H4ETNRUXaepA9GjZoYSy9lkf9QVo+t9a6wwjjp04lD
         b90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783498731; x=1784103531;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59q6kMti6TEuYkK2zAzI9NhF5BHSzay0sLHoUMAZAzs=;
        b=gxaHoXLWsy30SnJpo7G/wFXOCSUb22AV8VYpUoXf92WioBO20TbPk68fZvkWC+YAL4
         Lqs79EdEW8bxaIo1D0d8t8YRq1GHagxqx4zS10PDJAH0xgnpPLl1hbsMxz7ttdW5ZFLP
         5i6Spahfdf47y/vIbUuTFlig6KlPqYFlEWbHZwcx2R7J5XTipxPzFSIt1I09ii7mJtcd
         0rBbJmF2xKQqBSa+qzFaxtAKCfB9W2Z/qVLqDz0VnZsnNb5UAY6KXNfOHG+UTOHtMmvI
         J01Q86LmkXyik/hsskKjME9Xjh5f+ifYWBdICF2eTYTJPf9DXoKlxDR6E0+HlVOJy0wk
         TgdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rryh+PIKmHMicfFjxWnsIxWJs8qLO1g5HgpVvCCxqNODlRTXlvzGYGGmoQftId1hmfQqgOX@lists.linux.dev
X-Gm-Message-State: AOJu0YybQSG6/xdCLSSRS1JYXK78tkjD/MwsUEpfUUdMwIcWBy2YU+/v
	BYuZUlOiGwUfD0XJGW/Vjltrmjn1YxO2ARAk/Y16Q8eHaY73NvHesPvJ
X-Gm-Gg: AfdE7ckAa/NEUAP6DoP0ciCzfVyrSowx9gXqOBDlnYQVzdL2MqKCv/4PeG0qTeLbsHt
	6ILBUNvpcDPpTUJG3Ix/bQUgnNvSzYpDZIJRER3pYDHsfWp7Q5TemfVI3onylRFZliE+HLu0mU0
	IMOiAjmT9wHVItjjTX66Ee911ol17XCRT/wUxH108n8h6QNWmAW3SlzjoP8W5EfQvqCy5TuIqf2
	mxyh9fK2ym1Ss2KC/ulrV/t8/B+9kAqZElpg7H/RY5kuC53YKp2x+GRwGCNa7NtUX/qXJI/s/OK
	Hzf2qNPDkbac/u8dHsM/08/2ZWMjBuZoAsHBbJPxE1CbinoP+rLbckdeM2XRS5Vd2kaYrCbT6ud
	87V3k7jwWfIOnSKRzXRDYlujtalcZbpD0oxMU+E6wf2SnpcC0DqgEgtAgS3OOX0wyMzC0eQfkzv
	BZqFE0ZZ5nDyk2bUfPEplORH21X3pfrpUogl1f5k44r8B09N5fv5/bFtgxD5kd
X-Received: by 2002:a05:6a00:ad6:b0:845:c8f9:6ce0 with SMTP id d2e1a72fcca58-84842f2af17mr1578608b3a.21.1783498731120;
        Wed, 08 Jul 2026 01:18:51 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162a49sm2012879a12.15.2026.07.08.01.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:18:50 -0700 (PDT)
Date: Wed, 8 Jul 2026 13:48:35 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, oleg@redhat.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, msuchanek@suse.de, sshegde@linux.ibm.com, mchauras@linux.ibm.com, 
	thuth@redhat.com, segher@kernel.crashing.org, ryan.roberts@arm.com, 
	fujita.tomonori@gmail.com, joelagnelf@nvidia.com, prafulrai522@gmail.com, 
	gregkh@linuxfoundation.org, nsc@kernel.org, japo@linux.ibm.com, lyude@redhat.com, 
	lina+kernel@asahilina.net, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V17 0/8] Rust Support for powerpc
Message-ID: <ak4HwGN_rJ9UN0Rt@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260708081633.1248382-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708081633.1248382-1-mkchauras@gmail.com>

On Wed, Jul 08, 2026 at 01:46:25PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> Enable experimental rust support for ppc64le and ppc32be. The patch for
> ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
> merged over it. ppc32 needs some toolchain fixes mentioned in the patch
> `rust: Add PowerPC support` and the discussion for that is done here[1].
> 
> This has been tested on
> - powernv9 hardware
> - pseries P11 hardware
> - pseries(9, 10) qemu
> - powernv(9, 10) qemu
> - rustdoc on x86 and powerpc64le
> - rusttest on x86 and powerpc64le
> 
> We are actively working with our LLVM team to get the target for ppc,
> ppc64 and ppc64le in the rust compiler.
> 
> [1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
> [2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com
> 
> Changelog:
> V16 -> V17:
> - Rebased to latest v7.2-rc2 
> 
> V15 -> V16:
> - Rebased to latest v7.1-rc4
> V15: https://lore.kernel.org/all/20260426105932.2270364-1-mkchauras@gmail.com/
> 
> V14 -> V15:
> - Fix an issue with rustdoc build on ppc64le
> V14: https://lore.kernel.org/all/20260426085725.2090827-1-mkchauras@gmail.com/
> 
> V13 -> V14:
> - 2nd patch is rewritten (Christian)
> - Fixed a small typo in rust/Makefile (Sashiko)
> - Fixed commit message in Patch 4 (Sashiko)
> V13: https://lore.kernel.org/all/20260424054742.45832-1-mkchauras@gmail.com/
> 
> V12 -> V13:
> - Added a patch for fixing build issue on ppc32 by Link Mauve
> - Added another patch to fix a build issue in dma-buf
> - Added another patch to enforce minimum `rustc` version for powerpc
> V12: https://lore.kernel.org/all/20260421120958.190430-1-mkchauras@gmail.com/
> 
> V11 -> V12:
> - Rebased to mainline (rust/Makefile conflict resolved)
> V11: https://lore.kernel.org/all/20260417152253.2312961-1-mkchauras@gmail.com/
> 
> V10 -> V11:
> - Updated `rust/Makefile`
> - Not all libraries are move to `rust/host` directory now. Only
>   proc_macro2, quote and syn are moved
> - Special handling for pin init is added. Details in commit
> - Removed mkdir for `rust/host`, this is now handled by toolchain.
> V10: https://lore.kernel.org/all/20260406200149.3727922-1-mkchauras@gmail.com/
> 
> V9 -> V10:
> - rust/Makefile updated with review comments from Miguel
> - Patch 1/4 updated with commit message and subject
> V9: https://lore.kernel.org/all/20260404121610.1956528-1-mkchauras@gmail.com/
> 
> V8 -> V9:
> - rust/Makefile updated with a directory instead of abspath
> V8: https://lore.kernel.org/all/20260403145308.1042622-1-mkchauras@gmail.com/
> 
> V7 -> V8:
> - rust/Makefile updated to separate host libraries from target
> V7: https://lore.kernel.org/all/20260329160254.2592207-1-mkchauras@gmail.com/
> 
> Changelog:
> V6 -> V7:
> - Documentation removed as powerpc is still under development
> - Added a fix for race condition in rust/Makefile
> V6: https://lore.kernel.org/all/20260210090023.2587534-1-mkchauras@gmail.com
> 
> V5 -> V6:
> - Added a missing Tested by from Venkat which got missed since V3
> - Support is marked as Maintained instead of experimental
> V5: https://lore.kernel.org/all/20260210053756.2088302-1-mkchauras@gmail.com
> 
> V4 -> V5:
> - Removed a nested ifdef from PPC64 for Little endian toolchain
> V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com
> 
> V3 -> V4:
> - Co-developed-by header added in patch 1
> V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com
> 
> V2 -> V3:
> - Splited HAVE_RUST in 2 lines
> - BINDGEN_TARGET_powerpc initialized before assigning the same to
>   BINDGEN_TARGET
> V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com
> 
> V1 -> V2:
> - jump label fix for rust has been moved to a separate patch
> - PPC32 support has been taken
> - rust support has been marked experimental
> - target.json dependency has been removed
> - HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64
> V1: https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com 
> 
> Link Mauve (2):
>   rust: Make __udivdi3() and __umoddi3() panic
>   rust: Add PowerPC support
> 
> Mukesh Kumar Chaurasiya (IBM) (6):
>   powerpc/syscall: Fix syscall skip handling for seccomp and ptrace
>   rust: Fix "multiple candidates for rmeta dependency core" error
>   dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is
>     disabled
>   powerpc/jump_label: adjust inline asm to be consistent
>   rust/powerpc: Set min rustc version for powerpc
>   powerpc: Enable Rust for ppc64le
> 
>  arch/powerpc/Kconfig                   |  2 +
>  arch/powerpc/Makefile                  |  7 ++++
>  arch/powerpc/include/asm/jump_label.h  | 23 ++++++-----
>  arch/powerpc/include/asm/ptrace.h      | 22 +++++++++-
>  arch/powerpc/include/asm/syscall.h     |  6 +++
>  arch/powerpc/include/uapi/asm/ptrace.h |  6 ++-
>  arch/powerpc/kernel/ptrace/ptrace.c    |  2 +
>  arch/powerpc/kernel/syscall.c          | 18 +++++++++
>  rust/Makefile                          | 56 +++++++++++++++++---------
>  rust/compiler_builtins.rs              |  6 +++
>  rust/helpers/helpers.c                 |  2 +
>  scripts/min-tool-version.sh            |  2 +
>  12 files changed, 119 insertions(+), 33 deletions(-)
> 
> -- 
> 2.55.0
> 

Please ignore this.

Regards,
Mukesh

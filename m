Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414D3423E9C
	for <llvm@lists.linux.dev>; Sun, 27 Sep 2026 17:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531063; cv=none; b=UPgTm7ONoYJpVz7D6x6v0dFkr17flgEdgUlfGRMLhXKOiy+tU3RgKKMLQVKGq20DAS+XVcmgKrq0B8QHOoWZXsw7FCpCoo1fdgTxYm5cKVThnOR3xeC9P6QjpeF8sNAk9O4J0FWaDQxLo8aKt9hy5JrC9y96CwhZdMwqFBA1h6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531063; c=relaxed/simple;
	bh=yZcaEjEYSswv0oPohOPwr5uDwkBOr45OOsHi7Uwm8/4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lkn3jK0ph0zMaG/s88MuZN1Ysz5EOZ2POL4U8djOe/QOup8HtGlP2tPJaWoj6jzUCefZyCkoUso5QhFL2RgOsbsEHfUA+wCJaPAHhiZHkXWZDTei1J9w8EKxGE73dMG5l4zb6JahlKrvHhaCFCgVr5BHPSXtk59OrcPsj54V1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBPHc9Tv; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBPHc9Tv"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso1819471f8f.2
        for <llvm@lists.linux.dev>; Sun, 27 Sep 2026 10:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790531059; x=1791135859; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFdg28cjkK57y5Nms1NhKpYwFl6OCJWFse4hVSZd8CY=;
        b=TBPHc9TvSDoF7i8QqD4A+USdLyiC2OfELvlCB8dfzKlXz5kidhozTxuUja1ZBDw4Gw
         szYv97aJk20GbmYhIPs+7EF0JVo1rEE2GsKnsiv13QcW2tA/SPQwW+q7yJNzK2PeMu5W
         aqN+vLbKiRThbMXXakIjs+h26Usbi53viwAd/SA8GvgjCY9VKiguk4CZT6ELAaAsFrRJ
         qTxhi1n5GQYcMlhsOkosZ3+gFis/6mWa28MHZoYpgTMFjNdxYhijAlaxFE38BRVCvzyf
         ua7HbFGebXyytyx6Xl2ItZLUVStdo1Fnbi9NGlEMiuKLtYQ8AloDr8fl9PLsz7+hbhSr
         fRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790531059; x=1791135859;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFdg28cjkK57y5Nms1NhKpYwFl6OCJWFse4hVSZd8CY=;
        b=hvhoOs9SWvJTSfT4pTREbtY16kbNVZP/ldX6A9zQTqgOvAeCRtYI29ZxGEve1r8pCA
         aDT2Mb40CY9TkTRq12bkW+6mMkIVp5vE9DsPIGvA6eabBNw6WQmkJd1M670QkvkA+xdH
         Pb16t3KQ/ydrCTHB8MYtJzIFvFMPHkdW5rA1mOrZdeP7nJRXzAZ0ov4b71vXcnilL4Do
         HNVYp7/hw5b6S+FN1D+CcvcyO+Xg/EcpPES0TKiYpGRBCT4tjcj26i7elvuT+deqyh/E
         U/zw6K1fsY5VrLVfhmQGZmG56E9833EMP5atP3rrwrz0Gb8DHnhvejpILXxJgVGIdD2v
         z4lQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrxKiqhfCwQtDKSIevcEPryufSzhvwMSS4WBSGR85jtfISWTHKgzyqxJdkcVgWHFAERtIi@lists.linux.dev
X-Gm-Message-State: AFq9FYLwoJ1nrtyNFHRQH+zrePhkn0c7JrMSBHwcZKHNXXfhcqEGr7hF
	u44Rf6HClbOV26BijWLrjIUX4noF7PQl7ieaKAh1jYBjPAZcVoA4zpFR
X-Gm-Gg: AYBFou0VbD23P0udzYyM/+cWv3Q3MoGyXEIKDBxhLT8AphawYjWriepNMNIb5i/n34j
	IR1puLCcZa39iYZCAhErNAHmMuq4JckFm1BdTrpiwn2y5KENluFV0AYLb+J2DCIjor4Sb8tFswJ
	4Yz4cHs5J+DR/lo6/zVKjhllzCTGAcqg5e/aDQ9k06y4EDJOEeaeV8QvddxWpuSnBIXuJL13QuL
	CdQieD7Yf5102CeUya9iUqlMu9S/fyrC1NBdoTDMkjBi9zUEfMgU0lp9W+wYZRA1qpCEMntf4lp
	d3elbaQc8iV6EL6ZWSkJ2O93Dm2Kx3dEWbdKE9aoYEHX6rqlIyQxgcaskrLKlWsuYcas/7fFLGI
	Xqu8L5TmEo+3yxFFEh3CBZbIY7o2DExDdjpNvsG8AHtKxCtjEYr25z23N2k7LaaXzj8JLxD+sXO
	zruxRr1wqAU7vojprbGcmQgg1IIxTUO3YhWiaPtO9ps1x0FAC/GoP8G2IgamaRKGVMWvefxzR7b
	5N6BQ23O9vAEI3zJ6HGnT4bn+WeIq5HbxU=
X-Received: by 2002:a05:6000:3105:b0:488:8192:c768 with SMTP id ffacd0b85a97d-4888192c8f5mr13570954f8f.30.1790531059310;
        Sun, 27 Sep 2026 10:44:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a4e9sm18464590f8f.11.2026.09.27.10.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:44:18 -0700 (PDT)
Date: Sun, 27 Sep 2026 18:44:14 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Biggers
 <ebiggers@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Marco
 Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, David Gow <davidgow@google.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, Nathan Chancellor <nathan@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20260927184414.6c0c8867@pumpkin>
In-Reply-To: <20260927131838.6774-1-demyansh@gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 27 Sep 2026 15:17:56 +0200
Demian Shulhan <demyansh@gmail.com> wrote:

> arm64 currently uses the generic csum_partial_copy_nocheck(), which
> performs memcpy() followed by a second pass for csum_partial(). This
> double pass exerts unnecessary pressure on the L1 cache.

Which workload actually needs this?
Most modern ethernet MAC support checksum setting on transmit and
checking on receive.
So the software checksum shouldn't be needed very often.

IIRC there is also code to defer UDP checksum validation until the
copy_to_user().
I'd bet (a few pints of beer) that the complication this adds isn't
actually worth while.
Even Linus can't remember why it was done, my guess is it improved the
performance of the userspace NFS (over UDP) daemon that would be
doing 8k UDP send/receive (fragmented by IP).

There is certainly still code to checksum data during copy_from_user()
in send().
Last time I looked I couldn't see why send on TCP sockets didn't go through it.
On x86 (in particular) copies can be done far faster than ones that
include a checksum.

David

> 
> Replace it with a single-pass implementation. The new implementation
> provides a general-purpose register path for short buffers and atomic
> contexts, and a kernel-mode NEON path for lengths >= 1024 bytes.
> 
> Measured in-kernel on an Ampere Altra (Neoverse-N1):
> - Scalar path: 1.2x-1.6x faster for lengths < 1024 bytes.
> - NEON path: 1.2x faster at 1024 bytes, scaling up to 1.6x-1.8x at
>   4096 bytes.
> On Apple M-series cores, gains are 1.3-1.7x below 1024 bytes and
> 1.6-2.4x above. No length or alignment regresses on either
> microarchitecture.
> 
> Patch 1 implements the fused routines and the dispatcher.
> Patch 2 adds KUnit test coverage for the new API and internal paths.
> 
> Tested: in-kernel benchmark module on Neoverse-N1 with both
> implementations cross-checked (0 mismatches); KUnit suite under QEMU
> (with/without KASAN, with PREEMPT_RT), exhaustive and random userspace
> testing of both routines against a naive reference with PROT_NONE guard
> pages, gcc 13 and clang 18 W=1 builds, checkpatch --strict.
> 
> Demian Shulhan (2):
>   arm64: csum: Add fused copy and Internet checksum
>   lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()
> 
>  arch/arm64/include/asm/checksum.h |   3 +
>  arch/arm64/lib/Makefile           |   7 +-
>  arch/arm64/lib/csum-copy-neon.c   | 168 +++++++++++
>  arch/arm64/lib/csum-copy.c        | 108 +++++++
>  arch/arm64/lib/csum-copy.h        |  84 ++++++
>  arch/arm64/lib/csum.c             |  54 ++++
>  lib/Kconfig.debug                 |  10 +
>  lib/tests/checksum_kunit.c        | 463 ++++++++++++++++++++++++++++++
>  8 files changed, 896 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/lib/csum-copy-neon.c
>  create mode 100644 arch/arm64/lib/csum-copy.c
>  create mode 100644 arch/arm64/lib/csum-copy.h
> 
> 
> base-commit: 93f51579e7df248780214094418f205253383cc5


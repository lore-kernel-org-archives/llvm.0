Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36241204598
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 20:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713265; cv=none; b=u6OXjyrmzwVjh+4SOhZRF1J1TV7lHJkcW9+/78KxbObqwBb1DDkzEdWKEcPQUTtmdLaJRHh298BSEo9IRnnac4Tb2CTrQgAPqr1UPj2aR0sy0zgmusXg3FPa/dig1WTuGU/o9WFRoEVHfKjPTkXkFN43GhVuLC7Llvr2Qkx+RRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713265; c=relaxed/simple;
	bh=9boX5RjKH1kzm2zLcZwRHipdg/zrvfXTq+2qRZO0/OQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gCLJC1QayMJSmclBNwpcQh5RikyopHI2G0SxcSjtebFiI179MiR+KlKVR0BFr6vPjUD23M5rtOC87Wq/8CTQn0NYgG/JRj1nVlIuQrHReT2CqF568yrlvnD2o1xi4AWf6/aMP28Li5fv/sUvUsI+oWlpysWMsYn4/1O15mZ/UYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=KsC3Et/Z; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="KsC3Et/Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=gLHvTlsS+s3jhc0v07AaO/IvSIJovAXmGpHhTOc1o5I=;
	t=1743713264; x=1744922864; b=KsC3Et/ZdtrVLhqZ5mNvv8/5t1LUXTSF28SZ0Dqnz6IW6/D
	SlK/9Eg/HgBWL8suFm8Z0UyQsEjvhQgHeEoh022PZLqE8gZwCvBX5SuJthEPghpmOLIXR3MZSv9+R
	XuM5zzlTFAPpGF6QkEX0LwIc5H4pXWEUKQBssricSkhjnKue26a3TB4EinzqlQB/jae0K7UvTOUpx
	Yyf4lBZqAcxPxYVIDgWUXQN5dlmgQ1RfZ5GRtmCMbhAjb9YQIPkmKTIgTb0fCVtzSFChApYZStXAy
	DbyuHpu6YV837UsdUamA5//dko4TCwO4phkeRjfGX6rPohrCvKsMdgCSei+m4XRg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1u0RTQ-0000000FOb6-0742;
	Thu, 03 Apr 2025 22:47:40 +0200
Message-ID: <5c8f9b27e77c793295c2f6a0c3a3794ec4c05c3c.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] um: mark rodata read-only and implement _nofault
 accesses
From: Johannes Berg <johannes@sipsolutions.net>
To: Nathan Chancellor <nathan@kernel.org>, Benjamin Berg
	 <benjamin@sipsolutions.net>
Cc: linux-um@lists.infradead.org, llvm@lists.linux.dev
Date: Thu, 03 Apr 2025 22:47:39 +0200
In-Reply-To: <20250403191910.GA3085607@ax162>
References: <20250210160926.420133-1-benjamin@sipsolutions.net>
	 <20250210160926.420133-2-benjamin@sipsolutions.net>
	 <20250402221254.GA384@ax162>
	 <413669a192e65d67059245d38c03828f85d20717.camel@sipsolutions.net>
	 <20250403191910.GA3085607@ax162>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2025-04-03 at 12:19 -0700, Nathan Chancellor wrote:
>=20
> Thanks, I applied that change, which shows a slightly different crash
> message now:

Pretty sure it's all just a bug in my inline assembly, and clang
allocates registers differently:

#define ___backtrack_faulted(_faulted)                                  \
        asm volatile (                                                  \
                "mov $0, %0\n"                                          \
                "movq $__get_kernel_nofault_faulted_%=3D,%1\n"            \
                "jmp _end_%=3D\n"                                         \
                "__get_kernel_nofault_faulted_%=3D:\n"                    \
                "mov $1, %0;"                                           \
                "_end_%=3D:"                                              \
                : "=3Dr" (_faulted),                                      \
                  "=3Dm" (current->thread.segv_continue) ::               \
        )


It _looks_ as though both %0 and %1 are output only, but clang compiles
it to:

  51:   48 83 fb 08             cmp    $0x8,%rbx
  55:   72 44                   jb     9b <_end_0+0x2a>
  57:   48 8b 01                mov    (%rcx),%rax

// start inline assembly ---vvv--- //
  5a:   b8 00 00 00 00          mov    $0x0,%eax
  5f:   48 c7 80 90 07 00 00    movq   $0x0,0x790(%rax)       // crash
  66:   00 00 00 00=20
                        66: R_X86_64_32S        .text+0x6c
  6a:   eb 05                   jmp    71 <_end_0>

000000000000006c <__get_kernel_nofault_faulted_0>:
  6c:   b8 01 00 00 00          mov    $0x1,%eax
// end inline assembly ---^^^--- //

0000000000000071 <_end_0>:
  71:   85 c0                   test   %eax,%eax
  73:   75 56                   jne    cb <_end_1+0x10>


which clearly cannot work? I must be missing something. Switching the
first two instructions fixes it, of course, but right now I can't see
what I forgot in terms of constraints to make the compiler not do that.
Probably trivial to someone more familiar with inline assembly.
Modifying the _faulted to be +r instead of =3Dr also fixes it.

johannes

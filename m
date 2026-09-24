Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487A49D5BA;
	Thu, 24 Sep 2026 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261698; cv=none; b=JAdCPd3yyWLE90126h4/AjOM0iE7Q54y7XHkvVIIjWrnlO0TMmSwBvDOE6HqArHhSLFvwW99CUPGW8ECufBfTMVZf9RPADkKsG5U2uGa1Ewqens2/EJLf8G8wHgCKRW+75w8omTeEd0KnND/Ak0GBftS7DhOvatN8ZhvTlnyRbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261698; c=relaxed/simple;
	bh=w7KRENjylDpHRXF+0mAtcXOZs1Kt5xjoiZU1rCb6qf0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N5A+n6Fihu+sy2DTUYtx0a3GHgwx1eHlz7+/+EYk2TeqUSWeLl2yv/6Ce4Ed5VYyKoOdc8hZM5QVh3BEO2nlfRWqsR3yZODxe80XUXV+bZ/nn6RNorBy+AqoBHZSGYGcwcNhKf97+gUeG+INXCiHvOSdyEgqlmy1pVz1ea6uFTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=qDaVCpLq; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="qDaVCpLq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=N1WNg5JHUPqQIIGQ25bIiCEbs9M7MmOQ1D2fjs9reqk=;
	t=1790261690; x=1791471290; b=qDaVCpLqbo9RbgCNT4HwHRidPzn1CjnxW/zCCo4kpHijTlw
	x4J6zyG++HW5F1viHMUJjaJRQLjfUUQ8TEpcEEPk1dLuIMxNtyZMVJjImyZ8cZb2zUQQSR6HFU4/5
	vLYf4+hOqxy1OYcdJsTFM9QWIuFBg3RffSXaXjHbeABjwWFVV8yxQke2nj0CEn9pkl83/91BndToO
	/IY8naUxVXJhBSCiSqnOmMxtCxX68oDiJQKkSy1THC3gm0m/qnLtx34TqC+sMXF76nhjiCwoY+T6R
	fwcs7LZyYGJ1W3KeANY6Kd19i4BxzTpg/kaq/65R4D8R54tEgUkPstuEkVORPzmw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1x9kqH-000000096mJ-2ehS;
	Thu, 24 Sep 2026 16:54:33 +0200
Message-ID: <e801211b4c71ddd919fa5d7b9c859b86addf3fb7.camel@sipsolutions.net>
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
From: Johannes Berg <johannes@sipsolutions.net>
To: Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner	
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>,  Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Oleg Nesterov	
 <oleg@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling	
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	llvm@lists.linux.dev
Date: Thu, 24 Sep 2026 16:54:32 +0200
In-Reply-To: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Fri, 2026-08-21 at 15:45 -0700, Nick Desaulniers wrote:
>=20
>  arch/x86/um/asm/ptrace.h               | 4 +---
>  arch/x86/um/ptrace_32.c                | 1 +

This seems like a simple adjustment for what you need to do in x86, so
that's OK, but I don't think we'll take this through the UML tree.

But for UML you can have my

Acked-by: Johannes Berg <johannes@sipsolutions.net>

johannes

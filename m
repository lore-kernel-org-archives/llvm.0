Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1EA29A1
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 22:28:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 79D7E1F85A;
	Thu,  7 Apr 2022 22:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1649370490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=km6cLSvcevUTiMWx8bdylNikiJbG874gtpsaUOE+xKo=;
	b=OQWeXtJtyDQCM4yM/PXITvLUzVSGb3pkrlHNB7HCBW1IUCYBcvcgcX5fZpLQofJ5y0xxHI
	NaWZVbCb5mbYR7lf2jTuaG4s9JXMKiYF5sRqO58NQE0PR7LT1I+QoXt7+VnzXOb+AbnmKY
	uGVfwrxZ9+t2AZVCltsN8hDV5SQ/QbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1649370490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=km6cLSvcevUTiMWx8bdylNikiJbG874gtpsaUOE+xKo=;
	b=QQ6ett+ZaKNSXw0mJnvlcfSPwRwWTQ7wqjNHS0CVcGJFtvV14risk0tkEMmqt6iJlcfFA4
	oyFNRD5vx//WELDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B52913A66;
	Thu,  7 Apr 2022 22:28:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id pC4sGnplT2IGAwAAMHmgww
	(envelope-from <bp@suse.de>); Thu, 07 Apr 2022 22:28:10 +0000
Date: Fri, 8 Apr 2022 00:28:09 +0200
From: Borislav Petkov <bp@suse.de>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	linux-tip-commits@vger.kernel.org,
	Arvind Sankar <nivedita@alum.mit.edu>,
	Fangrui Song <maskray@google.com>, x86@kernel.org,
	clang-built-linux <llvm@lists.linux.dev>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [tip: x86/build] x86/build: Don't build CONFIG_X86_32 as
 -ffreestanding
Message-ID: <Yk9leWxNnnuJWKcI@zn.tnic>
References: <20200817220212.338670-5-ndesaulniers@google.com>
 <164934565464.389.2546833245037255032.tip-bot2@tip-bot2>
 <CAKwvOdkQeSx3uy25KaTrX=ywc26wDEefXHbCB_ifGot+yXGvHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdkQeSx3uy25KaTrX=ywc26wDEefXHbCB_ifGot+yXGvHQ@mail.gmail.com>

On Thu, Apr 07, 2022 at 10:01:32AM -0700, Nick Desaulniers wrote:
> Boris, Can I send you a patch to replace this one (with a guard for
> clang) or a patch on top? i.e. what base would you prefer me to use.

I don't mind much, whatever Kees wants. I can just as well drop this
one completely and wait until you guys have fixed clang... or do the
gcc-only thing... your call.

> Using mainline:

The branch to use is in the tip tree and there x86/build - it is in the
subject of the tip-bot2 message:

[tip: x86/build] ...

Thx.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Ivo Totev, HRB 36809, AG Nürnberg

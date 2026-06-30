Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3A9312836
	for <llvm@lists.linux.dev>; Tue, 30 Jun 2026 05:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782798317; cv=none; b=qqPYs+5vgvLo/O+IolJXgQpHnudFVOj8Q4pwavZZS6BYohZvGTSH+dSuPtUlrFp/SAYLCyyPHz4vq4FjjoNF2yw+NOlv8cf+WOk0qn0ZumsSu/aj0szrQ/JxRPjU+7ydExOFWktPO96MidvcL3J+GoqV1ZstVg63G/uPviayj1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782798317; c=relaxed/simple;
	bh=ztzealyqI6xgOkTMvJbT6VMrtOx8sF1MsZ3yt78tkI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dC+oS8YWHCXxBtOvFj+igVp+72sLK9nEgTBfcD4WJIT/+Ts3xd5mcCK3m9H+/6rx2FaRdFG2ErSDVpI5hGfxaD253zheY7nfZMMNdv/QdcYQIFIzWygO4pEt/pSn5d54l65WIRpw5rFKpIO+qP1qqeYT34Vr71QSUHy8qDNoU4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERnebAAB; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERnebAAB"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-139f1dfc9faso3638501c88.0
        for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 22:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782798315; x=1783403115; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xie8EscmE8LK37ZpMwS/Fq6rd1I8uHsenBWRCUghSAM=;
        b=ERnebAABXf1NysCQv3hLINplnfagpDsYtO//eMRZGitzqhTTIk5S17rTg4NIks+0FY
         n+Jd4Tov4g/PrbHr6yS7CqvA1JZK02BFOUxJAGWfcNP0LZduE0r9EFuVmNzgb0PKf3ed
         kQNPob/8XCSZU/XrL+V8qhjsBUs5iMesIo+oEZke8g7PPAHJ48YCMyUMwKOJ//CNSFW4
         FA3oMkcQffcCcJgEBBQpDMFirdzPlT+/2AKHpfGTnaVkZwXAR+/9BOzFupwwzUVF5/Ig
         l2WBMMKkcXLYHB24W/wEteSS00IfKDb3BN1GHiQFG4Kg0WxV5XOZ/aSn9Q+eq2GKLlYz
         9/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782798315; x=1783403115;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xie8EscmE8LK37ZpMwS/Fq6rd1I8uHsenBWRCUghSAM=;
        b=ZjHrB8XXw5c9V9RwKk6AsgaqikFIUddE0xtMESmnDYpfZ1391roS0PxxpkXN9UlNqt
         O1vOdUiTwpVsm55ek2dWqQGKpZPI6EyxqctbPDTRwLUYzVs70QLY6kEVXsCaeX0NHzxd
         tEFTh6S27/H7WlyjsK7Lnvy4Vrgv1yRSdAfRtt0HV3UN5a0HWEUzU3VPFCD+Te9l6Cfw
         Hb3xc/nFOgMN54HaaxkuYYXAiUv0WhKPMM/iE69NgN7SzM8chvBlBjDV2tgj/Ro50EXu
         UbfPHLLy8WsSNTocz9RMbwLoJvADEn77BY/J0uJXszca/M0wl+PS34VzJzEwRGBtmStU
         xe4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9uuw7Djd9F0s1kRBb2So9er2Lb6nJ3lD8y2e95L7WU90KyMDRD15j7qt+dp0NFsCzOzKyE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3Fz+uXXSvEmWA77HDebF0HNkQzBLXLfNCm3abJR2ksuNiOH+D
	B2y6H9UOlln0eI4Uf80+NZyZe7B9VOEleAyBMZMhAENwBTiCpctE/gHP
X-Gm-Gg: AfdE7cnktOaPrYs1Yc7+TXFVtXjg8UDXc4APKDyg55YDF868j609rXdzU+WYufoLv1H
	EwLrAkpcgMGRf5hMA0mVGDMYlYUOXqyHl+KFbripc2R7YhDKqo+KMXYoc0/pdYA5JLJizRlF4+E
	JX8P2IE6f8EfxbE0sUxqzdzMtELfTLg4P/HkAqubUtRdo/YCQYkZ9rDsHXdQZXkuMecS1lOvkTB
	tzQlmblyk/xra2wuUoqoS3zphmkcushLGkNvv5WRFFuXGlwBkQ0K2yo4kCRBMuiwS0ORswpk4RV
	kmTCQrqa9QF1i0iDPzhEO34YIS148t5MZMYQI1fG4ikIuG67w6K/6NN1OtskQx9O+BqiHeJxi/4
	yY2B6dx92IpKz5vGEydsg/hGoFE3i2WAB10XNqWEe97dIxDj3wZ4uswhATCLASBFQWdKUODnzSh
	yUUXpcgyXvETJdXqRW1B/Xd2sNkXRSvcAE43/za//08hCueSFQNvunL0q9
X-Received: by 2002:a05:7022:ec0c:b0:138:637:6227 with SMTP id a92af1059eb24-13b2a1603famr1467281c88.11.1782798315173;
        Mon, 29 Jun 2026 22:45:15 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab0fc83sm3351411c88.3.2026.06.29.22.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 22:45:14 -0700 (PDT)
Date: Tue, 30 Jun 2026 11:15:03 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, kees@kernel.org, 
	lyude@redhat.com, airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <akNXvfSfue7_3tyd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
 <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mj1P9QykK6vbPK37hZkMLwd7RcgVWEcxxuE=9OL+4bAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mj1P9QykK6vbPK37hZkMLwd7RcgVWEcxxuE=9OL+4bAg@mail.gmail.com>

On Mon, Jun 29, 2026 at 11:11:44AM +0200, Miguel Ojeda wrote:
> On Mon, Jun 29, 2026 at 6:57 AM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > Sure i'll bisect. Meanwhile i would still like to get this upstream.
> 
> It is very early on the cycle -- I would suggest bisecting first.
> 
> But it is up to ppc, of course.
> 
> Cheers,
> Miguel
Sure, I'll bisect it first.

Regards,
Mukesh

Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CB43537CD
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384567; cv=none; b=kZjhoJ4vThpYTsw3DRlBLELRTq3y2MRMgAnBKnvdLEEGCurvyIas6CChlstVzfxAgxfUatsq4LdHQscMHQFhOgNdxYfQUzxl96eTeRh7kYZ8+/SqQh1oGeOA9p59FokBIDkHznTmaWDIIPqu4DIajCTqZqGcS88j3VaMsfkScgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384567; c=relaxed/simple;
	bh=NcxbZhoJuwI2oRvDEpq2snWYy2SZI6F9jCQ5SNiw2rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XD8hO2vcFr2+LRHi5PDbeVdktvgUvb19vYSOtpv1k9OrC+BT6bIaIQr1/WLWbrmLbBm7dcoHMByPWx36bhhupRFIqU2iv4n+jY25HulLsr2fzIvf+HlpTk55ggSoIkTgbpUQf98Hn2r5lhdisN+Ki+EzmhdMlsyhNXIJoQqhNl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhwOp+oe; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhwOp+oe"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so1452161a91.3
        for <llvm@lists.linux.dev>; Tue, 02 Jun 2026 00:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780384566; x=1780989366; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+tr7lju0eN0VwcHqpO/c52DT9rHJ2kZQnj1NlP5AASY=;
        b=KhwOp+oerFZZGUmOpH/wUzCaDJA0GJYqp6o5JKUMO2oBELMsbPxnPA/QHE8/xLEDO5
         dh9hFGPR3kqc8u+68j/r2CVFMPfJiGcJkvN1B1ifUAbQvCAMy/NQbvme6wxyRxoyuAL9
         MBMwMrEUUCzoz5Lgo4iHJiPBg8uTt6jsdqtPRnFU0bYKyqpnj2Xn4PnXM2nh+a26caSu
         0KOpF7RCjF65lvWzdbSMkqITTG9gonW6NvSv9hh1ogqZxsccU45MyZZ3PEXLg8a3V4Vf
         ItXOS+MXqgQr2CisX498MUcJrdkS3zwEawPsL83NVbv7SQ0+NQIIHFmjpnd7ueWsNCz9
         SKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384566; x=1780989366;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+tr7lju0eN0VwcHqpO/c52DT9rHJ2kZQnj1NlP5AASY=;
        b=cUhM2+KkXwD91U480AktFcEbPAXI5sZJIMocvwiRMOaX32EEit4gpCyosj16EGnc0w
         FIhpOUoBj6RGTPVPYkx535ZlCXVsus4kZLqjkNdqJR89vuP+7C7uNcUSjtTW5sk/BeX5
         0o5/ko55y+zQYdlnpbayI8UyL2gf+zfDF5pq3Y+gB2wE50lT7k7nMUfQmIz+KAxc8nrE
         g6JmyxEFgRL1+Ia3mODIWZUcfl3s/pbvi2E27VPdzix9Ds5St7QVPK5JMRfBUdVwkxcb
         QV5WYlL6BcYQBsbUmLlGmdhmNEIxmwgDbQ47lOUx3d0gdFVjEtrSrHlf8qGpZothsAHq
         3ZnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oQx7yUfmJZ2WApuDBvQvIndJeNeh1fIZUtrpzypR38AsRKwldbiFFlV5rQODilOWixvnh@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8HrlXXnHbMFCssIHUbIuGQIpQ5PkzU4zSpKJlrNtTv4fX1QI9
	C1Tq9U+DxlzQxU1e/RgpkW5xVR0dgdlWrk5BAYtdlsaOEdLVSKmCeKlT
X-Gm-Gg: Acq92OHb0CywpEWmXKH+uYT6jrya5V0Hg4lIfcG+Wu3VHBI0XFJNRakbU+Q4LmDAeeU
	9VnCjgKIY48WFNNAMEY84JC/LJtZdQVRUdAMijRV7qa0yOaxiAAKylFbZnlWowdb2lmAsEApTnG
	RMe8wxfX23OQqQF4lH+QkA5KtxF6qZkAM4CmtfJoIpufWh/t4e88wzO5KzunXR+DOKRB6qDAF5P
	09nyrfUbGwzWw5QW/pyHBlrTWRDhDY1FAd8e1IpXnW8WY4Z1rf30Hicdr+unQr7+o64UZA1q6ia
	WOsgnGQhdaUzpLzLjFLgzlHzsEq/ovHjh7M/VBndF53RVQy3ukXAG1Afsm0k4NAOkuMUE+vWveg
	zycMD3ut/JJEyWbLFLLz0k3vFYVWaKxshfwouFjiCCzkYeWuMWGieWs+3t6LMhMWHbXaUwegZ4C
	rhhXRD4Ep336yX1Nwa/nw8oGaqE+SHY4N7HzgCoe4wJjz8aHGGmHqiWET0irC1nXuL8sZETDvns
	Glcgw==
X-Received: by 2002:a17:90a:c2cc:b0:368:147f:bd2b with SMTP id 98e67ed59e1d1-36c5020a69fmr13824981a91.23.1780384565532;
        Tue, 02 Jun 2026 00:16:05 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd98797fesm1680774a91.13.2026.06.02.00.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:16:05 -0700 (PDT)
Date: Tue, 2 Jun 2026 12:45:33 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, 
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, daniel.almeida@collabora.com, acourbot@nvidia.com, 
	fujita.tomonori@gmail.com, gregkh@linuxfoundation.org, prafulrai522@gmail.com, 
	tamird@kernel.org, kees@kernel.org, lyude@redhat.com, airlied@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <ah6CsIo3N09q0Kj9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <DITEZRMNTOX2.1DKO9U58508S8@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DITEZRMNTOX2.1DKO9U58508S8@garyguo.net>

On Wed, May 27, 2026 at 12:15:39PM +0100, Gary Guo wrote:
> On Tue May 26, 2026 at 9:52 AM BST, Mukesh Kumar Chaurasiya wrote:
> > On Mon, May 25, 2026 at 08:16:53PM +0200, Miguel Ojeda wrote:
> >> On Wed, May 20, 2026 at 8:48 AM Mukesh Kumar Chaurasiya (IBM)
> >> <mkchauras@gmail.com> wrote:
> >> >
> >> > Minimum `rustc` version required for powerpc is 1.95 as some critical
> >> > features required for compiling rust code for kernel are not there.
> >> 
> >> Which critical features?
> > Hey Miguel,
> >
> > Right now i can only think of inline asm. I can rerun the whole thing
> > with 1.85 and figure out the issues with 1.85. I'll get back on this.
> >
> >>
> >> > For example Stable inline asm support which got merged in 1.95.
> >> 
> >> It is not needed that the support is stable, but rather that
> >> everything you may need works.
> >> 
> > I wanted inline asm be stable, I was skeptical about inline asm to be
> > unstable and potentially messing up the whole system. That's the reason
> > I waited for the stable support to get merged before sending out this
> > patch series.
> 
> AFAIK inline asm is only unstable for archs for their surface syntax (i.e. name
> of register and classes). The rest is just LLVM inline asm. If there're codegen
> issues, you should gate on LLVM version instead (Rust supports multiple LLVM
> versions in a single release and distro may use different LLVM than rustup's).
> 
> Best,
> Gary
Hey Gary,

Sry about delayed response.
I'll check if the codegen has any issues. If yes we'll put a guard on
that. Meanwhile i'll also test out the 1.85 for any other issues. Thanks
for the help.

Regards,
Mukesh

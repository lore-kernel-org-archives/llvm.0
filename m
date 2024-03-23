Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FB97F
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 00:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711154991; cv=none; b=VWcc9JhmURdVyoOoDsUcDmCWTYL4S0b5H4ldH5rPkBFTVmFV3KE+BwiOwOvowHyNWJXiFtO/ZfLFo3RTRzk17iHlFCJRjWstDwiJwnQuKvMjr+vMEz2P2MOCTQjpMN3BnTeJ6L5JFLxMMto4hV6tqRQSdLuxtbO/jd2adL0Ah/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711154991; c=relaxed/simple;
	bh=UQkYXrBRw3g/7sldWDk09B3+ow7yRo71hjCVT0Y7WMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mh7AVDzNkFyuuc7U5BkJnsXg5FxICDLEuKwnqslEaU/64LQFEBimNwcqovCOPAFfn31KmmXs8gcCeCKIa5KTNn8vcHJ+CYyZFHStSVQMu5DzbKqBysURAQQTLXsTGGnb8HzNyi9Zu83ev2R0/DC5jkAZCC2t4MJdy2FFc53HnXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcCrM5PG; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcCrM5PG"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60a434ea806so29906677b3.3
        for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 17:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711154988; x=1711759788; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ5iJEyxp0TFbjOIBhDcRyFjdhS9GLo8uwaFuutf5pw=;
        b=QcCrM5PGQUuDEMxymlGoE1685AF4njtIFUlCfmjbAF9otBU0Kzwjv11+YHpEmwrwJh
         3CtNB/hvdhnv3gUM0ug/6RKR0NcoN+FrfcPVGSKGkGLLoA1tFLR60k25ETy8uW1jVOgS
         FvgBBUzRV1RHT2d1owrtLjhaWtAepfAqwTmmEdZxUvwxIPO4xeS+3YjZKrMNxS9qIPkT
         LP1hz5XJ3zsRKuRnEKlbzYR//nfuL4hvi82WkbZAifx5L1+a2ZIukdlXG9A0YbPic+EY
         KYG2k8EuAvaUghD5rreE9qHRpItEVcYxyWvvVsEcXcatpTNoILnafyky9Kjl8qX/6dZk
         u+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711154988; x=1711759788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ5iJEyxp0TFbjOIBhDcRyFjdhS9GLo8uwaFuutf5pw=;
        b=jxxKhbRMz2QRnDRKtaeQe4QA8bPbOYqMt69h2W2dgrFiwgSboESFouHxB3KkHggsLF
         iwR37jeUZwsJwSRwlHHuJnPDPxMZGPlbyPlp13zFlG/NX2BNydNsvvOLGh4X+yJHVJUN
         sR8RIBFk3dgIW16HORUhEYbGaP/2iYABGWUTvPiBsI9vt6OG2E76zUo8dxYmhhfB8heU
         eB4FzjTC7SXuKi+aofAV/j2+JcTmxDYf0l5rrgmlnMRHJDggqQKkDS7fXEHGIFMgsKH1
         GKB0ec1iGEsxjiUo4e3+U1W6FqUV/HnOrK0xWgbBIyAxdKlcKhZ1C8JbP3n+cXk2ijEW
         vhHg==
X-Forwarded-Encrypted: i=1; AJvYcCVHIenyOK69sAo6+3pvkYQYINp5ejwQC/f6c/e3i6YJU0aOYKEGF3YQQ7dwgw9DEyEGTmbl0Y+HEsmox7lFG1v/zzUnlw==
X-Gm-Message-State: AOJu0YzLyn/8D1xEsZLJctCxIN3mh2nGRRvV4UfVZtIs4wJqFSvpRI0b
	4jV2sPJUOKnftpZkygYeSEQ3DAgxvoYCHjNaZGpVBM8FV3RVqu/v
X-Google-Smtp-Source: AGHT+IETDJYmnh9BWQauIg052TpIhJFT1IQ4W9EH99k2XBBCRGg9iBUv1l3y+OMtpyk3nKx/JVIcEA==
X-Received: by 2002:a0d:e542:0:b0:609:879a:aef7 with SMTP id o63-20020a0de542000000b00609879aaef7mr1208456ywe.30.1711154988612;
        Fri, 22 Mar 2024 17:49:48 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id fa12-20020a05622a4ccc00b00430ad0bda57sm337957qtb.21.2024.03.22.17.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 17:49:48 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 136631200066;
	Fri, 22 Mar 2024 20:49:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 22 Mar 2024 20:49:47 -0400
X-ME-Sender: <xms:KSf-ZVtFLxaw1-QrJZaVB7vB7kF6a7U779wLGmZubuDj7QEq57RoKw>
    <xme:KSf-ZedlSgwPiOPAVyQrfKgA_RdAvf0Lau-_Nv5YAnjZvdq860CXtwMaQua0DXaTd
    _j7w4aaiDHK31ir_A>
X-ME-Received: <xmr:KSf-ZYxFj026LOkybOdzXXT8YJYaI7TpNYoKfo6vnzaxjvhj1LKz_2OIYn-hHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddtfedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:KSf-ZcPQb4gCA79UNR0ibB1j77NLHhlWi9wSK_TzkxMOyrNn5DNGcg>
    <xmx:Kif-ZV_ZMlcx9Z9vbHNS581uzFh7ZbqBDyx3VWylanHnLAHVouUHyA>
    <xmx:Kif-ZcWDbBYs9r6572BITnmxBijz9q51BRA2H2_bMd3MTd4LjCAxWw>
    <xmx:Kif-ZWeq0MwLMUpEW6beMQ63RriD4s7-o59J_yeVCidHIseVxgcK-A>
    <xmx:Kyf-Ze8pkFofcyO3vmT79bm9VwCUDMNzsaiiqVRPuNVg9_TcmoFZyzdA18fR0zrJ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Mar 2024 20:49:45 -0400 (EDT)
Date: Fri, 22 Mar 2024 17:49:23 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,	kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	torvalds@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
Message-ID: <Zf4nE_AvHPx9F2nQ@boqun-archlinux>
References: <20240322233838.868874-1-boqun.feng@gmail.com>
 <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <Zf4fDJNBeRN5HOYo@boqun-archlinux>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zf4fDJNBeRN5HOYo@boqun-archlinux>

On Fri, Mar 22, 2024 at 05:15:08PM -0700, Boqun Feng wrote:
[...]
> > 
> > I wonder about that. The disadvantage of only supporting LKMM atomics is
> > that we'll be incompatible with third party code, and we don't want to
> > be rolling all of our own data structures forever.
> > 
> 
> A possible solution to that is a set of C++ memory model atomics
> implemented by LKMM atomics. That should be possible.
> 

Another possible "solution" works in the opposite direction, since the
folder rust/kernel/sync/atomic is quite stand-alone, we can export that
as a Rust crate (library), and third party code can support using LKMM
atomics instead of Rust own atomics ;-) Of course if the project is
supposed to work with Linux kernel.

Regards,
Boqun

Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C175F14AA3
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 19:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711222290; cv=none; b=L4OQNIyU0ve0K4l51QZOQkaX7malzzY+EUMnRObP9rrC9Bzbm3ZDxfFDmKDTgrWmQxK9zqxVd2tgtpKM0bJYDx2yIXinwKYrHffhHA1rRkIFcWS0lpm/sUl/2qaIFQHJuMSO6QVyNI6236NuHgb0KNNkwsQ/MudPUp0zE1mWW2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711222290; c=relaxed/simple;
	bh=eKx1Rl5msAf9l6TkuqBNrvlWhUbPcQ4w9uh9Tv4DoR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p31d4a6Mmf+T7NnsQg+Oq7DqtUzlD+zaied7d3cKaoD7yhvCil3HqSskjz2fCy8fwdTuQe40wlKO8weao5KtVAteJREFCJI0ZI1ddlWkCBDXhHCM+sQfTYtbRyViWQreppe7WkwBNRKgmLxB+jMYBOIocmyxb2iAoiFzc6P5fsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyTyi2DU; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyTyi2DU"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7e05d68723dso1039948241.1
        for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 12:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711222288; x=1711827088; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UzfTGrntJOeM+olDkQ47lkfVfDGWdlHTbh5Cg8H89NA=;
        b=YyTyi2DUZYTRWw4amkLRAnfSiqzZmBWOnSyo+M/B+tjslXmXlq05tllaivIkW5/Ity
         eFt+QpEtrqDBYSzYeX0/gMiWKmS3xJ7jss0fl/NQ0aRsjE+t67Zkd6PRApTsrEKXjGii
         gB2Mmqs3MIbv5bw5RkmKxNJF0F6zk04twVNpgHJK3mVcS8glw3RQimrRDz/wQ1CqGdIE
         TijDYxQudPJOqKphOUtzsitzXJ2wmK9mRGdBUVedZs2PQjxxY46fVQzg2gtVbt0R4QlF
         lgRfXic1+nK4Sny97KhJYlYL1dpJwiesVFhQ9eHVm1Argttu0qvU5EZEUzkWNMtolIfu
         8d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711222288; x=1711827088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzfTGrntJOeM+olDkQ47lkfVfDGWdlHTbh5Cg8H89NA=;
        b=J2pBD3OKuDz9vVGbruoghmZ9IPgTt6Dhr3fOWbpN9S/v8JIXTEekpXUnHukYM5qtvf
         NMGCmoD2sM+ps6yCy7VbpR7mBsSWJM70s8gZH+N1l19/uzEMx8wJUkaBT0VgAlJzVfPY
         RCBN9/LmHOpvM1a7fUUltc/8VHkYvSAIfoZ6SjdFlyYEwsT6Asxa9eN9w2b78GJo38RX
         UGZ5qz2TQyBmpNkiOePYUqLqfj4RZDPM6/x6D3SWPiMtnPdXTPmty5bGafc/AvsDgSHb
         kV8AxY9lo9SqxnVyg+HQOB/g4Jf3IhZ96bqCVKhPDx2W3dgqHiUid7uLQNDWlCG7hTJM
         dZRg==
X-Forwarded-Encrypted: i=1; AJvYcCURx9SVUv/Bc9u5GlzsWfZvKbEB9bXUSgRGT6SEQ4EW+Re5M7gsk9Q/XZuB6gcUalRG+URvvR0zEZEt7aVYGD35sjeKoQ==
X-Gm-Message-State: AOJu0YzRvdPfXrFVxnmJzQWeGHfvD3s7KDU/Qt6yhfxjLfGI48i7W5zQ
	D1FfaeP6ihBFR+DPI75D2nNZSYlzYupmfAXULVJRVkS402r8uEx0
X-Google-Smtp-Source: AGHT+IG8wsSaLz16sL1d6UoPRjnHSfcppZ6vOiZiBJv/P5WYIQXiuSE++VVcLG4b7jpamkKWMAWaug==
X-Received: by 2002:a05:6122:2783:b0:4d4:20fa:eb0c with SMTP id el3-20020a056122278300b004d420faeb0cmr2350169vkb.5.1711222287814;
        Sat, 23 Mar 2024 12:31:27 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id e12-20020a0562141d0c00b0069155a36f67sm2352194qvd.9.2024.03.23.12.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 12:31:27 -0700 (PDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 50B751200032;
	Sat, 23 Mar 2024 15:31:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sat, 23 Mar 2024 15:31:26 -0400
X-ME-Sender: <xms:Cy7_ZXGiS8bo4DXpZ3QHo7NVFMuRoKXIyscOMAzzc9ETiXZ14wH2Lw>
    <xme:Cy7_ZUXMR2iM8kq2MbFYDYhoOI2uBTXMxJPWvA0hs7kDnTPMbsRGEk8TTWi0Rmm6l
    -_keHnjLXXgZ3HUNA>
X-ME-Received: <xmr:Cy7_ZZJPFAUmGjIe14EkgY65Hn3hV-0IIuKyotokV42VDVO7DL4qiO6uK1s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddtgedguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepueho
    qhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtf
    frrghtthgvrhhnpeevgffhueevkedutefgveduuedujeefledthffgheegkeekiefgudek
    hffggeelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeeh
    tdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmse
    hfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:DC7_ZVF5nqSpctcWvKVmB05oMUXw8v2v44H1Nu4JmLu1u88hI7GVLw>
    <xmx:DC7_ZdUxaMkmEzlwRC68k2ED15rcqBdQ_kw6Iezzb6_zrX6bccbK5Q>
    <xmx:DC7_ZQMyZYWgmlYMBsrFU-pYGNE3cWxLxKtQihuoBmeYDe9P9hHsBg>
    <xmx:DC7_Zc2OZt7vo8ycQkR4jjOGFJ83IJHsD3d5gA_bb02kzRDOgMgB4g>
    <xmx:Di7_ZfyT_5V_0DkimZ-wNLGOw1YL71P0bskE92opZcGHsCUxxWIyDAtTDvOPUj0x>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Mar 2024 15:31:23 -0400 (EDT)
Date: Sat, 23 Mar 2024 12:30:58 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
Subject: Re: [WIP 1/3] rust: Introduce atomic module
Message-ID: <Zf8t8g5gg5Ksp82f@boqun-archlinux>
References: <20240322233838.868874-1-boqun.feng@gmail.com>
 <20240322233838.868874-2-boqun.feng@gmail.com>
 <068a5983-8216-48a5-9eb5-784a42026836@lunn.ch>
 <Zf4cP6lx7LHmt3dz@boqun-archlinux>
 <CANiq72=tB=uxaL9XGbnTBpXmj1pXEbxHQJDtAcA_yDiLjTVkRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=tB=uxaL9XGbnTBpXmj1pXEbxHQJDtAcA_yDiLjTVkRA@mail.gmail.com>

On Sat, Mar 23, 2024 at 08:13:56PM +0100, Miguel Ojeda wrote:
> On Sat, Mar 23, 2024 at 1:03 AM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > I can continue to look an elegant way, now since we compile our own
> > `core` crate (where Rust atomic library locates), we can certain do a
> > sed trick to exclude the atomic code from Rust. It's pretty hacky, but
> > maybe others know how to teach linter to help.
> 
> Yeah, but it requires copying the source and so on, like we did for
> `rusttest`. I would prefer to avoid another hack like that though (and
> the plan is to get rid of the existing hack anyway).

Agreed! The problem is better resolved via modularization of `core`.

Regards,
Boqun

> 
> Cheers,
> Miguel

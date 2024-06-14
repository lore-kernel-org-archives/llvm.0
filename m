Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DEB125BA
	for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718375629; cv=none; b=a7Lfs3qIdwalcQGwgOddlxKNmWJgvr9qZAsFJH/SzLsOgGXzFno1MyDClU64VFDesz/Kvcr7cXA66vKPVzFLWX5u+/5p1sziFlmfxaoYYEBRbxFTMWyvcnj78EI/xOF1PurTWB88Q9gqYdqndS5y4R7JmElcZQliHLqCiJLHWBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718375629; c=relaxed/simple;
	bh=xZElGqRmmE/ylTDd0h2bbgC47tyHdGBCuTvyKie7SII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZffKcRzrgEGCrsRCVXi6hjzPGzuKxk2AfTcqbyf5YzV3zDCDI7abb/Oz/K0FR2lWIVHfpUi6z2p4VeBuu/qGm9dLlGzfkK4786AV5hBdIZ4GYjCQGFo0Z8HA9ON70UxaZVvS9DNCtqNoBF12YhW5VsooLZNfmHO67XgYvzqgN4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGQSJ/Is; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGQSJ/Is"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-44056295c8cso11660231cf.3
        for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 07:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718375625; x=1718980425; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BlbrqP0gVu8dCVsuC6pAUYSnGvOmUl0Rmspo5r19JBU=;
        b=cGQSJ/IskU9QR6UZiqkUaDu5YpWH+Z1ACAuvT7cSm0UChBGk9pvxZKTArm++WBNwAF
         j5UTzaqkUGW4iGoDy0WYdQmZY6pHuk8noG6gF6ELMDssTijBkzL8HqeghWG1mrbrUS5b
         hPy4v4cXUuqFWmsmBncWbk+V9x1YZmArMZbX5A3KRveuRr4qFReAkfx+P9oPiNVJMuv3
         5fiGo0oX3Cm/TeNpOpcwl+2KNLU5q40BrmFrBw81jFyy5nAvEqkfvCtAP5vuJYtS1MaI
         /anXCXg0c5Ia4etRG/WfZmG+pJc+xpaEllihoJ+bPLMkCo6vR3/9JOOlt1jtemNmGt/d
         CVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718375625; x=1718980425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlbrqP0gVu8dCVsuC6pAUYSnGvOmUl0Rmspo5r19JBU=;
        b=VEPIKz9tlTVGgBOwSikAgyOmTIKtkxflodcHza9GZvlrYkyCZsYWXDEdUSr6EEExQX
         ng6zCrfuueIDkoUvOYt8OogoAmoYIhA9zVNTi3pz87moH63mCcDShm6IKbZYxky/Hpl1
         lQNmwbWwBDa/ZBItLwR9hbl6PPtB/o3yKsHs3O+1MHZQN4MuO82H7l1IK562DHW7y/bI
         NKqzdTtcnjBZgtg/gvVoYHdO/zPhdC9izl3sAZPSeTh8577sL/47ZLcAF3clJfNo4p5h
         NG4S6rtaP9YU2hSI7MKzBwMy491O3ob8v6DMUE1VgoYDnjzdyYCSy7QsBzKuOvk/bHlU
         YZ7w==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5omE/P3Vtm/vvNJrm/rDNtBdyBFTSeG43V2JgDnrL4pk5WvZ//bVvOkJln6Z0lDFbh3rHfPyf6d2vJM5Z5Od3/4d4A==
X-Gm-Message-State: AOJu0YyQfFqnJmVAQWV3XJpA/4Z5ZAasB0skDniuIvA2dEEgMN0XpwPK
	7/39L0ZpFBxwpDa5XGElhP7fBxXpEOuSTQ2JiFbfYdayNifrMHau
X-Google-Smtp-Source: AGHT+IFr7oD6dQ3NQCDtrgOkmE6ql8R1e3dmJ9uYl0RZruGyaEyeoKAT6TMBR9go4bb5HovKXDRJdQ==
X-Received: by 2002:ac8:5709:0:b0:441:579e:b415 with SMTP id d75a77b69052e-44216b82e54mr33802071cf.47.1718375625271;
        Fri, 14 Jun 2024 07:33:45 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441f2fcca84sm16514261cf.74.2024.06.14.07.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:33:44 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id C2A6E1200043;
	Fri, 14 Jun 2024 10:33:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 14 Jun 2024 10:33:43 -0400
X-ME-Sender: <xms:x1RsZm_A2bFek2ugY3ADOW5qZ7-2oMXUCkDQ7KVIQefL4Mrt1rQmnA>
    <xme:x1RsZmvF5Ezl-VnYf31xgIFBaGp6-E2bnRYddYZ3UJ1NbbmkO7wcadC9M9UK3dryp
    rGhK1l-xZJL4Hb19Q>
X-ME-Received: <xmr:x1RsZsCIygZ2-IzGd3Khf9NeI0KO0m3kRHZpusgzKelWNSDJaeyOoVmCvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfhgfehgeekkeeigfdukefh
    gfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:x1RsZucl_LBdrv7AmvNd4AB7eSxK3b6h319C8m93wsuCxv4TW_1pyA>
    <xmx:x1RsZrNxoWRSMrtMI4q0wv1mDyW3W8GCw377teS0sRd46P-bv0Yp8Q>
    <xmx:x1RsZonXznDsKaMBCyui1iJDm5W-TajKHQ8N1YkqWMQuyrFt-SCxcA>
    <xmx:x1RsZttsoNAEtnmjUsoRJOxyH921ZliUx3fv2iGvFM7HUF5QlTxYVQ>
    <xmx:x1RsZhvor0KRFZV99SVtk9wxSqJE50k8FYHT-d2bS6DTukQDAztyFeWW>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 10:33:42 -0400 (EDT)
Date: Fri, 14 Jun 2024 07:33:41 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
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
 linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org,
 Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com
Subject: Re: [RFC 2/2] rust: sync: Add atomic support
Message-ID: <ZmxUxaIwHWnB42h-@Boquns-Mac-mini.home>
References: <20240612223025.1158537-1-boqun.feng@gmail.com>
 <20240612223025.1158537-3-boqun.feng@gmail.com>
 <20240613144432.77711a3a@eugeo>
 <ZmseosxVQXdsQjNB@boqun-archlinux>
 <CANiq72myhoCCWs7j0eZuxfoYMbTez7cPa795T57+gz2Dpd+xAw@mail.gmail.com>
 <ZmtC7h7v1t6XJ6EI@boqun-archlinux>
 <CANiq72=JdqTRPiUfT=-YMTTN+bHeAe2Pba8nERxU3cN8Q-BEOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=JdqTRPiUfT=-YMTTN+bHeAe2Pba8nERxU3cN8Q-BEOw@mail.gmail.com>

On Fri, Jun 14, 2024 at 11:59:58AM +0200, Miguel Ojeda wrote:
> On Thu, Jun 13, 2024 at 9:05 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Does this make sense?
> 
> Implementation-wise, if you think it is simpler or more clear/elegant
> to have the extra lower level layer, then that sounds fine.
> 
> However, I was mainly talking about what we would eventually expose to
> users, i.e. do we want to provide `Atomic<T>` to begin with? If yes,

The truth is I don't know ;-) I don't have much data on which one is
better. Personally, I think AtomicI32 and AtomicI64 make the users have
to think about size, alignment, etc, and I think that's important for
atomic users and people who review their code, because before one uses
atomics, one should ask themselves: why don't I use a lock? Atomics
provide the ablities to do low level stuffs and when doing low level
stuffs, you want to be more explicit than ergonomic.

That said, I keep an open mind on `Atomic<T>`, maybe it will show its
value at last. But right now, I'm not convinced personally.

> then we could make the lower layer private already.
> 
> We can defer that extra layer/work if needed even if we go for
> `Atomic<T>`, but it would be nice to understand if we have consensus
> for an eventual user-facing API, or if someone has any other opinion
> or concerns on one vs. the other.
> 

Yes, that'll be great. I'd love to see others' inputs!

Regards,
Boqun

> Cheers,
> Miguel

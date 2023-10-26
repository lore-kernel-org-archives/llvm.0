Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0D4646
	for <llvm@lists.linux.dev>; Thu, 26 Oct 2023 03:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iay1PqNN"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d9c2420e417so319406276.2
        for <llvm@lists.linux.dev>; Wed, 25 Oct 2023 20:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698291102; x=1698895902; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GDP4Ji1MuCk3r0rvr3Ck3tuIDn99qjLg2EPnlAxDfI=;
        b=iay1PqNNkMAlf+uasn17L5zl2CcdwK1emlOIoxCVcOwIDYQdLytGiShMe33vogE2ps
         /WTY65EDBnfQsNVshYE3kXcPlgxaX0lP+8E+po+KCytulE1N2RWnydFKk16oyZNvRbtX
         M47vKEKdYjf7v/GAk1aHrH/2duSDbI1t2gWJvcspVD4HSK55RmTHGvbKjGxyEEzcnxGe
         0fyeZNUZEXjR+RC1DjabXJ5TWIMnlGhSgZG6oE4KrH7tpvuApisOCihZ305v0AqkPjgC
         1W/kGNno+7GSs2Ogs1AYIhEz4gX5QWjf+dezoU8Z4fB4VP9siAOtDALQU/qGtx7cE04u
         raCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698291102; x=1698895902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GDP4Ji1MuCk3r0rvr3Ck3tuIDn99qjLg2EPnlAxDfI=;
        b=Hua4uoPXKxUOGj9S+ZZYa3pXbhoEgpbNiHJTxLciS/Hbnf5rt+ZYMwOt+Kg/fvzkYN
         jCfG54jOuKevxOOzuUa8EAMfGf8vf7VgsmOgmCD1/Fz8rlVDhS+jGqT/EQrHGAQZBRic
         hhR9BX6uFMQuqxuxb7xzJ1l2ZsCRnV9Wx6sB0chw5AfZ4CbSCHU0xmQc2YQ0BOoPnLsI
         kXOpqmSRfinhkdvQdGUExu7IAq1NW22YttBjagder7gvIyhbA2E3kkKHyNxv6W8Ai709
         mn8GGDB5pVC9olfkTcI4J56Gq/r5A63FYMvf+mHa5Tpc4wTDWsRnFzISzriwQ9J5bSkh
         PjvA==
X-Gm-Message-State: AOJu0YyhLELSfqwf9bGK0bglt6UCFWEeZCubm3ZITLqo3iqZpR+Hmud2
	BtWD7xxlICNTlk1tbKYWkIA=
X-Google-Smtp-Source: AGHT+IE6nWVjaeF4q/0JgTm0tiEMymvKwaOV3OJaUyaEBTfVrh0s6CM2luZevzfv2bUOnfOHijnNPw==
X-Received: by 2002:a25:918e:0:b0:d36:99eb:fc01 with SMTP id w14-20020a25918e000000b00d3699ebfc01mr15701879ybl.15.1698291102146;
        Wed, 25 Oct 2023 20:31:42 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id w31-20020a25ac1f000000b00d9ab86bdaffsm4984302ybi.12.2023.10.25.20.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 20:31:41 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id 3B45227C0054;
	Wed, 25 Oct 2023 23:31:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 25 Oct 2023 23:31:40 -0400
X-ME-Sender: <xms:m905ZXHeabl3payzsGhnipr0939fPX1WxlYXtDpPGBitYhhuzVsEdA>
    <xme:m905ZUVYD2YuuzvX0WrBbGOn5IYF7wzv9iuP8I0NfXrxZVCPa6fP7gmRROY4s1l4r
    FxrMeZeluMTg5R2Ew>
X-ME-Received: <xmr:m905ZZLr0mpZlucqGn--iRC_i9zBXh9l9NxoYesfxctvOjI6E6ycdTs-5fk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrledugdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
    htvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudff
    iedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
    hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
    qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
    hmvgdrnhgrmhgv
X-ME-Proxy: <xmx:m905ZVHl7gYAxsC6OQxxI0jqcNrRPp__xknC5IfWjYIw-hYel9CIww>
    <xmx:m905ZdUtrnbZBu41BsfJOKZhpSQNJ0GohEakOq0QmMlAM6gtBAW0Wg>
    <xmx:m905ZQN-mXx_OzXtxWGhLrWAbo0hWFgf1CNJu5jeGVb7iSg9X2xGJw>
    <xmx:nN05ZX3KwPnCn483ZeL7KokyhKS-GhK5quGqZ46tVJYPU14rgOCwSw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Oct 2023 23:31:38 -0400 (EDT)
Date: Wed, 25 Oct 2023 20:31:37 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
	Nick Desaulniers <ndesaulniers@google.com>,	Tom Rix <trix@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com,
	Matthew Wilcox <willy@infradead.org>,	Dave Chinner <david@fromorbit.com>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [RFC] rust: types: Add read_once and write_once
Message-ID: <ZTndmXEBf37G84X-@Boquns-Mac-mini.home>
References: <20231025195339.1431894-1-boqun.feng@gmail.com>
 <VEhpQqgTM0U-aNYRUQ89ICIHW9Eehr66yw92DrmBZcZOah2mLqlz24HxEwDwYPVDOnaigDiZDEVl5mWqZJxoAtRheqTMjzpxuTKe0sr1uZs=@proton.me>
 <ZTmelWlSncdtExXp@boqun-archlinux>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTmelWlSncdtExXp@boqun-archlinux>

On Wed, Oct 25, 2023 at 04:02:45PM -0700, Boqun Feng wrote:
[...]
> > > +/// The counter part of C `READ_ONCE()`.
> > > +///
> > > +/// The semantics is exactly the same as `READ_ONCE()`, especially when used for intentional data
> > > +/// races.
> > 
> > It would be great if these semantics are either linked or spelled out
> > here. Ideally both.
> > 
> 
> Actually I haven't found any document about `READ_ONCE()` races with
> writes is not UB: we do have document saying `READ_ONCE()` will disable
> KCSAN checks, but no document says (explicitly) that it's not a UB.
> 

Apparently I wasn't carefully reading the doc, in
tools/memory-model/Documentation/explanation.txt, there is:

	In technical terms, the compiler is allowed to assume that when the
	program executes, there will not be any data races.  A "data race"
	occurs when there are two memory accesses such that:

	1.      they access the same location,

	2.      at least one of them is a store,

	3.      at least one of them is plain,

	4.      they occur on different CPUs (or in different threads on the
		same CPU), and

	5.      they execute concurrently.

the #3 limits that in LKMM, data races cannot happen if both accesses
are marked (i.e. not plain).

Thank Paul for bringing this to me, and I will update this accordingly
in the next version.

Regards,
Boqun

> > > +///
> > > +/// # Safety
> > > +///
> > > +/// * `src` must be valid for reads.
> > > +/// * `src` must be properly aligned.
> > > +/// * `src` must point to a properly initialized value of value `T`.
> > > +#[inline(always)]
> > > +pub unsafe fn read_once<T: Copy>(src: *const T) -> T {
> > 
> > Why only `T: Copy`?
> > 
[...]

Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF096171CC
	for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qnIf0OOz"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5411fa9ac4fso3147005a12.2
        for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 06:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698674332; x=1699279132; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pwv0nNI/GXb5sK6crMnTZzX7DXnGnuo4VkjJxSyGGBE=;
        b=qnIf0OOz561/RNZl4yTNvxp+cXzntcXAOJiFLBLcluI3TiCa/wtmho4kGBAdKe31Ly
         ANajPoimxqmsGBELCQbgBC0GQdj6Eq20lLWmqmYIKAYH4lrsd+XsFUQN06b3VD+UzcYN
         mSM41OnejoZ8ffIbiROnq1NGLj0TbPWsv4eUxLYzKPLIvyRHJkUfHQLq5JsfV2oN+VAl
         eWYMTDx+m9NMuiS+n0pmIh/KmccVz/3cvb0mhS8NZUbL5o7dJO2j2PPB2+1Plov9IRFB
         Rz+vOS3saqD+N9Tiaq4L6MsXgEImI2YxC+lwV3qQBVjX/cj5+F/8uGb2nppUJJYVFRNg
         duag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698674332; x=1699279132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pwv0nNI/GXb5sK6crMnTZzX7DXnGnuo4VkjJxSyGGBE=;
        b=pbv7/fFJOZSwXY/yxLNAdcjw/DuKtt6IJcgx90LoxbVwa8jpGQ3uHjaIXTey22kQ5V
         sza11mMfAuUgVqbqfgdS9E1Mjyrk6lPzFzCKXl+WKwbuBYHn5QulQ+IQQzOmq8mcrHgN
         s/v7NI261xCyszjHa98OL5V/RfcNbQyb1x9gzOeo8FUORUwd/+Dy+LCcbzDBQvCOdWb/
         eQ3tlyaJMEC2bJWLWz8gcs0z4szy9iyje/uz9erJh+NNuAju0JOW+oAxxYDtDdwMAlAS
         sUYhKsO8jaPvF1yfhhiU0tNujzCDj/07lv5Lnpm82935tFxWkT/MSRq5BVv9LzF/K21a
         hL+Q==
X-Gm-Message-State: AOJu0Yz8B+Pk/iOWlqdjDSWeCokdVfbKv6bukbpd4OBoHZQqhT9ZaBT/
	2tIC+ibx90ORnE2wJJrJlNFWdmeqa0vMiCM=
X-Google-Smtp-Source: AGHT+IGNKlEATVPDh6rVqDOpRvWhA0c/AXkrrys3npUtceRNXpU/wxHpIZOuNkZ6upnlTs5QHBR1A23TFUXF5l4=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6402:f19:b0:53e:b944:d5ca with SMTP
 id i25-20020a0564020f1900b0053eb944d5camr92691eda.0.1698674332155; Mon, 30
 Oct 2023 06:58:52 -0700 (PDT)
Date: Mon, 30 Oct 2023 13:58:49 +0000
In-Reply-To: <ZTmelWlSncdtExXp@boqun-archlinux>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ZTmelWlSncdtExXp@boqun-archlinux>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231030135849.1587717-1-aliceryhl@google.com>
Subject: Re: [RFC] rust: types: Add read_once and write_once
From: Alice Ryhl <aliceryhl@google.com>
To: boqun.feng@gmail.com
Cc: a.hindborg@samsung.com, akiyks@gmail.com, alex.gaynor@gmail.com, 
	aliceryhl@google.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	brauner@kernel.org, david@fromorbit.com, dhowells@redhat.com, 
	dlustig@nvidia.com, elver@google.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, j.alglave@ucl.ac.uk, joel@joelfernandes.org, 
	kent.overstreet@gmail.com, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, luc.maranget@inria.fr, nathan@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, ojeda@kernel.org, 
	parri.andrea@gmail.com, paulmck@kernel.org, peterz@infradead.org, 
	rust-for-linux@vger.kernel.org, stern@rowland.harvard.edu, trix@redhat.com, 
	viro@zeniv.linux.org.uk, wedsonaf@gmail.com, will@kernel.org, 
	willy@infradead.org
Content-Type: text/plain; charset="utf-8"

Boqun Feng <boqun.feng@gmail.com> writes:
>> On Wed, Oct 25, 2023 at 09:51:28PM +0000, Benno Lossin wrote:
>>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>>> index d849e1979ac7..b0872f751f97 100644
>>> --- a/rust/kernel/types.rs
>>> +++ b/rust/kernel/types.rs
>> 
>> I don't think this should go into `types.rs`. But I do not have a good
>> name for the new module.
> 
> kernel::sync?

I think `kernel::sync` is a reasonable choice, but here's another
possibility: Put them in the `bindings` crate.

Why? Well, they are a utility that intends to replicate the C
`READ_ONCE` and `WRITE_ONCE` macros. All of our other methods that do
the same thing for C functions are functions in the bindings crate.

Similarly, if we ever decide to reimplement a C function in Rust for
performance/inlining reasons, then I also think that it is reasonable to
put that Rust-reimplementation in the bindings crate. This approach also
makes it easy to transparently handle cases where we only reimplement a
function in Rust under some configurations.

Alice

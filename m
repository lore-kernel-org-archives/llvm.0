Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11451C2C4;
	Tue, 18 Jul 2023 16:48:11 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-997c4107d62so300615366b.0;
        Tue, 18 Jul 2023 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689698890; x=1692290890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxgES3BpLxLkuAQSfF376O2dgB3POpxIXa9v11XKlt8=;
        b=GSB/0slICBQXXeMd+NGpsRB5c+0ByDReXKw+orYgYQq2RJdstoprKFbPLEkKciBdsp
         rmEC282mW/pYkBzlUIIDtgNGg0F9kWgx4I+YNpijp55k4iIAt1eZKIsocpYsPxqg1fyh
         Q3R/w7Ldp09ABfQD3kKSAmvKS4aXXpru4Y7lzQWl23X0Lo0rA1h7fSLxlpcb7jwHCCSD
         Brv9LoM+swz+Q5OYqvmI6zwffricGmOIAu69PNSRun4FR0++xLrOCmoXORzQkmzenIjR
         tNQj7yE0ewDp9mPOCOP3wmnbxNdryAMHuiHvOYh6gsTa4t8CZ/gZUb9d1X32s+9XX4I4
         JjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689698890; x=1692290890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxgES3BpLxLkuAQSfF376O2dgB3POpxIXa9v11XKlt8=;
        b=gU/LPj/Q4czK0Xrp4nfgeVR0GpTIJyY8/PZMZ37+4rKF+z9E9lHK2ql11ANFUf1E6I
         Ln0oUpQWpwu10ce9lVUOtt/0waArbsLm1EeDimSgSdA1qi9U8Ln6OwdAN5Y7CaQyOkLn
         ufVb0ecUTs2R1oNcVT1go8VguLhqjLwfMvYSVbseRq1E6qEDTkNfTX5AFVJnXpqfVPU4
         lLLPydCKaYXpY/Lzq+ulgZkHUbPr7IsUEooW8BU6pmiBTe2SNcGxS8o8c+/z6TDDruaP
         9xADoxQuJnnQvkGXeSA6A2x0oVbKGWqw3u3t8QmztNOjtvFmV7hUaOv7WR/ik/OWHpWD
         XKCw==
X-Gm-Message-State: ABy/qLa2HAyT7jFRdjYg4tLHGQkr9wSalFUOKPm5UOzdnzpFBJfi2sve
	0I0N9nk9kUlppjFhoYt87Is=
X-Google-Smtp-Source: APBJJlHVfpT7oRxHjFxKYYht0qM12l1bj5Q1nOdH5tkOxNUCra5xKYA87e6QCCsNRylAXwWgakq7zQ==
X-Received: by 2002:a17:906:fe4a:b0:982:cfe2:32fe with SMTP id wz10-20020a170906fe4a00b00982cfe232femr443653ejb.63.1689698889889;
        Tue, 18 Jul 2023 09:48:09 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id bn14-20020a170906c0ce00b009925cbafeaasm1228257ejb.100.2023.07.18.09.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:48:09 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id ADB8D27C0054;
	Tue, 18 Jul 2023 12:48:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 18 Jul 2023 12:48:06 -0400
X-ME-Sender: <xms:RcK2ZEQB5oiRym1RKTc6LFHCm7v0Gxlt_FbRdocm5iPe2wZ6qf-gUw>
    <xme:RcK2ZBy-t1kWHjOtlpaCfJipx_3zXKlcA9TBrRN24IagcFHfwa7oz8l8HnZw42uMP
    HpnHhAbOBeU68CweQ>
X-ME-Received: <xmr:RcK2ZB1yOcnDJFoirqM9KE377ZmM7BHe31H-ZaI_LY-YvJhqzWj3QrFHR8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggddutdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:RcK2ZIAQm-dJWH5olI7z0f3vA6BqIffn9i86VDFjCNl8lT230ty2UA>
    <xmx:RcK2ZNjKHGBgrDcIimePN4BiPJXhkD3afhI2WhPJNli2kJUKhGpnag>
    <xmx:RcK2ZEoKh5oX7uSvujEEOzPxajdj7w0wOfW-QQuiR1ZyXp4x2ZrDfQ>
    <xmx:RsK2ZOYF2dFP5IZWCzcCuYhAvbbkpgh5-ICuEizrWA4RnTa5TF1EaQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jul 2023 12:48:04 -0400 (EDT)
Date: Tue, 18 Jul 2023 09:48:01 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, lina@asahilina.net,
	alex.gaynor@gmail.com, alyssa@rosenzweig.io, asahi@lists.linux.dev,
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, daniel@ffwll.ch,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, marcan@marcan.st, masahiroy@kernel.org,
	nathan@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
	ojeda@kernel.org, rust-for-linux@vger.kernel.org,
	sven@svenpeter.dev, trix@redhat.com, wedsonaf@gmail.com
Subject: Re: [PATCH RFC 00/11] rust: Implicit lock class creation & Arc
 Lockdep integration
Message-ID: <ZLbCQX4uS5kk8U1q@boqun-archlinux>
References: <f974e5a4-1211-5ad7-4864-f3e210499e5e@asahilina.net>
 <20230714135926.382695-1-aliceryhl@google.com>
 <20230715152554.5b585d22.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230715152554.5b585d22.gary@garyguo.net>

On Sat, Jul 15, 2023 at 03:25:54PM +0100, Gary Guo wrote:
[...]
> > > I don't think the fallibility is an issue. Lockdep is a debugging tool, 
> > > and it doesn't have to handle all possible circumstances perfectly. If 
> > > you are debugging normal lock issues you probably shouldn't be running 
> > > out of RAM, and if you are debugging OOM situations the lock keys would 
> > > normally have been created long before you reach an OOM situation, since 
> > > they would be created the first time a relevant lock class is used. More 
> > > objects of the same class don't cause any more allocations. And the code 
> > > has a fallback for the OOM case, where it just uses the Location object 
> > > as a static lock class. That's not ideal and degrades the quality of the 
> > > lockdep results, but it shouldn't completely break anything.  
> > 
> > If you have a fallback when the allocation fails, that helps ...
> 
> I am pretty sure lockdep needs to do some internal allocation anyway
> because only address matters for lock class keys. So some extra
> allocation probably is fine...
> 

Lockdep uses a few static arrays for its own allocation, but doesn't use
"external" allocatin (i.e. kalloc() and its friends. IIUC, originally
this has to do in this way to avoid recursive calls like:
lockdep->slab->lockdep, but now lockdep has a recursion counter, that's
not a problem any more. However, it's still better that lockdep can work
on its own without relying on other components.

Regards,
Boqun

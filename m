Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E752922626
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707914506; cv=none; b=PovBDqd6LYeHUjCB7ZGK6kYZ4xL3cyKSn2hSnsDCPgRL+7gJZGOe4gBwevZwfzdsrlDYqE7yVgaLxVoHYHKuo7wXFDe3r2KoHTdCOeiGivSpZW9k8+iv6xaBlIIQVeSuPv5FaBYGxXfm9SDzTn4OzJCTVGyd3Oq0DJuK6Hb8XWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707914506; c=relaxed/simple;
	bh=r6TYTqFwQotruhi73e9osnG5YZSVtIWyB3/MDHVNG88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGv18bga8hxKo2iBplSS56rbJnQCxKfqSWK87G5N/kFzg4quMy9tG4MkytH1E39Kf1grAxxPtlGQ8ULaOGPaDsO2jde4yiHtehrY2gwz5Wy1hBOBhfvmLk//BOKxWyovXVVS6VO1NPt3uBwdEKx/VzWzgr3rGK2pOI6tbgVzfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 41ECaQmn030022;
	Wed, 14 Feb 2024 06:36:26 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 41ECaO1V030021;
	Wed, 14 Feb 2024 06:36:24 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 14 Feb 2024 06:36:24 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Laight <David.Laight@aculab.com>, Arnd Bergmann <arnd@kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Bill Wendling <morbo@google.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Justin Stitt <justinstitt@google.com>,
        Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] tty: hvc-iucv: fix function pointer casts
Message-ID: <20240214123624.GB19790@gate.crashing.org>
References: <20240213101756.461701-1-arnd@kernel.org> <20240213191254.GA19790@gate.crashing.org> <57d72e2ccc8245fe99982613a11c461c@AcuMS.aculab.com> <2024021426-unleveled-unhearing-8021@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024021426-unleveled-unhearing-8021@gregkh>
User-Agent: Mutt/1.4.2.3i

On Wed, Feb 14, 2024 at 11:37:21AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 14, 2024 at 09:46:33AM +0000, David Laight wrote:
> > From: Segher Boessenkool
> > > Sent: 13 February 2024 19:13
> > > 
> > > On Tue, Feb 13, 2024 at 11:17:49AM +0100, Arnd Bergmann wrote:
> > > > clang warns about explicitly casting between incompatible function
> > > > pointers:
> > > >
> > > > drivers/tty/hvc/hvc_iucv.c:1100:23: error: cast from 'void (*)(const void *)' to 'void (*)(struct
> > > device *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
> > > >  1100 |         priv->dev->release = (void (*)(struct device *)) kfree;
> > > >       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > Such a cast of course is explicitly allowed by 6.3.2.3/8, only calling a
> > > function using a non-compatible type is UB.  This warning message is
> > > quite misleading.  Doubly so because of the -Werror, as always.
> > 
> > But it will get called using the wrong type.
> > And (is it) fine-ibt will reject the incorrect call.
> 
> And rightfully so, this type of casting abuse is just that, abuse.
> 
> Almost no one should be just calling kfree() on a device pointer, I'll
> look at the surrounding code as odds are something odd is going on.  But
> for now, this patch is correct.

Yes, and I said so.  My point is that the warning message pretends the
cast is bad or dangerous.  It is not, similar casts are the only way in
C to do certain things (yes, you can always avoid it completely, by
writing completely different code, like the patch does, and that
sometimes is a better idea even).

But the warning message is misleading and does more damage than it helps
avoid.


Segher

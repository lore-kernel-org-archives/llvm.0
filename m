Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4824886A;
	Sat, 14 Mar 2026 11:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773489206; cv=none; b=Kf2amFLFXub744dipMrEobNm3F3Ifg9+lYMMflK0CHcxhSGO2ISB5TgZXG2cOuUDKE/jzOY/r45xxo9e6Ndohi1npufA+Mplnz56QL6K/HsceUFQjkjotAnqMJ3++vShNKM55An2fa0DS4Y44jeY2JZC9ie6URHbR5nePSTXL+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773489206; c=relaxed/simple;
	bh=impwRFcDkworY8zCZmfr/pzhhIFp1qkfw4v11OePyXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+YW7RnUyysp4rh4dWXzmHFbuiTE3qY/32t3FiaVSPIMoyTEsaUS4qB1g9Dzb5gxgnpV1iw4pa5CrWlohel9xdsv/B9dwRTrxO66SWG31QnUSy9LV3VMJE2m5bwFmKNmwWYC/IJFEKTLSglYFb0vegKHD2RslfATeVgCz3kW5Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OPyUbzFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OPyUbzFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D60C116C6;
	Sat, 14 Mar 2026 11:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773489205;
	bh=impwRFcDkworY8zCZmfr/pzhhIFp1qkfw4v11OePyXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPyUbzFTYoslL0P3QB9MBfwljyZslpNJOVMS9ZCSePNL1wdK8CBYrpW9E2gmT29a5
	 UpZVqYoJGdwSkQZsEmqZb+9M47K9Bu6m6pRwNneUh0NTPtg1EOV7iE5WOMfLUFVbaS
	 7QETJzTuQxufPloRfVYb7h3yyTx0SzXq4ib0fpWU=
Date: Sat, 14 Mar 2026 12:53:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Jann Horn <jannh@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
Message-ID: <2026031444-wriggle-tradition-245f@gregkh>
References: <202603121235.tpnRxFKO-lkp@intel.com>
 <20260313213638.GA147391@ax162>
 <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>
 <2026031422-catsup-rectal-f886@gregkh>
 <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
 <abVG0JypVhDxx1Tt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abVG0JypVhDxx1Tt@google.com>

On Sat, Mar 14, 2026 at 11:30:24AM +0000, Alice Ryhl wrote:
> On Sat, Mar 14, 2026 at 12:15:30PM +0100, Alice Ryhl wrote:
> > On Sat, Mar 14, 2026 at 12:13 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > > > On Fri, Mar 13, 2026 at 10:36 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > > >
> > > > > It looks like this is a conflict between Alice's "rust_binder: check ownership
> > > > > before using vma" [1] (currently in char-misc-linus [2]) and Mike's
> > > > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unstable [4]),
> > > > > hence why it was bisected to the -next merge commit.
> > > >
> > > > Thanks Nathan, yeah, adding a raw pointer (not function pointer) to
> > > > the struct makes the type `!Sync` in Rust.
> > > >
> > > > I assume this is best handled with a patch on top of char-misc-linus.
> > > > Perhaps creating a wrapper to assert it is `Sync`, since the
> > > > `BINDER_VM_OPS` contents are unused (so far).
> > > >
> > > > Cc'ing more folks related to the commit.
> > >
> > > char-misc-linus should get merged into Linus's tree "soon" and then we
> > > can fix up the mm-unstable change for this.
> > 
> > I'm working on the fix as we speak. It would be ideal if it went into
> > char-misc-linus, because the commit that is wrong is mine, not the one
> > in mm.
> 
> To clarify, to avoid breaking bisection, the commit needs to land
> somewhere that is on top of commit 8ef2c15aeae0 ("rust_binder: check
> ownership before using vma"), and before the mm commit. But I guess
> there are several options for how to do that other than landing it
> through char-misc-linus right now.

I've sent off a pull request for the char-misc-linus branch now, and
after -rc4 is out I'll queue this up on top of that to get merged for
-rc5 to make this all work out ok.

thanks,

greg k-h

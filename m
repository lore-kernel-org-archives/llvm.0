Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150FA45BE3;
	Sat, 14 Mar 2026 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773486779; cv=none; b=iraDezkuz7Fu03KotzfM/GMVVAFvdKrkjEZij1Jl5pb8jXqrhU1Ejm+nwq9m7lfjauFLRvebYAZrBunMqoRtLXQvHTTlKeRpVC17j4R/iyZB1ydgArA9at28gbYcqzKPKli8OIEJrJr5NNk433tc5yErm2gVGgK7kIoQfYjiIFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773486779; c=relaxed/simple;
	bh=bKZgkQ8etDggV80HuQ96NEUcvwYN6qN/KoeVQ755JQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMbGDSjxhuvIcLPPAq5LOgWwPgdHRXmHbMImBMZNvnw3rum5kvXWB1x9BGQn95bOIjBSAW4KW+h+OWFZl0VpLxJouQwVMUrvKCEqjZ/hSN18Dl7wd+sDQ5ytvtXK64ogkUMNAQgEaQ4tqd4uGxuiM4GWuku2U6P5IQ9uft6q2eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ApPNi2Qr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ApPNi2Qr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443A0C116C6;
	Sat, 14 Mar 2026 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773486778;
	bh=bKZgkQ8etDggV80HuQ96NEUcvwYN6qN/KoeVQ755JQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ApPNi2Qrdc2RtulNHbM9QHU4+rTPcOudvlv+6vD/0EwmgrnVGYq6uVB0D7g5nzsOr
	 K/8bg1ZDpM/8LAbLglq99D29CnGwk5hlQCZ5I2wBVK6+JAdeoEoC+oCtH/100JjOav
	 4j96FOH/9Yd9FW1tPxWaJwWQU9YrS3KU33oQBnyA=
Date: Sat, 14 Mar 2026 12:12:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Mike Rapoport <rppt@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Jann Horn <jannh@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
Message-ID: <2026031422-catsup-rectal-f886@gregkh>
References: <202603121235.tpnRxFKO-lkp@intel.com>
 <20260313213638.GA147391@ax162>
 <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>

On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> On Fri, Mar 13, 2026 at 10:36 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > It looks like this is a conflict between Alice's "rust_binder: check ownership
> > before using vma" [1] (currently in char-misc-linus [2]) and Mike's
> > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unstable [4]),
> > hence why it was bisected to the -next merge commit.
> 
> Thanks Nathan, yeah, adding a raw pointer (not function pointer) to
> the struct makes the type `!Sync` in Rust.
> 
> I assume this is best handled with a patch on top of char-misc-linus.
> Perhaps creating a wrapper to assert it is `Sync`, since the
> `BINDER_VM_OPS` contents are unused (so far).
> 
> Cc'ing more folks related to the commit.

char-misc-linus should get merged into Linus's tree "soon" and then we
can fix up the mm-unstable change for this.

thanks,

greg k-h

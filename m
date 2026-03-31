Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7340A3E3C56;
	Tue, 31 Mar 2026 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774961993; cv=none; b=aWoX0XDcI0xw73/WJpHZgYFVqszaP2BvhEJnMysBYd/IMdws4qmCVua6OBWbbN9J5CGJQbr1xJ0sIRcy7orbFZ6zrhAlliT66FsLNwKqkxpW0SBVr6x0TwsfeLAZPZR3kF9wd1IzGXUcDKdYdbLTvxHEUJ2rL24tYT7yc7FxWX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774961993; c=relaxed/simple;
	bh=ch3CiQ853BiWa9wkq1mpgzUpNpYNFJhT6U9aOLT+a6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXY4591J6bY6eDiYE8fiqQVd8PHcJwCOJyrs+YlABnYKCWxqhAthrG5PKa57eR6u8JlGWm6GhZQoCoUiBCtt83zbFVFD/j79+c3iYRy3S+gHXdzw2CIhiQnxSXY80vosAgcRpU4a1TCgfWsO6WLK+swKKOW8BbuXSOFIfdFjAMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FpoQCRo8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FpoQCRo8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E723C19423;
	Tue, 31 Mar 2026 12:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774961993;
	bh=ch3CiQ853BiWa9wkq1mpgzUpNpYNFJhT6U9aOLT+a6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FpoQCRo8z7qCiOBE7K8fjpZm8TVSjxvsTDLuMhujwhRvG70gwmzrQTMhH1OrEb1nc
	 GNkAe+96QnHKwT1YSMOjzygcwUCLgHCQwO5RF/bTCapcUHC7L/kEY6mXQlEjb+gF8N
	 3uzRojue+EtnNnzvENijuvvJjfK3PI0rgIxwAeDY=
Date: Tue, 31 Mar 2026 14:59:49 +0200
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
Message-ID: <2026033142-distinct-tanned-f749@gregkh>
References: <202603121235.tpnRxFKO-lkp@intel.com>
 <20260313213638.GA147391@ax162>
 <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>
 <2026031422-catsup-rectal-f886@gregkh>
 <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
 <abVG0JypVhDxx1Tt@google.com>
 <2026031444-wriggle-tradition-245f@gregkh>
 <CAH5fLggMZM3kYWO3xqb4o-mQG27aCYOmiiODW67CKLTstkB-PQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggMZM3kYWO3xqb4o-mQG27aCYOmiiODW67CKLTstkB-PQ@mail.gmail.com>

On Tue, Mar 31, 2026 at 01:32:03PM +0200, Alice Ryhl wrote:
> On Sat, Mar 14, 2026 at 12:53 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Mar 14, 2026 at 11:30:24AM +0000, Alice Ryhl wrote:
> > > On Sat, Mar 14, 2026 at 12:15:30PM +0100, Alice Ryhl wrote:
> > > > On Sat, Mar 14, 2026 at 12:13 PM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > > > > > On Fri, Mar 13, 2026 at 10:36 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > > > > >
> > > > > > > It looks like this is a conflict between Alice's "rust_binder: check ownership
> > > > > > > before using vma" [1] (currently in char-misc-linus [2]) and Mike's
> > > > > > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unstable [4]),
> > > > > > > hence why it was bisected to the -next merge commit.
> > > > > >
> > > > > > Thanks Nathan, yeah, adding a raw pointer (not function pointer) to
> > > > > > the struct makes the type `!Sync` in Rust.
> > > > > >
> > > > > > I assume this is best handled with a patch on top of char-misc-linus.
> > > > > > Perhaps creating a wrapper to assert it is `Sync`, since the
> > > > > > `BINDER_VM_OPS` contents are unused (so far).
> > > > > >
> > > > > > Cc'ing more folks related to the commit.
> > > > >
> > > > > char-misc-linus should get merged into Linus's tree "soon" and then we
> > > > > can fix up the mm-unstable change for this.
> > > >
> > > > I'm working on the fix as we speak. It would be ideal if it went into
> > > > char-misc-linus, because the commit that is wrong is mine, not the one
> > > > in mm.
> > >
> > > To clarify, to avoid breaking bisection, the commit needs to land
> > > somewhere that is on top of commit 8ef2c15aeae0 ("rust_binder: check
> > > ownership before using vma"), and before the mm commit. But I guess
> > > there are several options for how to do that other than landing it
> > > through char-misc-linus right now.
> >
> > I've sent off a pull request for the char-misc-linus branch now, and
> > after -rc4 is out I'll queue this up on top of that to get merged for
> > -rc5 to make this all work out ok.
> 
> Friendly ping on this. I don't see this applied yet.

Sorry for the delay, now queued up.

greg k-h

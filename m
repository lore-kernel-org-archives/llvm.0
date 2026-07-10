Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2132C3C4154;
	Fri, 10 Jul 2026 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698874; cv=none; b=DGOZ/TIrvRsm/KQfNSp2QlH8uuCGVbDSCquHFQbXpPbK2LS0CzKs3T7z/ml6mh434xxca4Bh+Xe6cxvieI1aNob8BEnffSzZurUX8D0tw2kpyn+raxaLF6W06TIyL1bpIo+e8ZSADYHlVJcIuowqd/1SFbMArzmG89EcBAsSAp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698874; c=relaxed/simple;
	bh=s5T2JjqqaqbIxAPQ50lDYsTnJonVhiMf2bwb7GQIwUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpS4a0B81XljrbNpZj7owjaQu3AxDYp7JiLJtV0wgMANxAHOBfJ/yOvnMHIZ4K1IYnASAeB+eFUfNT4d2/mVmdoO9WvIzCQmX/6hRfGFHb4T06ZVt42RJUZpZ3aOJHc31ZMIQurVzCzJg0ZozKLaP2/B7eqwk0apet7Z8JSJLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdEMVgMY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdEMVgMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD731F000E9;
	Fri, 10 Jul 2026 15:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783698872;
	bh=q8JFJnGL7bYpyB0Nd3W5/BlyuGxY4w1vWSoT+qn+jRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mdEMVgMY2egcdqlOZigj3izdHYytjawO2k2ygqW3cDtSggkUddybGs7MVLp1gRLwN
	 FndXB9O6qhc0HGX2m/T4If2s6wGGmq96KeD6xltV8BtFx8P0wrcYGjiWXo9jhtUNHC
	 ZmpkuLZfwvbhyJLxPd1AcbWTgdlm2ihoJPsjmMuZ9xAxPTVoMScvZiKgGW4Q9rEvSA
	 C2nI0ruQHsVaGC9xpsnF6siroLYz7Eh7zPToog1Y7lytJtVyonnistw74HbxuMyvkW
	 peDK8erA3A6KdiEQ85rNEKqsUU2FdWFZAnTR9SmMc4RJjMD+4fEdJ/cwSfCAIPMHY5
	 Z34bqaUvJsJXw==
Date: Fri, 10 Jul 2026 08:54:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: kernel test robot <lkp@intel.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: ld.lld: error: vmlinux.a(af_vsock.o at 1186296) <inline
 asm>:5:8: unpredictable STXR instruction, status is also a source
Message-ID: <20260710155428.GA3149665@ax162>
References: <202607061644.jD93AjWc-lkp@intel.com>
 <CAGxU2F5KvtLSgT9pzhv8YxcP_j9L7usXqKY+W446XxLAovdbog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F5KvtLSgT9pzhv8YxcP_j9L7usXqKY+W446XxLAovdbog@mail.gmail.com>

On Fri, Jul 10, 2026 at 04:22:20PM +0200, Stefano Garzarella wrote:
> On Mon, 6 Jul 2026 at 10:44, kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   8cdeaa50eae8dad34885515f62559ee83e7e8dda
> > commit: 102eab95f025b4d3f3a6c0a858400aca2af2fe52 vsock: lock down child_ns_mode as write-once
> > date:   4 months ago
> > config: arm64-randconfig-001-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061644.jD93AjWc-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061644.jD93AjWc-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: 102eab95f025 ("vsock: lock down child_ns_mode as write-once")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202607061644.jD93AjWc-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> ld.lld: error: vmlinux.a(af_vsock.o at 1186296) <inline asm>:5:8: unpredictable STXR instruction, status is also a source
> >    stlxr   w8, w8, [x21]
> >    ^
> >
> 
> Could this be related to https://github.com/llvm/llvm-project/issues/106380 ?
> That issue seems fixed in llvm >= 20

Indeed, this is resolved by

  https://github.com/llvm/llvm-project/commit/7183771834d9035ffbedd8f1ff9233b16722b986

in LLVM 20.1.0, I confirmed with a reverse bisect. It looks like
this issue triggers on undefined values being passed to inline asm but I
don't see where there is an undefined value in the blamed commit but I
did not look too hard. Presumably this is around the try_cmpxchg() in
vsock_net_set_child_mode(). I am not sure this will be easily to
workaround so we might just have to leave it broken.

-- 
Cheers,
Nathan

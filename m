Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C802F34
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 11:39:25 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-118-63.bstnma.fios.verizon.net [173.48.118.63])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 26FBavGO016553
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Jul 2022 07:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1657885019; bh=tdZ4h7hpZb7PYZDCUa22UQK8ONN4Qvu86oDvvZF8yko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EVjHFzTvgNX+TXFmaXWUG3WjnzDmIRfzE60friNosYrmitEDYwhgZ3xgLLOxMRV2E
	 ioKhc2VTRwe57E9z7kf/W3vkClyoH7cv49B4vZfJvPs9lqtKrjKIFwaTpxkXtvjFYR
	 J4/ryJw2D+kOK2evXnmVvCAYTElPq3xoIAJrnOuLBRAZYDenbiwuz9MFrqnKXO1JGx
	 Tsa+AYrWLuFSKDfLjJsCO6py9Dp1bLSo6e2T3Z51ykRcfiIFm67F7FhlPRAEU6h6m4
	 vf9WBNcYD19FJEdX1zOfvLC8Yq+0q0D/+ZA6NMdwFnclxLBS98fCabrcWW6lyC19HJ
	 xXzj7IlYqVD5g==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 44F1C15C003C; Fri, 15 Jul 2022 07:36:57 -0400 (EDT)
Date: Fri, 15 Jul 2022 07:36:57 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Arnd Bergmann <arnd@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Hugh Dickins <hughd@google.com>,
        clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH] mm/shmem: add support for FS_IOC_[SG]ETFLAGS for tmpfs
Message-ID: <YtFRWXzLUjGQ5bD9@mit.edu>
References: <20220713145234.2356641-1-tytso@mit.edu>
 <202207150617.dHbSxB55-lkp@intel.com>
 <CAK8P3a1zoKAhfZ+zoukwUTFbi9LYdVPFR7wMJ47WSOQ5zNVMRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1zoKAhfZ+zoukwUTFbi9LYdVPFR7wMJ47WSOQ5zNVMRQ@mail.gmail.com>

On Fri, Jul 15, 2022 at 01:09:04PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 15, 2022 at 1:01 AM kernel test robot <lkp@intel.com> wrote:
> >
> > >> mm/shmem.c:1062:22: error: use of undeclared identifier 'EXT2_APPEND_FL'
> >            if (info->fsflags & EXT2_APPEND_FL)
> >                                ^
> > >> mm/shmem.c:1064:22: error: use of undeclared identifier 'EXT2_IMMUTABLE_FL'
> >            if (info->fsflags & EXT2_IMMUTABLE_FL)
> >                                ^
> > >> mm/shmem.c:1066:22: error: use of undeclared identifier 'EXT2_NODUMP_FL'
> >            if (info->fsflags & EXT2_NODUMP_FL)
> >                                ^
> 
> I suppose this just needs to use FS_APPEND_FL/FS_IMMUTABLE_FL/FS_NODUMP_FL
> instead of the ext2 alias names?

The zero day bot was testing the v1 version of the patch.  This was
fixed in the -v2 and -v3 versions.

     	      	     	    	    - Ted

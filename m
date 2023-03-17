Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186E6641;
	Fri, 17 Mar 2023 05:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A399C433EF;
	Fri, 17 Mar 2023 05:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679030580;
	bh=xJQNrDRxaUaFwVWort65OpSrd15uaBouLl4R0fdXr00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJGZ4GiphrYotwcMHRtEQkOPOdUzuAY6KzsU1KdQjcuiBdg0Qpk9zyQ5HodjXBQwz
	 jASO5f8IbOugRrtS3GUCcOAqxkjLq5tOtYcyeu6mlJ78uCZq3mkwJ1Jd7zaVKMRyK/
	 yXsiVosV21bL7MxvWpjBDjXu/fyjfbLPvvDGc9780FYiT8L/Aj1FVCoyxLnMl9ubjx
	 eBPyNPBd/PioKjDHHJu2xfm5Rq/d2V3aMUoK4esjqUhjZB2JkE2mrDt22ktmCByq5E
	 5J/KjLT7RL0ISrydi9WaANwg3Wr3GqtH0aKbkZGNsCcXVUEpFBocZb2RupB1SxKzj5
	 4DrU8+UdIA02Q==
Date: Thu, 16 Mar 2023 22:22:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "Jason A. Donenfeld" <zx2c4@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Jean-Philippe Aumasson <jeanphilippe.aumasson@gmail.com>
Subject: Re: [stable:linux-5.4.y 4197/7834] ERROR: "sha_transform"
 [crypto/sha1_generic.ko] undefined!
Message-ID: <20230317052258.GB882@sol.localdomain>
References: <202303170515.Ls4W3urG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303170515.Ls4W3urG-lkp@intel.com>

On Fri, Mar 17, 2023 at 05:06:05AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
> head:   b829e8b6e1a7bb8cd3042b927113a22fed0b0d47
> commit: c2f0a89cd1d5a00c5bf48060987cf53ada93d4b0 [4197/7834] random: use BLAKE2s instead of SHA1 in extraction
> config: mips-randconfig-r003-20230313 (https://download.01.org/0day-ci/archive/20230317/202303170515.Ls4W3urG-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mipsel-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=c2f0a89cd1d5a00c5bf48060987cf53ada93d4b0
>         git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>         git fetch --no-tags stable linux-5.4.y
>         git checkout c2f0a89cd1d5a00c5bf48060987cf53ada93d4b0
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303170515.Ls4W3urG-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ERROR: "sha_transform" [crypto/sha1_generic.ko] undefined!
> 

I'm not sure what's causing this.  Before v6.0, sha_transform() was always
built-in.  It did use "lib-y" instead of "obj-y", though, which maybe matters
here?  Maybe removing the caller of sha_transform() from random.c somehow made
it unavailable to modules if all other callers were disabled too.

Anyway, I'm not sure it's worth investigating this old issue further...

- Eric

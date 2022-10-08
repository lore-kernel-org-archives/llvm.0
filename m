Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C183410E0
	for <llvm@lists.linux.dev>; Sat,  8 Oct 2022 05:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B57C433C1;
	Sat,  8 Oct 2022 05:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665208583;
	bh=s0LjJFfi+hfHWwyYzeazkY4sx1RI6b2GS+sMxd09+dQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFSnyER77mdb0qwHg5PA4HkheV448oi8kv9npavvKSc+uciqbe7TxsDNYsHY+s0VL
	 XnNIvoKvJLvpt4s8CQQRiWJh1MtyzzA84puETvSKPvUS4sWGXaRJQllJiRltcy8Tfq
	 q//9aShAOk8zeNIBmZbyH+46LVLYr3M9z43NYPPtKUuh/LJY2VWern39oWYngvwmRS
	 E6XEsEE9xIQlAmPkTBgUu3c/T29c6Tg3Dy1IlGhbmPOuzFuj9a4MC8Ja0q0M/xs0zy
	 CiOA5UHCnEnaBt9rlUGgp0lm+UyXOrs+sNoml0srTYwPuxuaWMODRYWCl5n+7ySug8
	 NROfNan6f27sA==
Date: Sat, 8 Oct 2022 07:56:17 +0200
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Amir Goldstein <amir73il@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
	"Darrick J . Wong" <djwong@kernel.org>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, Al Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@lst.de>, Seth Forshee <sforshee@kernel.org>,
	Yang Xu <xuyang2018.jy@fujitsu.com>,
	Filipe Manana <fdmanana@kernel.org>, linux-unionfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] attr: add should_remove_sgid()
Message-ID: <20221008055617.ssv7sbe4gj556oxq@wittgenstein>
References: <20221007140543.1039983-3-brauner@kernel.org>
 <202210080357.inSALqdT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202210080357.inSALqdT-lkp@intel.com>

On Sat, Oct 08, 2022 at 03:16:04AM +0800, kernel test robot wrote:
> Hi Christian,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on mszeredi-vfs/overlayfs-next]
> [cannot apply to linus/master mszeredi-fuse/for-next v6.0 next-20221007]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

This isn't rebased and thus will fail to apply. There'll be a merge
conflict with changes to fs/internal.h for current master. Best to wait
until I have rebased this after v6.0-rc1 is out.

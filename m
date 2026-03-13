Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB1384243;
	Fri, 13 Mar 2026 06:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773382432; cv=none; b=kdqeXna/0QdMYGXYWK5j8oe2f/feBWA6yk4bbVzkTuBud/jlHu5HekBgnRlM439Q/Kd6bQwm5mgFd4xEuvfCuTZG0E2KELbTdDI4IOb3Ds3GLbPRfMMKy7LDq6fnV/cA+VmB7u5cr9f/jHkIUerJKigw1qYRZg8kzg+gV03yXsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773382432; c=relaxed/simple;
	bh=UgSJlBGwhtTldghWYNvVII4/unQqnGQ/BRp0tFRx/jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeEEzuj5S4FBpe8X9Cn95aPQNy2g9oUL/qZvnvw+qjNUPcTCXLPMwMMxyF28sQGie8nXNGaoYPqnkdr+36dbl14lpukDMKxc48fytGr48uWF5ulslvKIilj3eem/wZbbolJDZKFxFgqAzb2DD0+QgApmY7HBTLFLC0Dq5HKyzHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SHqvClLb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SHqvClLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940DCC2BCB1;
	Fri, 13 Mar 2026 06:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773382432;
	bh=UgSJlBGwhtTldghWYNvVII4/unQqnGQ/BRp0tFRx/jM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHqvClLbNjSIERZt3cAZ4TZbxnhTLYwosw4gRNjIM3XbjwnuO3sBARklU1yEK9BE7
	 XpJLpc1KLNiOR1p+AdVX9NeeyxuoQYpOFRX0WeXCJ7/OH1tYj/qmh19EqiwKiW+GCe
	 RvAP6kPncxa2i0HITiP1pS1FOfE4N+dnkTb4gikw=
Date: Fri, 13 Mar 2026 07:13:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: Re: [driver-core:driver-core-testing 3/16] Warning:
 fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in
 'kernfs_drain'
Message-ID: <2026031334-defog-unmasking-a4be@gregkh>
References: <202603130112.2FcCzv1g-lkp@intel.com>
 <CABdmKX3PLUQmm6cHJqhst=ifK8dvKgKbfgMyR28YLF23zHhZKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdmKX3PLUQmm6cHJqhst=ifK8dvKgKbfgMyR28YLF23zHhZKw@mail.gmail.com>

On Thu, Mar 12, 2026 at 06:27:56PM -0700, T.J. Mercier wrote:
> On Thu, Mar 12, 2026 at 5:46 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-testing
> > head:   e7ccc9e054beb4c366228d24786f67c738206605
> > commit: eea5d2bb34ba11dccd9c53f392dc50cf060150a9 [3/16] kernfs: Send IN_DELETE_SELF and IN_IGNORED
> > config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260313/202603130112.2FcCzv1g-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130112.2FcCzv1g-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603130112.2FcCzv1g-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> Warning: fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in 'kernfs_drain'
> > >> Warning: fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in 'kernfs_drain'
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> Ah, yes. This will fix it. Greg should I resend the patches?
> 
> diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> index 715b651e35a0..7f355316704c 100644
> --- a/fs/kernfs/dir.c
> +++ b/fs/kernfs/dir.c
> @@ -481,6 +481,8 @@ void kernfs_put_active(struct kernfs_node *kn)
>  /**
>   * kernfs_drain - drain kernfs_node
>   * @kn: kernfs_node to drain
> + * @drop_supers: Set to true if this function is called with the
> + *               kernfs_supers_rwsem locked.

Just send this as a fix-up, as it is just a documentation update.

thanks,

greg k-h

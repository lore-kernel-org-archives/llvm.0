Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C69149C7B;
	Wed,  5 Feb 2025 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772463; cv=none; b=IUSXOeyZdcioPEWyit7nRD6KFVHCuQR9QGB0NE0MVHXF+8laTCK96SQyx+2B3p2DGd3ddmNkuq4sWwgTa9IR5whASAY0Bzm7+XU3c0B+RDROB/HgwPHQjWKUzXO7XDQLHdAJHkda1+h7P7+J+0Qfc2/PSeVSjDXMyRS21G1CxnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772463; c=relaxed/simple;
	bh=I2H3Np8gaxEGnqt72EMdEK2RQpVpXrfF7FPpvqlzyC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFGc2Y+GGmV/bpYbcv72k9m13EmdmuKpAifbTrBUZDjeICrhL+2goCWIX1oNOKjl+2yxo6mNqTXasYhVJ6+q5kZQc0Pr9fTJMi4pbLVrdtdsSgG09LGVIt5YEC3J0XgKB62rkpEFxHJehKf77bbSMJVThIos2kompvbhFdFGypA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O00+x/0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O00+x/0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E05AC4CED6;
	Wed,  5 Feb 2025 16:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738772463;
	bh=I2H3Np8gaxEGnqt72EMdEK2RQpVpXrfF7FPpvqlzyC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O00+x/0xErb1tNG1abQl2XPjtcanaMMCsEPpDGjSNJkC9HwjmVtKhXV7smzwSJSWQ
	 jIm3Na5gGWqn7AV5I1SWpj69jT81xWR6cxxIOHlHCEzRB7ryM52UCRR+b63Sd2Phvu
	 3DTJ2EcTaHp544TZi7ZTnTYOM+j7h9QQbXyR0FlPCTP8EGaNweQFxA+DQAPIQBDdyS
	 /HoWCuRHEBK1eH4PYcLMYpIuMKk1fxTaXVAjouRucFKr4Vrt8vgORMz9beQk3STpxE
	 AmiGPT/DL3MB1Yl9pLYr/q0eIdpxqQw295XvAx8EITuBv3WKO7dm5MMV3AFpgBtngC
	 l1qmtrrB39mFQ==
Date: Wed, 5 Feb 2025 17:20:58 +0100
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <lkp@intel.com>, 
	Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: Re: [brauner-vfs:vfs.all 11/48]
 fs/notify/fanotify/fanotify_user.c:2004:13: warning: variable 'obj' is used
 uninitialized whenever 'if' condition is false
Message-ID: <20250205-speck-aufgreifen-20108ce060f8@brauner>
References: <202502060049.cygRkOiu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202502060049.cygRkOiu-lkp@intel.com>

On Thu, Feb 06, 2025 at 12:16:27AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
> head:   b7601b2abc4dbae86d85da3939ce185eac2ed4ff
> commit: 21c1471c81dc7fd8de1f47d74cef9efc91356971 [11/48] fanotify: notify on mount attach and detach
> config: i386-buildonly-randconfig-005-20250205 (https://download.01.org/0day-ci/archive/20250206/202502060049.cygRkOiu-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060049.cygRkOiu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502060049.cygRkOiu-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/notify/fanotify/fanotify_user.c:2004:13: warning: variable 'obj' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>     2004 |         } else if (obj_type == FSNOTIFY_OBJ_TYPE_MNTNS) {
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    fs/notify/fanotify/fanotify_user.c:2009:7: note: uninitialized use occurs here
>     2009 |         if (!obj)
>          |              ^~~
>    fs/notify/fanotify/fanotify_user.c:2004:9: note: remove the 'if' if its condition is always true
>     2004 |         } else if (obj_type == FSNOTIFY_OBJ_TYPE_MNTNS) {
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    fs/notify/fanotify/fanotify_user.c:1819:11: note: initialize the variable 'obj' to silence this warning
>     1819 |         void *obj;
>          |                  ^
>          |                   = NULL
>    1 warning generated.
> 
> 
> vim +2004 fs/notify/fanotify/fanotify_user.c

Folded:

diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
index 1dcab38ca003..f2d840ae4ded 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -1816,7 +1816,7 @@ static int do_fanotify_mark(int fanotify_fd, unsigned int flags, __u64 mask,
        unsigned int mark_cmd = flags & FANOTIFY_MARK_CMD_BITS;
        unsigned int ignore = flags & FANOTIFY_MARK_IGNORE_BITS;
        unsigned int obj_type, fid_mode;
-       void *obj;
+       void *obj = NULL;
        u32 umask = 0;
        int ret;

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4DB1FA4
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 15:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CBF7C341C8;
	Mon, 25 Jul 2022 15:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658763550;
	bh=I+2f4rcs61Dyb3wmT8wcA8SEZMWq+nf8Sj5sreEwkUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kQ0fe7pk699baIWzuTL5pE8C0nv5LQSHEm7McGpeEpM0BG7HaM7KoyzUnsQPkUDEj
	 ofBKhMP2BrH+s87XmIczepVT2OngEvK5MGEF52MBdNqT586wh+Se22WWs2rWswKhFx
	 hsztiutZ7H/9NnHu2Uu0txKIzWb75Sps/bWIN57NFqla8yqlC/DbwvwJJxWH9XESck
	 uCpYO0U3rY0rwjkvnWU3r0Gon9R9R/GPGlHxgROkfUqnGaqkEkBSECIqBXorT0sJ4Z
	 QytJ5QSZmFIUHgi637cIwWwheLZtuCEXFMoJwONTZ3s0nbtFv9Z5MM57ob/w2dVmzi
	 MzOlyCUr4pQ5Q==
Date: Mon, 25 Jul 2022 08:39:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Daniel Rosenberg <drosen@google.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dennis Cagle <d-cagle@codeaurora.org>,
	Lee Jones <lee.jones@linaro.org>
Subject: Re: [linux-stable-rc:linux-4.9.y 967/2229]
 drivers/staging/android/ion/ion-ioctl.c:71:6: warning: variable 'ret' is
 used uninitialized whenever 'if' condition is false
Message-ID: <Yt65G3x2Hmoj4q/b@Ryzen-9-3900X.>
References: <202207241311.Dv86CbAo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202207241311.Dv86CbAo-lkp@intel.com>

On Sun, Jul 24, 2022 at 01:39:50PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.9.y
> head:   65be5f5665a580424a7b1102f1a04c4259c559b5
> commit: a8200613c8c9fbaf7b55d4d438376ebaf0c4ce7e [967/2229] ion: Protect kref from userspace manipulation
> config: mips-randconfig-r034-20220719 (https://download.01.org/0day-ci/archive/20220724/202207241311.Dv86CbAo-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0c7639e91fa1cd0cf2ff0445a1634a90fe850a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mipsel-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=a8200613c8c9fbaf7b55d4d438376ebaf0c4ce7e
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc linux-4.9.y
>         git checkout a8200613c8c9fbaf7b55d4d438376ebaf0c4ce7e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/staging/android/ion/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/staging/android/ion/ion-ioctl.c:71:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>            if (--handle->user_ref_count == 0)
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/staging/android/ion/ion-ioctl.c:74:9: note: uninitialized use occurs here
>            return ret;
>                   ^~~
>    drivers/staging/android/ion/ion-ioctl.c:71:2: note: remove the 'if' if its condition is always true
>            if (--handle->user_ref_count == 0)
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/staging/android/ion/ion-ioctl.c:69:9: note: initialize the variable 'ret' to silence this warning
>            int ret;
>                   ^
>                    = 0
>    1 warning generated.
> 
> 
> vim +71 drivers/staging/android/ion/ion-ioctl.c
> 
>     65	
>     66	/* Must hold the client lock */
>     67	static int user_ion_handle_put_nolock(struct ion_handle *handle)
>     68	{
>     69		int ret;
>     70	
>   > 71		if (--handle->user_ref_count == 0)
>     72			ret = ion_handle_put_nolock(handle);
>     73	
>     74		return ret;
>     75	}
>     76	

Might as well just be

static void user_ion_handle_put_nolock(struct ion_handle *handle)
{
	if (--handle->user_ref_count == 0)
		ion_handle_put_nolock(handle);
}

since user_ion_free_nolock() doesn't check the return value of
user_ion_handle_put_nolock()? I can send a patch if people care (I know
4.9 is a bit on the older side).

Cheers,
Nathan

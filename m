Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE4F7A
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 03:49:55 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id r186so3080246pgr.2
        for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 20:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=sMdqEEPrHyojVR3jjUYElu1vGrljFd+G9mVLZ0W5ELQ=;
        b=Kslok9sJJ8LMwzfbMBrKbAUKHGaPv7eVJP/zCA0WlWpgL9CD9VrL9fx7Xxc8sMs2gt
         XMBk5ATiKsaNGYdvaF4Z8Lp718Ke46Ab0Wdb5py0EGM870pG75ysTRC66cllR2Sr1bs/
         4+5VViAKUSatsGZhbPxofuXqZ+eqL0p4da2jjgov6+kG11VLMH7jRM3+byYnvjK7yLOq
         o/Ie0dzaREJ//TNefIB7IqYEYNKox5YMzaJYa9XNnk79qy/iox7g8NTzDg+Hf6wIywYt
         UryIrWHzGWQ1KQZiXoEFMHaaJmf2Gk4Sgjk8pEhYn5Mt+8MZ/snjdZqTnXtIzzvqS96p
         ORdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=sMdqEEPrHyojVR3jjUYElu1vGrljFd+G9mVLZ0W5ELQ=;
        b=bzDKd8XthE16RqjASHVffREQmKV0VCp9JxhPP5tS7kLl5kettGHDfYAfIWB7Y8f2DW
         osq5yk6h+gQwillcY6iGZ6F3PXY+qexDZstP7Tz2qu807fILJ66T2Elz/nR0jAsLmPPK
         JLKQf966w7UlquPjpzAO4A4Cr0SFMVBcNl22GZ4yhhYG2VOJxwxfvy+0L2P/xvBEB5ze
         MBiutkRZ9vIPinuGQq4aoqBtc9ZYFzD9AAa1DSApRzlt4KRmiByLCGxC2dusNXaEmQT8
         wXyzG9+8RrDRJS/nnMhD1Wy5SseMpizR47F5MGXRgNslK+JrVLlkcGOOqoNVMaQkhdcJ
         2b8A==
X-Gm-Message-State: AJIora9i9A648Py2nyBI0xwtcA63Ewxi+V7s8B2TGnmwLTFUGSYlWlJR
	b3MniLciuVZjOPYm2DO/CrJiGL/GNck=
X-Google-Smtp-Source: AGRyM1uDYmFNBDKm2ZXrPqM5P3GGFNNKd8FHUViPhxoyIHXLpWCDwYLkH5Pwvuks609ZKVFgA01exw==
X-Received: by 2002:aa7:8ec2:0:b0:52a:d4f5:20b with SMTP id b2-20020aa78ec2000000b0052ad4f5020bmr1540341pfr.71.1659066594998;
        Thu, 28 Jul 2022 20:49:54 -0700 (PDT)
Received: from localhost (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s18-20020a170902c65200b0016d83ed0a2csm2184117pls.80.2022.07.28.20.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 20:49:54 -0700 (PDT)
Date: Fri, 29 Jul 2022 13:49:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 06/12] locking/qspinlock: merge qspinlock_paravirt.h
 into qspinlock.c
To: kernel test robot <lkp@intel.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, kbuild-all@lists.01.org,
	"linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev, Waiman Long <longman@redhat.com>, Ingo Molnar
	<mingo@redhat.com>, Will Deacon <will@kernel.org>
References: <20220713070704.308394-7-npiggin@gmail.com>
	<202207142228.8Z4o18rM-lkp@intel.com>
In-Reply-To: <202207142228.8Z4o18rM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <1659066516.mc10tbo8hk.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Excerpts from kernel test robot's message of July 15, 2022 12:16 am:
> Hi Nicholas,
>=20
> I love your patch! Perhaps something to improve:
>=20
> [auto build test WARNING on tip/locking/core]
> [also build test WARNING on tip/x86/core powerpc/next linus/master v5.19-=
rc6 next-20220714]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Nicholas-Piggin/lo=
cking-qspinlock-simplify-code-generation/20220713-151009
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git eae6d=
58d67d9739be5f7ae2dbead1d0ef6528243
> config: i386-randconfig-a004
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61=
b9c556267086ef9b743a0b57df302eef831b)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/91668ee1ed703d7ea=
84e314136dc732da05ec9e7
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Nicholas-Piggin/locking-qspinloc=
k-simplify-code-generation/20220713-151009
>         git checkout 91668ee1ed703d7ea84e314136dc732da05ec9e7
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash kernel/locking/
>=20
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>):
>=20
>    In file included from kernel/locking/qspinlock.c:29:
>    kernel/locking/qspinlock_stat.h:36:9: warning: no previous prototype f=
or function 'lockevent_read' [-Wmissing-prototypes]
>    ssize_t lockevent_read(struct file *file, char __user *user_buf,
>            ^
>    kernel/locking/qspinlock_stat.h:36:1: note: declare 'static' if the fu=
nction is not intended to be used outside of this translation unit
>    ssize_t lockevent_read(struct file *file, char __user *user_buf,
>    ^
>    static=20
>>> kernel/locking/qspinlock.c:705:1: warning: no previous prototype for fu=
nction '__pv_queued_spin_unlock_slowpath' [-Wmissing-prototypes]
>    __pv_queued_spin_unlock_slowpath(struct qspinlock *lock, u8 locked)
>    ^
>    kernel/locking/qspinlock.c:704:11: note: declare 'static' if the funct=
ion is not intended to be used outside of this translation unit
>    __visible void
>              ^
>              static=20
>    2 warnings generated.

These aren't new warnings btw, just existing W=3D1 warnings in code that=20
moved.

Thanks,
Nick

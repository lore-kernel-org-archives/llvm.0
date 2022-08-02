Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136F57F
	for <llvm@lists.linux.dev>; Tue,  2 Aug 2022 00:55:55 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id z132so9690932iof.0
        for <llvm@lists.linux.dev>; Mon, 01 Aug 2022 17:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=htjvkGtQpD6Ib4OiEIrcN6xIzNKXkccUpXIUMoKCYKE=;
        b=LbddkIraI5kkZn728C1TSSYy5FguP7AYKDzT0VdOo2sH0YCa/ykzKNIxF5+bY4i+Qr
         GKIQKZX0wpnvX36KEgM7HkjtSE62AKJKKCBhanG6gKWSq2alQ7XCYsq96FIY5a+kgGvL
         TlrHefU1yOJbYAX9bUBqcV6J6couXv9Hbfm9IvVoKcEf9HtJm9Mz6SCzPWz15nRi+jln
         yejT6JbgQdqtOX/16ZaERVHMxOs76BzuJchiiUoNm64gtNSGm9ndu8cu8CRJZYU5jGWy
         lYW8WwzRFum5g5hL8p7pUgDoAFlH2yijUUp4uyVsGObYLvnnQeHTtA6zEe8mtd4UoYUY
         Edag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=htjvkGtQpD6Ib4OiEIrcN6xIzNKXkccUpXIUMoKCYKE=;
        b=oJLtEvp40Pqht59SnUnJwa2BbLi1vX5PhgYWMnKVF5nvsUbaCfkh5iUOZ/3sC5a3e1
         5cAYdO7baSQzRcvVigzdziT16JN4sPtcbCcnO+a7mQmK0Na6gK7eXjezDOUt/gjXGLCF
         E+b5/GIqis1VjxoRDlb/GtRHTy/bvMvYf94uHdhkXjW2RLBiQxj/x3LPGhuyZXbRtOOU
         F+Wz8g/dyfTlR6JjWo6zyb/iqhapz28KmVOYxhNyHxEbDsL3zRk00V9oDpiQoRYlfnea
         wTO9Skt2LMBDM6QpbEYFKqIQBESTkKAV3/XlAF6ijcnfevUVGlPAmPkGusGz0PRxIhp3
         E7+Q==
X-Gm-Message-State: AJIora9VPyAStEETIGXYsQtTxxuMKf1ks1idN09R7vnluji8CKiBLHig
	lQtH6otRSDHx8j/5D5dawKp64MR6e+pAgWV6qTY=
X-Google-Smtp-Source: AGRyM1sk7GvHka1gHmx27XQxq4PxeYaRf5VgpXSGDETtSipaNEzwr+0ExJdTormVztKqYE/ZhiJxqtCoFr6mIGeLyfg=
X-Received: by 2002:a05:6638:4108:b0:33f:88e3:ccec with SMTP id
 ay8-20020a056638410800b0033f88e3ccecmr7763064jab.264.1659401755165; Mon, 01
 Aug 2022 17:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207281950.xaFXiPzC-lkp@intel.com> <383b1045-94c5-c2b0-57db-9f4f4760206c@intel.com>
In-Reply-To: <383b1045-94c5-c2b0-57db-9f4f4760206c@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Aug 2022 02:55:44 +0200
Message-ID: <CANiq72ma-c5PjWSLOp3PwonLfkNp83csM=1EfzSPEr+QG-szzg@mail.gmail.com>
Subject: Re: [linux-next:master 13092/13104] error[E0609]: no field
 `group_leader` on type `bindings_raw::task_struct`
To: kernel test robot <yujie.liu@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 29, 2022 at 3:34 AM kernel test robot <yujie.liu@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9250d2f72dc46a808b6aa23bf50dd670f1f52ddc
> commit: 475dd867241716f1b6ab12cc188c221bfadacc40 [13092/13104] Merge branch 'rust-next' of https://github.com/Rust-for-Linux/linux.git
> config: arm64-randconfig-r033-20220728 (attached as .config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install arm64 cross compiling tool for clang build
>          # apt-get install binutils-aarch64-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=475dd867241716f1b6ab12cc188c221bfadacc40
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>          git fetch --no-tags linux-next master
>          git checkout 475dd867241716f1b6ab12cc188c221bfadacc40
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 prepare
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <yujie.liu@intel.com>

Fixed in rust-next (and v8 of the Rust patch series):
https://github.com/Rust-for-Linux/linux/pull/850

Thanks!

Cheers,
Miguel

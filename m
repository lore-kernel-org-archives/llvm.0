Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4709BA44
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 07:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CECC341C6
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 07:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655795900;
	bh=PrW2JmkVe635LtZauvjaDngX3UFmkVgC2u2wZOJoJ5U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DOIWO6MSXY+27P6Qk5o7PJjI3zVVOuUaYgG3MeOZPTkzy4YDqaMfE9/uCG4eGjJJJ
	 frFg3+FvYxzA32XFuaSLQ71SxYS518co9tSdWLNnpfEc7KpZwPFSS4nqlNoL5CBmyQ
	 VDozhXosR0sIvxXhs3We9Dbm0xg/ng/5u4hGaNe8EAtqp0OWH4Vd0hZYwT/bvTho8H
	 4uidvrtNeXt9iYIQ6yHYdCSprXMFs6tRdmUCFofak0YK0+GTFDZDtNsED1+PK86VuS
	 V0Jtuzjk9RRnWNvbelg6eicLUuHfQ2cck4XH1m0EUMPqBDEY3EqFSY2kuW9mgSHvwu
	 V26+8S0la6p7A==
Received: by mail-yb1-f179.google.com with SMTP id v81so23000390ybe.0
        for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 00:18:19 -0700 (PDT)
X-Gm-Message-State: AJIora+CbZUuOYI4LEDj5XTZb0JhXbgXtCTCPsG9Ytz556M8MyxBNHge
	Y48yPDsX66DyTbsMs0oO3gmVo0UMYHgMT+fJIezJdw==
X-Google-Smtp-Source: AGRyM1tmZ/hrSSyI7Q/zSQe4IsCX/m8vN2wQQJUJg9SL7kfnLLROrvth65eg5nZRQ/aYAm5hEB49j+NfmIzkhDxRwjw=
X-Received: by 2002:a25:a0ca:0:b0:664:c86b:4c24 with SMTP id
 i10-20020a25a0ca000000b00664c86b4c24mr29431836ybm.65.1655795899031; Tue, 21
 Jun 2022 00:18:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220621012811.2683313-5-kpsingh@kernel.org> <202206211035.p3LxbVfK-lkp@intel.com>
In-Reply-To: <202206211035.p3LxbVfK-lkp@intel.com>
From: KP Singh <kpsingh@kernel.org>
Date: Tue, 21 Jun 2022 09:18:08 +0200
X-Gmail-Original-Message-ID: <CACYkzJ775f+EGSpFiKUXkYdtx5x1mygbGC9P+knqvapio9XUyg@mail.gmail.com>
Message-ID: <CACYkzJ775f+EGSpFiKUXkYdtx5x1mygbGC9P+knqvapio9XUyg@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next 4/5] bpf: Add a bpf_getxattr kfunc
To: kernel test robot <lkp@intel.com>
Cc: bpf@vger.kernel.org, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 5:20 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi KP,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/KP-Singh/Add-bpf_getxattr/20220621-093013
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> config: x86_64-randconfig-a015-20220620 (https://download.01.org/0day-ci/archive/20220621/202206211035.p3LxbVfK-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/dd49d2ffb18adceafa98bd517008f59aa9bc910b
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review KP-Singh/Add-bpf_getxattr/20220621-093013
>         git checkout dd49d2ffb18adceafa98bd517008f59aa9bc910b
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/trace/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/trace/bpf_trace.c:1185:25: warning: no previous prototype for function 'bpf_getxattr' [-Wmissing-prototypes]
>    noinline __weak ssize_t bpf_getxattr(struct dentry *dentry, struct inode *inode,
>                            ^
>    kernel/trace/bpf_trace.c:1185:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    noinline __weak ssize_t bpf_getxattr(struct dentry *dentry, struct inode *inode,
>                    ^
>                    static
>    1 warning generated.
>

So it looks like this needs a function prototype. Let's do an initial round
of reviews on this series and I can respin with something like:

diff --git a/kernel/trace/bpf_trace.h b/kernel/trace/bpf_trace.h
index 9acbc11ac7bb..3f62e5d35037 100644
--- a/kernel/trace/bpf_trace.h
+++ b/kernel/trace/bpf_trace.h
@@ -25,6 +25,11 @@ TRACE_EVENT(bpf_trace_printk,
        TP_printk("%s", __get_str(bpf_string))
 );

+/* Prototypes for kernel functions exposed to tracing and LSM
+ * programs
+ */
+ssize_t bpf_getxattr(struct dentry *dentry, struct inode *inode,
+                    const char *name, void *value, int size);
 #endif /* _TRACE_BPF_TRACE_H */

(or anything else folks suggest)

- KP

>
> vim +/bpf_getxattr +1185 kernel/trace/bpf_trace.c
>
>   1184
> > 1185  noinline __weak ssize_t bpf_getxattr(struct dentry *dentry, struct inode *inode,
>   1186                                       const char *name, void *value, int size)
>   1187  {
>   1188          return __vfs_getxattr(dentry, inode, name, value, size);
>   1189  }
>   1190
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp

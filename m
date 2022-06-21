Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D622FECF
	for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 12:41:39 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d129so12999578pgc.9
        for <llvm@lists.linux.dev>; Tue, 21 Jun 2022 05:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e7ENr1H0aV6W45zGV/4bz4+Kuctr067y9ar8/0vuczY=;
        b=OwspgshMn6BiCdMLukmPqPUWedaDeDUsS87hh+q2/VwZel9RV+40LU0UAypwXkpPCI
         zOBLMm1WV5mYeXylPEtvCwxa4vIAyg8j6wC8Te4oBueI1NyYjeGr459L4ZMCQO+6VFLm
         2R65Ztdx3MESFs3b1ogeZYGWFtx04rHxQ+RCX5GlnaW9Lni/neNq294X58bZpXhxqhfm
         JXf7GPRaPo6GiEy2FmZ8xbYU6+so67HbDQOpyJi973Fm+e3A6j3LQJznVbJGGMMK+g76
         cS9lCAqPTpb/KjRx1v4eQTjvdwbeE0QXFZlUUO4CkgMJEGFBIgyIec+gHTbBPzB7CnVN
         BpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e7ENr1H0aV6W45zGV/4bz4+Kuctr067y9ar8/0vuczY=;
        b=14OVAPKxIm4HTpMpjhOLu+wjoajp3zvGXoZbK7KsfWrY/LSL7mV9WrD54PEG1Joq1x
         yyiR8frxxJfBnDPgsMx37VfYpXNDUd4hdLgegdTJTzQhqFMN44ne3j/VUP+Tkg8H6p6W
         VziXpZKSY3TpyP7G2s0TKeQfzZ0psMNAjuREc5nZU0JO6kEnso7nTprvUimqBlAlu0Xp
         JiBm242og/bVYi6GUM8xzR/4FyQCyQo3pZeNQPvtInb/rs/jFE2lreT9Xj0qCkHmfGM2
         tTtCD5oG8vpZMNoYvi0mMQGIqMHYnByWZQLl16DH4T+p85INaj6UVPIv0Sk/YxF+85km
         8A+g==
X-Gm-Message-State: AJIora8BGoG5PiAXs9vdGbDLlHb9gAv7SZ+/TexhNPPUvTiZAwkZwki0
	r/gnuM/0ZGEPlDb/kGuD8kY=
X-Google-Smtp-Source: AGRyM1uOFqaAapmIbJdhCxBNlvQSrIVj8puFpOadXOKN35qH08m9ZNG9ICgVO16DfNJIDZCeAi05vA==
X-Received: by 2002:a63:3c14:0:b0:40c:a228:c3c3 with SMTP id j20-20020a633c14000000b0040ca228c3c3mr11368667pga.256.1655815299158;
        Tue, 21 Jun 2022 05:41:39 -0700 (PDT)
Received: from localhost ([2405:201:6014:d0c0:79de:f3f4:353c:8616])
        by smtp.gmail.com with ESMTPSA id h13-20020a17090a3d0d00b001ea5d9ae7d9sm12234210pjc.40.2022.06.21.05.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 05:41:38 -0700 (PDT)
Date: Tue, 21 Jun 2022 18:11:15 +0530
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: KP Singh <kpsingh@kernel.org>
Cc: kernel test robot <lkp@intel.com>, bpf@vger.kernel.org,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH v2 bpf-next 4/5] bpf: Add a bpf_getxattr kfunc
Message-ID: <20220621124115.7daxj2csuyfxfvq5@apollo.legion>
References: <20220621012811.2683313-5-kpsingh@kernel.org>
 <202206211035.p3LxbVfK-lkp@intel.com>
 <CACYkzJ775f+EGSpFiKUXkYdtx5x1mygbGC9P+knqvapio9XUyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACYkzJ775f+EGSpFiKUXkYdtx5x1mygbGC9P+knqvapio9XUyg@mail.gmail.com>

On Tue, Jun 21, 2022 at 12:48:08PM IST, KP Singh wrote:
> On Tue, Jun 21, 2022 at 5:20 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi KP,
> >
> > I love your patch! Perhaps something to improve:
> >
> > [auto build test WARNING on bpf-next/master]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/KP-Singh/Add-bpf_getxattr/20220621-093013
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> > config: x86_64-randconfig-a015-20220620 (https://download.01.org/0day-ci/archive/20220621/202206211035.p3LxbVfK-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/intel-lab-lkp/linux/commit/dd49d2ffb18adceafa98bd517008f59aa9bc910b
> >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> >         git fetch --no-tags linux-review KP-Singh/Add-bpf_getxattr/20220621-093013
> >         git checkout dd49d2ffb18adceafa98bd517008f59aa9bc910b
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/trace/
> >
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> kernel/trace/bpf_trace.c:1185:25: warning: no previous prototype for function 'bpf_getxattr' [-Wmissing-prototypes]
> >    noinline __weak ssize_t bpf_getxattr(struct dentry *dentry, struct inode *inode,
> >                            ^
> >    kernel/trace/bpf_trace.c:1185:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
> >    noinline __weak ssize_t bpf_getxattr(struct dentry *dentry, struct inode *inode,
> >                    ^
> >                    static
> >    1 warning generated.
> >
>
> So it looks like this needs a function prototype. Let's do an initial round
> of reviews on this series and I can respin with something like:
>
> diff --git a/kernel/trace/bpf_trace.h b/kernel/trace/bpf_trace.h
> index 9acbc11ac7bb..3f62e5d35037 100644
> --- a/kernel/trace/bpf_trace.h
> +++ b/kernel/trace/bpf_trace.h
> @@ -25,6 +25,11 @@ TRACE_EVENT(bpf_trace_printk,
>         TP_printk("%s", __get_str(bpf_string))
>  );
>
> +/* Prototypes for kernel functions exposed to tracing and LSM
> + * programs
> + */
> +ssize_t bpf_getxattr(struct dentry *dentry, struct inode *inode,
> +                    const char *name, void *value, int size);
>  #endif /* _TRACE_BPF_TRACE_H */
>
> (or anything else folks suggest)
>

You can silence this warning using __diag_push, e.g. see kfunc definitions in
net/netfilter/nf_conntrack_bpf.c.

> - KP
>
> >
> > vim +/bpf_getxattr +1185 kernel/trace/bpf_trace.c
> >
> >   1184
> > > 1185  noinline __weak ssize_t bpf_getxattr(struct dentry *dentry, struct inode *inode,
> >   1186                                       const char *name, void *value, int size)
> >   1187  {
> >   1188          return __vfs_getxattr(dentry, inode, name, value, size);
> >   1189  }
> >   1190
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://01.org/lkp

--
Kartikeya

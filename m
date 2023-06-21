Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7F01C77C
	for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 21:44:45 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b51780bed0so50546425ad.3
        for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 14:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687383885; x=1689975885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Rd40KBCWSsCbJWxPET1CFACuq5ZB3wmGFYxKgqNwkc=;
        b=Ooor9E92TNcAvld0FWJty92UhU5ZJe3cq0fLlktiQEeF8kC9BZ8YBc5s9JJlW3nLys
         PQ/53w9p3mTMyTjjZOraNa0q6bgpULJW1Jy1eC04LdGIkxWiCJ1s8AMAvZIP3c0yaa/F
         OHlT/5r/bi/p3cjMtS09w0n7zytLB9bgn5Luk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687383885; x=1689975885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Rd40KBCWSsCbJWxPET1CFACuq5ZB3wmGFYxKgqNwkc=;
        b=aV6eysAgkSmSE85yZWYI+3Fr5Bva8rvgp3CTAfv565samCMbYaVNKm/t2vMJL3lWxt
         +Y1F2YjNfB/F+NnwWcHkWVSEsgAct7L0IjNs2A68toBEIwD7WtigfCTK363dmophlDOS
         e50p9NnAIHNMpGQreFhvd0fT+hC5fd4wV3aVgcQkn8UwDkUMd9klPSdX9pvMH+uIC5Uo
         4DE0wslj6vRrXesKxj1NsfTH3VoiobMUDeBCi2PB0aQcTk/UBN/z8pbeHUdC+aBTcaa1
         /5e7zEHMHYnd0yFNMzQiEREfkm3JQFruwqCMQMnmwLgJv700f4eSCzBW0HfyJ1Qoat+f
         4rhg==
X-Gm-Message-State: AC+VfDzGNsl2QRqSszCeMJtXLUfskOqjiFNjrXJVX2DFPctNv+Y/GW0e
	mMWMREJw5+GnVKrw4DbN5NkmOA==
X-Google-Smtp-Source: ACHHUZ7gqJTbHl8WT+G1auX5bF8S63aJrNLzA2YHyy+W6rVFe4J3nRu/wOMaivJPPydajh1yPvu6aQ==
X-Received: by 2002:a17:903:280e:b0:1ac:5717:fd5 with SMTP id kp14-20020a170903280e00b001ac57170fd5mr16450144plb.60.1687383885047;
        Wed, 21 Jun 2023 14:44:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709026bcc00b00186a2274382sm3941752plt.76.2023.06.21.14.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 14:44:44 -0700 (PDT)
Date: Wed, 21 Jun 2023 14:44:44 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [linux-next:master 2819/11071] fs/ceph/addr.c:794:12: warning:
 stack frame size (2096) exceeds limit (2048) in 'ceph_writepages_start'
Message-ID: <202306211444.EEB1506@keescook>
References: <202306210637.TpfYq9gM-lkp@intel.com>
 <202306211437.EDDEDA582@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306211437.EDDEDA582@keescook>

On Wed, Jun 21, 2023 at 02:39:39PM -0700, Kees Cook wrote:
> On Wed, Jun 21, 2023 at 06:56:36AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   9dbf40840551df336c95ce2a3adbdd25ed53c0ef
> > commit: df8fc4e934c12b906d08050d7779f292b9c5c6b5 [2819/11071] kbuild: Enable -fstrict-flex-arrays=3
> 
> This looks very much like:
> https://lore.kernel.org/all/202306100035.VTusNhm4-lkp@intel.com/
> 
> > config: riscv-randconfig-r004-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210637.TpfYq9gM-lkp@intel.com/config)
> > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210637.TpfYq9gM-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202306210637.TpfYq9gM-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> fs/ceph/addr.c:794:12: warning: stack frame size (2096) exceeds limit (2048) in 'ceph_writepages_start' [-Wframe-larger-than]
> >    static int ceph_writepages_start(struct address_space *mapping,
> >               ^
> >    1820/2096 (86.83%) spills, 276/2096 (13.17%) variables
> >    1 warning generated.
> 
> This appears to be a clang stack slot reuse issue. It continues to be
> investigated.

We're currently tracking it here, though we may need to split the bug
up:
https://github.com/ClangBuiltLinux/linux/issues/39

-- 
Kees Cook

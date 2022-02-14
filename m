Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5488BA35
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 18:56:03 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id v63so21884952ybv.10
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 10:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EU+Y9g3fEOTeCxwfSeBDFv5C05e9O8lQDJWe/ZBWNNE=;
        b=lTseh7w20Jnxj+fNFqFAWy9pMiAj72iIQ8VpyKBS0mtvZ9bomPxPQv5xjoveonHNgM
         I/miWjNPgL6IW/V7Az2pPrhQ2I5rtEI7Pb90EZy3ppaCFwY9wc1bzwbrqiZAdjVLI6h5
         3XvzXGAmork7ca9dk/tNm1OHhZFO88aGZ4+oBQNRnN8tIwWSBWKLIbHUWTL7C74HZ3Ff
         Mzj/mStKAwcCodSvUCsZHTCkedRMJAzxpm3RZLof1A2FJ63Cw71IUMD1mG06zQl+J3Ai
         QLLNp4IvLfn/Z31ZbY79cqWYYvWHCeKeQ2UemelQVh+2q+TUETAfmVNbGEiReaphm2BU
         QQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EU+Y9g3fEOTeCxwfSeBDFv5C05e9O8lQDJWe/ZBWNNE=;
        b=cYUXvpiDYf+6x+aO8upVnlH6Qee+yBBs4UYH/qrjjHAAynKTs30xBIf2XMrpJMv+kR
         EeylwYXWhqFHj7qe3q7y1wbzjtNRbL2PZ9qP2EgUbtmyvdVMPm9hRcajSSYhIGPQHzuZ
         0gpd75sv5Ymxd5nzPz6r8Ns5vnpDBkeq2o/3KdypBtDPZ4smFGbty1uvxNDzahg7ACRV
         oW5IQNq55am1Bju552CK8IUZ6k9RFFNvdCdZV71XyEvV86yng1RTTiUYSgDPiXAtjY/w
         ayvCdKoJ+IuTlxuDkEvdyGbaaV9Opi/E4NpGlnhjnD35CIYCZ1/3DBqCGZt20MAGjjMe
         gkxQ==
X-Gm-Message-State: AOAM533XGxRt/wfwA46gv1O8Tdyqui5xddE3C1cnsx3dv0FnIix/Ce7g
	zA9HWjWSyyIMVaOZE31/gmCGbpfsBuT0tO16z0tOuQ==
X-Google-Smtp-Source: ABdhPJzf4TDeCRBpfOmKLg2Q4qlhEBwIL9J6HmR4ZqT0xMbBN9sD3QCUHsQIdmqjpdlKpwQVK4fo2Fl+RHRXhLVQ8Fk=
X-Received: by 2002:a81:3986:: with SMTP id g128mr89907ywa.129.1644864962072;
 Mon, 14 Feb 2022 10:56:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202202120509.FMR7TEL1-lkp@intel.com> <CANn89iLS4N4cpX+Nh9ALjf_APOPQ4-aSPSX1P6iLpda8mJS8UQ@mail.gmail.com>
In-Reply-To: <CANn89iLS4N4cpX+Nh9ALjf_APOPQ4-aSPSX1P6iLpda8mJS8UQ@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 15 Feb 2022 00:25:51 +0530
Message-ID: <CA+G9fYt07Kd2u88a_vOZ1fjE3QcTizFX3bBMSSDQJTPXMWea3A@mail.gmail.com>
Subject: Re: [net:master 21/30] net/netfilter/xt_socket.c:224:3: error:
 implicit declaration of function 'nf_defrag_ipv6_disable'
To: Eric Dumazet <edumazet@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	netdev <netdev@vger.kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Florian Westphal <fw@strlen.de>
Content-Type: text/plain; charset="UTF-8"

On Sat, 12 Feb 2022 at 08:14, Eric Dumazet <edumazet@google.com> wrote:
>
> On Fri, Feb 11, 2022 at 1:55 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git master
> > head:   85d24ad38bc4658ce9a16b85b9c8dc0577d66c71
> > commit: 75063c9294fb239bbe64eb72141b6871fe526d29 [21/30] netfilter: xt_socket: fix a typo in socket_mt_destroy()
> > config: hexagon-randconfig-r045-20220211 (https://download.01.org/0day-ci/archive/20220212/202202120509.FMR7TEL1-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit/?id=75063c9294fb239bbe64eb72141b6871fe526d29
> >         git remote add net https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git
> >         git fetch --no-tags net master
> >         git checkout 75063c9294fb239bbe64eb72141b6871fe526d29
> >         # save the config file to linux build tree
> >         mkdir build_dir
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/netfilter/
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> net/netfilter/xt_socket.c:224:3: error: implicit declaration of function 'nf_defrag_ipv6_disable' [-Werror,-Wimplicit-function-declaration]
> >                    nf_defrag_ipv6_disable(par->net);
> >                    ^
> >    net/netfilter/xt_socket.c:224:3: note: did you mean 'nf_defrag_ipv4_disable'?
> >    include/net/netfilter/ipv4/nf_defrag_ipv4.h:7:6: note: 'nf_defrag_ipv4_disable' declared here
> >    void nf_defrag_ipv4_disable(struct net *net);
> >         ^
> >    1 error generated.
> >
>
> I guess something like this is needed ?

The reported build error was fixed by this patch.

>
> diff --git a/net/netfilter/xt_socket.c b/net/netfilter/xt_socket.c
> index 662e5eb1cc39e544191b3aab388c3762674d9251..7013f55f05d1ebca3b13d29934d8f6abc1ef36f0
> 100644
> --- a/net/netfilter/xt_socket.c
> +++ b/net/netfilter/xt_socket.c
> @@ -220,8 +220,10 @@ static void socket_mt_destroy(const struct
> xt_mtdtor_param *par)
>  {
>         if (par->family == NFPROTO_IPV4)
>                 nf_defrag_ipv4_disable(par->net);
> +#if IS_ENABLED(CONFIG_IP6_NF_IPTABLES)
>         else if (par->family == NFPROTO_IPV6)
>                 nf_defrag_ipv6_disable(par->net);
> +#endif
>  }
>
>  static struct xt_match socket_mt_reg[] __read_mostly = {

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org

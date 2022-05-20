Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48CE7A
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 13:17:36 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2f83983782fso86843697b3.6
        for <llvm@lists.linux.dev>; Fri, 20 May 2022 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DcB1zlqvD0ic5dHg+T25IYpQK53YYAb6GQPicG711bg=;
        b=MC1PMrseH0OxjpwmhAcX/GaEsapXbnhc6GVvhC9tV6NEJZlNCnTBEFbA7FBMeo85A1
         mpg/s4BR7IuFVe4qWQLnlgsyWJC0DKbHJAhzsuS2l5xKjbGEHWcSnYQrtbIPX3AU3YAr
         mS+oYTuPZuvpTrlP4F/k1+agSsOYonddlEtFR0Ye5an0FGYXOnRGXpix5wzoW2tnN+mF
         7c03soZcVj/X6qKj9zo2Vo7WFDP2BJJVwBA5UkPsaNoXMCat009MmKAGl7xrGz+GoEiw
         jcPRQrxXsuUMD8BM1+OeWjuSBvz8R64rRlnIpAh5vGQda/y2bTuYoH2abtA9Z6+mb54I
         /8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DcB1zlqvD0ic5dHg+T25IYpQK53YYAb6GQPicG711bg=;
        b=q119qulV36gYfrMb+HscBXGqPmH8nepmEg5GRCiGfMjvCIKSl/Ba8Emdl6tVb2YbpW
         eNtDEtEAE5mRFz13paZal9a01muligRffZ8kw1elUxAepw37tMOTlkEWrj1ytE62I1uM
         iQWOCAV+CZDmrgXA6IhWSYkAZoLR7b19KCufdO9F3isMeY2URFu1U6B8vgICus1wIX1p
         RQtORn6bffdEHtDCcKKjkcpuq+GhXTABkftIWc15TBC/oLpMLJaMEXF4MxLP2Z02srDH
         bIYp9qpMLaebgxnRHCJqKDh8wnNxzRDEc+VF9YOzhcPyRSKVhKJbJtvx9tR20WjkRt/A
         w8Cg==
X-Gm-Message-State: AOAM5312mRqFrM3MjuSEgFWMNxLGEodQpCsQTxoKDQxzqaetWmXmMEou
	K8jblwqnlEXaK9YeKopb3Z+mxXXnVH2vKaPPXRa6eQ==
X-Google-Smtp-Source: ABdhPJy4ave1qred1HSociKbyiDNRS2gm4U7Lbzq9ogIgZs7jaoWZK1yaa1TvirK7fO6aHUq8/nc+fOu7W05SYR8FGA=
X-Received: by 2002:a0d:e888:0:b0:2ff:54e:8cf4 with SMTP id
 r130-20020a0de888000000b002ff054e8cf4mr9989471ywe.489.1653052655558; Fri, 20
 May 2022 06:17:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511233757.2001218-11-eric.dumazet@gmail.com>
 <202205122132.HUrst9JA-lkp@intel.com> <CANn89i+kG-2uW+7iqqVjJN8Q+bZF82f+4qONsmg+4zuW+qj0Ug@mail.gmail.com>
 <7bc3a332-10f7-4a31-33ce-7507a2791bf3@intel.com>
In-Reply-To: <7bc3a332-10f7-4a31-33ce-7507a2791bf3@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 20 May 2022 06:17:24 -0700
Message-ID: <CANn89i+Tdm-J1b1P7A1MZQVvmnq0hKRjaRYgHGbn8bmnLkxnAg@mail.gmail.com>
Subject: Re: [PATCH net-next 10/10] inet: add READ_ONCE(sk->sk_bound_dev_if)
 in INET_MATCH()
To: "Chen, Rong A" <rong.a.chen@intel.com>
Cc: kernel test robot <lkp@intel.com>, Eric Dumazet <eric.dumazet@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2022 at 1:40 AM Chen, Rong A <rong.a.chen@intel.com> wrote:
>
>
>
> On 5/13/2022 12:13 AM, Eric Dumazet wrote:
> > On Thu, May 12, 2022 at 6:16 AM kernel test robot <lkp@intel.com> wrote=
:
> >>
> >> Hi Eric,
> >>
> >> I love your patch! Perhaps something to improve:
> >>
> >> [auto build test WARNING on net-next/master]
> >>
> >> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/ne=
t-add-annotations-for-sk-sk_bound_dev_if/20220512-073914
> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next=
.git b57c7e8b76c646cf77ce4353a779a8b781592209
> >> config: hexagon-randconfig-r035-20220512 (https://download.01.org/0day=
-ci/archive/20220512/202205122132.HUrst9JA-lkp@intel.com/config)
> >> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1=
8dd123c56754edf62c7042dcf23185c3727610f)
> >> reproduce (this is a W=3D1 build):
> >>          wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> >>          chmod +x ~/bin/make.cross
> >>          # https://github.com/intel-lab-lkp/linux/commit/c92cfd9f3ecb4=
83ff055edb02f7498494b96ba68
> >>          git remote add linux-review https://github.com/intel-lab-lkp/=
linux
> >>          git fetch --no-tags linux-review Eric-Dumazet/net-add-annotat=
ions-for-sk-sk_bound_dev_if/20220512-073914
> >>          git checkout c92cfd9f3ecb483ff055edb02f7498494b96ba68
> >>          # save the config file
> >>          mkdir build_dir && cp config build_dir/.config
> >>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cros=
s W=3D1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash net/ipv4/
> >
> > Thank you for the instructions.
> > Unfortunately this is failing for me.
>
> Hi Eric,
>
> Can you share the problem you met=EF=BC=9F

It seems the problem has disappeared on the host where I retried the
recipe this morning.

It is very possible that this was because I started from a fresh
directory, instead of reusing a prior git tree,
hoping to not pull 4 GB of data from the Internet :/

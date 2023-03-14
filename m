Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5E23C30;
	Tue, 14 Mar 2023 16:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E889C4339C;
	Tue, 14 Mar 2023 16:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678813055;
	bh=GJtJbGnCLhXOWQnAhqQtOK2QLCvHGROZaNmfiHX/LF0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CrbhC8arCDKyWRK3CWHuEPBIy7gCONvSW8TFsjVfmSM7G/PO3y079vfggOR7eoBOe
	 IucG/5OZ4aRsAZoznuKMLV9Fc1QXegE6stfrbgRWLHcYR2O01BLMpLdtTKOuGD9apX
	 jl1SwdBrqNhkti8xZQ7pycK1NyMYZeCvYSotPvPTtmHDKmGOfi+MZbB86OneX0zHd8
	 1arw5z/fjmLHELHTGxZW6bmTmWFHXZv5a1Mp6vxvantoqNNVG6kLEdPOhIQZIxcKif
	 jxmQGKnj7O/ENEq4CJNMuAd4EjbDCzyIt1CMtYChga7j7xthv+Yj29MZKsuL/HnNAq
	 ff8Vm3MQPL7+A==
Received: by mail-lf1-f51.google.com with SMTP id o8so901425lfo.0;
        Tue, 14 Mar 2023 09:57:35 -0700 (PDT)
X-Gm-Message-State: AO0yUKXROyhc2IKOQSCtKqO96yi73YIx5phGdoyXQzUnVc/kCddcOonp
	eyyLSOOXABz7o3HE8Tc8hEOmmborW8iQ2eif5sI=
X-Google-Smtp-Source: AK7set+W3E16p3kGZxFB4cOCKA49Y9H0cdVIINDarVP230VZbJIst/KanPg/890/Bn8Dr6KvGXjZFLZfVDk426MMnRY=
X-Received: by 2002:ac2:4835:0:b0:4db:1a0d:f261 with SMTP id
 21-20020ac24835000000b004db1a0df261mr989882lft.3.1678813053632; Tue, 14 Mar
 2023 09:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202303141758.4EtLtIA1-lkp@intel.com> <777b8f63-4d41-66dc-3cb5-8ff8c916ce01@huawei.com>
In-Reply-To: <777b8f63-4d41-66dc-3cb5-8ff8c916ce01@huawei.com>
From: Song Liu <song@kernel.org>
Date: Tue, 14 Mar 2023 09:57:21 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6N-TYRmp_H2EDEacm++PVJ+k-RXEBgwfjWhzrK0paqPA@mail.gmail.com>
Message-ID: <CAPhsuW6N-TYRmp_H2EDEacm++PVJ+k-RXEBgwfjWhzrK0paqPA@mail.gmail.com>
Subject: Re: [song-md:md-next 15/18] drivers/md/md-cluster.c:425:42: error:
 use of undeclared identifier 'mddev'; did you mean 'mode'?
To: Yu Kuai <yukuai3@huawei.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-raid@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 2:27=E2=80=AFAM Yu Kuai <yukuai3@huawei.com> wrote:
>
> Hi, Song
>
> =E5=9C=A8 2023/03/14 17:13, kernel test robot =E5=86=99=E9=81=93:
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git md-ne=
xt
> > head:   ec7246c9455e83f452055cec9c39bd54e72217a4
> > commit: 48b34bba06372e5f6645716b57394db28fa7260c [15/18] md: refactor m=
d_wakeup_thread()
> > config: s390-randconfig-r032-20230312 (https://download.01.org/0day-ci/=
archive/20230314/202303141758.4EtLtIA1-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67=
409911353323ca5edf2049ef0df54132fa1ca7)
> > reproduce (this is a W=3D1 build):
> >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          # install s390 cross compiling tool for clang build
> >          # apt-get install binutils-s390x-linux-gnu
> >          # https://git.kernel.org/pub/scm/linux/kernel/git/song/md.git/=
commit/?id=3D48b34bba06372e5f6645716b57394db28fa7260c
> >          git remote add song-md git://git.kernel.org/pub/scm/linux/kern=
el/git/song/md.git
> >          git fetch --no-tags song-md md-next
> >          git checkout 48b34bba06372e5f6645716b57394db28fa7260c
> >          # save the config file
> >          mkdir build_dir && cp config build_dir/.config
> >          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Ds390 olddefconfig
> >          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Ds390 SHELL=3D/bin/bash drivers/md/
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202303141758.4EtLtIA1-lkp=
@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> drivers/md/md-cluster.c:425:42: error: use of undeclared identifier '=
mddev'; did you mean 'mode'?
> >                             md_wakeup_thread(&cinfo->recv_thread, mddev=
);
> >                                                                   ^~~~~
> >                                                                   mode
> >     drivers/md/md-cluster.c:418:37: note: 'mode' declared here
> >     static void ack_bast(void *arg, int mode)
> >                                         ^
> >     1 error generated.
> >
> >
> > vim +425 drivers/md/md-cluster.c
> >
> >     412
> >     413       /*
> >     414        * The BAST function for the ack lock resource
> >     415        * This function wakes up the receive thread in
> >     416        * order to receive and process the message.
> >     417        */
> >     418       static void ack_bast(void *arg, int mode)
> >     419       {
> >     420               struct dlm_lock_resource *res =3D arg;
> >     421               struct md_cluster_info *cinfo =3D res->mddev->clu=
ster_info;
> >     422
> >     423               if (mode =3D=3D DLM_LOCK_EX) {
> >     424                       if (test_bit(MD_CLUSTER_ALREADY_IN_CLUSTE=
R, &cinfo->state))
> >   > 425                               md_wakeup_thread(&cinfo->recv_thr=
ead, mddev);
>
> Sorry that I didn't open md-cluster config, and I failed to test this in
> my environment.
> Sincerely sorry for the trouble, I'll send new version and make sure all>=
 model is tested.

No worries. Thanks for working on this.

Song

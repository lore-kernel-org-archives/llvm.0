Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DCB4C77;
	Tue, 23 May 2023 18:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F88C433EF;
	Tue, 23 May 2023 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684866962;
	bh=U7NjGne/yRQxzowV+AzT1KR1wAm5ZIeHfrNFXUStrM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cXV3/3ulx3HInGvcq8qbvr5ayClxeFCwycXVYPq0iou2dKhFNRWjfSnDCLzRM8g9m
	 F10BdZaU+6rxFUy7JpHeXI6X3QuOrIMYdeomZnkHBavO16UsK5z/bExmK1Ke8eXU/z
	 mhtObf+ALjOrisZ5nx3C2Xg6du++8hoWMONK1TXTg76l0UJy0HQI8Y+f3ZfZWJ0CYI
	 rt2uLV45ErwNvMMT8+XSpijqthjVoKiXCJb8JFIejm4OCQp7ukhheTlZ7djvlLmno+
	 AIm2QberSGGNyfwxM/zeb6zysLa05Rm91kbegD80LlxjL45t1ZBaQB3bc5gvM7mw/1
	 3S24pGIMDeWwg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso209712e87.0;
        Tue, 23 May 2023 11:36:02 -0700 (PDT)
X-Gm-Message-State: AC+VfDwCfEjuWWNIax5pxqw+AOOnXlPMjbhjLTdabGBsFi5jVozfn9nX
	zwN8cASXgKhKTAiGTsm5aBk40MJOCwLh6bUVDmc=
X-Google-Smtp-Source: ACHHUZ5HVOSj1+YOWYmyJCLLN7KNDufBEMxkgWnbtO6gqdzyNzJbM5Khmu2VV3rAv9wKhEqZhxABDqgbneqTgQYbZr8=
X-Received: by 2002:ac2:5323:0:b0:4f4:b3a6:4135 with SMTP id
 f3-20020ac25323000000b004f4b3a64135mr1837539lfh.55.1684866960704; Tue, 23 May
 2023 11:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305191808.4xsaLKSZ-lkp@intel.com> <5e8a5f4f-e71c-97a4-6ace-974753a1a528@linux.dev>
In-Reply-To: <5e8a5f4f-e71c-97a4-6ace-974753a1a528@linux.dev>
From: Song Liu <song@kernel.org>
Date: Tue, 23 May 2023 11:35:47 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6aAZK5gAtSpLOTdoNhJDBpY24vvp13kkp=yQ_cADauXw@mail.gmail.com>
Message-ID: <CAPhsuW6aAZK5gAtSpLOTdoNhJDBpY24vvp13kkp=yQ_cADauXw@mail.gmail.com>
Subject: Re: [song-md:module_alloc_test 5/6] arch/powerpc/kernel/module.c:108:8:
 error: unused variable 'ptr'
To: Guoqing Jiang <guoqing.jiang@linux.dev>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-raid@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 4:05=E2=80=AFAM Guoqing Jiang <guoqing.jiang@linux.=
dev> wrote:
>
>
>
> On 5/19/23 18:41, kernel test robot wrote:
> > Hi Song,
> >
> > FYI, the error/warning was bisected to this commit, please ignore it if=
 it's irrelevant.
> >
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git modul=
e_alloc_test
>
> Could you only post test results for md-next/md-fixes branches to raid
> list? Since this is
> obvious irrelevant to the list.

Created https://github.com/intel/lkp-tests/pull/303 to silent these reports=
.

Sorry for the noise.

Thank,
Song

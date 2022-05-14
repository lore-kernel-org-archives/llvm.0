Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB236A
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 05:16:21 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2f7ca2ce255so108252557b3.7
        for <llvm@lists.linux.dev>; Fri, 13 May 2022 22:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tgxGrfbnOUDbxRi/HopYzJN2PHchIMqDSJY9CbCOcv4=;
        b=E30/C3RmRsk6fe/SPPxWuAm8fzmMvHi+vT8pQt2VoiPxDM28aoii9aza2kQKd4pXKD
         sFfc1MqrVdnFceBWl8RfUMhIzjDG6V3bVbV29wDQExhDtl2lxfgaaQl9P5xI+iV8FMKX
         T+FwQ0o8/H7lkiuxOxgkqjRyp72xxiNDk2A0N56um/l2gTQvDaxSmWdjjpzKy+bH9Wvb
         2hYzN3QpzxUDhZ1S4xJyrot9dKRoTG8IMzmqnHPIg7BwHIo/HRthctz7c8jVuDzBoKPi
         i8Wi2WmbubwH4Bh3/DnV8cR0yBZrHO4Lz4E3OM17xH06yGCRf5KyCFQjavc9yykJcqIf
         nizA==
X-Gm-Message-State: AOAM5308GShzYmnO0qdksNA0qFVdX1lUofGJsCzfyeQrG6UGPaRa1qa3
	kpRuFEp+po2U0eVbuBwinaB+Fylf1MjccvrKTW7D/rVKVVX7vQ==
X-Google-Smtp-Source: ABdhPJxV4Ky10ErjrvOMl+cu+71QRgJi6kpzasVTB89gixOVLz2IVUGv3/pCwaUcArF+fHVxXAmfjsnU4QLxSCquLi8=
X-Received: by 2002:a81:8cf:0:b0:2f4:da59:9eef with SMTP id
 198-20020a8108cf000000b002f4da599eefmr9502079ywi.78.1652505380856; Fri, 13
 May 2022 22:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513153606.302464-2-mailhol.vincent@wanadoo.fr> <202205141221.H0aZXRak-lkp@intel.com>
In-Reply-To: <202205141221.H0aZXRak-lkp@intel.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Sat, 14 May 2022 14:16:09 +0900
Message-ID: <CAMZ6RqLU-Wg0Cau3cM=QsU-t-7Lyzmo1nJ_VAA4Mbw3u0jnNtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] can: skb:: move can_dropped_invalid_skb and
 can_skb_headroom_valid to skb.c
To: kernel test robot <lkp@intel.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Max Staudt <max@enpas.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat. 14 May 2022 =C3=A0 13:20, kernel test robot <lkp@intel.com> wrote:
> Hi Vincent,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on mkl-can-next/testing]
> [also build test ERROR on v5.18-rc6 next-20220513]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Mailhol/ca=
n-skb-move-can_dropped_invalid_skb-and-can_skb_headroom_valid-to-skb-c/2022=
0514-003707
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-nex=
t.git testing
> config: arm-randconfig-r021-20220512 (https://download.01.org/0day-ci/arc=
hive/20220514/202205141221.H0aZXRak-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3818=
9438b69ca27b4c6ce707c52dbd217583d046)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://github.com/intel-lab-lkp/linux/commit/8f56e6b1b9945ea47=
c9f410d1254451df9d6fe22
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Vincent-Mailhol/can-skb-move-can=
_dropped_invalid_skb-and-can_skb_headroom_valid-to-skb-c/20220514-003707
>         git checkout 8f56e6b1b9945ea47c9f410d1254451df9d6fe22
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Darm SHELL=3D/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    ld.lld: warning: lld uses blx instruction, no object with architecture=
 supporting feature detected
>    ld.lld: warning: lld uses blx instruction, no object with architecture=
 supporting feature detected
> >> ld.lld: error: undefined symbol: can_dropped_invalid_skb
>    >>> referenced by vxcan.c:45 (drivers/net/can/vxcan.c:45)
>    >>>               net/can/vxcan.o:(vxcan_xmit) in archive drivers/buil=
t-in.a

OK, so the issue is that VCAN and VXCAN are users of
can_dropped_invalid_skb() but do not depend on CAN_DEV. Above error
will appear if CONFIG_CAN_DEV is not set (or if CONFIG_V{,X}CAN is set
to "yes" and CAN_DEV is set to "module").
I see three choices here:
  1. move can_dropped_invalid_skb() outside of drivers/net/can (i.e.
move it somewhere in net/can).
  2. split CAN_DEV into one additional sub module: CAN_SKB and add a
dependency to it in VCAN and VXCAN.
  3. Add a dependency to CAN_DEV in VCAN and VXCAN

1. is I think the worse, 2. the best, 3. is the laziest option and is
kind of acceptable.
@Marc (and anyone else), what are your thoughts?

Yours sincerely,
Vincent Mailhol

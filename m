Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51659EC5;
	Mon, 26 Jun 2023 05:34:13 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f866a3d8e4so3703383e87.0;
        Sun, 25 Jun 2023 22:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687757651; x=1690349651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nsb4FXS4Gf4O6IwACPxQt8mTdkc/Qz9TKM8mGPF4/mQ=;
        b=KWna6bZqM46hpO+PjFEB+W/NKi6LA0v0Z3mtIc7CUXEpl7ayi4YLiX6vmtvZnlS3w7
         2LqAifsloIppueGrsXZ6nlXwLeX2EweMSIztuZI24orxvc1SiR1h4pr2u0xYdY1tKba9
         TFNjQOGTDzVb8tvBiOHCcEUOTMxKM6T6iB6zA77N1G2peDRU3g1VzcC5+HKJZR3cYBgC
         5ahuanAXmcM04iruCHvkqsULvCKC7t6PPOvVpX36yfrAlfYsc5Ttiou2aLN9fWiH619k
         pVkGyUBg0BisBKy8jJfwdBA1IcsWO0ejECwb+/RUq+zgRFbL7cuh4Pq1s/7IE1xb2iYe
         G7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687757651; x=1690349651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nsb4FXS4Gf4O6IwACPxQt8mTdkc/Qz9TKM8mGPF4/mQ=;
        b=dzUlOWPSsNrwYWsIm+/SnnRVZafz6IKE2OsGmpp7ttfi3jaKtoFSRsb9z38NvqdnxT
         jxAKndBEC9Mwv82H7+ra2pxeGjH8FD2i7NJuyD8iOXcmc722fe3pbDai/3+o1eCriBy7
         ttHAYBOXl/MeWHZFo2/LWji43ietA//RWbdfvJ+xJqwSorzpQfcbYVJ7TE2KTMYInd3k
         hQQmtCKS6UEZHlXnf5OV3Cl/dPsmc+toOK7B+r4W7GmgCIKp9tnn96mYyVxNHU8qqUQL
         n/AJh8zYvpiUJPdHgLRFEN5BbH8D4G5qfP98LJkNYwskT68oAyAf7lGDWKwgmmeLTVPK
         oADA==
X-Gm-Message-State: AC+VfDxQ200XUBFo82PEDDbaVzKKXUBXE3Hfon/HMKOmPSDxVHJTm5QY
	+LXppIcXvN0HwnvsuJwdm+YBsUgz9Ns/DMDoe8s=
X-Google-Smtp-Source: ACHHUZ7Lbn86rFGEZyyvcUMNKiccN4UV18W96C8z1758EhgJNDUjwAZqUvb7E6u1h8vw87tCc0J5W4kkpjL9bfk7qQk=
X-Received: by 2002:a19:4409:0:b0:4f8:7556:23e6 with SMTP id
 r9-20020a194409000000b004f8755623e6mr10795515lfa.54.1687757650882; Sun, 25
 Jun 2023 22:34:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306251539.R34e3RXd-lkp@intel.com> <CAH2r5mup6woFss05nQ2PA88UkFowzxdnBvztVycE=wcW5bTLMA@mail.gmail.com>
In-Reply-To: <CAH2r5mup6woFss05nQ2PA88UkFowzxdnBvztVycE=wcW5bTLMA@mail.gmail.com>
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Mon, 26 Jun 2023 11:03:59 +0530
Message-ID: <CANT5p=rPV=+8qat+T0_wEm3RE6qC=Sj+ODvnnW9Ey3fe00RWJA@mail.gmail.com>
Subject: Re: [cifs:for-next 13/14] fs/smb/client/cifs_debug.c:167:1: warning:
 label at end of compound statement is a C2x extension
To: Steve French <smfrench@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Shyam Prasad N <sprasad@microsoft.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, Steve French <stfrench@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 25, 2023 at 9:11=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> Updated Shyam's patch to address this and a sparse warning and a
> checkpatch warning
>
>
> On Sun, Jun 25, 2023 at 2:14=E2=80=AFAM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> > head:   d75e841ced93ce9cd86dc46b8a9453241dcbc61b
> > commit: 33bc5dec2b4fd8d00fed51183615d91badf607d6 [13/14] cifs: display =
the endpoint IP details in DebugData
> > config: hexagon-randconfig-r045-20230625 (https://download.01.org/0day-=
ci/archive/20230625/202306251539.R34e3RXd-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.gi=
t 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce: (https://download.01.org/0day-ci/archive/20230625/2023062515=
39.R34e3RXd-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202306251539.R34e3RXd-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from fs/smb/client/cifs_debug.c:15:
> >    In file included from include/uapi/linux/ethtool.h:19:
> >    In file included from include/linux/if_ether.h:19:
> >    In file included from include/linux/skbuff.h:17:
> >    In file included from include/linux/bvec.h:10:
> >    In file included from include/linux/highmem.h:12:
> >    In file included from include/linux/hardirq.h:11:
> >    In file included from ./arch/hexagon/include/generated/asm/hardirq.h=
:1:
> >    In file included from include/asm-generic/hardirq.h:17:
> >    In file included from include/linux/irq.h:20:
> >    In file included from include/linux/io.h:13:
> >    In file included from arch/hexagon/include/asm/io.h:334:
> >    include/asm-generic/io.h:547:31: warning: performing pointer arithme=
tic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >      547 |         val =3D __raw_readb(PCI_IOBASE + addr);
> >          |                           ~~~~~~~~~~ ^
> >    include/asm-generic/io.h:560:61: warning: performing pointer arithme=
tic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >      560 |         val =3D __le16_to_cpu((__le16 __force)__raw_readw(PC=
I_IOBASE + addr));
> >          |                                                         ~~~~=
~~~~~~ ^
> >    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded f=
rom macro '__le16_to_cpu'
> >       37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
> >          |                                                   ^
> >    In file included from fs/smb/client/cifs_debug.c:15:
> >    In file included from include/uapi/linux/ethtool.h:19:
> >    In file included from include/linux/if_ether.h:19:
> >    In file included from include/linux/skbuff.h:17:
> >    In file included from include/linux/bvec.h:10:
> >    In file included from include/linux/highmem.h:12:
> >    In file included from include/linux/hardirq.h:11:
> >    In file included from ./arch/hexagon/include/generated/asm/hardirq.h=
:1:
> >    In file included from include/asm-generic/hardirq.h:17:
> >    In file included from include/linux/irq.h:20:
> >    In file included from include/linux/io.h:13:
> >    In file included from arch/hexagon/include/asm/io.h:334:
> >    include/asm-generic/io.h:573:61: warning: performing pointer arithme=
tic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >      573 |         val =3D __le32_to_cpu((__le32 __force)__raw_readl(PC=
I_IOBASE + addr));
> >          |                                                         ~~~~=
~~~~~~ ^
> >    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded f=
rom macro '__le32_to_cpu'
> >       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
> >          |                                                   ^
> >    In file included from fs/smb/client/cifs_debug.c:15:
> >    In file included from include/uapi/linux/ethtool.h:19:
> >    In file included from include/linux/if_ether.h:19:
> >    In file included from include/linux/skbuff.h:17:
> >    In file included from include/linux/bvec.h:10:
> >    In file included from include/linux/highmem.h:12:
> >    In file included from include/linux/hardirq.h:11:
> >    In file included from ./arch/hexagon/include/generated/asm/hardirq.h=
:1:
> >    In file included from include/asm-generic/hardirq.h:17:
> >    In file included from include/linux/irq.h:20:
> >    In file included from include/linux/io.h:13:
> >    In file included from arch/hexagon/include/asm/io.h:334:
> >    include/asm-generic/io.h:584:33: warning: performing pointer arithme=
tic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >      584 |         __raw_writeb(value, PCI_IOBASE + addr);
> >          |                             ~~~~~~~~~~ ^
> >    include/asm-generic/io.h:594:59: warning: performing pointer arithme=
tic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >      594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IO=
BASE + addr);
> >          |                                                       ~~~~~~=
~~~~ ^
> >    include/asm-generic/io.h:604:59: warning: performing pointer arithme=
tic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >      604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IO=
BASE + addr);
> >          |                                                       ~~~~~~=
~~~~ ^
> > >> fs/smb/client/cifs_debug.c:167:1: warning: label at end of compound =
statement is a C2x extension [-Wc2x-extensions]
> >      167 | }
> >          | ^
> >    7 warnings generated.
> >
> >
> > vim +167 fs/smb/client/cifs_debug.c
> >
> > 33bc5dec2b4fd8 fs/smb/client/cifs_debug.c Shyam Prasad N 2023-06-09  16=
6
> > 85150929a15b4e fs/cifs/cifs_debug.c       Aurelien Aptel 2019-11-20 @16=
7  }
> > 85150929a15b4e fs/cifs/cifs_debug.c       Aurelien Aptel 2019-11-20  16=
8
> >
> > :::::: The code at line 167 was first introduced by commit
> > :::::: 85150929a15b4e0a225434d5970bba14ebdf31f1 cifs: dump channel info=
 in DebugData
> >
> > :::::: TO: Aurelien Aptel <aaptel@suse.com>
> > :::::: CC: Steve French <stfrench@microsoft.com>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>
>
>
> --
> Thanks,
>
> Steve

Thanks Steve.
The changes look good to me.

--=20
Regards,
Shyam

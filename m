Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA421FA5
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 02:10:10 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id p8so457891plq.13
        for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 19:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q+yhNpMQkGS6Yd2NW8byn73RjKQp6M05xkM0h+dlv2A=;
        b=oI6p/pl8UsljvqbXas/blBvpIAMZZQmZN7tBPFi5TWkRXZCR+MjJcc2eF9bhrJO6+g
         789meojm8wx+bFPFiCa3/5XyWSyPYM5ekXkv1SygKFtucA6khiTyE+4xq/SLX95gPXWJ
         KgJBvCNftxNS9JOLE9KgpuFHxvkPS3adgd91z4tjOZ1ZX8oskOYBJzV8zLAcegs2doUO
         OAXrEQK1LhlG1Vh176mFm3Zv0gPGhyIZ6G53H+Qjkq0+X0aSjlcDPPmhDYHfPA8W6pv3
         UrFQTxq12/6Nmk8dHOx7V51eibBQeTshb8iIudnO51+HurxDaxQZL6h6LlxVWGs4sXOF
         l2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q+yhNpMQkGS6Yd2NW8byn73RjKQp6M05xkM0h+dlv2A=;
        b=q9MgZUEW5+THO89AO6S3wQHP9t6g3DNXM2HbpRrqplxxHN6Au++gq8LQnL8iyfaRbo
         FEjuQukUBeQEeI90T5mWivVMFTwdxHLmXOC1Qve77Xpgn//RxjLIifMCjpLdj0/qlGc8
         GNVp76UOyHLLJIY3Zy1Ow61bc/sjKBGpUacwyRLkgneVMT+GZzzX5P80mbraI2/Ltw4G
         0pbz3wlvh1HEf0la7oug4uOhVWBgYAnOw6+Ti8/eV5MQQw7iKQRlLQEn0ttkf0D/fqFP
         lM3qYPnpCtmH+tRCwfjTOsQuLC5pGW/SDSV0cbJWLZz/F76xzTsDkgDtg2MpKyaqn4P3
         VUZg==
X-Gm-Message-State: AJIora+323it524pt8lHRYmQ4PYeSb2qhWoPFISsQdLN1HZdnHnASr/S
	odQlhxz52O1a8FtBN4YoPgg9qSonz2/bEH0shM4=
X-Google-Smtp-Source: AGRyM1us5A+QI/5yjTIs7GZ+Fibcy0BvdHO3bStp0vjnwVqspi54LF+nf5RFfgyPvHj5rHYmO+vzhYG4oUUlEIT7Hko=
X-Received: by 2002:a17:90a:d3d8:b0:1f2:2cd:a1ca with SMTP id
 d24-20020a17090ad3d800b001f202cda1camr8851620pjw.135.1658369410178; Wed, 20
 Jul 2022 19:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207150400.NMBYJFkA-lkp@intel.com>
In-Reply-To: <202207150400.NMBYJFkA-lkp@intel.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Thu, 21 Jul 2022 07:39:58 +0530
Message-ID: <CAFqt6zb3koMKgkFqYHppEYg4vcWtW66raXxY3XjpUXT40bzauQ@mail.gmail.com>
Subject: Re: [linux-next:master 10618/10678] drivers/scsi/qla2xxx/qla_init.c:171:10:
 warning: variable 'bail' set but not used
To: kernel test robot <lkp@intel.com>
Cc: Quinn Tran <qutran@marvell.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Himanshu Madhani <himanshu.madhani@oracle.com>, Nilesh Javali <njavali@marvell.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 15, 2022 at 1:38 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
> commit: c8c2a9053c4b28167c2a63e78d7949b775d238b6 [10618/10678] scsi: qla2xxx: Fix imbalance vha->vref_count
> config: riscv-randconfig-r002-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150400.NMBYJFkA-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c8c2a9053c4b28167c2a63e78d7949b775d238b6
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout c8c2a9053c4b28167c2a63e78d7949b775d238b6
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/scsi/qla2xxx/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    In file included from drivers/scsi/qla2xxx/qla_init.c:6:
>    In file included from drivers/scsi/qla2xxx/qla_def.h:14:
>    In file included from include/linux/pci.h:38:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val = __raw_readb(PCI_IOBASE + addr);
>                              ~~~~~~~~~~ ^
>    include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>                                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>    #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>                                                      ^
>    In file included from drivers/scsi/qla2xxx/qla_init.c:6:
>    In file included from drivers/scsi/qla2xxx/qla_def.h:14:
>    In file included from include/linux/pci.h:38:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>                                                            ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
>    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>                                                      ^
>    In file included from drivers/scsi/qla2xxx/qla_init.c:6:
>    In file included from drivers/scsi/qla2xxx/qla_def.h:14:
>    In file included from include/linux/pci.h:38:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/riscv/include/asm/io.h:136:
>    include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writeb(value, PCI_IOBASE + addr);
>                                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>                                                          ~~~~~~~~~~ ^
>    include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>                                                          ~~~~~~~~~~ ^
>    include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>                                                      ~~~~~~~~~~ ^
> >> drivers/scsi/qla2xxx/qla_init.c:171:10: warning: variable 'bail' set but not used [-Wunused-but-set-variable]
>            uint8_t bail;
>                    ^
>    drivers/scsi/qla2xxx/qla_init.c:2023:10: warning: variable 'bail' set but not used [-Wunused-but-set-variable]
>            uint8_t bail;
>                    ^
>    drivers/scsi/qla2xxx/qla_init.c:5533:7: warning: variable 'found_devs' set but not used [-Wunused-but-set-variable]
>            int             found_devs;
>                            ^
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    error: A dwo section may not contain relocations
>    fatal error: too many errors emitted, stopping now [-ferror-limit=]
>    10 warnings and 20 errors generated.
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for DRM_TTM
>    Depends on HAS_IOMEM && DRM && MMU
>    Selected by
>    - DRM_TTM_HELPER && HAS_IOMEM && DRM
>    - DRM_HISI_HIBMC && HAS_IOMEM && DRM && PCI && (ARM64 || COMPILE_TEST
>
>
> vim +/bail +171 drivers/scsi/qla2xxx/qla_init.c
>
>    164
>    165  int qla24xx_async_abort_cmd(srb_t *cmd_sp, bool wait)
>    166  {
>    167          scsi_qla_host_t *vha = cmd_sp->vha;
>    168          struct srb_iocb *abt_iocb;
>    169          srb_t *sp;
>    170          int rval = QLA_FUNCTION_FAILED;
>  > 171          uint8_t bail;
>    172
>    173          /* ref: INIT for ABTS command */
>    174          sp = qla2xxx_get_qpair_sp(cmd_sp->vha, cmd_sp->qpair, cmd_sp->fcport,
>    175                                    GFP_ATOMIC);
>    176          if (!sp)
>    177                  return QLA_MEMORY_ALLOC_FAILED;
>    178
>    179          QLA_VHA_MARK_BUSY(vha, bail);

Looking into other 2 callers of QLA_VHA_MARK_BUSY(), this check is needed.
Although I am not sure if returning NULL is appropriate or any other
error value should be returned ?
I will post a patch if this change is fine.

+ if (bail)
+        return NULL;

>    180          abt_iocb = &sp->u.iocb_cmd;
>    181          sp->type = SRB_ABT_CMD;
>    182          sp->name = "abort";
>    183          sp->qpair = cmd_sp->qpair;
>    184          sp->cmd_sp = cmd_sp;
>    185          if (wait)
>    186                  sp->flags = SRB_WAKEUP_ON_COMP;
>    187
>    188          init_completion(&abt_iocb->u.abt.comp);
>    189          /* FW can send 2 x ABTS's timeout/20s */
>    190          qla2x00_init_async_sp(sp, 42, qla24xx_abort_sp_done);
>    191          sp->u.iocb_cmd.timeout = qla24xx_abort_iocb_timeout;
>    192
>    193          abt_iocb->u.abt.cmd_hndl = cmd_sp->handle;
>    194          abt_iocb->u.abt.req_que_no = cpu_to_le16(cmd_sp->qpair->req->id);
>    195
>    196          ql_dbg(ql_dbg_async, vha, 0x507c,
>    197                 "Abort command issued - hdl=%x, type=%x\n", cmd_sp->handle,
>    198                 cmd_sp->type);
>    199
>    200          rval = qla2x00_start_sp(sp);
>    201          if (rval != QLA_SUCCESS) {
>    202                  /* ref: INIT */
>    203                  kref_put(&sp->cmd_kref, qla2x00_sp_release);
>    204                  return rval;
>    205          }
>    206
>    207          if (wait) {
>    208                  wait_for_completion(&abt_iocb->u.abt.comp);
>    209                  rval = abt_iocb->u.abt.comp_status == CS_COMPLETE ?
>    210                          QLA_SUCCESS : QLA_ERR_FROM_FW;
>    211                  /* ref: INIT */
>    212                  kref_put(&sp->cmd_kref, qla2x00_sp_release);
>    213          }
>    214
>    215          return rval;
>    216  }
>    217
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>

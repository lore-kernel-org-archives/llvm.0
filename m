Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635B762F
	for <llvm@lists.linux.dev>; Wed,  6 Sep 2023 00:57:50 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1bee82fad0fso20449335ad.2
        for <llvm@lists.linux.dev>; Tue, 05 Sep 2023 17:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693961869; x=1694566669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QylyR/V4a/iloEizCjqHR8j3LR/2OkmoSdq06y9bpgA=;
        b=CnJr/o30PhkWOXdf2frCo+VFnb2WrkS3bvc2wF0EqiIVK1JSeqxWjiLNMbtBwxkwNZ
         LVbmVDBRBUTuTJw6DI97aOLQIOpOW1QrQCIGA6InKCpS8VOQyedhlpEUXhQa43wmmROh
         O8C7cOXomLb3x8qc+NoJuEGQqO1RseHciXKvumYx1P6DVHIuK/mXlNb9/jiA4hKPUOY8
         M9M4Rh/p6kVqvwvu+fclz1sfgdJQao27IMbOniuxPEp8DxjWBzhAUokby541l1dfpRfG
         JrjlJy9+XhCTF91ad9VqXLGACtZjeNBCy8d+9L6LGXdxpCBFttBYC6qnMbmPreVzr8+e
         zEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693961869; x=1694566669;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QylyR/V4a/iloEizCjqHR8j3LR/2OkmoSdq06y9bpgA=;
        b=QGYz42bD9vsElMgOp3pAX9GWDEE/er76wg1yQTsEFVnHvjnfsjgTiWskabOuOzfCNo
         4CU+C0pzboH640PoRLTIoex4DsugJMIWJQKvMKCf+qlOV6RLk6UTOpDnMTCCNI1OSPBM
         c/pb5inP4KDDwltMM4YbOvt/iz+X0x8UpBRhT3x5UKcgXQ6D3GY4O67Nuwk3pjBt0PD9
         0U73q+Pjb1VoUTd8JDqnYIA2fGlHdM6wIjB7iksa3xcG5vphI4xnBNhCpF3XIM+R9zeN
         SkP6mzDkeNn/KD65XbmOpOHjXR9k6Cc9C3CyT3jvp1w7M4BcuSQzbQgjfLN1euoEKJJi
         TcPA==
X-Gm-Message-State: AOJu0Yw0D5FZguMfuHvZlCHKNQ8CYf8ObGq5AxyshQPrNB3MYB74tPg7
	drxmiO+uQVDAcu/D20PqORj9oQ==
X-Google-Smtp-Source: AGHT+IF0I2dTAW5uJjtjWKvpHN+bNGE6Id1TKCrAoe/eUrakK2FLP0Esb3kXlLmIbMydGX9awrj92Q==
X-Received: by 2002:a17:902:c941:b0:1bb:32de:95c5 with SMTP id i1-20020a170902c94100b001bb32de95c5mr12833518pla.65.1693961869557;
        Tue, 05 Sep 2023 17:57:49 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id v6-20020a170902b7c600b001c0a4146961sm9899762plz.19.2023.09.05.17.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 17:57:49 -0700 (PDT)
Date: Tue, 05 Sep 2023 17:57:49 -0700 (PDT)
X-Google-Original-Date: Tue, 05 Sep 2023 17:57:36 PDT (-0700)
Subject:     Re: [linux-next:master 13230/13643] arch/riscv/errata/andes/errata.c:46:14: warning: result of comparison of constant 9223372036854811205 with expression of type 'unsigned long' is always true
In-Reply-To: <CA+V-a8v6P_BXKd+XzCToczNOV9g9jS=r3isisSAuh=xXfZ32UQ@mail.gmail.com>
CC: lkp@intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com, llvm@lists.linux.dev,
  oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: prabhakar.csengg@gmail.com, Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <mhng-809e676e-6b96-4bc5-9dd1-c6b31d53f179@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 05 Sep 2023 03:20:17 PDT (-0700), prabhakar.csengg@gmail.com wrote:
> On Fri, Sep 1, 2023 at 10:58 PM kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   a47fc304d2b678db1a5d760a7d644dac9b067752
>> commit: f2863f30d1b05e5ecf61c063609cb974954d47f8 [13230/13643] riscv: errata: Add Andes alternative ports
>> config: riscv-randconfig-r015-20230902 (https://download.01.org/0day-ci/archive/20230902/202309020548.rbrIJu6S-lkp@intel.com/config)
>> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020548.rbrIJu6S-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202309020548.rbrIJu6S-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>    arch/riscv/errata/andes/errata.c:29:16: error: variable has incomplete type 'struct sbiret'
>>       29 |         struct sbiret ret;
>>          |                       ^
>>    arch/riscv/errata/andes/errata.c:29:9: note: forward declaration of 'struct sbiret'
>>       29 |         struct sbiret ret;
>>          |                ^
>>    arch/riscv/errata/andes/errata.c:35:8: error: call to undeclared function 'sbi_ecall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>       35 |         ret = sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
>>          |               ^
>> >> arch/riscv/errata/andes/errata.c:46:14: warning: result of comparison of constant 9223372036854811205 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
>>       46 |         if (arch_id != ANDESTECH_AX45MP_MARCHID || impid != ANDESTECH_AX45MP_MIMPID)
>>          |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~
>>    1 warning and 2 errors generated.
>>
> After applying the below four patches we shouldn't be seeing this
> randconfig warnings:
>
> https://patchwork.kernel.org/project/linux-riscv/patch/20230901105111.311200-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> https://patchwork.kernel.org/project/linux-riscv/patch/20230901105858.311745-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> https://patchwork.kernel.org/project/linux-riscv/patch/20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> https://patchwork.kernel.org/project/linux-riscv/patch/20230901110936.313171-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Thanks, these are in the testing queue.  I'll pick them up for the merge 
window unless something goes off the rails.

+Geert, who acked the SOC one.

>
> Cheers,
> Prabhakar
>
>>
>> vim +46 arch/riscv/errata/andes/errata.c
>>
>>     40
>>     41  static bool errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigned long impid)
>>     42  {
>>     43          if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
>>     44                  return false;
>>     45
>>   > 46          if (arch_id != ANDESTECH_AX45MP_MARCHID || impid != ANDESTECH_AX45MP_MIMPID)
>>     47                  return false;
>>     48
>>     49          if (!ax45mp_iocp_sw_workaround())
>>     50                  return false;
>>     51
>>     52          /* Set this just to make core cbo code happy */
>>     53          riscv_cbom_block_size = 1;
>>     54          riscv_noncoherent_supported();
>>     55
>>     56          return true;
>>     57  }
>>     58
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
>>

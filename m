Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95C01FBA
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 12:47:41 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2eafabbc80aso199249617b3.11
        for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 05:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WkUiUdHoDpNAi0zdRE9ANpSiniGW0nNNuGE1NcaA95g=;
        b=ESuPCnnnlr6VtriNj4BzBV2T/VocahYSousMEGs+iWGmh7eEybeygvPHyFomnNHhST
         FaE+qPIql4kF7RDDZ/RP1ktjX5G0TlQj6ngxDUWwstqebpD4+bsg5vEWQilNOzu08wRd
         mw9Drq35zRYbhSOTCeDy4UbjYAkccDh1fx+sql/SZGlHGT+1NYVwbfOX2kQgHGYOXzY8
         WX6XuSzLMoHyIhZ+LN4vVMKceYpEBxUUlVCUtRpqnPheV49nesk4D0YrmbVNg1GPtE/W
         TthfwcNq0aHgLvRV6Um/6tKQpolErIoUkU6L5itpwbzhH2RvcA9CC5p3gCl5skONQwQU
         qZpw==
X-Gm-Message-State: AOAM531xiHWnXMd9s42zd902yEWUaY8nZeJGz/iEyjdnLypiBfBfgmM4
	SDgxO827tEaROfvx+rGzGCy04jzolrdfLOBuBoM=
X-Google-Smtp-Source: ABdhPJzqMRaCdna/2UYv9JsfsWjK4Bxln8AmtcV2uN/a+VAXsHvJMw4uCW2Lg3nDHyZCTmndPY/RhPSzoDb3lcuzUQ4=
X-Received: by 2002:a81:7c45:0:b0:2eb:4759:cc32 with SMTP id
 x66-20020a817c45000000b002eb4759cc32mr30158169ywc.515.1649767660662; Tue, 12
 Apr 2022 05:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <22622452.6Emhk5qWAg@kreacher> <202204121052.HOrN6tpw-lkp@intel.com>
In-Reply-To: <202204121052.HOrN6tpw-lkp@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 12 Apr 2022 14:47:29 +0200
Message-ID: <CAJZ5v0jMXBC63aPdt5FuMqC9sDN_avNbRaPyXjjyVkESMCxkXw@mail.gmail.com>
Subject: Re: [PATCH 14/20] ACPICA: executer/exsystem: Inform users about ACPI
 spec violation
To: kernel test robot <lkp@intel.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux ACPI <linux-acpi@vger.kernel.org>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, LKML <linux-kernel@vger.kernel.org>, 
	Bob Moore <robert.moore@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 12, 2022 at 4:54 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi "Rafael,
>
> Thank you for the patch! Yet something to improve:

This is addressed by one of the subsequent patches in the series.

> [auto build test ERROR on rafael-pm/linux-next]
> [also build test ERROR on linus/master linux/master v5.18-rc2 next-20220411]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Rafael-J-Wysocki/ACPICA-ACPICA-20220331/20220412-030922
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
> config: i386-randconfig-a006-20220411 (https://download.01.org/0day-ci/archive/20220412/202204121052.HOrN6tpw-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/5cdc6166cc35043a80f5f328d6e6b58190c4e46c
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Rafael-J-Wysocki/ACPICA-ACPICA-20220331/20220412-030922
>         git checkout 5cdc6166cc35043a80f5f328d6e6b58190c4e46c
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> Note: the linux-review/Rafael-J-Wysocki/ACPICA-ACPICA-20220331/20220412-030922 HEAD 32181ae3d3173aeee41f709612dfa4d52951b39d builds fine.
>       It only hurts bisectability.
>
> All errors (new ones prefixed by >>):
>
> >> drivers/acpi/acpica/exsystem.c:140:7: error: use of undeclared identifier 'how_long_US'; did you mean 'how_long_us'?
>                    if (how_long_US > 100) {
>                        ^~~~~~~~~~~
>                        how_long_us
>    drivers/acpi/acpica/exsystem.c:123:41: note: 'how_long_us' declared here
>    acpi_status acpi_ex_system_do_stall(u32 how_long_us)
>                                            ^
>    1 error generated.
>
>
> vim +140 drivers/acpi/acpica/exsystem.c
>
>    105
>    106  /*******************************************************************************
>    107   *
>    108   * FUNCTION:    acpi_ex_system_do_stall
>    109   *
>    110   * PARAMETERS:  how_long_us     - The amount of time to stall,
>    111   *                                in microseconds
>    112   *
>    113   * RETURN:      Status
>    114   *
>    115   * DESCRIPTION: Suspend running thread for specified amount of time.
>    116   *              Note: ACPI specification requires that Stall() does not
>    117   *              relinquish the processor, and delays longer than 100 usec
>    118   *              should use Sleep() instead. We allow stalls up to 255 usec
>    119   *              for compatibility with other interpreters and existing BIOSs.
>    120   *
>    121   ******************************************************************************/
>    122
>    123  acpi_status acpi_ex_system_do_stall(u32 how_long_us)
>    124  {
>    125          acpi_status status = AE_OK;
>    126
>    127          ACPI_FUNCTION_ENTRY();
>    128
>    129          if (how_long_us > 255) {
>    130                  /*
>    131                   * Longer than 255 microseconds, this is an error
>    132                   *
>    133                   * (ACPI specifies 100 usec as max, but this gives some slack in
>    134                   * order to support existing BIOSs)
>    135                   */
>    136                  ACPI_ERROR((AE_INFO,
>    137                              "Time parameter is too large (%u)", how_long_us));
>    138                  status = AE_AML_OPERAND_VALUE;
>    139          } else {
>  > 140                  if (how_long_US > 100) {
>    141                          ACPI_WARNING((AE_INFO,
>    142                                        "Time parameter %u us > 100 us violating ACPI spec, please fix the firmware.",
>    143                                        how_long_us));
>    144                  }
>    145                  acpi_os_stall(how_long_us);
>    146          }
>    147
>    148          return (status);
>    149  }
>    150
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp

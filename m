Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC03168
	for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 11:43:21 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id z10so31871848edc.11
        for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 03:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H75V4Gyv1omQl5DQYHu02p1pO9X8AXcURgokHKae96Q=;
        b=Sy9hcUWOjTIBSTNwcNQM0Lj2aE1rniLUGyjKZlGEoMV3Za3alcTZqc6FvgXwBeyQOl
         wWCuCY3MToEuDTqqKYU7ATjfR3GYEpIrIeKBEDVH134N2ATrl6ItKCIyZoJ0Ky8br0UF
         oF9/Jjm3useAUO/d+Mbg4kd/8L8blKgXeJpSkOBh85oJ8ssbR5FwCSUCt3kOedaz8yKu
         ts8OYd6QjRQFJfBYB4IR8LFwsjVJVkSOy/TLo+Mp5ZIkYNuDa/XR+6Ag1ZKcS2xXTPzR
         PrFyC7+YzSstJ3/22HjC+hYofwP5AXE+BCfdlLwMlqe9QpoxIvFPQ7em/4ASoqVcIrwu
         IRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H75V4Gyv1omQl5DQYHu02p1pO9X8AXcURgokHKae96Q=;
        b=Tkz8WfJCcpTV5ViVGsxWw6xmXQW2bFxkJWmD3DqVtcrskiLIiCMXT8p1X/M+DVSJHR
         P9DgSUx/vnpe/t7w3//6+ubxMLUxNrhIQMddmuHPHfk2ZYRaJ8eq2e6hRYKwjrVJ0jR7
         hTrUciANZc45x0mL6v2P4nN5Ug5aTC7W5PrkePc9gn7lG+JcCMz1Shiu3k6kF8gceWe5
         F/FHfPbIfiLPXkqQ3YegZk1fAEd8fMgCuYHy66W5xPMiMAkPv3f4GODs4vyGOrOFphTZ
         WfjBNtpX2KUi1w+0AltWaOe4hDnbAWrTHYcMX2meHjrcSA2FiQHiqGvGVh71gwjOa5xl
         FODg==
X-Gm-Message-State: AOAM533UmbLZ0ELz5VShcb3gY2QR3XoryMaiiHErnfC0BnAiMFs0fVns
	JaJJFZoNvGJZjJ7TyAGJXesClqPhAqy3utnhMlM=
X-Google-Smtp-Source: ABdhPJy4dgE/S9l1WUJ4J3a7culKJNXrO5gJ4iQLujCNBoag9GqC0h4sQ5SJnyciO596uRtZuDJJjwrBBX1paZWbUlY=
X-Received: by 2002:a50:fd16:: with SMTP id i22mr35107169eds.224.1636890199854;
 Sun, 14 Nov 2021 03:43:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202111141153.mtggZgGq-lkp@intel.com>
In-Reply-To: <202111141153.mtggZgGq-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 14 Nov 2021 13:42:43 +0200
Message-ID: <CAHp75VffPmtu-aer8rNA3ctoGTmvjTJYH44CRLsMVHSjcPc+qQ@mail.gmail.com>
Subject: Re: drivers/platform/x86/thinkpad_acpi.c:4475:35: error: unused
 variable 'fwbug_cards_ids'
To: kernel test robot <lkp@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 14, 2021 at 5:15 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c8c109546a19613d323a319d0c921cb1f317e629
> commit: fd96e35ea7b95f1e216277805be89d66e4ae962d platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
> date:   4 weeks ago
> config: i386-buildonly-randconfig-r005-20211114 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c3dddeeafb529e769cde87bd29ef6271ac6bfa5c)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fd96e35ea7b95f1e216277805be89d66e4ae962d
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout fd96e35ea7b95f1e216277805be89d66e4ae962d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=i386
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/platform/x86/thinkpad_acpi.c:4475:35: error: unused variable 'fwbug_cards_ids' [-Werror,-Wunused-const-variable]
>    static const struct pci_device_id fwbug_cards_ids[] __initconst = {
>                                      ^
>    1 error generated.

Perhaps something like

  if (!dmi_check_system(bt_fwbug_list))
    return 0;
  if (!pci_dev_present(fwbug_cards_ids))
    return 0;

  vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_RFKILL, FW_BUG "disable
bluetooth subdriver for Intel cards\n");
  return 1;

would work?

-- 
With Best Regards,
Andy Shevchenko

Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86409168
	for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 11:46:55 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id g14so58375926edz.2
        for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 03:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sqjrLJqfuU0a+gZZ8YaydbDDmti68TBnsVwUkrqgmYg=;
        b=Gij7OG2kcY5YglW3uPPI1XeifjGy2BRBSFJokHkRLu5vuQpooG4jc2+TUITNBDIhs1
         pPE+3WEj2ECM3PoMBICA/su7IFMpW66UfuxpnR2gnGVuOnAzKkRHcf1oqW9e4ZFuMmOY
         RG95G3eV55lJso6akeTVtozLs/GSgo1+FTi4+De69W6ZCoKGjbo/UiZVcW+ysb/cxlks
         GOK4fLwPEbL0gUa8rrJTcxene+WgAaVJSYEppSzIhIZvnWfX3f0NQhbnSz1/DVL0LKlN
         PoxM85530vJh4DQn9dMW/HDVz6vdmn1lgQFb42ilcW3JwB6dpadHCwEWFv9DV6fRMUcS
         Sb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sqjrLJqfuU0a+gZZ8YaydbDDmti68TBnsVwUkrqgmYg=;
        b=qay5M4WEG5KsnpkZkyxeptcl6Al63+B5pFqlWGa8RxtVWva/3Nui7UHyBGT6hRahzp
         SnvZkzXyOFr2o//xjT5EfU92eHs3Q+vOSJqcQh2QIbHgKVkCkatz4k864K3gOoD4f1k6
         SDTBiqTjkh8xFIw5ai7SfP+WdxTSDCqHkknHpKRGOVQY+B/vGYE8FQZvjpZcXdWntHWd
         BT1v+EckojllOb5FI19HeX+yYLoFd/OTi5kL5U+hbzNRV9HBFO60kG7O/wvJ06jbOXd7
         OiX6X0lR7PUGjtjhJeAAaun8a7G3rGZp6Uyo9s6MRFi+1i0xBNfG99Hoo2Cu8AXXB8oV
         b3jw==
X-Gm-Message-State: AOAM532IwD6VlwkR9pVxTvtxmpWdvHW5dPQJSvviQSy54YUCc0RWUqtc
	nO48ftzV3PBW+sp26kATSZ9mgpRKVwShL2ElJok=
X-Google-Smtp-Source: ABdhPJwfDOAOOqouRBOSti24JUaY3q3KRLAo7UbIHROHtGEbtldFfEZtit9UapyOx94H25owQd9FA4/E0gKjG/M2I0E=
X-Received: by 2002:a17:906:489b:: with SMTP id v27mr37461446ejq.567.1636890413740;
 Sun, 14 Nov 2021 03:46:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202111141153.mtggZgGq-lkp@intel.com> <CAHp75VffPmtu-aer8rNA3ctoGTmvjTJYH44CRLsMVHSjcPc+qQ@mail.gmail.com>
In-Reply-To: <CAHp75VffPmtu-aer8rNA3ctoGTmvjTJYH44CRLsMVHSjcPc+qQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 14 Nov 2021 13:46:17 +0200
Message-ID: <CAHp75VdL1gxMRS0naR33L9as0XGWhe-zW86sk3bQO_xWTSEfqg@mail.gmail.com>
Subject: Re: drivers/platform/x86/thinkpad_acpi.c:4475:35: error: unused
 variable 'fwbug_cards_ids'
To: kernel test robot <lkp@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 14, 2021 at 1:42 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Nov 14, 2021 at 5:15 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   c8c109546a19613d323a319d0c921cb1f317e629
> > commit: fd96e35ea7b95f1e216277805be89d66e4ae962d platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
> > date:   4 weeks ago
> > config: i386-buildonly-randconfig-r005-20211114 (attached as .config)
> > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c3dddeeafb529e769cde87bd29ef6271ac6bfa5c)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fd96e35ea7b95f1e216277805be89d66e4ae962d
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout fd96e35ea7b95f1e216277805be89d66e4ae962d
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=i386
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> drivers/platform/x86/thinkpad_acpi.c:4475:35: error: unused variable 'fwbug_cards_ids' [-Werror,-Wunused-const-variable]
> >    static const struct pci_device_id fwbug_cards_ids[] __initconst = {
> >                                      ^
> >    1 error generated.
>
> Perhaps something like
>
>   if (!dmi_check_system(bt_fwbug_list))
>     return 0;
>   if (!pci_dev_present(fwbug_cards_ids))
>     return 0;
>
>   vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_RFKILL, FW_BUG "disable
> bluetooth subdriver for Intel cards\n");
>   return 1;
>
> would work?

From the code perspective the complaint by the compiler is false
positive in a sense that it tries to aggressively optimize (which is
fine) followed by "oops, after above we found some unused stuff". I
think it may be hard to see for the compiler the difference between if
(0 && func(x)) and if (0).


-- 
With Best Regards,
Andy Shevchenko

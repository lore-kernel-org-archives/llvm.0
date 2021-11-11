Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF08B2C81
	for <llvm@lists.linux.dev>; Thu, 11 Nov 2021 07:33:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 758556128E
	for <llvm@lists.linux.dev>; Thu, 11 Nov 2021 07:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636616031;
	bh=QG6rxubhlm+xVWz1ucpUG/Vc4hQUbjbEez9Eq4wVz+c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rAJA748qder949q4fQEF1ASvgfTXaQsG4rSbAImH+iTBP7x/33YT0Z8z5p5pnPmP3
	 pZf4Ce+yogY/myzUWykDANvs/U5RkJrrg/gUijyyLOTzC27WDJULu4dKRSaZYic7JT
	 eVVHqg9JSw4z5CksrDPGtYCWCTh/91R3mpKCnGjUdbuImj1/0aStrwKd/TSC3NjAQG
	 dYnoqOHCK4lFqyIaOCG8GQOo2AwroMOhJ7SBT5OKR5LMJBbw5Vi809pzyC9C96Eed3
	 RshPkwrZgpQKcHIqSDtEK6to0DuFhb+BUQkgGlAMPVWSCFDxcaar0gGziHv/q8rSPD
	 k6rSfFnu5VwmQ==
Received: by mail-wm1-f48.google.com with SMTP id o29so4250359wms.2
        for <llvm@lists.linux.dev>; Wed, 10 Nov 2021 23:33:51 -0800 (PST)
X-Gm-Message-State: AOAM533zKYhiY584c6Gj9EGtsF7hxjI7Il76+AQlLvJY4Af1lGqZbQEu
	iHwft7YNKfNgZeQjR7bptI0RUCAGab9sTPqZxsc=
X-Google-Smtp-Source: ABdhPJxzGVNkezxnW3f6WHwFaHhv8pgqXtCVHYqsKbUj8e9LsPH9kOnfqlk8UGINyj9UOCnuo5tJa46lRLnvIl3LZVM=
X-Received: by 2002:a05:600c:2107:: with SMTP id u7mr23449078wml.82.1636616029983;
 Wed, 10 Nov 2021 23:33:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211104133735.1223989-1-arnd@kernel.org> <CAKwvOd=vrUe7xWohkPZkfui2BM-uP2Q79v02NzTJs9XJJ1CTjw@mail.gmail.com>
In-Reply-To: <CAKwvOd=vrUe7xWohkPZkfui2BM-uP2Q79v02NzTJs9XJJ1CTjw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 11 Nov 2021 08:33:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1eWa8p58qAHS8hBee0p_-WOxZrtuLQ3ncARpyzBnsWiw@mail.gmail.com>
Message-ID: <CAK8P3a1eWa8p58qAHS8hBee0p_-WOxZrtuLQ3ncARpyzBnsWiw@mail.gmail.com>
Subject: Re: [PATCH] iwlwifi: pcie: fix constant-conversion warning
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Luca Coelho <luciano.coelho@intel.com>, Kalle Valo <kvalo@codeaurora.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Johannes Berg <johannes.berg@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Yaara Baruch <yaara.baruch@intel.com>, 
	Matti Gottlieb <matti.gottlieb@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, 
	linux-wireless <linux-wireless@vger.kernel.org>, Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 10, 2021 at 10:38 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Nov 4, 2021 at 6:37 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > clang points out a potential issue with integer overflow when
> > the iwl_dev_info_table[] array is empty:
> >
> > drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1344:42: error: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551615 to -1 [-Werror,-Wconstant-conversion]
> >         for (i = ARRAY_SIZE(iwl_dev_info_table) - 1; i >= 0; i--) {
> >                ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
> >
> > This is still harmless, as the loop correctly terminates, but adding
> > an (int) cast makes that clearer to the compiler.
> >
> > Fixes: 3f7320428fa4 ("iwlwifi: pcie: simplify iwl_pci_find_dev_info()")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/net/wireless/intel/iwlwifi/pcie/drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/drv.c b/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
> > index c574f041f096..81e8f2fc4982 100644
> > --- a/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
> > +++ b/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
> > @@ -1341,7 +1341,7 @@ iwl_pci_find_dev_info(u16 device, u16 subsystem_device,
> >  {
> >         int i;
> >
> > -       for (i = ARRAY_SIZE(iwl_dev_info_table) - 1; i >= 0; i--) {
> > +       for (i = (int)ARRAY_SIZE(iwl_dev_info_table) - 1; i >= 0; i--) {
>
> Perhaps `i` could be a `size_t` instead of an `int`?
>
> size_t i = ARRAY_SIZE(iwl_dev_info_table);
> while (i--) {
>   ...

I imagine 'i' is idiomatically 'int' in inner iterations.

I've sent a different fix now.

        Arnd
